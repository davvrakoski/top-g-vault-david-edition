---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Player Report Queue - Rule-Break Reports to Moderator Review"
tags: [roblox, community-knowledge, server-engineering, moderation, reports, memorystore, support-tools]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/safety
  - https://create.roblox.com/docs/cloud-services/memory-stores/queue
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
---
# Player Report Queue - Rule-Break Reports to Moderator Review

Players see exploiters and griefers long before your detection does. An in-game "Report player" button for **your game's rules** (exploiting, griefing, scamming in trades, AFK farming in ranked) turns them into sensors, if the pipeline behind it resists spam and gives moderators evidence instead of accusations. This note designs that pipeline. It does not replace Roblox's own Report Abuse, which is the right path for harassment, inappropriate content and Terms of Use violations; Roblox's safety docs describe a dashboard of abuse-report metrics per game, which only reflects reports made through Roblox.

## Split the two kinds of report

| Report type | Where it goes |
| --- | --- |
| Chat abuse, harassment, inappropriate avatar or content | Roblox Report Abuse (open it from your menu with a short explanation) |
| Game rule breaks: exploits, griefing, trade scams, teaming in solo modes | Your queue (this note) |

Keeping them apart avoids you storing or judging chat content you should not be handling.

## The server side of the button

The client sends only `(targetUserId, reasonCode)`. Everything else the server adds.

```lua
local REASONS = { exploit = true, grief = true, scam = true, afk = true }
local lastReport: {[number]: number} = {} -- reporter UserId -> os.clock()
local reported: {[string]: boolean} = {}  -- "reporter:target" pairs this session

reportRemote.OnServerEvent:Connect(function(reporter, targetId: unknown, reason: unknown)
	if type(targetId) ~= "number" or type(reason) ~= "string" or not REASONS[reason] then return end
	local target = Players:GetPlayerByUserId(targetId)
	if not target or target == reporter then return end -- must be in this server
	local now = os.clock()
	if (lastReport[reporter.UserId] or 0) + 120 > now then return end -- 1 per 2 min
	local pair = reporter.UserId .. ":" .. targetId
	if reported[pair] then return end
	lastReport[reporter.UserId], reported[pair] = now, true

	enqueueReport({
		id = HttpService:GenerateGUID(false), t = os.time(),
		reporter = reporter.UserId, target = targetId, reason = reason,
		job = game.JobId, ver = game.PlaceVersion,
		evidence = collectEvidence(target), -- server-side facts only
	})
end)
```

Clear `lastReport[userId]` on `PlayerRemoving` so the tables do not grow for the whole server lifetime. `collectEvidence` should use what the **server** knows: recent strike entries from your detection ([[Exploit Strike Scores - Decaying Suspicion, Evidence Logs and Response Ladders]]), the last few trades, current position and speed, account age in days, kills and deaths this session. No free text from the reporter by default; if you allow a note, filter it and cap its length ([[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]).

## Storage: queue for work, data store for history

- **MemoryStore queue** `reports_open` for the moderator inbox. `AddAsync(item, expiration, priority)` with a higher priority for `exploit` and for targets with existing strikes. Moderators' tools read with `ReadAsync`; the queue's **invisibility timeout** (30 s default) hides an item from other readers while one moderator handles it, and `RemoveAsync` deletes it once a decision is logged. If the moderator's server crashes, the item reappears after the timeout (queue docs).
- Memory stores expire (max 45 days) and have size quotas (64 KB + 1.2 KB x users, docs), so also append each report to a **DataStore** day key (`reports_2026-10-25`) and bump a per-target counter key, sharded like any hot write ([[Net - Staff Audit Logs - Recording Every Admin Action]] uses the same layout).
- Prefer forwarding to an external tool? Batch reports and send them every 30-60 s, never one HTTP call per click ([[Discord Webhooks from Roblox - Why They Break and Safer Logging]]).

## Aggregation beats single reports

Rank targets by **distinct reporters across distinct servers** in a time window, weighted by reporter reliability (share of their past reports that led to action). One player reporting the same person from five alts is one signal, not five. Three unrelated reporters in three servers is worth a look.

## Moderator workflow

1. Mod opens the review panel (server-checked permission, [[Admin Command Safety - Server-Side Permission Checks]]).
2. Panel pulls the next queue item, shows evidence and the target's history.
3. Decision: dismiss, warn, temporary ban, permanent ban (via the Ban API, [[Ban API in Practice - BanAsync, Alt Detection and Appeals]]).
4. Every decision is written to the audit log with the report id; then `RemoveAsync`.
5. Optional: tell the reporter "Thanks, action was taken" without naming the outcome.

## Do not automate punishment from reports

Groups of players can mass-report a rival (a report brigade), especially in competitive games. Use report volume to **prioritize review** or to trigger extra server-side checks on the target, never to auto-ban.

## Related
[[Server Engineering - Hub]] · [[In-Game Bug Report Button - Capturing Useful Context]] · [[MemoryStore Queues and Sorted Maps for Matchmaking]] · [[Policy - Experience Rules, In-Game Bans and Player Refund Disputes]]
