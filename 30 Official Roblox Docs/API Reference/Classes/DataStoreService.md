---
title: "DataStoreService"
description: "A game service that gives access to persistent data storage across places in a game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A game service that gives access to persistent data storage across places in a game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**DataStoreService** exposes methods for getting [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] and [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]] objects. Data stores can only be accessed by game servers, so you can only use [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] within a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that is used by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] for an in-depth guide on data structure, management, error handling, limits, and more.

*Code samples for this API (`DataStore-Budget`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/DataStoreService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|GetDataStore()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] instance with the provided name and scope. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetGlobalDataStore\|GetGlobalDataStore()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] | Returns the default data store. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetOrderedDataStore\|GetOrderedDataStore()]] | [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]] | Get an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]] given a name and optional scope. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetRequestBudgetForRequestType\|GetRequestBudgetForRequestType()]] | int | Returns the number of requests that can be made by the given request type. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync\|ListDataStoresAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages\|DataStoreListingPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages\|DataStoreListingPages]] object for enumerating through all of the experience's data stores. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#SetRateLimitForRequestType\|SetRateLimitForRequestType()]] | () | Sets the rate limit for a given request type per minute. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetDataStore

```lua
DataStoreService:GetDataStore(name: string, scope: string = global, options: Instance = nil): DataStore
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function creates a [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] instance with the provided name and scope. Subsequent calls to this method with the same name/scope will return the same object.

Using the `scope` parameter will restrict operations to that scope by automatically prepending the scope to keys in all operations done on the data store. This function also accepts an optional [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions|DataStoreOptions]] instance which includes options for enabling [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|AllScopes]]. See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Scopes|Versioning, listing, and caching]] for details on scope.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the data store. |
| `scope` | string | `global` | **(Optional)** A string specifying the scope. |
| `options` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | **(Optional)** A [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions\|DataStoreOptions]] instance to enable experimental features and v2 API features. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] | A [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] instance with provided name and optional scope. |

### GetGlobalDataStore

```lua
DataStoreService:GetGlobalDataStore(): DataStore
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function returns the default [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]]. If you want to access a specific **named** data store instead, you should use the [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]] function.

Note that the [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] returned by this function always uses the scope `u`. See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] for details on scope.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] | The default [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore\|GlobalDataStore]] instance. |

*Code samples for this member (`get-a-globaldatastore-instance`) are published on the source page; their code is not part of the open-source repo.*

### GetOrderedDataStore

```lua
DataStoreService:GetOrderedDataStore(name: string, scope: string = global): OrderedDataStore
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This method returns an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]], similar to the way [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]] does with [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]]. Subsequent calls to this method with the same name/scope will return the same object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the ordered data store. |
| `scope` | string | `global` | **(Optional)** A string specifying the scope. Default is "global". |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]] | An [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]] instance with the provided name and scope. |

*Code samples for this member (`OrderedDataStore-Basics`) are published on the source page; their code is not part of the open-source repo.*

### GetRequestBudgetForRequestType

```lua
DataStoreService:GetRequestBudgetForRequestType(requestType: DataStoreRequestType): int
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

This function returns the number of data store requests that the current place can make based on the given [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType|Enum.DataStoreRequestType]]. Any requests made that exceed this budget are subject to throttling. Monitoring and adjusting the frequency of data store requests using this function is recommended.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requestType` | [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType\|DataStoreRequestType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType\|Enum.DataStoreRequestType]] to check the budget for. |

**Returns**

| Type | Description |
| --- | --- |
| int | The number of data store requests that can currently be made for the specified request type. |

*Code samples for this member (`DataStoreService-GetRequestBudgetForRequestType1`) are published on the source page; their code is not part of the open-source repo.*

### ListDataStoresAsync

```lua
DataStoreService:ListDataStoresAsync(prefix: string, pageSize: int = 0, cursor: string): DataStoreListingPages
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages|DataStoreListingPages]] object for enumerating through all of the experience's data stores. It accepts an optional `prefix` parameter to only locate data stores whose names start with the provided prefix.

Only data stores containing at least one object will be listed via this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | string |  | **(Optional)** Prefix to enumerate data stores that start with the given prefix. |
| `pageSize` | int | `0` | **(Optional)** Number of items to be returned in each page. If no value is given, the engine sends a default value of 0 to the data store web service, which in turn defaults to 32 items per page. |
| `cursor` | string |  | **(Optional)** Cursor to continue iteration. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages\|DataStoreListingPages]] | [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages\|DataStoreListingPages]] instance containing [[30 Official Roblox Docs/API Reference/Classes/DataStoreInfo\|DataStoreInfo]] instances that provide details such as name, creation time, and time last updated. |

### SetRateLimitForRequestType

```lua
DataStoreService:SetRateLimitForRequestType(requestType: DataStoreRequestType, baseLimit: int, perPlayerLimit: int): ()
```

**Thread safety:** Unsafe · **Capabilities:** DataStore

Sets the per-server rate limit (requests per minute) for a given Data Store request type. The configured limit overrides the default rate limit for that request type on the current server. The rate limit is calculated as `rateLimit = baseLimit + (perPlayerLimit * numPlayers)`, where `numPlayers` is the current number of active players on the server. [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType|DataStoreRequestType.OnUpdate]] and [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType|DataStoreRequestType.UpdateAsync]] cannot be configured with this function. Calling this API with those request types will result in an error.

You should call this API **once per request type during server initialization**. We don't recommend calling this API during active experience logic. If called multiple times, the new limit definitions will immediately overwrite the previous ones.

The `baseLimit` and `perPlayerLimit` have different constraints depending on the request type. See the table below for more information.

##### Constraints by Request Type

| Request Type            | baseLimit constraints | perPlayerLimit constraints |
| :---------------------- | :-------------------- | :------------------------- |
| GetAsync                | [0, 60]               | [0, 40]                    |
| SetIncrementAsync       | [0, 60]               | [0, 40]                    |
| UpdateAsync             | N/A                   | N/A                        |
| GetSortedAsync          | [0, 5]                | [0, 2]                     |
| SetIncrementSortedAsync | [0, 30]               | [0, 5]                     |
| OnUpdate                | N/A                   | N/A                        |
| ListAsync               | [0, 5]                | [0, 2]                     |
| GetVersionAsync         | [0, 5]                | [0, 2]                     |
| RemoveVersionAsync      | [0, 5]                | [0, 2]                     |
| StandardRead            | [0, 10000]            | [0, 200]                   |
| StandardWrite           | [0, 10000]            | [0, 200]                   |
| StandardList            | [0, 10000]            | [0, 200]                   |
| StandardRemove          | [0, 10000]            | [0, 200]                   |
| OrderedRead             | [0, 10000]            | [0, 200]                   |
| OrderedWrite            | [0, 10000]            | [0, 200]                   |
| OrderedList             | [0, 10000]            | [0, 200]                   |
| OrderedRemove           | [0, 10000]            | [0, 200]                   |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requestType` | [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType\|DataStoreRequestType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/DataStoreRequestType\|Enum.DataStoreRequestType]] to configure the rate limit for. |
| `baseLimit` | int |  | The base number of requests allowed per minute regardless of player count. |
| `perPlayerLimit` | int |  | The additional number of requests per minute granted for each connected player. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`DataStoreService-SetRateLimitForRequestType1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [DataStoreService](https://create.roblox.com/docs/reference/engine/classes/DataStoreService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
