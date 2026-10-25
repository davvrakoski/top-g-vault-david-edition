---
title: "TorsionSpring"
description: "TorsionSpringConstraint applies torque based on a relative angle and relative angular velocity, in an attempt to bring two axes from two parts together."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/torsion-spring"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*TorsionSpringConstraint applies torque based on a relative angle and relative angular velocity, in an attempt to bring two axes from two parts together.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint|TorsionSpringConstraint]] applies torque based on a relative angle and relative angular velocity. It attempts to bring two axes from two parts together and is useful for [[30 Official Roblox Docs/Physics/Constraints/Hinge|hinged]] swinging doors with a spring-back effect.

[Video: TorsionSpring-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/TorsionSpring-Demo.mp4)

> [!info]
> Correct orientation of a torsion spring's attachments is important. The constraint will attempt to bring the [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] of each attachment, visualized by the orange arrows, into alignment. When building mechanisms like swinging doors, ensure that the secondary axes are **perpendicular** to the intended axis of rotation.

## Damping

The [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Damping|Damping]] value controls how fast the spring's oscillation dies down. A value of 0 allows the spring to oscillate endlessly, while higher values bring the spring to a rest more quickly.

[Video: TorsionSpring-Damping-0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/TorsionSpring-Damping-0.mp4)

*Damping = **0***

[Video: TorsionSpring-Damping-50.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/TorsionSpring-Damping-50.mp4)

*Damping = **50***

## Stiffness

[[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Stiffness|Stiffness]] sets the torsional strength of the spring. Higher values create a spring that responds with more force.

## Limits

Enabling the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#MaxAngle|MaxAngle]] value to restrict the spring's range within a cone; it also exposes the [[30 Official Roblox Docs/API Reference/Classes/TorsionSpringConstraint#Restitution|Restitution]] value which defines the elasticity of the attachments when they reach their limit.

---
*Source: [TorsionSpring](https://create.roblox.com/docs/physics/constraints/torsion-spring) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
