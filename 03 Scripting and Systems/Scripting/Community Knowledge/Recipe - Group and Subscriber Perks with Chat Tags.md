---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Group and Subscriber Perks with Chat Tags"
tags: [roblox, community-knowledge, scripting, recipe, luau, groups, perks, textchatservice, chat-tags, attributes]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/GroupService
  - https://create.roblox.com/docs/chat/examples/group-chat-tags
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
---
# Recipe - Group and Subscriber Perks with Chat Tags

Reward players who join your Roblox community group (and, optionally, players with an active Roblox subscription) with a small perk, such as +10% coins, plus a coloured `[Group]` tag in chat. Group perks are a cheap way to grow a community you can announce updates to. Two API details matter in 2026: `Player:IsInGroup` is **deprecated** in favour of `Player:IsInGroupAsync`, and `Player.MembershipType` is **deprecated** in favour of `Player.HasRobloxSubscription`.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `Perks` | ModuleScript | `ServerScriptService` |
| `PerksBoot` | Script | `ServerScriptService` |
| `ChatTags` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `JoinGroupButton` (optional) | LocalScript | inside a `TextButton` |

The server checks membership once and stores the result as **attributes on the Player**. Attributes set by the server replicate to every client, so the chat-tag script can read them; a client cannot fake them for other players.

## Server
```lua
-- ServerScriptService/Perks (ModuleScript)
local Perks = {}
Perks.GROUP_ID = 0            -- your group ID
Perks.GROUP_BONUS = 0.10      -- +10% coins
Perks.SUBSCRIBER_BONUS = 0.05 -- optional

function Perks.coinMultiplier(player: Player): number
	local mult = 1
	if player:GetAttribute("InGroup") then mult += Perks.GROUP_BONUS end
	if player:GetAttribute("Subscriber") then mult += Perks.SUBSCRIBER_BONUS end
	return mult
end

return Perks
```
```lua
-- ServerScriptService/PerksBoot (Script)
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local Perks = require(ServerScriptService:WaitForChild("Perks"))

local function refreshSubscriber(player: Player)
	player:SetAttribute("Subscriber", player.HasRobloxSubscription)
end

local function onPlayer(player: Player)
	refreshSubscriber(player)
	if Perks.GROUP_ID ~= 0 then
		local ok, inGroup = pcall(player.IsInGroupAsync, player, Perks.GROUP_ID)
		if ok then
			player:SetAttribute("InGroup", inGroup)
		else
			warn("Group check failed for", player.UserId, inGroup)
			player:SetAttribute("InGroup", false) -- fail closed; no perk this session
		end
	end
end

Players.PlayerAdded:Connect(onPlayer)
for _, p in Players:GetPlayers() do task.spawn(onPlayer, p) end
Players.PlayerMembershipChanged:Connect(refreshSubscriber)
```
Use it wherever coins are paid: `PlayerData.addCoins(player, math.floor(base * Perks.coinMultiplier(player)))`.

## Client: chat tags
```lua
-- StarterPlayerScripts/ChatTags (LocalScript)
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local props = Instance.new("TextChatMessageProperties")
	local source = message.TextSource
	if not source then return props end -- system messages have no source
	local sender = Players:GetPlayerByUserId(source.UserId)
	if not sender then return props end

	local tag = ""
	if sender:GetAttribute("InGroup") then
		tag ..= "<font color='#6FC3FF'>[Group]</font> "
	end
	if sender:GetAttribute("Subscriber") then
		tag ..= "<font color='#F5CD30'>[Sub]</font> "
	end
	if tag ~= "" then
		props.PrefixText = tag .. message.PrefixText
	end
	return props
end
```
`OnIncomingMessage` is a single callback: only one script may set it. If you already set it elsewhere, merge the tag logic there.

> [!warning] Platform-integrated chat
> The official "Platform-integrated chat" page lists `TextChatMessage.PrefixText` and `OnIncomingMessage` as **unsupported** once `TextChatService.PlatformIntegratedChat` is enabled, and says platform-integrated chat becomes required for all games starting **May 2027**. Chat tags built this way are therefore a stop-gap: keep the perk logic (attributes, coin multiplier), and plan to show the tag somewhere you control instead, such as an overhead BillboardGui or the player list.

## Optional: an in-game "Join group" button
```lua
-- inside a TextButton (LocalScript)
local GroupService = game:GetService("GroupService")
local GROUP_ID = 0
script.Parent.Activated:Connect(function()
	local ok, status = pcall(GroupService.PromptJoinAsync, GroupService, GROUP_ID)
	if ok then print("Join prompt result:", status) end
end)
```
Per the docs, the server's `IsInGroupAsync` result is cached per server for that player, so a player who joins mid-session gets the perk **on their next join**. Say that on the button ("Perk applies next time you join").

## How to test
1. Set `GROUP_ID` to a group your test account is in. Play: in the server Explorer your Player shows `InGroup = true`.
2. Chat a message: it shows `[Group]` before your name. A second test player not in the group shows no tag.
3. Set `GROUP_ID` to a group you are not in: `InGroup = false`, no tag, multiplier 1.
4. Break the call (e.g. a nonsense ID like `-1`) and check that the pcall path warns and the game continues.
5. Studio test players (Player1, Player2 in a local server) have fake IDs; group results there are not meaningful. Do a final check in a live private server.

## Common mistakes
- **`IsInGroup`, `GetRankInGroup`, `MembershipType`.** All deprecated in the 2026 API reference; use `IsInGroupAsync`, `HasRobloxSubscription`, and for ranks look at the GroupService role APIs.
- **No pcall.** Group web calls can fail; an unprotected error stops the rest of `PlayerAdded` setup.
- **Perks that matter in PvP** (damage, health). Keep group perks cosmetic or economic, or players feel forced to join.
- **Calling the group API on every coin pickup.** Check once, store the attribute.
- Rich text in `PrefixText` must be valid; a missing `</font>` breaks the whole line.

## Related
[[Scripting - Hub]] · [[Roblox Communities as Your On-Platform Hub - Roles, Announcements and Forums]] · [[Deprecated Roblox APIs and Their Modern Replacements]] · [[Recipe - Join, Leave and Server Messages in Chat]]
