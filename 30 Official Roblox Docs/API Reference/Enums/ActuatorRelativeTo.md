---
title: "ActuatorRelativeTo"
description: "Determines the coordinate frame in which a mover constraint's directional properties are expressed."
api_type: enum
aliases: ["Enum.ActuatorRelativeTo"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ActuatorRelativeTo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the coordinate frame in which a mover constraint's directional properties are expressed.*

## Description

Determines the coordinate frame in which a mover constraint's directional properties — such as force, velocity, or torque vectors — are interpreted. Used by the [[30 Official Roblox Docs/API Reference/Classes/VectorForce#RelativeTo|VectorForce.RelativeTo]], [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#RelativeTo|LinearVelocity.RelativeTo]], [[30 Official Roblox Docs/API Reference/Classes/Torque#RelativeTo|Torque.RelativeTo]], and [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#RelativeTo|AngularVelocity.RelativeTo]] properties, as well as [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#ForceRelativeTo|AlignPosition.ForceRelativeTo]]. When set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment0]] or [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|Attachment1]], the direction rotates with the referenced attachment's orientation; when set to [[30 Official Roblox Docs/API Reference/Enums/ActuatorRelativeTo|World]], it remains fixed in world space.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Attachment0` | 0 | The directional property is interpreted in the local coordinate frame of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]], rotating with its parent part. |
| `Attachment1` | 1 | The directional property is interpreted in the local coordinate frame of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1\|Attachment1]], rotating with its parent part. |
| `World` | 2 | The directional property is interpreted in world-space coordinates, remaining constant regardless of part orientation. |

---
*Source: [ActuatorRelativeTo](https://create.roblox.com/docs/reference/engine/enums/ActuatorRelativeTo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
