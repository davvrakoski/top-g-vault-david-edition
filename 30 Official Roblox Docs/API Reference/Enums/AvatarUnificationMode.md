---
title: "AvatarUnificationMode"
description: "Controls whether the R6 to R15 adapter is active, allowing R15 avatars to join R6 experiences."
api_type: enum
aliases: ["Enum.AvatarUnificationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarUnificationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether the R6 to R15 adapter is active, allowing R15 avatars to join R6 experiences.*

## Description

When enabled, R15 avatars joining an R6 experience receive adapter parts, invisible [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] with R6-compatible names welded to their corresponding R15 parts. The adapter preserves R6-like scale and movement while enabling R15 features such as layered clothing and animatable heads. Used by [[30 Official Roblox Docs/API Reference/Classes/Workspace#AvatarUnificationMode|Workspace.AvatarUnificationMode]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 0 | **Deprecated.** Resolves to the engine's current built-in default for avatar unification, which currently behaves the same as `Disabled`. |
| `Disabled` | 1 | **Deprecated.** Disables the R6-to-R15 adapter; R6 avatars in an R6 experience load using the standard R6 rig with no adapter parts applied. |
| `Enabled` | 2 | **Deprecated.** Enables the R6-to-R15 adapter; R6 avatars joining an R6 experience receive invisible R15 adapter [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]] welded to their R6-named joints, preserving R6 scale while enabling R15 features such as layered clothing and animatable heads. |

---
*Source: [AvatarUnificationMode](https://create.roblox.com/docs/reference/engine/enums/AvatarUnificationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
