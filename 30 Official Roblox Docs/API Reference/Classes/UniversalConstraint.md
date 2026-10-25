---
title: "UniversalConstraint"
description: "Ensures two axes on two bodies remain perpendicular."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UniversalConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Ensures two axes on two bodies remain perpendicular.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **UniversalConstraint** ensures two axes on two bodies remain perpendicular. Contextually, this constraint is more restrictive than a [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] but less restrictive than a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] by one degree of freedom.

Example applications of this constraint include transmitting power between the transmission and drive shafts of cars, robotics, and more.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#MaxAngle|MaxAngle]] limit to restrict tilt within a cone, as well as [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#Restitution|Restitution]] which defines the elasticity of the attachments when they reach the limit.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Determines whether the angular motion of attachments' primary axes is limited. |
| [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#MaxAngle\|MaxAngle]] | float | The max angle, in degrees, of the constraint's limiting cone. |
| [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#Radius\|Radius]] | float | The constraint's visualization radius. |
| [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#Restitution\|Restitution]] | float | The restitution coefficient of the cone constraint. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Universal · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property, when enabled, limits the relative angular motion of the primary axes of attachments through a cone constraint. The default value is false.

### MaxAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the max angle, in degrees, of the constraint's limiting cone, formed from [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] and its primary axis. The default value is 45 degrees.

In order for this property to take affect, the constraint's [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#LimitsEnabled|LimitsEnabled]] property must be set to true.

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property indicates the constraint's visualization radius, in studs. Default value is 0.2.

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the restitution of the two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] connected by the [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint|UniversalConstraint]] when they reach the end of the range specified by [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#MaxAngle|MaxAngle]]. The value defaults to 0 and can be any floating number in the range of 0 to 1. Only applies when [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#LimitsEnabled|LimitsEnabled]] is set to true.

---
*Source: [UniversalConstraint](https://create.roblox.com/docs/reference/engine/classes/UniversalConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
