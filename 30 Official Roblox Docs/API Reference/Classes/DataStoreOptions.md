---
title: "DataStoreOptions"
description: "Object used to provide additional parameters to `DataStoreService:GetDataStore()`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreOptions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Object used to provide additional parameters to [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

A configuration object passed as the third argument to [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]] to customize how the returned [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] behaves. Create one with `Instance.new("DataStoreOptions")`, set its properties, then pass it to `GetDataStore`. Currently the only behavioral property is [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|DataStoreOptions.AllScopes]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|AllScopes]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore\|GlobalDataStore]] should work with all scopes. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#SetExperimentalFeatures\|SetExperimentalFeatures()]] | () | Currently has no observable effect on data store behavior. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllScopes

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** DataStore

When set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] returned by [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]] operates across all scopes instead of a single scope. The `scope` parameter (second argument) to `GetDataStore` must be an empty string (`""`) when this property is enabled; passing a non-empty scope throws an error.

In all-scopes mode, every key is prefixed with its scope and a slash separator. For example, [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync|DataStore:ListKeysAsync()]] returns keys such as `global/player_data_1234` or `houses/house3`. When you create or access a key, you must include the scope prefix in the format `scope/keyname`; omitting the slash throws an error.

Default value is `false`.

## Methods

### SetExperimentalFeatures

```lua
DataStoreOptions:SetExperimentalFeatures(experimentalFeatures: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

Accepts a dictionary of feature-name keys mapped to boolean values and stores them on this [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions|DataStoreOptions]] instance. Calling this method has no observable effect on runtime behavior.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `experimentalFeatures` | Dictionary |  | Luau table in `key = value` format where the key is the experimental feature name and the value is a boolean which specifies whether to enable. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [DataStoreOptions](https://create.roblox.com/docs/reference/engine/classes/DataStoreOptions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
