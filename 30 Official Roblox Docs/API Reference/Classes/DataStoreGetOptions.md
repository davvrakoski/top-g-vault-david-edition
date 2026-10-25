---
title: "DataStoreGetOptions"
description: "Specifies additional parameters for a `GlobalDataStore:GetAsync()` call."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreGetOptions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Specifies additional parameters for a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] call.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

An object that specifies additional parameters for a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] call.

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions#UseCache\|UseCache]] | boolean | Specifies whether [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync\|GlobalDataStore:GetAsync()]] can return a locally cached value. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### UseCache

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** DataStore

This property controls whether [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] may return a locally cached value instead of fetching from the data store backend. It defaults to `true`.

When `true`, if a cached value for the key exists and has not expired, [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] returns that cached value immediately without a backend request. When `false`, the cache is bypassed and the call always retrieves the latest value from the data store backend.

---
*Source: [DataStoreGetOptions](https://create.roblox.com/docs/reference/engine/classes/DataStoreGetOptions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
