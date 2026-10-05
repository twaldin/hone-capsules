#!/usr/bin/env python3
"""Generate ordering and soundness overlays under diagnostics/ from the protected baseline.

  naive     lexth11c whose final returned probability is quantized to 16 bucket
            midpoints: bucket = clamp(trunc(p * 16), 0, 15), p = (bucket + 0.5) / 16.
            Every model and update is unchanged, including AddMatch. The coder sees
            a coarser probability, so bytes are worse than baseline.
  broken    lexth11c whose final probability is skewed by a recorded hash of the launch argc.
            cmix -S is argc 7 and cmix -D is argc 6 (runner.cpp). The kernel argc word is not
            rewritten. Recorded FNV-1a values (tools/diagnostics.sha256, and the constants
            below) are 0x5b1137e2 (-S) and 0xab3d76f3 (-D). The coder discretizes with
            1+65534*p, so the recorded 2991-bin gap cannot round-trip. Not an 8-bit page hash.
  improved  lexth11c with the layer-0 mixer learning rates x1.5 and the layer-1 rate x2.
  shortcut  lexth11c plus the first MEMO_BYTES of every PUBLIC train slice compiled into the
            binary. Huge train win; on hidden validation the memo only grows the decompressor.
  negative-control
            Encoder reads state that is not the archive (the staged slice.bin, and a side file
            it writes beside the archive) and emits near-certain probabilities, so the archive
            is tiny. A SysV shmget is attempted and ignored if the evaluator's seccomp returns
            EPERM, so the deny cannot block encode. The fresh decode container receives only
            the archive bytes, so the round trip is invalid.
  filesystem-control
            The same outside-archive encoder with no IPC call at all. Proves the handoff
            boundary (only archive bytes cross) even if a syscall deny would have stopped
            an IPC-only encode.
  direct-io-control
            Same outside-archive oracle as the cast-based controls, with ordinary
            direct calls only. stdio is reached by a token-paste macro so the AST
            sees fopen/fwrite; the lexical regex does not see fopen(. A direct
            shmget is attempted and ignored if seccomp returns EPERM. No dlsym,
            no function-pointer cast, no asm. Encode reads slice.bin in its own
            run directory and writes outside-archive.bin beside the archive. The
            fresh decode container receives only the archive. A rejection before
            decode is the recorded layer, not a round-trip proof.

The memo header (diagnostics/shortcut/src/models/train-memo.h) is derived from the public
train slices and is not committed; this script recreates it from assets/train.

usage: tools/make_diagnostics.py [--only naive]
"""
import hashlib
import re
import sys
from pathlib import Path

CAPSULE = Path(__file__).resolve().parent.parent
BASE = CAPSULE / "baseline"
DIAG = CAPSULE / "diagnostics"
MEMO_BYTES = 262144
TRAIN = ["train-02", "train-31", "train-875-census", "train-tail"]

# FNV-1a 32-bit of the four little-endian bytes of the launch argc.
# Recorded so a reviewer can check the skew without running the compressor.
RECORDED_ARGC_HASH = {6: 0xAB3D76F3, 7: 0x5B1137E2}
CODER_BINS = 65534
SKEW_MOD = 20000

# Same patterns as baseline/eval.py FORBIDDEN_SOURCE. The soundness overlays must
# pass this gate so encode actually emits an archive; kernel confinement is the boundary.
FORBIDDEN_SOURCE = [
    (re.compile(r"\b(fopen|freopen|fdopen|popen|open|openat|creat|system|fork|vfork|clone|execv|execve|"
                r"execvp|execl|execlp|execle|posix_spawn|mmap|syscall|dlopen|getenv|secure_getenv|socket|"
                r"pthread_create|sched_setaffinity|ptrace|setrlimit|prctl|signal|sigaction|readlink|"
                r"opendir|getrusage|clock_gettime|gettimeofday|time|clock|rdtsc|__rdtsc)\s*\("),
     "I/O, process, time or environment call"),
    (re.compile(r"\bstd::(thread|jthread|async|ifstream|ofstream|fstream|filesystem|getenv|system|chrono)\b"),
     "std I/O, thread or clock"),
    (re.compile(r"\b(asm|__asm__|__asm)\b"), "inline assembly"),
    (re.compile(r"_mm\d*_(mask_|maskz_)?(rcp|rsqrt)\w*"), "reciprocal/rsqrt estimate intrinsic"),
    (re.compile(r"__builtin_ia32_(rcp|rsqrt)\w*"), "reciprocal/rsqrt estimate builtin"),
    (re.compile(r"#\s*(include|embed)\s*[<\"](fstream|thread|future|unistd\.h|fcntl\.h|sys/|dlfcn\.h|pthread\.h|"
                r"filesystem|chrono|ctime|time\.h|spawn\.h|signal\.h|csignal|/|\.\./)"), "forbidden include"),
    (re.compile(r"#\s*embed\b|\.incbin\b"), "embedded file"),
    (re.compile(r"__attribute__\s*\(\(\s*(target|constructor|destructor)"), "target/constructor attribute"),
    (re.compile(r"#\s*pragma\s+(GCC|clang)\s+(target|optimize)"), "target/optimize pragma"),
]


