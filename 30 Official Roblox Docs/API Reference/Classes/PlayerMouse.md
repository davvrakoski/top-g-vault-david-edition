---
title: "PlayerMouse"
description: "The PlayerMouse behaves identically to the `Mouse` object that is obtained using `Tool.Equipped`. Both PlayerMouse and `Mouse` are legacy APIs, superseded by `UserInputService`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PlayerMouse"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The PlayerMouse behaves identically to the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object that is obtained using [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Tool.Equipped]]. Both PlayerMouse and [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] are legacy APIs, superseded by [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The PlayerMouse behaves identically to the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object that is obtained using [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Tool.Equipped]]. It can be accessed from [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] using the local player's [[30 Official Roblox Docs/API Reference/Classes/Player#GetMouse|Player:GetMouse()]] method. Both PlayerMouse and [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] are legacy APIs, superseded by [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]].

The only difference between the PlayerMouse and the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object is the PlayerMouse can be obtained using the [[30 Official Roblox Docs/API Reference/Classes/Player#GetMouse|Player:GetMouse()]] method.

In most cases developers are advised to use the new [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]]. However the PlayerMouse and Mouse objects remain supported for a number of reasons. See [[30 Official Roblox Docs/Input/Input|Input and Camera]] for more information on customizing inputs in your experience.

*Code samples for this API (`PlayerMouse`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PlayerMouse); their code is not part of the open-source repo.*

---
*Source: [PlayerMouse](https://create.roblox.com/docs/reference/engine/classes/PlayerMouse) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
