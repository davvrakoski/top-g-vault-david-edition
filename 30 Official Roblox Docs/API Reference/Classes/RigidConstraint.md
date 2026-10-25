---
title: "RigidConstraint"
description: "Creates a rigid connection between two `Attachments` or `Bones`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RigidConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Creates a rigid connection between two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

**RigidConstraint** connects two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] and ensures they stay in the same relative position/orientation to each other. This flexibility gives it additional functionality beyond [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], such as attaching accessories to [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] on a character rig.

The fastest way to create this constraint is by selecting **Rigid Constraint** through Studio's **Create** menu in the toolbar's **Model** tab.

Note that this tool behaves differently depending on whether you click on existing [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]] after the tool is activated:

- Clicking on an existing [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] creates a new [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] upon it as the intended [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|RigidConstraint.Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|RigidConstraint.Attachment1]].
- Clicking on an existing [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] uses that instance as the intended [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|RigidConstraint.Attachment0]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|RigidConstraint.Attachment1]].

Following the second valid click, a new [[30 Official Roblox Docs/API Reference/Classes/RigidConstraint|RigidConstraint]] is created to connect the two new attachments. If either the first or second click is **not** made on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], the workflow is canceled and no constraint is created.

---
*Source: [RigidConstraint](https://create.roblox.com/docs/reference/engine/classes/RigidConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
