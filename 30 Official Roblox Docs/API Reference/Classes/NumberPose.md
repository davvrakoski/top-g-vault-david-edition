---
title: "NumberPose"
description: "Holds the value applied to a specific FACS control."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NumberPose"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Holds the value applied to a specific FACS control.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PoseBase|PoseBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

A **NumberPose** holds the value applied to a specific FACS control. The control which is affected depends on its name.

**NumberPose** instances are the building blocks of facial animation and, with [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]], make up [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequences]].

#### NumberPoses and Facial Animation

Although a **NumberPose** is assigned to a single FACS control by name, that control can in turn affect multiple bones of the face rig. FACS controls act as an abstraction layer between facial muscle movements and how they are defined in the rig.

#### NumberPose Hierarchy

Contrary to [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]] Instances, **NumberPose** instances cannot be parented together. However, they all must be stored in a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] named **FaceControls** that is a child of the **Head** [[30 Official Roblox Docs/API Reference/Classes/Pose|Pose]].

#### NumberPose Value

The Roblox animation system applies **NumberPose** values to the corresponding FACS controls. Because those controls only respond to values between 0 and 1, the values calculated by the animation system are always clamped to that range.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NumberPose#Value\|Value]] | double | The value that will be applied to the FACS control corresponding to the [[30 Official Roblox Docs/API Reference/Classes/NumberPose\|NumberPose]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PoseBase|PoseBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Value

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

The value that will be applied to the FACS control corresponding with the [[30 Official Roblox Docs/API Reference/Classes/NumberPose|NumberPose]].

---
*Source: [NumberPose](https://create.roblox.com/docs/reference/engine/classes/NumberPose) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
