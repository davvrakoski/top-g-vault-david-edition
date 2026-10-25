---
title: "PoseEasingStyle"
description: "Specifies the interpolation curve used when blending between keyframe `Poses` in a `KeyframeSequence`."
api_type: enum
aliases: ["Enum.PoseEasingStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PoseEasingStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the interpolation curve used when blending between keyframe [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] in a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]].*

## Description

Controls how a [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] transitions from one keyframe to the next in a [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]]. The value is set via the [[30 Official Roblox Docs/API Reference/Classes/PoseBase#EasingStyle|Pose.EasingStyle]] property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Linear]]. For asymmetric styles such as [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Elastic]], [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Bounce]], and [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.CubicV2]], the direction of the curve is further controlled by [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection|Enum.PoseEasingDirection]]. [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Cubic]] is a legacy alias with a known direction-reversal bug between the Animation Editor and runtime; use [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.CubicV2]] for all new work.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Linear` | 0 | Poses interpolate linearly between keyframes. |
| `Constant` | 1 | Poses do not interpolate but snap to the keyframe indicated by the [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection\|Enum.PoseEasingDirection]]. |
| `Elastic` | 2 | Pose interpolation overshoots like an elastic curve. |
| `Cubic` | 3 | **Deprecated.** Deprecated - Use [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|Enum.PoseEasingStyle.CubicV2]]. Pose interpolation is a cubic curve between keyframes based on the [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection\|Enum.PoseEasingDirection]]. |
| `Bounce` | 4 | Pose interpolation produces a bounce-like effect between keyframes. |
| `CubicV2` | 5 | Pose interpolation is a cubic curve between keyframes based on [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection\|Enum.PoseEasingDirection]]. |

---
*Source: [PoseEasingStyle](https://create.roblox.com/docs/reference/engine/enums/PoseEasingStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
