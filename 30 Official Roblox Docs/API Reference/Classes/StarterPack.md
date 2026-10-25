---
title: "StarterPack"
description: "A container whose contents are copied into each player's `Backpack` when their player character spawns. It is generally used to hold `Tools`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterPack"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container whose contents are copied into each player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] when their player character spawns. It is generally used to hold [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`StarterPack` is a service-level container whose contents are copied into each player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] when their player character spawns. It is generally used to hold [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] but it can also hold [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] to ensure that each player gets a copy.

To ensure that certain [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] are available to specific players instead of **all** players (`StarterPack`), use player‑specific [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] containers or parent those [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] directly to player [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpacks]].

*Code samples for this API (`Empty-StarterPack`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/StarterPack); their code is not part of the open-source repo.*

---
*Source: [StarterPack](https://create.roblox.com/docs/reference/engine/classes/StarterPack) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
