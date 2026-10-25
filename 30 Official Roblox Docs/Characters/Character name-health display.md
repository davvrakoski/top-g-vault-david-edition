---
title: "Character name/health display"
description: "You can customize character UI, like name and health displays, using Class.Humanoid."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/name-health-display"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*You can customize character UI, like name and health displays, using Class.Humanoid.*

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] instance is used to create character models, both for user avatars and NPCs. When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is present inside a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] that contains a part named **Head**, Roblox displays a name and/or health bar above that part.

*(image in the full Top G Vault)*

Through various [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] properties, you can modify the following:

- The [[30 Official Roblox Docs/Characters/Character name-health display#Display distance type|distance]] from which users can see the name/health of other humanoids in relation to their own character's humanoid.
- The [[30 Official Roblox Docs/Characters/Character name-health display#Override display names|display name]] which shows over a humanoid.
- Whether a humanoid's [[30 Official Roblox Docs/Characters/Character name-health display#Health display type|health bar]] always appears, never appears, or only appears when the humanoid is damaged.
- Whether names and health bars are [[30 Official Roblox Docs/Characters/Character name-health display#Occlusion|occluded]] (hidden) when line-of-sight between the camera and another humanoid is blocked.

> [!warning]
> As noted in the introduction, character name/health display requires that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] instance is inside a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and that the model contains a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] named **Head**. Both objects must also be at the same level in the model's hierarchy.

## Display properties

### Display distance type

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]] property sets how users see the name/health of other characters in relation to their own character.

#### Viewer

When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|DisplayDistanceType]] is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|HumanoidDisplayDistanceType.Viewer]], it sees the name/health of other humanoids within range of its own [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|NameDisplayDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]]. You can consider this the lowest priority since it is not taken into account for other humanoids configured as [[30 Official Roblox Docs/Characters/Character name-health display#Subject|subject]] or [[30 Official Roblox Docs/Characters/Character name-health display#None|none]].

In the following scenario, the user's character (**Viewer**) has a larger [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|NameDisplayDistance]] than [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]], as indicated by the circles. As a result, the user sees character names for both **Watchman** and **Octavia**, but only sees a health bar for **Watchman**.

*(image in the full Top G Vault)*

#### Subject

When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|DisplayDistanceType]] is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|HumanoidDisplayDistanceType.Subject]], it takes **full control** over its own name and health display through its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|NameDisplayDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]] values. Effectively, other humanoids will only see the subject's name/health within those distances from the **subject** humanoid.

In the following scenario, both **Watchman** and **Octavia** are set to **Subject** and their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance|NameDisplayDistance]] ranges are indicated by the circles. Only the name **Octavia** is seen by the user whose character is standing inside her range but outside the **Watchman** humanoid's range.

*(image in the full Top G Vault)*

#### None

When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|DisplayDistanceType]] is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|HumanoidDisplayDistanceType.None]], its name and health bar do not appear under any circumstances. In the following scenario, both **Watchman** and **Octavia** are set to **None**, so the other character does not see their name or health even when in range.

*(image in the full Top G Vault)*

### Health display type

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|Humanoid.HealthDisplayType]] property provides further control over the character's health bar visibility. The bar reflects the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] as a factor of its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]] and it changes color from green to yellow to red as the humanoid's health decreases.

#### AlwaysOn

When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|HealthDisplayType]] is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|HumanoidHealthDisplayType.AlwaysOn]], its health bar always appears.

*(image in the full Top G Vault)*

#### DisplayWhenDamaged

A humanoid with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|HealthDisplayType]] set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|HumanoidHealthDisplayType.DisplayWhenDamaged]] only shows a health bar when its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] is less than its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]]. In the following scenario, **Watchman** has full health and does not display a health bar, but **Octavia** is damaged by 50% and displays a yellow health bar.

*(image in the full Top G Vault)*

#### AlwaysOff

When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|HealthDisplayType]] is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|HumanoidHealthDisplayType.AlwaysOff]], its health bar never appears under any circumstances.

*(image in the full Top G Vault)*

### Occlusion

Occlusion (hiding) of humanoid names behind walls or other objects is controlled by the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|Humanoid.NameOcclusion]] property.

> [!warning]
> Occlusion does not occur if the occluding object's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] is higher than 0.99. Occlusion also does not occur when a humanoid is hidden behind a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] containing a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], such as another user's avatar character.

#### NoOcclusion

When a humanoid is hidden behind a visible object and its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|NameOcclusion]] is set to [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion|NameOcclusion.NoOcclusion]], its name and health are never occluded from viewing humanoids.

In the following scenario, both **Watchman** and **Octavia** are set to **NoOcclusion**. Although both are sufficiently hidden behind stone columns, the viewing humanoid still sees their name/health displays.

*(image in the full Top G Vault)*

#### OccludeAll

