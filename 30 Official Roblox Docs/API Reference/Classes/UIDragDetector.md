---
title: "UIDragDetector"
description: "Instance which facilitates and encourages interaction with UI elements in an experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UIDragDetector"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Instance which facilitates and encourages interaction with UI elements in an experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]] → [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] instance facilitates and encourages interaction with 2D user interface elements in an experience, such as sliders and spinners. Key features include:

- Place a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] under any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instance to make it draggable via all inputs without a single line of code.

- Choose from several [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] options, define how the object responds to motion via [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle|ResponseStyle]], and optionally apply axis, movement limits, or drag boundaries.

- Scripts can respond to manipulation of dragged objects to drive logic responses, such as adjusting settings.

- [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetectors]] work in Studio as long as you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools, nor certain plugins or Studio's **UI** editor tools.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ActivatedCursorIcon\|ActivatedCursorIcon]] | ContentId | Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ActivatedCursorIconContent\|ActivatedCursorIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]]. Only supports asset URIs |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingBehavior\|BoundingBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|UIDragDetectorBoundingBehavior]] | Determines bounding behavior of the dragged UI object when the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]] is set. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]] | [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] | Instance whose bounding area defines the drag boundaries for the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#CursorIcon\|CursorIcon]] | ContentId | Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#CursorIconContent\|CursorIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]]. Only asset URIs are supported. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis\|DragAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The drag axis for the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] instance when [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle\|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Enum.UIDragDetectorDragStyle.TranslateLine]]. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity\|DragRelativity]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity\|UIDragDetectorDragRelativity]] | Sets the paradigm which defines the relativity of inputs/outputs from a custom drag function. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation\|DragRotation]] | float | The rotation performed by the current drag. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace\|DragSpace]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace\|UIDragDetectorDragSpace]] | Sets the paradigm which defines the space of inputs/outputs from a custom drag function. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle\|DragStyle]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|UIDragDetectorDragStyle]] | The paradigm used to generate proposed motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | The translation performed by the current drag expressed in a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#Enabled\|Enabled]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] responds to user input. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle\|MaxDragAngle]] | float | Along with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle\|MinDragAngle]], impedes the detector's attempts to generate rotational motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation\|MaxDragTranslation]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Along with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation\|MinDragTranslation]], impedes the detector's attempts to generate linear/planar motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle\|MinDragAngle]] | float | Along with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle\|MaxDragAngle]], impedes the detector's attempts to generate rotational motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation\|MinDragTranslation]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Along with [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation\|MaxDragTranslation]], impedes the detector's attempts to generate linear/planar motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | A [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] instance whose local space and absolute center position is the reference space and origin for the detector. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle\|ResponseStyle]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle\|UIDragDetectorResponseStyle]] | The paradigm used to define the response to proposed motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed\|SelectionModeDragSpeed]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Maximum drag speed for translation. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeRotateSpeed\|SelectionModeRotateSpeed]] | float | Maximum angle per second the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] can rotate at. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping\|UIDragSpeedAxisMapping]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|UIDragSpeedAxisMapping]] | [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|Enum.UIDragSpeedAxisMapping]] value that determines the **X**/**Y** dimension dragging speeds. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction\|AddConstraintFunction()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Adds a function to modify or constrain proposed motion. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#GetReferencePosition\|GetReferencePosition()]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Returns the reference [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] position of the current drag's reference origin. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#GetReferenceRotation\|GetReferenceRotation()]] | float | Returns the reference rotation of the current drag's reference element. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction\|SetDragStyleFunction()]] | () | Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle\|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Enum.UIDragDetectorDragStyle.Scriptable]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragContinue\|DragContinue]] | `inputPosition` | Fires when a user continues dragging the UI element after [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStart\|DragStart]] has been initiated. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragEnd\|DragEnd]] | `inputPosition` | Fires when a user stops dragging the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStart\|DragStart]] | `inputPosition` | Fires when a user starts dragging the UI element. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponent]], [[30 Official Roblox Docs/API Reference/Classes/UIBase|UIBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActivatedCursorIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]. If this property is left blank, the detector will use the default icon.

To change the activated cursor icon, set this property to the asset ID of the image you'd like to use.

### ActivatedCursorIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the cursor icon to display when the mouse is activated over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]. If this property is left blank, the detector will use the default icon.

To change the activated cursor icon, set this property to the asset ID of the image you'd like to use. Only asset URIs are supported for this property.

### BoundingBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior|UIDragDetectorBoundingBehavior]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines bounding behavior of the dragged UI object when the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] is set. See [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior|Enum.UIDragDetectorBoundingBehavior]] for details on each setting's behavior.

### BoundingUI

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

