---
title: "DataStoreInfo"
description: "Object describing data store information."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreInfo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Object describing data store information.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Object describing data store information such as name, created time, and time last updated. This object is a member of the [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages|DataStoreListingPages]] object returned by [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync|DataStoreService:ListDataStoresAsync()]].

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreInfo#CreatedTime\|CreatedTime]] | int64 | Indicates when the data store was created in milliseconds since epoch. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreInfo#DataStoreName\|DataStoreName]] | string | The name of the data store. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreInfo#UpdatedTime\|UpdatedTime]] | int64 | Indicates the last time the data store was updated in milliseconds since epoch. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CreatedTime

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates when the data store was created in milliseconds since epoch.

### DataStoreName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the name of the data store. It is used as a unique identifier to retrieve a data store instance with [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]].

### UpdatedTime

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the last time the data store was updated in milliseconds since epoch.

---
*Source: [DataStoreInfo](https://create.roblox.com/docs/reference/engine/classes/DataStoreInfo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
