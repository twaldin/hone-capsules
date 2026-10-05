#!/usr/bin/env python3
"""Trusted evaluator for the hutter-enwik9 capsule (lexth11c, cmix-lex-transformer).

One evaluation scores ONE asset split (train or validation): every slice of the frozen
preprocessed enwik9 stream that the broker mounted under /capsule/assets/assets/<split>/.
It runs as two evaluator CONTAINERS (manifest evalPhases ["encode", "decode"]; the broker
sets HONE_EVAL_PHASE and bind-mounts one root-only handoff directory at /capsule/handoff):

encode container
1. Preflight and calibration. Without the two-container protocol, root, Landlock or a
   root-only handoff the result is invalid (isolation_ok false). hone/challenge.json must
   carry measured references for every slice of BOTH splits (baselineBytes, per-phase
   baselineInstructions and baselineCpuSec), split totals that agree with them, a calibrated
   cpuMargin < 1 and calibration provenance; anything missing or still a placeholder makes
   the result invalid (reference_ok false) before any work.
2. Build. The pristine protected tree (this directory) is copied twice into an exec tmpfs:
   once unchanged (the reference build) and once with the candidate's MUTABLE files
   overlaid (hone/challenge.json "mutable"). Protected files, the makefile and the compiler
   flags always come from here. Both builds run as the unprivileged worker uid with the
   exact lexth11c defines, without PGO. The builds finish, their processes are reaped and
   their trees deleted before any slice is staged, so a binary can never embed slice data.
3. Gates on the candidate: the added-line I/O/process/clock scan is advisory. A full clang
   AST walk over every protected-makefile translation unit, including instantiated templates,
   rejects non-allowlisted assembly, reciprocal-estimate references, target/optimize attributes
   and object/integer-to-function-pointer casts. System header definitions are trusted.
   GCC assembly must match a verified immutable baseline semantic hash; file-scope/MS asm
   always fails. Baseline local branches are verified inside their own assembled block.
   The ISA gate linearly disassembles executable sections: no RCP*/RSQRT* anywhere; EVEX/zmm/mask code
   only inside the two dispatched qmat *_avx512 objects, F/BW/VL/VNNI mnemonics, no VEX VNNI.
   No raw byte scan is enforced. Complete indirect-target boundary proof is unavailable for
   this stripped ELF; type-punning/undefined C++ control flow remains a documented risk.
4. Compress wave: `cmix -S` per slice (cold start: fresh predictor, dictionary pretraining,
   native ppmd + transformer + every model, mixers, SSE), one job per pinned core. The
   REFERENCE binary also compresses and then decodes one calibrated slice (the split's
   cheapest) in this container; its archive size must equal baselineBytes, its output must
   equal the slice, and each phase's instruction count must lie within instructionMargin of
   the calibrated phase mean, else the result is invalid (reference_ok false).
5. Handoff: the authenticated candidate binary, each candidate archive and the scorer
   metadata go to /capsule/handoff (root, 0700, beneath the 0700 /capsule). No other worker
   files or kernel state reach decode. Stdout is either a final EvaluatorOutput (a gate
   failed) or {"honeEvalContinue":"decode"}.

decode container (fresh: new IPC/network namespaces, new /tmp, no workspace mount)
6. Each candidate archive is decoded (`cmix -D`) in its own fresh directory that holds only
   that archive; the output must equal the slice byte for byte (compared by root against the
   0700 asset mount). The reference archive never enters this container.

Every slice job: own session, sched_setaffinity to one core, RLIMIT_AS/FSIZE, its own IPC and
network namespaces (unshared as root before the uid drop), then as the worker uid
no_new_privs, a Landlock ruleset (read: the staged inputs, /usr, /etc; write: only its own
run directory; execute: only its binary and /usr) and a seccomp filter (no SysV/POSIX IPC,
memfd, userfaultfd, ptrace, namespaces or mounts; no PR_TASK_PERF_EVENTS_DISABLE; no
executable anonymous or writable+executable mappings, no mprotect adding PROT_EXEC, no
aliasing mremap; no signals to other processes). Run directories live on a noexec tmpfs.
CPU = user+sys from wait4; instructions = user-mode retired instructions (perf_event_open,
inherited, enabled on exec).

Score. objectives.bytes_saved = sum(baseline_bytes - candidate_bytes - code_term) over the
split's slices, where code_term = 2 * (xz size of the stripped candidate binary - that of the
reference build) * slice_original_bytes / 1e9. perExample[slice].score = baseline_bytes /
(candidate_bytes + code_term): 1.0 for lexth11c, > 1 better. Hard gates (constraints): build,
source, ISA, every job exit 0, byte-exact round trip, every job counted (> 0 instructions)
and total instructions <= baseline * (1 + instructionMargin), total CPU <= baseline CPU *
(1 + cpuMargin), no stray processes. A gate that never ran is reported failed
(diagnostics.gates says "not_run"). Any failed gate => valid false, every perExample 0,
bytes_saved = -sum(baseline_bytes). Worker stdout/stderr never reach the output.
"""
from __future__ import annotations

import ctypes
import errno
import hashlib
import json
import math
import os
import re
import resource
import shutil
import shlex
import signal
import stat
import struct
import subprocess
import sys
import threading
import time
from pathlib import Path

TRUSTED = Path(__file__).resolve().parent
WORKSPACE = Path(os.environ.get("CAPSULE_WORKSPACE", "/workspace"))
ASSETS_ROOT = Path(os.environ.get("CAPSULE_ASSETS", "/capsule/assets")) / "assets"
CHALLENGE_BYTES = (TRUSTED / "hone" / "challenge.json").read_bytes()
CHALLENGE = json.loads(CHALLENGE_BYTES)
WORKER_UID = int(os.environ.get("CAPSULE_WORKER_UID", "2000"))
WORKER_GID = int(os.environ.get("CAPSULE_WORKER_GID", str(WORKER_UID)))
PHASE = os.environ.get("HONE_EVAL_PHASE", "")
# Exec-capable scratch for builds, binaries and inputs (root-owned once the builds are gone).
# The broker's /tmp is noexec. hone-evaluator-cgroup permits exactly this tmpfs (source
# hone-fresh-scratch, flags rw,nosuid,nodev) at /tmp/hone-home/.
HOME_ROOT = Path("/tmp/hone-home")
# Job run directories: hone-fresh-scratch at /var/tmp/ with noexec (also permitted by the
# profile), so nothing a worker writes can be executed or mapped executable.
RUNS_ROOT = Path("/var/tmp")
RUNS_BYTES = "1g"
# Root-only handoff between the encode and decode containers (bind mount under the 0700
# /capsule tmpfs; read-write in encode, read-only in decode).
HANDOFF = Path("/capsule/handoff")
STATE_VERSION = 1
CONTINUE_MARKER = {"honeEvalContinue": "decode"}
SPLITS = ("train", "validation")
PHASES = ("compress", "decompress")
HEADER_BYTES = 37
GATES = ("isolation_ok", "reference_ok", "build_ok", "source_ok", "isa_ok", "jobs_ok", "roundtrip_ok",
         "instructions_within_budget", "cpu_within_budget", "no_stray_processes")
EVAL_SHA256 = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
CHALLENGE_SHA256 = hashlib.sha256(CHALLENGE_BYTES).hexdigest()


class GateFailure(Exception):
    def __init__(self, constraint: str, message: str):
        super().__init__(message)
        self.constraint = constraint


def log(msg: str) -> None:
    sys.stderr.write(f"[eval {PHASE or '-'} {time.strftime('%H:%M:%S')}] {msg}\n")
    sys.stderr.flush()


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


# --------------------------------------------------------------------------- calibration
def _number(value, integer: bool = False) -> bool:
    if isinstance(value, bool) or not isinstance(value, (int, float)):
        return False
    if integer and not isinstance(value, int):
        return False
    return math.isfinite(value) and value > 0


def _close(a: float, b: float, rel: float = 1e-9) -> bool:
    return abs(a - b) <= rel * max(abs(a), abs(b), 1e-12)


