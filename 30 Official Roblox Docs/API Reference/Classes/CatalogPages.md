---
title: "CatalogPages"
description: "A special version of `Pages` that stores the results of an Avatar Editor catalog search."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CatalogPages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A special version of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] that stores the results of an Avatar Editor catalog search.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/CatalogPages|CatalogPages]] is a special version of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#SearchCatalogAsync|AvatarEditorService:SearchCatalogAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetBundlesByAssetIdAsync|AvatarEditorService:GetBundlesByAssetIdAsync()]]. Each page is a list of tables describing the catalog items that matched the query, such as each item's ID, name, type, and price.

Iterate with the members inherited from [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]]: [[30 Official Roblox Docs/API Reference/Classes/Pages#GetCurrentPage|Pages:GetCurrentPage()]], [[30 Official Roblox Docs/API Reference/Classes/Pages#AdvanceToNextPageAsync|Pages:AdvanceToNextPageAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/Pages#IsFinished|Pages.IsFinished]].

---
*Source: [CatalogPages](https://create.roblox.com/docs/reference/engine/classes/CatalogPages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