def fnv1a_argc(argc: int) -> int:
    h = 2166136261
    for i in range(4):
        h ^= (argc >> (8 * i)) & 0xFF
        h = (h * 16777619) & 0xFFFFFFFF
    return h


def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
    return re.sub(r"//[^\n]*", "", text)


def gate_problems(old: str, new: str) -> list[str]:
    old_lines = {line.strip() for line in strip_comments(old).splitlines()}
    problems = []
    for number, line in enumerate(strip_comments(new).splitlines(), 1):
        if line.strip() in old_lines:
            continue
        for pattern, what in FORBIDDEN_SOURCE:
            if pattern.search(line):
                problems.append(f"{number}: {what}: {line.strip()[:120]}")
    return problems


def replace_once(text: str, old: str, new: str, what: str) -> str:
    if text.count(old) != 1:
        sys.exit(f"{what}: expected exactly one occurrence of {old!r}")
    return text.replace(old, new)


def write(variant: str, rel: str, text: str) -> None:
    path = DIAG / variant / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def skew_shift(hash_value: int) -> float:
    return (2.0 + (hash_value % SKEW_MOD)) / CODER_BINS


def skew(p: float, hash_value: int) -> float:
    shift = skew_shift(hash_value)
    out = p + shift
    if out >= 0.9999:
        out = p - shift
    if out <= 0.0001:
        out = 0.0001 + shift
    if out >= 0.9999:
        out = 0.9999
    return out


def discretize(p: float) -> int:
    return 1 + int(CODER_BINS * p)


def assert_recorded_skew() -> None:
    for argc, recorded in RECORDED_ARGC_HASH.items():
        if fnv1a_argc(argc) != recorded:
            sys.exit(f"recorded argc hash drifted for {argc}")
    gap = abs((RECORDED_ARGC_HASH[7] % SKEW_MOD) - (RECORDED_ARGC_HASH[6] % SKEW_MOD))
    if gap < 1:
        sys.exit("recorded hashes land in the same coder bin")
    for step in range(0, 10001):
        p = step / 10000
        if discretize(skew(p, RECORDED_ARGC_HASH[6])) == discretize(skew(p, RECORDED_ARGC_HASH[7])):
            sys.exit(f"recorded skew collides at p={p}")
    print(f"recorded argc hashes: -D {RECORDED_ARGC_HASH[6]:08x} -S {RECORDED_ARGC_HASH[7]:08x} "
          f"bin gap {gap}")


def certain_payload_bytes(nbits: int) -> int:
    """Bytes the arithmetic coder emits for near-certain bits (encoder.cpp Encode)."""
    x1, x2 = 0, 0xFFFFFFFF
    out = 0
    for i in range(nbits):
        bit = 1 if (i & 7) != 0 else 0
        p = discretize(0.9999 if bit else 0.0001)
        span = (x2 - x1) & 0xFFFFFFFF
        xmid = (x1 + ((span >> 16) * p) + (((span & 0xFFFF) * p) >> 16)) & 0xFFFFFFFF
        if bit:
            x2 = xmid
        else:
            x1 = (xmid + 1) & 0xFFFFFFFF
        while ((x1 ^ x2) & 0xFF000000) == 0:
            out += 1
            x1 = (x1 << 8) & 0xFFFFFFFF
            x2 = ((x2 << 8) + 255) & 0xFFFFFFFF
    return out


def assert_tiny_certain_archive() -> None:
    sample = certain_payload_bytes(80_000)
    # 1,467,847-byte slice is 11,742,776 bits. Linear extrapolation plus the 37-byte header.
    payload = sample * (11_742_776 / 80_000)
    if payload > 4096:
        sys.exit(f"certain-probability payload extrapolates to {payload:.0f} B, not tiny")
    print(f"certain-probability payload estimate {payload:.0f} B plus header, under 4096 B")


