---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/open-cloud-luau-execution-ci"
title: "Engine Tests in CI with Open Cloud Luau Execution"
tags: [roblox, community, "cluster/testing-qa-and-devops", ci, open-cloud, luau-execution]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox docs CC BY 4.0 (facts); script and workflow below are original"
sources:
  - https://create.roblox.com/docs/cloud/reference/features/luau-execution
  - https://create.roblox.com/docs/cloud/guides/usage-place-publishing
  - https://github.com/Roblox/place-ci-cd-demo
---
# Engine Tests in CI with Open Cloud Luau Execution

**What it solves:** tests that need real Instances, `require` of your ModuleScripts, CollectionService tags or the full engine API cannot run under Lune. Open Cloud's **Luau Execution** runs a script inside a real Roblox server for a place version you uploaded, and returns its result and logs. The vault's deep dive [[Unit Testing Luau with Jest-Lua and TestEZ]] introduces the idea; this note is a complete, hardened CI script.

## Facts from the Open Cloud reference (checked 2026-10-25)
| Item | Value |
|---|---|
| Create task | `POST /cloud/v2/universes/{u}/places/{p}/luau-execution-session-tasks` or `.../places/{p}/versions/{v}/luau-execution-session-tasks` |
| Result | Response has a `path`; `GET /cloud/v2/{path}` until `state` is `COMPLETE`, `FAILED` or `CANCELLED` |
| Logs | `GET /cloud/v2/{path}/logs` (view `FLAT` fills `messages`, `STRUCTURED` fills `structuredMessages`); 450 KB kept |
| Script | Runs as-is (no wrapper function); up to 4 MB; `timeout` defaults to 5 minutes, which is also the maximum run time |
| Return values | Serialized to JSON, max 4 MB, task info kept 24 h |
| Environment | Full DataModel and engine API, ModuleScripts load; **physics does not run and Scripts/LocalScripts do not auto-run**; DataModel changes are not persisted |
| Concurrency | 10 incomplete tasks per place, extra requests get HTTP 429 |
| Rate limits (per key owner) | create 5/min, get 200/min, logs 45/min |
| Scopes | `universe.place.luau-execution-session:write` to create; read or write to poll. Publishing needs `universe-places` write |

**Data warning from the same page:** engine APIs that touch cloud data, such as DataStores, *can* be called. Run tests against a **separate test universe** only, so a test can never write production data ([[Test Places, Staging Universes and Places in a Universe]]).

## The runner the task calls
Because Scripts do not auto-run, the task script must `require` your test runner explicitly. Keep it one line:

```luau
-- ci/run_tests_task.luau (sent as the task's "script")
return require(game:GetService("ServerScriptService").RunJest)()
```

`RunJest` is the module from [[Jest Lua Setup Checklist - Wally, jest.config and runCLI]], returning `{ passed, failedSuites, failedTests }`. Whether Jest Lua's `debug.loadmodule` requirement is met inside Open Cloud servers is not stated in the docs; prove it once on your test place, and fall back to a TestEZ-style or hand-rolled runner if it is not.

## The CI script (original, Python standard library only)

