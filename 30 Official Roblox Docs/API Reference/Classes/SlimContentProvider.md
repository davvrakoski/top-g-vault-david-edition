---
title: "SlimContentProvider"
description: "A service that fetches and caches SLIM (Scalable Lightweight Interactive Models) asset content representations for model rendering."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SlimContentProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that fetches and caches SLIM (Scalable Lightweight Interactive Models) asset content representations for model rendering.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CacheableContentProvider|CacheableContentProvider]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Not intended for use from experience scripts. [[30 Official Roblox Docs/API Reference/Classes/SlimContentProvider|SlimContentProvider]] retrieves SLIM (Scalable Lightweight Interactive Models) asset content representations, parses them into mesh and level-of-detail metadata for the model rendering pipeline, and signals when an asset is ready, needs a retry, or has failed.

As a variant of [[30 Official Roblox Docs/API Reference/Classes/CacheableContentProvider|CacheableContentProvider]], it caches parsed results under a memory budget and evicts least-recently-used entries when the budget is exceeded.

---
*Source: [SlimContentProvider](https://create.roblox.com/docs/reference/engine/classes/SlimContentProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
