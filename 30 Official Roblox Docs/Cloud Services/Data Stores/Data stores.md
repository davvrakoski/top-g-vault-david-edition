---
title: "Data stores"
description: "How to implement data stores (DataStores) to store persistent data."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/data-stores"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to implement data stores (DataStores) to store persistent data.*

The [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] lets you store data that needs to persist between sessions, like items in a player's inventory or skill points. Data stores are consistent per game, so any place in a game can access and change the same data, including places on different servers.

If you want to add granular permission control to your data stores and access them outside of Studio or Roblox servers, you can use [Open Cloud APIs for data stores](https://create.roblox.com/docs/cloud/reference/DataStore).

To view and monitor all the data stores in a game through the Creator Hub, use the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data Stores Manager|Data Stores Manager]].

For temporary data that you need to update or access frequently, use [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|memory stores]].

## Enable Studio access

By default, games tested in Studio can't access data stores, so you must first enable them. Accessing data stores in Studio can be dangerous for live games because Studio accesses the same data stores as the client application. To avoid overwriting production data, do not enable this setting for live games. Instead, enable it for a separate test version of the game.

To enable Studio access in a [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|published]] game:

1. Open Studio's **File** ⟩ **Experience Settings** window.
2. Navigate to **Security**.
3. Enable the **Enable Studio Access to API Services** toggle.
4. Click **Save**.

## Access data stores

To access a data store inside a game:

1. Add [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] to a server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].
2. Use the [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]] function and specify the name of the data store you want to use. If the data store doesn't exist, Studio creates one when you save your game data for the first time.

```lua
local DataStoreService = game:GetService("DataStoreService")

local gameStore = DataStoreService:GetDataStore("PlayerGame")
```

> [!warning]
> The server can only access data stores through [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]]. Attempting client-side access in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] causes an error.

## Create data

A data store is essentially a dictionary, similar to a Luau table. A unique **key** indexes each value in the data store, like a user's unique [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] or a named string for a game promo.

| **User data key** | **Value** |
| --- | --- |
| `31250608` | 50 |
| `351675979` | 20 |
| `505306092` | 78000 |
| ****Promo data key**** | ****Value**** |
| `ActiveSpecialEvent` | SummerParty2 |
| `ActivePromoCode` | BONUS123 |
| `CanAccessPartyPlace` | true |

To create a new entry, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] with the key name and a value.

```lua
local DataStoreService = game:GetService("DataStoreService")

local gameStore = DataStoreService:GetDataStore("PlayerGame")

local success, errorMessage = pcall(function()
	gameStore:SetAsync("User_1234", 50)
end)
if not success then
	print(errorMessage)
end
```

> [!warning]
> Functions like [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] that access a data store's contents are network calls that might occasionally fail. To catch and handle errors, make sure to wrap these calls in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]].

## Update data

To change any stored value in a data store, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] with the entry's key name and a callback function that defines how you want to update the entry. This callback takes the current value and returns a new value based on the logic you define. If the callback returns `nil`, the write operation is cancelled and the value isn't updated.

> [!warning]
> The callback function you pass into [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] does **not** have permission to yield. It can't contain any yielding functions like [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]].

```lua
local DataStoreService = game:GetService("DataStoreService")

local nicknameStore = DataStoreService:GetDataStore("Nicknames")

local function makeNameUpper(currentName)
	local nameUpper = string.upper(currentName)
	return nameUpper
end

local success, updatedName = pcall(function()
	return nicknameStore:UpdateAsync("User_1234", makeNameUpper)
end)
if success then
	print("Uppercase Name:", updatedName)
end
```

### Set vs update

Use set to quickly update a specific key. The [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] function:

- Can cause data inconsistency if two servers try to set the same key at the same time
- Only counts against the write limit

Use update to handle multi-server attempts. The [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] function:

- Reads the current key value from the server that last updated it before making any changes
- Is slower because it reads before it writes
- Counts against both the read and write limits

## Read data

To read the value of a data store entry, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] with the entry's key name.

```lua
local DataStoreService = game:GetService("DataStoreService")

local gameStore = DataStoreService:GetDataStore("PlayerGame")

local success, currentGame = pcall(function()
	return gameStore:GetAsync("User_1234")
end)
if success then
	print(currentGame)
end
```