When a humanoid is hidden behind a visible object and its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|NameOcclusion]] is set to [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion|NameOcclusion.OccludeAll]], its name and health are always occluded from viewing humanoids.

In the following scenario, both **Watchman** and **Octavia** are sufficiently hidden behind stone columns. **Watchman** is set to **OccludeAll**, so its name and health are hidden from the viewing humanoid. **Octavia**, however, is set to [[30 Official Roblox Docs/Characters/Character name-health display#NoOcclusion|NoOcclusion]] and her name/health remains visible to the viewing humanoid.

*(image in the full Top G Vault)*

#### EnemyOcclusion

When a humanoid is hidden behind a visible object and its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion|NameOcclusion]] is set to [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion|NameOcclusion.EnemyOcclusion]], its name and health are only occluded from enemy humanoids (players on a different [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]).

In the following scenario, both **Watchman** and **Octavia** are sufficiently hidden behind stone columns, and both are set to **EnemyOcclusion**. The viewing humanoid and **Watchman** are on the same [[30 Official Roblox Docs/API Reference/Classes/Team|Team]], so name/health occlusion does not occur. However, the name and health of **Octavia**, on the opposing team, are occluded.

*(image in the full Top G Vault)*

## Modify character displays

### User avatars

To modify the name or health display for every incoming avatar in a game, connect the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] events in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] and set [[30 Official Roblox Docs/Characters/Character name-health display#Display properties|display properties]] on the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

```lua title="Script - Global Customization" highlight="3,4,8,10,12,14,19"
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			-- Give each humanoid full control over its name/health display distance
			humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
			-- Set name display distance to 20 studs
			humanoid.NameDisplayDistance = 20
			-- Set health bar display distance to 15 studs
			humanoid.HealthDisplayDistance = 15
			-- Only show health bar when humanoid is damaged
			humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.DisplayWhenDamaged
		end
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

You can also customize properties based on a player's [[30 Official Roblox Docs/API Reference/Classes/Team|Team]], such as setting all "guard" players to a generic name, and hiding the names of all "ninja" players.

```lua title="Script - Team Customization" highlight="9,12"
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			-- Set the name of all guards to generic "Guard"
			if player.Team.Name == "Guards" then
				humanoid.DisplayName = "Guard"
			-- Hide the name for all ninjas
			elseif player.Team.Name == "Ninjas" then
				humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
		end
	end)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

> [!info]
> When a player is assigned to a [[30 Official Roblox Docs/API Reference/Classes/Team|Team]], their character's name appears in the same color as the team's [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|TeamColor]]. This helps identify teammates and opposing players in team-based experiences.

### NPC characters

For NPC characters already placed in the 3D world, you can edit name/health directly on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

## Override display names

By default, a humanoid's display name matches the user's Roblox account **Display Name** which is unique and separate from their account **Username**. To show a fully custom name that's unrelated to the user's account, you can override the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayName|Humanoid.DisplayName]] property.

### Set directly

You can set the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayName|DisplayName]] property of any [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] instance which you gain reference to through a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], such as the [[30 Official Roblox Docs/Characters/Character name-health display#User avatars|team customization]] example, or directly on an [[30 Official Roblox Docs/Characters/Character name-health display#NPC characters|NPC]] character's **Humanoid** object.

### Set through user input

In some genres like roleplaying or fighting, you may want to provide a method for users to input their own character name, pet character name, etc. that's specific to the experience and isn't tied to their account display name. You can gather this input on the client side through a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] name entry.

*(image in the full Top G Vault)*

Once the input is submitted, you can pass it to the server through a [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|remote event]] and then, on the server side, listen for the remote event and assign the [[30 Official Roblox Docs/UI/Text filtering|filtered]] name to the user character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

```lua title="LocalScript - Fire Remote Event" highlight="3,4"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local changeNameEvent = ReplicatedStorage:WaitForChild("ChangeNameEvent")
changeNameEvent:FireServer("Amory")
```

```lua title="Script - Assign Filtered Name" highlight="15,20,23,28"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")

-- Create remote event to receive text from client for filtering
local changeNameEvent = Instance.new("RemoteEvent")
changeNameEvent.Name = "ChangeNameEvent"
changeNameEvent.Parent = ReplicatedStorage

local function onRequestNameChange(player, newName)
	local character = player.Character
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

	local filterResult
	local success, errorMessage = pcall(function()
		filterResult = TextService:FilterStringAsync(newName, player.UserId)
	end)
	if success then
		local filteredName
		local success, errorMessage = pcall(function()
			filteredName = filterResult:GetNonChatStringForBroadcastAsync()
		end)
		if success and humanoid then
			humanoid.DisplayName = filteredName
		end
	end
end

changeNameEvent.OnServerEvent:Connect(onRequestNameChange)
```

---
*Source: [Character name/health display](https://create.roblox.com/docs/characters/name-health-display) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
