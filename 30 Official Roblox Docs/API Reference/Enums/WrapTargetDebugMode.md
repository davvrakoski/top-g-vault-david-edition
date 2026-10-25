---
title: "WrapTargetDebugMode"
description: "The Studio-only property for quickly visualizing and debugging meshes with only outer cages."
api_type: enum
aliases: ["Enum.WrapTargetDebugMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WrapTargetDebugMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The Studio-only property for quickly visualizing and debugging meshes with only outer cages.*

## Description

The Studio-only property for quickly visualizing and debugging meshes with only outer cages.

This debug visualization only works when the WrapTarget is active and does not work if WrapTarget is not active or incorrectly configured.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | This debug rendering mode does nothing, and this is the default value. |
| `TargetCageOriginal` | 1 | This debug mode shows the original cage mesh as it was created. |
| `TargetCageCompressed` | 2 | This debug mode shows corresponding cage mesh compressed by clothing layers above it. This debug mode is intended to validate that the compression algorithm and corresponding cages work as intended. |
| `TargetCageInterface` | 3 | This debug mode shows the resulting cage mesh for the corresponding Wrap Instance. This debug mode is intended to validate that the final deformed cage looks as intended. |
| `TargetLayerCageOriginal` | 4 | The same as TargetCageOriginal but affects all WrapTargets that belong to the Wrap Deformer simultaneously. It doesn't matter which particular WrapTarget you enable this debug visualization option. |
| `TargetLayerCageCompressed` | 5 | The same as TargetCageCompressed but affects all WrapTargets that belong to the Wrap Deformer simultaneously. It doesn't matter which particular WrapTarget you enable this debug visualization option. |
| `TargetLayerInterface` | 6 | The same as TargetCageInterface but affects all WrapTargets that belong to the Wrap Deformer simultaneously. It doesn't matter which particular WrapTarget you enable this debug visualization option. |
| `Rbf` | 7 | This debug mode visualizes the internal RBF solver state. You can estimate the wrap deformer expected behavior by looking at this state. All renderable mesh vertices move from a "big sphere" to a "small sphere" along a corresponding line connecting two spheres. |
| `OuterCageDetail` | 8 | Visualizes outer cage vertices and related cage faces when hovering a mesh triangle in Studio. |
| `PreWrapDeformerCage` | 9 | Renders the outer cage as wireframe with vertex markers in its pre-deformation state. |

---
*Source: [WrapTargetDebugMode](https://create.roblox.com/docs/reference/engine/enums/WrapTargetDebugMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