def provenance_problems() -> list[str]:
    """The split references and cpuMargin must be exactly what the recorded repeats imply
    (tools/calibrate.py): means of the per-repeat split totals, and cpuMargin =
    max(0.005, 1.5 * max measured CPU spread over mean across splits)."""
    cal = CHALLENGE.get("calibration")
    if not isinstance(cal, dict):
        return ["calibration provenance is missing"]
    problems = []
    if cal.get("cpuMarginSafetyFactor") != 1.5:
        problems.append("calibration.cpuMarginSafetyFactor must be the protected 1.5 noise factor")
    if cal.get("cpuMarginRule") != "max(0.005, 1.5 * max CPU spread over mean across splits)":
        problems.append("calibration.cpuMarginRule does not match the protected noise policy")
    repeats, records = cal.get("repeats"), cal.get("records")
    if not _number(repeats, True) or repeats < 2:
        return problems + [f"calibration.repeats {repeats!r} must be >= 2"]
    if (not isinstance(records, list) or len(records) != repeats * len(SPLITS)
            or not all(isinstance(r, dict) and re.fullmatch(r"[0-9a-f]{64}", str(r.get("sha256"))) for r in records)):
        problems.append("calibration.records must hold one sha256 receipt per repeat and split")
    measured, spreads = cal.get("splitMeasurements"), cal.get("cpuSpreadOverMean")
    if not isinstance(measured, dict) or not isinstance(spreads, dict):
        return problems + ["calibration.splitMeasurements / cpuSpreadOverMean are missing"]
    margins = []
    for split in SPLITS:
        samples = measured.get(split)
        if (not isinstance(samples, list) or len(samples) != repeats
                or not all(isinstance(s, dict) and _number(s.get("cpuSec")) and _number(s.get("instructions"), True)
                           for s in samples)):
            problems.append(f"calibration.splitMeasurements.{split} must hold {repeats} measured repeats")
            continue
        cpu = [s["cpuSec"] for s in samples]
        cpu_mean = sum(cpu) / len(cpu)
        instructions_mean = sum(s["instructions"] for s in samples) / len(samples)
        spread = (max(cpu) - min(cpu)) / cpu_mean
        margins.append(spread)
        cpu_ref = (CHALLENGE.get("baselineCpuSec") or {}).get(split)
        ins_ref = (CHALLENGE.get("baselineInstructions") or {}).get(split)
        if not _number(cpu_ref) or not _close(cpu_ref, cpu_mean):
            problems.append(f"baselineCpuSec.{split} {cpu_ref!r} is not the mean of its repeats ({cpu_mean!r})")
        if not _number(ins_ref, True) or abs(ins_ref - instructions_mean) > 1:
            problems.append(f"baselineInstructions.{split} {ins_ref!r} is not the mean of its repeats")
        recorded = spreads.get(split)
        if not isinstance(recorded, (int, float)) or isinstance(recorded, bool) or not _close(recorded, spread):
            problems.append(f"calibration.cpuSpreadOverMean.{split} {recorded!r} != measured spread {spread!r}")
    if len(margins) == len(SPLITS):
        expected = max(0.005, 1.5 * max(margins))
        cpu_margin = CHALLENGE.get("cpuMargin")
        if not isinstance(cpu_margin, (int, float)) or not _close(cpu_margin, expected, 1e-12):
            problems.append(f"cpuMargin {cpu_margin!r} != max(0.005, 1.5 * measured max CPU spread) = {expected!r}")
    return problems


def calibration_problems() -> list[str]:
    """Every reference the gates compare against -- all slices of both splits -- must be a
    measurement, never a placeholder, the split totals must agree with the per-slice phases, and
    the split totals and cpuMargin must be the ones the recorded repeats imply."""
    problems = []
    margin, cpu_margin = CHALLENGE.get("instructionMargin"), CHALLENGE.get("cpuMargin")
    if not _number(margin) or margin > 0.005:
        problems.append(f"instructionMargin {margin!r} must be in (0, 0.005]")
    if not _number(cpu_margin) or cpu_margin >= 1.0:
        problems.append(f"cpuMargin {cpu_margin!r} must be a measured noise margin in (0, 1)")
    problems += provenance_problems()
    slices = CHALLENGE.get("slices")
    if not isinstance(slices, dict) or not slices:
        return problems + ["slices are missing"]
    for split in SPLITS:
        totals = {"baselineInstructions": 0, "baselineCpuSec": 0.0}
        names = sorted(n for n, s in slices.items() if isinstance(s, dict) and s.get("split") == split)
        if not names:
            problems.append(f"{split}: no slices")
        for name in names:
            spec = slices[name]
            if not _number(spec.get("baselineBytes"), True) or spec["baselineBytes"] <= HEADER_BYTES:
                problems.append(f"{name}: baselineBytes {spec.get('baselineBytes')!r} is not a measured archive size")
            for key in totals:
                phases = spec.get(key)
                if not isinstance(phases, dict) or set(phases) != set(PHASES):
                    problems.append(f"{name}: {key} must hold exactly {list(PHASES)}")
                    continue
                for phase in PHASES:
                    if not _number(phases[phase], key == "baselineInstructions"):
                        problems.append(f"{name}: {key}.{phase} {phases[phase]!r} is not a measurement")
                    else:
                        totals[key] += phases[phase]
        for key, total in totals.items():
            table = CHALLENGE.get(key)
            value = table.get(split) if isinstance(table, dict) else None
            if not _number(value, key == "baselineInstructions"):
                problems.append(f"{key}.{split} {value!r} is not a measurement")
            elif total <= 0 or abs(value - total) > 1e-6 * total:
                problems.append(f"{key}.{split} {value!r} disagrees with the per-slice phase sum {total!r}")
    return problems


def reference_slice(names: list[str]) -> str:
    """The split's cheapest calibrated slice carries the per-evaluation reference sanity check."""
    return min(names, key=lambda n: (sum(CHALLENGE["slices"][n]["baselineCpuSec"].values()), n))


# --------------------------------------------------------------------------- scratch
def mount_tmpfs(target: Path, options: str) -> None:
    done = subprocess.run(["mount", "-t", "tmpfs", "-o", options, "hone-fresh-scratch", str(target)],
                          stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL,
                          stderr=subprocess.PIPE, timeout=30, check=False)
    if done.returncode != 0:
        raise RuntimeError(f"scratch mount at {target} failed: " + done.stderr.decode("utf-8", "replace"))


def mount_scratch() -> list[Path]:
    HOME_ROOT.mkdir(mode=0o755, exist_ok=True)
    mount_tmpfs(HOME_ROOT, f"rw,nosuid,nodev,size={CHALLENGE['scratchBytes']},mode=0755")
    mounted = [HOME_ROOT]
    try:
        mount_tmpfs(RUNS_ROOT, f"rw,nosuid,nodev,noexec,size={RUNS_BYTES},mode=0755")
    except BaseException:
        unmount_scratch(mounted)
        raise
    return mounted + [RUNS_ROOT]


def unmount_scratch(mounted: list[Path]) -> None:
    for path in reversed(mounted):
        subprocess.run(["umount", "-l", str(path)], stdin=subprocess.DEVNULL,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=30, check=False)


def open_tree(root: Path) -> None:
    """Lets the worker uid write into a root-owned tree (the scorer has FOWNER, not CHOWN)."""
    for dirpath, dirnames, filenames in os.walk(root):
        os.chmod(dirpath, 0o777)


# --------------------------------------------------------------------------- worker processes
def worker_pids() -> list[int]:
    pids = []
    for entry in Path("/proc").iterdir():
        if not entry.name.isdigit() or int(entry.name) == os.getpid():
            continue
        try:
            for line in (entry / "status").read_text().splitlines():
                if line.startswith("Uid:"):
                    if int(line.split()[1]) == WORKER_UID:
                        pids.append(int(entry.name))
                    break
        except (OSError, ValueError):
            continue
    return pids


