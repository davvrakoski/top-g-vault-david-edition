---
title: "AnimationClip"
description: "Represents all types of animation data that the Roblox animation system can consume."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationClip"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents all types of animation data that the Roblox animation system can consume.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CurveAnimation|CurveAnimation]], [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The non-creatable [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] instance type represents abstract animation data that can be fed to the Roblox animation system. [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] and [[30 Official Roblox Docs/API Reference/Classes/CurveAnimation|CurveAnimation]] are two current instance types that inherit from [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]].

There are different ways to represent animation data. To simplify the use of Roblox's animation system, all such representations are their own instance types but inherit from the [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] instance. Animation clips published to Roblox via the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] can be loaded into the Roblox Engine using an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] instance.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Length\|Length]] | float | The length in seconds of this clip. Returns `0` until the animation has fully loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Loop\|Loop]] | boolean | Determines whether the animation stored in this [[30 Official Roblox Docs/API Reference/Classes/AnimationClip\|AnimationClip]] is intended to loop. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationClip#Priority\|Priority]] | [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority\|AnimationPriority]] | Determines which clip takes priority when multiple animations are playing simultaneously. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Length

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

The read-only length, in seconds, of this [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]], computed from the timing of the underlying animation data (its keyframes or curves).

Because a clip's animation data may still be downloading when the property is first accessed, `Length` returns `0` until the animation has fully loaded. Poll for a non-zero value if you need the duration right away.

[[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] instances load an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] when an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] is requested via its [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]], and [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]] reflects the underlying [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] value.

### Loop

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

Determines whether the animation stored in this [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] is intended to loop. When set to true, the animation will continuously repeat each time it finishes.

Note that [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] instances internally load an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] when an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] is requested via its [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]], and the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Looped|AnimationTrack.Looped]] property will default to the original [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] value. Note also that this value can be overwritten.

### Priority

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|AnimationPriority]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

Determines which clip takes priority when multiple animations are playing simultaneously. Multiple playing animations look to this property to figure out which [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] poses should be played over one another.

Note that [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] instances internally load an [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] when an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] is requested via its [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]], and the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Priority|AnimationTrack.Priority]] property will default to the original [[30 Official Roblox Docs/API Reference/Classes/AnimationClip|AnimationClip]] value. Note also that this value can be overwritten.

*Code samples for this member (`KeyframeSequence-Instantiation`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [AnimationClip](https://create.roblox.com/docs/reference/engine/classes/AnimationClip) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
