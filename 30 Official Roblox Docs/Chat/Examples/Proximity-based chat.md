---
title: "Proximity-based chat"
description: "Learn how to implement exclusive chat for users who are close to each other in locations using the TextChatService."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/examples/proximity-chat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to implement exclusive chat for users who are close to each other in locations using the TextChatService.*

This example shows how to implement an exclusive chat for users who are near each other in the 3D world. It extends the callback with a function using [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] to identify the locations of a user who might be a potential message receiver. If this function returns `false`, it means that the user locates further than the preset valid range from the message sender, so the system doesn't deliver the message to that user.

Add the following to a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]:

```lua title="Server"
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

-- Get the chat channel for proximity-based chat
-- You can replace this general channel with a dedicated channel
local generalChannel: TextChannel = TextChatService:WaitForChild("TextChannels").RBXGeneral

-- Function to get the position of a user's character
local function getPositionFromUserId(userId: number)
	-- Get the player associated with the given user ID
	local targetPlayer = Players:GetPlayerByUserId(userId)

	-- If the player exists, get their character's position
	if targetPlayer then
		local targetCharacter = targetPlayer.Character
		if targetCharacter then
			return targetCharacter:GetPivot().Position
		end
	end

	-- Return a default position if the player or character cannot be found
	return Vector3.zero
end

-- Set the callback for the general channel to control message delivery
generalChannel.ShouldDeliverCallback = function(textChatMessage: TextChatMessage, targetTextSource: TextSource)
	-- Get the positions of the message sender and target
	local sourcePos = getPositionFromUserId(textChatMessage.TextSource.UserId)
	local targetPos = getPositionFromUserId(targetTextSource.UserId)

	-- Deliver message if distance between sender and target is less than 50 units
	return (targetPos - sourcePos).Magnitude < 50
end
```

---
*Source: [Proximity-based chat](https://create.roblox.com/docs/chat/examples/proximity-chat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
