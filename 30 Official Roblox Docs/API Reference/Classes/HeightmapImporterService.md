---
title: "HeightmapImporterService"
description: "A Studio-only service that backs the Terrain Editor's heightmap import tool, converting heightmap and colormap images into voxel `Terrain`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HeightmapImporterService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A Studio-only service that backs the Terrain Editor's heightmap import tool, converting heightmap and colormap images into voxel [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Service`, `NotReplicated`

## Description

Studio-only Terrain Editor service; members require elevated security and are not callable from experience scripts. Powers **Import Heightmap**: given a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] and the asset IDs of a grayscale heightmap plus an optional colormap, samples the images and generates smooth-voxel [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] in that region — heightmap luminance drives height; colormap colors map to the nearest terrain [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]], falling back to a supplied default and warning when too many pixels are unmatched.

---
*Source: [HeightmapImporterService](https://create.roblox.com/docs/reference/engine/classes/HeightmapImporterService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
