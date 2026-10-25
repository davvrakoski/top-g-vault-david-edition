---
title: "Universal"
description: "UniversalConstraint ensures two axes on two assemblies remain perpendicular, useful for applications such as vehicle power transmission to rear drive shafts, robotics, and more."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/universal"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*UniversalConstraint ensures two axes on two assemblies remain perpendicular, useful for applications such as vehicle power transmission to rear drive shafts, robotics, and more.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint|UniversalConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint|UniversalConstraint]] ensures two axes on two assemblies remain perpendicular. Example applications include vehicle power transmission to the rear drive shafts, robotics, and more.

[Video: Universal-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Universal-Demo.mp4)

## Orientations

Orientation of a universal's two attachments affects how it will move. To ensure it behaves correctly, the [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] of the attachments, visualized by the orange arrows, should be **perpendicular** to each other. Note that a green L-shaped indicator appears when the axes are properly oriented.

### Axes Perpendicular

*(image in the full Top G Vault)*

### Axes Misoriented

*(image in the full Top G Vault)*

## Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#MaxAngle|MaxAngle]] limit to restrict tilt within a cone, as well as [[30 Official Roblox Docs/API Reference/Classes/UniversalConstraint#Restitution|Restitution]] which defines the elasticity of the attachments when they reach the limit.

---
*Source: [Universal](https://create.roblox.com/docs/physics/constraints/universal) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
