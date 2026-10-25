---
area: "14 Testing and QA"
cluster: "Testing"
tags: [deep-dive, roblox, bugs, triage, severity, regression, error-report]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Bug Triage, Severity and Regression Workflow

## Why this matters
A live Roblox game gets bug reports from Discord, the Feedback dashboard, the Error Report, crash analytics and your own QA, often hundreds a week. Without a shared severity scale and a triage rhythm, teams fix what's loudest instead of what loses players, data or Robux.
This note defines Roblox-specific severity levels, a 20-minute triage routine, the tools that turn vague reports into reproducible bugs, and a regression loop so fixed bugs stay fixed.

---

## 1. Severity is about player harm; priority is about scheduling

### Severity (what the bug does)

| Level | Definition | Roblox examples |
|---|---|---|
| **S1 Blocker** | Data loss, money loss, can't play, or a security hole | Progress wiped on rejoin; dev product paid but not granted; can't join servers; currency duplication exploit; crash on launch on a major platform |
| **S2 Critical** | Core loop broken for a meaningful group, with no workaround | Mobile players can't open the shop; quest can't complete; gamepad stuck in a menu; trading lets restricted users trade paid items |
| **S3 Major** | Feature broken or wrong, with a workaround | Wrong price label; pet ability doesn't apply; UI overlaps on tablets |
| **S4 Minor** | Noticeable but low impact | Z-fighting; wrong icon; typo in non-critical UI |
| **S5 Trivial** | Polish | 1-px misalignment; tiny animation pop |

**Compliance bugs are at least S2:** missing odds disclosure, ads shown to ineligible users, off-platform links in UI, prompts with false urgency. They can affect your standing with Roblox, not just players.

### Priority (when we fix it)

| Priority | Rule |
|---|---|
| **P0** | Now: hotfix, Config kill switch, or rollback. All S1s are P0 |
| **P1** | This release |
| **P2** | Next release or two |
| **P3** | Backlog; revisit monthly |

