---
title: "TorsionSpringConstraint"
description: "A rotational spring that opposes the angular motion between two axes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TorsionSpringConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A rotational spring that opposes the angular motion between two axes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **TorsionSpringConstraint** applies a torque based on a relative angle and a relative angular velocity. Specifically, torsion springs try to bring two axes from two parts together in a compliant way.

Correct orientation of a torsion spring's attachments is important. The constraint will attempt to bring the [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] of each attachment into alignment. When building mechanisms like swinging doors, ensure that the secondary axes are **perpendicular** to the intended axis of rotation.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Damping

The [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Damping|Damping]] value controls how fast the spring's oscillation dies down. A value of 0 allows the spring to oscillate endlessly, while higher values bring the spring to a rest more quickly.

#### Stiffness

[[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Stiffness|Stiffness]] sets the torsional strength of the spring. Higher values create a spring that responds with more force.

#### Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle|MaxAngle]] value to restrict the spring's range within a cone; it also exposes the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Restitution|Restitution]] value which defines the elasticity of the attachments when they reach their limit.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Coils\|Coils]] | float | The number of coils visualized for the constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#CurrentAngle\|CurrentAngle]] | float | The current angle, in degrees, of the limiting cone. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Damping\|Damping]] | float | Damping constant for the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint\|TorsionSpringConstraint]]. Multiplied to the velocity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] to reduce the spring force applied. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#LimitEnabled\|LimitEnabled]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Limits the relative angular motion of the secondary axes of attachments through a cone constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle\|MaxAngle]] | float | The maximum angle of the constraint's limiting cone. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxTorque\|MaxTorque]] | float | The maximum allowable torque provided by the torsion spring. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Radius\|Radius]] | float | The visualization radius of the spring. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Restitution\|Restitution]] | float | The restitution coefficient of the cone constraint. |
| [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Stiffness\|Stiffness]] | float | The torsional stiffness of the spring. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Coils

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property indicates the number of spring coils for visualization. Default value is 8.

### CurrentAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current angle, in degrees, of the torsion spring's limiting cone. The limiting cone is formed at the position of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] around its secondary axis with an angle equal to [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle|MaxAngle]].

### Damping

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

Damping constant for the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]]. Multiplied to the velocity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] to reduce the spring force applied.

### LimitEnabled

> [!warning] Deprecated
> This property is deprecated. Use
> `Class.TorsionSpringConstraint.LimitsEnabled|LimitsEnabled` instead.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics · **Tags:** `Hidden`, `Deprecated`

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property, when enabled, limits the relative angular motion of the secondary axes of attachments through a cone constraint. The default value is false.

### MaxAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the maximum angle (in degrees) of the torsion spring's limiting cone. The limiting cone is formed at the position of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] around its secondary axis with an angle equal to [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle|MaxAngle]]. Default value is 45 degrees.

### MaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the maximum torque supported by the torsion spring. Defaults to 1000.

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property indicates the visualization radius of the spring, in studs. Default value is 0.4.

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property defines how elastic [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] connected by a [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]] are when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle|MaxAngle]], when [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#LimitEnabled|LimitEnabled]] is true. The value defaults to 0 and can be any floating number within the range of 0 and 1.

### Stiffness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

In the absence of damping, this property is proportional to the opposing torque of the spring. For instance, higher stiffness results in a larger opposing torque, and smaller stiffness results in a smaller opposing torque. The larger the torque value, the faster the axes are pushed together when the relative angle is positive (or away from each other if the relative angle is negative). The value defaults to 100.

---
*Source: [TorsionSpringConstraint](https://create.roblox.com/docs/reference/engine/classes/TorsionSpringConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