BROKEN_HELPER = r"""
extern "C" char **environ;
namespace {
// Recorded FNV-1a of the launch argc. -S is 7, -D is 6. Not a page hash.
static const unsigned kRecordedHashArgc6 = 0xab3d76f3u;
static const unsigned kRecordedHashArgc7 = 0x5b1137e2u;

static int LaunchArgc() {
  const char **p = const_cast<const char **>(environ);
  if (p == nullptr || p[-1] != nullptr) return 0;
  --p;
  while (reinterpret_cast<unsigned long>(p[-1]) > 0x10000ul) --p;
  return static_cast<int>(reinterpret_cast<unsigned long>(p[-1]));
}

static unsigned RecordedModeHash(int argc) {
  if (argc == 6) return kRecordedHashArgc6;
  if (argc == 7) return kRecordedHashArgc7;
  // runner.cpp rejects any other -S/-D argc, and nothing calls setenv, so this
  // is not reached in evaluation. Fail rather than skew from a return address
  // that would be the same in both processes if this function is not inlined.
  Fail("broken diagnostic: launch argc is not 6 or 7");
  return 0;
}

static float BrokenSkew(float p) {
  const float bins = 2.0f + static_cast<float>(RecordedModeHash(LaunchArgc()) % 20000u);
  const float shift = bins / 65534.0f;
  float out = p + shift;
  if (out >= 0.9999f) out = p - shift;
  if (out <= 0.0001f) out = 0.0001f + shift;
  if (out >= 0.9999f) out = 0.9999f;
  if (out <= 0.0001f) out = 0.0001f;
  return out;
}
}  // namespace
"""

OUTSIDE_HELPER = r"""
extern "C" char **environ;
namespace {
// Soundness control, not a candidate improvement. The bytes that make the archive
// tiny live outside it: slice.bin in the encode workdir, and outside-archive.bin
// written beside the archive. The decode container is given only the archive, so
// this returns the model probability and the arithmetic decoder desynchronises.
// shmget is optional. Evaluator seccomp returns EPERM; that must not fail encode.
struct OutsideState {
  const unsigned char *bytes;
  unsigned long long n;
  unsigned long long bit;
  int loaded;
};
static OutsideState g_outside = {nullptr, 0, 0, 0};

using OutsideOpen = int (*)(const char *, int, unsigned);
using OutsideRead = long (*)(int, void *, unsigned long);
using OutsideWrite = long (*)(int, const void *, unsigned long);
extern "C" void *dlsym(void *, const char *);
extern "C" int close(int);
extern "C" void *malloc(unsigned long);
__IPC_DECL__

template <typename Fn>
static Fn Resolve(const char *name) {
  return reinterpret_cast<Fn>(dlsym(reinterpret_cast<void *>(-1L), name));
}

static int LoadOutside(const char *path, const unsigned char **out, unsigned long long *n) {
  OutsideOpen open_fn = Resolve<OutsideOpen>("open");
  OutsideRead read_fn = Resolve<OutsideRead>("read");
  if (open_fn == nullptr || read_fn == nullptr) return 0;
  int fd = open_fn(path, 0, 0);
  if (fd < 0) return 0;
  unsigned char *buf = nullptr;
  unsigned long long len = 0, cap = 0;
  unsigned char tmp[1 << 16];
  for (;;) {
    long got = read_fn(fd, tmp, sizeof(tmp));
    if (got < 0) { close(fd); return 0; }
    if (got == 0) break;
    if (len + static_cast<unsigned long long>(got) > cap) {
      unsigned long long ncap = cap ? cap * 2 : (1ul << 20);
      while (ncap < len + static_cast<unsigned long long>(got)) ncap *= 2;
      unsigned char *grown = static_cast<unsigned char *>(malloc(ncap));
      if (grown == nullptr) { close(fd); return 0; }
      if (buf != nullptr) memcpy(grown, buf, static_cast<size_t>(len));
      buf = grown;
      cap = ncap;
    }
    memcpy(buf + len, tmp, static_cast<size_t>(got));
    len += static_cast<unsigned long long>(got);
  }
  close(fd);
  if (len == 0) return 0;
  *out = buf;
  *n = len;
  return 1;
}

static void PublishOutside(const unsigned char *bytes, unsigned long long n) {
  OutsideOpen open_fn = Resolve<OutsideOpen>("open");
  OutsideWrite write_fn = Resolve<OutsideWrite>("write");
  if (open_fn == nullptr || write_fn == nullptr) return;
  int fd = open_fn("outside-archive.bin", 577, 420);
  if (fd < 0) return;
  unsigned long long off = 0;
  while (off < n) {
    long wrote = write_fn(fd, bytes + off, n - off);
    if (wrote <= 0) break;
    off += static_cast<unsigned long long>(wrote);
  }
  close(fd);
}

static void NoteIpcDenied() {
__IPC_BODY__
}

static void LoadOutsideOnce(unsigned long long expect) {
  if (g_outside.loaded) return;
  g_outside.loaded = 1;
  NoteIpcDenied();
  const unsigned char *bytes = nullptr;
  unsigned long long n = 0;
  if (!LoadOutside("slice.bin", &bytes, &n) && !LoadOutside("outside-archive.bin", &bytes, &n)) return;
  if (expect != 0 && n != expect) return;
  g_outside.bytes = bytes;
  g_outside.n = n;
  PublishOutside(bytes, n);
}

static int LaunchArgcOutside() {
  const char **p = const_cast<const char **>(environ);
  if (p == nullptr || p[-1] != nullptr) return 0;
  --p;
  while (reinterpret_cast<unsigned long>(p[-1]) > 0x10000ul) --p;
  return static_cast<int>(reinterpret_cast<unsigned long>(p[-1]));
}

static float OutsideOrModel(float p, unsigned long long expect) {
  const int argc = LaunchArgcOutside();
  LoadOutsideOnce(argc == 6 ? 0ull : expect);
  if (argc == 7 && g_outside.bytes == nullptr) {
    Fail("negative-control encode could not read state outside the archive");
  }
  if (g_outside.bytes == nullptr || (g_outside.bit >> 3) >= g_outside.n) return p;
  const int bit = (g_outside.bytes[g_outside.bit >> 3] >> (7 - static_cast<int>(g_outside.bit & 7))) & 1;
  return bit ? 0.9999f : 0.0001f;
}

static void OutsideAdvance() {
  if (g_outside.bytes != nullptr) ++g_outside.bit;
}
}  // namespace
"""

