---
title: "DragDetector"
description: "Instance which facilitates and encourages interaction with 3D objects in an experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DragDetector"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Instance which facilitates and encourages interaction with 3D objects in an experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] instance facilitates and encourages interaction with 3D objects in an experience, such as opening doors and drawers, sliding a part around, and much more. Key features include:

- Place a [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] under any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] to make it draggable via all inputs (mouse, touch, gamepad, and VR), all without a single line of code.

- Choose from several [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] options, define how the object responds to motion via [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]], and optionally apply axis or movement limits.

- Scripts can respond to manipulation of dragged objects to drive UI or make logical decisions, such as adjusting the light level in a room based on a sliding wall switch dimmer.

- Players can manipulate anchored parts or models and they'll stay exactly where you put them upon release.

- [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]] work in Studio as long as you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools, making it easier to test and adjust draggable objects while editing.

See the [[30 Official Roblox Docs/UI/3D drag detectors|3D Drag Detectors]] guide for details and usage examples.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ActivatedCursorIcon\|ActivatedCursorIcon]] | ContentId | Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ActivatedCursorIconContent\|ActivatedCursorIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. Only supports asset URIs |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ApplyAtCenterOfMass\|ApplyAtCenterOfMass]] | boolean | Whether constraint force is applied to the object's center of mass. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The primary axis of motion, expressed relative to the reference frame. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame\|DragFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the pivot, dependent on the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance\|ReferenceInstance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] | [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|DragDetectorDragStyle]] | The paradigm used to generate proposed motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Enabled\|Enabled]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]] responds to user input. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GamepadModeSwitchKeyCode\|GamepadModeSwitchKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | During gamepad input, the modifier [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for the secondary mode of motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#KeyboardModeSwitchKeyCode\|KeyboardModeSwitchKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | During keyboard input, the modifier [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for the secondary mode of motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragAngle\|MaxDragAngle]] | float | Along with [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragAngle\|MinDragAngle]], impedes the drag detector's attempts to generate motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragTranslation\|MaxDragTranslation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Along with [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragTranslation\|MinDragTranslation]], impedes the drag detector's attempts to generate motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxForce\|MaxForce]] | float | Maximum force applied for the object to reach its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxTorque\|MaxTorque]] | float | Maximum torque applied for the object to reach its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragAngle\|MinDragAngle]] | float | Along with [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragAngle\|MaxDragAngle]], impedes the drag detector's attempts to generate motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragTranslation\|MinDragTranslation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Along with [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragTranslation\|MaxDragTranslation]], impedes the drag detector's attempts to generate motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Orientation\|Orientation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Specifies the **YXZ** rotation of axes of motion relative to the reference frame. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#PermissionPolicy\|PermissionPolicy]] | [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy\|DragDetectorPermissionPolicy]] | Controls the permission level for which players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance\|ReferenceInstance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An instance whose [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] is the reference frame for the drag detector. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle\|ResponseStyle]] | [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle\|DragDetectorResponseStyle]] | The paradigm used to move, or not move, the objects affected by the drag detector. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Responsiveness\|Responsiveness]] | float | Higher values cause the object to reach its goal more rapidly. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#RunLocally\|RunLocally]] | boolean | Whether user input on a [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]] replicates to the server or remains local to the specific client. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SecondaryAxis\|SecondaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The secondary axis of the motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRadialPullFactor\|TrackballRadialPullFactor]] | float | If [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|Enum.DragDetectorDragStyle.RotateTrackball]], multiplier for adding a radial pull rotation as a contribution to the total. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRollFactor\|TrackballRollFactor]] | float | If [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|Enum.DragDetectorDragStyle.RotateTrackball]], multiplier for adding roll rotation to the total. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#VRSwitchKeyCode\|VRSwitchKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | During VR input, the modifier [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]] for the secondary mode of motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#WorldAxis\|WorldAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] expressed in world space. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#WorldSecondaryAxis\|WorldSecondaryAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SecondaryAxis\|SecondaryAxis]] expressed in world space. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#AddConstraintFunction\|AddConstraintFunction()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Adds a function to modify or constrain proposed motion. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GetReferenceFrame\|GetReferenceFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the reference [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in which motion is expressed. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#RestartDrag\|RestartDrag()]] | () | May be invoked from a script to restart the drag using new parameters. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetDragStyleFunction\|SetDragStyleFunction()]] | () | Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|Enum.DragDetectorDragStyle.Scriptable]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetPermissionPolicyFunction\|SetPermissionPolicyFunction()]] | () | Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#PermissionPolicy\|PermissionPolicy]] is set to [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy\|Enum.DragDetectorPermissionPolicy.Scriptable]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragContinue\|DragContinue]] | `playerWhoDragged`, `cursorRay`, `viewFrame`, `vrInputFrame`, `isModeSwitchKeyDown` | Fires when a user continues dragging the object after [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] has been initiated. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragEnd\|DragEnd]] | `playerWhoDragged` | Fires when a user stops dragging the object. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] | `playerWhoDragged`, `cursorRay`, `viewFrame`, `hitFrame`, `clickedPart`, `vrInputFrame`, `isModeSwitchKeyDown` | Fires when a user starts dragging the object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActivatedCursorIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. If this property is left blank, the detector will use the default icon.

