---
title: "Backpack"
description: "A container object that holds a player's inventory. Any `Tool` in a player's `Backpack` will be displayed in their inventory at the bottom of the screen."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Backpack"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object that holds a player's inventory. Any [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] in a player's `Backpack` will be displayed in their inventory at the bottom of the screen.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] objects in the `Backpack` container make up the player's inventory and display as icon buttons at the bottom of the screen. See [[30 Official Roblox Docs/Players/In-game tools|in‑game tools]] for more information.

When a player's character spawns, the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] and the player's [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] clone to `Backpack`. When the character dies, the client destroys the `Backpack` and replaces it with a new one, populated again with the contents of [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] and [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]].

To disable the default Roblox inventory GUI and replace it with your own, call [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]] in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] as outlined in [[30 Official Roblox Docs/Players/Disable default UI|disable default UI]].

`Backpack` can be accessed from both the client and the server:

*Code samples for this API (`Backpack-Give-Tool`, `Backpack-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Backpack); their code is not part of the open-source repo.*

---
*Source: [Backpack](https://create.roblox.com/docs/reference/engine/classes/Backpack) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
