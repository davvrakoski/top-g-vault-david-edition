---
title: "DataStoreKeyPages"
description: "A special type of `Pages` object whose pages contain `DataStoreKey` instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreKeyPages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A special type of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] object whose pages contain [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey|DataStoreKey]] instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A special type of [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]] object whose pages contain [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey|DataStoreKey]] instances. [[30 Official Roblox Docs/API Reference/Classes/Pages#GetCurrentPage|Pages:GetCurrentPage()]] can be used to retrieve an array of the [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey|DataStoreKey]] instances.

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages#Cursor\|Cursor]] | string | Marks the position from which the next page of keys is retrieved. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Cursor

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

A read-only pagination cursor that marks the position from which the next page of keys is retrieved. It defaults to an empty string.

The cursor advances as each page is retrieved. When you call [[30 Official Roblox Docs/API Reference/Classes/Pages#AdvanceToNextPageAsync|Pages:AdvanceToNextPageAsync()]], a non-empty cursor is sent as the exclusive start key so the request returns the keys that follow the current page; while it remains empty, the request fetches the first page. The cursor is cleared once there are no more keys to return, at which point [[30 Official Roblox Docs/API Reference/Classes/Pages#IsFinished|Pages.IsFinished]] becomes `true`.

---
*Source: [DataStoreKeyPages](https://create.roblox.com/docs/reference/engine/classes/DataStoreKeyPages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