def reap_workers() -> int:
    """Kills every worker-uid process; returns how many were found."""
    found = worker_pids()
    for _ in range(50):
        pids = worker_pids()
        if not pids:
            break
        for pid in pids:
            try:
                os.kill(pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
        time.sleep(0.1)
    return len(found)


def writable_mounts() -> list[Path]:
    roots = []
    for line in Path("/proc/self/mounts").read_text().splitlines():
        fields = line.split()
        if len(fields) < 4 or "ro" in fields[3].split(","):
            continue
        if fields[2] in ("proc", "sysfs", "cgroup", "cgroup2", "devpts", "securityfs", "debugfs", "tracefs"):
            continue
        roots.append(Path(fields[1].replace("\\040", " ")))
    return roots


def purge_worker_files() -> None:
    """Removes everything the worker uid owns on every writable mount of this container."""
    for root in writable_mounts():
        try:
            dev = os.lstat(root).st_dev
        except OSError:
            continue
        for dirpath, dirnames, filenames in os.walk(root, topdown=True):
            keep = []
            for name in dirnames:
                path = os.path.join(dirpath, name)
                try:
                    st = os.lstat(path)
                except OSError:
                    continue
                if st.st_dev != dev:
                    continue  # another mount: swept from its own root
                if st.st_uid == WORKER_UID:
                    shutil.rmtree(path, ignore_errors=True)
                else:
                    keep.append(name)
            dirnames[:] = keep
            for name in filenames:
                path = os.path.join(dirpath, name)
                try:
                    if os.lstat(path).st_uid == WORKER_UID:
                        os.unlink(path)
                except OSError:
                    pass


# --------------------------------------------------------------------------- confinement
_LIBC = ctypes.CDLL(None, use_errno=True)
_LIBC.syscall.restype = ctypes.c_long
CLONE_NEWIPC = 0x08000000
CLONE_NEWNET = 0x40000000
NAMESPACE_FLAGS = 0x7E020000  # NEWNS | NEWCGROUP | NEWUTS | NEWIPC | NEWUSER | NEWPID | NEWNET
PR_SET_NO_NEW_PRIVS = 38
PR_TASK_PERF_EVENTS_DISABLE = 31
SYS_SECCOMP = 317
SYS_LANDLOCK_CREATE_RULESET, SYS_LANDLOCK_ADD_RULE, SYS_LANDLOCK_RESTRICT_SELF = 444, 445, 446
LL_EXECUTE, LL_WRITE_FILE, LL_READ_FILE, LL_READ_DIR = 1 << 0, 1 << 1, 1 << 2, 1 << 3
LL_REMOVE_FILE, LL_MAKE_REG, LL_REFER, LL_TRUNCATE, LL_IOCTL_DEV = 1 << 5, 1 << 8, 1 << 13, 1 << 14, 1 << 15
LL_FILE_RIGHTS = LL_EXECUTE | LL_WRITE_FILE | LL_READ_FILE | LL_TRUNCATE | LL_IOCTL_DEV
LANDLOCK_ABI = 0


def landlock_abi() -> int:
    abi = _LIBC.syscall(SYS_LANDLOCK_CREATE_RULESET, None, ctypes.c_size_t(0), ctypes.c_uint32(1))
    return int(abi) if abi > 0 else 0


def landlock_handled(abi: int) -> int:
    handled = (1 << 13) - 1  # ABI 1: execute .. make_sym
    if abi >= 2:
        handled |= LL_REFER
    if abi >= 3:
        handled |= LL_TRUNCATE
    if abi >= 5:
        handled |= LL_IOCTL_DEV
    return handled


def apply_landlock(rules: list[tuple[str, int]]) -> None:
    handled = landlock_handled(LANDLOCK_ABI)
    attr = ctypes.create_string_buffer(struct.pack("<Q", handled), 8)
    ruleset = _LIBC.syscall(SYS_LANDLOCK_CREATE_RULESET, attr, ctypes.c_size_t(8), ctypes.c_uint32(0))
    if ruleset < 0:
        raise OSError(ctypes.get_errno(), "landlock_create_ruleset")
    for path, rights in rules:
        fd = os.open(path, os.O_PATH | os.O_CLOEXEC)
        try:
            if not stat.S_ISDIR(os.fstat(fd).st_mode):
                rights &= LL_FILE_RIGHTS
            rule = ctypes.create_string_buffer(struct.pack("<Qi", rights & handled, fd), 12)
            if _LIBC.syscall(SYS_LANDLOCK_ADD_RULE, ctypes.c_int(ruleset), ctypes.c_int(1), rule, ctypes.c_uint32(0)) != 0:
                raise OSError(ctypes.get_errno(), f"landlock_add_rule {path}")
        finally:
            os.close(fd)
    if _LIBC.syscall(SYS_LANDLOCK_RESTRICT_SELF, ctypes.c_int(ruleset), ctypes.c_uint32(0)) != 0:
        raise OSError(ctypes.get_errno(), "landlock_restrict_self")
    os.close(ruleset)


# seccomp-bpf (x86_64). Arguments are compared on their low 32 bits: every tested argument is a
# C int / unsigned int / flag word whose meaningful bits live there.
_AUDIT_ARCH_X86_64 = 0xC000003E
_RET_ALLOW, _RET_KILL_PROCESS, _RET_ERRNO = 0x7FFF0000, 0x80000000, 0x00050000
_LD_ABS, _JEQ, _JGE, _JSET, _RET = 0x20, 0x15, 0x35, 0x45, 0x06
PROT_WRITE, PROT_EXEC, MAP_ANONYMOUS = 0x2, 0x4, 0x20
DENIED_SYSCALLS = (
    29, 30, 31, 67,                 # shmget shmat shmctl shmdt
    64, 65, 66, 220,                # semget semop semctl semtimedop
    68, 69, 70, 71,                 # msgget msgsnd msgrcv msgctl
    240, 241, 242, 243, 244, 245,   # mq_open mq_unlink mq_timedsend mq_timedreceive mq_notify mq_getsetattr
    319, 447, 323,                  # memfd_create memfd_secret userfaultfd
    101, 310, 311,                  # ptrace process_vm_readv process_vm_writev
    272, 308, 165, 166, 155, 161,   # unshare setns mount umount2 pivot_root chroot
    428, 429, 430, 431, 432, 433, 442,  # open_tree move_mount fsopen fsconfig fsmount fspick mount_setattr
    424, 434, 438, 200,             # pidfd_send_signal pidfd_open pidfd_getfd tkill
    425,                            # io_uring_setup
)


def seccomp_rules(pid: int) -> list[tuple[int, list[tuple[int, list[tuple[str, int, int]]]], int]]:
    """(syscall, [(action, [tests ANDed])...], fallback action)."""
    deny = _RET_ERRNO | errno.EPERM
    me, group = pid & 0xFFFFFFFF, (-pid) & 0xFFFFFFFF
    only_me = [(_RET_ALLOW, [("eq", 0, me)])]
    rules = [(nr, [], deny) for nr in DENIED_SYSCALLS]
    rules += [
        (435, [], _RET_ERRNO | errno.ENOSYS),                                     # clone3 -> libc falls back to clone
        (56, [(deny, [("set", 0, NAMESPACE_FLAGS)])], _RET_ALLOW),                # clone into new namespaces
        (157, [(deny, [("eq", 0, PR_TASK_PERF_EVENTS_DISABLE)])], _RET_ALLOW),    # prctl
        (9, [(deny, [("set", 2, PROT_EXEC), ("set", 2, PROT_WRITE)]),             # mmap W+X
             (deny, [("set", 2, PROT_EXEC), ("set", 3, MAP_ANONYMOUS)])], _RET_ALLOW),  # anonymous X
        (10, [(deny, [("set", 2, PROT_EXEC)])], _RET_ALLOW),                      # mprotect +X
        (329, [(deny, [("set", 2, PROT_EXEC)])], _RET_ALLOW),                     # pkey_mprotect +X
        (25, [(deny, [("eq", 1, 0), ("hi", 1, 0)])], _RET_ALLOW),                 # mremap aliasing (old_size 0)
        (135, [(_RET_ALLOW, [("eq", 0, 0xFFFFFFFF)])], deny),                     # personality: query only
        (62, [(_RET_ALLOW, [("eq", 0, me)]), (_RET_ALLOW, [("eq", 0, 0)]),        # kill: own process/group
              (_RET_ALLOW, [("eq", 0, group)])], deny),
        (234, only_me, deny), (129, only_me, deny), (297, only_me, deny),         # tgkill rt_(tg)sigqueueinfo
        (72, [(deny, [("eq", 1, 8)]), (deny, [("eq", 1, 15)]),                    # fcntl F_SETOWN(_EX)
              (deny, [("eq", 1, 10)])], _RET_ALLOW),                              # fcntl F_SETSIG
        (16, [(deny, [("eq", 1, 0x8901)]), (deny, [("eq", 1, 0x8902)])], _RET_ALLOW),  # FIOSETOWN SIOCSPGRP
    ]
    return rules


def seccomp_program(pid: int) -> bytes:
    prog: list[list] = [[_LD_ABS, 0, 0, 4], [_JEQ, 1, 0, _AUDIT_ARCH_X86_64], [_RET, 0, 0, _RET_KILL_PROCESS],
                        [_LD_ABS, 0, 0, 0], [_JGE, 0, 1, 0x40000000], [_RET, 0, 0, _RET_ERRNO | errno.EPERM]]
    labels: dict[str, int] = {}
    rules = seccomp_rules(pid)
    for index, (nr, clauses, fallback) in enumerate(rules):
        prog += [[_LD_ABS, 0, 0, 0], [_JEQ, 0, f"r{index + 1}", nr]]
        for c, (action, tests) in enumerate(clauses):
            nxt = f"r{index}c{c + 1}"
            for kind, arg, value in tests:
                offset = 16 + 8 * arg + (4 if kind == "hi" else 0)
                prog += [[_LD_ABS, 0, 0, offset], [_JSET if kind == "set" else _JEQ, 0, nxt, value]]
            prog.append([_RET, 0, 0, action])
            labels[nxt] = len(prog)
        prog.append([_RET, 0, 0, fallback])
        labels[f"r{index + 1}"] = len(prog)
    prog.append([_RET, 0, 0, _RET_ALLOW])
    out = bytearray()
    for i, (code, jt, jf, k) in enumerate(prog):
        jt = labels[jt] - i - 1 if isinstance(jt, str) else jt
        jf = labels[jf] - i - 1 if isinstance(jf, str) else jf
        if not (0 <= jt <= 255 and 0 <= jf <= 255):
            raise RuntimeError("seccomp jump out of range")
        out += struct.pack("<HBBI", code, jt, jf, k)
    return bytes(out)


class _SockFprog(ctypes.Structure):
    _fields_ = [("len", ctypes.c_ushort), ("filter", ctypes.c_void_p)]


def apply_seccomp(pid: int) -> None:
    program = seccomp_program(pid)
    buf = ctypes.create_string_buffer(program, len(program))
    fprog = _SockFprog(len(program) // 8, ctypes.cast(buf, ctypes.c_void_p))
    if _LIBC.syscall(SYS_SECCOMP, ctypes.c_uint(1), ctypes.c_uint(0), ctypes.byref(fprog)) != 0:
        raise OSError(ctypes.get_errno(), "seccomp")


class Confinement:
    """What one slice job may touch once it is the worker uid."""

    def __init__(self, run_dir: Path, binary: Path, inputs: Path):
        self.rules = [
            (str(run_dir), LL_READ_FILE | LL_READ_DIR | LL_WRITE_FILE | LL_MAKE_REG | LL_REMOVE_FILE | LL_TRUNCATE),
            (str(inputs), LL_READ_FILE | LL_READ_DIR),
            (str(binary), LL_EXECUTE | LL_READ_FILE),
            ("/usr", LL_EXECUTE | LL_READ_FILE | LL_READ_DIR),
            ("/etc", LL_READ_FILE | LL_READ_DIR),
            ("/dev/null", LL_READ_FILE | LL_WRITE_FILE),
            ("/dev/urandom", LL_READ_FILE),
        ]

    def apply(self) -> None:
        if _LIBC.prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) != 0:
            raise OSError(ctypes.get_errno(), "PR_SET_NO_NEW_PRIVS")
        apply_landlock(self.rules)
        apply_seccomp(os.getpid())


def make_preexec(cpus: set[int] | None, address_space: int | None, fsize: int, confine: Confinement | None = None):
    def pre() -> None:
        os.setsid()
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
        resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
        if address_space is not None:
            resource.setrlimit(resource.RLIMIT_AS, (address_space, address_space))
        if cpus:
            os.sched_setaffinity(0, cpus)
        os.umask(0o022)
        # Fresh SysV/POSIX-mqueue and network (abstract sockets, loopback) namespaces per job,
        # created while still root; the uid drop then removes the capability to make more.
        if _LIBC.unshare(CLONE_NEWIPC | CLONE_NEWNET) != 0:
            raise OSError(ctypes.get_errno(), "unshare")
        os.setgroups([])
        os.setgid(WORKER_GID)
        os.setuid(WORKER_UID)
        if confine is not None:
            confine.apply()
    return pre


# perf_event_open(2): user-mode retired instructions of the job and every thread/child it creates,
# counting from its execve. Deterministic to well under 0.01 % for a fixed binary and input, so it
# carries the strict "no extra CPU" gate; CPU seconds (noisy under shared-host load) carry a
# looser, measured-noise gate.
_SYS_PERF_EVENT_OPEN = 298
_PERF_FLAGS = 1 | 2 | 32 | 64 | 4096  # disabled, inherit, exclude_kernel, exclude_hv, enable_on_exec


def open_instruction_counter(pid: int) -> int:
    attr = ctypes.create_string_buffer(struct.pack("IIQQQQQ", 0, 128, 1, 0, 0, 0, _PERF_FLAGS) + bytes(80), 128)
    fd = _LIBC.syscall(_SYS_PERF_EVENT_OPEN, attr, pid, -1, -1, 8)
    if fd < 0:
        raise RuntimeError(f"perf_event_open failed: errno {ctypes.get_errno()}")
    return fd


class Job:
    def __init__(self, name: str, argv: list[str], cwd: Path, confine: Confinement, timeout: float):
        self.name, self.argv, self.cwd, self.confine, self.timeout = name, argv, cwd, confine, timeout
        self.cpu: int | None = None
        self.status: int | None = None
        self.cpu_sec = 0.0
        self.instructions = 0
        self.maxrss_kb = 0
        self.wall_sec = 0.0
        self.timed_out = False
        self.error: str | None = None

    def ok(self) -> bool:
        return self.error is None and self.status == 0 and not self.timed_out

    def record(self) -> dict:
        return {"job": self.name, "cpu": self.cpu, "status": self.status, "timed_out": self.timed_out,
                "cpu_sec": round(self.cpu_sec, 2), "instructions": self.instructions,
                "wall_sec": round(self.wall_sec, 2), "maxrss_kb": self.maxrss_kb}

    def run(self) -> None:
        env = {"PATH": "/usr/bin:/bin", "HOME": str(self.cwd), "LC_ALL": "C"}
        pre = make_preexec({self.cpu} if self.cpu is not None else None,
                           CHALLENGE["addressSpaceLimitBytes"], CHALLENGE["fileSizeLimitBytes"], self.confine)
        out = os.open(self.cwd / "stdout.txt", os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o644)
        err = os.open(self.cwd / "stderr.txt", os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o644)
        null = os.open("/dev/null", os.O_RDONLY)
        gate_r, gate_w = os.pipe()
        start = time.monotonic()
        pid = os.fork()
        if pid == 0:  # child: wait until the counter is attached, then become the job
            try:
                os.close(gate_w)
                if os.read(gate_r, 1) == b"g":
                    os.dup2(null, 0)
                    os.dup2(out, 1)
                    os.dup2(err, 2)
                    os.chdir(self.cwd)
                    pre()
                    os.closerange(3, 65536)
                    os.execve(self.argv[0], self.argv, env)
            finally:
                os._exit(127)
        for fd in (gate_r, out, err, null):
            os.close(fd)
        try:
            counter = open_instruction_counter(pid)
        except RuntimeError as exc:
            os.close(gate_w)  # EOF: the child exits without running the job
            os.waitpid(pid, 0)
            self.error = str(exc)
            return
        os.write(gate_w, b"g")
        os.close(gate_w)
        timer = threading.Timer(self.timeout, self._kill, args=(pid,))
        timer.start()
        try:
            _, status, usage = os.wait4(pid, 0)
        finally:
            timer.cancel()
        self.instructions = struct.unpack("Q", os.read(counter, 8))[0]
        os.close(counter)
        self.status = os.waitstatus_to_exitcode(status)
        self.cpu_sec = usage.ru_utime + usage.ru_stime
        self.maxrss_kb = usage.ru_maxrss
        self.wall_sec = time.monotonic() - start

    def _kill(self, pid: int) -> None:
        self.timed_out = True
        try:
            os.killpg(pid, signal.SIGKILL)
        except ProcessLookupError:
            pass


def run_wave(jobs: list[Job], cpus: list[int], followup=None) -> None:
    """Runs jobs with at most one job per bench core; followup(job) may return a dependent job."""
    pending = list(jobs)
    free = list(cpus)
    running = 0
    lock = threading.Condition()
    threads = []

    def runner(job: Job) -> None:
        nonlocal running
        nxt = None
        try:
            job.run()
        except Exception as exc:  # noqa: BLE001 - recorded on the job, judged by the caller
            job.error = f"{type(exc).__name__}: {exc}"
        try:
            nxt = followup(job) if followup is not None else None
        except Exception as exc:  # noqa: BLE001
            job.error = f"followup {type(exc).__name__}: {exc}"
        with lock:
            if nxt is not None:
                pending.insert(0, nxt)
            free.append(job.cpu)
            running -= 1
            lock.notify_all()

    with lock:
        while pending or running:
            while pending and free:
                job = pending.pop(0)
                job.cpu = free.pop(0)
                running += 1
                thread = threading.Thread(target=runner, args=(job,))
                thread.start()
                threads.append(thread)
            lock.wait()
    for thread in threads:
        thread.join()


def bench_cpus() -> list[int]:
    allowed = sorted(os.sched_getaffinity(0))
    preferred = [c for c in CHALLENGE["benchCpus"] if c in allowed]
    if len(preferred) == len(CHALLENGE["benchCpus"]):
        return preferred
    return allowed[: len(CHALLENGE["benchCpus"])]


# --------------------------------------------------------------------------- build
def copy_tree(dst: Path) -> None:
    def ignore(directory: str, names: list[str]) -> set[str]:
        return {n for n in names if n in (".gitdir", ".git")}
    shutil.copytree(TRUSTED, dst, symlinks=False, ignore=ignore)


def overlay_candidate(dst: Path) -> list[str]:
    """Copies the candidate's mutable files over dst; returns the changed relative paths."""
    changed = []
    for pattern in CHALLENGE["mutable"]:
        base = pattern[:-3] if pattern.endswith("/**") else pattern
        src_root = WORKSPACE / base
        if pattern.endswith("/**"):
            if not src_root.exists():
                continue
            if src_root.is_symlink() or not src_root.is_dir():
                raise GateFailure("build_ok", f"mutable directory {base} is not a plain directory")
            # Files the candidate deleted from a mutable directory are deleted here too.
            dst_root = dst / base
            for dirpath, dirnames, filenames in os.walk(dst_root):
                for name in filenames:
                    rel = os.path.relpath(os.path.join(dirpath, name), dst)
                    if not (WORKSPACE / rel).exists():
                        os.unlink(os.path.join(dirpath, name))
                        changed.append(rel)
            for dirpath, dirnames, filenames in os.walk(src_root):
                for name in dirnames + filenames:
                    path = Path(dirpath) / name
                    if path.is_symlink():
                        raise GateFailure("build_ok", f"symlink in mutable tree: {path.relative_to(WORKSPACE)}")
                for name in filenames:
                    path = Path(dirpath) / name
                    if not path.is_file():
                        raise GateFailure("build_ok", f"non-regular file: {path.relative_to(WORKSPACE)}")
                    rel = str(path.relative_to(WORKSPACE))
                    target = dst / rel
                    data = path.read_bytes()
                    if not target.exists() or target.read_bytes() != data:
                        target.parent.mkdir(parents=True, exist_ok=True)
                        target.write_bytes(data)
                        changed.append(rel)
        else:
            if not src_root.exists():
                raise GateFailure("build_ok", f"mutable file {base} was deleted")
            if src_root.is_symlink() or not src_root.is_file():
                raise GateFailure("build_ok", f"mutable path {base} is not a regular file")
            data = src_root.read_bytes()
            if (dst / base).read_bytes() != data:
                (dst / base).write_bytes(data)
                changed.append(base)
    return sorted(set(changed))


FORBIDDEN_SOURCE = [
    (re.compile(r"\b(fopen|freopen|fdopen|popen|open|openat|creat|system|fork|vfork|clone|execv|execve|"
                r"execvp|execl|execlp|execle|posix_spawn|mmap|syscall|dlopen|getenv|secure_getenv|socket|"
                r"pthread_create|sched_setaffinity|ptrace|setrlimit|prctl|signal|sigaction|readlink|"
                r"opendir|getrusage|clock_gettime|gettimeofday|time|clock|rdtsc|__rdtsc)\s*\("), "I/O, process, time or environment call"),
    (re.compile(r"\bstd::(thread|jthread|async|ifstream|ofstream|fstream|filesystem|getenv|system|chrono)\b"), "std I/O, thread or clock"),
    (re.compile(r"_mm\d*_(mask_|maskz_)?(rcp|rsqrt)\w*"), "reciprocal/rsqrt estimate intrinsic"),
    (re.compile(r"__builtin_ia32_(rcp|rsqrt)\w*"), "reciprocal/rsqrt estimate builtin"),
    (re.compile(r"#\s*(include|embed)\s*[<\"](fstream|thread|future|unistd\.h|fcntl\.h|sys/|dlfcn\.h|pthread\.h|"
                r"filesystem|chrono|ctime|time\.h|spawn\.h|signal\.h|csignal|/|\.\./)"), "forbidden include"),
    (re.compile(r"#\s*embed\b|\.incbin\b"), "embedded file"),
    (re.compile(r"__attribute__\s*\(\(\s*(target|constructor|destructor)"), "target/constructor attribute"),
    (re.compile(r"#\s*pragma\s+(GCC|clang)\s+(target|optimize)"), "target/optimize pragma"),
]


def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
    return re.sub(r"//[^\n]*", "", text)


def source_gate(changed: list[str], cand: Path) -> list[str]:
    problems = []
    for rel in changed:
        new_path = cand / rel
        if not new_path.exists():
            continue
        if not rel.endswith((".cpp", ".h", ".hpp", ".cc", ".inc")):
            problems.append(f"{rel}: only C++ sources/headers may be added to mutable directories")
            continue
        base_path = TRUSTED / rel
        old_lines = set()
        if base_path.exists():
            old_lines = {l.strip() for l in strip_comments(base_path.read_text("latin-1")).splitlines()}
        for number, line in enumerate(strip_comments(new_path.read_text("latin-1")).splitlines(), 1):
            if line.strip() in old_lines:
                continue
            for pattern, what in FORBIDDEN_SOURCE:
                if pattern.search(line):
                    problems.append(f"{rel}:{number}: {what}: {line.strip()[:120]}")
    return problems


def assembly_record(item: dict) -> dict:
    """Hash semantic assembly fields, not operand expression names or source locations."""
    return {"asm": "\n".join(" ".join(line.split()) for line in item["asm"].splitlines() if line.strip()),
            "outputs": item["outputs"], "inputs": item["inputs"],
            "clobbers": item["clobbers"], "volatile": item["volatile"]}


def assembly_digest(item: dict) -> str:
    return hashlib.sha256(json.dumps(assembly_record(item), sort_keys=True,
                                    separators=(",", ":")).encode()).hexdigest()


def translation_units(tree: Path) -> list[tuple[str, list[str]]]:
    """Derive every TU and exact flags from protected recipes, not a second source list."""
    cfg = CHALLENGE["build"]
    env = {"PATH": "/usr/bin:/bin", "HOME": str(tree), "LC_ALL": "C", "TMPDIR": str(tree)}
    plan = subprocess.run(
        ["make", "-Bn", f"CFLAGS_DEFINES={cfg['CFLAGS_DEFINES']}",
         f"CFLAGS_TF_DEFINES={cfg['CFLAGS_TF_DEFINES']}", f"CM_OPT={cfg['CM_OPT']}", "cmix"],
        cwd=tree, env=env, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, timeout=60, check=True).stdout.decode("latin-1")
    units, seen = [], set()
    for line in plan.splitlines():
        argv = shlex.split(line)
        if not argv or argv[0] != "clang++-17" or "-c" not in argv:
            continue
        if not {"-mrecip=none", "-march=x86-64-v3", "-std=c++17"} <= set(argv):
            raise GateFailure("source_ok", "protected compilation plan lacks required ISA/determinism flags")
        sources = [a for a in argv[1:] if a.endswith((".cpp", ".cc", ".cxx", ".c"))]
        flags, skip = [], False
        for arg in argv[1:]:
            if skip:
                skip = False
            elif arg == "-o":
                skip = True
            elif arg != "-c" and arg not in sources:
                flags.append(arg)
        for source in sources:
            if source in seen:
                raise GateFailure("source_ok", "protected compilation plan repeats a translation unit")
            seen.add(source)
            units.append((source, flags))
    if not units:
        raise GateFailure("source_ok", "protected compilation plan contains no translation units")
    return units


def ast_source_gate(tree: Path, cpus: list[int]) -> list[str]:
    """The native Clang AST visitor includes instantiations and exposes semantic asm fields."""
    try:
        allowlist = json.loads((TRUSTED / "hone/asm-allowlist.json").read_bytes())
        entries = allowlist["entries"]
        if allowlist["version"] != 1 or not entries:
            raise ValueError("missing assembly entries")
        allowed = set()
        for entry in entries:
            if (entry["sha256"] != assembly_digest(entry["assembly"])
                    or entry["verification"] != {"noForbiddenMnemonics": True,
                                                  "noDataDirectives": True,
                                                  "branchesSameBlockBoundaries": True}):
                raise ValueError("assembly entry is not verified")
            allowed.add(entry["sha256"])
        helper = TRUSTED / "hone/asm-audit"
        if sha256_file(helper) != allowlist["helperSha256"]:
            raise ValueError("AST helper hash mismatch")
    except (OSError, ValueError, KeyError, TypeError):
        return ["protected assembly allowlist/helper is missing or invalid"]
    env = {"PATH": "/usr/bin:/bin", "HOME": str(tree), "LC_ALL": "C", "TMPDIR": str(tree)}
    units = translation_units(tree)
    for source, flags in units:
        try:
            done = subprocess.run(
                [str(helper), str(tree), source, "--", *flags,
                 "-resource-dir=/usr/lib/llvm-17/lib/clang/17"], cwd=tree, env=env,
                stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                timeout=CHALLENGE["buildTimeoutSec"],
                preexec_fn=make_preexec(set(cpus), None, 1 << 30))
        except subprocess.TimeoutExpired:
            return ["AST translation-unit analysis timed out"]
        if done.returncode != 0:
            return ["AST translation-unit analysis failed"]
        try:
            report = json.loads(done.stdout)
            problems = list(report["problems"])
            for statement in report["assembly"]:
                if assembly_digest(statement) not in allowed:
                    problems.append("assembly differs from the verified unmodified-baseline allowlist")
        except (ValueError, KeyError, TypeError):
            return ["AST translation-unit analysis produced invalid output"]
        if problems:
            return [f"{source}: {p}" for p in problems]
    log(f"AST checked {len(units)} translation units including template instantiations")
    return []


def build(tree: Path, label: str, cpus: list[int]) -> Path:
    open_tree(tree)
    cfg = CHALLENGE["build"]
    argv = ["make", f"-j{len(cpus)}", f"CFLAGS_DEFINES={cfg['CFLAGS_DEFINES']}",
            f"CFLAGS_TF_DEFINES={cfg['CFLAGS_TF_DEFINES']}", f"CM_OPT={cfg['CM_OPT']}", "cmix"]
    out = open(tree.parent / f"{label}-build.log", "wb")
    env = {"PATH": "/usr/bin:/bin", "HOME": str(tree), "LC_ALL": "C", "TMPDIR": str(tree)}
    try:
        done = subprocess.run(argv, cwd=tree, stdin=subprocess.DEVNULL, stdout=out, stderr=subprocess.STDOUT,
                              env=env, timeout=CHALLENGE["buildTimeoutSec"],
                              preexec_fn=make_preexec(set(cpus), None, 1 << 30))
    except subprocess.TimeoutExpired:
        raise GateFailure("build_ok", f"{label} build timed out")
    finally:
        out.close()
        reap_workers()
    if done.returncode != 0 or not (tree / "cmix").is_file():
        # The log is worker output: it stays in the evaluator's scratch, never in the result.
        raise GateFailure("build_ok", f"{label} build failed (make exit {done.returncode})")
    bindir = HOME_ROOT / "bin" / label
    bindir.mkdir(mode=0o755, parents=True)
    shutil.copyfile(tree / "cmix", bindir / "cmix")
    shutil.copyfile(tree / "cmix.map", bindir / "cmix.map")
    os.chmod(bindir / "cmix", 0o755)
    os.chmod(bindir / "cmix.map", 0o644)
    return bindir / "cmix"


AVX512_OBJECTS = ("tf_qmat_dense_avx512.o", "tf_qmat_sparse_avx512.o")
RECIP = re.compile(r"\bv?(rcp|rsqrt)(14|28)?(ps|ss|pd|sd|ph|sh)\b")
MNEMONIC_OK = re.compile(r"^(v[a-z0-9]+|kmov[bwdq]|knot[bwdq]|kand[bwdq]|kandn[bwdq]|kor[bwdq]|kxor[bwdq]|"
                         r"kxnor[bwdq]|korte?st[bwdq]|kshift[lr][bwdq]|kunpck[bwdq]+|kadd[bwdq])\b")
INSN = re.compile(r"^\s*([0-9a-f]+):\t((?:[0-9a-f]{2} )+)\s*\t?(.*)$")
MAP_LINE = re.compile(r"^\s*([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+(\d+)\s+(\S.*)$")


def isa_gate(binary: Path) -> list[str]:
    ranges = []
    for line in (binary.parent / "cmix.map").read_text("latin-1").splitlines():
        m = MAP_LINE.match(line)
        if not m:
            continue
        tail = " " + m.group(5)
        if any((" " + o + ":(") in tail for o in AVX512_OBJECTS):
            vma, size = int(m.group(1), 16), int(m.group(3), 16)
            if size:
                ranges.append((vma, vma + size))
    ranges.sort()
    if not ranges:
        return ["linker map lists no section of the AVX-512 qmat objects"]
    dis = subprocess.run(["objdump", "-d", "--insn-width=16", str(binary)], stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, timeout=300, check=True).stdout.decode("latin-1")
    problems = []
    inside_count = 0

    def inside(addr: int) -> bool:
        lo, hi = 0, len(ranges)
        while lo < hi:
            mid = (lo + hi) // 2
            if ranges[mid][0] <= addr:
                lo = mid + 1
            else:
                hi = mid
        return lo > 0 and ranges[lo - 1][0] <= addr < ranges[lo - 1][1]

    for line in dis.splitlines():
        m = INSN.match(line)
        if not m:
            continue
        addr, raw, text = int(m.group(1), 16), m.group(2), m.group(3).replace("{evex} ", "")
        mnemonic = text.split()[0] if text.split() else ""
        if RECIP.search(mnemonic):
            problems.append(f"reciprocal estimate: {line.strip()[:120]}")
        is512 = "%zmm" in text or re.search(r"%k[0-7]", text) is not None or "{vex}" in text or raw.startswith("62 ")
        if not is512:
            continue
        if not inside(addr):
            problems.append(f"AVX-512 outside the dispatched qmat objects: {line.strip()[:120]}")
        else:
            inside_count += 1
            if "{vex}" in text:
                problems.append(f"VEX-encoded VNNI: {line.strip()[:120]}")
            elif not MNEMONIC_OK.match(mnemonic) and mnemonic != "(bad)":
                problems.append(f"unexpected AVX-512 mnemonic: {line.strip()[:120]}")
        if len(problems) > 20:
            break
    if inside_count == 0:
        problems.append("no AVX-512 code found in the dispatched qmat objects")
    return problems


def code_size(binary: Path) -> int:
    stripped = binary.parent / "cmix.stripped"
    shutil.copyfile(binary, stripped)
    subprocess.run(["llvm-strip-17", "--strip-all", str(stripped)], check=True, timeout=120)
    data = subprocess.run(["xz", "-9e", "-T1", "-c", str(stripped)], stdout=subprocess.PIPE,
                          check=True, timeout=600).stdout
    stripped.unlink()
    return len(data)


# --------------------------------------------------------------------------- slices
def slice_files(split: str) -> dict[str, Path]:
    root = ASSETS_ROOT / split
    found = {p.stem: p for p in sorted(root.glob("*.bin"))} if root.is_dir() else {}
    expected = {name for name, s in CHALLENGE["slices"].items() if s["split"] == split}
    if set(found) != expected:
        raise RuntimeError(f"{split}: mounted slices {sorted(found)} != expected {sorted(expected)}")
    for name, path in found.items():
        if sha256_file(path) != CHALLENGE["slices"][name]["sha256"]:
            raise RuntimeError(f"{name}: asset hash mismatch")
    return found


def detect_split() -> str:
    present = [s for s in SPLITS if (ASSETS_ROOT / s).is_dir()]
    if len(present) != 1:
        raise RuntimeError(f"exactly one asset split must be mounted, found {present}")
    return present[0]


def stage_inputs() -> Path:
    inputs = HOME_ROOT / "inputs"
    inputs.mkdir(mode=0o755)
    shutil.copyfile(TRUSTED / "dictionary" / "english.dic", inputs / "english.dic")
    shutil.copyfile(TRUSTED / CHALLENGE["weights"], inputs / "weights.tfwc2")
    shutil.copyfile(TRUSTED / "hone" / "vocab.bin", inputs / "vocab.bin")
    for path in inputs.iterdir():
        os.chmod(path, 0o644)
    return inputs


def new_run_dir(name: str, files: dict[str, bytes]) -> Path:
    """A fresh run directory on the noexec scratch holding only the given root-owned files."""
    path = RUNS_ROOT / name
    path.mkdir()
    for fname, data in files.items():
        (path / fname).write_bytes(data)
        os.chmod(path / fname, 0o444)
    os.chmod(path, 0o1777)  # sticky: the worker adds its output but cannot replace staged files
    return path


def compress_job(label: str, binary: Path, inputs: Path, name: str, data: bytes, timeout: float) -> Job:
    run = new_run_dir(f"{label}{name}-c", {"slice.bin": data})
    return Job(f"{name}:compress", [str(binary), "-S", str(inputs / "english.dic"), str(inputs / "weights.tfwc2"),
                                    str(inputs / "vocab.bin"), str(run / "slice.bin"), str(run / "out.cmix")],
               run, Confinement(run, binary, inputs), timeout)


def decompress_job(label: str, binary: Path, inputs: Path, name: str, archive: bytes, timeout: float) -> Job:
    run = new_run_dir(f"{label}{name}-d", {"in.cmix": archive})
    return Job(f"{name}:decompress", [str(binary), "-D", str(inputs / "english.dic"), str(inputs / "weights.tfwc2"),
                                      str(run / "in.cmix"), str(run / "out.bin")],
               run, Confinement(run, binary, inputs), timeout)


def read_output(job: Job, fname: str) -> bytes | None:
    path = job.cwd / fname
    try:
        st = os.lstat(path)
    except OSError:
        return None
    if not stat.S_ISREG(st.st_mode):
        return None
    return path.read_bytes()


def job_failure(job: Job) -> str:
    if job.error is not None:
        return f"{job.name}: evaluator error"
    return f"{job.name}: exit {job.status}{' (timeout)' if job.timed_out else ''}"


# --------------------------------------------------------------------------- reference sanity
def reference_check(name: str, data: bytes, ref_c: Job, archive: bytes | None,
                    ref_d: Job | None, output: bytes | None) -> dict:
    spec = CHALLENGE["slices"][name]
    margin = CHALLENGE["instructionMargin"]
    problems = []
    report = {"slice": name, "bytes": len(archive) if archive is not None else None,
              "baseline_bytes": spec["baselineBytes"]}
    if not ref_c.ok() or archive is None:
        problems.append(f"reference compress failed ({job_failure(ref_c)})")
    elif len(archive) != spec["baselineBytes"]:
        problems.append(f"reference archive is {len(archive)} B, calibrated {spec['baselineBytes']} B")
    if ref_d is None or not ref_d.ok() or output != data:
        problems.append("reference decode did not reproduce the slice")
    for phase, job in (("compress", ref_c), ("decompress", ref_d)):
        recorded = spec["baselineInstructions"][phase]
        measured = job.instructions if job is not None else 0
        ratio = measured / recorded
        report[phase] = {"instructions": measured, "recorded": recorded, "ratio": round(ratio, 6),
                         "cpu_sec": round(job.cpu_sec, 2) if job is not None else None}
        if measured <= 0 or abs(ratio - 1.0) > margin:
            problems.append(f"reference {phase} instructions {measured} vs calibrated {recorded} "
                            f"(ratio {ratio:.6f}, margin {margin})")
    if problems:
        raise GateFailure("reference_ok", "reference sanity check failed: " + "; ".join(problems))
    return report


# --------------------------------------------------------------------------- handoff
def check_handoff(writable: bool) -> None:
    capsule = os.stat(HANDOFF.parent)
    if capsule.st_uid != 0 or capsule.st_mode & 0o077:
        raise GateFailure("isolation_ok", f"{HANDOFF.parent} must be root-owned mode 0700")
    if not HANDOFF.is_dir() or HANDOFF.is_symlink():
        raise GateFailure("isolation_ok", f"{HANDOFF} is not mounted")
    if writable:
        if any(HANDOFF.iterdir()):
            raise GateFailure("isolation_ok", f"{HANDOFF} is not empty")
        os.chmod(HANDOFF, 0o700)
    if os.stat(HANDOFF).st_mode & 0o077:
        raise GateFailure("isolation_ok", f"{HANDOFF} must be mode 0700")


def write_handoff(state: dict, cand_bin: Path, archives: dict[str, bytes]) -> None:
    def put(fname: str, data: bytes) -> None:
        fd = os.open(HANDOFF / fname, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o400)
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
    put("candidate.bin", cand_bin.read_bytes())
    for name, data in archives.items():
        put(f"{name}.cmix", data)
    put("state.json.tmp", json.dumps(state, separators=(",", ":")).encode())
    os.rename(HANDOFF / "state.json.tmp", HANDOFF / "state.json")


def load_handoff(split: str, names: list[str]) -> dict:
    """Authenticates the encode container's root-only handoff; anything off refuses the decode."""
    try:
        state = json.loads((HANDOFF / "state.json").read_bytes())
        problem = None
        if state.get("version") != STATE_VERSION or state.get("split") != split:
            problem = "handoff state is for another protocol version or split"
        elif state.get("evalSha256") != EVAL_SHA256 or state.get("challengeSha256") != CHALLENGE_SHA256:
            problem = "handoff was written by a different evaluator or challenge"
        elif sorted(state["archives"]) != names:
            problem = "handoff archives do not match the mounted slices"
        elif any(state["gates"].get(g) is not True for g in ("reference_ok", "source_ok", "build_ok", "isa_ok", "jobs_ok")):
            problem = "handoff continues an encode phase whose gates did not pass"
        elif sha256_file(HANDOFF / "candidate.bin") != state["candidateSha256"]:
            problem = "handoff candidate binary does not match its recorded hash"
        else:
            for name, meta in state["archives"].items():
                if sha256_file(HANDOFF / f"{name}.cmix") != meta["sha256"]:
                    problem = f"handoff archive {name} does not match its recorded hash"
    except (OSError, ValueError, KeyError, TypeError, AttributeError) as exc:
        problem = f"handoff is unreadable: {type(exc).__name__}"
    if problem is not None:
        raise GateFailure("isolation_ok", problem)
    return state


# --------------------------------------------------------------------------- phases
def encode(split: str, slices: dict[str, Path], gates: dict, r: dict) -> None:
    names = sorted(slices)
    cpus = bench_cpus()
    log(f"split={split} slices={names} cpus={cpus}")
    (HOME_ROOT / "src").mkdir(mode=0o755)
    ref_tree, cand_tree = HOME_ROOT / "src" / "reference", HOME_ROOT / "src" / "candidate"
    copy_tree(ref_tree)
    copy_tree(cand_tree)
    r["changed"] = overlay_candidate(cand_tree)
    log(f"candidate changes {len(r['changed'])} mutable file(s): {r['changed'][:20]}")
    problems = source_gate(r["changed"], cand_tree)
    open_tree(cand_tree)
    if not problems:
        problems = ast_source_gate(cand_tree, cpus)
    if problems:
        raise GateFailure("source_ok", "; ".join(problems[:10]))
    gates["source_ok"] = True
    ref_bin = build(ref_tree, "reference", cpus)
    cand_bin = build(cand_tree, "candidate", cpus)
    gates["build_ok"] = True
    # Builds are over: no worker-writable tree, process or file may outlive them.
    shutil.rmtree(HOME_ROOT / "src")
    purge_worker_files()
    cand_sha = sha256_file(cand_bin)
    problems = isa_gate(cand_bin)
    if problems:
        raise GateFailure("isa_ok", "; ".join(problems[:10]))
    gates["isa_ok"] = True
    r["ref_size"], r["cand_size"] = code_size(ref_bin), code_size(cand_bin)
    r["code_delta"] = r["cand_size"] - r["ref_size"]
    log(f"code size (xz of stripped binary): reference {r['ref_size']}, candidate {r['cand_size']}")
    inputs = stage_inputs()
    timeout = CHALLENGE["jobTimeoutSec"]

    # Compress wave. The reference chain (compress, then decode) leads: it is the longest path.
    ref_name = reference_slice(names)
    ref_data = slices[ref_name].read_bytes()
    ref_c = compress_job("ref-", ref_bin, inputs, ref_name, ref_data, timeout)
    ref = {"archive": None, "decode": None}

    def followup(job: Job) -> Job | None:
        if job is not ref_c or not job.ok():
            return None
        ref["archive"] = read_output(job, "out.cmix")
        if ref["archive"] is None:
            return None
        ref["decode"] = decompress_job("ref-", ref_bin, inputs, ref_name, ref["archive"], timeout)
        return ref["decode"]

    jobs = [compress_job("", cand_bin, inputs, name, slices[name].read_bytes(), timeout) for name in names]
    run_wave([ref_c] + jobs, cpus, followup)
    r["stray"] = reap_workers()
    errors = [j for j in [ref_c, ref["decode"]] + jobs if j is not None and j.error is not None]
    if errors:
        raise RuntimeError("; ".join(f"{j.name}: {j.error}" for j in errors))
    ref_out = read_output(ref["decode"], "out.bin") if ref["decode"] is not None else None
    r["reference_check"] = reference_check(ref_name, ref_data, ref_c, ref["archive"], ref["decode"], ref_out)
    gates["reference_ok"] = True
    log(f"reference sanity: {r['reference_check']}")
    r["jobs"] = [j.record() for j in jobs]
    archives = {}
    for name, job in zip(names, jobs):
        data = read_output(job, "out.cmix") if job.ok() else None
        if data is None:
            r["failures"].append(job_failure(job))
        else:
            archives[name] = data
    r["archive_bytes"] = {n: len(a) for n, a in archives.items()}
    for path in RUNS_ROOT.iterdir():
        shutil.rmtree(path, ignore_errors=True)
    purge_worker_files()
    if r["failures"]:
        raise GateFailure("jobs_ok", "; ".join(r["failures"]))
    gates["jobs_ok"] = True
    state = {"version": STATE_VERSION, "split": split, "evalSha256": EVAL_SHA256,
             "challengeSha256": CHALLENGE_SHA256, "gates": gates, "changed": r["changed"],
             "ref_size": r["ref_size"], "cand_size": r["cand_size"], "code_delta": r["code_delta"],
             "stray": r["stray"], "jobs": r["jobs"], "reference_check": r["reference_check"],
             "candidateSha256": cand_sha,
             "archives": {n: {"sha256": hashlib.sha256(a).hexdigest(), "bytes": len(a)} for n, a in archives.items()}}
    write_handoff(state, cand_bin, archives)


def decode(split: str, slices: dict[str, Path], gates: dict, r: dict) -> None:
    names = sorted(slices)
    state = load_handoff(split, names)
    gates.update(state["gates"])
    gates["jobs_ok"] = None  # re-judged over both phases below
    for key in ("changed", "ref_size", "cand_size", "code_delta", "stray", "reference_check"):
        r[key] = state[key]
    cpus = bench_cpus()
    log(f"split={split} slices={names} cpus={cpus}")
    bindir = HOME_ROOT / "bin" / "candidate"
    bindir.mkdir(mode=0o755, parents=True)
    cand_bin = bindir / "cmix"
    shutil.copyfile(HANDOFF / "candidate.bin", cand_bin)
    os.chmod(cand_bin, 0o755)
    if sha256_file(cand_bin) != state["candidateSha256"]:
        raise GateFailure("isolation_ok", "staged candidate binary does not match the handoff hash")
    inputs = stage_inputs()
    timeout = CHALLENGE["jobTimeoutSec"]
    djobs = [decompress_job("", cand_bin, inputs, name, (HANDOFF / f"{name}.cmix").read_bytes(), timeout)
             for name in names]
    run_wave(djobs, cpus)
    r["stray"] += reap_workers()
    errors = [j for j in djobs if j.error is not None]
    if errors:
        raise RuntimeError("; ".join(f"{j.name}: {j.error}" for j in errors))
    r["roundtrip"] = {}
    for name, job in zip(names, djobs):
        out = read_output(job, "out.bin") if job.ok() else None
        r["roundtrip"][name] = out is not None and out == slices[name].read_bytes()
        if not job.ok():
            r["failures"].append(job_failure(job))
        elif not r["roundtrip"][name]:
            r["failures"].append(f"{job.name}: output differs from the slice")
    for path in RUNS_ROOT.iterdir():
        shutil.rmtree(path, ignore_errors=True)
    purge_worker_files()
    r["archive_bytes"] = {n: m["bytes"] for n, m in state["archives"].items()}
    records = state["jobs"] + [j.record() for j in djobs]
    r["jobs"] = records
    r["cpu_total"] = sum(j["cpu_sec"] for j in records)
    r["cpu_budget"] = CHALLENGE["baselineCpuSec"][split] * (1.0 + CHALLENGE["cpuMargin"])
    r["instructions"] = sum(j["instructions"] for j in records)
    r["instructions_budget"] = CHALLENGE["baselineInstructions"][split] * (1.0 + CHALLENGE["instructionMargin"])
    gates["jobs_ok"] = all(j.ok() for j in djobs)
    gates["roundtrip_ok"] = all(r["roundtrip"].values())
    gates["instructions_within_budget"] = (all(j["instructions"] > 0 for j in records)
                                           and r["instructions"] <= r["instructions_budget"])
    gates["cpu_within_budget"] = r["cpu_total"] <= r["cpu_budget"]
    gates["no_stray_processes"] = r["stray"] == 0


def result_json(split: str, names: list[str], gates: dict, r: dict, failure: GateFailure | None) -> dict:
    base = {}
    for n in names:  # a missing reference can only reach here on an invalid result
        value = CHALLENGE["slices"].get(n, {}).get("baselineBytes")
        base[n] = value if _number(value, True) else 0
    constraints = {g: gates.get(g) is True for g in GATES}
    constraints["tests_pass"] = failure is None and all(constraints.values())
    valid = constraints["tests_pass"]
    diagnostics: dict = {"split": split,
                         "gates": {g: {True: "pass", False: "fail"}.get(gates.get(g), "not_run") for g in GATES}}
    per_example = {}
    saved_total = 0.0
    if valid:
        for n in names:
            cand = r["archive_bytes"][n]
            code_term = 2.0 * r["code_delta"] * CHALLENGE["slices"][n]["originalEquivalentBytes"] / 1e9
            saved = base[n] - cand - code_term
            saved_total += saved
            per_example[n] = {"score": base[n] / max(cand + code_term, 1.0),
                              "feedback": f"{cand} B vs lexth11c {base[n]} B ({base[n] - cand:+d} B), "
                                          f"code term {code_term:.1f} B, round trip ok"}
        diagnostics["summary"] = (f"{split}: {saved_total:+.1f} bytes saved vs lexth11c over {len(names)} slices; "
                                  f"instructions {r['instructions'] / CHALLENGE['baselineInstructions'][split]:.4f}x "
                                  f"lexth11c (limit {1 + CHALLENGE['instructionMargin']:.3f}x); CPU "
                                  f"{r['cpu_total']:.1f}s of {r['cpu_budget']:.1f}s budget")
    else:
        saved_total = -float(sum(base.values()))
        failed = [g for g in GATES if gates.get(g) is False]
        not_run = [g for g in GATES if gates.get(g) is None]
        summary = f"{split}: failed {failed}; not run {not_run}"
        if failure is not None:
            summary += f"; {failure.constraint}: {failure}"
        elif "instructions" in r:
            summary += (f"; instructions {r['instructions']} of {r['instructions_budget']:.0f}; "
                        f"CPU {r['cpu_total']:.1f}s of {r['cpu_budget']:.1f}s; {'; '.join(r['failures'])}")
        diagnostics["summary"] = summary[:4000]
        for n in names:
            per_example[n] = {"score": 0.0, "feedback": f"invalid: {summary}"[:1000]}
    for key, value in (("cpu_sec_total", lambda: round(r["cpu_total"], 2)),
                       ("cpu_sec_budget", lambda: round(r["cpu_budget"], 2)),
                       ("instructions_total", lambda: r["instructions"]),
                       ("instructions_budget", lambda: round(r["instructions_budget"])),
                       ("code_size_xz", lambda: {"reference": r["ref_size"], "candidate": r["cand_size"],
                                                 "delta": r["code_delta"]}),
                       ("changed_files", lambda: r["changed"]),
                       ("jobs", lambda: r["jobs"]),
                       ("reference_check", lambda: r["reference_check"])):
        try:
            diagnostics[key] = value()
        except KeyError:
            pass
    if "archive_bytes" in r:
        diagnostics["slices"] = {n: {"bytes": r["archive_bytes"].get(n, 0), "baseline_bytes": base[n],
                                     "roundtrip": r.get("roundtrip", {}).get(n, False)} for n in names}
    diagnostics["quality"] = (sum(1 for n in names if r["roundtrip"].get(n)) / len(names)) if valid else 0.0
    return {"valid": valid, "objectives": {"bytes_saved": saved_total}, "constraints": constraints,
            "perExample": per_example, "diagnostics": diagnostics}


def preflight() -> None:
    """The measurement boundary this evaluator relies on; anything missing is a failed gate."""
    global LANDLOCK_ABI
    if PHASE not in ("encode", "decode"):
        raise GateFailure("isolation_ok", "candidate archives must be decoded in a fresh evaluator container: "
                                          "run under the manifest evalPhases [encode, decode] protocol "
                                          "(HONE_EVAL_PHASE is unset)")
    if os.geteuid() != 0:
        raise GateFailure("isolation_ok", "the evaluator must run as root inside the hone evaluator container")
    LANDLOCK_ABI = landlock_abi()
    if LANDLOCK_ABI < 1:
        raise GateFailure("isolation_ok", "Landlock is unavailable; slice jobs cannot be confined")
    check_handoff(writable=PHASE == "encode")


def main() -> None:
    split = detect_split()
    slices = slice_files(split)
    names = sorted(slices)
    gates: dict = {}
    r: dict = {"failures": []}
    failure = None
    mounted: list[Path] = []
    try:
        preflight()
        gates["isolation_ok"] = True
        problems = calibration_problems()
        if problems:
            raise GateFailure("reference_ok", "challenge.json is not calibrated: " + "; ".join(problems))
        mounted = mount_scratch()
        if PHASE == "encode":
            encode(split, slices, gates, r)
        else:
            decode(split, slices, gates, r)
    except GateFailure as exc:
        failure = exc
        gates[exc.constraint] = False
        log(f"gate failure: {exc.constraint}")
    finally:
        if os.geteuid() == 0:
            reap_workers()
        unmount_scratch(mounted)
    if PHASE == "encode" and failure is None:
        output = CONTINUE_MARKER
    else:
        output = result_json(split, names, gates, r, failure)
    json.dump(output, sys.stdout, separators=(",", ":"))
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
