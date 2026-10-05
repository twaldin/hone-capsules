#!/usr/bin/env python3
"""Machine proof for the baseline asm allowlist: forbidden mnemonics, data directives, and
same-block / assembled-instruction-boundary branch targets, from compiler-emitted assembly.

Runs inside the unchanged capsule image; /trusted/baseline is the read-only unmodified baseline,
/out is the writable evidence directory.
"""
import collections, hashlib, importlib.util, json, os, re, shlex, subprocess, sys
from pathlib import Path

T = Path("/trusted/baseline")
OUT = Path("/out")
spec = importlib.util.spec_from_file_location("hut_eval", T / "eval.py")
ev = importlib.util.module_from_spec(spec); spec.loader.exec_module(ev)
env = {"PATH": "/usr/bin:/bin", "HOME": str(T), "LC_ALL": "C", "TMPDIR": "/tmp"}
derivation = json.loads((OUT / "helper-derivation.json").read_text())

def sh(argv, **kw):
    return subprocess.run(argv, cwd=kw.pop("cwd", T), env=env, stdin=subprocess.DEVNULL,
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True, **kw)

def sha(b):
    return hashlib.sha256(b).hexdigest()

# ---- 1. protected make plan: every command, nothing but clang++-17 compiles and the final link
cfg = ev.CHALLENGE["build"]
plan = sh(["make", "-Bn", f"CFLAGS_DEFINES={cfg['CFLAGS_DEFINES']}",
           f"CFLAGS_TF_DEFINES={cfg['CFLAGS_TF_DEFINES']}", f"CM_OPT={cfg['CM_OPT']}", "cmix"]).stdout.decode("latin-1")
(OUT / "make-plan.txt").write_text(plan)
heads = collections.Counter()
non_tu = []
for line in plan.splitlines():
    argv = shlex.split(line)
    if not argv:
        continue
    heads[argv[0]] += 1
    if not (argv[0] == "clang++-17" and "-c" in argv):
        non_tu.append(line[:240])
    if argv[0] == "clang++-17" and "-c" in argv:
        for a in argv:
            assert not re.search(r"\.(S|s|asm|c)$", a), ("non-C++ assembler/C input in plan", line[:200])
            assert not a.startswith(("-Wa,", "-fno-integrated-as", "-no-integrated-as", "-x")), ("assembler flag", a)
units = ev.translation_units(T)
assert [u[0] for u in units] == [u["source"] for u in derivation["units"]], "derivation/plan TU mismatch"

# ---- 2. asm source-text audit of each allowlist entry
FORBIDDEN_MNEM = re.compile(r"^v?(rcp|rsqrt)(14|28)?(ps|ss|pd|sd|ph|sh)$")
DATA_DIR = re.compile(r"^\.(byte|inst|short|word|hword|long|int|quad|octa|ascii|asciz|string|incbin|fill|skip|space|zero|"
                      r"org|section|text|data|bss|pushsection|popsection|previous|globl|global|weak|type|size|set|equ|"
                      r"macro|rept|irp|irpc|if|include|align|balign|p2align|code16|code32|code64|intel_syntax|"
                      r"att_syntax|cfi_\w+|file|loc|ident|comm|lcomm|uleb128|sleb128|float|double|single)$")
