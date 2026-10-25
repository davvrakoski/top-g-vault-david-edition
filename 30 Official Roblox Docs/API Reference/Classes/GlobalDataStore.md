---
title: "GlobalDataStore"
description: "An object that exposes methods to access a single data store."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that exposes methods to access a single data store.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]], [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A **GlobalDataStore** exposes functions for saving and loading data for the [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]].

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] for an in-depth guide on data structure, management, error handling, limits, and more.

Ordered data stores do not support versioning and metadata, so [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] is always `nil` for keys in an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]. If you need versioning and metadata support, use a [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#BatchGetAsync\|BatchGetAsync()]] | Dictionary | Returns the values of multiple keys from the data store in a single request. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync\|GetAsync()]] | Tuple | Returns the value of a key in a specified data store and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync\|IncrementAsync()]] | Variant | Increments the value of a key by the provided amount (both must be integers). |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#OnUpdate\|OnUpdate()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | **Deprecated.** Sets a callback function to be executed any time the value associated with a key is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync\|RemoveAsync()]] | Tuple | Removes the specified key while also retaining an accessible version. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync\|SetAsync()]] | Variant | Sets the value of the data store for the given key. |
| [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] | Tuple | Updates a key's value with a new value from the specified callback function. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BatchGetAsync

```lua
GlobalDataStore:BatchGetAsync(keys: Array, options: Dictionary = nil): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function retrieves the values of multiple keys in a single request.

This method is currently only supported on [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]. Calling it on a standard [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] or [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] will throw an error.

Unlike [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]], this method does not return [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] since ordered data stores do not support versioning or metadata.

The returned dictionary maps each key to a table with a `value` field. For example, if you request keys `{"coins", "gems"}`, the result might look like:

```lua
{
    coins = { value = 100 },
    gems = { value = 50 }
}
```

Keys that do not exist in the data store or have empty values are omitted from the result rather than returning nil values.

#### Limits

The `keys` array must contain at least one key and no more than the server-configured maximum (default 100). Exceeding the limit will throw an error. Each call counts against the ordered data store read budget based on the number of keys requested.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keys` | Array |  | An array of key name strings to retrieve. The maximum number of keys per request is determined by a server-side limit (default 100). |
| `options` | Dictionary | `nil` | **(Optional)** Unused; has no effect. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping each requested key (string) to a table containing a `value` field with the key's current value. Keys that don't exist or have no value are omitted from the result. |

*Code samples for this member (`GlobalDataStore-BatchGetAsync1`) are published on the source page; their code is not part of the open-source repo.*

### GetAsync

```lua
GlobalDataStore:GetAsync(key: string, options: DataStoreGetOptions = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function returns the latest value of the provided key and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] instance. If the key does not exist or if the latest version has been marked as deleted, both return values will be `nil`.

Keys are cached locally for 4 seconds after the first read. A [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] call within these 4 seconds returns a value from the cache. Modifications to the key by [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]] apply to the cache immediately and restart the 4 second timer.

To get a specific version, such as a version before the latest, use [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|DataStore:GetVersionAsync()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key name for which the value is requested. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `options` | [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions\|DataStoreGetOptions]] | `nil` | **(Optional)** A [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions\|DataStoreGetOptions]] instance that controls aspects of the read, such as whether to bypass the locally cached value via its [[30 Official Roblox Docs/API Reference/Classes/DataStoreGetOptions#UseCache\|DataStoreGetOptions.UseCache]] property. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The value of the entry in the data store with the given key and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance that includes the version number, date and time the version was created, and functions to retrieve [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. |

### IncrementAsync

```lua
GlobalDataStore:IncrementAsync(key: string, delta: int = 1, userIds: Array = {}, options: DataStoreIncrementOptions = nil): Variant
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function increments the value of a key by the provided amount (both must be integers).

Values in [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] are **versioned** as outlined in [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Versioning|versioning]]. [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStores]] do not support versioning, so calling this method on an ordered data store key will overwrite the current value with the incremented value and make previous versions inaccessible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which the value should be updated. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `delta` | int | `1` | Amount to increment the current value by. |
| `userIds` | Array | `{}` | **(Optional)** A table of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] to associate with the key. |
| `options` | [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions\|DataStoreIncrementOptions]] | `nil` | **(Optional)** [[30 Official Roblox Docs/API Reference/Classes/DataStoreIncrementOptions\|DataStoreIncrementOptions]] instance that combines multiple additional parameters as custom metadata and allows for future extensibility. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The updated value of the entry in the data store with the given key. |

### OnUpdate

> [!warning] Deprecated
> This function has been deprecated and should not be used in new work. You
> can use the `Class.MessagingService|Cross Server Messaging Service` to
> publish and subscribe to topics to receive near real-time updates,
> completely replacing the need for this function.

```lua
GlobalDataStore:OnUpdate(key: string, callback: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Deprecated`

This function sets `callback` as the function to be run any time the value associated with the `key` changes. Once every minute, OnUpdate polls for changes by other servers. Changes made on the same server will run the function immediately. In other words, functions like [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] change the key's value in the data store and will cause the function to run.

It's recommended that you **disconnect** the connection when the subscription to the key is no longer needed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The key identifying the entry being retrieved from the data store. |
| `callback` | Function |  | The function to be executed any time the value associated with **key** is changed. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | The connection to the key being tracked for updates. |

*Code samples for this member (`GlobalDataStore-OnUpdate1`) are published on the source page; their code is not part of the open-source repo.*

