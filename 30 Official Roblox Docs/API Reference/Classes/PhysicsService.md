---
title: "PhysicsService"
description: "Service that provides methods for creating and managing collision groups, which control whether sets of `BaseParts` collide with each other."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PhysicsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service that provides methods for creating and managing collision groups, which control whether sets of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] collide with each other.*

> [!warning] Deprecated
> This service has been deprecated in favor of per-world collision group
> configuration through `Class.WorldRoot` which should be used for collision
> group management. Existing `Class.PhysicsService` calls will forward to
> `Class.Workspace`.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/PhysicsService|PhysicsService]] primarily contains methods for working with **collision groups** which define whether a set of parts may or may not collide with parts in other collision groups. You can register a collision group through [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RegisterCollisionGroup|RegisterCollisionGroup()]] and assign parts to it by setting those parts' [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroup|CollisionGroup]] property to the **name** of the collision group.

Creating, deleting, and modifying collision relationships between collision groups is limited to server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]].

See [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|Collision Filtering]] for usage details in Studio and within scripts.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#CollisionGroupContainsPart\|CollisionGroupContainsPart()]] | boolean | **Deprecated.** Returns whether the part is in the collision group. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#CollisionGroupsAreCollidable\|CollisionGroupsAreCollidable()]] | boolean | **Deprecated.** Returns whether the two groups will collide. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#CollisionGroupSetCollidable\|CollisionGroupSetCollidable()]] | () | **Deprecated.** Sets the collision status between two groups. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#CreateCollisionGroup\|CreateCollisionGroup()]] | int | **Deprecated.** Creates a new collision group with the given name, and returns the ID of the created group. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#GetCollisionGroupId\|GetCollisionGroupId()]] | int | **Deprecated.** Returns the ID of the collision group with the specified name. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#GetCollisionGroupName\|GetCollisionGroupName()]] | string | **Deprecated.** Returns the name of the group with the corresponding ID. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#GetCollisionGroups\|GetCollisionGroups()]] | Array | **Deprecated.** Returns a table with info on all of the place's collision groups. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#GetMaxCollisionGroups\|GetMaxCollisionGroups()]] | int | **Deprecated.** Returns the maximum number of collision groups. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#GetRegisteredCollisionGroups\|GetRegisteredCollisionGroups()]] | Array | **Deprecated.** Returns a table with info on all of the place's collision groups. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#IsCollisionGroupRegistered\|IsCollisionGroupRegistered()]] | boolean | **Deprecated.** Checks if a collision group is registered. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RegisterCollisionGroup\|RegisterCollisionGroup()]] | () | **Deprecated.** Registers a new collision group with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RemoveCollisionGroup\|RemoveCollisionGroup()]] | () | **Deprecated.** Removes the collision group with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RenameCollisionGroup\|RenameCollisionGroup()]] | () | **Deprecated.** Renames specified collision group. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#SetPartCollisionGroup\|SetPartCollisionGroup()]] | () | **Deprecated.** Sets the collision group of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#UnregisterCollisionGroup\|UnregisterCollisionGroup()]] | () | **Deprecated.** Unregisters the collision group for the given name. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CollisionGroupContainsPart

> [!warning] Deprecated
> This method has been deprecated. It's recommended that you query a part's
> collision group through its `Class.BasePart.CollisionGroup|CollisionGroup`
> property.

```lua
PhysicsService:CollisionGroupContainsPart(name: string, part: BasePart): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

Returns whether the specified part is in the specified collision group. This method will throw a runtime error in the following circumstances:

- The specified group does not exist.
- The specified part is not a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group to check. |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The `BasePart` to check for membership in the collision group. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the part belongs to the specified collision group, `false` otherwise. |

### CollisionGroupsAreCollidable

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:CollisionGroupsAreCollidable()` which should be used for
> all new work.

