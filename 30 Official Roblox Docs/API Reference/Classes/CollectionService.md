---
title: "CollectionService"
description: "A service which manages instance collections using assigned tags."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CollectionService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service which manages instance collections using assigned tags.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`CollectionService` manages groups (collections) of instances with **tags**. Tags are sets of strings applied to instances that replicate from the server to the client. They are also serialized when places are saved.

The primary use of `CollectionService` is to register instances with specific tags that you can use to extend their behavior. If you find yourself adding the same script to many different instances, a script that uses `CollectionService` may be better.

Tags can be added or removed through this class' methods such as [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag|AddTag()]] or [[30 Official Roblox Docs/API Reference/Classes/CollectionService#RemoveTag|RemoveTag()]]. They can also be managed directly in Studio through the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of an instance's properties.

##### Replication

When tags replicate, **all tags on an instance replicate at the same time**. Therefore, if you set a tag on an instance from the client then add/remove a **different** tag on the same instance from the server, the client's local tags on the instance are overwritten. In [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|StreamingEnabled]] places, instances can be unloaded as they leave the client's streamed area. If such an instance re-enters the streamed area, properties and tags will be re-synchronized from the server. This can cause changes made by [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] to be overwritten/removed.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag\|AddTag()]] | () | Applies a tag to an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection\|CreateCollection()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] that tracks every instance matching a query. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetAllTags\|GetAllTags()]] | Array | Returns an array of all tags in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetCollection\|GetCollection()]] | Instances | **Deprecated.** Returns all instances of a given class which are in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetCollections\|GetCollections()]] | Array | Gets an array of every [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] the given instance is currently a member of. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal\|GetInstanceAddedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns a signal that fires when a given tag is added to an instance. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal\|GetInstanceRemovedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns a signal that fires when a given tag is removed from an instance. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTagged\|GetTagged()]] | Instances | Returns an array of instances in the game with a given tag. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTags\|GetTags()]] | Array | Gets an array of all tags applied to a given instance. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#HasTag\|HasTag()]] | boolean | Check whether an instance has a given tag. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#RemoveTag\|RemoveTag()]] | () | Removes a tag from an instance. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#ItemAdded\|ItemAdded]] | `instance` | **Deprecated.** Fires when a [[30 Official Roblox Docs/API Reference/Classes/Configuration\|Configuration]], [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]], [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver\|CustomEventReceiver]], [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]], or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat\|VehicleSeat]] is added to the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#ItemRemoved\|ItemRemoved]] | `instance` | **Deprecated.** Fires when a [[30 Official Roblox Docs/API Reference/Classes/Configuration\|Configuration]], [[30 Official Roblox Docs/API Reference/Classes/CustomEvent\|CustomEvent]], [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver\|CustomEventReceiver]], [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]], or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat\|VehicleSeat]] is removed from the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#TagAdded\|TagAdded]] | `tag` | Fires when a tag is added to an instance and the added tag is the only occurrence of that tag in the place. |
| [[30 Official Roblox Docs/API Reference/Classes/CollectionService#TagRemoved\|TagRemoved]] | `tag` | Fires when a tag is removed from an instance and the removed tag is no longer used anywhere in the place. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AddTag

```lua
CollectionService:AddTag(instance: Instance, tag: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `CustomLuaState`

This method applies a tag to an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], doing nothing if the tag is already applied to that instance. Successfully adding a tag will fire a signal created by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]] with the given tag.

##### Warnings

- An instance's tags that were added client-side will be dropped if the server later adds or removes a tag on that instance because the server replicates all tags together and overwrites previous tags.

- When tagging an instance, it is common that some resources are used to give the tag its functionality, for example event connections or tables. To prevent memory leaks, it's a good idea to clean these up (disconnect, set to `nil`, etc.) when no longer needed for a tag. Do this when calling [[30 Official Roblox Docs/API Reference/Classes/CollectionService#RemoveTag|RemoveTag()]], calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] or in a function connected to a signal returned by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to apply the tag to. |
| `tag` | string |  | The tag string to apply to the instance. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CreateCollection

```lua
CollectionService:CreateCollection(query: string, root: Instance = nil): Collection
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method creates a [[30 Official Roblox Docs/API Reference/Datatypes/Collection|Collection]], a **live, query-based group** of instances. Unlike tag-based methods such as [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTagged|GetTagged()]] which return a fixed array at the moment they are called, a [[30 Official Roblox Docs/API Reference/Datatypes/Collection|Collection]] continuously tracks which instances match `query` and notifies you as instances enter and leave the result set.

The `query` string is a CSS-inspired selector that follows the same selector conventions used by [[30 Official Roblox Docs/API Reference/Classes/Instance#QueryDescendants|QueryDescendants()]] and the [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]] styling selectors. Filters stack conjunctively, combinators express hierarchy, and comma-separated selectors form a union:

- `ClassName` — Instances of that class (uses [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|IsA()]]), for example `Part` or `Model`.
- `#Name` — Instances with a matching [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]].
- `.Tag` — Instances carrying a [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tag.
- `[Property = value]` — Instances whose property equals a value.
- `[$Attribute]` or `[$Attribute = value]` — Instances that have an attribute, optionally matching a value.
- `A > B` (direct child) and `A >> B` (any descendant) combinators.
- `:has(...)` and `:not(...)` pseudoclasses.

The rightmost selector in a chain identifies the matched instance, so `Folder > Part` tracks the parts, not the folders.

```lua
local CollectionService = game:GetService("CollectionService")

-- Track every Part tagged "KillBrick" anywhere under Workspace
local killBricks: Collection = CollectionService:CreateCollection("Part.KillBrick")

-- When a part joins the collection, make it glow red
-- OnAdded fires once for each part already matching, then again for each new match
function killBricks.OnAdded(brick: Part)
	brick.Material = Enum.Material.Neon
	brick.Color = Color3.new(1, 0, 0)
end

-- Kill any humanoid that touches a matched part
function killBricks.OnTouched(brick: Part, otherPart: BasePart)
	local character: Instance? = otherPart.Parent
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
end

-- Fires when a part stops matching (tag removed, reparented out, or destroyed)
function killBricks.OnRemoved(brick: Part)
	print("Deactivating", brick:GetFullName())
end
```

#### Notes

- The collection remains active until you call [[30 Official Roblox Docs/API Reference/Datatypes/Collection#Destroy|Destroy()]] or its `root` is destroyed.
- Lifecycle callbacks are queued rather than invoked synchronously, so a newly assigned `OnAdded` may fire on a later resumption point rather than during the assignment itself.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `query` | string |  | A selector string describing which instances to match. See the description for the supported syntax. |
| `root` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The instance whose descendants are searched. Pass this to restrict the search to a subtree, such that instances outside that subtree never match and an instance is removed from the collection if it is reparented out of `root`. Defaults to [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] when omitted. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] that reactively tracks the instances matching `query`. |

### GetAllTags

```lua
CollectionService:GetAllTags(): Array
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns an array of all tags that currently have at least one tagged instance inside the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. The returned array does not guarantee any particular ordering.

A tag appears in the result as soon as any instance bearing it enters the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] (for example by being parented to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]), and it is removed from the result once the last instance with that tag leaves the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] or has the tag removed. This means calling `GetAllTags()` immediately after removing the last instance with a given tag will no longer include that tag.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of all tags that currently have at least one tagged instance in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |

### GetCollection

> [!warning] Deprecated
> This item has been superseded by a `Class.CollectionService` tagging
> method. The equivalent function using the new method is
> `Class.CollectionService:GetTagged()` which should be used in new work.

```lua
CollectionService:GetCollection(class: string): Instances
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function returns all instances of a given class which are in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. Only works for [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]], [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]], [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver|CustomEventReceiver]], [[30 Official Roblox Docs/API Reference/Classes/Dialog|Dialog]], and [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `class` | string |  | The class type to retrieve instances of. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of all instances of the specified class in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |

*Code samples for this member (`CollectionService-GetCollection1`) are published on the source page; their code is not part of the open-source repo.*

### GetCollections

```lua
CollectionService:GetCollections(instance: Instance): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method is the [[30 Official Roblox Docs/API Reference/Datatypes/Collection|Collection]] equivalent of [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTags|CollectionService.GetTags()]]. It performs a reverse lookup on the instance and returns the collections it's a member of. Collections are not cached on [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] like tags, so this call scans all active collections looking for membership.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to look up [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] membership for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of the [[30 Official Roblox Docs/API Reference/Datatypes/Collection\|Collection]] values the instance is currently a member of. Empty if the instance matches no active query. |

### GetInstanceAddedSignal

```lua
CollectionService:GetInstanceAddedSignal(tag: string): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Given a tag (string), this method returns a signal which fires under two conditions:

- The tag is assigned to an instance within the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] using [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag|CollectionService:AddTag()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#AddTag|Instance:AddTag()]].

- An instance with the given tag is added as a descendant of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], for example by setting [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] or similar.

