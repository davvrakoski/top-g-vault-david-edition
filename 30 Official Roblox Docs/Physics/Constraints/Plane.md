---
title: "Plane"
description: "PlaneConstraint moves two attachments into a position/orientation along a plane, and both attachments remain free to translate and rotate unless otherwise constrained."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/plane"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*PlaneConstraint moves two attachments into a position/orientation along a plane, and both attachments remain free to translate and rotate unless otherwise constrained.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/PlaneConstraint|PlaneConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/PlaneConstraint|PlaneConstraint]] moves its [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] into a position/orientation along a plane whose normal vector is the primary axis of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Both parent assemblies remain free to translate and rotate unless otherwise constrained.

[Video: Plane-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Plane-Demo.mp4)

Compare the following examples for how the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] defines the plane, while the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] has no bearing.

### Orientation = (0, 0, 90)

*(image in the full Top G Vault)*

### Orientation = (-45, 0, 90)

*(image in the full Top G Vault)*

---
*Source: [Plane](https://create.roblox.com/docs/physics/constraints/plane) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
