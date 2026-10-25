---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/ban-api-practice"
title: "Ban API in Practice - BanAsync, Alt Detection and Appeals"
tags: [roblox, community, "cluster/performance-and-security", security, moderation, ban-api]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Players#BanAsync
  - https://create.roblox.com/docs/production/bans
  - https://devforum.roblox.com/t/unbanasync-does-not-work/3066349
  - https://devforum.roblox.com/t/add-further-alt-prevention-to-banasync/4086725
---
# Ban API in Practice - BanAsync, Alt Detection and Appeals

`Players:BanAsync()` replaced most homemade "ban DataStore + kick on join" systems. It's easy to call, but the scope rules and alt detection catch people out. This note covers the documented behaviour plus what developers found in production.

## Documented facts (Creator Hub)

- **Server only.** Calling it from a client throws an error. In Studio, team test and collaborative editing, calls run but **bans don't apply to production**.
- `Players.BanningEnabled` must be on. You can only set it in Studio, not from Luau.
- The config needs `UserIds` (max **50**), `Duration` in seconds (`-1` for permanent; `0` and other negatives are invalid), `DisplayReason` (max **400** characters, text-filtered, shown to the player) and `PrivateReason` (max **1,000** characters, never shown to the client).
- **Alt accounts:** by default the ban also covers the user's *suspected* alts. Set `ExcludeAltAccounts = true` to stop that.
- `ApplyDeviceBlock = true` stops the device from rejoining for **24 hours**. Only `UnbanAsync` lifts that block.
- Banning in the **start place** keeps the user out of the whole universe, even with `ApplyToUniverse = false`.
- The call is an HTTP request under the hood, so it can be throttled or fail. Wrap it in `pcall`.
- The Creator Dashboard **Moderation > Bans** page shows public and private reasons and ban history. Unbanning doesn't erase that history.

## Lessons from the DevForum

### Scope mismatches make unbans silently fail

IDMC48 (Jul 2024) banned a test alt, and the main account was banned too. Later `UnbanAsync` calls seemed to do nothing. Staff member oopsiemachine found the cause: the ban was **place-level**, but the unban was **universe-level**. The docs say an unban only clears a ban with the **same `ApplyToUniverse` scope**. Always send the same scope you banned with, and save it in your logs.

### Test alt detection carefully

That same thread is a warning: if you test bans on an alt from your own household or device, alt propagation can lock out **your main account too**. Use `ExcludeAltAccounts = true` for tests, or test with accounts you don't care about losing.

### Alt detection isn't a wall

GeorgeOfAIITrades (Nov 2025 feature request) reported a player rejoining on fresh accounts, including seven accounts made in 13 minutes, which the alt ban didn't stop. Developers asked to see which original account triggered an alt ban. creaco guessed privacy was why that's hidden; there was no staff reply. **Plan for repeat offenders.** Combine bans with server-side detection, so new accounts are caught by the same checks.

## Original wrapper

```lua
-- ServerScriptService/Moderation (ModuleScript)
local Players = game:GetService("Players")
local Moderation = {}

function Moderation.ban(userId: number, seconds: number, publicReason: string, privateNote: string, universe: boolean?)
	assert(seconds == -1 or seconds > 0, "Duration must be -1 or positive")
	local config = {
		UserIds = { userId },
		Duration = seconds,
		DisplayReason = publicReason:sub(1, 400),
		PrivateReason = privateNote:sub(1, 1000), -- store evidence ids / detector name here
		ApplyToUniverse = universe ~= false,
		ExcludeAltAccounts = false,
	}
	local ok, err = pcall(Players.BanAsync, Players, config)
	if not ok then
		warn("[Moderation] ban failed, retry later:", err)
	end
	return ok, config.ApplyToUniverse -- keep the scope in your logs for the matching unban
end

function Moderation.unban(userId: number, universe: boolean)
	return pcall(Players.UnbanAsync, Players, { UserIds = { userId }, ApplyToUniverse = universe })
end

return Moderation
```

## Good practice

- Escalate using `GetBanHistoryAsync`, for example 1 day, then 7 days, then permanent.
- Put the **detector name and evidence** in `PrivateReason` so appeals can be checked.
- Publish your rules and an appeal route. The BanAsync docs recommend both.
- Never ban automatically based on one heuristic, such as a single speed spike. Ban after repeated flags (see [[Anti-Cheat Reality Check - What Servers Can and Cannot Catch]]).

## Credits

Roblox Creator Hub: *Players.BanAsync*, *UnbanAsync* and *Bans* (CC BY 4.0). DevForum: IDMC48, oopsiemachine (Roblox staff), LvieReal, Abcreator (*UnbanAsync() does not work*, 2024); GeorgeOfAIITrades, creaco, Reapimus and others (*Add further Alt Prevention to BanAsync*, 2025). The wrapper is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Bans]] · [[Server-side detection and consequencing]] · [[Anti-Cheat Reality Check - What Servers Can and Cannot Catch]] · [[Admin Command Safety - Server-Side Permission Checks]] · [[MessagingService Cross-Server Patterns and Limits]]

<!-- TDOD_GRAPH_END -->
