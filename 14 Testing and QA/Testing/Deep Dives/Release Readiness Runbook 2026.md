---
area: "14 Testing and QA"
cluster: "Testing"
tags: [deep-dive, roblox, release, runbook, publishing, rollback, server-restart]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Release Readiness Runbook 2026

## Why this matters
Roblox release mechanics changed a lot in 2025–2026: age checks and the Maturity & Compliance Questionnaire now gate *every* release action, publishing requires version notes, servers can be restarted with bleed-off delays and in-game countdown events, and Configs let you ship dark and flip content live.
A release that goes wrong on Roblox usually goes wrong in public, in front of your whole concurrent audience. This runbook is a timed checklist from one week out to two days after, including the rollback path.

---

## 1. Account and game eligibility (check once, re-check on changes)

Release requirements apply to **all release actions**: first release, **updating a released game (publishing a new place version)**, *Publish As* to another game, and changing target audience.

| To release to | Requirements (Creator Docs › Publish games and places) |
|---|---|
| **Ages 16+ and Trusted Friends** | Account in good standing and ≥ 2 days old; **age check** (facial age estimation or government ID); answer the questionnaire's age-restricted content question (No → *Content May Vary* label, released to age-checked 16+; Yes → full questionnaire, released to age-checked 16+ or age-verified 18+ depending on content) |
| **All ages (incl. Roblox Kids and Select)** | All of the above **plus** verification (facial age estimation if under 18, government ID if 18+), **2FA**, **one of**: active Roblox Plus or Premium for 2 consecutive months, **or** a refundable fee; pass the Kids and Select evaluation; full questionnaire with a Minimal, Mild or Moderate (9+) rating |

Optional fees:
- **Publishing fee:** 1,000 Robux per game, refundable if the game keeps **25 highly engaged players for 60 days** without moderation.
- **Expedited review fee:** 50,000 Robux, refundable after 90 days if in good standing with 25 highly engaged players. The review takes **48 hours**; minor violations restart the clock after resubmission.
- You can release up to **5 never-released games per day**.

Re-answer the **Maturity & Compliance Questionnaire** when an update changes content (new violence, romance, paid random items, trading, social hangout, free-form creation, AI interaction...). Remember that resubmitting temporarily removes **ads eligibility** while it's under review, so only resubmit when answers change.

---

## 2. Timeline

### T-7 days: scope lock
- [ ] Changelog drafted; risky systems identified
- [ ] Test plan created from the template ([[QA Test Plan Template for Roblox Experiences]])
- [ ] **Experience Event** created (public or private) if launching content; **Off-Platform Featuring** submitted (must be ≥7 days before start)
- [ ] New thumbnails produced for personalization ([[Thumbnail Personalization and Icon Testing Workflow]])
- [ ] New config keys created and **staged** (feature flags default off)
- [ ] Data schema changes have a migration and a rollback plan

### T-2 days: release candidate
- [ ] RC published to the **test place/universe**; P0 regression + smoke on phone, PC, console (if supported)
- [ ] **Dynamic Price Check** passes (no hard-coded prices) after any shop change
- [ ] Published-only checks done in the test universe: analytics **View Events**, purchases end to end, feedback prompt, notifications
- [ ] Error Report on the test universe shows no new errors
- [ ] Greybox/debug audit: no greybox parts, no debug commands open to everyone, no test prints spamming Output
- [ ] Localization: Pseudolocalize/Elongate pass on changed UI
- [ ] Compliance pass: odds disclosure, ads eligibility handling, no off-platform links in UI, neutral purchase copy
- [ ] Rollback target noted: **current live place version number**

### T-0: release
1. **Publish with version notes** (File › Publish; notes are required). Use *Publish with Notes* to auto-draft a summary from your team's save notes.
2. Decide how players move to the new version:
   - **Soft:** let old servers drain naturally (no disruption, but mixed versions for a while; avoid this if data formats changed).
   - **Restart servers:** Creator Dashboard › Configurations › **Server management** › select places › **Restart Servers**, with **Restart only servers with outdated versions** (recommended) and optionally **Delay server restart** (1–60 min bleed-off).
   - **Dark launch:** publish with content behind a Config flag, restart (or drain), then flip the flag when ready, which takes about a minute.
3. Handle the restart in-game with `DataModel.ServerRestartScheduled` (shows a countdown and saves) and `game:BindToClose` (final save, within the 30-second window).
4. Publish staged **Configs** that the release needs (*Publish now* or *Publish over 15 min*).
5. Send the **update announcement** (≤ 60 characters, specific) and community posts.
6. Start the **watch window**.

