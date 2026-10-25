---
title: "SwimController"
description: "The `ControllerBase` that moves a `ControllerManager` character while it is swimming."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SwimController"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that moves a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] character while it is swimming.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]] is the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] that a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] activates to move a physics-based character while it is swimming. When it is the manager's [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ControllerManager.ActiveController]], it drives the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] toward the manager's target velocity (scaled by [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor|ControllerBase.MoveSpeedFactor]]), pitches the character to face the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#FacingDirection|ControllerManager.FacingDirection]], and rolls it to keep it oriented in the water. Pitch rotation is tuned with [[30 Official Roblox Docs/API Reference/Classes/SwimController#PitchMaxTorque|SwimController.PitchMaxTorque]] and [[30 Official Roblox Docs/API Reference/Classes/SwimController#PitchSpeedFactor|SwimController.PitchSpeedFactor]], and roll with [[30 Official Roblox Docs/API Reference/Classes/SwimController#RollMaxTorque|SwimController.RollMaxTorque]] and [[30 Official Roblox Docs/API Reference/Classes/SwimController#RollSpeedFactor|SwimController.RollSpeedFactor]], with the speed factors scaled by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed|ControllerManager.BaseTurnSpeed]]. A [[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]] only functions when parented to a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SwimController#PitchMaxTorque\|PitchMaxTorque]] | float | The maximum torque used to rotate to the desired pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/SwimController#PitchSpeedFactor\|PitchSpeedFactor]] | float | Multiplied by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]] to determine the maximum angular velocity for pitch. |
| [[30 Official Roblox Docs/API Reference/Classes/SwimController#RollMaxTorque\|RollMaxTorque]] | float | The maximum torque applied to rotate to the desired roll. |
| [[30 Official Roblox Docs/API Reference/Classes/SwimController#RollSpeedFactor\|RollSpeedFactor]] | float | Multiplied by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]] to determine the maximum angular velocity for roll. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PitchMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque used to rotate on the local **X** axis to the desired pitch orientation. Has no effect if [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase.RigidityEnabled]] is true.

### PitchSpeedFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Multiplied by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed|ControllerManager.BaseTurnSpeed]] to determine the maximum angular velocity rotating on the local **X** axis. Has no effect if [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase.RigidityEnabled]] is true.

### RollMaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The maximum torque applied to rotate on the local **Z** axis to the desired roll orientation. Has no effect if [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase.RigidityEnabled]] is true.

### RollSpeedFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Multiplied by [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed|ControllerManager.BaseTurnSpeed]] to determine the maximum angular velocity rotating on the local **Z** axis. Has no effect if [[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase.RigidityEnabled]] is true.

---
*Source: [SwimController](https://create.roblox.com/docs/reference/engine/classes/SwimController) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
