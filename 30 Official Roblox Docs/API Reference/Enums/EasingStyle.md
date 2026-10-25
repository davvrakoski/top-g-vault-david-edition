---
title: "EasingStyle"
description: "Enum used with `TweenInfo.new` to control the motion of a `Tween`."
api_type: enum
aliases: ["Enum.EasingStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/EasingStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Enum used with [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo.new]] to control the motion of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]].*

## Description

These enum values are passed to [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo.new()]] to control the motion of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]]. The following graphs reflect easing styles for [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection.In]]. For graphs reflecting [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection.Out]] and [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection.InOut]], see [[30 Official Roblox Docs/UI/UI animation-tweens#Style|UI Animations]].

*(image in the full Top G Vault)*

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Linear` | 0 | Moves at a constant speed. |
| `Sine` | 1 | Speed is determined by a sine wave for a gentle easing motion. |
| `Back` | 2 | Slightly overshoots the target, then backs into place. |
| `Quad` | 3 | Similar to `Sine` but with a slightly sharper curve based on quadratic interpolation. |
| `Quart` | 4 | Similar to `Cubic` but with an even sharper curve based on quartic interpolation. |
| `Quint` | 5 | Similar to `Quart` but with an even sharper curve based on quintic interpolation. |
| `Bounce` | 6 | Bounces backwards multiple times after reaching the target, before eventually settling. |
| `Elastic` | 7 | Moves as if attached to a rubber band, overshooting the target several times. |
| `Exponential` | 8 | The sharpest curve based on exponential interpolation. |
| `Circular` | 9 | Follows a circular arc, such that acceleration is more sudden and deceleration more gradual versus `Quint` or `Exponential`. |
| `Cubic` | 10 | Similar to `Quad` but with a slightly sharper curve based on cubic interpolation. |

---
*Source: [EasingStyle](https://create.roblox.com/docs/reference/engine/enums/EasingStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
