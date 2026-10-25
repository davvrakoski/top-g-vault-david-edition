---
title: "SharedTable"
description: "Provides sharable, table-like storage for key/value pairs."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/SharedTable"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Provides sharable, table-like storage for key/value pairs.*

## Description

Represents a table-like data structure that can be shared across execution contexts. While it can be used for various sorts of general data storage, it is designed especially for use with [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]], where it can be used to share state across scripts parented under different [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] instances.

There are a couple idiomatic ways to communicate shared tables between scripts. One method is to store and retrieve [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects in the [[30 Official Roblox Docs/API Reference/Classes/SharedTableRegistry|SharedTableRegistry]]. The registry lets any script in the same data model get or set a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] by name. Another method is to use [[30 Official Roblox Docs/API Reference/Classes/Actor#SendMessage|Actor:SendMessage()]] to send a shared table to another [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] inside a message.

Like a Luau table, a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] object stores a set of key-value element pairs. Unlike a Luau table, only selected types of objects may be stored in a SharedTable, similar to other restrictions you'll find elsewhere in the Roblox Engine.

Keys must either be (1) a string or (2) a nonnegative integer number less than 2<sup>32</sup>. Other kinds of keys are not supported.

Values must have one of the following types: Boolean, Number, Vector, String, [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]], or a serializable data type. The ability to store a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] as a value in another [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] permits the construction of nested and recursive data structures.

[[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects are distinct and different [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects never compare equal, even if they have contents that would compare equal.

Like a Luau table, a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] object may be frozen, in which case it is read-only. An attempt to modify a frozen [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] will raise an error. A frozen [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] can be created by first creating a (non-frozen, modifiable) [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] with the desired contents, and then calling [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#cloneAndFreeze|SharedTable.cloneAndFreeze()]] to create a frozen clone of it.

*Code samples for this API (`SharedTable-ElementAccess`, `SharedTable-ElementIteration`) are published on the [source page](https://create.roblox.com/docs/reference/engine/datatypes/SharedTable); their code is not part of the open-source repo.*

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#new\|new()]] |  | Returns a new, empty [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#new\|new()]] | `t` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] containing elements equivalent to those in the provided Luau table. |

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#clear\|clear()]] | () | Removes all of the elements from the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#clone\|clone()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] | Creates and returns a clone of the provided [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#cloneAndFreeze\|cloneAndFreeze()]] | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] | Creates and returns a frozen (read-only) clone of the provided [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#increment\|increment()]] | number | Adds `delta` to the value with the provided key and returns the original value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#isFrozen\|isFrozen()]] | boolean | Returns `true` if the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] is frozen (read-only). |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#size\|size()]] | number | Returns the number of elements stored in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#update\|update()]] | () | Updates the value with the provided key via the provided update function. |

## Constructors

### new

```lua
SharedTable.new(): SharedTable
```

Returns a new, empty [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]].

```lua
local st = SharedTable.new()
```

### new

```lua
SharedTable.new(t: table): SharedTable
```

Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] containing elements equivalent to those in the provided Luau table.

If the provided Luau table contains any keys or values that cannot be stored in a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]], construction of the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] fails. See the summary at the top of this page for a list of types of objects that can be stored in a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]]. If the Luau table contains any table as a value, that table is converted into a new [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]].

```lua
local t = {}
t.x = 1
t.y = 2
t.z = {"a", "b", "c"}

local st = SharedTable.new(t)
assert(st.x == 1)
assert(st.y == 2)
assert(st.z[1] == "a")
assert(st.z[2] == "b")
assert(st.z[3] == "c")
```

Note that in some cases it may be desirable to store a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] in the [[30 Official Roblox Docs/API Reference/Classes/SharedTableRegistry|SharedTableRegistry]]. The [ShareTableRegistry:GetSharedTable()](https://create.roblox.com/docs/reference/engine/classes/ShareTableRegistry#GetSharedTable) method provides a convenient way to accomplish this.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t` | table |  | The Luau table whose elements are to be stored in the new [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |

## Functions

### clear

```lua
SharedTable.clear(st: SharedTable): ()
```

Atomically removes all of the elements from a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]].

If the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is frozen, the operation fails and an error will be raised.

