---
title: "Disable default UI"
description: "Explains the process of disabling Roblox's default user interface elements."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/disable-ui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process of disabling Roblox's default user interface elements.*

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
*Source: [Disable default UI](https://create.roblox.com/docs/players/disable-ui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