entries = derivation["entries"]
source_audit = []
for e in entries:
    lines = e["assembly"]["asm"].split("\n")
    rows, labels, branch_targets, mnemonics = [], [], [], []
    ok = True
    assert ";" not in e["assembly"]["asm"] and "\\" not in e["assembly"]["asm"]
    for ln in lines:
        s = ln.strip()
        m = re.fullmatch(r"(\d+):", s)
        if m:
            labels.append(m.group(1)); rows.append(("label", s)); continue
        if s.startswith("."):
            d = s.split()[0]
            if d != ".p2align" or not re.fullmatch(r"\.p2align \d+", s):
                ok = False
            rows.append(("directive", s)); continue
        mnem = s.split()[0].lower()
        mnemonics.append(mnem)
        if FORBIDDEN_MNEM.match(mnem) or "rcp" in mnem or "rsqrt" in mnem:
            ok = False
        if re.search(r"\.(byte|inst|long|quad|word|ascii|incbin)", s):
            ok = False
        if mnem.startswith("j") or mnem in ("loop", "loope", "loopne", "jrcxz", "call", "ret", "int", "syscall"):
            t = re.fullmatch(r"(j\w+)\s+(\d+)([fb])", s)
            if not t:
                ok = False  # call/ret/indirect/non-numeric branch
            else:
                branch_targets.append({"mnemonic": t.group(1), "label": t.group(2), "dir": t.group(3)})
            rows.append(("branch", s)); continue
        rows.append(("insn", s))
    # source-level numeric-label resolution
    resolved = []
    for idx, ln in enumerate(lines):
        s = ln.strip()
        t = re.fullmatch(r"(j\w+)\s+(\d+)([fb])", s)
        if not t:
            continue
        if t.group(3) == "f":
            hit = any(re.fullmatch(rf"{t.group(2)}:", l.strip()) for l in lines[idx + 1:])
        else:
            hit = any(re.fullmatch(rf"{t.group(2)}:", l.strip()) for l in lines[:idx])
        resolved.append({"line": idx + 1, "insn": s, "labelInSameStringAndDirection": hit})
        ok = ok and hit
    source_audit.append({"sha256": e["sha256"], "ok": ok, "directives": [r[1] for r in rows if r[0] == "directive"],
                         "labels": labels, "mnemonics": sorted(set(mnemonics)), "branches": resolved,
                         "mnemonicCount": len(mnemonics)})
    assert ok, ("source audit failed", e["sha256"])

# ---- 3. compile asm-containing TUs to real .o and -S, instrument, assemble, disassemble
asm_tus = sorted({u for e in entries for u in e["units"]})
work = Path("/tmp/asmproof"); work.mkdir(exist_ok=True)
tuflags = dict(units)
INSN = re.compile(r"^\s*([0-9a-f]+):\t((?:[0-9a-f]{2} )+)\s*(?:\t(\S.*))?$")
BRANCH = re.compile(r"^(j[a-z]+|loop[a-z]*|call[a-z]*|ret[a-z]*|jmp[a-z]*|syscall|int\d*)$")

def disasm(obj):
    """Return {section: [(addr, mnemonic, operands, nbytes)]} and relocation addresses per section."""
    text = sh(["objdump", "-d", "-r", "-w", "--no-show-raw-insn", str(obj)]).stdout.decode()
    raw = sh(["objdump", "-d", "-w", str(obj)]).stdout.decode()
    secs, relocs, cur = {}, collections.defaultdict(list), None
    for line in text.splitlines():
        m = re.match(r"^Disassembly of section (\S+):", line)
        if m:
            cur = m.group(1); secs[cur] = []; continue
        m = re.match(r"^\s+([0-9a-f]+):\s+(R_X86_64_\S+)\s+(\S+)", line)
        if m and cur:
            relocs[cur].append((int(m.group(1), 16), m.group(2), m.group(3))); continue
        m = re.match(r"^\s+([0-9a-f]+):\s+(\S+)\s*(.*)$", line)
        if m and cur:
            secs[cur].append([int(m.group(1), 16), m.group(2), m.group(3).strip()])
    # byte lengths from raw listing
    cur = None; addrs = collections.defaultdict(list)
    for line in raw.splitlines():
        m = re.match(r"^Disassembly of section (\S+):", line)
        if m:
            cur = m.group(1); continue
        m = re.match(r"^\s+([0-9a-f]+):\t((?:[0-9a-f]{2} )+)\s*(\t.*)?$", line)
        if m and cur:
            if m.group(3) is not None and m.group(3).strip():
                addrs[cur].append([int(m.group(1), 16), len(m.group(2).split())])
            elif addrs[cur]:
                addrs[cur][-1][1] += len(m.group(2).split())
    return secs, relocs, addrs

def symbols(obj):
    out = {}
    for line in sh(["objdump", "-t", str(obj)]).stdout.decode().splitlines():
        m = re.match(r"^([0-9a-f]{16}) (.{7}) (\S+)\s+([0-9a-f]{16})\s+(\S+)$", line)
        if m:
            out[m.group(5)] = (m.group(3), int(m.group(1), 16))
    return out

