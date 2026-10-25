---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Custom Matchmaking - Signals, Weights and Server Attributes"
tags: [roblox, community-knowledge, server-engineering, matchmaking, skill, latency, region]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/matchmaking
  - https://create.roblox.com/docs/matchmaking/scoring
  - https://create.roblox.com/docs/matchmaking/attributes-and-signals
  - https://create.roblox.com/docs/matchmaking/customize-matchmaking
  - https://create.roblox.com/docs/matchmaking/analytics
---
# Custom Matchmaking - Signals, Weights and Server Attributes

When someone presses Play, Roblox picks the public server they join. Most developers never touch that choice and then build MemoryStore matchmakers and teleports to fix things the built-in system can already do: keep new players with new players, group by language, prefer low ping, or send people to servers running a particular mode. **Custom matchmaking** (Creator Dashboard > Configurations > Custom matchmaking) lets you change how servers are scored, without code for the common cases and with a small API for server-side data.

## How a join is matched (docs)

1. Player requests to join a place.
2. Eligible servers are found; servers that are **full, private, reserved or about to shut down are filtered out**.
3. Each eligible server gets a score: the weighted sum of signal scores (each signal is 0-1).
4. Highest score wins.

So custom matchmaking only affects joins into **public servers**. Reserved-server flows (dungeons, matches) still need your own matchmaker ([[MemoryStore Queues and Sorted Maps for Matchmaking]]).

## Default weights

| Signal | Weight | Meaning |
| --- | --- | --- |
| Friends | 15 | Server has a friend or someone on the same IP |
| Latency | 3 | Delta ping above the player's best datacenter (max relevant 100 ms) |
| Text Chat | 3 | Share of players the joiner can text chat with |
| Occupancy | 2 | Fuller servers score higher |
| Play History | 2 | Similar log10 minutes played in last 28 days |
| Language | 2 | Same language share |
| Age | 1 | Similar average age (max relevant difference 25) |
| Voice Chat | 1 | Share with voice enabled |
| Device Type | 0 | Same device share (off by default) |

Friends outweighs all others combined, so a friend's server always wins if eligible. Only relative magnitudes matter, and a weight of 0 disables a signal.

## Tuning with built-in signals only

- **Competitive or physics-heavy game:** raise Latency (for example to 8). Players get servers near their best datacenter; there is no region API needed for this ([[Net - Server Region Labels - Locating Servers for a Server Browser]]).
- **Social hangout:** raise Occupancy so servers fill and feel alive; keep Friends high.
- **Console or mobile controls matter (PvP aim):** give Device Type a small weight to cluster input types.
- **Onboarding:** raise Play History so new players meet other new players instead of veterans with maxed gear.

## Custom attributes and signals

Limits per game (docs): **5 player attributes, 5 server attributes, 2 custom signals**.

**Player attributes** live in a DataStore you already write. You give the dashboard the data store name, a key template such as `User_{UserId}` and a JSON value path (for example `stats.elo`). Matchmaking reads the value from your save, so design your schema with a top-level, stable path for anything you want matched on ([[Net - Player Data Schema Design - Keys, Defaults and Size Budget]]).

**Server attributes** are set at runtime and last only as long as the server:

```lua
local MatchmakingService = game:GetService("MatchmakingService")
local RunService = game:GetService("RunService")

if RunService:IsStudio() then
	MatchmakingService:InitializeServerAttributesForStudio({ Mode = "Casual", Level = 1 })
end

local function setMode(mode: string)
	local ok, err = MatchmakingService:SetServerAttribute("Mode", mode)
	if not ok then warn("matchmaking attribute failed:", err) end
end
```

**Custom signals** turn attributes into scores:

- Player numerical: compare the joiner's value to the server's **Average**, **Median** or **Sum** (skill matching, level brackets, team strength cap).
- Player categorical: **Cluster** (same values together, such as preferred mode) or **Diversify** (mix values, such as roles).
- Server numerical / categorical: score servers by a server-side value (current map, mode, round phase).

## Recipes

1. **Skill-based public lobbies:** player attribute `elo` (numerical, Average), weight ~4. Keep Friends above it so groups are not split.
2. **Mode servers in one place:** server attribute `Mode`, player attribute `preferredMode` (categorical, Cluster). Servers set `Mode` when they pick a playlist.
3. **Do not join mid-boss:** server attribute `Phase` (numerical); set to 1 during the last minutes of a round so a server-numerical signal scores it low and joiners land in fresh servers. (Idea, not a documented example: confirm in the signal preview how your server-numerical signal maps values to scores.)

## Verify before and after

- The configuration page has **preview and test** with mock servers; try edge cases (one friend in a full-skill-mismatch server).
- The **Analytics** tab under Custom matchmaking charts signal values per place for up to 90 days; compare retention and session length before and after a weight change, one change at a time.

## Related
[[Server Engineering - Hub]] · [[Custom Server Browser with MemoryStore and TeleportAsync]] · [[Net - Roblox Parties - PartyId, GetPartyAsync and Keeping Groups Together]] · [[Detecting Server Type - Public, Private, Reserved and Studio]]
