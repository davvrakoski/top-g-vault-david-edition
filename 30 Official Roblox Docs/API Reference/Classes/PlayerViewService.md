---
title: "PlayerViewService"
description: "Provides a way to get additional information about a player's view."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PlayerViewService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides a way to get additional information about a player's view.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/PlayerViewService|PlayerViewService]] provides a way to get additional information about a player's view.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerViewService#GetDeviceCameraCFrame\|GetDeviceCameraCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns a world space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] looking at the player's character. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetDeviceCameraCFrame

```lua
PlayerViewService:GetDeviceCameraCFrame(player: Player = nil): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** SensitiveInput

Returns a world space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] looking at the player's character, such that setting the current camera's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] will view that character from the perspective of their device.

This method leverages the device's camera and it only functions on mobile devices. If no information is available, for example the user is not on a mobile device or they don't have their camera turned on, this method returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity|CFrame.identity]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | `nil` | The player for which to get the device camera [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The world space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] looking at the player's character, or a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity\|CFrame.identity]] (see description). |

*Code samples for this member (`PlayerViewService-GetDeviceCameraCFrame`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PlayerViewService](https://create.roblox.com/docs/reference/engine/classes/PlayerViewService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
