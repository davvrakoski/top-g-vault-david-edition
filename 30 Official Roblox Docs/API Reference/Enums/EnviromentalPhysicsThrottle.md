---
title: "EnviromentalPhysicsThrottle"
description: "Used to control the throttle rate of Roblox's physics engine."
api_type: enum
aliases: ["Enum.EnviromentalPhysicsThrottle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/EnviromentalPhysicsThrottle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to control the throttle rate of Roblox's physics engine.*

## Description

The `EnviromentalPhysicsThrottle` enum is used with [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#PhysicsEnvironmentalThrottle|PhysicsSettings.PhysicsEnvironmentalThrottle]], controlling how aggressively the engine skips physics simulation steps to reduce CPU load.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `DefaultAuto` | 0 | Automatically adjusts throttle level based on performance. |
| `Disabled` | 1 | No throttling; every physics step runs. |
| `Always` | 2 | Maximum throttling; physics is effectively frozen. |
| `Skip2` | 3 | Runs 1 out of every 2 steps (50% reduction). If [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod\|Workspace.PhysicsSteppingMethod]] is set to [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod\|Adaptive]], skipping is based on groups of 4 steps instead of individual steps. |
| `Skip4` | 4 | Runs 1 out of every 4 steps (75% reduction). If [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod\|Workspace.PhysicsSteppingMethod]] is set to [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod\|Adaptive]], skipping is based on groups of 4 steps instead of individual steps. |
| `Skip8` | 5 | Runs 1 out of every 8 steps (87.5% reduction). If [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod\|Workspace.PhysicsSteppingMethod]] is set to [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod\|Adaptive]], skipping is based on groups of 4 steps instead of individual steps. |
| `Skip16` | 6 | Runs 1 out of every 16 steps (93.75% reduction). If [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod\|Workspace.PhysicsSteppingMethod]] is set to [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod\|Adaptive]], skipping is based on groups of 4 steps instead of individual steps. |

---
*Source: [EnviromentalPhysicsThrottle](https://create.roblox.com/docs/reference/engine/enums/EnviromentalPhysicsThrottle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
