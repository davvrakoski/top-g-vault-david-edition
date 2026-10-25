---
title: "Collection"
description: "A live, query-based group of instances returned by `CollectionService:CreateCollection()`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Collection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A live, query-based group of instances returned by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection|CollectionService:CreateCollection()]].*

## Description

A `Collection` is a live, query-based group of instances created by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection|CollectionService:CreateCollection()]] using a selector string and an optional root instance. From then on, membership is **automatic** such that an instance is added the moment it matches the query and removed the moment it stops matching. You never add or remove instances manually.

You can interact with a `Collection` by assigning **callbacks** to it. Rather than connecting a signal for each instance and remembering to disconnect it, you declare behavior once on the collection and it is applied to every matching instance for you. The collection owns those connections and tears them down automatically when an instance leaves the set. See the accompanying code sample for a collection that uses each kind of callback together.

A collection's lifetime is tied to the root instance passed to [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection|CreateCollection()]] (defaulting to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]). When that root is destroyed or when you call [[30 Official Roblox Docs/API Reference/Datatypes/Collection#Destroy|Destroy()]], the collection is torn down.

#### Callback Assignment Syntax

Callbacks are assigned as fields on the collection using function-statement syntax, which reads like the contents of a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]]. Both of the following forms are equivalent and assign through the collection's overloaded `__newindex`:

```lua
local CollectionService = game:GetService("CollectionService")

local collection = CollectionService:CreateCollection("Part")

function collection.OnAdded(instance)

end
```

```lua
local CollectionService = game:GetService("CollectionService")

local collection = CollectionService:CreateCollection("Part")

collection.OnAdded = function(instance)

end
```

Each callback can be **assigned only once**; reassigning the same callback raises an error. This keeps a collection's behavior declarative at its definition so that it cannot be silently replaced elsewhere.

#### Core Members and Aliases

`OnAdded`, `OnRemoved`, and [[30 Official Roblox Docs/API Reference/Datatypes/Collection#ForEach|ForEach()]] are the collection's primitive members:

- `OnAdded(instance: Instance)` — Fires when an instance begins matching the query. When you first assign `OnAdded`, it **immediately fires once for every instance already in the collection**, so a single callback handles both current and future members.
- `OnRemoved(instance: Instance)` — Fires when an instance that was in the collection stops matching, for example its tag is removed, it is reparented out of the collection's root, it is destroyed, or the collection's [[30 Official Roblox Docs/API Reference/Datatypes/Collection#Enabled|Enabled]] property is set to `false`.
- [[30 Official Roblox Docs/API Reference/Datatypes/Collection#ForEach|ForEach()]] — Imperatively iterates the instances currently in the collection, operating on a snapshot taken at call time.

A collection can also bind a callback to non-deprecated [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] steps through **aliases** which exist for performance as well as convenience:

| Collection Callback | Equivalent |
| --- | --- |
| `OnHeartbeat` | [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]] |
| `OnPreRender` | [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender\|RunService.PreRender]] |
| `OnPreAnimation` | [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation\|RunService.PreAnimation]] |
| `OnPreSimulation` | [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation\|RunService.PreSimulation]] |
| `OnPostSimulation` | [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation\|RunService.PostSimulation]] |
| `OnSimulate` | [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation\|RunService:BindToSimulation()]] |

The collection subscribes to each [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] event **once** and dispatches to its members internally, rather than every instance holding its own connection. The callback fires once per step **for each instance** in the collection and receives the instance followed by the step's `deltaTime`:

```lua
local CollectionService = game:GetService("CollectionService")

local collection = CollectionService:CreateCollection("Part")

function collection.OnHeartbeat(instance, deltaTime)

end
```

#### Event, Property, and Attribute Wrappers

Beyond the [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] aliases, a collection can wrap any signal on its member instances. In these callbacks, `X` stands for the name of an **event**, **property**, or **attribute**.

- `function collection.OnX(instance, ...)` wraps the `X` event on each member and the callback receives the instance followed by that event's arguments. For example, `OnTouched` wraps [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]].

  ```lua
  local CollectionService = game:GetService("CollectionService")

  local collection = CollectionService:CreateCollection("Part")

  function collection.OnTouched(part, otherPart)
  	print(part, otherPart)
  end
  ```

- `function collection.OnPropertyChanged.X(instance)` fires when property `X` changes on a member, equivalent to connecting [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]] on each instance.

  ```lua
  local CollectionService = game:GetService("CollectionService")

  local collection = CollectionService:CreateCollection("Part")

  function collection.OnPropertyChanged.Color(instance)
  	print(instance)
  end
  ```

- `function collection.OnAttributeChanged.X(instance)` fires when attribute `X` changes on a member, equivalent to [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|GetAttributeChangedSignal()]].

  ```lua
  local CollectionService = game:GetService("CollectionService")

  local collection = CollectionService:CreateCollection("Humanoid")

  function collection.OnAttributeChanged.CharacterHealth(instance)
  	print(instance)
  end
  ```

Note that a single collection can match instances of different classes, so a wrapped signal may not apply to every member:

- If a member does **not** have the signal or property named by the callback, that member **silently ignores** the assignment. For example, a collection matching both [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] can safely define `OnTouched`, but only the [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] respond.
- If a callback names an event or property that exists **nowhere** in the API (for example a misspelled `OnToched`), an error is raised at assignment time.

#### Typing and Autocomplete

When the query constrains the class of its matches, the collection is typed accordingly and callbacks are typed to match. For example, [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection|CreateCollection("Part.TagName")]] yields a collection whose callbacks receive a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], and autocomplete only suggests callbacks relevant to that class (so `collection.OnTouched(part: Part, other: BasePart)` is suggested, but not for a query that cannot match a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]). When no type can be inferred from the query, the first argument defaults to [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

*Code samples for this API (`Collection-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/datatypes/Collection); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Collection#Enabled\|Enabled]] | bool | Controls whether the collection is actively tracking instances and firing callbacks. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Collection#ForEach\|ForEach()]] |  | Invokes a function once for each instance currently in the collection. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Collection#Destroy\|Destroy()]] |  | Destroys the collection, stopping all tracking and callbacks. |

## Properties

### Enabled

**Type:** bool

Defaults to `true`. Setting this to `false` fires `OnRemoved` for every instance currently in the collection and stops all of its callbacks. Setting it back to `true` re-evaluates the query and fires `OnAdded` again for every matching instance. Assigning a non-boolean value raises an error.

## Methods

### ForEach

```lua
Collection:ForEach(callback: function): ()
```

Iterates over the instances currently in the collection, calling `callback` with each one. `ForEach()` operates on a snapshot taken at call time, so it is safe to add, remove, or destroy instances from within the callback; instances that begin matching during iteration are not visited. Calling `ForEach()` after the collection has been destroyed raises an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | function |  | A function called with each instance currently in the collection. |

### Destroy

```lua
Collection:Destroy(): ()
```

Stops firing the collection's callbacks, releases the connections it manages on its members, and empties its set of instances. After a collection is destroyed, calling [[30 Official Roblox Docs/API Reference/Datatypes/Collection#ForEach|ForEach()]] raises an error. A collection is also destroyed automatically when the root passed to [[30 Official Roblox Docs/API Reference/Classes/CollectionService#CreateCollection|CreateCollection()]] is destroyed.

---
*Source: [Collection](https://create.roblox.com/docs/reference/engine/datatypes/Collection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
