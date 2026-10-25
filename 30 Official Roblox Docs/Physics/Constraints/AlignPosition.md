---
title: "AlignPosition"
description: "The AlignPosition constraint applies force to move two attachments together, or to move one attachment to a goal position."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/align-position"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The AlignPosition constraint applies force to move two attachments together, or to move one attachment to a goal position.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

An [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] constraint applies force to move two attachments together, or to move one attachment to a goal position. As indicated by the name, it only affects the **position** of the attachments, not their orientation (to align attachments by **orientation**, see [[30 Official Roblox Docs/Physics/Constraints/AlignOrientation|AlignOrientation]]).

[Video: AlignPosition-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignPosition-Demo.mp4)

> [!warning]
> By default, the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], although this behavior can be controlled through the constraint's [[30 Official Roblox Docs/Physics/Constraints/AlignPosition#Reactionary force|reactionary force]].

## Force location

By default, force is applied to the parent of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] at that attachment's location, meaning that if the parent's center of mass is not aligned with the direction of the force, torque will be applied as well as force. Alternatively, force can be applied to the parents' center of mass by toggling on [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

## Force magnitude

You can configure the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]] constraint to apply the maximum force that constraints allow through the [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled|RigidityEnabled]] property. When `true`, the physics solver reacts as quickly as possible to complete the alignment. When `false`, the force is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxForce|MaxForce]], [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity|MaxVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness|Responsiveness]].

## Reactionary force

By default, the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If desired, force can be applied to **both** attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ReactionForceEnabled|ReactionForceEnabled]].

[Video: AlignPosition-ReactionForceEnabled.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignPosition-ReactionForceEnabled.mp4)

## Attachment mode

The [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Mode|Mode]] property specifies whether the constraint uses **one** or **two** attachments in calculating its goal. By default, this is [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|TwoAttachment]], meaning that the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Position|Position]] and attempts to move [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] to the position of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]]. If set to [[30 Official Roblox Docs/API Reference/Enums/PositionAlignmentMode|OneAttachment]], the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and attempts to move [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] to [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Position|Position]].

---
*Source: [AlignPosition](https://create.roblox.com/docs/physics/constraints/align-position) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