To change the activated cursor icon, set this property to the asset ID of the image you'd like to use.

### ActivatedCursorIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. If this property is left blank, the detector will use the default icon.

To change the activated cursor icon, set this property to the asset ID of the image you'd like to use. Only asset URIs are supported for this property.

### ApplyAtCenterOfMass

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics Response · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

When false (default), constraint force is applied at the point the user clicks on. When true, force is applied at the object's center of mass. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|Enum.DragDetectorResponseStyle.Physical]] and the parent object is unanchored.

### Axis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/false · **Capabilities:** Physics, Input · **Tags:** `NotReplicated`

The primary axis of motion, expressed relative to the reference frame. For a [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] of [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.TranslateLine]], the direction of translation; for [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.TranslatePlane]], the normal to the plane of motion; for [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.RotateAxis]], the axis of 1D rotation. Changing this value automatically updates [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Orientation|Orientation]] and vice versa.

### DragFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Dragged Amount · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

If [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance|ReferenceInstance]] is set, the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the pivot relative to the reference frame; otherwise, the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the pivot relative to its frame at the beginning of the drag.

### DragStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|DragDetectorDragStyle]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

The paradigm used to generate proposed motion, given a stream of cursor rays. See [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle]] for options.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

If true, the [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] responds to user input; if false, it does not.

### GamepadModeSwitchKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Mode Switching · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

During gamepad input, the [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for toggling the secondary mode of motion. Only applies if the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] has both primary and secondary modes of motion.

### KeyboardModeSwitchKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Mode Switching · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

During keyboard input, the [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for toggling the secondary mode of motion. Only applies if the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] has both primary and secondary modes of motion.

### MaxDragAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

If this is greater than [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragAngle|MinDragAngle]], translation will be clamped within that range.

This is not a constraint; it merely impedes the drag detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/DragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.RotateAxis]].

### MaxDragTranslation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

In any dimension, if this is greater than [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragTranslation|MinDragTranslation]], translation will be clamped within that range.

This is not a constraint; it merely impedes the drag detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/DragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Physics Response · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Maximum force applied for the object to reach its goal. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|Enum.DragDetectorResponseStyle.Physical]] and the parent object is unanchored.

### MaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Physics Response · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Maximum torque applied for the object to reach its goal. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|Enum.DragDetectorResponseStyle.Physical]] and the parent object is unanchored.

### MinDragAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

If this is less than [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragAngle|MaxDragAngle]], translation will be clamped within that range.

This is not a constraint; it merely impedes the drag detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/DragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.RotateAxis]].

### MinDragTranslation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

In any dimension, if this is less than [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragTranslation|MaxDragTranslation]], translation will be clamped within that range.

This is not a constraint; it merely impedes the drag detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/DragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

### Orientation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Specifies the **YXZ** rotation of axes of motion relative to the reference frame (does not change the orientation of the reference frame itself). Linear translation and axial rotation will be on this reoriented **Y** axis, and planar translation in the **XZ** plane. Changing this value automatically updates [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis|Axis]] and vice versa.