Subsequent calls to this method with the same tag return the same signal object. Consider also calling [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTagged|GetTagged()]] to get a list of instances that already have a tag (and thus won't fire the event if they already are in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]).

See also [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]] which returns an event that fires under similar conditions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to watch for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An event that fires when you add the tag to an instance. |

*Code samples for this member (`Deadly-Bricks-using-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

### GetInstanceRemovedSignal

```lua
CollectionService:GetInstanceRemovedSignal(tag: string): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Given a tag (string), this method returns a signal which fires under two conditions:

- The tag is removed from an instance within the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] using [[30 Official Roblox Docs/API Reference/Classes/CollectionService#RemoveTag|CollectionService:RemoveTag()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#RemoveTag|Instance:RemoveTag()]].

- An instance with the given tag is removed as a descendant of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], for example by un‑setting [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] or similar.

Subsequent calls to this method with the same tag return the same signal object. The signal is useful for cleaning up resources used by instances that once had tags, such as disconnecting connections.

See also [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]] which returns an event that fires under similar conditions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to watch for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An event that fires when you remove the tag from an instance. |

*Code samples for this member (`Deadly-Bricks-using-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

### GetTagged

```lua
CollectionService:GetTagged(tag: string): Instances
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns an array of instances with a given tag which are descendants of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. Removing a tag using [[30 Official Roblox Docs/API Reference/Classes/CollectionService#RemoveTag|CollectionService:RemoveTag()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#RemoveTag|Instance:RemoveTag()]] ensures this method does not return them.

If you want to detect all instances with a tag, both present **and** future, use this method to iterate over instances while also making a connection to a signal returned by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]].

This method does not guarantee any ordering of the returned instances. Additionally, it's possible that instances can have the given tag assigned to them but not be a descendant of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], for example its parent is `nil`; this method will not return such instances.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to search for. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of all instances with the tag. |

*Code samples for this member (`Deadly-Bricks-using-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

### GetTags

```lua
CollectionService:GetTags(instance: Instance): Array
```

**Thread safety:** Safe · **Capabilities:** Basic · **Tags:** `CustomLuaState`

Given an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], this method returns an array of strings which are the tags applied to the instance.

This method is useful when you want to do something with multiple instance tags at once, but it's inefficient to check for the existence of a single tag. For this, use [[30 Official Roblox Docs/API Reference/Classes/CollectionService#HasTag|HasTag()]] to check for a single tag.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance whose tags should be returned. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings which are the tags applied to the given instance. |

*Code samples for this member (`Using-Tags-and-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

### HasTag

```lua
CollectionService:HasTag(instance: Instance, tag: string): boolean
```

**Thread safety:** Safe · **Capabilities:** Basic · **Tags:** `CustomLuaState`

This method returns whether a given [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] has a tag.

By extension, any tags returned by a call to [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetTags|GetTags()]] on an instance will return `true` when used with this method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to check for the presence of a tag. |
| `tag` | string |  | The tag to check for. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the instance has the tag. |

*Code samples for this member (`Using-Tags-and-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

### RemoveTag

```lua
CollectionService:RemoveTag(instance: Instance, tag: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `CustomLuaState`

This method removes a tag from an instance. Successfully removing a tag will fire a signal created by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]] with the given tag.

When removing a tag, it's common that some resources are used to give the tag its functionality, for example event connections or tables. To prevent memory leaks, it's a good idea to clean these up (disconnect, set to `nil`, etc.) when no longer needed for a tag.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to remove the tag from. |
| `tag` | string |  | The tag to remove from the instance. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Using-Tags-and-CollectionService`) are published on the source page; their code is not part of the open-source repo.*

## Events

### ItemAdded

> [!warning] Deprecated
> This item has been superseded by a `Class.CollectionService` tagging
> method. There is currently no means of checking when a tag is added.

```lua
CollectionService.ItemAdded(instance: Instance)
```

**Capabilities:** Basic · **Tags:** `Deprecated`

This function fires when a [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]], [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]], [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver|CustomEventReceiver]], [[30 Official Roblox Docs/API Reference/Classes/Dialog|Dialog]], or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] is added to the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance that was added to the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |

*Code samples for this member (`CollectionService-ItemAdded1`) are published on the source page; their code is not part of the open-source repo.*

### ItemRemoved

> [!warning] Deprecated
> This item has been superseded by a `Class.CollectionService` tagging
> method. There is currently no means of checking when a tag is removed.

```lua
CollectionService.ItemRemoved(instance: Instance)
```

**Capabilities:** Basic · **Tags:** `Deprecated`

This function fires when a [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]], [[30 Official Roblox Docs/API Reference/Classes/CustomEvent|CustomEvent]], [[30 Official Roblox Docs/API Reference/Classes/CustomEventReceiver|CustomEventReceiver]], [[30 Official Roblox Docs/API Reference/Classes/Dialog|Dialog]], or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] is removed from the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance that was removed from the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. |

*Code samples for this member (`CollectionService-ItemRemoved1`) are published on the source page; their code is not part of the open-source repo.*

### TagAdded

```lua
CollectionService.TagAdded(tag: string)
```

**Capabilities:** Basic

This event fires when a tag transitions from being unused to being in use — specifically, when a tag is applied to an instance inside the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] and no other instance in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] previously had that tag. The event passes the tag name as its parameter.

`TagAdded` fires once per tag lifetime, not once per instance. To detect every individual instance that receives a particular tag, use [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]] instead.

The event fires asynchronously (deferred to the next resumption point), not synchronously inside the [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag|AddTag()]] call that triggered it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The name of the tag that entered use. |

### TagRemoved

```lua
CollectionService.TagRemoved(tag: string)
```

**Capabilities:** Basic

This event fires when the last instance bearing a given tag leaves the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] or has the tag removed, meaning no instance in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] still carries that tag. The event passes the tag name as its parameter.

`TagRemoved` fires once per tag lifetime, not once per instance. To detect every individual instance that loses a particular tag, use [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]] instead.

The event fires asynchronously (deferred to the next resumption point), not synchronously inside the removal operation that triggered it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The name of the tag that is no longer in use. |

---
*Source: [CollectionService](https://create.roblox.com/docs/reference/engine/classes/CollectionService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