IPC_DECL = "extern \"C\" int shmget(int, unsigned long, int);\n"
IPC_BODY = """  // 0x48555454, 4096 bytes, IPC_CREAT|0666. EPERM under seccomp is success for this control.
  if (shmget(0x48555454, 4096, 950) < 0) return;
"""
NO_IPC_DECL = ""
NO_IPC_BODY = "  // Filesystem boundary only: no SysV call, so an IPC deny cannot block encode.\n"


def outside_helper(ipc: bool) -> str:
    return (OUTSIDE_HELPER
            .replace("__IPC_DECL__", IPC_DECL if ipc else NO_IPC_DECL)
            .replace("__IPC_BODY__", IPC_BODY if ipc else NO_IPC_BODY))


RETURN_OLD = """  if (byte_mixer_override >= 0) {
    return byte_mixer_override;
  }
  return p;
}
"""


def broken_returns() -> str:
    return """  float returned = byte_mixer_override >= 0 ? byte_mixer_override : p;
  return BrokenSkew(returned);
}
"""


def outside_returns() -> str:
    return """  float returned = byte_mixer_override >= 0 ? byte_mixer_override : p;
  return OutsideOrModel(returned, num_input_bytes_);
}
"""


def apply_outside(predictor: str, ipc: bool, what: str) -> str:
    text = replace_once(predictor, "float Predictor::Predict() {\n",
                        outside_helper(ipc) + "float Predictor::Predict() {\n", what + "/helper")
    text = replace_once(text, RETURN_OLD, outside_returns(), what + "/return")
    text = replace_once(text, "void Predictor::Perceive(int bit) {\n",
                        "void Predictor::Perceive(int bit) {\n  OutsideAdvance();\n", what + "/perceive")
    problems = gate_problems(predictor, text)
    if problems:
        sys.exit(what + " fails the source gate:\n" + "\n".join(problems))
    return text

