---
title: "LineForce"
description: "The LineForce constraint applies force along the theoretical line connecting its two attachments."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/line-force"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The LineForce constraint applies force along the theoretical line connecting its two attachments.*

> [!info]
> For an overview on creating, visualizing, and simulating mover constraints, including [[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]], see [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]]. Also see [[30 Official Roblox Docs/Physics/Roblox units|Roblox units]] to understand how Roblox units compare to metric units.

The [[30 Official Roblox Docs/API Reference/Classes/LineForce|LineForce]] constraint applies force along the theoretical line connecting its two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. As the end points (attachments) move, the direction of force will change accordingly.

[Video: LineForce-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-Demo.mp4)

## Force location

By default, force is applied to either parent at its attachment location. If desired, force can be focused at each parent's center of mass by toggling on [[30 Official Roblox Docs/API Reference/Classes/LineForce#ApplyAtCenterOfMass|ApplyAtCenterOfMass]].

[Video: LineForce-ApplyAtCenterOfMass-False.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-ApplyAtCenterOfMass-False.mp4)

*ApplyAtCenterOfMass = **false***

[Video: LineForce-ApplyAtCenterOfMass-True.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-ApplyAtCenterOfMass-True.mp4)

*ApplyAtCenterOfMass = **true***

## Inverse square law

When [[30 Official Roblox Docs/API Reference/Classes/LineForce#InverseSquareLaw|InverseSquareLaw]] is true, the force magnitude is multiplied by the inverse square of the distance, meaning the force will increase exponentially as the two attachments get closer together, like magnets. When using this setting, it's recommended that you set a [[30 Official Roblox Docs/API Reference/Classes/LineForce#MaxForce|MaxForce]] threshold to prevent infinite force if the attachments align precisely.

[Video: LineForce-InverseSquareLaw-False.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-InverseSquareLaw-False.mp4)

*InverseSquareLaw = **false***

[Video: LineForce-InverseSquareLaw-True.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-InverseSquareLaw-True.mp4)

*InverseSquareLaw = **true***

## Reactionary force

By default, the constraint only applies force to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]], while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. However, force can be applied to both attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/LineForce#ReactionForceEnabled|ReactionForceEnabled]].

[Video: LineForce-ReactionForceEnabled-False.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-ReactionForceEnabled-False.mp4)

*ReactionForceEnabled = **false***

[Video: LineForce-ReactionForceEnabled-True.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/LineForce-ReactionForceEnabled-True.mp4)

*ReactionForceEnabled = **true***

---
*Source: [LineForce](https://create.roblox.com/docs/physics/constraints/line-force) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
