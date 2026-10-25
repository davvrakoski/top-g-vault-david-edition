---
title: "Memory store hash map"
description: "Explains how to implement the hash map data structure for memory stores."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/memory-stores/hash-map"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to implement the hash map data structure for memory stores.*

**Hash maps**, similar to sorted maps, let you store in-memory data as key-value pairs. Unlike sorted maps, they maintain no ordering guarantees. This data structure is useful for cases that require simple data caching and rapid access, such as shared inventories, physical auction houses, and more. Hash maps automatically handle partitioning your data and are very useful if you have more than 1,000 keys. For smaller key spaces, we recommend [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store sorted map|sorted maps]].

## Limits

Hash maps have a key size limit of 128 characters and a value size limit of 32 KB.

Otherwise, hash maps use the same [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|API request]] and [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Memory size quota|memory quota]] limits as the other memory store data structures.

## Get a hash map

To get a hash map, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService#GetHashMap|MemoryStoreService:GetHashMap()]] with a name for the hash map. The name is global within the game, so you can access the same hash map on any script using this name.

```lua title="Getting a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")
```

After you get a hash map, call any of the following functions to read or write data in it:

| Function | Action |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#SetAsync\|MemoryStoreHashMap:SetAsync()]] | [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map#Add or overwrite data\|Add]] a new key or overwrite the value if the key already exists. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#GetAsync\|MemoryStoreHashMap:GetAsync()]] | [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map#Get data\|Read]] a particular key. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#ListItemsAsync\|MemoryStoreHashMap:ListItemsAsync()]] | [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map#Get data\|List]] items in a hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync\|MemoryStoreHashMap:UpdateAsync()]] | [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map#Update data\|Update]] the value of a key after retrieving it from a hash map. |
| [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#RemoveAsync\|MemoryStoreHashMap:RemoveAsync()]] | [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store hash map#Remove data\|Remove]] a key from the hash map. |

For in-depth documentation about each function, see [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap|MemoryStoreHashMap]].

> [!warning]
> All functions accessing data structures in memory stores are asynchronous network calls that might occasionally fail. You should wrap these calls in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] to catch and handle errors, as shown in the code samples.

## Add or overwrite data

To add a new key or overwrite the value of a key in the hash map, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#SetAsync|MemoryStoreHashMap:SetAsync()]] with the key **name**, its **value**, and an **expiration time** in seconds. The memory automatically cleans up once the key expires. The maximum expiration time is 3,888,000 seconds (45 days).

```lua title="Adding Data to a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")

local setSuccess, _ = pcall(function()
	return hashMap:SetAsync("User_1234", 1000, 30)
end)
if setSuccess then
	print("Set succeeded.")
end
```

## Get data

You can either get a value associated with a specific key or get multiple key-value pairs in the hash map.

### Get data with one key

To get a value associated with one key from the hash map, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#GetAsync|MemoryStoreHashMap:GetAsync()]] with the key **name**.

```lua title="Getting a Particular Key from a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")

local setSuccess, _ = pcall(function()
	return hashMap:SetAsync("User_1234", 1000, 30)
end)
if setSuccess then
	print("Set succeeded.")
end

local item
local getSuccess, getError = pcall(function()
	item = hashMap:GetAsync("User_1234")
end)
if getSuccess then
	print(item)
else
	warn(getError)
end
```

### Get data with multiple key-value pairs

To get all the key-value pairs from the hash map as a single operation, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#ListItemsAsync|MemoryStoreHashMap:ListItemsAsync()]] with the desired page size. This function lists all existing keys in a paginated manner. For example, the following code sample retrieves up to 32 items from the hash map.

