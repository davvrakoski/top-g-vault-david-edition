---
title: "ModelLevelOfDetail"
description: "Controls the level of detail for `Models` in experiences with instance streaming enabled."
api_type: enum
aliases: ["Enum.ModelLevelOfDetail"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ModelLevelOfDetail"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the level of detail for [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] in experiences with instance streaming enabled.*

## Description

Controls the level of detail for [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] in experiences with instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] enabled. Composite or imposter meshes do not support physics, collision detection, or raycasting.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *Original model* | *(image in the full Top G Vault)* *Lightweight SLIM mesh* | *(image in the full Top G Vault)* *Low-res "imposter" mesh* |

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Default behavior, currently equivalent to `Disabled`. |
| `StreamingMesh` | 1 | A lower resolution "imposter" mesh (colored, coarse mesh that wraps around all child parts of the model) renders outside the streaming radius. Does not support textures. |
| `Disabled` | 2 | A lower resolution mesh will not be displayed. |
| `SLIM` | 4 | A **SLIM** model (Scalable Lightweight Interactive Model) renders a composite of all child parts at progressively lower resolutions at distances based on the streaming radius. Greatly improves visual quality over `StreamingMesh`. |

---
*Source: [ModelLevelOfDetail](https://create.roblox.com/docs/reference/engine/enums/ModelLevelOfDetail) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
