---
title: "RestPose"
description: "Determines how the initial joint rest pose is established when importing a rigged 3D model."
api_type: enum
aliases: ["Enum.RestPose"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RestPose"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how the initial joint rest pose is established when importing a rigged 3D model.*

## Description

Controls the source from which the mesh importer derives the initial (rest) pose for all joints when building a rig from a 3D file.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | Uses the first animation clip found in the source file to define the initial joint rest pose on import. |
| `RotationsReset` | 1 | Resets all joint rotations to zero so that the imported rig starts from an identity rest pose. |
| `Custom` | 2 | Uses a specific animation clip, identified by its index in the file, to set the initial joint rest pose on import. |

---
*Source: [RestPose](https://create.roblox.com/docs/reference/engine/enums/RestPose) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
