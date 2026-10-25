---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Join, Leave and Server Messages in Chat"
tags: [roblox, community-knowledge, scripting, recipe, luau, textchatservice, system-messages, chat, announcements]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TextChannel
  - https://create.roblox.com/docs/chat/chat-window
  - https://create.roblox.com/docs/chat/platform-integrated-chat
  - https://create.roblox.com/docs/reference/engine/classes/TextService
---
# Recipe - Join, Leave and Server Messages in Chat

Coloured system lines in the chat window: "Alex joined the server", "Round starts in 10 seconds", "Sam found the golden key!". They make a server feel alive and are the cheapest way to announce game events. The key API fact: `TextChannel:DisplaySystemMessage` **only works on the client** (a LocalScript, or a Script with `RunContext = Client`), shows the line to that one user, and the docs say these messages **are not automatically filtered or localized**. So the server sends *what happened* and each client writes the line, and you never pass player-typed text through it unfiltered.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Announce` | ModuleScript | `ServerScriptService` |
| `SystemChat` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `AnnounceEvent` | RemoteEvent | `ReplicatedStorage` (created by the module) |

Join/leave lines need no server code: every client already sees `Players.PlayerAdded` and `PlayerRemoving` for everyone.

## Server: a tiny announcer
```lua
-- ServerScriptService/Announce (ModuleScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = Instance.new("RemoteEvent")
event.Name = "AnnounceEvent"
event.Parent = ReplicatedStorage

local Announce = {}

-- kind: "info" | "success" | "warning"; text: written by YOU, never raw player input
function Announce.all(kind: string, text: string)
	event:FireAllClients(kind, text)
end

function Announce.to(player: Player, kind: string, text: string)
	event:FireClient(player, kind, text)
end

return Announce
```
Example from a round script: `Announce.all("success", "Winner: " .. winner.DisplayName)`. Display names are already approved by Roblox; a pet name or sign text typed by a player is **not**, and must go through `TextService:FilterStringAsync(...)` then `GetNonChatStringForBroadcastAsync()` on the server before you include it (see [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]).

## Client: write the lines
```lua
-- StarterPlayerScripts/SystemChat (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

local general = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral") :: TextChannel
local event = ReplicatedStorage:WaitForChild("AnnounceEvent") :: RemoteEvent

local COLORS = {
	join = "#8FD18F",
	leave = "#B0B0B0",
	info = "#7FC8FF",
	success = "#FFD966",
	warning = "#FF8A7A",
}

local function escape(s: string): string
	return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local function say(kind: string, text: string)
	local color = COLORS[kind] or COLORS.info
	-- metadata lets other scripts (or OnIncomingMessage) recognise our lines
	general:DisplaySystemMessage(`<font color="{color}">{escape(text)}</font>`, "Game." .. kind)
end

Players.PlayerAdded:Connect(function(p)
	say("join", `{p.DisplayName} joined the server`)
end)
Players.PlayerRemoving:Connect(function(p)
	say("leave", `{p.DisplayName} left`)
end)
event.OnClientEvent:Connect(function(kind, text)
	if type(kind) == "string" and type(text) == "string" then
		say(kind, text)
	end
end)

say("info", "Welcome! Press T to pick a team.")
```

## How to test
1. Start **Clients and Servers** with 2 players. Player 1's chat shows "Player2 joined the server" in green. Close Player 2: "Player2 left".
2. In the server command bar: `require(game.ServerScriptService.Announce).all("warning", "Lava rising!")`: both chats show a red-orange line.
3. `Announce.to(game.Players.Player1, "info", "Only you see this")`: only Player 1 gets it.
4. Send text containing `<b>`: it appears literally, not bold (escaped), so a stray `<` cannot break the line.

## Common mistakes
- **Calling `DisplaySystemMessage` from a server Script.** Per the API reference it is client-only; nothing appears.
- **Passing chat or typed text into it unfiltered.** The method does not filter. Filter on the server first, or do not show it.
- **Spamming the channel** with every coin pickup; keep system lines for events players care about, or use toasts ([[Recipe - Notification Toasts from the Server]]).
- **Assuming `RBXGeneral` exists.** It is created when `TextChatService.CreateDefaultTextChannels` is on (the default); with custom channels, target your own channel instead.
- `TextChatService.ChatVersion` is deprecated for new places: TextChatService is the only chat system, so legacy `Chat:Chat()`-style system messages from old tutorials do not apply.

## Related
[[Scripting - Hub]] · [[Policy - Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks]] · [[Recipe - Chat Commands with TextChatCommand]] · [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]
