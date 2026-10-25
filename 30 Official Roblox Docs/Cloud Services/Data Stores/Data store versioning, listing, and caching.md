---
title: "Data store versioning, listing, and caching"
description: "How to manage data stores (DataStores) through versioning, listing, and caching."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/data-stores/versioning-listing-and-caching"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to manage data stores (DataStores) through versioning, listing, and caching.*

Manage your data using versioning, listing, and caching.

## Versioning

Versioning happens when you [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores#Create data|set]], [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores#Update data|update]], and [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores#Increment data|increment]] data. The functions [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]] create versioned backups of your data using the first write to each key in each UTC hour. Successive writes to a key in the same UTC hour permanently overwrite the previous data.

Versioned backups expire 30 days after a new write overwrites them. The latest version never expires.

The following functions perform versioning operations:

| Function | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync\|ListVersionsAsync()]] | Lists all versions for a key by returning a [[30 Official Roblox Docs/API Reference/Classes/DataStoreVersionPages\|DataStoreVersionPages]] instance that you can use to enumerate all version numbers. You can filter versions using a time range. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]] | Retrieves a specific version of a key using the key's version number. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync\|RemoveVersionAsync()]] | Deletes a specific version of a key.<br><br>This function also creates a tombstone version while retaining the previous version. For example, if you call `RemoveAsync("User_1234")` and then try to call `GetAsync("User_1234")`, you get `nil` back. However, you can still use [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync\|ListVersionsAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]] to retrieve older versions of the data. |

You can use versioning to handle user requests. If a user reports that a problem occurred at 2020-10-09T01:42, you can revert data to a previous version using the following example:

```lua
local DataStoreService = game:GetService("DataStoreService")

local gameStore = DataStoreService:GetDataStore("PlayerGame")

local DATA_STORE_KEY = "User_1234"

local maxDate = DateTime.fromUniversalTime(2020, 10, 09, 01, 42)

-- Gets the version closest to the given time
local listSuccess, pages = pcall(function()
    return gameStore:ListVersionsAsync(DATA_STORE_KEY, Enum.SortDirection.Descending, nil, maxDate.UnixTimestampMillis)
end)
if listSuccess then
    local items = pages:GetCurrentPage()
    if #items > 0 then
        -- Reads the closest version
        local closestEntry = items[1]
        local success, value, info = pcall(function()
            return gameStore:GetVersionAsync(DATA_STORE_KEY, closestEntry.Version)
        end)
        -- Restores current value by overwriting it with the closest version
        if success then
            local setOptions = Instance.new("DataStoreSetOptions")
            setOptions:SetMetadata(info:GetMetadata())
            gameStore:SetAsync(DATA_STORE_KEY, value, nil, setOptions)
        end
    else
        -- No entries found
    end
end
```

### Snapshots

The [Snapshot Data Stores Open Cloud API](https://create.roblox.com/docs/cloud/reference/DataStore#Cloud_SnapshotDataStores) lets you take a snapshot of all data stores in a game once a day. Before you publish any game update that changes your data storage logic, make sure to take a snapshot. Taking a snapshot guarantees that you have the most recent data available from the previous version of the game.

For example, without a snapshot, if you publish an update at 3:30 UTC that causes data corruption, the corrupted data overwrites any data written between 3:00-3:30 UTC. If you take a snapshot at 3:29 UTC, though, the corrupted data doesn't overwrite anything written before 3:29 UTC, and the latest data for all keys written between 3:00-3:29 UTC is preserved.

## Listing and prefixes

Data stores let you list by prefix. For example, listing by the first **n** characters of a name, like "d" , "do", or "dog" for any key or data store with a prefix of "dog".

You can specify a prefix when listing all data stores or keys, and get back only objects that match that prefix. Both [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync|ListDataStoresAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync|ListKeysAsync()]] functions return a [[30 Official Roblox Docs/API Reference/Classes/DataStoreListingPages|DataStoreListingPages]] object that you can use to enumerate the list.

| Function | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync\|ListDataStoresAsync()]] | Lists all data stores. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync\|ListKeysAsync()]] | Lists all keys in a data store. |

### Scopes

> [!warning]
> For new games, use [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Listing and prefixes|listing and prefixes]] to organize keys in your data store instead of the legacy scopes feature. For existing games that use scopes, continue using them.

You can organize keys in a data store further by setting a unique string as a scope for the second parameter of [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]]. The default scope (if no scope is given) is `global`. The scope is automatically prepended to the beginning of all keys in all operations done on the data store.

| Key | Scope |
| --- | --- |
| `houses/User_1234` | houses |
| `pets/User_1234` | pets |
| `inventory/User_1234` | inventory |

The combination of data store name, scope, and key uniquely identifies a key. All three values are required to identify a key with a scope. For example, you can read a `global`-scoped key named `User_1234` as:

```lua
local DataStoreService = game:GetService("DataStoreService")
local inventoryStore = DataStoreService:GetDataStore("PlayerInventory")
local success, currentGold = pcall(function()
  return inventoryStore:GetAsync("User_1234")
end)
```

If the key `User_1234` has a scope of `gold`, though, you can only read it as:

```lua
local DataStoreService = game:GetService("DataStoreService")
local inventoryStore = DataStoreService:GetDataStore("PlayerInventory", "gold")
local success, currentGold = pcall(function()
  return inventoryStore:GetAsync("User_1234")
end)
```

### AllScopes property

