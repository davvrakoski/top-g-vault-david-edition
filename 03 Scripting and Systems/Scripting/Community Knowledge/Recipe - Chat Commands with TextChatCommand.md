---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Chat Commands with TextChatCommand"
tags: [roblox, community-knowledge, scripting, recipe, luau, textchatservice, textchatcommand, chat-commands, admin]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/chat/examples/custom-text-chat-commands
  - https://create.roblox.com/docs/reference/engine/classes/TextChatCommand
  - https://create.roblox.com/docs/chat/platform-integrated-chat
  - https://create.roblox.com/docs/reference/engine/classes/TextSource
---
# Recipe - Chat Commands with TextChatCommand

Slash commands players type in chat: `/afk`, `/respawn`, `/coins`, plus a staff-only `/kick name`. Old tutorials parse `Player.Chatted`; the official platform-integrated chat page says chat-triggered commands **must** use `TextChatCommand`, lists `Player.Chatted` and `OnIncomingMessage` as unsupported once platform-integrated chat is on, and says that mode becomes required for all games from May 2027. Build commands the new way now. A command message that matches an alias is intercepted and not shown to other players.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `ChatCommands` | Script | `ServerScriptService` |
| `Announce` | ModuleScript from [[Recipe - Join, Leave and Server Messages in Chat]] | `ServerScriptService` (for private replies) |

The script creates `TextChatCommand` instances under `TextChatService` at runtime, so there is nothing to place by hand. The official example sets `PrimaryAlias` to `/super`: aliases include the slash.

## The code
```lua
-- ServerScriptService/ChatCommands (Script)
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ServerScriptService = game:GetService("ServerScriptService")
local Announce = require(ServerScriptService:WaitForChild("Announce"))

local STAFF = { [0] = true } -- put staff UserIds here; never usernames
local lastUse: {[Player]: {[string]: number}} = {}

local function cooldownOk(player: Player, name: string, seconds: number): boolean
	local now = os.clock()
	lastUse[player] = lastUse[player] or {}
	local last = lastUse[player][name]
	if last and now - last < seconds then return false end
	lastUse[player][name] = now
	return true
end

-- register(name, "/primary", "/secondary" or nil, cooldown seconds, staffOnly, handler(player, args))
local function register(name: string, primary: string, secondary: string?, cooldown: number,
	staffOnly: boolean, handler: (Player, {string}) -> ())
	local command = Instance.new("TextChatCommand")
	command.Name = name
	command.PrimaryAlias = primary
	command.SecondaryAlias = secondary or ""
	command.Parent = TextChatService

	command.Triggered:Connect(function(source: TextSource, text: string)
		local player = Players:GetPlayerByUserId(source.UserId)
		if not player then return end
		if staffOnly and not STAFF[player.UserId] then return end -- silently ignore
		if not cooldownOk(player, name, cooldown) then
			Announce.to(player, "warning", "Slow down a little.")
			return
		end
		local args = string.split(text, " ")
		table.remove(args, 1) -- drop the alias itself
		local ok, err = pcall(handler, player, args)
		if not ok then warn(`/{name} failed:`, err) end
	end)
end

register("Afk", "/afk", nil, 2, false, function(player)
	local now = not player:GetAttribute("AFK")
	player:SetAttribute("AFK", now)
	Announce.to(player, "info", if now then "You are now AFK." else "Welcome back!")
end)

register("Respawn", "/respawn", "/re", 10, false, function(player)
	if player:GetAttribute("InRound") then
		Announce.to(player, "warning", "You cannot respawn during a round.")
		return
	end
	player:LoadCharacterAsync()
end)

register("Coins", "/coins", nil, 1, false, function(player)
	local stats = player:FindFirstChild("leaderstats")
	local coins = stats and stats:FindFirstChild("Coins")
	Announce.to(player, "info", `You have {coins and coins.Value or 0} coins.`)
end)

register("Kick", "/kick", nil, 1, true, function(staff, args)
	local query = args[1] and string.lower(args[1])
	if not query or query == "" then
		Announce.to(staff, "warning", "Usage: /kick name")
		return
	end
	for _, p in Players:GetPlayers() do
		if string.lower(p.Name) == query or string.lower(p.DisplayName) == query then
			if STAFF[p.UserId] then
				Announce.to(staff, "warning", "You cannot kick staff.")
				return
			end
			p:Kick("Removed by a moderator.")
			Announce.to(staff, "success", `Kicked {p.Name}.`)
			return
		end
	end
	Announce.to(staff, "warning", "No player with that name here.")
end)

Players.PlayerRemoving:Connect(function(p) lastUse[p] = nil end)
```

## How to test
1. Play. Type `/coins` in chat: a private system line shows your balance; other test players see nothing.
2. Type `/afk` twice: the AFK attribute flips, and with [[Recipe - AFK Detection]] installed the overhead tag follows it (that recipe redraws on attribute change). Its client script clears AFK again on your next input, which is usually what players expect.
3. Type `/re` twice within 10 s: the second time says "Slow down".
4. Put your own UserId in `STAFF` and run **Clients and Servers** with 2 players: `/kick Player2` removes Player 2. Without the staff entry, `/kick` does nothing.
5. Toggle `TextChatService.PlatformIntegratedChat` to Enabled in Studio and repeat 1-4. If argument text (`text`) comes back empty in that mode, commands with arguments need a UI instead (behaviour under platform-integrated chat **unverified** here).

## Common mistakes
- **Checking staff by username.** Names can change; UserIds cannot.
- **Using `Player.Chatted`** for new commands: listed as unsupported under platform-integrated chat.
- **Alias without the slash**: then the plain word "afk" in normal chat triggers it.
- **Name clashes** with built-in commands. With `CreateDefaultCommands` on, Roblox adds its own (for example `/e` emotes and `/w` whispers); look at what appears under `TextChatService` during Play and avoid those aliases.
- **Replying with `DisplaySystemMessage` from the server**: it is client-only, hence the `Announce` remote.
- Bigger admin systems and their safety rules: [[Admin Command Safety - Server-Side Permission Checks]] and [[QA Test Commands - Gated Cheats for Testers]].

## Related
[[Scripting - Hub]] · [[Admin Command Safety - Server-Side Permission Checks]] · [[Recipe - Join, Leave and Server Messages in Chat]] · [[Policy - Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks]]
