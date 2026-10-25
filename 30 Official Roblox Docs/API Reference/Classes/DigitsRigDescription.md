---
title: "DigitsRigDescription"
description: "Maps the 15 phalanx joints of one hand (5 fingers, 3 joints each) and exposes forward- and inverse-kinematics helpers for controlling finger poses at runtime."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DigitsRigDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Maps the 15 phalanx joints of one hand (5 fingers, 3 joints each) and exposes forward- and inverse-kinematics helpers for controlling finger poses at runtime.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

Enables interoperability of animations across hand rigs and drives the hand finger solver. Each `DigitsRigDescription` maps the 15 phalanx joints of one hand (5 fingers with 3 joints each) to engine instances, stores their T-pose adjustments, and exposes forward- and inverse-kinematics helpers for controlling finger poses at runtime.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index1\|Index1]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the proximal (first) phalanx of the index finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index1TposeAdjustment\|Index1TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Index1` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index2\|Index2]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the medial (second) phalanx of the index finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index2TposeAdjustment\|Index2TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Index2` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index3\|Index3]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the distal (third) phalanx of the index finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Index3TposeAdjustment\|Index3TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Index3` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#IndexRange\|IndexRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Motion range vector for the index finger used by the finger solver. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#IndexSize\|IndexSize]] | float | Size of the index finger used by the finger solver to preserve contacts. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle1\|Middle1]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the proximal (first) phalanx of the middle finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle1TposeAdjustment\|Middle1TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to Middle1 to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle2\|Middle2]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the medial (second) phalanx of the middle finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle2TposeAdjustment\|Middle2TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Middle2` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle3\|Middle3]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the distal (third) phalanx of the middle finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Middle3TposeAdjustment\|Middle3TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Middle3` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#MiddleRange\|MiddleRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Motion range vector for the middle finger used by the finger solver. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#MiddleSize\|MiddleSize]] | float | Scale factor for the middle finger used by the scalable-property system. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky1\|Pinky1]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the proximal (first) phalanx of the pinky finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky1TposeAdjustment\|Pinky1TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Pinky1` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky2\|Pinky2]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the medial (second) phalanx of the pinky finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky2TposeAdjustment\|Pinky2TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to Pinky2 to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky3\|Pinky3]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the distal (third) phalanx of the pinky finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Pinky3TposeAdjustment\|Pinky3TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Pinky3` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#PinkyRange\|PinkyRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Motion range vector for the pinky finger used by the finger solver. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#PinkySize\|PinkySize]] | float | Scale factor for the pinky finger used by the scalable-property system. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring1\|Ring1]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the proximal (first) phalanx of the ring finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring1TposeAdjustment\|Ring1TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Ring1` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring2\|Ring2]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the medial (second) phalanx of the ring finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring2TposeAdjustment\|Ring2TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Ring2` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring3\|Ring3]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the distal (third) phalanx of the ring finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Ring3TposeAdjustment\|Ring3TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Ring3` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#RingRange\|RingRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Motion range vector for the ring finger used by the finger solver. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#RingSize\|RingSize]] | float | Scale factor for the ring finger used by the scalable-property system. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Side\|Side]] | [[30 Official Roblox Docs/API Reference/Enums/DigitsRigDescriptionSide\|DigitsRigDescriptionSide]] | Which hand this description belongs to: `None`, `Left`, or `Right`. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb1\|Thumb1]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the proximal (first) phalanx of the thumb. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb1TposeAdjustment\|Thumb1TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Thumb1` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb2\|Thumb2]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the medial (second) phalanx of the thumb. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb2TposeAdjustment\|Thumb2TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Thumb2` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb3\|Thumb3]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The instance mapped to the distal (third) phalanx of the thumb. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#Thumb3TposeAdjustment\|Thumb3TposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | CFrame applied to `Thumb3` to normalize the joint into its canonical T-pose orientation before retargeting or solving. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#ThumbRange\|ThumbRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Motion range vector for the thumb used by the finger solver. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#ThumbSize\|ThumbSize]] | float | Scale factor for the thumb used by the scalable-property system. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#GetFingerControl\|GetFingerControl()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the current forward-kinematics control vector for the specified finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#GetFingerTip\|GetFingerTip()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the world-space position of the fingertip for the specified finger. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#SetFingerControl\|SetFingerControl()]] | () | Drives the three-joint chain of the specified finger using forward kinematics. |
| [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription#SetFingerTip\|SetFingerTip()]] | () | Moves the fingertip of the specified finger toward a world-space target using inverse kinematics. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Index1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] instance mapped to the proximal (first) phalanx of the index finger.

### Index1TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Index1` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Index2

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the medial (second) phalanx of the index finger.

### Index2TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Index2` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Index3

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the distal (third) phalanx of the index finger.

### Index3TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Index3` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### IndexRange

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

A `Vector3` describing the motion range of the index finger, used by the finger solver.

### IndexSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Size of the index finger, used by the finger solver to preserve contacts.

### Middle1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the proximal (first) phalanx of the middle finger.

### Middle1TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Middle1` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Middle2

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the medial (second) phalanx of the middle finger.

### Middle2TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Middle2` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Middle3

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the distal (third) phalanx of the middle finger.

### Middle3TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Middle3` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### MiddleRange

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

A `Vector3` describing the motion range of the middle finger, used by the finger solver and scalable-property system.

### MiddleSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Scale factor for the middle finger, used when the rig is scaled through the scalable-property system.

### Pinky1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the proximal (first) phalanx of the pinky finger.

### Pinky1TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Pinky1` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Pinky2

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the medial (second) phalanx of the pinky finger.

### Pinky2TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Pinky2` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Pinky3

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the distal (third) phalanx of the pinky finger.

### Pinky3TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Pinky3` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### PinkyRange

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

A `Vector3` describing the motion range of the pinky finger, used by the finger solver and scalable-property system.

### PinkySize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Scale factor for the pinky finger, used when the rig is scaled through the scalable-property system.

### Ring1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the proximal (first) phalanx of the ring finger.

### Ring1TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Ring1` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Ring2

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the medial (second) phalanx of the ring finger.

### Ring2TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Ring2` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Ring3

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the distal (third) phalanx of the ring finger.

### Ring3TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Ring3` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### RingRange

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

A `Vector3` describing the motion range of the ring finger, used by the finger solver and scalable-property system.

### RingSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Scale factor for the ring finger, used when the rig is scaled through the scalable-property system.

### Side

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DigitsRigDescriptionSide|DigitsRigDescriptionSide]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