```lua
local st = SharedTable.new({"a", "b", "c"})
assert(SharedTable.size(st) == 3)

SharedTable.clear(st)
assert(SharedTable.size(st) == 0)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] to clear. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### clone

```lua
SharedTable.clone(st: SharedTable, deep: boolean? = False): SharedTable
```

Creates a clone of a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] and returns the clone.

If the optional `deep` argument is not present, or if it is present and its value is `false`, then a shallow clone is created. A shallow clone copies only the top-level [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] object. If any value in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] itself is a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]], then both the original [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] and the clone [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] will refer to the same [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]].

The shallow clone operation is atomic, so the clone [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] will contain a consistent snapshot of the state in the original [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]], even if it is being modified concurrently from other scripts.

If the optional `deep` argument is present and its value is `true`, then a deep clone is created. A deep clone recursively copies a structure of [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects, such that there is no state shared between the original [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] and the clone.

The clone of each [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] within the graph of [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects is atomic, but the deep clone as a whole is not atomic. Thus, the clone of each [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] within the graph will contain a consistent snapshot of the state of the original [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] object from which it was cloned, but the states of different [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects may be inconsistent if the graph is being modified concurrently from other scripts.

The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] object(s) being cloned may be frozen (read-only) or not. Regardless, the newly created clones are _not_ frozen (and are thus modifiable). To create frozen clones, use the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable#cloneAndFreeze|SharedTable.cloneAndFreeze]] function.

To illustrate the difference between a shallow clone and a deep clone, consider the following samples. This first sample creates a shallow clone and the second creates a deep clone.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to clone. |
| `deep` | boolean? | `False` | Whether to create a deep clone (`true`) or a shallow clone (`false`). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  |

*Code samples for this member (`SharedTable-ShallowClone`, `SharedTable-DeepClone`) are published on the source page; their code is not part of the open-source repo.*

### cloneAndFreeze

```lua
SharedTable.cloneAndFreeze(st: SharedTable, deep: boolean? = False): SharedTable
```

Creates a frozen (read-only) clone of a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] and returns the clone. The behavior of this function is the same as the behavior of clone, except that the clone is frozen.

If a deep clone is requested, then all of the cloned [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] objects are frozen.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The SharedTable object to clone. |
| `deep` | boolean? | `False` | Whether to create a deep clone (`true`) or a shallow clone (`false`). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  |

### increment

```lua
SharedTable.increment(st: SharedTable, key: string | number, delta: number): number
```

Atomically increments the value of an element. An element with the specified key must exist in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]], and it must be of type `number`. The specified `delta` is added to the value, and the original value is returned.

The `SharedTable.update` function can also be used for this purpose; this `increment` function exists for convenience and performance (in general, `increment` is much faster than `update`, so it should be preferred where possible). The following two function calls have the same effect:

```lua
local st = SharedTable.new()
st["x"] = 1

local oldValue = SharedTable.increment(st, "x", 1)

SharedTable.update(st, "x", function(v)
    oldValue = v
    return v + 1
end)
```

If the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is frozen, the operation fails and an error will be raised.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to be updated. |
| `key` | string | number |  | The key of the element in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to be updated. |
| `delta` | number |  | The value to be added to the element in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]]. |

**Returns**

| Type | Description |
| --- | --- |
| number | The original value of the element, before `delta` was added to it. |

*Code samples for this member (`SharedTable-Increment`) are published on the source page; their code is not part of the open-source repo.*

### isFrozen

```lua
SharedTable.isFrozen(st: SharedTable): boolean
```

Returns `true` if the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is frozen (read-only).

```lua
local st1 = SharedTable.new({"a", "b", "c"})
assert(not SharedTable.isFrozen(st1))

local st2 = SharedTable.cloneAndFreeze(st1)
assert(SharedTable.isFrozen(st2))
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object whose frozen state is to be queried. |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### size

```lua
SharedTable.size(st: SharedTable): number
```

Returns the number of elements stored in the SharedTable. Note that if other scripts are concurrently modifying the SharedTable, the returned size may no longer be correct after it is returned, since other scripts may have added or removed elements from the SharedTable.

```lua
local st = SharedTable.new({"a", "b", "c"})
assert(SharedTable.size(st) == 3)

st[2] = nil
assert(SharedTable.size(st) == 2)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object whose size is to be queried. |

**Returns**

| Type | Description |
| --- | --- |
| number |  |

### update

```lua
SharedTable.update(st: SharedTable, key: string | number, f: function): ()
```

Atomically updates the value of an element.

When a [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is accessed concurrently from scripts running in different execution contexts, it is possible for their accesses to interleave unpredictably. Because of this, code like the following is generally incorrect, because the value may have changed between the read on the first line and the update on the second line:

```lua
local st = SharedTable.new({ x = "a" })
local oldValue = st["x"]
st["x"] = oldValue .. ",x"
print(st["x"]) --> a,x
```

The update function makes it possible to perform an atomic update to an element. It takes a function that it will call with the current value of the element. The function can then compute and return the new value. Note that the function may be called multiple times if the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is being concurrently modified from other scripts.

If the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable|SharedTable]] is frozen, the operation fails and an error will be raised.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `st` | [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to be updated. |
| `key` | string | number |  | The key of the element in the [[30 Official Roblox Docs/API Reference/Datatypes/SharedTable\|SharedTable]] object to be updated. |
| `f` | function |  | The function that will be called to compute the new value for the element. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`SharedTable-Update`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SharedTable](https://create.roblox.com/docs/reference/engine/datatypes/SharedTable) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