```python
#!/usr/bin/env python3
"""Usage: run_engine_tests.py <test.rbxl> <task.luau>
Env: ROBLOX_API_KEY, ROBLOX_TEST_UNIVERSE_ID, ROBLOX_TEST_PLACE_ID"""
import json, os, sys, time, urllib.error, urllib.request

API = "https://apis.roblox.com"
KEY = os.environ["ROBLOX_API_KEY"]
UNIVERSE = os.environ["ROBLOX_TEST_UNIVERSE_ID"]
PLACE = os.environ["ROBLOX_TEST_PLACE_ID"]


def call(method, url, body=None, content_type="application/json"):
    data = body if body is None or isinstance(body, bytes) else json.dumps(body).encode()
    for attempt in range(5):
        req = urllib.request.Request(url, data=data, method=method)
        req.add_header("x-api-key", KEY)
        if data is not None:
            req.add_header("Content-Type", content_type)
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                raw = resp.read()
                return json.loads(raw) if raw else {}
        except urllib.error.HTTPError as err:
            if err.code == 429 and attempt < 4:
                time.sleep(5 * 2 ** attempt)  # back off: 5, 10, 20, 40 s
                continue
            print(err.read().decode(errors="replace"), file=sys.stderr)
            raise


# 1. Upload the build as a *Saved* version of the TEST place (not Published).
with open(sys.argv[1], "rb") as f:
    version = call(
        "POST",
        f"{API}/universes/v1/{UNIVERSE}/places/{PLACE}/versions?versionType=Saved",
        f.read(),
        "application/octet-stream",
    )["versionNumber"]
print(f"uploaded test place version {version}")

# 2. Run the task pinned to that exact version.
with open(sys.argv[2], encoding="utf-8") as f:
    script = f.read()
task = call(
    "POST",
    f"{API}/cloud/v2/universes/{UNIVERSE}/places/{PLACE}/versions/{version}/luau-execution-session-tasks",
    {"script": script, "timeout": "300s"},
)
path = task["path"]

# 3. Poll (well under the 200/min limit).
deadline = time.time() + 360
while task.get("state") not in ("COMPLETE", "FAILED", "CANCELLED"):
    if time.time() > deadline:
        sys.exit("task did not finish in time")
    time.sleep(3)
    task = call("GET", f"{API}/cloud/v2/{path}")

# 4. Print logs so failures are readable in the CI log.
logs = call("GET", f"{API}/cloud/v2/{path}/logs")
for page in logs.get("luauExecutionSessionTaskLogs", []):
    for line in page.get("messages", []) or []:
        print(line)

if task["state"] != "COMPLETE":
    print(json.dumps(task.get("error"), indent=2))
    sys.exit(1)

# 5. Read the runner's return value. The reference documents an "output" object;
#    the vault's earlier deep dive reads output.results. Print everything if unsure.
output = task.get("output") or {}
results = output.get("results") or []
summary = results[0] if results else None
print("summary:", json.dumps(summary))
if not isinstance(summary, dict) or not summary.get("passed"):
    sys.exit(1)
```

## The workflow job (original)

```yaml
  engine-tests:
    needs: checks
    if: github.event_name == 'push' || github.event.pull_request.head.repo.full_name == github.repository
    runs-on: ubuntu-latest
    timeout-minutes: 20
    concurrency:
      group: luau-execution-test-place
      cancel-in-progress: false   # queue runs; never kill a task mid-way
    steps:
      - uses: actions/checkout@v4
      - uses: CompeyDev/setup-rokit@v0.2.1
      - run: wally install
      - run: rojo build test.project.json --output test.rbxl
      - run: python3 ci/run_engine_tests.py test.rbxl ci/run_tests_task.luau
        env:
          ROBLOX_API_KEY: ${{ secrets.ROBLOX_TEST_API_KEY }}
          ROBLOX_TEST_UNIVERSE_ID: ${{ vars.ROBLOX_TEST_UNIVERSE_ID }}
          ROBLOX_TEST_PLACE_ID: ${{ vars.ROBLOX_TEST_PLACE_ID }}
```

The `concurrency` group copies the idea from Roblox's demo, which queued Luau Execution jobs because of the API's concurrency limit. The `if:` line skips fork pull requests, which cannot read secrets anyway.

## Key hygiene
- One API key **per purpose**: the test key gets only the test universe, with place write + Luau execution write. It can never touch production.
- Store it as a GitHub **secret**; universe and place IDs can be plain repository variables (the demo does the same).
- Set an expiration on the key in the Creator Dashboard and rotate it; see [[Manage API keys]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Open Cloud APIs for Live Ops - Worked Examples]] · [[Usage guide for place publishing]] · [[Roblox place-ci-cd-demo - What the Official Sample Shows]] · [[rbxcloud CLI - Open Cloud from Scripts and CI]]

<!-- TDOD_GRAPH_END -->