```lua title="Listing items in a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")

-- Get list of items, 32 items at a time
local success, pages = pcall(function()
	return hashMap:ListItemsAsync(32)
end)
if success then
	while true do
		-- Get the current page
		local entries = pages:GetCurrentPage()
		-- Iterate through all key-value pairs on page
		for _, entry in ipairs(entries) do
			print(entry.key .. " : " .. tostring(entry.value))
		end
		-- Check if last page has been reached
		if pages.IsFinished then
			break
		else
			print("----------")
			-- Advance to next page
			pages:AdvanceToNextPageAsync()
		end
	end
end
```

## Update data

To retrieve the value of a key from a hash map and update it, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync|MemoryStoreHashMap:UpdateAsync()]] with the key **name**, a **callback function** to update the key, and an **expiration time** in seconds.

For most games, multiple servers can update the same key concurrently and change the value. As [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync|UpdateAsync()]] always modifies the latest value before updating, you should use it to read the latest value as the input for your callback function.

For example, the following code sample updates the resource count of a resource in a shared inventory. [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync|UpdateAsync()]] ensures that all player contributions will make their way into this shared inventory, even if these contributions are made simultaneously. In this function, it also enforces a max resource count of 500.

```lua title="Updating Resource Count for a Resource in a Shared Inventory"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("ResourceInventory")

local function contributeResources(itemResource, addedCount)
	local success, newResourceCount = pcall(function()
		return hashMap:UpdateAsync(itemResource, function(resource)
			resource = resource or {count = 0}
			resource.count = resource.count + addedCount

			-- ensure we don't exceed the maximum resource count
			if resource.count > 500 then
				resource.count = 500
			end
			return resource
		end, 1200)
	end)
	if success then
		print(newResourceCount)
	end
end
```

The latency for [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#UpdateAsync|UpdateAsync()]] is similar to [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#GetAsync|GetAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#SetAsync|SetAsync()]] unless there is contention.

When contention occurs, the system automatically retries the operation until one of these three happens: the operation succeeds, the callback function returns `nil`, or the maximum number of retries is reached. If the system reaches the maximum number of retries, it returns a conflict.

## Remove data

You can use [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#RemoveAsync|MemoryStoreHashMap:RemoveAsync()]] for both removing one key from the hash map and deleting all data in a memory store hash map.

### Remove a key

To remove a key from the hash map, call [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#RemoveAsync|MemoryStoreHashMap:RemoveAsync()]] with a key **name**.

```lua title="Remove a Key from a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")

local setSuccess, _ = pcall(function()
	return hashMap:SetAsync("User_1234", 1000, 30)
end)
if setSuccess then
	print("Set succeeded.")
end

local removeSuccess, removeError = pcall(function()
	hashMap:RemoveAsync("User_1234")
end)
if not removeSuccess then
	warn(removeError)
end
```

### Delete all data

To delete all data in a hash map, list all your items with [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#ListItemsAsync|MemoryStoreHashMap:ListItemsAsync()]], then remove them with [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreHashMap#RemoveAsync|MemoryStoreHashMap:RemoveAsync()]].

```lua title="Delete all data in a Hash Map"
local MemoryStoreService = game:GetService("MemoryStoreService")

local hashMap = MemoryStoreService:GetHashMap("HashMap1")

-- Get list of items, 32 items at a time
local success, pages = pcall(function()
	return hashMap:ListItemsAsync(32)
end)
if success then
	while true do
		-- Get the current page
		local entries = pages:GetCurrentPage()
		local removeSuccess = true
		local removeError = nil
		-- Iterate through all key-value pairs on page
		for _, entry in ipairs(entries) do
			print(entry.key .. " : " .. tostring(entry.value))
			removeSuccess, removeError = pcall(function()
				hashMap:RemoveAsync(entry.key)
			end)

			if not removeSuccess then
				warn(removeError)
			end
		end
		-- Check if last page has been reached
		if pages.IsFinished then
			print("Finished deleting all data.")
			break
		else
			print("----------")
			-- Advance to next page
			pages:AdvanceToNextPageAsync()
		end
	end
end
```

---
*Source: [Memory store hash map](https://create.roblox.com/docs/cloud-services/memory-stores/hash-map) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
