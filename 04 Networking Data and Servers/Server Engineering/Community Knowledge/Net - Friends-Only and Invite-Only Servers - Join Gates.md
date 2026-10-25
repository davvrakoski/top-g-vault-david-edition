---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Friends-Only and Invite-Only Servers - Join Gates"
tags: [roblox, community-knowledge, server-engineering, private-servers, reserved-servers, friends, invites]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Player#IsFriendsWithAsync
  - https://create.roblox.com/docs/reference/engine/classes/Player#GetJoinData
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#PrivateServerOwnerId
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService#ReserveServer
  - https://create.roblox.com/docs/reference/engine/classes/SocialService#PromptGameInvite
  - https://create.roblox.com/docs/matchmaking
---
# Friends-Only and Invite-Only Servers - Join Gates

Players often want a server that only their friends can join: building games, roleplay, co-op horror, a creative "my base" mode. Roblox gives you three building blocks (paid private servers, reserved servers, and friend checks), but not a "friends-only" switch. This note shows how to combine them into a server that strangers cannot enter, and how to gate joins on the server where it cannot be bypassed.

## Know which door players come through

| Door | Who can use it | Gate needed? |
| --- | --- | --- |
| Public matchmaking (Play button) | Anyone | Cannot filter by friendship; matchmaking only scores servers ([[Net - Custom Matchmaking - Signals, Weights and Server Attributes]]) |
| Join a friend from profile / follow | Friends of someone inside (subject to their privacy settings) | Sometimes |
| Paid private server (VIP) | Owner and people they allow in the Roblox UI | Roblox handles access |
| Reserved server (`ReserveServer`) | Only players your servers teleport with the access code | Your code is the gate |

Matchmaking never places random players into private or reserved servers (docs). So the reliable way to build "friends only" is a **reserved server** your game hands out.

## Pattern: a host-owned reserved server

1. Host clicks "Create friends-only server" in a lobby or the public game.
2. Lobby server calls `TeleportService:ReserveServer(placeId)` (or uses `TeleportOptions.ShouldReserveServer`), gets an access code and private server id.
3. Store a small record in a MemoryStore hash map keyed by host UserId, with a TTL slightly longer than a session: `{code, privateServerId, mode = "friends", createdAt}` ([[MemoryStore HashMap Patterns and Quota Math]]).
4. Teleport the host there with teleport data `{hostId = host.UserId, mode = "friends"}`.
5. Friends who want to join click "Join <host>" in your UI. Their server reads the record, verifies friendship (below), and teleports them with the access code.

Players can only reach the reserved server through your teleports, so the friendship check in step 5 is the real gate. Re-check inside the server anyway (defence in depth, and because records can be stale).

## The in-server gate

```lua
local Players = game:GetService("Players")
local hostId: number? = nil
local mode = "friends"

local function allowed(player: Player): boolean
	if hostId == nil or player.UserId == hostId then return true end
	if mode == "invite" then
		return inviteList[player.UserId] == true
	end
	local ok, isFriend = pcall(player.IsFriendsWithAsync, player, hostId)
	return ok and isFriend -- fail closed if the web call errors
end

Players.PlayerAdded:Connect(function(player)
	local join = player:GetJoinData()
	if hostId == nil and join.TeleportData and join.SourcePlaceId == LOBBY_PLACE_ID then
		hostId = join.TeleportData.hostId
		mode = join.TeleportData.mode or "friends"
	end
	if not allowed(player) then
		player:Kick("This is a friends-only server.")
	end
end)
```

Why these choices:

- Read settings from `Player:GetJoinData()` on the server. The docs guarantee that its teleport data was sent by a Roblox server in the last 48 hours and that `SourcePlaceId` is real, so you can trust it if you check the source place. The client-side teleport data getter has no such guarantee.
- `IsFriendsWithAsync` replaces the deprecated `IsFriendsWith`; results are cached, so an unfriend may take a while to take effect.
- Fail closed on errors, but log them; if the friends API is down, nobody new joins rather than everybody.

## Invite-only and inviting from inside

- Keep `inviteList` in the server, editable by the host through a validated remote, and mirrored to the MemoryStore record so lobby servers can check it before teleporting.
- `SocialService:PromptGameInvite(player, options)` opens Roblox's invite UI so the host can invite friends who are not playing. Invited players arrive through public matchmaking or the lobby, so put a "Join <host>" button where they land.

## Paid private servers

If your game sells private servers, `game.PrivateServerOwnerId` (non-zero only in paid private servers) and `game.PrivateServerId` tell you you are in one ([[Detecting Server Type - Public, Private, Reserved and Studio]]). Roblox already controls who can enter; use the owner id to grant host tools (kick, settings) and skip your gate.

## Pitfalls

- Hiding a public server from your server browser and calling it private. Profile joins still work.
- Storing access codes where clients can read them (attributes, ReplicatedStorage). Anyone with the code and a teleport path can enter; keep codes server-side.
- Running the gate after the profile loads: a kicked player then triggers a session lock and a pointless save. Gate first, load data only for admitted players.

## Related
[[Server Engineering - Hub]] · [[TeleportService Flows With Data and Reserved Servers]] · [[Net - Roblox Parties - PartyId, GetPartyAsync and Keeping Groups Together]] · [[Social Systems - Parties, Friends and Co-Play]]
