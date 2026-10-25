---
title: "Rope"
description: "RopeConstraint prevents two attachments from separating further than a defined length, with optional behavior as an extending or contracting winch."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/rope"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*RopeConstraint prevents two attachments from separating further than a defined length, with optional behavior as an extending or contracting winch.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]] prevents two attachments from separating further than a defined [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length|Length]]. The attachments can move closer together than this length and both can freely rotate. [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Restitution|Restitution]] defines the elasticity of the attachments when they reach the separation limit specified by [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#Length|Length]].

This constraint can also be powered to behave as a [[30 Official Roblox Docs/Physics/Constraints/Rope#Winch|motorized winch]].

[Video: Rope-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Rope-Demo.mp4)

## Winch

If a rope's [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchEnabled|WinchEnabled]] property is enabled, it attempts to translate the attachments to a set separation specified by [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]], effectively the target length of the rope in studs. This translation is controlled by [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed|WinchSpeed]], [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchResponsiveness|WinchResponsiveness]], and [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchForce|WinchForce]].

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed|WinchSpeed]] must be a **positive** value, used to either contract or extend the rope length to [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchTarget|WinchTarget]]. Setting a negative speed will revert to 0, not reverse the winch servo direction.

---
*Source: [Rope](https://create.roblox.com/docs/physics/constraints/rope) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
