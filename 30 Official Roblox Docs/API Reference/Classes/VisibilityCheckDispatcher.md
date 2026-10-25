---
title: "VisibilityCheckDispatcher"
description: "Service that schedules and runs viewability checks for immersive ad instances in a place."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VisibilityCheckDispatcher"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service that schedules and runs viewability checks for immersive ad instances in a place.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Not accessible from scripts. [[30 Official Roblox Docs/API Reference/Classes/VisibilityCheckDispatcher|VisibilityCheckDispatcher]] measures the viewability of on-screen ads, such as those rendered by [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]]. On every [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] heartbeat, it selects pending ad instances and runs the on-screen and occlusion checks that determine whether an ad impression should be counted, then reports the results through [[30 Official Roblox Docs/API Reference/Classes/AdService|AdService]].

This service is created and managed by the engine.

---
*Source: [VisibilityCheckDispatcher](https://create.roblox.com/docs/reference/engine/classes/VisibilityCheckDispatcher) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
