---
title: "SkateboardPlatform"
description: "A SkateboardPlatform can be used to create a skateboard. When characters get on a skateboard, they are stuck to it until they press the escape key. Until then, the character uses skateboard animations and travels faster than a walking character."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SkateboardPlatform"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A SkateboardPlatform can be used to create a skateboard. When characters get on a skateboard, they are stuck to it until they press the escape key. Until then, the character uses skateboard animations and travels faster than a walking character.*

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer supported
> by Roblox. Developers looking to create skateboards or similar vehicles are
> advised to program their own systems. Additionally, the `Class.VehicleSeat`
> object can be used to quickly create simple vehicles.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] → [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

A SkateboardPlatform can be used to create a skateboard. When characters get on a skateboard, they are stuck to it until they press the escape key. Until then, the character uses skateboard animations and travels faster than a walking character.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Controller\|Controller]] | [[30 Official Roblox Docs/API Reference/Classes/SkateboardController\|SkateboardController]] | **Deprecated.** The SkateboardPlatform's active SkateboardController. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#ControllingHumanoid\|ControllingHumanoid]] | [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] | **Deprecated.** The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] that is controlling the SkateboardPlatform. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Steer\|Steer]] | int | **Deprecated.** The direction of movement, tied to the keys A and D. Must be 1 (right), 0 (straight), or -1 (left). Will refresh back to 0 unless constantly set. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#StickyWheels\|StickyWheels]] | boolean | **Deprecated.** If true, wheels won't roll without user input. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Throttle\|Throttle]] | int | **Deprecated.** The direction of movement, tied to the keys W and S. Must be an integer 1 (forward), 0 (null), or -1 (reverse). Will refresh back to 0 unless constantly set. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#ApplySpecificImpulse\|ApplySpecificImpulse()]] | () | **Deprecated.** Adds ''impulseWorld'' to the SkateboardPlatform's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity\|BasePart.Velocity]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Equipped\|Equipped]] | `humanoid`, `skateboardController` | **Deprecated.** Fired when the skateboard is equipped. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Equipped\|equipped]] | `humanoid`, `skateboardController` | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#MoveStateChanged\|MoveStateChanged]] | `newState`, `oldState` | **Deprecated.** Fired when the SkateboardPlatform's [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#ControllingHumanoid\|SkateboardPlatform.ControllingHumanoid]] changes the force being used on the SkateboardPlatform. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Unequipped\|Unequipped]] | `humanoid` | **Deprecated.** Fired whenever the skateboard is unequipped. |
| [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#Unequipped\|unequipped]] | `humanoid` | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Controller

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/SkateboardController|SkateboardController]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The SkateboardPlatform's active SkateboardController.

### ControllingHumanoid

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] that is controlling the SkateboardPlatform.

### Steer

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic

The direction of movement, tied to the keys A and D. Must be 1 (right), 0 (straight), or -1 (left). Will refresh back to 0 unless constantly set.

### StickyWheels

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic

If true, wheels won't roll without user input.

### Throttle

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic

The direction of movement, tied to the keys W and S. Must be an integer 1 (forward), 0 (null), or -1 (reverse). Will refresh back to 0 unless constantly set.

## Methods

### ApplySpecificImpulse

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

```lua
SkateboardPlatform:ApplySpecificImpulse(impulseWorld: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Adds ''impulseWorld'' to the SkateboardPlatform's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity|BasePart.Velocity]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `impulseWorld` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### Equipped

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

```lua
SkateboardPlatform.Equipped(humanoid: Instance, skateboardController: Instance)
```

**Capabilities:** Basic

Fired when the skateboard is equipped.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] associated with the character equipping the skateboard. |
| `skateboardController` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/SkateboardController\|SkateboardController]]. |

### equipped

> [!warning] Deprecated
> This deprecated event is a variant of `Class.SkateboardPlatform.Equipped`
> which has also been deprecated. Neither event should be used in new work.

```lua
SkateboardPlatform.equipped(humanoid: Instance, skateboardController: Instance)
```

**Capabilities:** Basic · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |
| `skateboardController` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

### MoveStateChanged

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

```lua
SkateboardPlatform.MoveStateChanged(newState: MoveState, oldState: MoveState)
```

**Capabilities:** Basic

Fired when the SkateboardPlatform's [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform#ControllingHumanoid|SkateboardPlatform.ControllingHumanoid]] changes the force being used on the SkateboardPlatform.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newState` | [[30 Official Roblox Docs/API Reference/Enums/MoveState\|MoveState]] |  | The new [[30 Official Roblox Docs/API Reference/Enums/MoveState\|Enum.MoveState]]. |
| `oldState` | [[30 Official Roblox Docs/API Reference/Enums/MoveState\|MoveState]] |  | The old [[30 Official Roblox Docs/API Reference/Enums/MoveState\|Enum.MoveState]]. |

### Unequipped

> [!warning] Deprecated
> The SkateboardPlatform object has been deprecated and is no longer
> supported by Roblox. Developers looking to create skateboards or similar
> vehicles are advised to program their own systems. Additionally, the
> `Class.VehicleSeat` object can be used to quickly create simple vehicles.

```lua
SkateboardPlatform.Unequipped(humanoid: Instance)
```

**Capabilities:** Basic

Fired whenever the skateboard is unequipped.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] associated with the character that unequipped the skateboard. |

### unequipped

> [!warning] Deprecated
> This deprecated event is a variant of
> `Class.SkateboardPlatform.Unequipped` which has also been deprecated.
> Neither event should be used in new work.

```lua
SkateboardPlatform.unequipped(humanoid: Instance)
```

**Capabilities:** Basic · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

---
*Source: [SkateboardPlatform](https://create.roblox.com/docs/reference/engine/classes/SkateboardPlatform) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
