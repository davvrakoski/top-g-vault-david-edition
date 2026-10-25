---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/analytics-alerts-as-code"
title: "Analytics Alerts as Code - Crash Rate and Error Alerts"
tags: [roblox, community, "cluster/testing-qa-and-devops", alerts, analytics, live-ops]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox docs CC BY 4.0 (facts); config and script below are original"
sources:
  - https://create.roblox.com/docs/cloud/guides/alerts
  - https://create.roblox.com/docs/production/analytics/crashes
---
# Analytics Alerts as Code - Crash Rate and Error Alerts

**Why:** the first hour after a release is when crash spikes hurt most, and nobody stares at a dashboard for an hour. Roblox's **Analytics Alerts API** ([[Analytics alerts]]) evaluates a metric on a schedule and calls your webhook when it breaches. Keeping alert definitions in the repo means every experience (staging, production, a second game) gets the same safety net.

## Facts that shape your alerts (official guide)
- Scopes: `universe.analytics.alert:read` / `:write`; the experience must be eligible for alerts, otherwise every call returns `403`.
- Up to **20 alerts** per experience; names unique, max 50 characters (descriptions 200). Both are subject to text moderation.
- `severity`: `SEV_0` (critical), `SEV_1` (medium), `SEV_2` (low).
- `interval` and allowed `consecutiveOccurrences`: `OneMinute` 6-30; `HalfHour`, `OneHour`, `OneDay` 1-10. Not every metric supports every interval.
- `condition`: `operator` (`Gt`, `Gte`, `Lt`, `Lte`), `threshold`, `evaluationMode` `Absolute` or `PeriodOverPeriod` (percentage change, with `periodOffsetMultiplier` intervals back).
- `filter` narrows by dimension values; `breakdown` (one dimension, which must also be in `filter`) evaluates each value separately.
- `webhookReceiverConfig.receivers` lists webhook configuration IDs (UUIDs) you created for the experience.
- Incidents for the last 30 days are queryable.
- New alerts start as `Syncing`, then `Enabled`. Alert IDs are 64-bit integers sent as **strings**: keep them as strings.

The guide's examples use the metrics `ClientCrashRate15m` and `PeakConcurrentPlayers`; the full list is in the guide's supported-metrics page.

## A starter set (original)
`ops/alerts.json`, applied to every live experience:

```json
[
  {
    "name": "Client crash rate high",
    "metric": "ClientCrashRate15m",
    "severity": "SEV_0",
    "interval": "OneMinute",
    "consecutiveOccurrences": 10,
    "condition": { "operator": "Gt", "threshold": 2, "evaluationMode": "Absolute" }
  },
  {
    "name": "Mobile crash rate by platform",
    "metric": "ClientCrashRate15m",
    "severity": "SEV_1",
    "interval": "OneMinute",
    "consecutiveOccurrences": 15,
    "filter": [{ "dimension": "Platform", "values": ["Phone", "Tablet"] }],
    "breakdown": [{ "dimensions": ["Platform"] }],
    "condition": { "operator": "Gt", "threshold": 3, "evaluationMode": "Absolute" }
  },
  {
    "name": "Players down vs last week",
    "metric": "PeakConcurrentPlayers",
    "severity": "SEV_1",
    "interval": "OneDay",
    "consecutiveOccurrences": 1,
    "condition": { "operator": "Lt", "threshold": -30, "evaluationMode": "PeriodOverPeriod", "periodOffsetMultiplier": 7 }
  }
]
```

Thresholds here are starting points; tune them to your game's normal levels after a week of data.

## Apply script outline (original, Python)

```python
import json, os, urllib.request

UNIVERSE = os.environ["UNIVERSE_ID"]
KEY = os.environ["ROBLOX_ALERTS_KEY"]
URL = f"https://apis.roblox.com/analytics-alert-control-plane/v1/resource/Universe/id/{UNIVERSE}/alerts"

def call(method, url, body=None):
    req = urllib.request.Request(url, method=method,
                                 data=None if body is None else json.dumps(body).encode())
    req.add_header("x-api-key", KEY)
    req.add_header("Content-Type", "application/json")
    with urllib.request.urlopen(req, timeout=30) as r:
        raw = r.read()
        return json.loads(raw) if raw else None

existing = {a["name"]: a for a in call("GET", URL) or []}
for alert in json.load(open("ops/alerts.json", encoding="utf-8")):
    alert["webhookReceiverConfig"] = {"receivers": [{"webhookConfigurationId": os.environ["ALERT_WEBHOOK_ID"]}]}
    if alert["name"] in existing:
        # PATCH only changes fields you send; filter/breakdown are replaced when present.
        call("PATCH", f"{URL}/{existing[alert['name']]['alertId']}", alert)
        print("updated", alert["name"])
    else:
        call("POST", URL, alert)
        print("created", alert["name"])
```

## Using alerts around a release
1. Before publishing, list alerts with `firingStatus=Firing`: never ship into an already-burning game.
2. After publishing, watch the incidents endpoint (or your webhook channel) for the release window; pair it with the "new errors since" check in [[Error Reporting API - Grouping Rules as Code and New-Error Checks]].
3. Out-of-memory server crashes: use the crashes chart and memory snapshots to find the cause ([[Server crashes chart]]).
4. Disable a noisy alert with `configState: "Disabled"` instead of deleting it; deletes are irreversible.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Analytics alerts]] · [[Server crashes chart]] · [[Release Readiness Runbook 2026]] · [[Error Reporting API - Grouping Rules as Code and New-Error Checks]]

<!-- TDOD_GRAPH_END -->