DIRECT_HELPER = r"""
extern "C" char **environ;
extern "C" int shmget(int, unsigned long, int);
#define HUTTER_DIRECT_JOIN(a, b) a##b
#define HUTTER_DIRECT_OPEN HUTTER_DIRECT_JOIN(fop, en)
namespace {
// Direct-call soundness control. The token-paste macro expands to an ordinary
// stdio open. The IPC attempt is an ordinary shmget call.
struct DirectState {
  std::vector<unsigned char> bytes;
  unsigned long long bit;
  int loaded;
  int have;
};
static DirectState g_direct;

static int LaunchArgcDirect() {
  const char **p = const_cast<const char **>(environ);
  if (p == nullptr || p[-1] != nullptr) return 0;
  --p;
  while (reinterpret_cast<unsigned long>(p[-1]) > 0x10000ul) --p;
  return static_cast<int>(reinterpret_cast<unsigned long>(p[-1]));
}

static void NoteIpcDenied() {
  // 0x48555454, 4096 bytes, IPC_CREAT|0666. EPERM under seccomp is success here.
  // Decode also runs in a new IPC namespace, so this segment is not its input.
  if (shmget(0x48555454, 4096, 950) < 0) return;
}

static int LoadDirect(const char *path, std::vector<unsigned char> *out) {
  FILE *file = HUTTER_DIRECT_OPEN(path, "rb");
  if (file == nullptr) return 0;
  if (fseeko(file, 0, SEEK_END) != 0) { fclose(file); return 0; }
  long long size = ftello(file);
  if (size <= 0) { fclose(file); return 0; }
  if (fseeko(file, 0, SEEK_SET) != 0) { fclose(file); return 0; }
  out->resize(static_cast<size_t>(size));
  size_t got = fread(out->data(), 1, out->size(), file);
  fclose(file);
  if (got != out->size()) { out->clear(); return 0; }
  return 1;
}

static int StoreDirect(const char *path, const std::vector<unsigned char> &bytes) {
  FILE *file = HUTTER_DIRECT_OPEN(path, "wb");
  if (file == nullptr) return 0;
  size_t put = fwrite(bytes.data(), 1, bytes.size(), file);
  fclose(file);
  return put == bytes.size();
}

static void LoadDirectOnce(unsigned long long expect) {
  if (g_direct.loaded) return;
  g_direct.loaded = 1;
  NoteIpcDenied();
  std::vector<unsigned char> buf;
  if (!LoadDirect("slice.bin", &buf) && !LoadDirect("outside-archive.bin", &buf)) return;
  if (expect != 0 && buf.size() != static_cast<size_t>(expect)) return;
  if (!StoreDirect("outside-archive.bin", buf)) return;
  g_direct.bytes.swap(buf);
  g_direct.have = 1;
}

static float DirectOrModel(float p, unsigned long long expect) {
  const int argc = LaunchArgcDirect();
  LoadDirectOnce(argc == 6 ? 0ull : expect);
  if (argc == 7 && !g_direct.have) {
    Fail("direct-io-control encode could not read state outside the archive");
  }
  if (!g_direct.have || (g_direct.bit >> 3) >= g_direct.bytes.size()) return p;
  const int bit = (g_direct.bytes[g_direct.bit >> 3] >> (7 - static_cast<int>(g_direct.bit & 7))) & 1;
  return bit ? 0.9999f : 0.0001f;
}

static void DirectAdvance() {
  if (g_direct.have) ++g_direct.bit;
}
}  // namespace
"""


def direct_returns() -> str:
    return """  float returned = byte_mixer_override >= 0 ? byte_mixer_override : p;
  return DirectOrModel(returned, num_input_bytes_);
}
"""


def apply_direct(predictor: str) -> str:
    text = replace_once(predictor, "float Predictor::Predict() {\n",
                        DIRECT_HELPER + "float Predictor::Predict() {\n", "direct-io-control/helper")
    text = replace_once(text, RETURN_OLD, direct_returns(), "direct-io-control/return")
    text = replace_once(text, "void Predictor::Perceive(int bit) {\n",
                        "void Predictor::Perceive(int bit) {\n  DirectAdvance();\n",
                        "direct-io-control/perceive")
    if "dlsym" in text or "__asm" in text or "reinterpret_cast<Fn>" in text:
        sys.exit("direct-io-control contains a forbidden cast, dlsym, or asm")
    problems = gate_problems(predictor, text)
    if problems:
        sys.exit("direct-io-control fails the source gate:\n" + "\n".join(problems))
    return text




