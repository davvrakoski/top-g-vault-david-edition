---
title: "Avatar Inspect Menu"
description: "The Avatar Inspect Menu allows users to view other users' avatars, try on items, make purchases."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/avatar-inspect-menu"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Avatar Inspect Menu allows users to view other users' avatars, try on items, make purchases.*

The **Avatar Inspect Menu** allows users to view another user's Roblox avatar character, try on items, and even make purchases within a game. Roblox enables this menu by default and users in your game can access this menu in three ways:

- Opening the game's main menu and clicking the **View** button next to a user in the **Players** tab.
- Clicking on a user's name in the player list.
- Selecting the Inspect option in the [[30 Official Roblox Docs/Players/Avatar Context Menu|Avatar Context Menu]], an opt-in feature which provides additional user-to-user social interaction.

You can customize a user's **Avatar Inspect Menu** in the following ways:

- Change the inspect target from the user's Roblox avatar to their [[30 Official Roblox Docs/Players/Avatar Inspect Menu#Inspect currently equipped items|current in-game appearance]].
- Change the inspect target to a [[30 Official Roblox Docs/Players/Avatar Inspect Menu#Inspect specific users|specific User ID]], even if they are not in the game.

For more specific catalog access, you can also use the [[30 Official Roblox Docs/Players/Avatar Editor Service|Avatar Editor Service]] to access and make changes to a user's platform-wide avatar within a game.

## Inspect currently equipped items

By default, the Inspect Menu shows the same information as the user's Roblox Avatar profile page. The avatar outfit may not match the user's current appearance, since you may have opted to equip different accessories or avatar items at that specific moment.

In the cases where the default Inspect Menu may not be accurate to the current character's outfit, you can inspect a character's current outfit with the following steps:

1. Disable the default profile-based Inspect Menu by setting [[30 Official Roblox Docs/API Reference/Classes/GuiService#SetInspectMenuEnabled|GuiService:SetInspectMenuEnabled()]] with a value of **false**.
2. Get a current [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] from the target player character.
3. Call [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromHumanoidDescription|GuiService:InspectPlayerFromHumanoidDescription()]] to load the Inspect menu based off of the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

Use the following code sample to inspect the currently equipped items of a specific player:

```lua
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Make profile-based Inspect Menu inaccessible
GuiService:SetInspectMenuEnabled(false)

local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
if humanoid then
	-- Get current HumanoidDescription from a player character
	local humanoidDescription = humanoid:GetAppliedDescription()

	-- Load the inspect menu from a humanoid description
	GuiService:InspectPlayerFromHumanoidDescription(humanoidDescription, player.Name)
end
```

## Inspect specific users

The Avatar Inspect Menu can inspect players who aren't in the current game. You can use [[30 Official Roblox Docs/API Reference/Classes/GuiService#InspectPlayerFromUserId|GuiService:InspectPlayerFromUserId()]] to inspect a player from any [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]].

Use the following code sample to open the Avatar Inspect Menu based on a [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]]:

```lua
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")

-- Get user ID by username
local success, userId = pcall(function()
	return Players:GetUserIdFromNameAsync("RobloxUser")
end)

if success then
	GuiService:InspectPlayerFromUserId(userId)
end
```

---
*Source: [Avatar Inspect Menu](https://create.roblox.com/docs/players/avatar-inspect-menu) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