[[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions|DataStoreOptions]] contains an [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|AllScopes]] property that lets you return keys from all [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Scopes|scopes]] in a list. You can then use the [[30 Official Roblox Docs/API Reference/Classes/DataStoreKey#KeyName|KeyName]] property of a list item for common data store operations like [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|reading data]] with [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] and [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|removing data]] with [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]].

When you use the `AllScopes` property, the second parameter of [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]] must be an empty string (`""`).

```lua
local DataStoreService = game:GetService("DataStoreService")

local options = Instance.new("DataStoreOptions")
options.AllScopes = true

local ds = DataStoreService:GetDataStore("DS1", "", options)
```

> [!info]
> When you use the [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|AllScopes]] property, [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync|ListKeysAsync()]] returns every key with their scope as the prefix argument, such as `global/player_data_1234` or `houses/house3`. Remember that the default scope is `global`.

If you enable the [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|AllScopes]] property and create a new key in the data store, you must always specify a scope for that key in the format of scope/keyname. If you don't, the APIs throw an error. For example, `gold/player_34545` is acceptable with gold as the scope, but `player_34545` leads to an error.

| | |
| --- | --- |
| `global/K1` | `house/K1` |
| `global/L2` | `house/L2` |
| `global/M3` | `house/M3` |

## Caching

Use caching to temporarily store data from data stores to improve performance and reduce the number of requests made to the server. For example, a game can cache a copy of its data so that it can access that data quickly without having to make another call to the data store.

Caching applies to modifications you make to data store keys using:

- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|read data]].
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|create data]].
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|update data]].
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]] to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|increment data]].
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]] to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|remove data]].

[[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|GetVersionAsync()]], [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync|ListVersionsAsync()]], [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync|ListKeysAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync|ListDataStoresAsync()]] don't implement caching and always fetch the latest data from the service backend.

By default, the engine uses [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] to store values you retrieve from the backend in a local cache for four seconds. Also by default, [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] requests for cached keys return the cached value instead of continuing to the backend. Your [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] requests that return a cached value don't count towards your [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Server limits|server limits]] and [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Throughput limits|throughput limits]].

All [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] calls that retrieve a value not being cached from the backend update the cache immediately and restart the four second timer.

> [!warning]
> Caching is local to a particular data store instance, so different data stores can have their caches in different states. For example, if you access a key twice through two different data store instances, like getting one data store with a specified scope and another through having the [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes|AllScopes]] property enabled, each data store instance has its own cache. If you change the value of that key in one data store instance and not the other, you end up with inconsistent data.

### Disable caching

To disable caching and opt out of using the cache to retrieve the most up-to-date value from the servers, add the [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions|DataStoreGetOptions]] parameter to your [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] call and set the [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions#UseCache|UseCache]] property to `false` to make your request ignore any keys in the cache.

Disabling caching is useful if you have multiple servers writing to a key with high frequency and need to get the latest value from servers. However, it can cause you to consume more of your [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Limits|data stores limits and quotas]], since [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] requests bypassing caching always count towards your throughput and server limits.

For immediate verification reads after a write, use [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] with `DataStoreGetOptions.UseCache = false`. By default, [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] uses a local four-second cache, so a normal verification read can return stale data.

This is especially important after write operations like [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]], or [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]] return an error. In these cases, your code needs to determine whether to retry, refund, or take other corrective action.

The following example shows how to bypass the cache when verifying the result of a write:

```lua
local ok = pcall(function()
    store:UpdateAsync(key, transform)
end)

if not ok then
    local options = Instance.new("DataStoreGetOptions")
    options.UseCache = false

    local success, value = pcall(function()
        return store:GetAsync(key, options)
    end)

    if success then
        -- decide based on backend state, not cached state
    end
end
```

## Serialization

The [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] stores data in JSON format. When you save Luau data in Studio, Roblox uses a process called serialization to convert that data into JSON to save it in data stores. Roblox then converts your data back to Luau and returns it to you in another process called deserialization.

Serialization and deserialization support the following Luau data types:

- [[30 Official Roblox Docs/Luau/Nil|Nil]]
- [[30 Official Roblox Docs/Luau/Booleans|Booleans]]
- [[30 Official Roblox Docs/Luau/Numbers|Numbers]]
  - You should not store the special numeric values `inf`, `-inf`, and `nan`, because these values don't conform to JSON standards. When you retrieve an entry containing these values through Open Cloud, the response represents them as tagged JSON objects. For details, see [[30 Official Roblox Docs/Cloud/Guides/Data Stores/Open Cloud data stores#Non-finite numbers|Non-finite numbers]].
- [[30 Official Roblox Docs/Luau/Strings|Strings]]
- [[30 Official Roblox Docs/Luau/Tables|Tables]]
  - Tables must only contain other supported data types
  - Numeric keys are translated into strings if the length of the table is 0
- [[30 Official Roblox Docs/API Reference/Libraries/buffer|Buffers]]

If you try to store a data type that serialization doesn't support, you either:

- Fail in storing that data type and get an error message.
- Succeed in storing that data type as `nil`.

To debug why your data type is being stored as `nil`, you can use the [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONEncode|JSONEncode]] function. When you pass your Luau data type into this function, you receive it back in the format Roblox would have stored it with data stores, which lets you preview and investigate the returned data.

> [!info]
> Serialization doesn't happen when you use the [DataStore Open Cloud API](https://create.roblox.com/docs/cloud/reference/DataStore) because that data is already sent to Roblox in JSON format and doesn't need to be converted.

---
*Source: [Data store versioning, listing, and caching](https://create.roblox.com/docs/cloud-services/data-stores/versioning-listing-and-caching) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