proofs = []
mcsym_by_src = {}
for src in asm_tus:
    flags = tuflags[src]
    tag = src.replace("/", "_")
    real_o, sfile = work / f"{tag}.real.o", work / f"{tag}.s"
    sh(["clang++-17", *flags, "-c", src, "-o", str(real_o)], cwd=T)
    sh(["clang++-17", *flags, "-S", src, "-o", str(sfile)], cwd=T)
    lines = sfile.read_text().split("\n")
    blocks, i, instr = [], 0, []
    cur = None
    for n, line in enumerate(lines):
        if line.strip() == "#APP":
            cur = n
        elif line.strip() == "#NO_APP":
            blocks.append((cur, n)); cur = None
    assert cur is None and blocks, (src, "no/unterminated #APP blocks")
    out = []
    starts = {a: k for k, (a, b) in enumerate(blocks)}
    ends = {b: k for k, (a, b) in enumerate(blocks)}
    for n, line in enumerate(lines):
        if n in ends:
            out.append(f"hutblk_{ends[n]}_end:")
        out.append(line)
        if n in starts:
            out.append(f"hutblk_{starts[n]}_start:")
    inst_s = work / f"{tag}.instrumented.s"
    inst_s.write_text("\n".join(out))
    # instrumented assembly through the same integrated assembler (clang -c) and llvm-mc with retained temp labels
    inst_o = work / f"{tag}.inst.o"
    sh(["clang++-17", "-march=x86-64-v3", "-x", "assembler", "-c", str(inst_s), "-o", str(inst_o)], cwd=work)
    mc_o = work / f"{tag}.mc.o"
    sh(["llvm-mc-17", "-triple=x86_64-pc-linux-gnu", "-mcpu=x86-64-v3", "-filetype=obj", "-save-temp-labels",
        str(inst_s), "-o", str(mc_o)], cwd=work)
    # the instrumented object must be byte-identical in code to the real compile output
    def code_sig(o):
        names = [m.group(1) for m in re.finditer(r"^\s*\d+\s+(\.text\S*)\s", sh(["objdump", "-h", str(o)]).stdout.decode(), re.M)]
        body = b"".join(sh(["objdump", "-s", "-j", n, str(o)]).stdout.split(b"\n", 2)[2] for n in sorted(names))
        rel = sh(["objdump", "-r", str(o)]).stdout.split(b"\n", 2)[2]
        return sha(body + b"\0RELOC\0" + rel)
    real_sig, inst_sig, mc_sig = code_sig(real_o), code_sig(inst_o), code_sig(mc_o)
    assert real_sig == inst_sig == mc_sig, (src, "instrumentation changed assembled code", real_sig, inst_sig, mc_sig)
    secs, relocs, ilens = disasm(inst_o)
    syms = symbols(inst_o)
    mcsyms = symbols(mc_o)
    mcsym_by_src[src] = mcsyms
    mc_nm = sh(["nm", "-n", str(mc_o)]).stdout.decode()
    nm_ltmp = [l for l in mc_nm.splitlines() if ".Ltmp" in l]
    nm_sent = [l for l in sh(["nm", "-n", str(inst_o)]).stdout.decode().splitlines() if "hutblk_" in l]
    block_reports = []
    for k, (a, b) in enumerate(blocks):
        sec, saddr = syms[f"hutblk_{k}_start"]; sec2, eaddr = syms[f"hutblk_{k}_end"]
        assert sec == sec2 and saddr <= eaddr
        insns = secs[sec]
        boundaries = {x[0] for x in insns}
        inblock = [x for x in insns if saddr <= x[0] < eaddr]
        lens = {x[0]: x[1] for x in ilens[sec]}
        # the block must end exactly at an instruction boundary too
        end_ok = eaddr in boundaries or eaddr == max(lens) + lens[max(lens)]
        start_ok = saddr in boundaries
        mnems = sorted({x[1] for x in inblock})
        bad = [x for x in inblock if FORBIDDEN_MNEM.match(x[1]) or re.search(r"rcp|rsqrt", x[1])]
        branches = []
        for x in inblock:
            if BRANCH.match(x[1]):
                m = re.match(r"^([0-9a-f]+)\b", x[2])
                tgt = int(m.group(1), 16) if m and x[1].startswith("j") and x[1] != "jmpq" and not x[2].startswith("*") else None
                rel = [r for r in relocs.get(sec, []) if x[0] <= r[0] < x[0] + lens[x[0]]]
                branches.append({"addr": x[0], "mnemonic": x[1], "operands": x[2], "target": tgt,
                                 "insideBlock": tgt is not None and saddr <= tgt < eaddr,
                                 "targetOnInstructionBoundary": tgt in boundaries,
                                 "relocationOnBranch": bool(rel)})
        block_rel = [r for r in relocs.get(sec, []) if saddr <= r[0] < eaddr]
        # incoming edges from outside the block must not hit interior boundaries/mid-block either
        inbound = []
        for x in insns:
            if (x[0] < saddr or x[0] >= eaddr) and BRANCH.match(x[1]):
                m = re.match(r"^([0-9a-f]+)\b", x[2])
                if m and saddr < int(m.group(1), 16) < eaddr:
                    inbound.append({"from": x[0], "to": int(m.group(1), 16)})
        # labels retained by llvm-mc -save-temp-labels, resolved for the block
        block_reports.append({
            "index": k, "asmLines": [a + 1, b + 1], "section": sec, "start": saddr, "end": eaddr,
            "startOnBoundary": start_ok, "endOnBoundary": end_ok,
            "instructionCount": len(inblock), "mnemonics": mnems, "forbiddenMnemonicsFound": [x[1] for x in bad],
            "branches": branches, "relocationsInBlock": block_rel, "inboundBranchesIntoInterior": inbound,
            "bodySha256": sha("\n".join(lines[a + 1:b]).encode())})
    proofs.append({"source": src, "realObjectCodeSha256": real_sig, "instrumentedObjectCodeSha256": inst_sig,
                   "llvmMcObjectCodeSha256": mc_sig, "realObjectSha256": sha(real_o.read_bytes()),
                   "asmSha256": sha(sfile.read_bytes()), "instrumentedAsmSha256": sha(inst_s.read_bytes()),
                   "blockCount": len(blocks), "sentinelSymbols": nm_sent, "llvmMcRetainedTempLabels": nm_ltmp,
                   "blocks": block_reports})
    for f in (sfile, inst_s, real_o, inst_o, mc_o):
        d = OUT / "asm-proof"; d.mkdir(exist_ok=True)
        (d / f.name).write_bytes(f.read_bytes())
    (OUT / "asm-proof" / f"{tag}.objdump.txt").write_text(sh(["objdump", "-d", "-r", "-w", str(inst_o)]).stdout.decode())
    (OUT / "asm-proof" / f"{tag}.llvm-mc.nm.txt").write_text(mc_nm)
    (OUT / "asm-proof" / f"{tag}.inst.nm.txt").write_text(sh(["nm", "-n", str(inst_o)]).stdout.decode())

