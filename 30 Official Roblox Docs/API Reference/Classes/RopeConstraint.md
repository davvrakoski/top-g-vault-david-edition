---
title: "RopeConstraint"
description: "Simulates rope dynamics, preventing two attachments from separating further than a defined length."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RopeConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Simulates rope dynamics, preventing two attachments from separating further than a defined length.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **RopeConstraint** prevents two attachments from separating further than a defined [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length|Length]]. The attachments can move closer together than this length and both can freely rotate. This constraint can also be powered to behave as a motorized winch.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Winch

If a rope's [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchEnabled|WinchEnabled]] property is enabled, it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]], effectively the target length of the rope in studs. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed|WinchSpeed]], [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchResponsiveness|WinchResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchForce|WinchForce]].

Note that [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed|WinchSpeed]] must be a **positive** value, used to either contract or extend the rope length to [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]]. Setting a negative speed will revert to 0, not reverse the winch servo direction.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#CurrentDistance\|CurrentDistance]] | float | The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length\|Length]] | float | The maximum distance apart the two [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] can be. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Restitution\|Restitution]] | float | Elasticity of the [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] connected by the constraint when reaching the maximum defined [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length\|Length]]. Constrained between 0 and 1. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Thickness\|Thickness]] | float | The visualized thickness of the [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint\|RopeConstraint]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchEnabled\|WinchEnabled]] | boolean | Enables the winch motor. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchForce\|WinchForce]] | float | The maximum force that the winch motor can apply. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchResponsiveness\|WinchResponsiveness]] | float | The sharpness of the winch motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget\|WinchTarget]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed\|WinchSpeed]] | float | A positive desired velocity at which the winch motor changes the rope length. |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget\|WinchTarget]] | float | The target length for the winch motor. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurrentDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### Length

**Type:** float

**Thread safety:** ReadSafe · **Category:** Rope · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum distance apart the two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] can be. Measured in studs.

### Restitution

**Type:** float

**Thread safety:** ReadSafe · **Category:** Rope · **Loaded/Saved:** true/true · **Capabilities:** Physics

Elasticity of the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] connected by the constraint when reaching the maximum defined [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length|Length]]. Constrained between 0 and 1.

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized thickness of the [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]].

### WinchEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Rope · **Loaded/Saved:** true/true · **Capabilities:** Physics

Enables the winch motor which has the effect or reeling in/out the length of the rope to [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]].

### WinchForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Winch · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum force that the winch motor can apply.

### WinchResponsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Winch · **Loaded/Saved:** true/true · **Capabilities:** Physics

The sharpness of the winch motor in reaching the [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]].

### WinchSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Winch · **Loaded/Saved:** true/true · **Capabilities:** Physics

A positive desired velocity at which the winch motor changes the rope length.

### WinchTarget

**Type:** float

**Thread safety:** ReadSafe · **Category:** Winch · **Loaded/Saved:** true/true · **Capabilities:** Physics

The target length for the winch motor.

---
*Source: [RopeConstraint](https://create.roblox.com/docs/reference/engine/classes/RopeConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
