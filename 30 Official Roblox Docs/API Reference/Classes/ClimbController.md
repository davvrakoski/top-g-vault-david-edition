---
title: "ClimbController"
description: "A physics character controller that moves its `ControllerManager.RootPart` along a climbable surface, such as a ladder."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ClimbController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A physics character controller that moves its [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] along a climbable surface, such as a ladder.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]] is a [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that produces climbing movement for a physics-based character. When it is assigned as the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ControllerManager.ActiveController]] of a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]], the manager applies constraints each simulation step that move the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] across the climbed surface while keeping it upright and aligned to that surface. Movement follows the surface reported by the manager's climb sensor ([[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ClimbSensor|ControllerManager.ClimbSensor]]); if the manager has no climb sensor detecting a surface, the controller has no effect. The direction and target speed come from the requested move velocity scaled by [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor|ControllerBase.MoveSpeedFactor]], while the [[30 Official Roblox Docs/API Reference/Classes/ClimbController#MoveMaxForce|ClimbController.MoveMaxForce]], [[30 Official Roblox Docs/API Reference/Classes/ClimbController#BalanceSpeed|ClimbController.BalanceSpeed]], and [[30 Official Roblox Docs/API Reference/Classes/ClimbController#BalanceMaxTorque|ClimbController.BalanceMaxTorque]] properties tune how forcefully and how quickly the root part moves and re-aligns.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ClimbController#AccelerationTime\|AccelerationTime]] | float | Currently unused; reserved for future climb acceleration ramp timing. |
| [[30 Official Roblox Docs/API Reference/Classes/ClimbController#BalanceMaxTorque\|BalanceMaxTorque]] | float | The maximum torque used to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] aligned upright and aligned to the climbed surface. |
| [[30 Official Roblox Docs/API Reference/Classes/ClimbController#BalanceSpeed\|BalanceSpeed]] | float | The maximum angular speed used to align the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] upright and with the climbed surface. |
| [[30 Official Roblox Docs/API Reference/Classes/ClimbController#MoveMaxForce\|MoveMaxForce]] | float | The maximum force used by the climbing "motor" to move the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]] or keep it stationary. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccelerationTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property currently has **no runtime effect**. `ClimbController` derives target speed from the requested move velocity and [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor|ControllerBase.MoveSpeedFactor]] and does not read `AccelerationTime`.

### BalanceMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque used to keep the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] aligned upright and aligned to the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager.ClimbSensor.HitNormal]]. When misaligned, this amount of torque is applied to reach the [[30 Official Roblox Docs/API Reference/Classes/ClimbController#BalanceSpeed|BalanceSpeed]] and realign the root part. A higher torque means more force is required to cause the root part to tilt. This property is hidden and has no effect when [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#BalanceRigidityEnabled|ControllerBase.BalanceRigidityEnabled]] is true.

### BalanceSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum angular speed used to align the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] upright and aligned to the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager.ClimbSensor.HitNormal]]. A lower value means it takes longer for the root part to recover to the align position when misaligned. A higher value results in a quicker recovery.

### MoveMaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum force used by the climbing "motor" to move the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] or keep it stationary.

---
*Source: [ClimbController](https://create.roblox.com/docs/reference/engine/classes/ClimbController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