> [!warning]
> The values you retrieve using [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]] sometimes can be out of sync with the backend due to the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Caching|caching]] behavior. For more information, see [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Disable caching|Disabling caching]].

## Increment data

To increment an integer in a data store, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]] with the entry's key name and a number for how much to change the value. [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]] is a convenience function that lets you avoid calling [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] and manually incrementing the integer.

```lua
local DataStoreService = game:GetService("DataStoreService")

local gameStore = DataStoreService:GetDataStore("PlayerGame")

local success, newGame = pcall(function()
	return gameStore:IncrementAsync("Player_1234", 1)
end)
if success then
	print(newGame)
end
```

## Remove data

To remove an entry and return the value associated with the key, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]].

```lua
local DataStoreService = game:GetService("DataStoreService")

local nicknameStore = DataStoreService:GetDataStore("Nicknames")

local success, removedValue = pcall(function()
	return nicknameStore:RemoveAsync("User_1234")
end)
if success then
	print(removedValue)
end
```

## Metadata

> [!info]
> Ordered data stores don't support [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store versioning, listing, and caching#Versioning|versioning]] and metadata, so [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] is always `nil` for keys in an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]]. If you need to support versioning and metadata, use [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]].

There are two types of metadata associated with keys:

- **Service-defined**: Default read-only metadata, like the most recent update time and creation time. Every object has service-defined metadata.
- **User-defined**: Custom metadata for tagging and categorization. Defined using the [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions|DataStoreSetOptions]] object and the [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions#SetMetadata|SetMetadata()]] function.

To manage metadata, expand the [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]] functions.

- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] accepts the optional third and fourth arguments:

  - A table of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]]. This can help with content copyright and intellectual property tracking and removal.
  - A [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions|DataStoreSetOptions]] object, where you can define custom metadata using the [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions#SetMetadata|SetMetadata()]] function.

    ```lua
    local DataStoreService = game:GetService("DataStoreService")

    local gameStore = DataStoreService:GetDataStore("PlayerGame")

    local setOptions = Instance.new("DataStoreSetOptions")
    setOptions:SetMetadata({["GameElement"] = "Fire"})

    local success, errorMessage = pcall(function()
        gameStore:SetAsync("User_1234", 50, {1234}, setOptions)
    end)
    if not success then
        print(errorMessage)
    end
    ```

- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync|RemoveAsync()]] return a second value in the [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] object. This second value contains both service-defined properties and functions to fetch user-defined metadata.

  - The [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetUserIds|GetUserIds()]] function fetches the table of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] that you passed to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]].
  - The [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#GetMetadata|GetMetadata()]] function fetches user-defined metadata that you passed to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]] through [[30 Official Roblox Docs/API Reference/Classes/DataStoreSetOptions#SetMetadata|SetMetadata()]].
  - The [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#Version|Version]] property fetches the version of the key.
  - The [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#CreatedTime|CreatedTime]] property fetches the time the key was created, formatted as the number of milliseconds since epoch.
  - The [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo#UpdatedTime|UpdatedTime]] property fetches the last time the key was updated, formatted as the number of milliseconds since epoch.

  ```lua
  local DataStoreService = game:GetService("DataStoreService")

  local gameStore = DataStoreService:GetDataStore("PlayerGame")

  local success, currentGame, keyInfo = pcall(function()
      return gameStore:GetAsync("User_1234")
  end)
  if success then
      print(currentGame)
      print(keyInfo.Version)
      print(keyInfo.CreatedTime)
      print(keyInfo.UpdatedTime)
      print(keyInfo:GetUserIds())
      print(keyInfo:GetMetadata())
  end
  ```

- The callback function of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]] takes an additional parameter in the [[30 Official Roblox Docs/API Reference/Classes/DataStoreKeyInfo|DataStoreKeyInfo]] object that describes the current key state. It returns the modified value, the keys associated with [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]], and the key's metadata.

  ```lua
  local DataStoreService = game:GetService("DataStoreService")

  local nicknameStore = DataStoreService:GetDataStore("Nicknames")

  local function makeNameUpper(currentName, keyInfo)
      local nameUpper = string.upper(currentName)
      local userIDs = keyInfo:GetUserIds()
      local metadata = keyInfo:GetMetadata()
      return nameUpper, userIDs, metadata
  end

  local success, updatedName, keyInfo = pcall(function()
      return nicknameStore:UpdateAsync("User_1234", makeNameUpper)
  end)
  if success then
      print(updatedName)
      print(keyInfo.Version)
      print(keyInfo.CreatedTime)
      print(keyInfo.UpdatedTime)
      print(keyInfo:GetUserIds())
      print(keyInfo:GetMetadata())
  end
  ```

> [!danger]
> When calling [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync|IncrementAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync|UpdateAsync()]], you must always update metadata definitions with a value, even when there are no changes to the current value. If you don't, you lose the current value.