```lua
PhysicsService:CollisionGroupsAreCollidable(name1: string, name2: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns whether the two specified collision groups will collide. This method will also return true if either of the groups are unregistered, as the default collision mask collides with all groups.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name1` | string |  | The name of the first collision group. |
| `name2` | string |  | The name of the second collision group. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the two groups are set to collide, `false` otherwise. Also returns `true` if either group is unregistered. |

### CollisionGroupSetCollidable

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:CollisionGroupSetCollidable()` which should be used for
> all new work.

```lua
PhysicsService:CollisionGroupSetCollidable(name1: string, name2: string, collidable: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Sets the collision status between two groups. This method will throw an error if either of the groups is unregistered, so it's recommended that you confirm each group's registration through [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#IsCollisionGroupRegistered|PhysicsService:IsCollisionGroupRegistered()]] before making this call.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name1` | string |  | The name of the first collision group. |
| `name2` | string |  | The name of the second collision group. |
| `collidable` | boolean |  | Whether the two groups should collide with each other. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CreateCollisionGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:RegisterCollisionGroup()|RegisterCollisionGroup()` which
> should be used for all new work.

```lua
PhysicsService:CreateCollisionGroup(name: string): int
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

Creates a new collision group with the given name, and returns the ID of the created group.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the new collision group to create. |

**Returns**

| Type | Description |
| --- | --- |
| int | The integer ID assigned to the newly created collision group. |

### GetCollisionGroupId

> [!warning] Deprecated
> This method has been deprecated. It's recommended that you query collision
> groups by **name** through a part's
> `Class.BasePart.CollisionGroup|CollisionGroup` property.

```lua
PhysicsService:GetCollisionGroupId(name: string): int
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

This method returns the ID of the collision group with the specified name. It will throw an error if no group with the given name exists.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| int | The ID of the retrieved collision group, or `nil` if no such group exists. |

### GetCollisionGroupName

> [!warning] Deprecated
> This method has been deprecated. It's recommended that you query collision
> groups by **name** through a part's
> `Class.BasePart.CollisionGroup|CollisionGroup` property.

```lua
PhysicsService:GetCollisionGroupName(name: int): string
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

Returns the name of the collision group with the corresponding ID, or an empty string if that ID (`0`–`31`) has not been assigned to a group. The method throws an error if the ID is outside the valid range.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | int |  | The integer ID of the collision group to look up. |

**Returns**

| Type | Description |
| --- | --- |
| string | The name of the collision group with the given ID, or an empty string if the ID has not been assigned to a group. |

### GetCollisionGroups

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:GetRegisteredCollisionGroups()|GetRegisteredCollisionGroups()`
> which should be used for all new work.

```lua
PhysicsService:GetCollisionGroups(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

Returns a table with info on all of the place's collision groups. Each value in the returned table is itself a table containing three members:

| Member | Type | Description |
| --- | --- | --- |
| id | integer | The ID of the group. |
| mask | integer | The collision group's mask; only for internal use. |
| name | string | The name of the collision group. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of tables, each containing `name` (string), `id` (integer), and `mask` (integer) fields for a registered collision group. |

### GetMaxCollisionGroups

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:GetMaxCollisionGroups()` which should be used for all new
> work.

```lua
PhysicsService:GetMaxCollisionGroups(): int
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns the maximum number of collision groups the engine supports. This value is currently 32.

**Returns**

| Type | Description |
| --- | --- |
| int | The maximum number of collision groups supported, currently 32. |

### GetRegisteredCollisionGroups

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:GetRegisteredCollisionGroups()` which should be used for
> all new work.

```lua
PhysicsService:GetRegisteredCollisionGroups(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns a table with info on all of the place's collision groups. Each value in the returned table is itself a table and containing two members:

| Member | Type | Description |
| --- | --- | --- |
| mask | integer | The collision group's mask; only for internal use. |
| name | string | Name of the collision group. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of tables, each containing `name` (string) and `mask` (integer) fields for a registered collision group. |

### IsCollisionGroupRegistered

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:IsCollisionGroupRegistered()` which should be used for
> all new work.

```lua
PhysicsService:IsCollisionGroupRegistered(name: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Checks if a collision group is registered. It's recommended that you call this method before calling methods that throw errors for unregistered collision groups, such as [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#CollisionGroupSetCollidable|PhysicsService:CollisionGroupSetCollidable()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group to check. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if a collision group with the given name is registered, `false` otherwise. |

### RegisterCollisionGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:RegisterCollisionGroup()` which should be used for all
> new work.

```lua
PhysicsService:RegisterCollisionGroup(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Registers a new collision group with the given name. The name cannot be `"Default"`.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the workspace, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and call [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#UnregisterCollisionGroup|UnregisterCollisionGroup()]] and [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RenameCollisionGroup|RenameCollisionGroup()]] as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group to register. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`PhysicsService-RegisterCollisionGroup`) are published on the source page; their code is not part of the open-source repo.*

### RemoveCollisionGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:UnregisterCollisionGroup()|UnregisterCollisionGroup()`
> which should be used for all new work.

```lua
PhysicsService:RemoveCollisionGroup(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

Removes the collision group with the given name. If an invalid name is provided, this method will not do anything, although if the reserved name `"Default"` is provided, it will throw an error. If there are any parts in the collision group when it is removed, these parts will still maintain the same collision group ID. The physical behavior of parts in a removed group is undefined, so it is recommended to move any parts in a removed group to another group. This method will throw a runtime error in the following circumstances:

- The name `"Default"` is provided.
- The method is called from a client.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RenameCollisionGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:RenameCollisionGroup()` which should be used for all new
> work.

```lua
PhysicsService:RenameCollisionGroup(from: string, to: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Renames the specified registered collision group, but does **not** rename the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroup|CollisionGroup]] property of parts that utilize the group. The first argument of this method is the name of the group to rename, the second argument is the new name for the group. If the specified group does not exist, this method will not do anything. The naming conventions for the new name follow the same rules as if the group was being created with [[30 Official Roblox Docs/API Reference/Classes/PhysicsService#RegisterCollisionGroup|RegisterCollisionGroup()]].

This method will throw a runtime error in the following circumstances:

- Invalid or empty name provided for either argument.
- The method is called from a client.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the workspace, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and rename them as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `from` | string |  | The current name of the collision group to rename. |
| `to` | string |  | The new name for the collision group. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPartCollisionGroup

> [!warning] Deprecated
> This method has been deprecated. It's recommended that you set a part's
> collision group by **name** through its
> `Class.BasePart.CollisionGroup|CollisionGroup` property.

```lua
PhysicsService:SetPartCollisionGroup(part: BasePart, name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

This method sets the collision group of the specified part to the group with the specified name. It is equivalent to setting the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroupId|BasePart.CollisionGroupId]], although calling this method is the recommended approach.

This method will throw a runtime error in the following circumstances:

- The part parameter is not a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] instance.
- The specified group does not exist.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The part being set. |
| `name` | string |  | The name of collision group that the part's collision group is being set to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnregisterCollisionGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.WorldRoot:UnregisterCollisionGroup()` which should be used for all
> new work.

```lua
PhysicsService:UnregisterCollisionGroup(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Unregisters the collision group for the given name, with the following behaviors:

- If an invalid name is provided, the method will not do anything.
- If the reserved name `"Default"` is provided **or** if the method is called from a client, it will throw an error.
- If there are any parts in the collision group when it is removed, those parts will still maintain the same collision group name. The physical behavior of parts in a removed group is undefined, so it's recommended to move any parts in a removed group to another group, such as the `"Default"` group.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the workspace, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and call this method as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the collision group to unregister. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [PhysicsService](https://create.roblox.com/docs/reference/engine/classes/PhysicsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
