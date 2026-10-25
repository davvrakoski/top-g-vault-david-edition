---
title: "BallSocketConstraint"
description: "Forces its two attachments into the same position and allows them to freely rotate about all three axes, with optional limits to restrict both tilt and twist."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BallSocketConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Forces its two attachments into the same position and allows them to freely rotate about all three axes, with optional limits to restrict both tilt and twist.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A `BallSocketConstraint` constrains its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] so that they occupy the same position. By default it allows both attachments to freely rotate about all of their axes, but if [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] is `true`, the attachments can only rotate in a limited cone.

Note that if this constraint attaches one part (**A**) to another part (**B**) that is anchored or connected to an anchored part (**Z**), part **A** will not be locally simulated when interacting with a player.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Limits

You can set limits to restrict both **tilt** and **twist** of a ball socket, similar to how a human's head can tilt and turn within a limited axial range. Enabling the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle|UpperAngle]] value to restrict **tilt** within a cone; it also exposes the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled|TwistLimitsEnabled]] property which, when enabled, lets you restrict **twist** rotation through the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle|TwistLowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle|TwistUpperAngle]] limits.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Sets whether the `BallSocketConstraint` sets a limit on rotation based on [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle\|UpperAngle]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#MaxFrictionTorque\|MaxFrictionTorque]] | float | Sets the maximum frictional torque applied to keep its [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] aligned. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#Radius\|Radius]] | float | The visualized radius of the `BallSocketConstraint`. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#Restitution\|Restitution]] | float | How elastic [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] connected by a `BallSocketConstraint` will be when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle\|UpperAngle]] when [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled\|LimitsEnabled]] is `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled\|TwistLimitsEnabled]] | boolean | Sets whether the `BallSocketConstraint` sets a limit on twist rotation based on [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle\|TwistUpperAngle]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle\|TwistLowerAngle]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle\|TwistLowerAngle]] | float | Sets the lower twist rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled\|TwistLimitsEnabled]] is `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle\|TwistUpperAngle]] | float | Sets the upper twist rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled\|TwistLimitsEnabled]] is `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle\|UpperAngle]] | float | Sets the upper rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled\|LimitsEnabled]] is `true`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** BallSocket · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the `BallSocketConstraint` has a limit on rotation based on [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle|UpperAngle]]. When `true`, it enforces that its [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] isn't rotated more than a set angle from its [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].

### MaxFrictionTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Friction · **Loaded/Saved:** false/false · **Capabilities:** Physics

Sets the maximum frictional torque applied to keep its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] aligned.

`MaxFrictionTorque` specifies the stiffness of the `BallSocketConstraint` (how much it resists rotation around its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]).

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized radius of the `BallSocketConstraint`.

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

How elastic [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] connected by a `BallSocketConstraint` will be when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle|UpperAngle]] when [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] is `true`. Constrained between 0 and 1.

### TwistLimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the `BallSocketConstraint` sets a limit on twist rotation based on [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle|TwistUpperAngle]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle|TwistLowerAngle]]. The twist angle is defined as the angle between the **Y** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and the **Y** axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].

### TwistLowerAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** TwistLimits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets the lower twist rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled|TwistLimitsEnabled]] is `true`.

### TwistUpperAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** TwistLimits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets the upper twist rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled|TwistLimitsEnabled]] is `true`.

### UpperAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets the upper rotation limit of the `BallSocketConstraint`, as long as [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] is `true`.

---
*Source: [BallSocketConstraint](https://create.roblox.com/docs/reference/engine/classes/BallSocketConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
