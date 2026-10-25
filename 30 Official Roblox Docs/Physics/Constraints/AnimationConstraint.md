---
title: "AnimationConstraint"
description: "AnimationConstraint aligns two base parts with an animate-able kinematic or force-based joint."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/animation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*AnimationConstraint aligns two base parts with an animate-able kinematic or force-based joint.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

An [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] constrains its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] by an offset [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Transform|transform]]. It can be either [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Kinematic|kinematic]] for snap‑to behavior or it can follow the target trajectory using [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Force and torque|force and torque]]. limited by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce|MaxForce]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque|MaxTorque]].

[Video: AnimationConstraint-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AnimationConstraint-Demo.mp4)

## Transform

The constraint's [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]] is the internal [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that's manipulated when the constraint is being animated. How this transform is reached depends on the constraint's [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Kinematic|kinematic]] setting.

[Video: AnimationConstraint-Transform.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AnimationConstraint-Transform.mp4)

## Kinematic

When the constraint's [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] property is `true`, the connected parts snap to the [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Transform|transform]] instantly and precisely without participating in physics simulation. When `false`, the connected parts follow the trajectory using [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Force and torque|force and torque]].

[Video: AnimationConstraint-IsKinematic.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/AnimationConstraint-IsKinematic.mp4)

## Force and torque

If the constraint is **not** set to [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Kinematic|kinematic]], the connected parts follow a trajectory toward the [[30 Official Roblox Docs/Physics/Constraints/AnimationConstraint#Transform|transform]] using a maximum force/torque limited by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce|MaxForce]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque|MaxTorque]] respectively.

---
*Source: [AnimationConstraint](https://create.roblox.com/docs/physics/constraints/animation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
