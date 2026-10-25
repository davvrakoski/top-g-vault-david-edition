---
title: "InterpolationThrottlingMode"
description: "Controls whether the engine reduces the physics interpolation update rate for distant assemblies when the client is under load. Used by the deprecated `Workspace.InterpolationThrottling` property."
api_type: enum
aliases: ["Enum.InterpolationThrottlingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InterpolationThrottlingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether the engine reduces the physics interpolation update rate for distant assemblies when the client is under load. Used by the deprecated [[30 Official Roblox Docs/API Reference/Classes/Workspace#InterpolationThrottling|Workspace.InterpolationThrottling]] property.*

## Description

Controls whether the engine reduces the physics interpolation update rate for distant assemblies when the client is under load. This enum is consumed by the deprecated [[30 Official Roblox Docs/API Reference/Classes/Workspace#InterpolationThrottling|Workspace.InterpolationThrottling]] property, which is no longer exposed in Studio or recommended for use in new experiences.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The engine automatically throttles physics interpolation for distant assemblies when client frame time is high. |
| `Disabled` | 1 | Physics interpolation throttling is unconditionally disabled; all assemblies interpolate at the full rate regardless of client load. |
| `Enabled` | 2 | Physics interpolation throttling is unconditionally enabled; distant assemblies have their interpolation update rate reduced even when the client is not under load. |

---
*Source: [InterpolationThrottlingMode](https://create.roblox.com/docs/reference/engine/enums/InterpolationThrottlingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
