---
title: "Debris"
description: "Allows scheduling the guaranteed destruction of an object without yielding."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Debris"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows scheduling the guaranteed destruction of an object without yielding.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The **Debris** service allows scheduling guaranteed destruction of an object without yielding.

#### Advantages

Besides creating a bit of a mess, objects that are no longer required can use up system memory and cause an experience to run slower over time. For this reason, it's always advised to call [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] on objects you no longer need. In some cases, however, an object may have a specific period of utility before it can be destroyed.

Consider a wall being smashed into individual bricks. If you want a brick to linger for 3 seconds before being destroyed, you can use the following code:

```lua
task.wait(3)
brick:Destroy()
```

However, waiting causes the thread to yield which may be undesired. To avoid yielding, a callback function can be scheduled to run on a new thread after 3 seconds:

```lua
task.delay(3, function()
	brick:Destroy()
end)
```

Or in one line:

```lua
task.delay(3, brick.Destroy, brick)
```

While this now avoids yielding, it has a potential drawback in that the scheduled callback will never run if the script is disabled or destroyed before the callback runs.

This is where [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]] has a specific advantage, as it does not yield the current thread and runs outside the context of the script, guaranteeing the instance is eventually destroyed even if the script is disabled or destroyed. The following code does not yield and guarantees the instance will be destroyed:

```lua
Debris:AddItem(brick, 3)
```

Note that [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]] has a hardcoded maximum of 1,000 objects, so if more than 1,000 items are added, the oldest debris will be destroyed instantly to make room for new debris.

*Code samples for this API (`Debris-AddItem`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Debris); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Debris#MaxItems\|MaxItems]] | int | **Deprecated.** The maximum number of items that can be assigned to the [[30 Official Roblox Docs/API Reference/Classes/Debris\|Debris]] service at one time. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Debris#AddItem\|AddItem()]] | () | Schedules a given [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for destruction within the specified lifetime. |
| [[30 Official Roblox Docs/API Reference/Classes/Debris#addItem\|addItem()]] | () | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### MaxItems

> [!warning] Deprecated
> This property is deprecated and should not be used in new work.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Deprecated`

The maximum number of items that can be assigned to the Debris service at one time.

If this number is exceeded, objects are automatically destroyed in order from oldest to newest until the amount is less than or equal to MaxItems.

This property is currently restricted and will error if set. The value is hardcoded to 1,000 items.

## Methods

### AddItem

```lua
Debris:AddItem(item: Instance, lifetime: double = 10): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Schedules a given [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for destruction within the specified lifetime. After the `lifetime` argument has elapsed, the object is destroyed in the same manner as [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]]. Note that the `lifetime` argument is optional and defaults to 10 seconds.

Note that [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]] has a hardcoded maximum of 1,000 objects, so if more than 1,000 items are added, the oldest debris will be destroyed instantly to make room for new debris. This means you should treat the `lifetime` parameter as a **maximum** lifetime, not an exact lifetime.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to add to [[30 Official Roblox Docs/API Reference/Classes/Debris\|Debris]]. |
| `lifetime` | double | `10` | Number of seconds before the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] should be destroyed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Debris-AddItem`) are published on the source page; their code is not part of the open-source repo.*

### addItem

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Debris:AddItem()` which
> should be used instead.

```lua
Debris:addItem(item: Instance, lifetime: double = 10): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |
| `lifetime` | double | `10` |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Debris](https://create.roblox.com/docs/reference/engine/classes/Debris) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
