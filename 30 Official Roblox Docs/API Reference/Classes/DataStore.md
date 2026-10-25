---
title: "DataStore"
description: "A `GlobalDataStore` that also supports versioning, key metadata, and enumerating keys."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStore"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] that also supports versioning, key metadata, and enumerating keys.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] for an in-depth guide on data structure, management, error handling, limits, and more.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]] | Tuple | Retrieves the specified key version. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAtTimeAsync\|GetVersionAtTimeAsync()]] | Tuple | Retrieves the key version that was current at a given time. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync\|ListKeysAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages\|DataStoreKeyPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages\|DataStoreKeyPages]] object for enumerating through keys of a data store. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync\|ListVersionsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStoreVersionPages\|DataStoreVersionPages]] | Enumerates all versions of a key. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync\|RemoveVersionAsync()]] | () | **Deprecated.** Permanently deletes the specified version of a key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetVersionAsync

```lua
DataStore:GetVersionAsync(key: string, version: string): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function retrieves the specified key version as well as a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] instance. A version identifier can be found through [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync|DataStore:ListVersionsAsync()]] or alternatively be the identifier returned by [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which the version info is requested. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `version` | string |  | Version number of the key for which the version info is requested. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The value of the key at the specified version and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance that includes the version number, date and time the version was created, and functions to retrieve [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. |

### GetVersionAtTimeAsync

```lua
DataStore:GetVersionAtTimeAsync(key: string, timestamp: int64): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function retrieves the key version that was current at a given time as well as a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which the version info is requested. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `timestamp` | int64 |  | Unix timestamp in milliseconds for which the requested version was current. Must be greater than zero. Must not be more than ten minutes in the future. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The value of the key that was current at the specified time and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance that includes the version number, date and time the version was created, and functions to retrieve [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. `nil` if no available version was current at the requested time. |

*Code samples for this member (`retrieving-datastore-versions-by-time`) are published on the source page; their code is not part of the open-source repo.*

### ListKeysAsync

```lua
DataStore:ListKeysAsync(prefix: string, pageSize: int = 0, cursor: string, excludeDeleted: boolean = False): DataStoreKeyPages
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function returns a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages|DataStoreKeyPages]] object for enumerating through keys of a data store. It accepts an optional `prefix` parameter to only locate keys whose names start with the provided prefix.

If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|DataStoreService:GetDataStore()]], keys will be returned with all scopes as prefixes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | string |  | **(Optional)** Prefix to use for locating keys. |
| `pageSize` | int | `0` | **(Optional)** Number of items to be returned in each page. If no value is given, the engine sends a default value of 0 to the data store web service, which in turn defaults to 50 items per page. |
| `cursor` | string |  | **(Optional)** Cursor to continue iteration. |
| `excludeDeleted` | boolean | `False` | **(Optional)** Exclude deleted keys from being returned.<br><br>When enabled ListKeys will check up to 512 keys. If all checked keys are deleted then it will return an empty list with a cursor to continue iteration. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages\|DataStoreKeyPages]] | A [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyPages\|DataStoreKeyPages]] instance that enumerates the keys as [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey\|DataStoreKey]] instances. |

### ListVersionsAsync

```lua
DataStore:ListVersionsAsync(key: string, sortDirection: SortDirection = Ascending, minDate: int64 = 0, maxDate: int64 = 0, pageSize: int = 0): DataStoreVersionPages
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function enumerates versions of the specified key in either ascending or descending order specified by a [[30 Official Roblox Docs/API Reference/Enums/SortDirection|Enum.SortDirection]] parameter. It can optionally filter the returned versions by minimum and maximum timestamp.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for the versions to list. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `sortDirection` | [[30 Official Roblox Docs/API Reference/Enums/SortDirection\|SortDirection]] | `Ascending` | **(Optional)** Enum specifying ascending or descending sort order. |
| `minDate` | int64 | `0` | **(Optional)** Unix timestamp in milliseconds after which the versions should be listed. |
| `maxDate` | int64 | `0` | **(Optional)** Unix timestamp in milliseconds up to which the versions should be listed. |
| `pageSize` | int | `0` | **(Optional)** Number of items to be returned in each page. If no value is given, the engine sends a default value of 0 to the data store web service, which in turn defaults to 1024 items per page. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreVersionPages\|DataStoreVersionPages]] | A [[30 Official Roblox Docs/API Reference/Classes/DataStoreVersionPages\|DataStoreVersionPages]] instance that enumerates all the versions of the key as [[30 Official Roblox Docs/API Reference/Classes/DataStoreObjectVersionInfo\|DataStoreObjectVersionInfo]] instances. |

*Code samples for this member (`retrieving-datastore-versions-with-a-date-filter`) are published on the source page; their code is not part of the open-source repo.*

### RemoveVersionAsync

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
DataStore:RemoveVersionAsync(key: string, version: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`, `Deprecated`

This function permanently deletes the specified version of a key. Version identifiers can be found through [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync|DataStore:ListVersionsAsync()]].

Unlike [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|GlobalDataStore:RemoveAsync()]], this function does not create a new "tombstone" version and the removed value cannot be retrieved later.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which a version is to be removed. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `version` | string |  | Version number of the key to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [DataStore](https://create.roblox.com/docs/reference/engine/classes/DataStore) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
