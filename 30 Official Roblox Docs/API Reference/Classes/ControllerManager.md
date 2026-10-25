---
title: "ControllerManager"
description: "Manages simulated motion control for its assigned `ControllerManager.RootPart` ."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ControllerManager"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Manages simulated motion control for its assigned [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] .*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] instance manages simulated motion control for its assigned [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]]. It can be used to build a physics-based character controller.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController\|ActiveController]] | [[30 Official Roblox Docs/API Reference/Classes/ControllerBase\|ControllerBase]] | The [[30 Official Roblox Docs/API Reference/Classes/ControllerBase\|ControllerBase]] that is set to be activated on the character. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|BaseMoveSpeed]] | float | The base linear movement speed used by all controllers. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|BaseTurnSpeed]] | float | The base angular turning speed used by all controllers. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ClimbSensor\|ClimbSensor]] | [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor\|ControllerSensor]] | A reference to the sensor data used while a [[30 Official Roblox Docs/API Reference/Classes/ClimbController\|ClimbController]] is active. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection\|FacingDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The unit vector describing the desired direction to face. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#GroundSensor\|GroundSensor]] | [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor\|ControllerSensor]] | A reference to the sensor data used while a [[30 Official Roblox Docs/API Reference/Classes/GroundController\|GroundController]] is active. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#MovingDirection\|MovingDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The vector describing the desired direction to move in. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|RootPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] where the controller's forces and torques are applied. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#UpDirection\|UpDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The unit vector describing the up direction for the character. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActiveController

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that is set to be activated on the character. It does not guarantee that the specified [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] is, in fact, active. If the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] cannot be activated for whatever reason, such as being outside of the character's [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] or no [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] being found to use as the floor for a [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]], it will remain set and the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] will attempt to activate it in the next frame. This property can be set to `nil` to disable the physics controller.

### BaseMoveSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The base linear movement speed used by all controllers. Controllers individually customize speed by setting the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor|ControllerBase.MoveSpeedFactor]] property.

### BaseTurnSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The base angular turning speed used by all controllers to align the character to face the desired direction.

### ClimbSensor

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

A reference to the sensor data used while a [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]] is active. A [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]] will use the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor.HitPart]], [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitFrame|ControllerPartSensor.HitFrame]], and [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitNormal|ControllerPartSensor.HitNormal]] for climb movement computations. Typically a [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]] set to [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Ladder]] is used here. Otherwise, you can override the sensor's outputs to direct what sensor data you want the [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]] to use.

### FacingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The unit vector describing the desired direction to face. Aligns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|LookVector]] of the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] to this. Any [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] assigned will be automatically unitized.

### GroundSensor

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

A reference to the sensor data used while a [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]] is active. A [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]] will use the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor.HitPart]], [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitFrame|ControllerPartSensor.HitFrame]], and [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitNormal|ControllerPartSensor.HitNormal]] for ground movement computations. Typically a [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]] set to [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]] is used here. Otherwise, you can override the sensor's outputs to direct what sensor data you want the [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]] to use.

### MovingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The vector describing the desired direction to move in, with a magnitude between 0 and 1. This is multiplied by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed|BaseMoveSpeed]] to determine a final target move velocity. The [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|RootPart]] will attempt to move in this direction based on the rules defined by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ActiveController]].

### RootPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] where the controller's forces and torques are applied. With a typical [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]-based character, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|Humanoid.RootPart]] is assigned as the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]].

### UpDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The unit vector describing the up direction for the character, which defaults to `(0, 1, 0)` (world up). Controllers under this [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] use it to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|RootPart]] upright and to orient direction-dependent forces. For example, a [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]] applies levitation and balancing forces along this direction, while an [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]] and [[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]] align the character to it. Any [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] assigned is automatically unitized; a zero, `NaN`, or infinite value is ignored.

---
*Source: [ControllerManager](https://create.roblox.com/docs/reference/engine/classes/ControllerManager) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
