---
title: "Rigid"
description: "RigidConstraint connects two attachments with zero offset."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/rigid"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*RigidConstraint connects two attachments with zero offset.*

A [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] connects two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] and ensures they stay in the same relative position/orientation to each other. This flexibility gives it additional functionality beyond [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], such as attaching accessories to [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] on a character rig.

> [!info]
> To attach two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] together, versus two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], see [[30 Official Roblox Docs/Physics/Constraints/Weld|WeldConstraint]].

When creating a [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] using Studio's [[30 Official Roblox Docs/Physics/Mechanical constraints#Create constraints|Constraint]] button, the tool behaves differently depending on whether you click on existing [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] after the tool is activated:

- Clicking on an existing [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] creates a new [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] upon it as the intended [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|RigidConstraint.Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|RigidConstraint.Attachment1]].
- Clicking on an existing [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] uses that instance as the intended [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|RigidConstraint.Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|RigidConstraint.Attachment1]].

Following the second valid click, a new [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] is created to connect the two new attachments. If either the first or second click is **not** made on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], the workflow is canceled and no constraint is created.

---
*Source: [Rigid](https://create.roblox.com/docs/physics/constraints/rigid) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
