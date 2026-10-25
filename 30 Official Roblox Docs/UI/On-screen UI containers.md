---
title: "On-screen UI containers"
description: "Learn how to display UI objects on a user's screen."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/on-screen-containers"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to display UI objects on a user's screen.*

The [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container holds [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] to display on a player's screen, including [[30 Official Roblox Docs/UI/Frames|frames]], [[30 Official Roblox Docs/UI/Text & image labels|labels]], [[30 Official Roblox Docs/UI/Text & image buttons|buttons]], and more. All on‑screen UI objects and code are stored and changed on the client.

*(image in the full Top G Vault)*

> [!info]
> For UI containers that hold [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that you want to display **within** the 3D world, such as on the face of a part, see [[30 Official Roblox Docs/UI/In-game UI containers|In-game UI Containers]].

To display a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and its child [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] to every player who joins the game, place it inside the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] container. When a player joins a game and their character first spawns, the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and its contents clone into the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] container for that player, located within the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] container.

*(image in the full Top G Vault)*

> [!success]
> By default, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] within [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] appear as an overlay of the [[30 Official Roblox Docs/Studio/Studio interface#3D viewport|3D viewport]], simulating their appearance and position in a running game. To hide all such screen overlays, toggle off **GUI overlay** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

> [!info]
> If [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is disabled, the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] will not be cloned until [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|Player:LoadCharacterAsync()]] is called.

As a game grows in scope, you may require multiple screen interfaces such as a title screen, settings menu, shop interface, and more. In such cases, you can place multiple unique [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] containers inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] and toggle each container's [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled|Enabled]] property depending on whether it should be visible and active (while `false`, contents will not render, process user input, or update in response to changes).

*(image in the full Top G Vault)*

The [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled|Enabled]] property can be initially toggled through the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and/or you can set it during playtime from a client‑side script by [[30 Official Roblox Docs/UI/On-screen UI containers#Access player UI|accessing]] the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] and setting it to `true` or `false` for the desired container(s).

> [!info]
> When using multiple [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] interfaces, you can layer them by Z‑index through their [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#DisplayOrder|DisplayOrder]] property. See [[30 Official Roblox Docs/UI/On-screen UI containers#Display order|Display Order]] for more information.

## Container properties

The following properties let you customize the [[30 Official Roblox Docs/UI/On-screen UI containers#Screen insets|screen insets]] across multiple devices, the [[30 Official Roblox Docs/UI/On-screen UI containers#Display order|display order]] when using multiple screen containers, and more.

### Screen insets

Modern phones take advantage of the entire screen but typically include notches, cutouts, and other elements that occupy screen space. Every Roblox game also includes the **top bar controls** for quick access to the main menu, [[30 Official Roblox Docs/Chat/Text chat overview|chat]], [[30 Official Roblox Docs/Players/Leaderboards|leaderboard]], and more.

*(image in the full Top G Vault)*

To ensure players can see and access all UI easily and without obstruction, Roblox provides the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] property which controls the **safe area** insets for the contents of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

#### CoreUISafeInsets

The default of [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] keeps all descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] inside the core UI safe area, clear of the top bar buttons and other screen cutouts. This setting is recommended if the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] contains interactive UI elements.

*(image in the full Top G Vault)*

#### DeviceSafeInsets

A setting of [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]] guarantees that no descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] are occluded by any device screen cutouts such as the camera notch, although no inset is added for Roblox core UI elements like the top bar buttons.

*(image in the full Top G Vault)*

#### TopbarSafeInsets

A setting of [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|TopbarSafeInsets]] keeps all descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] between the top bar controls and the right edge of the device safe area. The [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] will then automatically flex in horizontal size based on the top bar's content.

*(image in the full Top G Vault)*

#### None

No insets are added to the fullscreen area. This mode may result in UI that is obscured or completely hidden by device notches and cutouts, so you should only use it for a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] that contains non‑interactive content like background images.

