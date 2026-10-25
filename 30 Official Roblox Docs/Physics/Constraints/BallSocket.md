---
title: "BallSocket"
description: "BallSocketConstraint forces its two attachments into the same position and allows them to freely rotate about all three axes, with optional limits to restrict both tilt and twist."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/ball-socket"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*BallSocketConstraint forces its two attachments into the same position and allows them to freely rotate about all three axes, with optional limits to restrict both tilt and twist.*

> [!info]
> For an overview on creating, visualizing, and simulating mechanical constraints, including [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]], see [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

A [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraint]] forces its two attachments into the same position and allows them to freely rotate about all three axes. However, you can enable limits to restrict both tilt and twist.

[Video: BallSocket-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/BallSocket-Demo.mp4)

## Limits

You can set limits to restrict both **tilt** and **twist** of a ball socket, similar to how a human's head can tilt and turn within a limited axial range. Enabling the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] property exposes the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle|UpperAngle]] value to restrict **tilt** within a cone; it also exposes the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled|TwistLimitsEnabled]] property which, when enabled, lets you restrict **twist** rotation through the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle|TwistLowerAngle]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle|TwistUpperAngle]] limits.

[Video: BallSocket-Limits-Tilt.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/BallSocket-Limits-Tilt.mp4)

*Constraint with [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] set to `true` and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#UpperAngle|UpperAngle]] set to `15`*

[Video: BallSocket-Limits-Twist.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/BallSocket-Limits-Twist.mp4)

*Constraint with [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLimitsEnabled|TwistLimitsEnabled]] set to `true`, [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistLowerAngle|TwistLowerAngle]] set to `-60`, and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#TwistUpperAngle|TwistUpperAngle]] set to `0`*

> [!info]
> Enabling [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] also exposes the [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#Restitution|Restitution]] value which defines the elasticity of the attachments at their tilt and/or twist limits.

> [!warning]
> When [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint#LimitsEnabled|LimitsEnabled]] is enabled, orientation of a ball socket's attachments affects how it rotates. To ensure rotation occurs around the desired axis, each attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]], visualized by the yellow arrow, should point in the same direction.

---
*Source: [BallSocket](https://create.roblox.com/docs/physics/constraints/ball-socket) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
