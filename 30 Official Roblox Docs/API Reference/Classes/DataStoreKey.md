---
title: "DataStoreKey"
description: "Object representing a key on a `DataStoreKeyPages` object."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreKey"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Object representing a key on a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages|DataStoreKeyPages]] object.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Object representing a key on a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages|DataStoreKeyPages]] object. It contains the key name as [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey#KeyName|DataStoreKey.KeyName]]. This object is a member of the [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages|DataStoreKeyPages]] object returned by [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync|DataStore:ListKeysAsync()]].

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey#KeyName\|KeyName]] | string | The name of the key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### KeyName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the name of the key. This name can then be used in other operations such as [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]].

If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]], the name will include its scope as a prefix.

---
*Source: [DataStoreKey](https://create.roblox.com/docs/reference/engine/classes/DataStoreKey) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
