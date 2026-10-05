#!/usr/bin/env python3
"""Run the protected native AST helper on every protected-makefile TU of the unmodified baseline."""
import hashlib, importlib.util, json, subprocess, sys, os
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
T = Path("/trusted/baseline")
spec = importlib.util.spec_from_file_location("hut_eval", T / "eval.py")
ev = importlib.util.module_from_spec(spec); spec.loader.exec_module(ev)
helper = T / "hone/asm-audit"
units = ev.translation_units(T)
env = {"PATH": "/usr/bin:/bin", "HOME": str(T), "LC_ALL": "C", "TMPDIR": "/tmp"}
def run(u):
    source, flags = u
    d = subprocess.run([str(helper), str(T), source, "--", *flags, "-resource-dir=/usr/lib/llvm-17/lib/clang/17"],
                       cwd=T, env=env, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1800)
    return source, flags, d.returncode, d.stdout.decode(), d.stderr.decode()
with ThreadPoolExecutor(4) as ex: res = list(ex.map(run, units))
out = {"evalSha256": ev.EVAL_SHA256, "helperSha256": ev.sha256_file(helper), "units": [], "problems": []}
entries = {}
for source, flags, rc, so, se in res:
    if rc != 0:
        sys.exit(f"AST helper failed on {source} (rc={rc}): {se[:500]}")
    rep = json.loads(so)
    out["units"].append({"source": source, "flags": flags, "rc": rc, "stderrSha256": hashlib.sha256(se.encode()).hexdigest(),
                         "stderrBytes": len(se), "problems": rep["problems"], "statements": len(rep["assembly"]),
                         "stdoutSha256": hashlib.sha256(so.encode()).hexdigest()})
    for p in rep["problems"]: out["problems"].append([source, p])
    for st in rep["assembly"]:
        h = ev.assembly_digest(st)
        e = entries.setdefault(h, {"sha256": h, "assembly": ev.assembly_record(st), "locations": [], "units": []})
        loc = {"file": os.path.relpath(st["file"], T), "line": st["line"]}
        if loc not in e["locations"]: e["locations"].append(loc)
        e["units"].append(source)
out["observedStatements"] = sum(u["statements"] for u in out["units"])
out["entries"] = sorted(entries.values(), key=lambda e: e["sha256"])
Path("/out/helper-derivation.json").write_text(json.dumps(out, indent=1, sort_keys=True) + "\n")
print(len(units), "TUs", out["observedStatements"], "statements", len(entries), "unique", len(out["problems"]), "problems",
      sum(1 for u in out["units"] if u["rc"]))
