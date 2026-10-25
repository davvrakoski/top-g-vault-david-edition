---
title: "AlignOrientation"
description: "Constraint which applies torque to align two attachments, or to align one attachment with a goal orientation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AlignOrientation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Constraint which applies torque to align two attachments, or to align one attachment with a goal orientation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The `AlignOrientation` constraint applies torque to align two attachments, or to align one attachment with a goal orientation. As indicated by the name, it only affects the **orientation** of the attachments, not their position (to align attachments **positionally**, see [[30 Official Roblox Docs/API Reference/Classes/AlignPosition|AlignPosition]]).

Torque created by `AlignOrientation` is applied about the center of mass of the parent of the attachments, or the center of mass of parts rigidly connected to the parents.

When configuring this constraint, it may be helpful to study [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]] to understand how Roblox units compare to metric units.

#### Affected Axes

The axes affected by torque are controlled through the constraint's [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType|AlignType]] property. When set to [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisParallel]], [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisPerpendicular]] or [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisLookAt]], torque will only occur when the primary axes become misaligned. Otherwise, the constraint will apply torque about all 3 axes to achieve alignment.

#### Reactionary Torque

By default, the constraint only applies torque to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If desired, torque can be applied to both attachments in **equal and opposite directions** by enabling [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#ReactionTorqueEnabled|ReactionTorqueEnabled]].

#### Torque Magnitude

You can configure this constraint to apply the maximum torque that constraints allow through the [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled|RigidityEnabled]] property. When `true`, the physics solver reacts as quickly as possible to complete the alignment. When `false`, the torque is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque|MaxTorque]], [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity|MaxAngularVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness|Responsiveness]].

#### Attachment Mode

This constraint can use either **one** or **two** attachments in calculating its goal. See [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] for details.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType\|AlignType]] | [[30 Official Roblox Docs/API Reference/Enums/AlignType\|AlignType]] | The constraint's axis alignment type. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] orientation with which the constraint will attempt to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#LookAtPosition\|LookAtPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] world space location toward which the primary axis will attempt to align. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity\|MaxAngularVelocity]] | float | Maximum angular velocity the constraint can use to reach its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque\|MaxTorque]] | float | Maximum torque the constraint can use to reach its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode\|Mode]] | [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode\|OrientationAlignmentMode]] | Whether the constraint uses one or two attachments in calculating its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis\|PrimaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The direction of the goal's **X** axis, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxisOnly\|PrimaryAxisOnly]] | boolean | **Deprecated.** Determines how the constraint's axes are affected by torque. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#ReactionTorqueEnabled\|ReactionTorqueEnabled]] | boolean | Whether the constraint applies torque only to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0\|Attachment0]], or to both attachments in equal and opposite directions. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness\|Responsiveness]] | float | Controls how quickly the constraint reaches its goal. Higher values cause the attachment(s) to align more rapidly. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled\|RigidityEnabled]] | boolean | Whether torque is dependent on other properties, or if the physics solver reacts as quickly as possible to complete the alignment. |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis\|SecondaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The direction of the goal's **Y** axis, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AlignType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AlignType|AlignType]]

**Thread safety:** ReadSafe · **Category:** AlignOrientation · **Loaded/Saved:** true/true · **Capabilities:** Physics

Specifies the desired relationship between the primary axes of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] and the goal. Available options are [[30 Official Roblox Docs/API Reference/Enums/AlignType|AllAxes]], [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisParallel]], [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisPerpendicular]], and [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisLookAt]]. The constraint will attempt to maintain the specified relationship, as given by the [[30 Official Roblox Docs/API Reference/Enums/AlignType|Enum.AlignType]], by applying torques onto the relevant axes.

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** TargetOrientation · **Loaded/Saved:** true/true · **Capabilities:** Physics

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] orientation (translation component ignored) with which the constraint will attempt to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]]. Only used when [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] is set to [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]].

### LookAtPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** TargetOrientation · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] world space location toward which the primary axis will attempt to align. This is only active when [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType|AlignType]] is set to [[30 Official Roblox Docs/API Reference/Enums/AlignType|PrimaryAxisLookAt]] and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] is set to [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]].

### MaxAngularVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum angular velocity the constraint can use to reach its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled|RigidityEnabled]] is `false`.

Note that [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity|MaxAngularVelocity]], as well as [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque|MaxTorque]], are **caps** to the angular velocity and torque respectively. The actual scale is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness|Responsiveness]].

### MaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Maximum torque the constraint can use to reach its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled|RigidityEnabled]] is `false`.

Note that [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque|MaxTorque]], as well as [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity|MaxAngularVelocity]], are **caps** to the torque and angular velocity respectively. The actual scale is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness|Responsiveness]].

### Mode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OrientationAlignmentMode]]

**Thread safety:** ReadSafe · **Category:** AlignmentMode · **Loaded/Saved:** true/true · **Capabilities:** Physics

Whether the constraint uses **one** or **two** attachments in calculating its goal. By default, this is [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|TwoAttachment]], meaning that the constraint attempts to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] with the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]], disregarding [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis|PrimaryAxis]], and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis|SecondaryAxis]].

If set to [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]], the constraint disregards [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] and attempts to match the orientation of [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] with the orientation of [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#CFrame|CFrame]], or match the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#Axis|Axis]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment#SecondaryAxis|SecondaryAxis]] with the constraint's [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxis|PrimaryAxis]] and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#SecondaryAxis|SecondaryAxis]] properties respectively.

### PrimaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** TargetOrientation · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

The direction of the goal's **X** axis, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Only used when [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] is [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]].

### PrimaryAxisOnly

> [!warning] Deprecated
> This property is deprecated. Depending on your usage case, set
> `Class.AlignOrientation.AlignType|AlignType` directly to
> `Enum.AlignType|PrimaryAxisParallel`,
> `Enum.AlignType|PrimaryAxisPerpendicular` or
> `Enum.AlignType|PrimaryAxisLookAt` instead.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignOrientation · **Loaded/Saved:** true/true · **Capabilities:** Physics

Determines how the constraint's axes are affected by torque. If `false` (default), the constraint will apply torque about all 3 axes to achieve alignment. If `true`, torque will only occur when the primary axes become misaligned.

Enabling [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#PrimaryAxisOnly|PrimaryAxisOnly]] also enables the [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#AlignType|AlignType]] property.

### ReactionTorqueEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignOrientation · **Loaded/Saved:** true/true · **Capabilities:** Physics

If `false` (default), the constraint only applies torque to [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment0|Attachment0]] while [[30 Official Roblox Docs/API Reference/Classes/Constraint#Attachment1|Attachment1]] remains unaffected. If `true`, the constraint applies torque to both attachments in **equal and opposite directions**.

### Responsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics

Controls how quickly the constraint reaches its goal. Higher values cause the attachment(s) to align more rapidly. Value can be between 5 and 200.

### RigidityEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** AlignOrientation · **Loaded/Saved:** true/true · **Capabilities:** Physics

Whether torque is dependent on other properties, or if the physics solver reacts as quickly as possible to complete the alignment. If `false` (default), the torque is determined by [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque|MaxTorque]], [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity|MaxAngularVelocity]], and [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness|Responsiveness]]. If `true`, the physics solver reacts as quickly as possible to complete the alignment.

### SecondaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** TargetOrientation · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `NotReplicated`

The direction of the goal's **Y** axis, represented as a unit [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. Only used when [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Mode|Mode]] is [[30 Official Roblox Docs/API Reference/Enums/OrientationAlignmentMode|OneAttachment]].

---
*Source: [AlignOrientation](https://create.roblox.com/docs/reference/engine/classes/AlignOrientation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
