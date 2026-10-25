---
area: "14 Testing and QA"
cluster: "Testing"
title: "Server Lifecycle Chaos Pass - Shutdowns, Restarts and Rejoins"
tags: [roblox, community-knowledge, testing, chaos, bindtoclose, server-restart, datastore]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#BindToClose
  - https://create.roblox.com/docs/reference/engine/enums/CloseReason
  - https://create.roblox.com/docs/projects/update-games
  - https://create.roblox.com/docs/projects/activity-history
  - https://principlesofchaos.org/
---
# Server Lifecycle Chaos Pass - Shutdowns, Restarts and Rejoins

Most save-loss reports are not DataStore outages; they are a server ending at a bad moment: mid-trade, mid-purchase, during a round reward, or while a player is teleporting. "Chaos testing" (deliberately breaking things in a controlled way to see whether the system holds, as described in the Principles of Chaos Engineering) fits Roblox well because you have real levers: Studio Stop, **Restart Servers**, **Shut down all servers**, and players leaving at awkward times. This pass complements [[QA - DataStore Failure Testing - Fault Injection and Retry Checks]] (which breaks the DataStore calls) by breaking the **server** instead.

## Facts the tests rely on

- `game:BindToClose(fn)` runs bound functions in parallel; the server waits **30 seconds** for them, then shuts down anyway.
- If the bound function takes a parameter it receives `Enum.CloseReason`: `Unknown`, `RobloxMaintenance`, `DeveloperShutdown` (also used when BindToClose runs in Studio), `DeveloperUpdate` (migrated to a new place version), `ServerEmpty`, `OutOfMemory`, `Moderation`.
- Teleports are disabled during moderation shutdowns.
- **Restart Servers** (Creator Dashboard, Configurations, Server management) can target only outdated servers and can delay shutdown 1-60 minutes; Roblox then teleports everyone from an old server to the same replacement server.
- "Shut down all servers" use is logged in **Activity History**, so testers on the team can see who pulled the lever.

## Instrument first

Log one line per player in BindToClose: user ID, save result, attempt count, elapsed time, and the CloseReason. Print a final "flush done in X s" line. Without this the pass only tells you "it seemed fine".

```lua
game:BindToClose(function(reason)
	local started = os.clock()
	local results = SaveService.flushAll() -- your module; returns {userId = ok}
	print(("[close] reason=%s saved=%d in %.1fs"):format(
		reason.Name, countTrue(results), os.clock() - started))
end)
```

## The pass

Run in a **staging universe** with 3-6 testers and realistic save sizes.

| # | Scenario | How | Expect |
| --- | --- | --- | --- |
| 1 | Studio stop | Play, earn currency, press Stop | Save logged, reason `DeveloperShutdown`, Studio does not hang 30 s if you skip waits with `RunService:IsStudio()` |
| 2 | Quiet restart | Restart Servers, outdated only, no delay | All players re-arrive in one new server; data matches pre-restart |
| 3 | Bleed-off restart | Restart with a 5 minute delay | Restart notice shows, players can finish a round, no one is matched into the old server via Play |
| 4 | Hard shutdown | Shut down all servers on staging | Every player saved; rejoin shows latest values |
| 5 | Shutdown mid-trade | Two testers confirm a trade, operator triggers shutdown at the confirm moment | Trade fully applied to both or to neither; never one side only |
| 6 | Shutdown mid-purchase | Buy a developer product, shutdown during the prompt | Receipt retried on next join; item granted exactly once |
| 7 | Last player leaves | Everyone leaves together | `ServerEmpty` path saves everyone; no "session locked" on quick rejoin |
| 8 | Rejoin race | Leave and rejoin a different server within 2 s | New server waits for the session lock or retries; no stale load |
| 9 | Mid-teleport | Shutdown while a party teleports to a match place | Players either arrive or return to the start place with data intact |
| 10 | Big server | Fill to max players with large saves, shutdown | Flush log shows all saves under 30 s with margin |

## Reading the results

- **Flush time** is the key number. If scenario 10 is above about two thirds of the 30-second window, saves will be lost on a busy day: batch, reduce payload, or save on a timer so the close flush has less to do.
- Any **one-sided trade** or **double grant** is a severity-1 bug; see [[Trading and Duplication Threat Model]].
- If the same user appears twice in the log, two code paths both saved (PlayerRemoving and BindToClose): make the save idempotent.

## Cadence

Run scenarios 1, 2 and 4 before every release; run the whole table when you change saving, trading, purchases or teleports. Record the flush time per release in the release log so you notice it creeping up.

## Related

[[Testing - Hub]] · [[BindToClose and Server Shutdown Save Flush]] · [[Server Restart Notices with ServerRestartScheduled]] · [[Rollback Drills - Rehearsing a Bad Release]]
