---
title: "LineForce"
description: "Applies a force along the theoretical line connecting its two `Attachments`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LineForce"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies a force along the theoretical line connecting its two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `LineForce` constraint applies a force along the theoretical line connecting its two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. As the end points (attachments) move, the direction of force will change accordingly.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Force Location

By default, force is applied to either parent at its attachment location. If desired, force can be focused at each parent's center of mass by enabling [[30 Official Roblox Docs/API Reference/Classes/LineForce#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

#### Inverse Square Law

When [[30 Official Roblox Docs/API Reference/Classes/LineForce#InverseSquareLaw|InverseSquareLaw]] is `true`, the force magnitude is multiplied by the inverse square of the distance, meaning the force will increase exponentially as the two attachments get closer together, like magnets. When using this setting, it's recommended that you set a [[30 Official Roblox Docs/API Reference/Classes/LineForce#MaxForce|MaxForce]] threshold to prevent infinite force if the attachments align precisely.

#### Reactionary Force

By default, the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. However, force can be applied to both attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/LineForce#ReactionForceEnabled|ReactionForceEnabled]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LineForce#ApplyAtCenterOfMass\|ApplyAtCenterOfMass]] | boolean | Whether force is applied at the center of mass of the parent assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/LineForce#InverseSquareLaw\|InverseSquareLaw]] | boolean | When `true`, the force magnitude is multiplied by the inverse square of the distance. |
| [[30 Official Roblox Docs/API Reference/Classes/LineForce#Magnitude\|Magnitude]] | float | The magnitude of the force. |
| [[30 Official Roblox Docs/API Reference/Classes/LineForce#MaxForce\|MaxForce]] | float | Maximum absolute force that can be applied. |
| [[30 Official Roblox Docs/API Reference/Classes/LineForce#ReactionForceEnabled\|ReactionForceEnabled]] | boolean | Enables an equal and opposite reaction force on the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ApplyAtCenterOfMass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** LineForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

When `true`, force is applied at the center of mass of the parent assembly of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], and the line determining the direction of the force will start at the said center of mass. When `false`, force is applied at [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] and the line determining the direction will also start at [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]].

### InverseSquareLaw

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** LineForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

When `true`, the force magnitude is multiplied by the inverse square of the distance.

### Magnitude

**Type:** float

**Thread safety:** ReadSafe · **Category:** LineForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

The magnitude of the force.

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** LineForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

The maximum absolute force that can be applied. This property is enabled only when [[30 Official Roblox Docs/API Reference/Classes/LineForce#InverseSquareLaw|InverseSquareLaw]] is also enabled. This property is mainly used to address the issue that the force of the body mover becomes infinite the closer the two attachments are, causing explosions that can't be prevented by scripts. This property bounds the force's absolute value.

### ReactionForceEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** LineForce · **Loaded/Saved:** true/true · **Capabilities:** Physics

Enables a reaction force (equal an opposite) to be applied to the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]]. By default line force only applies a force on the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] and uses [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] as the target direction without any dynamic relationship.

---
*Source: [LineForce](https://create.roblox.com/docs/reference/engine/classes/LineForce) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
