---
title: "Custom text chat commands"
description: "Learn how to create custom chat commands."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/examples/custom-text-chat-commands"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to create custom chat commands.*

[[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] has built-in chat commands for common purposes, such as muting other players and using avatar emotes. You can enable them by setting [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultCommands|CreateDefaultCommands]] to `true` in Studio's **Properties** window.

You can also add custom commands using [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]]. Users sending a defined command in the chat input bar trigger a callback defined by [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered|TextChatCommand.Triggered]] to perform your customized actions.

The following example shows how to create a chat command that allows players to increase or decrease their character's size when they input `/super` or `/mini`.

1. Add a [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] instance inside [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].
2. Rename it to **SizeCommand**.

   *(image in the full Top G Vault)*

3. Set its [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] property to `/super` and its [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]] to `/mini`.

   *(image in the full Top G Vault)*

4. Insert the following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] inside [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] to define a callback for the chat command that scales the character's size:

		```lua title="Script" highlight="4,6"
		local TextChatService = game:GetService("TextChatService")
		local Players = game:GetService("Players")

		local sizeCommand: TextChatCommand = TextChatService:WaitForChild("SizeCommand")

		sizeCommand.Triggered:Connect(function(textSource, message)
			local scaleMult = 1
			local messageWords = string.split(message, " ")
			if messageWords[1] == "/super" then
				scaleMult = 2
			elseif messageWords[1] == "/mini" then
				scaleMult = 0.5
			end

			local player = Players:GetPlayerByUserId(textSource.UserId)
			if player then
				local character = player.Character
				if character then
					local humanoid = character:FindFirstChildWhichIsA("Humanoid")
					if humanoid then
						for _, child in humanoid:GetChildren() do
							if child:IsA("NumberValue") then
								child.Value *= scaleMult
							end
						end
					end
				end
			end
		end)
		```

   [Video: Text-Custom-Command.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/players/in-experience-text-chat/Text-Custom-Command.mp4)

---
*Source: [Custom text chat commands](https://create.roblox.com/docs/chat/examples/custom-text-chat-commands) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
