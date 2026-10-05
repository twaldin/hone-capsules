import copy, hashlib, importlib.util, json, pathlib, tempfile
home=pathlib.Path.home(); dev=home/'hutter/capsule-dev'; cap=home/'hutter/hone-capsules/capsules/hutter-enwik9'
spec=importlib.util.spec_from_file_location('calibration',dev/'calibrate.py'); mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
challenge=json.loads((cap/'baseline/hone/challenge.json').read_bytes()); records=dev/'live-repeats-20261004'
try: mod.calibrate(copy.deepcopy(challenge),records)
except ValueError: pass
else: raise AssertionError('default mode accepted failed CPU records')
cal=mod.calibrate(copy.deepcopy(challenge),records,True)
for receipt in cal['calibration']['records']:
 assert receipt['sha256']==hashlib.sha256((records/receipt['file']).read_bytes()).hexdigest()
with tempfile.TemporaryDirectory() as td:
 out=pathlib.Path(td)
 for path in records.glob('base-*.json'): (out/path.name).write_bytes(path.read_bytes())
 path=out/'base-validation-r1.json'; result=json.loads(path.read_bytes()); result['constraints']['roundtrip_ok']=False; path.write_text(json.dumps(result))
 try:mod.calibrate(copy.deepcopy(challenge),out,True)
 except ValueError:pass
 else:raise AssertionError('CPU mode accepted round-trip failure')
print(json.dumps({'defaultRejectsCpuFailure':True,'explicitModeAcceptsOnlyCpuFailure':True,'rawReceiptHashesPreserved':True,'nonCpuFailureRejected':True,'cpuMargin':cal['cpuMargin'],'baselineCpuSec':cal['baselineCpuSec']}))
