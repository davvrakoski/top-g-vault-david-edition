---
title: "AlignOrientation"
description: "The AlignOrientation constraint applies torque to align two attachments, or to align one attachment with a goal orientation."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/align-orientation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The AlignOrientation constraint applies torque to align two attachments, or to align one attachment with a goal orientation.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

The [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] constraint applies torque to align two attachments, or to align one attachment with a goal orientation. As indicated by the name, it only affects the **orientation** of the attachments, not their position (to align attachments **positionally**, see [[30 Official Roblox Docs/Physics/Constraints/AlignPosition|AlignPosition]]).

[Video: AlignOrientation-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignOrientation-Demo.mp4)

> [!warning]
> By default, the constraint only applies torque to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], although this behavior can be controlled through the constraint's [[30 Official Roblox Docs/Physics/Constraints/AlignOrientation#Reactionary torque|reactionary torque]].

## Affected axes

The axes affected by torque are controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType|AlignType]] property. When set to [[30 Official Roblox Docs/API Reference/Enums/AlignType|AllAxes]] (default), the constraint will apply torque about all 3 axes to achieve alignment. When set to [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisParallel]], [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisPerpendicular]], or [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisLookAt]], torque will only occur when the **primary** axes become misaligned.

[Video: AlignOrientation-AlignType.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignOrientation-AlignType.mp4)

## Torque magnitude

You can configure the [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] constraint to apply the maximum torque that constraints allow through the [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled|RigidityEnabled]] property. When `true`, the physics solver reacts as quickly as possible to complete the alignment. When `false`, the torque is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque|MaxTorque]], [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity|MaxAngularVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness|Responsiveness]].

[Video: AlignOrientation-RigidityEnabled.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AlignOrientation-RigidityEnabled.mp4)

## Reactionary torque

By default, the constraint only applies torque to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If desired, torque can be applied to **both** attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#ReactionTorqueEnabled|ReactionTorqueEnabled]].

## Attachment mode

The [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] property specifies whether the constraint uses **one** or **two** attachments in calculating its goal. By default, this is [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|TwoAttachment]], meaning that the constraint attempts to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] with the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]], disregarding [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis|PrimaryAxis]], and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis|SecondaryAxis]].

If set to [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]], the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and attempts to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] with the orientation of [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#CFrame|CFrame]], or match the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] with the constraint's [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis|PrimaryAxis]] and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis|SecondaryAxis]] properties respectively.

---
*Source: [AlignOrientation](https://create.roblox.com/docs/physics/constraints/align-orientation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
