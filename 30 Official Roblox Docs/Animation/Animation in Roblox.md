---
title: "Animation in Roblox"
description: "An overview of all animation tools in Roblox Studio."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of all animation tools in Roblox Studio.*

**Animation** is the process of applying motion to your characters, objects, and environments to create an engaging and dynamic game. While there are many ways to make objects move and interact, animation in Roblox typically refers to customizing an expressive movement of a specific character or group of parts.

Animation can apply to any Roblox part or group of parts. Different types of objects can utilize various animation features. The following are the general categories of animatable objects:

- **Simple objects**, such as a basic part, can only animate changes across the part's single position or rotation property.
- **Rigs**, or parts connected by joints like [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraints]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], can articulate positional and rotational movement between their joints, like elbows and wrists. Rigged models can take advantage of animation features like [[30 Official Roblox Docs/Animation/Animation in Roblox#Inverse kinematics|inverse kinematics]] to quickly and programmatically apply movement in response to environments and events.
- [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|Standard]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced]] R15 rigs can use animations from Roblox's character animation library and other movement features, regardless of if it's a player or non-player character model.

## Animation Editor

The [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] allows you to design and publish custom animations on rigs. You can move the joints that connect individual sections of a rig to create poses, and the editor smoothly animates the rig from pose-to-pose.

[Video: IK-Body-Part.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/inverse-kinematics/IK-Body-Part.mp4)

## Inverse kinematics

You can use [[30 Official Roblox Docs/Animation/Inverse Kinematics|inverse kinematics]] APIs to automatically create animations and poses based on environmental and external events. With inverse kinematics, you can procedurally generate various animation events, such as having a character's head track a bird flying in the sky, or making a character's arm automatically reach for a door knob when nearby.

## Animation events

An [[30 Official Roblox Docs/Animation/Animation events|animation event]] is a specific point in an animation that triggers an action. You can define animation event markers across the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] timeline span, then use [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] to detect those markers as the animation runs to perform specific actions, such as playing a sound effect whenever the user's foot touches the ground.

---
*Source: [Animation in Roblox](https://create.roblox.com/docs/animation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
