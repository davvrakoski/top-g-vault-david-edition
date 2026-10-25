---
title: "KeyframeMarker"
description: "An instance meant to represent an event that will eventually be fired when a `Keyframe` is hit."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/KeyframeMarker"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An instance meant to represent an event that will eventually be fired when a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] is hit.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

A KeyframeMarker is an instance meant to represent an event that will eventually be fired when a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] is hit.

## Using a KeyframeMarker

KeyframeMarkers should always be parented to a Keyframe via setting the parent directly or using the [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddMarker|Keyframe:AddMarker()]] function of Keyframe. KeyframeMarkers can also be removed directly or using the [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemoveMarker|Keyframe:RemoveMarker()]] function, and polled to check which markers are attached to a specific Keyframe using [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetMarkers|Keyframe:GetMarkers()]].

Whenever a Keyframe is detected as an animation is running, there will be an event fired for each KeyframeMarker that is parented to the Keyframe. These events are identifiable by the name of the KeyframeMarker. You can retrieve and listen to these events using the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack.GetKeyframeMarkerReached]] function. Optionally, you may set the [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker#Value|KeyframeMarker.Value]] property of the KeyframeMarker in order to pass along a value with the event being fired.

It inherits the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Keyframe.Name]] property from [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and behaves identically. Names are used for identification and do not need to be unique. When multiple `KeyframeMarker` instances with the same name are attached to a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]], events such as the one returned by [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] will fire for every marker.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]], holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] applied to joints in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] at a given point of time in an animation
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]], controls the playback of an animation on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]]
- [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]], holds a reference to animation data required to play custom animations on characters or other models using the Roblox animation system

*Code samples for this API (`get-keyframe-markers-attached-to-a-keyframe`, `listening-to-keyframemarkers`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/KeyframeMarker); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker#Value\|Value]] | string | A value that is specified for a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

A value that is specified for a [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarker]]. Whenever the signal created from [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal()]] gets fired, this value will be passed into the connected function.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]], holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] applied to joints in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] at a given point of time in an animation
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]], controls the playback of an animation on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]]

*Code samples for this member (`get-keyframe-markers-attached-to-a-keyframe`, `add-marker-remove-marker`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [KeyframeMarker](https://create.roblox.com/docs/reference/engine/classes/KeyframeMarker) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