For limits when defining metadata, see the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Metadata limits|metadata limits]].

## Ordered data stores

By default, data stores don't sort their content. If you need to get data in an ordered way, like in persistent leaderboard stats, call [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetOrderedDataStore|GetOrderedDataStore()]] instead of [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetDataStore|GetDataStore()]].

```lua
local DataStoreService = game:GetService("DataStoreService")

local characterAgeStore = DataStoreService:GetOrderedDataStore("CharacterAges")
```

Ordered data stores support the same basic functions as default data stores, plus the unique [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync|GetSortedAsync()]] function. This retrieves **multiple sorted keys** based on a specific sorting order, page size, and minimum/maximum values.

The following example sorts character data into pages with three entries, each in descending order, then loops through the pages and outputs each character's name and age.

```lua
local DataStoreService = game:GetService("DataStoreService")

local characterAgeStore = DataStoreService:GetOrderedDataStore("CharacterAges")

-- Populates ordered data store
local characters = {
	Mars = 19,
	Janus = 20,
	Diana = 18,
	Venus = 25,
	Neptune = 62
}
for char, age in characters do
	local success, errorMessage = pcall(function()
		characterAgeStore:SetAsync(char, age)
	end)
	if not success then
		print(errorMessage)
	end
end

-- Sorts data by descending order into pages of three entries each
local success, pages = pcall(function()
	return characterAgeStore:GetSortedAsync(false, 3)
end)
if success then
	while true do
		-- Gets the current (first) page
		local entries = pages:GetCurrentPage()
		-- Iterates through all key-value pairs on page
		for _, entry in entries do
			print(entry.key .. " : " .. tostring(entry.value))
		end
		-- Checks if last page has been reached
		if pages.IsFinished then
			break
		else
			print("----------")
			-- Advances to next page
			pages:AdvanceToNextPageAsync()
		end
	end
end
```

> [!info]
> When you iterate through [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetOrderedDataStore|GetOrderedDataStore()]] using [[30 Official Roblox Docs/API Reference/Classes/Pages#AdvanceToNextPageAsync|AdvanceToNextPageAsync()]], the limit for requests is the same as the maximum page size you set for an ordered data store. [[30 Official Roblox Docs/API Reference/Classes/Pages#AdvanceToNextPageAsync|AdvanceToNextPageAsync()]] always has the same limit as the class that originally requires it.

### Read multiple entries

To read multiple **ordered data store** entries in a single request, call [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#BatchGetAsync|BatchGetAsync()]] with an array of keys. This is the batch counterpart to reading entries one at a time with [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync|GetAsync()]].

[[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#BatchGetAsync|BatchGetAsync()]] returns a dictionary that maps each requested key to a table with a `value` field. Keys that don't exist are omitted from the dictionary, so confirm that a key is present before reading its value.

Each key you request counts as one read request, so a single call for `N` keys counts as `N` requests against the ordered data store [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Access limits|read limit]].

The following example reads three player scores in a single request, then loops through the keys and outputs each score that exists.

```lua
local DataStoreService = game:GetService("DataStoreService")

local playerScores = DataStoreService:GetOrderedDataStore("PlayerScores")
local keys = {"Player_123", "Player_456", "Player_789"}

local success, results = pcall(function()
	return playerScores:BatchGetAsync(keys)
end)
if success then
	for _, key in keys do
		local entry = results[key]
		if entry then
			print(key .. " : " .. tostring(entry.value))
		else
			print(key .. " has no saved entry")
		end
	end
end
```

---
*Source: [Data stores](https://create.roblox.com/docs/cloud-services/data-stores) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
