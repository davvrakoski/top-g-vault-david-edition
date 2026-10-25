---
title: "PoseEasingDirection"
description: "Used exclusively by Pose.EasingDirection to specify direction of the EasingStyle curve."
api_type: enum
aliases: ["Enum.PoseEasingDirection"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PoseEasingDirection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used exclusively by Pose.EasingDirection to specify direction of the EasingStyle curve.*

## Description

When a Pose has an EasingStyle which is not symmetric, the EasingDirection determines if the curve is applied from previous keyframe to next, next keyframe to previous, or in both directions by using two copies of the curve back to back. For the symmetric Linear and Constant EasingStyles, this property has no effect. For legacy compatibility reasons, the use of In and Out are backwards from how these terms are used by most other animation tools and by TweenService.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `In` | 0 | The EasingStyle curve is reversed, with the easing becoming linear as it approaches the next keyframe. |
| `Out` | 1 | EasingStyle curves are applied in the forward direction, from the current keyframe to the next. |
| `InOut` | 2 | Two easing curves are applied back-to-back with the linear ends of the curves meeting in the middle. |

---
*Source: [PoseEasingDirection](https://create.roblox.com/docs/reference/engine/enums/PoseEasingDirection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
