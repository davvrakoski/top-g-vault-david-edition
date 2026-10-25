---
title: "BodyPosition"
description: "Applies a force to maintain a constant position."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyPosition"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a force to maintain a constant position.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.AlignPosition` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `BodyPosition` object applies a force on an assembly such that it will maintain a constant position in the world. The [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|Position]] property, not to be confused with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]], controls the target world position. This is the translational counterpart to a [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]].

If you need further control on a force applied to an object, consider using a [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] or [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]] instead.

The strength of the force applied by this object is controlled by several factors, namely the distance to the goal position: the force is stronger when farther away from the goal. This is amplified by [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#P|P]] (power). The present velocity will also dampen the force applied by this object, and this is amplified by [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#D|D]] (dampening). The resulting force is then capped by [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#MaxForce|MaxForce]]. Note the force applied on the assembly to achieve the goal position may vary on a per-axis basis.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#D\|D]] | float | Determines the amount of dampening to use in reaching the goal [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position\|Position]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#MaxForce\|MaxForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the limit on how much force that may be applied to each axis. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#maxForce\|maxForce]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#P\|P]] | float | Determines how aggressive of a force is applied in reaching the goal position. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the goal position towards which force will be applied. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position\|position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#GetLastForce\|GetLastForce()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the last force in the object. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#lastForce\|lastForce()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Returns the last force in the object. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#ReachedTarget\|ReachedTarget]] |  | Fired when the Parent of the BodyPosition reaches the desired [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position\|BodyPosition.Position]] (within .1 studs). Once this event fires it will not fire again until [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position\|BodyPosition.Position]] is updated. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### D

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much dampening will be applied to the force used toward reaching the goal [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|Position]]. When the assembly approaches the goal position it needs to decelerate, otherwise it will move past the goal and have to stop and re-accelerate back toward the goal. This is often creates an undesirable "rubber‑banding" effect, avoided by applying dampening. The higher this value is set, the greater the dampening curve becomes, or the slower the assembly will approach the goal position.

### MaxForce

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the limit on the amount of force that may be applied on each axis in reaching the goal [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|Position]]. If an assembly isn't moving, consider increasing this value and also check that it is not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] or attached to any anchored assemblies.

### maxForce

> [!warning] Deprecated
> This property is a deprecated variant of `Class.BodyPosition.MaxForce`
> which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

### P

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying force in order to reach the goal [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|Position]]. The higher this value, the more power will be used and the faster it will be used. The force the [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] exerts increases as the difference between the assembly's current position and the goal position increases. This property is multiplied to this force to either amplify or diminish it.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the goal position towards which the [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] will apply force.

### position

> [!warning] Deprecated
> This is a deprecated variant of `Class.BodyPosition.Position` which should
> be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`, `Deprecated`

## Methods

### GetLastForce

```lua
BodyPosition:GetLastForce(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics

This function returns the last force in the object.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

### lastForce

> [!warning] Deprecated
> This property has been superseded by `Class.BodyPosition:GetLastForce()`
> which should be used in new work instead,

```lua
BodyPosition:lastForce(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

The lastForce function returns the last force in the object.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  |

## Events

### ReachedTarget

```lua
BodyPosition.ReachedTarget()
```

**Capabilities:** Physics

Fired when the Parent of the BodyPosition reaches the desired [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|BodyPosition.Position]] (within .1 studs). Once this event fires it will not fire again until [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#Position|BodyPosition.Position]] is updated.

---
*Source: [BodyPosition](https://create.roblox.com/docs/reference/engine/classes/BodyPosition) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