# ---- 4. match each compiler-emitted #APP body to a source allowlist entry and resolve labels
ALIAS = {"jz": "je", "jnz": "jne", "jc": "jb", "jnc": "jae"}
def src_shape(text):
    """Source asm string -> [(kind, token)] with numeric labels/branches kept symbolic."""
    rows = []
    for ln in text.split("\n"):
        s = re.sub(r"\s+", " ", ln.strip())
        if not s:
            continue
        if re.fullmatch(r"\d+:", s):
            rows.append(("label", s[:-1]))
        elif s.startswith("."):
            rows.append(("dir", s.split()[0]))
        else:
            mnem = s.split()[0]
            t = re.fullmatch(r"(j\w+) (\d+)[fb]", s)
            rows.append(("branch", ALIAS.get(mnem, mnem), t.group(2)) if t else ("insn", mnem))
    return rows
def emitted_shape(body):
    rows = []
    for ln in body:
        s = re.sub(r"\s*#.*$", "", re.sub(r"\s+", " ", ln.strip()))
        if not s:
            continue
        m = re.fullmatch(r"(\.Ltmp\d+):", s)
        if m:
            rows.append(("label", m.group(1)))
        elif s.startswith("."):
            rows.append(("dir", s.split()[0], s))
        else:
            parts = s.split()
            t = re.fullmatch(r"(j\w+) (\.Ltmp\d+)", s)
            rows.append(("branch", parts[0], t.group(2)) if t else ("insn", parts[0]))
    return rows
def canon(rows, labelmap):
    """Replace labels by their ordinal within the block so source and emitted shapes compare."""
    out = []
    for r in rows:
        if r[0] == "label":
            labelmap.setdefault(r[1], len(labelmap)); out.append(("label", labelmap[r[1]]))
        elif r[0] == "branch":
            out.append(("branch", r[1], r[2]))   # ordinal filled by caller after all labels are known
        elif r[0] == "dir":
            out.append(("dir", r[1]))
        else:
            out.append(r)
    return out
def ordinal_shape(rows):
    ords = {}
    for r in rows:
        if r[0] == "label":
            ords[r[1]] = len(ords)
    out = []
    for r in rows:
        if r[0] == "label": out.append(("label", ords[r[1]]))
        elif r[0] == "branch": out.append(("branch", ALIAS.get(r[1], r[1]), ords.get(r[2], "UNRESOLVED")))
        elif r[0] == "dir": out.append(("dir", r[1]))
        else: out.append(("insn", r[1]))
    return out