### PermissionPolicy

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy|DragDetectorPermissionPolicy]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Controls the permission level for which players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. Default is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy|Enum.DragDetectorPermissionPolicy.Everybody]].

### ReferenceInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

An instance whose [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is the reference frame for the drag detector. The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame|DragFrame]] is expressed relative to this [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] which may be retrieved via the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GetReferenceFrame|GetReferenceFrame()]] method.

If this instance is a [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], the reference frame will be its pivot; if an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], then its world [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. If it is `nil` or neither of the former, the reference frame will be based on the pivot of the drag detector's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

### ResponseStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|DragDetectorResponseStyle]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Once the proposed motion has been computed and potentially constrained, this is the paradigm used to move, or not move, the objects affected by the [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. See [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|Enum.DragDetectorResponseStyle]] for options.

### Responsiveness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Physics Response · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

Higher values cause the object to reach its goal more rapidly. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle|Enum.DragDetectorResponseStyle.Physical]] and the parent object is unanchored.

### RunLocally

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

If false (default), the client sends replicated signals ([[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart|DragStart]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragContinue|DragContinue]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragEnd|DragEnd]]) to the server which processes cursor rays, makes changes to the data model, and replicates them onwards to clients.

If true, the client processes those signals itself and does not replicate them to the server. Client [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] may be used to respond to these events and [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] may be used to send any resulting changes that should be replicated to the server.

### SecondaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/false · **Capabilities:** Physics, Input · **Tags:** `NotReplicated`

The secondary axis of the motion. Relates to orientation using the same paradigm as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### TrackballRadialPullFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

When the cursor is outside the trackball, the [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] can apply a radial pull rotation that turns the ball as if it were trying to roll out toward the cursor. This property is a 0 to 1 multiplier for adding that rotation as a contribution to the total. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.RotateTrackball]].

### TrackballRollFactor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

When the cursor is outside the trackball, the [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] can apply a roll rotation that turns the ball as if it were mounted on a vinyl record facing the viewer. This property is a 0 to 1 multiplier for adding that roll rotation to the total. Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.RotateTrackball]].

### VRSwitchKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Mode Switching · **Loaded/Saved:** true/true · **Capabilities:** Physics, Input

During VR input, the [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] for toggling the secondary mode of motion. Only applies if the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] has both primary and secondary modes of motion.

### WorldAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/false · **Capabilities:** Physics, Input · **Tags:** `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis|Axis]] expressed in world space. Relates to orientation using the same paradigm as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

### WorldSecondaryAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/false · **Capabilities:** Physics, Input · **Tags:** `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SecondaryAxis|SecondaryAxis]] expressed in world space. Relates to orientation using the same paradigm as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

## Methods

### AddConstraintFunction

```lua
DragDetector:AddConstraintFunction(priority: int, function: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Physics, Input

Adds a function to modify or constrain proposed motion. The function takes an input [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of **proposed** motion and returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of **modified** or unmodified motion. Both the input and output are expressed relative to the reference frame. You can add multiple functions which will be called in order by `priority`, passing the results along in a chain.

To remove an added constraint function, call [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect|Disconnect()]] on the returned connection object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `priority` | int |  | The order of priority for functions added via this method. Higher values take precedence over lower values. |
| `function` | Function |  | Function for modifying or constraining proposed motion. This function takes an input [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of **proposed** motion and returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of **modified** or unmodified motion, both relative to the reference frame. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Use this connection object to remove the constraint function. |

### GetReferenceFrame

```lua
DragDetector:GetReferenceFrame(): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Physics, Input

Returns the reference [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in which motion is expressed; see the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance|ReferenceInstance]] property for more details.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The reference [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in which motion is expressed. |

### RestartDrag

```lua
DragDetector:RestartDrag(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics, Input

May be invoked from a script to restart the drag using new parameters, if parameters such as [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis|Axis]], or [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SecondaryAxis|SecondaryAxis]] change.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetDragStyleFunction

```lua
DragDetector:SetDragStyleFunction(function: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics, Input

Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Enum.DragDetectorDragStyle.Scriptable]]. The given function is called when responding to a [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragContinue|DragContinue]] signal, it receives the signal's world space cursor ray with type [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]], and it returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] containing the desired location and orientation of the pivot in world space.

