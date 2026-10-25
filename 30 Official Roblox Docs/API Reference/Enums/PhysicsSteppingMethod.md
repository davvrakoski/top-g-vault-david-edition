---
title: "PhysicsSteppingMethod"
description: "Controls how the physics engine advances simulation time for assemblies in a `Workspace`."
api_type: enum
aliases: ["Enum.PhysicsSteppingMethod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PhysicsSteppingMethod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the physics engine advances simulation time for assemblies in a [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].*

## Description

The `PhysicsSteppingMethod` enum determines the timestep arbiter strategy used by the physics engine for all simulated assemblies in a place. It is set via the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod|Workspace.PhysicsSteppingMethod]] property. The default value is [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod|Enum.PhysicsSteppingMethod.Default]], which currently resolves to the same behavior as [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod|Enum.PhysicsSteppingMethod.Adaptive]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The current default is `Adaptive`. |
| `Fixed` | 1 | All simulated assemblies inside the workspace will advance forward at 240 Hz. This option is best for optimal stability and simulation accuracy. |
| `Adaptive` | 2 | The engine attempts to assign optimal simulation rates for individual assemblies of either 240 Hz, 120 Hz, or 60 Hz. This setting is optimized for performance. |

---
*Source: [PhysicsSteppingMethod](https://create.roblox.com/docs/reference/engine/enums/PhysicsSteppingMethod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
