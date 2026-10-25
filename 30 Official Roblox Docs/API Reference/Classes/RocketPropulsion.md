---
title: "RocketPropulsion"
description: "Applies a force so that an assembly follows and faces a target part."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RocketPropulsion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a force so that an assembly follows and faces a target part.*

> [!warning] Deprecated
> This object is deprecated and should not be used for new work. Use
> `Class.LineForce` instead, and see the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

The `RocketPropulsion` object applies force on an assembly so that it both **follows** and **faces** a target. It acts like a hybrid of [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] and [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]]. Unlike other [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMovers]], `RocketPropulsion` must be instructed to begin applying or stopping force via [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Fire|Fire()]] or [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Abort|Abort()]] respectively.

You can detect when the assembly reaches its target using the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ReachedTarget|ReachedTarget]] event which fires once the assembly is within the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetRadius|TargetRadius]] of the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]] part.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#CartoonFactor\|CartoonFactor]] | float | Determines the tendency of the assembly to face the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#MaxSpeed\|MaxSpeed]] | float | Determines the maximum speed at which the assembly will move toward the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#MaxThrust\|MaxThrust]] | float | Determines the maximum amount of thrust that will be exerted to move the assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#MaxTorque\|MaxTorque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the maximum amount of torque that may be exerted to rotate the assembly towards the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | Determines the object towards which the assembly should follow/face. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetOffset\|TargetOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the world offset from the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]] toward which the force/torque is exerted. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetRadius\|TargetRadius]] | float | Determines the maximum distance from the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]] at which the assembly must be in order for [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ReachedTarget\|ReachedTarget]] to be fired. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ThrustD\|ThrustD]] | float | Determines the dampening applied to the assembly in order to prevent it from overshooting the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ThrustP\|ThrustP]] | float | Determines how aggressive of a force is applied in reaching the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TurnD\|TurnD]] | float | Determines the amount of dampening that to use in reaching the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TurnP\|TurnP]] | float | Determines how aggressive of a torque is applied in facing the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Abort\|Abort()]] | () | Causes the assembly to stop moving toward its [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Fire\|Fire()]] | () | Causes the assembly to start moving toward its [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Fire\|fire()]] | () | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ReachedTarget\|ReachedTarget]] |  | Fires when the assembly comes within [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetRadius\|TargetRadius]] of the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target\|Target]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CartoonFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the tendency of the assembly to face the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]]. By default, this property is set to `0.7`. If set to `0`, the assembly will make no effort to face the target.

### MaxSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Thrust · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the upper limit of the velocity at which the assembly will move toward the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]].

### MaxThrust

**Type:** float

**Thread safety:** ReadSafe · **Category:** Thrust · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the upper limit of the thrust that may be exerted to move the assembly. Assemblies that have high mass will require more thrust in order to remain airborne and thus track the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]].

### MaxTorque

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the upper limit on the amount of torque that may be exerted in order to rotate the assembly towards the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]]. It functions similarly to [[30 Official Roblox Docs/API Reference/Classes/BodyGyro#MaxTorque|BodyGyro.MaxTorque]].

### Target

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the object towards which the `RocketPropulsion` will exert force/torque. If set to `nil`, the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetOffset|TargetOffset]] will be used instead.

### TargetOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the world offset from the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]]. It is especially useful when [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]] is set to `nil`, since this property then acts as the target position.

### TargetRadius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Goals · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the maximum distance from the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]] at which the assembly must be in order for [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#ReachedTarget|ReachedTarget]] to be fired. It does not affect the exerted forces in any way.

### ThrustD

**Type:** float

**Thread safety:** ReadSafe · **Category:** Thrust · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property is used to dampen the velocity of the assembly in order to prevent it from overshooting the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]] and causing a "rubber‑banding" effect. It behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#D|BodyPosition.D]].

### ThrustP

**Type:** float

**Thread safety:** ReadSafe · **Category:** Thrust · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying force in order to reach the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]] position. The higher this value, the more power will be used and the faster it will be used. This property works similarly to [[30 Official Roblox Docs/API Reference/Classes/BodyPosition#P|BodyPosition.P]].

### TurnD

**Type:** float

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property specifies how much dampening will be applied to the torque used to face the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]]. When the assembly approaches the goal orientation, it needs to decelerate, otherwise it will rotate past the goal and have to stop and re-accelerate back toward the goal. This often creates an undesirable "rubber‑banding" effect, avoided by applying dampening. The higher this value is set, the greater the dampening curve becomes, or the slower the part will approach the goal orientation.

### TurnP

**Type:** float

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines how much power is used while applying torque in order to face the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]]. The higher this value, the more power will be used and the faster it will be used.

## Methods

### Abort

```lua
RocketPropulsion:Abort(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Causes the assembly to stop moving toward its [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Fire

```lua
RocketPropulsion:Fire(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Causes the assembly to start moving toward its [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### fire

> [!warning] Deprecated
> This function is a deprecated variant of `Class.RocketPropulsion:Fire()`
> which should be used instead.

```lua
RocketPropulsion:fire(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### ReachedTarget

```lua
RocketPropulsion.ReachedTarget()
```

**Capabilities:** Physics

Fires when the assembly comes within [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#TargetRadius|TargetRadius]] of the [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion#Target|Target]].

---
*Source: [RocketPropulsion](https://create.roblox.com/docs/reference/engine/classes/RocketPropulsion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