*(image in the full Top G Vault)*

### Display order

When using multiple [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] interfaces, you can layer them by Z‑index through their [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#DisplayOrder|DisplayOrder]] property. For example, to display a modal settings menu on one [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] in front of the game's main user interface on another [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], assign a higher [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#DisplayOrder|DisplayOrder]] to the modal's than the underlying interface's.

### Reset on spawn

The [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ResetOnSpawn|ResetOnSpawn]] boolean property determines if the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] resets (deletes itself and re‑clones into the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]) every time the player's character respawns.

| Condition | Resets |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ResetOnSpawn\|ResetOnSpawn]] is `true` (default). | **YES** |
| The [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] is an **indirect** descendant of [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]]; for example it's placed inside a [[30 Official Roblox Docs/API Reference/Classes/Folder\|Folder]] located within [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]]. | **YES** |
| [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ResetOnSpawn\|ResetOnSpawn]] is `false` **and** the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] is a **direct** descendant of [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]]. | **NO** |

## Access player UI

As noted, parenting a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] to [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] clones it and its child [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] into a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] container when they join the game and their character first spawns.

If you need to control a player's UI container during playtime, for example to show/hide a specific [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or any of its children, access it as follows from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

```lua title="LocalScript - Accessing a Player's UI"
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

local titleScreen = playerGui:WaitForChild("TitleScreen")
local settingsMenu = playerGui:WaitForChild("SettingsMenu")

titleScreen.Enabled = false  -- Hide title screen
settingsMenu.Enabled = true  -- Show settings menu
```

## Disable default UI

All Roblox games include several UI elements that are enabled by default. If you don't need any of these elements or if you want to replace them with your own creations, you can use the [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|SetCoreGuiEnabled()]] method in a client‑side script with the associated [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|Enum.CoreGuiType]] option.

| Default UI | Associated enum |
| --- | --- |
| Dynamically updated [[30 Official Roblox Docs/API Reference/Classes/Players\|Players]] list, commonly used as a [[30 Official Roblox Docs/Players/Leaderboards\|leaderboard]]. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.PlayerList]] |
| The character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Health]] bar. Does not appear if the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is at full health. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.Health]] |
| The character's [[30 Official Roblox Docs/API Reference/Classes/Backpack\|Backpack]] which contains [[30 Official Roblox Docs/Players/In-game tools\|in-game tools]]. Does not appear if there are no [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tools]] in the backpack. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.Backpack]] |
| The [[30 Official Roblox Docs/Chat/Text chat overview\|text chat]] window. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.Chat]] |
| Popup menu of character [[30 Official Roblox Docs/Characters/Emotes\|emotes]]. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.EmotesMenu]] |
| A window displaying a player's perspective or view of their own character. Does not appear unless the player has enabled **Self View** from the Roblox menu. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.SelfView]] |
| A **capture screenshot** button along the right side of the screen. Does not appear unless the player has enabled **Captures** from the Roblox menu. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.Captures]] |
| The **Avatar Switcher** allows users to change their platform avatar. | [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType\|Enum.CoreGuiType.AvatarSwitcher]] |

*(image in the full Top G Vault)*

```lua title="Client Script - Disable Default UI Elements"
local StarterGui = game:GetService("StarterGui")

-- Disable default health bar and backpack
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
```

Additionally, devices with touch capabilities include a virtual thumbstick and a jump button by default. If desired, you can hide these elements by setting [[30 Official Roblox Docs/API Reference/Classes/GuiService#TouchControlsEnabled|GuiService.TouchControlsEnabled]] to `false` in a client‑side script.

*(image in the full Top G Vault)*

```lua title="Client Script - Disable Touch Controls"
local GuiService = game:GetService("GuiService")

GuiService.TouchControlsEnabled = false
```

---
*Source: [On-screen UI containers](https://create.roblox.com/docs/ui/on-screen-containers) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