```lua
-- ServerScriptService/RestartNotice.server.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local notice = Instance.new("RemoteEvent")
notice.Name = "ServerRestartNotice"
notice.Parent = ReplicatedStorage

game.ServerRestartScheduled:Connect(function(restartTime: DateTime, source: Enum.CloseReason, attributes)
	-- source is DeveloperUpdate for your publishes, RobloxMaintenance for platform maintenance
	notice:FireAllClients(restartTime.UnixTimestamp, source.Name)
	for _, player in Players:GetPlayers() do
		Profiles.saveSoon(player) -- your data module: save early, don't wait for shutdown
	end
end)

game:BindToClose(function(reason: Enum.CloseReason)
	-- All bound functions run in parallel; the server waits up to 30 seconds
	Profiles.saveAllBlocking()
end)
```

Restart behaviour (docs): matchmaking to old servers stops (invites, teleports and follows can still reach them), the delay elapses, then players on the same old server are teleported **together** to the same new server.

### T+0 to T+2 h: watch window
| Signal | Where | Trigger to act |
|---|---|---|
| New errors since this version | Error Report (*New errors since*) | Any new error at high count |
| Crash rate, memory, frame rate | Performance + Alerts | Above your alert thresholds |
| CCU / joins | Overview, Alerts | Sudden drop |
| Purchases granted | Your receipt logs; shop funnel | Any grant failures |
| Discord `#bug-reports` | Community | Multiple reports of the same S1/S2 |

### T+1 to T+2 days: follow-up
- [ ] Error Report and crash trends compared with the previous version
- [ ] Event/feature funnels reviewed; D1 of the new cohort when available
- [ ] Patch notes thank community reporters; known issues posted
- [ ] Retro notes into the vault ([[Project State, Decisions and Resume Notes]])

---

## 3. Rollback paths (fastest first)

| Option | Time | When |
|---|---|---|
| **Flip a Config kill switch** | ~1 min (Publish now) | The broken thing is behind a flag |
| **Restore a config value** from Config History | ~1 min | A bad config value caused it |
| **Restore the previous place version** | Minutes | A code or content regression with no flag |
| Revoke public access | Immediate | Severe exploit or safety issue while you fix it |

**Place restore steps** (Version History docs): Creator Dashboard › Configurations › Places › place › **Version History** › **Restore** (or in Studio: Window › Version History › *Open Local Copy* → *Save to Roblox As*). **Restoring doesn't publish automatically.** Open the restored place in Studio, **publish**, then **Restart Servers** (outdated only).

**Data caveat:** rolling back code doesn't roll back player data written by the bad version. If the bad version wrote a new data format, the old code must tolerate it (that is why schema changes need forward-compatible reads), or you need a repair script.

---

## 4. One-page release sign-off

```
Release: v1.9 "Frozen Caverns"          Live version before: 213   New: 214
[ ] Eligibility/questionnaire current     [ ] Version notes written
[ ] P0 regression pass (phone/PC/console) [ ] Dynamic Price Check pass
[ ] Published-only checks in test universe
[ ] Configs staged: events.frozen=false   [ ] Kill switches listed: shop.v2, trading
[ ] Restart plan: outdated only, 10 min delay, countdown UI tested
[ ] Watch owner: ____  until: ____ UTC   Rollback owner: ____
Decision:  GO / NO-GO     Signed: ____
```

---

## Common mistakes
- Forgetting that **updates** are release actions, so an expired age check or stale questionnaire answer blocks the publish at the worst moment.
- Restarting **all** servers instead of only outdated ones, which disconnects players for nothing.
- Instant restarts with no countdown or save-on-notice.
- Mixed versions running with an incompatible data format.
- Restoring a place version and assuming it's live.
- Shipping content "dark" without actually guarding every entry point behind the flag.
- Resubmitting the questionnaire for unchanged answers (temporary loss of ads eligibility).
- No named watch owner after release.

## Checklist
- [ ] Section 1 eligibility verified for this account/group
- [ ] T-7, T-2 and T-0 lists complete
- [ ] `ServerRestartScheduled` countdown + early save and `BindToClose` save implemented and tested
- [ ] Restart with *only outdated versions* and an appropriate delay
- [ ] Watch window staffed for 2 hours; follow-up review at T+1/T+2 days
- [ ] Rollback options rehearsed; previous version number recorded

---

**Sources checked (2026-10-25):** Creator Docs: Publishing › Publish games and places (release requirements, optional fees, daily limit, target audience); Projects › Release game updates (restart servers, ServerRestartScheduled); Projects › Version History (publish notes, restore); Production › Experience configs; Monetization › Immersive ads (questionnaire resubmission note); Engine API: DataModel.ServerRestartScheduled, DataModel:BindToClose, CloseReason.

**Related:** [[Testing - Hub]] · [[Pre-Release Gate]] · [[Release Checklist]] · [[Release Rings and Rollback Strategy]] · [[Release and Rollback Lab]] · [[Publishing Release - Hub]]
