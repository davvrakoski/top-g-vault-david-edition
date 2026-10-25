---
title: "Motor"
description: "Makes a movable `JointInstance` between two parts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Motor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Makes a movable [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] between two parts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]]
- **Memory category:** BaseParts

## Description

An object used to make movable [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] between two Parts.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Motor#CurrentAngle\|CurrentAngle]] | float | Displays the current rotation of the motor in radians. |
| [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle\|DesiredAngle]] | float | The desired angle to turn the motor to in radians. |
| [[30 Official Roblox Docs/API Reference/Classes/Motor#MaxVelocity\|MaxVelocity]] | float | The maximum velocity the motor can use to reach [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle\|Motor.DesiredAngle]] measured in radians per physics frame (1/60th of a second). |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Motor#SetDesiredAngle\|SetDesiredAngle()]] | () | Sets [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle\|Motor.DesiredAngle]] of the motor. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurrentAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

Displays the current rotation of the motor in radians.

### DesiredAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

The desired angle to turn the motor to in radians. The motor will attempt to reach this angle (provided [[30 Official Roblox Docs/API Reference/Classes/Motor#MaxVelocity|Motor.MaxVelocity]] is greater than 0.

### MaxVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum velocity the motor can use to reach [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle|Motor.DesiredAngle]] measured in radians per physics frame (1/60th of a second).

## Methods

### SetDesiredAngle

```lua
Motor:SetDesiredAngle(value: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Sets [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle|Motor.DesiredAngle]] of the motor.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | float |  | The target angle, in radians, to set as the motor's [[30 Official Roblox Docs/API Reference/Classes/Motor#DesiredAngle\|Motor.DesiredAngle]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Motor](https://create.roblox.com/docs/reference/engine/classes/Motor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