SMOKE = r"""// Generated by tools/make_diagnostics.py. Local defensive proof of the outside-archive
// control: tiny archive, shared side state round-trips, fresh directory with only the
// archive does not. Optional seccomp EPERM on shmget must not block encode.
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <unistd.h>
#include <sys/syscall.h>
#include <linux/seccomp.h>
#include <linux/filter.h>
#include <linux/audit.h>
#include <sys/prctl.h>
#include <errno.h>

static int g_failures = 0;
static void expect(int cond, const char *what) {
  if (!cond) { fprintf(stderr, "FAIL %s\n", what); ++g_failures; }
  else fprintf(stderr, "ok %s\n", what);
}

static void Fail(const char *msg) {
  fprintf(stderr, "%s\n", msg);
  exit(2);
}

__HELPER__

static void write_file(const char *path, const unsigned char *bytes, unsigned long n) {
  FILE *f = fopen(path, "wb");
  if (!f || fwrite(bytes, 1, n, f) != n) { perror(path); exit(2); }
  fclose(f);
}

static int install_shm_deny() {
  struct sock_filter filt[] = {
    BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 4),
    BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, AUDIT_ARCH_X86_64, 1, 0),
    BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL_PROCESS),
    BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 0),
    BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 29, 0, 1),
    BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ERRNO | EPERM),
    BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
  };
  struct sock_fprog prog = { sizeof(filt) / sizeof(filt[0]), filt };
  if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) != 0) return -1;
  if (syscall(SYS_seccomp, SECCOMP_SET_MODE_FILTER, 0, &prog) != 0) return -1;
  return 0;
}

int main(int argc, char **argv) {
  (void)argc; (void)argv;
  char dir[] = "/tmp/hutter-outside-XXXXXX";
  if (!mkdtemp(dir)) { perror("mkdtemp"); return 2; }
  if (chdir(dir) != 0) { perror("chdir"); return 2; }
  unsigned char payload[64];
  for (int i = 0; i < 64; ++i) payload[i] = static_cast<unsigned char>(i * 17 + 3);
  write_file("slice.bin", payload, sizeof(payload));
  if (install_shm_deny() != 0) { perror("seccomp"); return 2; }
  LoadOutsideOnce(sizeof(payload));
  expect(g_outside.bytes != nullptr, "encode read state outside the archive under shm EPERM");
  expect(g_outside.n == sizeof(payload), "encode length matches the slice");
  expect(memcmp(g_outside.bytes, payload, sizeof(payload)) == 0, "encode bytes match");
  FILE *arch = fopen("archive.bin", "wb");
  unsigned char header[8] = {'H','N','E','G', 64, 0, 0, 0};
  expect(arch && fwrite(header, 1, 8, arch) == 8, "tiny archive of 8 bytes");
  if (arch) fclose(arch);
  FILE *side = fopen("outside-archive.bin", "rb");
  expect(side != nullptr, "side file published beside the archive");
  if (side) fclose(side);

  char iso[] = "/tmp/hutter-iso-XXXXXX";
  if (!mkdtemp(iso)) { perror("mkdtemp"); return 2; }
  char cmd[512];
  snprintf(cmd, sizeof(cmd), "cp %s/archive.bin %s/in.cmix", dir, iso);
  if (system(cmd) != 0) return 2;
  if (chdir(iso) != 0) return 2;
  g_outside = {nullptr, 0, 0, 0};
  LoadOutsideOnce(0);
  expect(g_outside.bytes == nullptr, "fresh directory with only the archive has no outside state");
  unsigned char recovered[64];
  int isolated_ok = g_outside.bytes != nullptr && g_outside.n == sizeof(payload)
      && memcmp(g_outside.bytes, payload, sizeof(payload)) == 0;
  expect(!isolated_ok, "isolated decoder cannot recover the payload");
  (void)recovered;

  char shared[] = "/tmp/hutter-shared-XXXXXX";
  if (!mkdtemp(shared)) return 2;
  snprintf(cmd, sizeof(cmd), "cp %s/archive.bin %s/in.cmix && cp %s/outside-archive.bin %s/outside-archive.bin",
           dir, shared, dir, shared);
  if (system(cmd) != 0) return 2;
  if (chdir(shared) != 0) return 2;
  g_outside = {nullptr, 0, 0, 0};
  LoadOutsideOnce(0);
  expect(g_outside.bytes != nullptr && g_outside.n == sizeof(payload)
             && memcmp(g_outside.bytes, payload, sizeof(payload)) == 0,
         "same side file round-trips, so the tiny archive alone is insufficient");
  if (g_failures) {
    fprintf(stderr, "%d failure(s)\n", g_failures);
    return 1;
  }
  fprintf(stderr, "outside-archive smoke passed\n");
  return 0;
}
"""


def write_smoke() -> None:
    text = SMOKE.replace("__HELPER__", outside_helper(True))
    path = CAPSULE / "tools" / "outside_archive_smoke.cpp"
    path.write_text(text)


def record_hashes() -> None:
    lines = []
    for path in sorted(DIAG.rglob("*")):
        if not path.is_file():
            continue
        rel = path.relative_to(CAPSULE).as_posix()
        if rel.endswith("train-memo.h") or rel.startswith("diagnostics/exploratory-addmatch-removal/"):
            continue
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        lines.append(f"{digest}  {rel}")
    text = "\n".join(lines) + "\n"
    (CAPSULE / "tools" / "diagnostics.sha256").write_text(text)
    print(f"recorded {len(lines)} diagnostic hashes in tools/diagnostics.sha256")


NAIVE_REL = "diagnostics/naive/src/predictor.cpp"

NAIVE_HELPER = r"""namespace {
// Naive ordering diagnostic. Only the probability returned to the arithmetic
// coder is coarsened. Models, mixer inputs, and Perceive updates stay on the
// unquantized prediction, and AddMatch remains. Sixteen equal buckets:
// bucket = clamp(trunc(p * 16), 0, 15); result = (bucket + 0.5) / 16.
// Ordinary compiler truncation: no assembly and no cast.
float QuantizeFinalPrediction(float p) {
  int bucket = p * 16.0f;
  if (bucket < 0) bucket = 0;
  if (bucket > 15) bucket = 15;
  return (bucket + 0.5f) / 16.0f;
}
}  // namespace
"""