When set, the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] instance will not allow the bounds of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to be dragged outside the bounds of the **BoundingUI** instance.

Note that if a portion of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is outside the **BoundingUI** bounds, the initial input position at drag start and its relative position during drag will be used for bounding detection until the entirety of the dragged object is within the bounds, after which the object will be constrained inside the bounds.

### CursorIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]. If this property is left blank, the detector will use the default icon.

To change the cursor icon, set this property to the asset ID of the image you'd like to use.

### CursorIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]. If this property is left blank, the detector will use the default icon.

To change the cursor icon, set this property to the asset ID of the image you'd like to use. Only asset URIs are supported for this property.

### DragAxis

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Drag Directions · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] value that defines the axis of movement for the dragged object when [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslateLine]]. The axis is defined in the local space of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] unless [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is defined, in which case the axis is defined in that instance's local space.

### DragRelativity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity|UIDragDetectorDragRelativity]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Only applies if a custom drag function is registered through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction|SetDragStyleFunction()]] or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]]. Sets the paradigm which defines the relativity of the registered function's inputs/outputs.

For example, returning a `Datatype.UDim2.fromOffset(1, 0)` from a registered function with this property set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity|Enum.UIDragDetectorDragRelativity.Absolute]] will move the detector's parent **to** `(1, 0)` in the designated [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]], while returning the same [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] with this property set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity|Enum.UIDragDetectorDragRelativity.Relative]] will move the detector's parent **by** `(1, 0)` in the designated [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]].

### DragRotation

**Type:** float

**Thread safety:** ReadSafe · **Category:** Dragged Amount · **Loaded/Saved:** true/true · **Capabilities:** UI

The rotation performed by the current drag. This value is defined in degrees relative to the local space of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] unless [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is defined, in which case the rotation is defined in the local space of that instance and from its positive **X** axis.

This property can be changed while there is no active drag to rotate the dragged object.

### DragSpace

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|UIDragDetectorDragSpace]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Only applies if a custom drag function is registered through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction|SetDragStyleFunction()]] or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]]. Sets the paradigm which defines the space of the registered function's inputs/outputs.

For example, if the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is a child of a parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that's rotated:

- Returning a `Datatype.UDim2.fromOffset(1, 0)` from a registered function with this property set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|Enum.UIDragDetectorDragSpace.Parent]] will move the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to the right by 1 pixel in the local space affected by its parent's rotation.

- Returning a `Datatype.UDim2.fromOffset(1, 0)` from a registered function with this property set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|Enum.UIDragDetectorDragSpace.LayerCollector]] will move the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to the right by 1 pixel in the space of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]].

### DragStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|UIDragDetectorDragStyle]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

The paradigm used to generate proposed motion, given a stream of input position vectors. See [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle]] for options.

### DragUDim2

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Dragged Amount · **Loaded/Saved:** true/true · **Capabilities:** UI

The translation performed by the current drag expressed in a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] value. Translation is done through [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] or [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] value changes depending on the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity|DragRelativity]] value, and it is relative to the detector's local space unless a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is defined.

This property can be changed while there is no active drag to move the dragged object.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

If `true`, the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] responds to user input; if `false`, it does not.

### MaxDragAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** UI

If this property is greater than [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle|MinDragAngle]], rotation will be clamped within the range of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle|MinDragAngle]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle|MaxDragAngle]]. Positive values impede clockwise rotation while negative values impede counterclockwise rotation.

This is not a constraint; it merely impedes the detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.Rotate]].

### MaxDragTranslation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** UI

If the corresponding [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] and/or [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values are greater than those of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation|MinDragTranslation]] in all dimensions, linear/planar translation will be clamped within the range of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation|MinDragTranslation]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation|MaxDragTranslation]].

This is not a constraint; it merely impedes the detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslateLine]] or [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslatePlane]].

### MinDragAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** UI

If this property is less than [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle|MaxDragAngle]], rotation will be clamped within the range of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle|MinDragAngle]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle|MaxDragAngle]]. Positive values impede clockwise rotation while negative values impede counterclockwise rotation.

This is not a constraint; it merely impedes the detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.Rotate]].

### MinDragTranslation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Drag Limits · **Loaded/Saved:** true/true · **Capabilities:** UI

If the corresponding [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] and/or [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values are less than those of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation|MaxDragTranslation]] in all dimensions, linear/planar translation will be clamped within the range of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation|MinDragTranslation]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation|MaxDragTranslation]].

This is not a constraint; it merely impedes the detector's attempts to generate motion in order to remain within limits. See [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction|AddConstraintFunction()]] to add custom constraint to a drag.

Only relevant if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslateLine]] or [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslatePlane]].

### ReferenceUIInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instance whose local space and absolute center position is the reference space and origin for the detector. Setting this reference affects properties such as [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2|DragUDim2]], [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation|DragRotation]], and the behavior of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis|DragAxis]].

### ResponseStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle|UIDragDetectorResponseStyle]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Once the proposed motion has been computed and potentially constrained, this paradigm is used to deterimine how to move (or not move) the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] affected by the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]. See [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle|Enum.UIDragDetectorResponseStyle]] for options.

### SelectionModeDragSpeed

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Defines the maximum drag speed for translation as a combination of [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] of the first ancestor [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] belongs to. This value must be positive and any value below `0` will be clamped to `0`.

### SelectionModeRotateSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

Defines the maximum angle per second at which the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] can rotate. This value must be positive and any value below `0` will be clamped to `0`.

### UIDragSpeedAxisMapping

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping|UIDragSpeedAxisMapping]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping|Enum.UIDragSpeedAxisMapping]] value that determines the **X**/**Y** dimension dragging speeds.

## Methods

### AddConstraintFunction

```lua
UIDragDetector:AddConstraintFunction(priority: int, function: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** UI

Adds a function to modify or constrain proposed motion. The function takes an input [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] (position) and float (rotation) of **proposed** motion and returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] and float of **modified** or unmodified motion. You can add multiple functions which will be called in order by `priority`, passing the results along in a chain.

The input is expressed in the space defined by the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]] property, either as a delta or the final desired position/rotation based on the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity|DragRelativity]] property. The output should be expressed in the same space and relativity, unless overridden by returning a specified [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity|Enum.UIDragDetectorDragRelativity]] and [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|Enum.UIDragDetectorDragSpace]] as the third and fourth return values.

To remove an added constraint function, call [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect|Disconnect()]] on the returned connection object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `priority` | int |  | The order of priority for functions added via this method. Higher values take precedence over lower values. |
| `function` | Function |  | Function for modifying or constraining proposed motion. This function takes in input [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] and float of **proposed** motion and returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] and float of **modified** or unmodified motion. It can optionally return an [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity\|Enum.UIDragDetectorDragRelativity]] and [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace\|Enum.UIDragDetectorDragSpace]] as the third and fourth return values as output overrides. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Use this connection object to remove the constraint function. |

### GetReferencePosition

```lua
UIDragDetector:GetReferencePosition(): UDim2
```

**Thread safety:** Unsafe · **Capabilities:** UI

When no [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is set, this function returns the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position of the dragged object's immediate parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] (if one exists), or else the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position of the dragged object.

When a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is set, this function returns the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position of that reference instance.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] position of the current drag's reference element. |

### GetReferenceRotation

```lua
UIDragDetector:GetReferenceRotation(): float
```

**Thread safety:** Unsafe · **Capabilities:** UI

When no [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is set, this function returns the rotation of the dragged object's immediate parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] (if one exists), or else the rotation of the dragged object.

When a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] is set, this function returns the rotation of that reference instance.

**Returns**

| Type | Description |
| --- | --- |
| float | Rotation of the current drag's reference element. |

### SetDragStyleFunction

```lua
UIDragDetector:SetDragStyleFunction(function: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Passes a function to be used if and only if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.Scriptable]]. The given function receives the signal's screen space input position with type [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], and it returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] (position) and float (rotation) containing the desired motion of the drag. The space of the return values and the relativity of the motion are determined by the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity|DragRelativity]] properties, unless overridden by returning a specified [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragRelativity|Enum.UIDragDetectorDragRelativity]] and [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|Enum.UIDragDetectorDragSpace]] as the third and fourth return values.

If the function returns `nil`, the object will not be moved. This is useful if the script has not yet collected all the information it needs to give the correct answer, or in temporary cases where you want the object to stay where it is.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | Function for monitoring [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragContinue\|DragContinue]] signals. This function receives the signal's screen space input position and returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] and float containing the desired motion of the drag in the desired space and relativity. If this function returns `nil`, the object will not be moved. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### DragContinue

```lua
UIDragDetector.DragContinue(inputPosition: Vector2)
```

**Capabilities:** UI

Fires when a user continues dragging the UI element after [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStart|DragStart]] has been initiated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the current input position. |

### DragEnd

```lua
UIDragDetector.DragEnd(inputPosition: Vector2)
```

**Capabilities:** UI

Fires when a user stops dragging the UI element.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the current input position. |

### DragStart

```lua
UIDragDetector.DragStart(inputPosition: Vector2)
```

**Capabilities:** UI

Fires when a user starts dragging the UI element.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] representing the current input position. |

---
*Source: [UIDragDetector](https://create.roblox.com/docs/reference/engine/classes/UIDragDetector) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
