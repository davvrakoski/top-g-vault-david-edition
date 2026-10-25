---
title: "Text filtering"
description: "Text filtering prevents users from seeing inappropriate language and blocks personally identifiable information."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/text-filtering"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Text filtering prevents users from seeing inappropriate language and blocks personally identifiable information.*

Applied to various sources and inputs, **text filtering** prevents users from seeing inappropriate language and personally identifiable information such as phone numbers. Roblox automatically filters common text outputs such as messages that have passed through [[30 Official Roblox Docs/Chat/Text chat overview|in-game text chat]], but **you are responsible for filtering any displayed text that you don't have explicit control over**.

> [!danger]
> Because filtering is crucial for a safe environment, Roblox actively moderates the content of games to make sure they meet [community standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards). If Roblox receives reports or automatically detects that your game doesn't apply text filtering, then the system removes the game until you add filtering.

## Filter scenarios

Text can be gathered and/or displayed to users in a variety of scenarios, including:

- A game that gathers users' [[30 Official Roblox Docs/UI/Text input fields|text input]] through [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] entries, a custom GUI with buttons such as a keyboard/keypad interface, or an interactive keyboard model in the 3D space.

- A game that generates words from random characters and displays them to users, as there's a chance it will create inappropriate words.

- A game that connects to an external web server to fetch content that is displayed in-game. Often you will not have control over the content of the external site and a third party can edit the information.

- A game that stores text such as users' pet names using [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|data stores]], where the stored text might include inappropriate words that should be filtered when retrieving them.

## Filtering process

[[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] filters in-game text by taking a string of text and the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the user who created the text as input. It returns a [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] object which has two additional methods that you can call in different scenarios:

- [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetNonChatStringForBroadcastAsync|TextFilterResult:GetNonChatStringForBroadcastAsync()]] for filtering text visible to all users in a game, such as for a dialog that lets a user write a message on a sign that's visible to all users on the server.
- [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetNonChatStringForUserAsync|TextFilterResult:GetNonChatStringForUserAsync()]] to display filtered text for one specific user, based on age and other details.

In the context of [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] input, the following example gathers input on the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|FocusLost]] event and sends it to the server through a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]. On the server, it is filtered first through [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|FilterStringAsync()]] and then [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetNonChatStringForBroadcastAsync|GetNonChatStringForBroadcastAsync()]] with the intention that the text will be displayed to all users on a server‑side object such as a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] in the 3D world.

> [!warning]
> Do not filter text in real time "per character entered" into a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], as doing so yields for text that's only visible to the user typing it. Instead, filter the entered text **after** the user submits it.

```lua title="Filtering Text Input - Client Script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local textBox = script.Parent
textBox.ClearTextOnFocus = false
textBox.PlaceholderText = "..."
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextScaled = true

-- RemoteEvent to send text input to server for filtering
local inputRemoteEvent = ReplicatedStorage:FindFirstChild("InputRemoteEvent")

-- Event handler for focus lost and enter being pressed
local function onFocusLost(enterPressed, inputObject)
	if enterPressed then
		print("SUBMITTED:", textBox.Text)
		if inputRemoteEvent then
			inputRemoteEvent:FireServer(textBox.Text)
		end
	end
end

textBox.FocusLost:Connect(onFocusLost)
```

```lua title="Filtering Text Input - Server Script"
local TextService = game:GetService("TextService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- RemoteEvent to receive text input from client for filtering
local inputRemoteEvent = ReplicatedStorage:FindFirstChild("InputRemoteEvent")

local function getFilterResult(text, fromUserId)
	local filterResult
	local success, errorMessage = pcall(function()
		filterResult = TextService:FilterStringAsync(text, fromUserId)
	end)

	if success then
		return filterResult
	else
		warn("Error generating TextFilterResult:", errorMessage)
	end
end

-- Fired when client submits input from the TextBox
local function onInputReceived(player, text)
	if text ~= "" then
		local filterResult = getFilterResult(text, player.UserId)
		if filterResult then
			local success, filteredText = pcall(function()
				return filterResult:GetNonChatStringForBroadcastAsync()
			end)

			if success then
				print("FILTERED:", filteredText)
			else
				warn("Error filtering text!")
			end
		end
	end
end

inputRemoteEvent.OnServerEvent:Connect(onInputReceived)
```

---
*Source: [Text filtering](https://create.roblox.com/docs/ui/text-filtering) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
