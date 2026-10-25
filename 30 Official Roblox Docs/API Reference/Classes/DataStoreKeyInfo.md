---
title: "DataStoreKeyInfo"
description: "An object specifying information about a particular version of the key."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreKeyInfo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object specifying information about a particular version of the key.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An object describing information about a particular version of the key. This is returned as the second return value by [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|GlobalDataStore:IncrementAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|GlobalDataStore:RemoveAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|DataStore:GetVersionAsync()]].

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#CreatedTime\|CreatedTime]] | int64 | The date and time the object was created. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#UpdatedTime\|UpdatedTime]] | int64 | The date and time the object was last updated. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#Version\|Version]] | string | Uniquely identifies the version of the object. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetMetadata\|GetMetadata()]] | Dictionary | Returns the metadata associated with the object. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetUserIds\|GetUserIds()]] | Array | An array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] tagged with a key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CreatedTime

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the date and time the object was created, formatted as the number of milliseconds since epoch.

### UpdatedTime

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the date and time the object was last updated, formatted as the number of milliseconds since epoch.

### Version

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property uniquely identifies the version of the object. It can be passed to [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|DataStore:GetVersionAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync|DataStore:RemoveVersionAsync()]] to get or remove the version respectively.

## Methods

### GetMetadata

```lua
DataStoreKeyInfo:GetMetadata(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function returns the metadata associated with the latest version of the object.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Metadata associated with the key. |

### GetUserIds

```lua
DataStoreKeyInfo:GetUserIds(): Array
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function returns an array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] tagged with the object.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] associated with the object. |

---
*Source: [DataStoreKeyInfo](https://create.roblox.com/docs/reference/engine/classes/DataStoreKeyInfo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