want = {e["sha256"]: ordinal_shape(src_shape(e["assembly"]["asm"])) for e in entries}
emitted = collections.Counter()
for p in proofs:
    sfile = work / f"{p['source'].replace('/', '_')}.s"
    lines = sfile.read_text().split("\n")
    mcs = mcsym_by_src[p["source"]]
    for blk in p["blocks"]:
        a, b = blk["asmLines"]
        body = [l for l in lines[a:b - 1]]
        rows = emitted_shape(body)
        blk["compilerEmittedDirectives"] = sorted({r[2] for r in rows if r[0] == "dir"})
        got = ordinal_shape(rows)
        match = [h for h, w in want.items() if w == got]
        blk["matchedAllowlistSha256"] = match
        assert len(match) == 1, (p["source"], blk["index"], got[:14])
        emitted[match[0]] += 1
        # compiler-emitted local labels/branches resolved against the assembled object (llvm-mc -save-temp-labels)
        labels = [r[1] for r in rows if r[0] == "label"]
        label_addr = {}
        for lab in labels:
            sec, addr = mcs[lab]
            label_addr[lab] = {"section": sec, "address": addr, "inBlock": sec == blk["section"] and blk["start"] <= addr < blk["end"]}
        blk["labels"] = label_addr
        asm_branches = [r for r in rows if r[0] == "branch"]
        assert len(asm_branches) == len(blk["branches"]), (p["source"], blk["index"], "branch count")
        checks = []
        for r, br in zip(asm_branches, blk["branches"]):
            L = label_addr.get(r[2])
            checks.append({"addr": br["addr"], "mnemonic": br["mnemonic"], "label": r[2], "labelAddress": L and L["address"],
                           "disassembledTarget": br["target"], "equal": bool(L) and L["address"] == br["target"]})
        blk["branchLabelChecks"] = checks
        blk["asmSourceNamedLabelOrder"] = "matched by ordinal shape"
unmatched_entries = [h for h in want if h not in emitted]

# ---- 5. verdict
problems = []
for p in proofs:
    for blk in p["blocks"]:
        if not (blk["startOnBoundary"] and blk["endOnBoundary"]): problems.append((p["source"], blk["index"], "block edge"))
        if blk["forbiddenMnemonicsFound"]: problems.append((p["source"], blk["index"], "forbidden mnemonic"))
        if blk["relocationsInBlock"]: problems.append((p["source"], blk["index"], "relocation inside block"))
        if blk["inboundBranchesIntoInterior"]: problems.append((p["source"], blk["index"], "outside branch into block"))
        for br in blk["branches"]:
            if not (br["insideBlock"] and br["targetOnInstructionBoundary"]) or br["relocationOnBranch"]:
                problems.append((p["source"], blk["index"], "branch", br))
        for c in blk["branchLabelChecks"]:
            if not c["equal"]: problems.append((p["source"], blk["index"], "branch label address mismatch", c))
        for lab in blk["labels"].values():
            if not lab["inBlock"]: problems.append((p["source"], blk["index"], "label outside block", lab))
        for d in blk["compilerEmittedDirectives"]:
            if d not in (".p2align 4, 0x90",): problems.append((p["source"], blk["index"], "directive", d))
        for m in blk["mnemonics"]:
            if not re.fullmatch(r"[a-z][a-z0-9]*", m): problems.append((p["source"], blk["index"], "mnemonic", m))
result = {
    "version": 1,
    "evalSha256": ev.EVAL_SHA256, "helperSha256": derivation["helperSha256"],
    "planCommands": sum(heads.values()), "planCommandHeads": dict(heads), "planNonTuCommands": non_tu,
    "translationUnits": len(units), "asmTranslationUnits": asm_tus,
    "sourceAudit": source_audit, "objectProofs": proofs,
    "emittedBlocksPerEntry": dict(emitted), "entriesWithoutEmittedBlock": unmatched_entries,
    "problems": problems,
}
(OUT / "asm-verification.json").write_text(json.dumps(result, indent=1, sort_keys=True) + "\n")
print("TUs", len(units), "asm TUs", asm_tus)
print("emitted blocks", sum(emitted.values()), dict(emitted))
print("branches", sum(len(b["branches"]) for p in proofs for b in p["blocks"]), "problems", len(problems), "unmatched", unmatched_entries)
