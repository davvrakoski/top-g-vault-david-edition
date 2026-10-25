---
title: "SpringConstraint"
description: "Simulates spring and damper behavior between two attachments."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SpringConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Simulates spring and damper behavior between two attachments.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **SpringConstraint** applies a force to its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] based on spring and damper behavior. This constraint, along with a [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint|CylindricalConstraint]], is ideal for building vehicle suspension.

Note that if this constraint attaches one part (**A**) to another part (**B**) that is anchored or connected to an anchored part (**Z**), part **A** will not be locally simulated when interacting with a player.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Free Length

[[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength|FreeLength]] defines the natural resting length of the spring. If the attachments are further apart than the free length, they are forced together; if the attachments are closer together than the free length, they are forced apart.

#### Damping

The [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Damping|Damping]] value controls how fast the spring's oscillation dies down. A value of 0 allows the spring to oscillate endlessly, while higher values bring the spring to a rest more quickly.

#### Stiffness

[[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Stiffness|Stiffness]] sets the strength of the spring. Higher values create a spring that responds with more force when its attachments are closer together or further apart than [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength|FreeLength]].

#### Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MinLength|MinLength]] and [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MaxLength|MaxLength]] values for setting the minimum and maximum length of the spring. If the spring's attachments reach these limits, they stop moving apart from one another without restitution.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Coils\|Coils]] | float | The number of coils visualized on the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint\|SpringConstraint]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#CurrentLength\|CurrentLength]] | float | The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Damping\|Damping]] | float | Damping constant for the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint\|SpringConstraint]]. Multiplied to the velocity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] to reduce the spring force applied. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength\|FreeLength]] | float | Natural resting length of the spring. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled\|LimitsEnabled]] | boolean | Sets whether the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint\|SpringConstraint]] enforces a minimum and maximum length. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MaxForce\|MaxForce]] | float | The maximum force the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint\|SpringConstraint]] can apply on its [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MaxLength\|MaxLength]] | float | The maximum separation the SpringConstraint will allow if [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MinLength\|MinLength]] | float | The minimum separation the SpringConstraint will allow if [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled\|LimitsEnabled]] is true. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Radius\|Radius]] | float | The visualized radius of the spring's coils. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Stiffness\|Stiffness]] | float | The strength of the spring. The higher this value the more force will be applied when the attachments are separated a different length than the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength\|FreeLength]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Thickness\|Thickness]] | float | The visualized thickness of the spring's coils. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Coils

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The number of coils visualized on the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]]. This can only be set between 0 and 8.

### CurrentLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Derived · **Loaded/Saved:** false/true · **Capabilities:** Physics · **Tags:** `ReadOnly`, `NotReplicated`

The current distance between the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### Damping

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

Damping constant for the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]]. Multiplied to the velocity of the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] to reduce the spring force applied.

### FreeLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

Natural resting length of the spring.

### LimitsEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

Sets whether the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] enforces a minimum and maximum length. If the constraint's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] reach these limits, they will simply stop moving apart from one another without restitution. If you need restitution or elasticity at the ends of the range of motion, you can combine a [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] with another constraint that allows restitution at the end of its range, such as a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]] or [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]].

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum force the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] can apply on its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. Some spring systems can give rise to forces that grow fast leading to instability. In such cases it is recommended to set MaxForce to a reasonable value.

### MaxLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum separation the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled|LimitsEnabled]] is true.

### MinLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics

The minimum separation the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] will allow if [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled|LimitsEnabled]] is true.

### Radius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized radius of the spring's coils.

### Stiffness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Spring · **Loaded/Saved:** true/true · **Capabilities:** Physics

The strength of the spring. The higher this value the more force will be applied when the attachments are separated a different length than the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength|FreeLength]].

### Thickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Physics

The visualized thickness of the spring's coils.

---
*Source: [SpringConstraint](https://create.roblox.com/docs/reference/engine/classes/SpringConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
