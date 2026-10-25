---
title: "VelocityMotor"
description: "A `Motor`-like `JointInstance` that forms its connection using a `MotorFeature` and a `Hole`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VelocityMotor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]]-like [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] that forms its connection using a [[30 Official Roblox Docs/API Reference/Classes/MotorFeature|MotorFeature]] and a [[30 Official Roblox Docs/API Reference/Classes/Hole|Hole]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The VelocityMotor is a special type of joint that works similarly to a [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]], but it uses a [[30 Official Roblox Docs/API Reference/Classes/MotorFeature|MotorFeature]] and a [[30 Official Roblox Docs/API Reference/Classes/Hole|Hole]] to create the connection. In order for this object to work correctly:

- The VelocityMotor must be parented inside of a [[30 Official Roblox Docs/API Reference/Classes/MotorFeature|MotorFeature]]
- The [[30 Official Roblox Docs/API Reference/Classes/MotorFeature|MotorFeature]] needs to be parented inside of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]
- A [[30 Official Roblox Docs/API Reference/Classes/Hole|Hole]] needs to be parented inside of another [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]
- The VelocityMotor's [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor#Hole|VelocityMotor.Hole]] property should be assigned to the hole you parented inside of the other part.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor#CurrentAngle\|CurrentAngle]] | float | Displays the angle that the motor is at in radians. |
| [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor#DesiredAngle\|DesiredAngle]] | float | The desired angle to be reached. The motor will attempt to reach this angle. |
| [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor#Hole\|Hole]] | [[30 Official Roblox Docs/API Reference/Classes/Hole\|Hole]] | The [[30 Official Roblox Docs/API Reference/Classes/Hole\|Hole]] linked to this VelocityMotor. |
| [[30 Official Roblox Docs/API Reference/Classes/VelocityMotor#MaxVelocity\|MaxVelocity]] | float | The maximum amount of velocity able to be reached. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurrentAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

Displays the angle that the motor is at in radians.

### DesiredAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

The desired angle to be reached. The motor will attempt to reach this angle.

### Hole

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Hole|Hole]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

The [[30 Official Roblox Docs/API Reference/Classes/Hole|Hole]] linked to this VelocityMotor.

### MaxVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum amount of velocity able to be reached.

---
*Source: [VelocityMotor](https://create.roblox.com/docs/reference/engine/classes/VelocityMotor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
