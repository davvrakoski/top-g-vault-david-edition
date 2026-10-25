---
title: "ControllerBase"
description: "Abstract base class for the controllers that a `ControllerManager` uses to move its character."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ControllerBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract base class for the controllers that a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] uses to move its character.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]], [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]], [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]], [[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/ControllerBase|ControllerBase]] is the abstract base class for the controllers that a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] uses to move its assigned character: [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]], [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]], [[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]], and [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]]. Each controller is parented to a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] and supplies the movement and balance behavior for one locomotion state, and the manager activates one controller at a time. This class isn't created directly; instead create one of its derived controllers. It defines the balance and movement properties shared by all of them.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#Active\|Active]] | boolean | Whether this controller is currently the active controller of its [[30 Official Roblox Docs/API Reference/Classes/ControllerManager\|ControllerManager]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#BalanceRigidityEnabled\|BalanceRigidityEnabled]] | boolean | Whether the controller holds its balance orientation rigidly instead of with a spring response. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|MoveSpeedFactor]] | float | The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|ControllerManager.BaseMoveSpeed]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Indicates whether this controller is the one currently driving its parent [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]]. The manager activates the controller referenced by its [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ActiveController|ControllerManager.ActiveController]] property and sets that controller's `Active` to `true`; when the controller is no longer the active one, it is deactivated and `Active` returns to `false`. This property is read-only and defaults to `false`.

### BalanceRigidityEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Balance · **Loaded/Saved:** true/true

Controls how the controller keeps its character oriented while active. When `false` (the default), the balance constraint is compliant and corrects orientation with a spring-damper response tuned by the controller's balance properties, such as its balance torque and balance speed. When `true`, the constraint instead holds the target orientation rigidly, and those balance-tuning properties no longer apply. Defaults to `false`.

### MoveSpeedFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Movement · **Loaded/Saved:** true/true

The value multiplied by the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed|ControllerManager.BaseMoveSpeed]] to determine the final desired linear velocity while this controller is active.

---
*Source: [ControllerBase](https://create.roblox.com/docs/reference/engine/classes/ControllerBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
