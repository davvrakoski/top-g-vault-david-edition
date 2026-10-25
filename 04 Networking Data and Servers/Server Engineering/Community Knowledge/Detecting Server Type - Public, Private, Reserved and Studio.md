---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Detecting Server Type - Public, Private, Reserved and Studio"
tags: [roblox, community-knowledge, server-engineering, private-servers, reserved-servers, teleportservice]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#PrivateServerId
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#PrivateServerOwnerId
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService#ReserveServerAsync
  - https://create.roblox.com/docs/reference/engine/classes/RunService#IsStudio
---
# Detecting Server Type - Public, Private, Reserved and Studio

The same place code often runs in four very different contexts: a public server anyone can join, a private (VIP) server a player paid for, a reserved server your matchmaker created for a match, and a Studio test. Many features should behave differently: owner-only admin commands in private servers, no lobby wait in a reserved match, no leaderboard writes from private servers where friends can farm each other. Roblox gives you two `DataModel` properties to tell them apart; this note is the decision table and a small module.

## The two properties

- `game.PrivateServerId` (string): empty for standard public servers; set for **both** private servers and reserved servers.
- `game.PrivateServerOwnerId` (number): the owner's UserId for a **player-owned private server**; `0` for standard and reserved servers.

Also useful: `game.JobId` (this server instance), `game.PlaceVersion` (build running) and `RunService:IsStudio()`.

## Decision table

| PrivateServerId | PrivateServerOwnerId | Server type |
| --- | --- | --- |
| `""` | `0` | Public (standard) server |
| non-empty | non-zero | Player-owned private server |
| non-empty | `0` | Reserved server (made by `TeleportService:ReserveServerAsync`) |

Studio play tests look like a public server, so check `RunService:IsStudio()` first.

```lua
local RunService = game:GetService("RunService")

local ServerType = {}

function ServerType.get(): string
	if RunService:IsStudio() then return "Studio" end
	if game.PrivateServerId == "" then return "Public" end
	if game.PrivateServerOwnerId ~= 0 then return "Private" end
	return "Reserved"
end

function ServerType.isOwner(player: Player): boolean
	return game.PrivateServerOwnerId ~= 0 and player.UserId == game.PrivateServerOwnerId
end

return ServerType
```

## Private server ID is not a server instance ID

The DataModel docs point out that a private or reserved server can have **many server instances over time**: when everyone leaves, the instance shuts down, and the next visitor starts a new instance with the same `PrivateServerId` but a new `JobId`. Use `PrivateServerId` as the key for anything that should persist across those restarts (a private server's custom settings, a reserved match's state stored in a DataStore or MemoryStore).

## Common uses

1. **Owner tools.** In player-owned private servers, let `isOwner` players change time of day, kick, or toggle PvP. Always check on the server on every command.
2. **Economy protection.** Disable or reduce global leaderboard writes, trading or rare drops in private servers if friends can farm cooperatively. Tell players clearly in the UI.
3. **Reserved match flow.** In reserved servers, read the match config from the teleport data or a MemoryStore keyed by `PrivateServerId`, skip the lobby, and shut down cleanly when the match ends.
4. **Analytics.** Tag every analytics event or log line with the server type so private-server farming does not skew your economy dashboards.
5. **Free private servers.** If you set private servers to free, expect many more of them; budget DataStore and MemoryStore use per server type.

## Pitfalls

- Treating `PrivateServerId ~= ""` as "player-owned". Reserved servers match too; check `PrivateServerOwnerId`.
- Using the private server owner check on the client to show admin UI and trusting it for actions. Show UI from the client if you like, but execute only after the server check.
- Forgetting that the owner may not be in the server. Owner-only settings must be stored so they apply when the owner is absent.
- Teleport data is client-visible and can be tampered with on the way; for reserved matches, keep authoritative config server-side (MemoryStore/DataStore keyed by PrivateServerId or the access code).

## Related
[[Server Engineering - Hub]] - [[TeleportService Flows With Data and Reserved Servers]] - [[MessagingService Cross-Server Patterns and Limits]] - [[Server Load Shedding]]