If the function returns `nil`, the object will not be moved. This is useful if the script has not yet collected all the information it needs to give the correct answer, or in temporary cases where you want the object to stay where it is.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | Function for monitoring [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragContinue\|DragContinue]] signals. This function receives the signal's world space cursor ray and it returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] containing the desired location and orientation of the pivot in world space. If this function returns `nil`, the object will not be moved. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPermissionPolicyFunction

```lua
DragDetector:SetPermissionPolicyFunction(function: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics, Input

Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#PermissionPolicy|PermissionPolicy]] is set to [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy|Enum.DragDetectorPermissionPolicy.Scriptable]]. The given function accepts a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] parameter for enabling/disabling the detector for a specific player. It also receives a `part` parameter indicating which specific [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] was clicked, such as one part within a draggable [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]; this is useful for enabling/disabling the detector based on that part's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/Instance#HasTag|HasTag()]] value, or other details.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | Function for setting the detector's interactivity. This function accepts a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] parameter for enabling/disabling the detector for a specific player. It also receives a `part` parameter indicating which specific [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] was clicked, such as one part within a draggable [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]; this is useful for enabling/disabling the detector based on that part's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color\|Color]], [[30 Official Roblox Docs/API Reference/Classes/Instance#HasTag\|HasTag()]] value, or other details. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`DragDetector-SetPermissionPolicyFunction`) are published on the source page; their code is not part of the open-source repo.*

## Events

### DragContinue

```lua
DragDetector.DragContinue(playerWhoDragged: Player, cursorRay: Ray, viewFrame: CFrame, vrInputFrame: OptionalCoordinateFrame, isModeSwitchKeyDown: boolean)
```

**Capabilities:** Physics, Input

Fires when a user continues dragging the object after [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart|DragStart]] has been initiated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoDragged` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who initiated the drag through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] and is now continuing the drag. |
| `cursorRay` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] emanating from the cursor, aimed into the scene. |
| `viewFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the user's [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |
| `vrInputFrame` | OptionalCoordinateFrame |  | If using a VR input device, the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the hand holding the cursor/pointer/controller. |
| `isModeSwitchKeyDown` | boolean |  | If the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] has both primary and secondary modes of motion, this parameter indicates whether the user is pressing the modifier input defined through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#KeyboardModeSwitchKeyCode\|KeyboardModeSwitchKeyCode]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GamepadModeSwitchKeyCode\|GamepadModeSwitchKeyCode]], or [[30 Official Roblox Docs/API Reference/Classes/DragDetector#VRSwitchKeyCode\|VRSwitchKeyCode]]. |

### DragEnd

```lua
DragDetector.DragEnd(playerWhoDragged: Player)
```

**Capabilities:** Physics, Input

Fires when a user stops dragging the object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoDragged` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who initiated the drag through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] and has now ended (released) the drag. |

### DragStart

```lua
DragDetector.DragStart(playerWhoDragged: Player, cursorRay: Ray, viewFrame: CFrame, hitFrame: CFrame, clickedPart: BasePart, vrInputFrame: OptionalCoordinateFrame, isModeSwitchKeyDown: boolean)
```

**Capabilities:** Physics, Input

Fires when a user starts dragging the object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoDragged` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who initiated the drag. |
| `cursorRay` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] emanating from the cursor, aimed into the scene. |
| `viewFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the user's [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |
| `hitFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The hit frame of the cursor raycast that initiated the drag. |
| `clickedPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The part that was hit by the cursor raycast that initiated the drag. |
| `vrInputFrame` | OptionalCoordinateFrame |  | If using a VR input device, the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the hand holding the cursor/pointer/controller. |
| `isModeSwitchKeyDown` | boolean |  | If the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] has both primary and secondary modes of motion, this parameter indicates whether the user is pressing the modifier input defined through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#KeyboardModeSwitchKeyCode\|KeyboardModeSwitchKeyCode]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GamepadModeSwitchKeyCode\|GamepadModeSwitchKeyCode]], or [[30 Official Roblox Docs/API Reference/Classes/DragDetector#VRSwitchKeyCode\|VRSwitchKeyCode]]. |

---
*Source: [DragDetector](https://create.roblox.com/docs/reference/engine/classes/DragDetector) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
