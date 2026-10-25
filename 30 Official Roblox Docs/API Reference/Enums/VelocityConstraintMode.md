---
title: "VelocityConstraintMode"
description: "The velocity constraint mode property controls how the linear velocity of the attachment(s) is constrained."
api_type: enum
aliases: ["Enum.VelocityConstraintMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VelocityConstraintMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The velocity constraint mode property controls how the linear velocity of the attachment(s) is constrained.*

## Description

The velocity constraint mode sets how the attachment velocity is constrained. The velocity can be constrained to a line, a plane or a vector. See each mode for more details.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Line` | 0 | The velocity component in the direction of the line is constrained to the specified value. The line direction is based on the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo\|RelativeTo]] property:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment0]] - The line direction is the primary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment1]] - The line direction is the primary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|World]] - The line direction must be specified. |
| `Plane` | 1 | The velocity components in the plane are constrained to the specified values. The plane tangents are based on the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo\|RelativeTo]] property:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment0]] - The plane tangents are the two axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment1]] - The plane tangents are the two axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|World]] - The two plane tangents must be specified |
| `Vector` | 2 | The velocity components must be equal to the vector components specified. The coordinate system of the vector is based on the [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo\|RelativeTo]] property:<br><br>- [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment0]] - The vector components are in the coordinate system defined by the axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|Attachment1]] - The vector components are in the coordinate system defined by the axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]]. - [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo\|World]] - The coordinate system is in the world and the vector components must be specified. |

---
*Source: [VelocityConstraintMode](https://create.roblox.com/docs/reference/engine/enums/VelocityConstraintMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
