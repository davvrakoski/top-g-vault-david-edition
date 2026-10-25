---
title: "PrismaticConstraint"
description: "Constraint which creates a rigid joint between two `Attachments`, allowing them to slide along one axis but not rotate."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Constraint which creates a rigid joint between two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], allowing them to slide along one axis but not rotate.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] → [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

A **PrismaticConstraint** creates a rigid joint between two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], allowing them to slide along one axis but not rotate. This constrains the attachments so that their **X** axes are collinear but pointing in opposite directions. It also constrains the attachments so that their **Y** axes are parallel.

This constraint inherits many properties from [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] including [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType|ActuatorType]], [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#LimitsEnabled|LimitsEnabled]], [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity|Velocity]], and more. Please refer to [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint|SlidingBallConstraint]] for details on configuring a [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint|PrismaticConstraint]].

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

---
*Source: [PrismaticConstraint](https://create.roblox.com/docs/reference/engine/classes/PrismaticConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
