---
title: "MeshPartHeadsAndAccessories"
description: "Controls the `Workspace.MeshPartHeadsAndAccessories` feature."
api_type: enum
aliases: ["Enum.MeshPartHeadsAndAccessories"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MeshPartHeadsAndAccessories"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories|Workspace.MeshPartHeadsAndAccessories]] feature.*

## Description

Controls whether the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] loads R15 avatar heads and accessories as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects. When set to `Default` or `Enabled`, heads and accessories resolve through the `MeshPart`-based avatar pipeline, which supports modern rendering, layered clothing, and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]-specific deformation. When set to `Disabled`, heads and accessories use the legacy [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]]-based pipeline.

[[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories|Workspace.MeshPartHeadsAndAccessories]] defaults to `Default`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | The default option to control the [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories\|Workspace.MeshPartHeadsAndAccessories]] feature. This currently has the same meaning as "Enabled". |
| `Disabled` | 1 | Disables the [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories\|Workspace.MeshPartHeadsAndAccessories]] feature. |
| `Enabled` | 2 | Enables the [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories\|Workspace.MeshPartHeadsAndAccessories]] feature. |

---
*Source: [MeshPartHeadsAndAccessories](https://create.roblox.com/docs/reference/engine/enums/MeshPartHeadsAndAccessories) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