### RemoveAsync

```lua
GlobalDataStore:RemoveAsync(key: string): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function marks the specified key as deleted by creating a new "tombstone" version of the key. Prior to this, it returns the latest version prior to the remove call.

After a key is removed via this function, [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GlobalDataStore:GetAsync()]] calls for the key will return `nil`. Older versions of the key remain accessible through [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync|DataStore:ListVersionsAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|DataStore:GetVersionAsync()]], assuming they have not expired.

[[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]] does not support versioning, so calling [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]] on an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]] key will permanently delete it.

Removed objects will be deleted permanently after 30 days.

If the previous values were already deleted via [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|GlobalDataStore:RemoveAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync|DataStore:RemoveVersionAsync()]], the function will return `nil`, `nil` for value and [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] respectively.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name to be removed. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The value of the data store prior to deletion and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance that includes the version number, date and time the version was created, and functions to retrieve [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. |

### SetAsync

```lua
GlobalDataStore:SetAsync(key: string, value: Variant, userIds: Array = {}, options: DataStoreSetOptions = nil): Variant
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function sets the latest value, [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]], and metadata for the given key.

Values in [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] are **versioned** as outlined in [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Versioning|versioning]]. [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStores]] do not support versioning, so calling this method on an ordered data store key will overwrite the current value and make previous versions inaccessible.

Metadata definitions must always be updated with a value, even if there are no changes to the current value; otherwise the current value will be lost.

Any string being stored in a data store must be valid [[30 Official Roblox Docs/API Reference/Libraries/utf8|UTF-8]]. In UTF-8, values greater than 127 are used exclusively for encoding multi-byte codepoints, so a single byte greater than 127 will not be valid UTF-8 and the [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] attempt will fail.

#### Set vs. Update

[[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] is best for a quick update of a specific key, and it only counts against the write limit. However, it may cause data inconsistency if two servers attempt to set the same key at the same time. [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]] is safer for handling multi-server attempts because it reads the current key value (from whatever server last updated it) before making any changes. However, it's somewhat slower because it reads before it writes, and it also counts against both the read and write limit.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which the value should be set. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `value` | Variant |  | The value that the data store key will be set to. |
| `userIds` | Array | `{}` | Table of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]], highly recommended to assist with GDPR tracking/removal. |
| `options` | [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions\|DataStoreSetOptions]] | `nil` | **(Optional)** [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions\|DataStoreSetOptions]] instance that allows for metadata specification on the key. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The version identifier of the newly created version. It can be used to retrieve key info using [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]] or to remove it using [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync\|RemoveVersionAsync()]]. |

### UpdateAsync

```lua
GlobalDataStore:UpdateAsync(key: string, transformFunction: Function): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DataStore · **Tags:** `Yields`

This function retrieves the value and metadata of a key from the data store and updates it with a new value determined by the callback function specified through the second parameter. If the callback returns `nil`, the write operation is cancelled and the value remains unchanged.

Values in [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] are **versioned** as outlined in [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Versioning|versioning]]. [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStores]] do not support versioning, so calling this method on an ordered data store key will overwrite the current value and make previous versions inaccessible.

In cases where another game server updated the key in the short timespan between retrieving the key's current value and setting the key's value, [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]] will call the function again, discarding the result of the previous call. The function will be called as many times as needed until the data is saved **or** until the callback function returns `nil`. This can be used to ensure that no data is overwritten.

Any string being stored in a data store must be valid [[30 Official Roblox Docs/API Reference/Libraries/utf8|UTF-8]]. In UTF-8, values greater than 127 are used exclusively for encoding multi-byte codepoints, so a single byte greater than 127 will not be valid UTF-8 and the [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]] attempt will fail.

#### Set vs. Update

[[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] is best for a quick update of a specific key, and it only counts against the write limit. However, it may cause data inconsistency if two servers attempt to set the same key at the same time. [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|GlobalDataStore:UpdateAsync()]] is safer for handling multi-server attempts because it reads the current key value (from whatever server last updated it) before making any changes. However, it's somewhat slower because it reads before it writes, and it also counts against both the read and write limit.

#### Callback Function

The callback function accepts two arguments:

- Current value of the key prior to the update.
- [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] instance that contains the latest version information (this argument can be ignored if metadata is not being used).

In turn, the callback function returns up to three values:

- The new value to set for the key.
- An array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] to associate with the key. [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetUserIds|DataStoreKeyInfo:GetUserIds()]] should be returned unless the existing IDs are being changed; otherwise all existing IDs will be cleared.
- A Luau table containing metadata to associate with the key. [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetMetadata|DataStoreKeyInfo:GetMetadata()]] should be returned unless the existing metadata is being changed; otherwise all existing metadata will be cleared.

If the callback returns `nil` instead, the current server will stop attempting to update the key.

The callback function cannot yield, so do **not** include calls like [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | Key name for which the value should be updated. If [[30 Official Roblox Docs/API Reference/Classes/DataStoreOptions#AllScopes\|DataStoreOptions.AllScopes]] was set to true when accessing the data store through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore\|DataStoreService:GetDataStore()]], this key name must be prepended with the original scope as in "scope/key". |
| `transformFunction` | Function |  | Transform function that takes the current value and [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] as parameters and returns the new value along with optional [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The updated value of the entry in the data store with the given key and a [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo\|DataStoreKeyInfo]] instance that includes the version number, date and time the version was created, and functions to retrieve [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] and metadata. |

---
*Source: [GlobalDataStore](https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
