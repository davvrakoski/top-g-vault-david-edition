---
title: "PoseBase"
description: "Base class of all 'Pose Instance' objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PoseBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Base class of all 'Pose Instance' objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/NumberPose|NumberPose]], [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Base class of all 'Pose Instance' objects.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PoseBase#EasingDirection\|EasingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection\|PoseEasingDirection]] | The easing direction to use to reach the next Pose's value. |
| [[30 Official Roblox Docs/API Reference/Classes/PoseBase#EasingStyle\|EasingStyle]] | [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|PoseEasingStyle]] | The easing style to use to reach the next Pose's value. |
| [[30 Official Roblox Docs/API Reference/Classes/PoseBase#Weight\|Weight]] | float | **Deprecated.**  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### EasingDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PoseEasingDirection|PoseEasingDirection]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

The easing direction to use to reach the next Pose's value.

### EasingStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|PoseEasingStyle]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

The easing style to use to reach the next Pose's value.

### Weight

> [!warning] Deprecated
> This property is deprecated. Use the `Class.AnimationTrack:AdjustWeight()`
> function when blending multiple animations.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

---
*Source: [PoseBase](https://create.roblox.com/docs/reference/engine/classes/PoseBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
