---
title: "RodConstraint"
description: "Keeps two attachments separated by its defined `Length`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RodConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Keeps two attachments separated by its defined [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#Length|Length]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **RodConstraint** keeps two attachments separated by its defined [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#Length|Length]]. By default, both attachments can rotate freely, although you can enable limits to restrict rotational tilt.

Note that if this constraint attaches one part (**A**) to another part (**B**) that is anchored or connected to an anchored part (**Z**), part **A** will not be locally simulated when interacting with a player.

#### Limits

You can limit rotation of the attachments within a cone, independently of each other, by enabling the [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled|LimitsEnabled]] property and setting [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle0|LimitAngle0]] and [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle1|LimitAngle1]] respectively.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#CurrentDistance\|CurrentDistance]] | float | The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#Length\|Length]] | float | The distance apart at which the constraint attempts to keep its [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle0\|LimitAngle0]] | float | The maximum angle between the rod and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]] when [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle1\|LimitAngle1]] | float | The maximum angle between the rod and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]] when [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Determines whether [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle0\|LimitAngle0]] and [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle1\|LimitAngle1]] control the angles between the rod and the respective attachments. |
| [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#Thickness\|Thickness]] | float | The visualized thickness of the [[30 Official Roblox Docs/API Reference/Classes/RodConstraint\|RodConstraint]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CurrentDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### Length

**Type:** float

**Thread safety:** ReadSafe · **Category:** Rod · **Loaded/Saved:** true/true · **Capabilities:** Physics

The distance apart at which the constraint attempts to keep its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. Measured in studs.

### LimitAngle0

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the maximum angle between the rod and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] when [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled|LimitsEnabled]] is true.

### LimitAngle1

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines the maximum angle between the rod and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] when [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled|LimitsEnabled]] is true.

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Rod · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle0|LimitAngle0]] and [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle1|LimitAngle1]] properties control the angles between the rod and the respective attachments.

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized thickness of the [[30 Official Roblox Docs/API Reference/Classes/RodConstraint|RodConstraint]].

---
*Source: [RodConstraint](https://create.roblox.com/docs/reference/engine/classes/RodConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
