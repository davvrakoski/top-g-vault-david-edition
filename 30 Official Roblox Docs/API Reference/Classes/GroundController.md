---
title: "GroundController"
description: "The `ControllerBase` that moves a `ControllerManager` character while it is walking or standing on the ground."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GroundController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that moves a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] character while it is walking or standing on the ground.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]] is the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] activates when its character is moving along or standing on the ground. It keeps the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] hovering at [[30 Official Roblox Docs/API Reference/Classes/GroundController#GroundOffset|GroundController.GroundOffset]] above the detected floor, drives locomotion toward the manager's target velocity (ramped by [[30 Official Roblox Docs/API Reference/Classes/GroundController#AccelerationTime|GroundController.AccelerationTime]] and [[30 Official Roblox Docs/API Reference/Classes/GroundController#DecelerationTime|GroundController.DecelerationTime]]), keeps the root part upright, and turns it toward the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection|ControllerManager.FacingDirection]]. Ground friction comes from the floor material and this controller's [[30 Official Roblox Docs/API Reference/Classes/GroundController#Friction|GroundController.Friction]] and [[30 Official Roblox Docs/API Reference/Classes/GroundController#FrictionWeight|GroundController.FrictionWeight]]. Parent one to a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] to supply on-ground movement; the manager selects it through [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ControllerManager.ActiveController]] and activates one controller at a time.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#AccelerationTime\|AccelerationTime]] | float | Estimated time taken to reach the desired speed. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#BalanceMaxTorque\|BalanceMaxTorque]] | float | The maximum torque used to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] aligned upright. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#BalanceSpeed\|BalanceSpeed]] | float | The maximum angular speed used to align the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] upright. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#DecelerationTime\|DecelerationTime]] | float | Estimated time taken to reach a complete stop from full speed. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#Friction\|Friction]] | float | The coefficient of friction of the character on the ground. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#FrictionWeight\|FrictionWeight]] | float | Amount the character's friction is weighed against the ground friction. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#GroundOffset\|GroundOffset]] | float | The target distance above the ground to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] at. |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController#TurnSpeedFactor\|TurnSpeedFactor]] | float | The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccelerationTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

Estimated time (in seconds) taken to reach the desired speed after walking input begins. The character will accelerate linearly at the computed rate, impacted by friction, so a given time may be less accurate with lower friction.

### BalanceMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque used to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] aligned upright. When misaligned, this amount of torque is applied to reach the [[30 Official Roblox Docs/API Reference/Classes/GroundController#BalanceSpeed|BalanceSpeed]] and realign the root part. A higher torque means more force is required to cause the root part to tilt. A lower torque means it's easer for the root part to get knocked over when running into things. This property is hidden and has no effect when [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#BalanceRigidityEnabled|ControllerBase.BalanceRigidityEnabled]] is true.

### BalanceSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum angular speed used to align the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] upright. A lower value means it takes longer for the root part to recover to the upright position when misaligned. A higher value results in a quicker recovery.

### DecelerationTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

Estimated time (in seconds) taken to reach a complete stop from full speed after walking input ends. The character will decelerate linearly at the computed rate, impacted by friction, so a given time may be less accurate with lower friction.

### Friction

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

The coefficient of friction for the character at the point between it and the ground. Determines how much force is available for locomotion or to keep the character stationary on slopes.

### FrictionWeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

Amount the character's friction is weighed against the ground friction, equal in behavior to the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#FrictionWeight|FrictionWeight]] data type of [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|BasePart.CustomPhysicalProperties]]. Higher values mean more of a part's [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction|Friction]] will be used.

### GroundOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

The target distance above the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager.GroundSensor.HitPosition]] to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] at. If the root part is below this offset from the ground, a force is applied to raise up to this height. If it's above, nothing happens.

### TurnSpeedFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed|ControllerManager.BaseTurnSpeed]] to determine the final target angular velocity while this controller is active. The angular velocity is applied when turning towards the `Class.ControllerManager.FacingDirection.`

---
*Source: [GroundController](https://create.roblox.com/docs/reference/engine/classes/GroundController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
