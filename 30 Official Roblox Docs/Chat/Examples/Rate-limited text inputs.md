---
title: "Rate-limited text inputs"
description: "Learn how to implement a rate limit for any text field that might be used by players to conduct a conversation."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/examples/rate-limit-public-text-inputs"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to implement a rate limit for any text field that might be used by players to conduct a conversation.*

This example shows how to implement a rate limit of 1 minute on a text input field that allows players to post notes to a community bulletin board.

Add the following to a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]:

```lua title="Server"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create RemoteEvent for communication
local postNoteEvent = Instance.new("RemoteEvent")
postNoteEvent.Name = "PostNoteEvent"
postNoteEvent.Parent = ReplicatedStorage

-- Rate limit of one note per minute per player
local COOLDOWN_TIME = 60 -- Time in seconds
local lastPostTime = {}

local function canPlayerPost(player)
	local userId = player.UserId
	local currentTime = tick()

	if lastPostTime[userId] then
		local timeSinceLastPost = currentTime - lastPostTime[userId]
		if timeSinceLastPost < COOLDOWN_TIME then
			return false, COOLDOWN_TIME - timeSinceLastPost
		end
	end

	return true, 0
end

-- Handle post requests with rate limit and text filtering
postNoteEvent.OnServerEvent:Connect(function(player, noteData)
	local canPost, cooldown = canPlayerPost(player)

	if not canPost then
		postNoteEvent:FireClient(player, "cooldown", math.ceil(cooldown))
		return
	end

	-- All text shared publicly must go through a text filter
	local filterResult = getFilterResult(noteData.text, player.UserId)
	if filterResult then
		local success, filteredText = pcall(function()
		return filterResult:GetNonChatStringForBroadcastAsync()
	end)

	if success then
		-- Create the note
		local note = {
			text = filteredText
		}
		-- Update last post time
		lastPostTime[player.UserId] = tick()

		-- Send success response
		postNoteEvent:FireClient(player, "success", note)

		-- Broadcast new note to all players
		postNoteEvent:FireAllClients("newNote", note)
	else
		warn("Error filtering text!")
	end
end)

-- Clean up when player leaves
Players.PlayerRemoving:Connect(function(player)
	lastPostTime[player.UserId] = nil
end)
```

---
*Source: [Rate-limited text inputs](https://create.roblox.com/docs/chat/examples/rate-limit-public-text-inputs) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
