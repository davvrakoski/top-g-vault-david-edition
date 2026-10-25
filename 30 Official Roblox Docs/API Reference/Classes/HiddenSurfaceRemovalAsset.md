---
title: "HiddenSurfaceRemovalAsset"
description: "Stores the precomputed hidden surface removal (HSR) data for a layered-clothing wrap, marking the mesh faces that are hidden by higher clothing layers so the engine can cull them."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HiddenSurfaceRemovalAsset"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Stores the precomputed hidden surface removal (HSR) data for a layered-clothing wrap, marking the mesh faces that are hidden by higher clothing layers so the engine can cull them.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Engine-managed asset; its data is not exposed to scripts. Holds the hidden surface removal (HSR) data produced by Roblox's layered-clothing deformation pipeline. HSR identifies the faces of a wrap's mesh that are fully occluded by clothing layers worn above it, so the engine can strip those faces from the output geometry before rendering rather than drawing surfaces that will never be visible.

The asset is stored and fetched by content ID: the engine deserializes it and decodes its data into the runtime visibility information consumed by the wrap deformer when solving a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] or [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]].

---
*Source: [HiddenSurfaceRemovalAsset](https://create.roblox.com/docs/reference/engine/classes/HiddenSurfaceRemovalAsset) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
