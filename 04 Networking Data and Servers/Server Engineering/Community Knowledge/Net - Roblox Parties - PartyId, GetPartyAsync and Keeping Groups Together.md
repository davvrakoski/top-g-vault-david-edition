---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Roblox Parties - PartyId, GetPartyAsync and Keeping Groups Together"
tags: [roblox, community-knowledge, server-engineering, party, socialservice, teleport, matchmaking]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SocialService
  - https://create.roblox.com/docs/reference/engine/classes/Player#PartyId
  - https://create.roblox.com/docs/studio/testing-modes
  - https://about.roblox.com/newsroom/2024/12/join-the-party-on-roblox
  - https://en.help.roblox.com/hc/en-us/articles/32461054421012-Party-FAQ
---
# Roblox Parties - PartyId, GetPartyAsync and Keeping Groups Together

Roblox has a platform-level **Party** feature (announced December 2024 in the Roblox newsroom: groups of up to six friends join an experience together and can move between experiences as a group; party chat is 13+, and parents can restrict Party for under-13s). Roblox also claimed sessions with friends average 1.9x longer than solo sessions, which is the business case for supporting it. Players form the party in the Roblox app, not in your game. If your game ignores it, the party splits the first time you teleport them, put them in a queue, or assign teams. Roblox's Party FAQ (help center, read via search summary only, so treat as unverified) says that when creators integrate the Party API, members can spawn together, teleport between places without being separated and stay on the same team. The API surface is small; this note shows how to use it.

## The API

| Member | Where | What it gives you |
| --- | --- | --- |
| `Player.PartyId` | Server (property is NotReplicated) | String party id, `""` if not in a party |
| `SocialService:GetPlayersByPartyId(partyId)` | Server | Party members **in this server**, as Player objects |
| `SocialService:GetPartyAsync(partyId)` | Server, yields | All members **in the experience across servers**, ordered by when they accepted the invite, each with `UserId`, `PlaceId`, `JobId`, `PrivateServerId`, `ReservedServerAccessCode` |

The first entry of `GetPartyAsync` is the earliest to accept, which makes a reasonable "leader" when you need one (the docs describe the ordering; using it as leader is our convention).

Test in Studio with the **Party Simulator** (Server & Clients test mode): it assigns test players to simulated parties and both SocialService methods return simulated data.

## Pattern 1: same team, same spawn

```lua
local Players = game:GetService("Players")
local SocialService = game:GetService("SocialService")

local function teamForJoiner(player: Player): Team?
	if player.PartyId == "" then return nil end
	for _, other in SocialService:GetPlayersByPartyId(player.PartyId) do
		if other ~= player and other.Team then
			return other.Team -- join whichever team the party already has
		end
	end
	return nil
end
```

Fall back to normal balancing when the party's team is full; a 6-person party cannot always fit a 4-player team, so decide the rule (split by join order, or move the whole party) and show it.

## Pattern 2: teleport the party together

When the leader starts a match or enters a dungeon:

1. Collect `GetPlayersByPartyId(leader.PartyId)` in this server.
2. Reserve a server once (`TeleportService:ReserveServer` or `TeleportOptions.ShouldReserveServer = true`) and `TeleportAsync` all of them in **one call**, so they land together ([[TeleportService Flows With Data and Reserved Servers]]).
3. Members on other servers: call `GetPartyAsync`, and for each remote member publish a "join us" message on a MessagingService topic with the reserved access code; their server teleports them after a confirmation prompt ([[MessagingService Cross-Server Patterns and Limits]]).

Do not use `TeleportPartyAsync`; it is deprecated in favour of `TeleportAsync`.

## Pattern 3: catching up with a party that is elsewhere

On join, if a player is in a party but no party member is in this server, `GetPartyAsync` tells you where they are. If a member's entry has a `ReservedServerAccessCode`, you can teleport the newcomer into that reserved server with `TeleportOptions.ReservedServerAccessCode`; if it is a public server, use `ServerInstanceId = JobId`. Ask first ("Join your party in Dungeon 3?") rather than teleporting on spawn.

## Pattern 4: queues and matchmaking

Treat a party as one queue ticket with a size. Your MemoryStore matchmaker fills teams with tickets, never splitting one ([[MemoryStore Queues and Sorted Maps for Matchmaking]]). Roblox's own server matchmaking already has a Friends signal that favours servers containing the joiner's friends, and the newsroom post says party members join the same instance; check your matchmaking weights if parties report being split (see [[Net - Custom Matchmaking - Signals, Weights and Server Attributes]]).

## Pitfalls

- Reading `PartyId` on the client: it is not replicated. Send the client what it needs (party member names for a UI) from the server.
- Calling `GetPartyAsync` every frame or per player per second. It yields and hits a web service; call it on join, on match start, and on demand, with `pcall`.
- Assuming the party never changes: members leave and join mid-session. Re-read on important actions rather than caching for the whole session.
- Mixing your own in-game party system with platform parties without a clear rule. If you keep both, let the platform party seed your in-game party on join.

## Related
[[Server Engineering - Hub]] · [[Social Systems - Parties, Friends and Co-Play]] · [[Net - Friends-Only and Invite-Only Servers - Join Gates]] · [[Racing - Race Matchmaking, Class Queues and Private Lobbies]]
