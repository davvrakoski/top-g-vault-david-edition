---
title: "AirController"
description: "A physics character controller that governs movement while a character is airborne."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AirController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A physics character controller that governs movement while a character is airborne.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]] is a [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] uses to drive a character's physics-based movement while it is airborne, such as while jumping or falling. While it is the manager's [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ActiveController]], it keeps the character balanced upright, turns it toward the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection|ControllerManager.FacingDirection]], and moves it horizontally toward the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#MovingDirection|ControllerManager.MovingDirection]]. Uprighting is tuned with [[30 Official Roblox Docs/API Reference/Classes/AirController#BalanceMaxTorque|BalanceMaxTorque]] and [[30 Official Roblox Docs/API Reference/Classes/AirController#BalanceSpeed|BalanceSpeed]], turning with [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnMaxTorque|TurnMaxTorque]] and [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnSpeedFactor|TurnSpeedFactor]], and horizontal movement with [[30 Official Roblox Docs/API Reference/Classes/AirController#MoveMaxForce|MoveMaxForce]]. An [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]] only functions when parented to a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#BalanceMaxTorque\|BalanceMaxTorque]] | float | The maximum torque the character can use to remain balanced upright. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#BalanceSpeed\|BalanceSpeed]] | float | The maximum angular speed used to align the character upright. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#MaintainAngularMomentum\|MaintainAngularMomentum]] | boolean | Determines whether angular momentum is preserved when input has stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#MaintainLinearMomentum\|MaintainLinearMomentum]] | boolean | Determines whether linear momentum is preserved when input has stopped. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#MoveMaxForce\|MoveMaxForce]] | float | The maximum force that can be applied on the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] for moving in the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#MovingDirection\|ControllerManager.MovingDirection]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnMaxTorque\|TurnMaxTorque]] | float | The maximum torque that can be applied on the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] for turning towards the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection\|ControllerManager.FacingDirection]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnSpeedFactor\|TurnSpeedFactor]] | float | The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BalanceMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque the character can use to remain balanced upright. When misaligned, this amount of torque is applied to reach the [[30 Official Roblox Docs/API Reference/Classes/AirController#BalanceSpeed|BalanceSpeed]] and realign the character. A higher torque means more force is required to cause the character to tilt. A lower torque means it's easer for the character to flip in the air. This property is hidden and has no effect when [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#BalanceRigidityEnabled|ControllerBase.BalanceRigidityEnabled]] is true.

### BalanceSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum angular speed used to align the character upright. A lower value means it takes longer for the character to recover to the upright position when misaligned. A higher value results in a quicker recovery.

### MaintainAngularMomentum

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines whether angular momentum is preserved when input has stopped. If false, the character will apply [[30 Official Roblox Docs/API Reference/Classes/AirController|TurningMaxTorque]] to bring the angular velocity toward 0 when there is no input.

### MaintainLinearMomentum

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines whether linear momentum is preserved when input has stopped. If false, the character will apply [[30 Official Roblox Docs/API Reference/Classes/AirController#MoveMaxForce|MoveMaxForce]] to bring the linear velocity towards 0 when there is no input.

### MoveMaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum force that can be applied on the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] for moving in the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#MovingDirection|ControllerManager.MovingDirection]]. This affects how quickly different target linear velocities are reached and how quick the linear acceleration is if [[30 Official Roblox Docs/API Reference/Classes/AirController#MaintainLinearMomentum|MaintainLinearMomentum]] is off.

### TurnMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque that can be applied on the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] for turning towards the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection|ControllerManager.FacingDirection]]. This effects how quickly different target angular velocities are reached and how quick angular deceleration is if [[30 Official Roblox Docs/API Reference/Classes/AirController#MaintainAngularMomentum|MaintainAngularMomentum]] is off.

### TurnSpeedFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Turn · **Loaded/Saved:** true/true · **Capabilities:** Basic

The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed|ControllerManager.BaseTurnSpeed]] to determine the final target angular velocity while this controller is active. The angular velocity is applied when turning towards the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection|ControllerManager.FacingDirection]].

---
*Source: [AirController](https://create.roblox.com/docs/reference/engine/classes/AirController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
