---
title: "Rod"
description: "RodConstraint keeps two attachments separated by a defined length, with optional limits on rotational tilt."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/rod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*RodConstraint keeps two attachments separated by a defined length, with optional limits on rotational tilt.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/RodConstraint|RodConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/RodConstraint|RodConstraint]] keeps two attachments separated by its defined [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#Length|Length]]. By default, both attachments can rotate freely, although you can enable limits to restrict rotational tilt.

[Video: Rod-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Rod-Demo.mp4)

## Limits

You can limit rotation of the attachments within a cone, independently of each other, by enabling the [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitsEnabled|LimitsEnabled]] property and setting [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle0|LimitAngle0]] and [[30 Official Roblox Docs/API Reference/Classes/RodConstraint#LimitAngle1|LimitAngle1]] respectively.

---
*Source: [Rod](https://create.roblox.com/docs/physics/constraints/rod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
