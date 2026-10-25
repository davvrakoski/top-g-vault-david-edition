---
title: "Spring"
description: "SpringConstraint applies a force on its attachments based on spring and damper behavior, with an optional minimum/maximum length."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/spring"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*SpringConstraint applies a force on its attachments based on spring and damper behavior, with an optional minimum/maximum length.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint|SpringConstraint]] applies a force on its attachments based on spring and damper behavior. You can customize a spring's [[30 Official Roblox Docs/Physics/Constraints/Spring#Damping|damping]] and [[30 Official Roblox Docs/Physics/Constraints/Spring#Stiffness|stiffness]], as well as set minimum and maximum [[30 Official Roblox Docs/Physics/Constraints/Spring#Limits|limits]] on the spring's length.

[Video: Spring-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Spring-Demo.mp4)

## Free length

[[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength|FreeLength]] defines the natural resting length of the spring. If the attachments are further apart than the free length, they are forced together; if the attachments are closer together than the free length, they are forced apart.

## Damping

The [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Damping|Damping]] value controls how fast the spring's oscillation dies down. A value of 0 allows the spring to oscillate endlessly, while higher values bring the spring to a rest more quickly.

## Stiffness

[[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#Stiffness|Stiffness]] sets the strength of the spring. Higher values create a spring that responds with more force when its attachments are closer together or further apart than [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#FreeLength|FreeLength]].

[Video: Spring-Stiffness-25.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Spring-Stiffness-25.mp4)

*Stiffness = **25***

[Video: Spring-Stiffness-500.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Spring-Stiffness-500.mp4)

*Stiffness = **500***

## Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MinLength|MinLength]] and [[30 Official Roblox Docs/API Reference/Classes/SpringConstraint#MaxLength|MaxLength]] values for setting the minimum and maximum length of the spring. If the spring's attachments reach these limits, they stop moving apart from one another without restitution.

---
*Source: [Spring](https://create.roblox.com/docs/physics/constraints/spring) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
