---
title: "HSRDataContentProvider"
description: "An internal service that fetches, parses, and caches hidden surface removal (HSR) data for layered clothing; cannot be used by developers."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HSRDataContentProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An internal service that fetches, parses, and caches hidden surface removal (HSR) data for layered clothing; cannot be used by developers.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CacheableContentProvider|CacheableContentProvider]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Internal-only; managed by the engine and cannot be used by developers. Inherits from [[30 Official Roblox Docs/API Reference/Classes/CacheableContentProvider|CacheableContentProvider]] and fetches, parses, and caches hidden surface removal (HSR) data assets — which triangles of a layered clothing item's mesh are occluded by overlapping garments so that geometry can be culled when the avatar is rendered. When an HSR asset is requested, the service downloads and decodes it into a [[30 Official Roblox Docs/API Reference/Classes/HiddenSurfaceRemovalAsset|HiddenSurfaceRemovalAsset]] and stores it in a cache.

---
*Source: [HSRDataContentProvider](https://create.roblox.com/docs/reference/engine/classes/HSRDataContentProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