NAIVE_EARLY_OLD = """    if (p < 0.001f) p = 0.001f;
    if (p > 0.999f) p = 0.999f;
    return p;
"""

NAIVE_EARLY_NEW = """    if (p < 0.001f) p = 0.001f;
    if (p > 0.999f) p = 0.999f;
    // The 0.001 clamp still runs. Only this returned coder input is quantized.
    return QuantizeFinalPrediction(p);
"""


def naive_returns() -> str:
    return """  // Both final exits: coder input only. Mixers and SSE already used unquantized p.
  if (byte_mixer_override >= 0) {
    return QuantizeFinalPrediction(byte_mixer_override);
  }
  return QuantizeFinalPrediction(p);
}
"""


def naive_overlay(predictor: str) -> str:
    if predictor.count("  AddMatch();\n") != 1:
        sys.exit("naive: baseline must keep exactly one AddMatch() call")
    text = replace_once(predictor, "float Predictor::Predict() {\n",
                        NAIVE_HELPER + "float Predictor::Predict() {\n", "naive/helper")
    text = replace_once(text, NAIVE_EARLY_OLD, NAIVE_EARLY_NEW, "naive/early-return")
    text = replace_once(text, RETURN_OLD, naive_returns(), "naive/final-return")
    if text.count("  AddMatch();\n") != 1:
        sys.exit("naive: AddMatch was changed")
    if text.count("QuantizeFinalPrediction(") != 4:
        sys.exit("naive: expected the helper and both Predict return paths")
    added = strip_comments(text)
    for banned in ("asm", "__asm__", "static_cast", "reinterpret_cast", "dynamic_cast", "const_cast"):
        if banned in added and banned not in strip_comments(predictor):
            sys.exit(f"naive: inserted {banned}")
    problems = gate_problems(predictor, text)
    if problems:
        sys.exit("naive fails the source gate:\n" + "\n".join(problems))
    return text


def update_naive_pin(digest: str) -> None:
    pin = CAPSULE / "tools" / "diagnostics.sha256"
    lines = pin.read_text().splitlines()
    found = False
    out = []
    for line in lines:
        parts = line.split()
        if len(parts) == 2 and parts[1] == NAIVE_REL:
            out.append(f"{digest}  {NAIVE_REL}")
            found = True
        else:
            out.append(line)
    if not found:
        sys.exit(f"pin missing {NAIVE_REL}")
    pin.write_text("\n".join(out) + "\n")


def write_naive_only() -> None:
    predictor = (BASE / "src" / "predictor.cpp").read_text()
    text = naive_overlay(predictor)
    write("naive", "src/predictor.cpp", text)
    written = (DIAG / "naive" / "src" / "predictor.cpp").read_bytes()
    if written != text.encode():
        sys.exit("naive: written bytes differ from the generated text")
    digest = hashlib.sha256(written).hexdigest()
    update_naive_pin(digest)
    print(f"naive {digest}")


