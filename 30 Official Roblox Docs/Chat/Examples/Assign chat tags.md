---
title: "Assign chat tags"
description: "Example of how to assign chat tags to players based on their membership in a group."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/examples/group-chat-tags"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Example of how to assign chat tags to players based on their membership in a group.*

This example demonstrates how to assign **chat tags** to players based on their membership in a [[30 Official Roblox Docs/Projects/Groups (teams)|group]]. Chat tags are a way to visually identify a player in the chat window and useful for indicating a player's role or status.

*(image in the full Top G Vault)*

Because [[30 Official Roblox Docs/Chat/Text chat overview#Text chat hooks and callbacks|text chat callbacks]] expect a non-yielding callback, attempting to query the group membership status of a player in the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] callback is not recommended, as it may cause the chat system to hang or become unresponsive.

Instead, set a player [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] when they join the server. Setting an attribute lets you reuse the player's status in other parts of your game such as allowing access to particular areas or providing bonus experiences.

1. Create a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] and add the following code to it:

		```lua title="Server"
		local Players = game:GetService("Players")

		-- Replace 123456 with the group ID you want to check for
		local groupID = 123456

		Players.PlayerAdded:Connect(function(player)
			local success, isInGroup = pcall(function()
				return player:IsInGroupAsync(groupID)
			end)

			if success and isInGroup then
				player:SetAttribute("IsVIP", true)
			else
				player:SetAttribute("IsVIP", false)
			end
		end)
		```

2. Create a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] ⟩ [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] and add the following code to display a **\[VIP\]** tag in the chat window:

		```lua title="Client"
		local Players = game:GetService("Players")
		local TextChatService = game:GetService("TextChatService")

		TextChatService.OnIncomingMessage = function(message: TextChatMessage)
			local textSource = message.TextSource
			if textSource then
				local player = Players:GetPlayerByUserId(textSource.UserId)
				if player then
					if player:GetAttribute("IsVIP") == true then
						local overrideProperties = Instance.new("TextChatMessageProperties")
						overrideProperties.PrefixText = "[VIP] " .. message.PrefixText
						return overrideProperties
					end
				end
			end

			return nil
		end
		```

---
*Source: [Assign chat tags](https://create.roblox.com/docs/chat/examples/group-chat-tags) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