Which hand this description belongs to: `None`, `Left`, or `Right`. Used when mapping `HandRigLabel` joints to the corresponding `HumanoidRigLabel` entries on the parent `HumanoidRigDescription`.

### Thumb1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the proximal (first) phalanx of the thumb.

### Thumb1TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Thumb1` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Thumb2

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the medial (second) phalanx of the thumb.

### Thumb2TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Thumb2` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### Thumb3

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The `Instance` mapped to the distal (third) phalanx of the thumb.

### Thumb3TposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

`CoordinateFrame` applied to `Thumb3` to normalize the joint into its canonical T-pose orientation before retargeting or solving.

### ThumbRange

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

A `Vector3` describing the motion range of the thumb, used by the finger solver and scalable-property system.

### ThumbSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Scale factor for the thumb, used when the rig is scaled through the scalable-property system.

## Methods

### GetFingerControl

```lua
DigitsRigDescription:GetFingerControl(fingerIndex: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the current control `Vector3` for the finger at the given 1-based index (1 = Thumb … 5 = Pinky). The components are:

- **X** — extension in `[0, 1]`: `0` is fully curled, `1` is fully extended.
- **Y** — lateral (side) rotation in `[-1, 1]`.
- **Z** — axial (twist) rotation in `[-1, 1]`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fingerIndex` | int |  | 1-based index of the finger to query (1 = Thumb, 2 = Index, 3 = Middle, 4 = Ring, 5 = Pinky). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The control [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] whose X is extension [0, 1], Y is lateral rotation [-1, 1], and Z is axial rotation [-1, 1]. |

### GetFingerTip

```lua
DigitsRigDescription:GetFingerTip(fingerIndex: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the world-space position of the fingertip for the finger at the given 1-based index (1 = Thumb … 5 = Pinky). Currently always returns `Vector3.zero`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fingerIndex` | int |  | 1-based index of the finger to query (1 = Thumb, 2 = Index, 3 = Middle, 4 = Ring, 5 = Pinky). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] position of the fingertip. Currently always returns [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#zero\|Vector3.zero]]. |

### SetFingerControl

```lua
DigitsRigDescription:SetFingerControl(fingerIndex: int, control: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Drives the three-joint chain of the finger at the given 1-based index (1 = Thumb … 5 = Pinky) using forward kinematics. The `control` components are clamped before application:

- **X** — extension, clamped to `[0, 1]`.
- **Y** — lateral rotation, clamped to `[-1, 1]` (maps to ±50°).
- **Z** — axial rotation, clamped to `[-1, 1]` (maps to ±50°).

Joint angles for the three phalanges are computed via Ptolemy's theorem applied to the chain lengths.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fingerIndex` | int |  | 1-based index of the finger to drive (1 = Thumb, 2 = Index, 3 = Middle, 4 = Ring, 5 = Pinky). |
| `control` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] whose X sets extension [0, 1], Y sets lateral rotation [-1, 1], and Z sets axial rotation [-1, 1]; each component is clamped before application. |

**Returns**

| Type | Description |
| --- | --- |
| () | void |

### SetFingerTip

```lua
DigitsRigDescription:SetFingerTip(fingerIndex: int, point: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Moves the fingertip of the finger at the given 1-based index (1 = Thumb … 5 = Pinky) toward the world-space target `point` using inverse kinematics. The solver computes the required extension, lateral, and axial control values and then calls `SetFingerControl` internally.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fingerIndex` | int |  | 1-based index of the finger to solve (1 = Thumb, 2 = Index, 3 = Middle, 4 = Ring, 5 = Pinky). |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | World-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] target position for the fingertip. |

**Returns**

| Type | Description |
| --- | --- |
| () | void |

---
*Source: [DigitsRigDescription](https://create.roblox.com/docs/reference/engine/classes/DigitsRigDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