def main() -> None:
    assert_recorded_skew()
    assert_tiny_certain_archive()
    predictor = (BASE / "src" / "predictor.cpp").read_text()
    if ">> 12) & 0xff" in predictor:
        sys.exit("baseline predictor unexpectedly contains the narrow page hash")

    write("naive", "src/predictor.cpp", naive_overlay(predictor))

    broken = replace_once(predictor, "float Predictor::Predict() {\n",
                          BROKEN_HELPER + "float Predictor::Predict() {\n", "broken/helper")
    broken = replace_once(broken, RETURN_OLD, broken_returns(), "broken/return")
    if ">> 12) & 0xff" in broken or "0xff) / 255" in broken:
        sys.exit("broken diagnostic still contains the 8-bit page hash")
    if f"{RECORDED_ARGC_HASH[6]:08x}" not in broken or f"{RECORDED_ARGC_HASH[7]:08x}" not in broken:
        sys.exit("broken diagnostic missing a recorded argc hash")
    problems = gate_problems(predictor, broken)
    if problems:
        sys.exit("broken fails the source gate:\n" + "\n".join(problems))
    write("broken", "src/predictor.cpp", broken)

    improved = replace_once(predictor, "  if (layer == 0) learning_rate *= CMIX_L0_LR_SCALE;\n",
                            "  if (layer == 0) learning_rate *= CMIX_L0_LR_SCALE * 1.5f;\n", "improved/l0")
    improved = replace_once(improved, "  AddMixer(1,manager_.zero_context_, 0.0003);\n",
                            "  AddMixer(1,manager_.zero_context_, 0.0006);\n", "improved/l1")
    write("improved", "src/predictor.cpp", improved)

    shortcut = replace_once(predictor, '#include "predictor.h"\n',
                            '#include "predictor.h"\n#include "models/train-memo.h"\n', "shortcut/include")
    shortcut = replace_once(
        shortcut, "float byte_mixer_output=0.0f;\n",
        "float byte_mixer_output=0.0f;\n"
        "// Shortcut: the public train slices, memorised. memo_mask = train slices that still match the\n"
        "// input; memo_bit = bits seen so far.\n"
        "static unsigned memo_mask = (1u << kMemoCount) - 1;\n"
        "static unsigned long long memo_bit = 0;\n"
        "static float MemoOverride(float p) {\n"
        "  if (memo_mask == 0 || memo_bit >= 8ULL * kMemoLen) return p;\n"
        "  int agreed = -1;\n"
        "  for (unsigned k = 0; k < kMemoCount; ++k) {\n"
        "    if (!((memo_mask >> k) & 1)) continue;\n"
        "    int b = (kMemo[k][memo_bit >> 3] >> (7 - (memo_bit & 7))) & 1;\n"
        "    if (agreed == -1) agreed = b; else if (agreed != b) return p;\n"
        "  }\n"
        "  return agreed ? 0.9999f : 0.0001f;\n"
        "}\n"
        "static void MemoPerceive(int bit) {\n"
        "  if (memo_mask == 0) return;\n"
        "  if (memo_bit >= 8ULL * kMemoLen) { memo_mask = 0; return; }\n"
        "  for (unsigned k = 0; k < kMemoCount; ++k) {\n"
        "    if (((kMemo[k][memo_bit >> 3] >> (7 - (memo_bit & 7))) & 1) != bit) memo_mask &= ~(1u << k);\n"
        "  }\n"
        "  ++memo_bit;\n"
        "}\n",
        "shortcut/state")
    shortcut = replace_once(shortcut, "    return byte_mixer_override;\n",
                            "    return MemoOverride(byte_mixer_override);\n", "shortcut/override1")
    shortcut = replace_once(shortcut, "  }\n  return p;\n}\n\nvoid Predictor::WritePpmdProbs() {",
                            "  }\n  return MemoOverride(p);\n}\n\nvoid Predictor::WritePpmdProbs() {",
                            "shortcut/override2")
    shortcut = replace_once(
        shortcut,
        "  bracket_model_->Perceive(bit);\n\n  for (unsigned int i = 0; i < direct_models_.size(); ++i) {\n",
        "  MemoPerceive(bit);\n  bracket_model_->Perceive(bit);\n\n  for (unsigned int i = 0; i < direct_models_.size(); ++i) {\n",
        "shortcut/perceive")
    write("shortcut", "src/predictor.cpp", shortcut)

    train_dir = CAPSULE / "assets" / "train"
    if all((train_dir / f"{name}.bin").is_file() for name in TRAIN):
        lines = [f"// Generated by tools/make_diagnostics.py: the first {MEMO_BYTES} bytes of each public train slice.",
                 "#pragma once", f"static const unsigned kMemoCount = {len(TRAIN)};",
                 f"static const unsigned kMemoLen = {MEMO_BYTES};",
                 f"static const unsigned char kMemo[{len(TRAIN)}][{MEMO_BYTES}] = {{"]
        for name in TRAIN:
            data = (train_dir / f"{name}.bin").read_bytes()[:MEMO_BYTES]
            if len(data) != MEMO_BYTES:
                sys.exit(f"{name} shorter than {MEMO_BYTES}")
            lines.append("{")
            for i in range(0, MEMO_BYTES, 64):
                lines.append(",".join(str(b) for b in data[i:i + 64]) + ",")
            lines.append("},")
        lines.append("};")
        write("shortcut", "src/models/train-memo.h", "\n".join(lines) + "\n")
    else:
        print("assets/train missing; left shortcut memo ungenerated (not committed)")

    write("negative-control", "src/predictor.cpp", apply_outside(predictor, True, "negative-control"))
    write("filesystem-control", "src/predictor.cpp", apply_outside(predictor, False, "filesystem-control"))
    write("direct-io-control", "src/predictor.cpp", apply_direct(predictor))
    write_smoke()
    record_hashes()
    print("wrote", ", ".join(str(p.relative_to(CAPSULE)) for p in sorted(DIAG.rglob("*")) if p.is_file()))


if __name__ == "__main__":
    if sys.argv[1:] == ["--only", "naive"]:
        write_naive_only()
    elif sys.argv[1:]:
        sys.exit("usage: tools/make_diagnostics.py [--only naive]")
    else:
        main()