Priority can be lower than severity (an S2 in a mode almost nobody plays) or higher (an S4 typo in the purchase dialog's price text).

---

## 2. Intake: turn reports into reproducible bugs

### Sources and what each gives you
| Source | Gives | Where |
|---|---|---|
| **Error Report** | Live Luau errors and warnings, server vs client, filter by platform/OS, **new errors since version X**, place-version annotations | Creator Dashboard › Monitoring › Error Report |
| **Crashes / Performance** | Crash rate, memory, frame rate by platform and version | Analytics › Performance (and Alerts, see the analytics note) |
| **Feedback** | Votes plus filtered comments by device and platform; CSV export | Audience › Feedback |
| **Community** | Steps, video, emotion | Discord forum with a template |
| **QA** | Exact steps, build | Test plan runs |

### Put server and version info in front of players
Players can't tell you the server ID unless you show it. Add a small, unobtrusive build stamp in your settings menu:

```lua
-- Server: expose build info to clients via attributes
workspace:SetAttribute("PlaceVersion", game.PlaceVersion)
workspace:SetAttribute("ServerId", string.sub(game.JobId, 1, 8)) -- short ID; JobId is empty in Studio
```

```lua
-- LocalScript: settings menu label
local label = script.Parent :: TextLabel
local function refresh()
	label.Text = ("v%s · %s"):format(
		tostring(workspace:GetAttribute("PlaceVersion") or "?"),
		tostring(workspace:GetAttribute("ServerId") or "studio"))
end
workspace:GetAttributeChangedSignal("PlaceVersion"):Connect(refresh)
refresh()
```

Now a Discord report says "v214 · 3fa2c9d1" and you can match it against the Error Report's version annotations.

### Capture server errors with context
`ScriptContext.Error` fires on the server for script errors. Log a compact fingerprint (message + script) with counts, and optionally a custom analytics event, so you can see which errors spike after a release:

```lua
-- ServerScriptService/ErrorFingerprint.server.luau
local ScriptContext = game:GetService("ScriptContext")
local counts: {[string]: number} = {}

ScriptContext.Error:Connect(function(message, stackTrace, scriptInst)
	local where = scriptInst and scriptInst:GetFullName() or "?"
	local key = where .. " :: " .. string.sub(message, 1, 120)
	counts[key] = (counts[key] or 0) + 1
	if counts[key] == 1 or counts[key] % 100 == 0 then
		warn(("[ERR x%d] %s"):format(counts[key], key)) -- appears in server logs / Error Report
	end
end)
```

Don't send raw error strings as analytics custom-field values; they would blow the 8,000 unique-value budget. Use a short category instead.

---

## 3. The 20-minute triage (daily during launches, 2–3× a week otherwise)

1. **New S1 candidates first** (data, money, joins, exploits). Confirm, assign an owner, decide on a hotfix, Config kill switch or rollback **within the meeting**.
2. **Error Report:** filter *New errors since* the last version; open the top 5 by count.
3. **Alerts fired** since the last triage (crash rate, CCU drop).
4. **Community/QA queue:** reproduce or request info; merge duplicates (keep a count of the duplicates, since it measures reach).
5. Set **severity, priority, owner, target release** for each item.
6. Anything unreproducible after two attempts becomes *Needs info*, with the exact question asked of the reporter.

### Bug states
`New → Needs info → Confirmed → In progress → Fixed (in build) → Verified (QA) → Released → Closed`
Plus `Won't fix` / `Duplicate` / `Cannot reproduce` with a reason.

**"Fixed" isn't done.** A bug is closed only after it's **verified in the published build** and the regression case exists.

---

## 4. Reproduction toolkit

| Problem type | Tool |
|---|---|
| Client vs server mismatch | Studio **Test** with the **Client/Server toggle**; Output labels show client (blue) vs server (green) |
| Multiplayer, trading, round flow | **Server & Clients** with 2–8 clients; **Party Simulator** for party APIs |
| Timing and latency bugs | **Network Simulator** (3G preset, or inbound/outbound only) |
| Device-specific UI | **Device Simulator** profiles + **Controller Emulator** |
| Physics or animation moments | **Pause/Resume** and **Step Forward** (1/60 s) per client or server |
| Localization | **Player Emulator**: Locale, Pseudolocalize, Elongate, Region |
| Live-server-only | Developer Console (**F9**) on a live server: server log, memory, network |
| Data issues | Data Stores Manager (view a key's value, metadata and version history), on test data only |

Write the **smallest** repro: fewest steps, cleanest place copy. A repro that needs "play for 2 hours" is usually two bugs.

---

## 5. Fix strategies by severity

| Situation | Action |
|---|---|
| S1 in a feature that's behind a Config | Flip the kill switch now (about a minute to publish), fix calmly |
| S1 caused by the last publish, no switch | **Restore the previous place version** (Version History), **publish** it, then **Restart Servers** with *only outdated versions* (restoring doesn't publish automatically) |
| S1 exploit | Patch server validation; consider pausing the affected system; audit and roll back exploited gains with your transaction ledger |
| S2 with a workaround | Hotfix if it's cheap and low-risk, else next release with a community notice |
| Data corruption | Stop writes for the affected path first, then repair; never "fix forward" blindly over bad data |

See [[Release Readiness Runbook 2026]] for restart and rollback mechanics and [[Release Rollback and Incident Response]] for the incident process.

---

## 6. Regression loop
1. Every fixed S1/S2 gets a **regression test case** in the plan (see [[QA Test Plan Template for Roblox Experiences]]), with the bug ID in the case.
2. If it can be automated (server logic, data migration, receipt idempotency), add a scripted check (see [[Device, Network and Controller Simulation Test Pass]] for StudioTestService and CLI runs).
3. After release, watch Error Report *New errors since* for 24–48 h.
4. Monthly: review **reopened** bugs. Each one shows a gap in the regression suite.

---

## 7. Metrics that keep triage honest
- Open S1/S2 count (target 0 at release)
- Median time to fix S1 (hours) and S2 (days)
- Reopen rate
- Errors per 1,000 sessions after each release (Error Report + analytics)
- Duplicate count per bug (a proxy for reach)

---

## Common mistakes
- Sorting by loudness (Discord volume) instead of severity × reach.
- Treating "can't reproduce" as "not a bug", with no follow-up questions.
- Closing bugs when the code merges instead of after release verification.
- Restoring an old place version and forgetting to publish and restart servers.
- No server ID or version shown to players, so reports can't be matched to errors.
- Letting compliance bugs sit in the backlog as "minor".
- Fixing exploits client-side.

## Checklist
- [ ] Severity and priority definitions pinned for the team
- [ ] Build stamp (place version + short server ID) visible in settings
- [ ] Error fingerprinting on the server; alerts configured
- [ ] Triage cadence scheduled; S1 decisions made in the meeting
- [ ] Kill switches exist for risky systems
- [ ] Rollback steps rehearsed (restore → publish → restart outdated servers)
- [ ] Every S1/S2 fix adds a regression case
- [ ] Post-release error watch for 24–48 h

---

**Sources checked (2026-10-25):** Creator Docs: Analytics › Error Report; Analytics › Alerts; Analytics › Feedback; Studio › Testing modes; Network Simulator; Device Simulator; Projects › Version History; Projects › Release game updates (restart servers); Engine API: ScriptContext.Error, DataModel.PlaceVersion, DataModel.JobId.

**Related:** [[Testing - Hub]] · [[Bug Report Template]] · [[Debugging Playbook]] · [[Troubleshooting Field Guide]] · [[Release Rollback and Incident Response]] · [[Visual Debugging From Screenshots]]
