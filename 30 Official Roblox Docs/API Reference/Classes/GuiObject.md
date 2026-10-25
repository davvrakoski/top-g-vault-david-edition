---
title: "GuiObject"
description: "An abstract class for all 2D user interface objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GuiObject"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class for all 2D user interface objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup|CanvasGroup]], [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]], [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], [[30 Official Roblox Docs/API Reference/Classes/GuiLabel|GuiLabel]], [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]], [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]], [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]], [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]], [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]], [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]
- **Memory category:** Gui
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is an abstract class (much like [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]) for a 2D user interface object. It defines all the properties relating to the display of a graphical user interface (GUI) object such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]]. It also has some useful read‑only properties like [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]], and [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteRotation|AbsoluteRotation]].

To manipulate the layout of GUI objects in special ways, you can use a layout structure such as [[30 Official Roblox Docs/UI/List and flex layouts|list/flex]] or [[30 Official Roblox Docs/UI/Grid and table layouts|grid]], and you can style them beyond their core properties through [[30 Official Roblox Docs/UI/UI appearance modifiers|appearance modifiers]].

Although it's possible to detect mouse button events on any GUI object using [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded|InputEnded]], only [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] have convenient dedicated events such as [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] to detect click/press.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Active\|Active]] | boolean | Determines whether this UI element sinks input. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint\|AnchorPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the origin point of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]], relative to its absolute size. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize\|AutomaticSize]] | [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|AutomaticSize]] | Determines whether resizing occurs based on child content. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor\|BackgroundColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] background. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] background color. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]] | float | Determines the transparency of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] background and border. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor\|BorderColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] border. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] border. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderMode\|BorderMode]] | [[30 Official Roblox Docs/API Reference/Enums/BorderMode\|BorderMode]] | Determines in what manner the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] border is laid out relative to its dimensions. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]] | int | Determines the pixel width of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] border. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants\|ClipsDescendants]] | boolean | Determines if descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] outside of the bounds of a parent GUI element should render. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Draggable\|Draggable]] | boolean | **Deprecated.** Determines whether a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] (and its descendants) can be dragged around the screen. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState\|GuiState]] | [[30 Official Roblox Docs/API Reference/Enums/GuiState\|GuiState]] | Determines whether the player's mouse is being actively pressed on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] or not. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputSink\|InputSink]] | [[30 Official Roblox Docs/API Reference/Enums/InputSink\|InputSink]] | Controls whether, and how, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] sinks input that occurs over it. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable\|Interactable]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] can be interacted with or not, or if the [[30 Official Roblox Docs/API Reference/Enums/GuiState\|GuiState]] of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] is changing or not. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder\|LayoutOrder]] | int | Controls the sort order of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] when used with a [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout\|UIGridStyleLayout]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown\|NextSelectionDown]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] which will be selected when the gamepad selector is moved downward. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft\|NextSelectionLeft]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] which will be selected when the gamepad selector is moved to the left. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight\|NextSelectionRight]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] which will be selected when the gamepad selector is moved to the right. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp\|NextSelectionUp]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] which will be selected when the gamepad selector is moved upward. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines the pixel and scalar position of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] | float | Determines the number of degrees by which the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] is rotated. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable\|Selectable]] | boolean | Determine whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] can be selected by a gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionImageObject\|SelectionImageObject]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Overrides the default selection adornment used for gamepads. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionOrder\|SelectionOrder]] | int | The order of [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] selected by the gamepad UI selection. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Determines the pixel and scalar size of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SizeConstraint\|SizeConstraint]] | [[30 Official Roblox Docs/API Reference/Enums/SizeConstraint\|SizeConstraint]] | Sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size]] axes that the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] will be based on, relative to the size of its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Transparency\|Transparency]] | float | **Deprecated.** A mixed property of [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]] and [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency\|TextTransparency]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Visible\|Visible]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] and its descendants will be rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|ZIndex]] | int | Determines the order in which a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] renders relative to others. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenPosition\|TweenPosition()]] | boolean | **Deprecated.** Smoothly moves a GUI to a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize\|TweenSize()]] | boolean | **Deprecated.** Smoothly resizes a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] to a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]]. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSizeAndPosition\|TweenSizeAndPosition()]] | boolean | **Deprecated.** Smoothly moves a GUI to a new size and position. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#DragBegin\|DragBegin]] | `initialPosition` | **Deprecated.** Fired when a player begins dragging the object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#DragStopped\|DragStopped]] | `x`, `y` | **Deprecated.** Fired when a player stops dragging the object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan\|InputBegan]] | `input` | Fired when a user begins interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc). |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged\|InputChanged]] | `input` | Fired when a user changes how they're interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc). |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded\|InputEnded]] | `input` | Fired when a user stops interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc). |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter\|MouseEnter]] | `x`, `y` | Fires when a user moves their mouse into a GUI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave\|MouseLeave]] | `x`, `y` | Fires when a user moves their mouse out of a GUI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved\|MouseMoved]] | `x`, `y` | Fires whenever a user moves their mouse while it is inside a GUI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelBackward\|MouseWheelBackward]] | `x`, `y` | Fires when a user scrolls their mouse wheel back when the mouse is over a GUI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelForward\|MouseWheelForward]] | `x`, `y` | Fires when a user scrolls their mouse wheel forward when the mouse is over a GUI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionGained\|SelectionGained]] |  | Fired when the GuiObject is being focused on with the Gamepad selector. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionLost\|SelectionLost]] |  | Fired when the Gamepad selector stops focusing on the GuiObject. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchLongPress\|TouchLongPress]] | `touchPositions`, `state` | Fires when the player starts, continues and stops long-pressing the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchPan\|TouchPan]] | `touchPositions`, `totalTranslation`, `velocity`, `state` | Fires when the player moves their finger on the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchPinch\|TouchPinch]] | `touchPositions`, `scale`, `velocity`, `state` | Fires when the player performs a pinch or pull gesture using two fingers on the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchRotate\|TouchRotate]] | `touchPositions`, `rotation`, `velocity`, `state` | Fires when the player performs a rotation gesture using two fingers on the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchSwipe\|TouchSwipe]] | `swipeDirection`, `numberOfTouches` | Fires when the player performs a swipe gesture on the UI element. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchTap\|TouchTap]] | `touchPositions` | Fires when the player performs a tap gesture on the UI element. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Active

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will sink input to 3D space, such as underlying models with a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] class like [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]].

For [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] objects ([[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]), this property determines whether [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] fires ([[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor|AutoButtonColor]] will still work for those as well). The events [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|InputBegan]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged|InputChanged]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded|InputEnded]] work as normal no matter the value of this property.

*Code samples for this member (`TextButton-Active-Debounce`) are published on the source page; their code is not part of the open-source repo.*

### AnchorPoint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the origin point of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], relative to its absolute size. The origin point determines from where the element is positioned (through [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|GuiObject.Position]]) and from which the rendered [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|GuiObject.Size]] expands.

See [[30 Official Roblox Docs/UI/Position and size UI objects#AnchorPoint|here]] for illustrated diagrams and details.

*Code samples for this member (`AnchorPoint-Demo`) are published on the source page; their code is not part of the open-source repo.*

### AutomaticSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|AutomaticSize]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is used to automatically size parent UI objects based on the size of its descendants. You can use this property to dynamically add text and other content to a UI object at edit or run time, and the size will adjust to fit that content.

When [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] is set to an [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Enum.AutomaticSize]] value to anything other than [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|None]], this UI object may resize depending on its child content.

For more information on how to use this property and how it works, please see [[30 Official Roblox Docs/UI/Size modifiers and constraints#Automatic sizing|here]].

*Code samples for this member (`automaticsize-uilistlayout`) are published on the source page; their code is not part of the open-source repo.*

### BackgroundColor

> [!warning] Deprecated
> This property is deprecated in favor of the `Datatype.Color3` property
> `Class.GuiObject.BackgroundColor3`, which should be used in new work
> instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] background.

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the color of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] background (the fill color). If your element contains text, such as a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], make sure the color of your background contrasts the text's color.

Another property that determines the visual properties of the background is [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|GuiObject.BackgroundTransparency]]; if this is set to `1`, neither the background nor the border will render.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3|BorderColor3]].

*Code samples for this member (`Rainbow-Frame`) are published on the source page; their code is not part of the open-source repo.*

### BackgroundTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the transparency of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] background and border. It does not, however, determine the transparency of text if the GUI is a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]]; text transparency is determined [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextTransparency|TextBox.TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency|TextButton.TextTransparency]], and [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] respectively.

If this property is set to `1`, neither the background nor the border will render and the GUI background will be completely transparent.

### BorderColor

> [!warning] Deprecated
> This property is deprecated in favor of the `Datatype.Color3` property
> BorderColor3, which should be used in new work instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] border.

### BorderColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the color of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] rectangular border (also known as the stroke color). This is separate from the object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|GuiObject.BackgroundColor3]]. You will not be able to see the object's border if its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel|GuiObject.BorderSizePixel]] property is set to `0`.

Note that the [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] component allows for more advanced border effects.

*Code samples for this member (`Button-Highlight`) are published on the source page; their code is not part of the open-source repo.*

### BorderMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/BorderMode|BorderMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines in what manner the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] border is laid out relative to its dimensions using the enum of the same name, [[30 Official Roblox Docs/API Reference/Enums/BorderMode|Enum.BorderMode]].

Note that [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] can override this property and allow for more advanced border effects.

### BorderSizePixel

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines how wide the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] border renders, in pixels. Setting this to 0 disables the border altogether.

Note that [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] can override this property and allow for more advanced border effects.

*Code samples for this member (`Button-Highlight`) are published on the source page; their code is not part of the open-source repo.*

### ClipsDescendants

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines if the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will clip (make invisible) any portion of descendant GUI elements that would otherwise render outside the bounds of the rectangle.

#### Rotation Behavior

When [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ClipsDescendantsSupportsRotation|StarterGui.ClipsDescendantsSupportsRotation]] is enabled, clipping works correctly for rotated shapes. However, clipping **by** rotated shapes (when the clipping parent itself is rotated) or by rounded corners ([[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]]) is not supported.

When [[30 Official Roblox Docs/API Reference/Classes/StarterGui#ClipsDescendantsSupportsRotation|StarterGui.ClipsDescendantsSupportsRotation]] is **not** enabled and this [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] or any ancestor [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] has a **non‑zero** [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]], this property is **ignored** and descendant GUI elements will render regardless of this property's value.

### Draggable

> [!warning] Deprecated
> This property is deprecated. Use `Class.UIDragDetector` instead, as it
> supports more input types and can be better customized.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Deprecated`

This indicates whether a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] (and its descendants) can be dragged around the screen.

### GuiState

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GuiState|GuiState]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

When the player's finger is being tapped and held on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be set to [[30 Official Roblox Docs/API Reference/Enums/GuiState|Press]]. Similarly, When the player's finger is being released from the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be set to [[30 Official Roblox Docs/API Reference/Enums/GuiState|Idle]], and when [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable|Interactable]] is turned off on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], the [[30 Official Roblox Docs/API Reference/Enums/GuiState|GuiState]] of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be set to [[30 Official Roblox Docs/API Reference/Enums/GuiState|NonInteractable]].

### InputSink

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputSink|InputSink]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `NotReplicated`

Controls whether, and to what degree, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] sinks input that occurs over it, using [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink]]. Sinking input prevents it from passing through to objects behind the element, including 3D objects in the world such as those with a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. It defaults to [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.None]], except on [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] objects ([[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]), where it defaults to [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.Activate]].

- [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.None]] — the object does not sink input on its own.
- [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.Activate]] — the object sinks the mouse-button and touch press/release input used to activate it, but lets other input (such as mouse movement) pass through.
- [[30 Official Roblox Docs/API Reference/Enums/InputSink|Enum.InputSink.All]] — the object sinks all input that occurs over it.

This property is a more granular successor to the boolean [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Active|Active]] property, which can only sink all input or none. The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|InputBegan]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged|InputChanged]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded|InputEnded]] events fire regardless of this property's value.

### Interactable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] can be interacted with or not, or if the [[30 Official Roblox Docs/API Reference/Enums/GuiState|GuiState]] of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is changing or not.

On a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]]:

- When the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable|Interactable]] setting on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is set to `false`, the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] will no longer be able to be pressed or clicked, and the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] will be constantly set to [[30 Official Roblox Docs/API Reference/Enums/GuiState|NonInteractable]].
- When the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable|Interactable]] setting on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] will behave normally again and the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] will behave normally.

On a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]:

- When the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable|Interactable]] setting on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is set to `false`, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] will be constantly set to [[30 Official Roblox Docs/API Reference/Enums/GuiState|NonInteractable]].
- When the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable|Interactable]] setting on the [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] is set to `true`, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#GuiState|GuiState]] will behave normally again.

### LayoutOrder

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls the sorting order of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] when using a [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout|UIGridStyleLayout]] (such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] or [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]]) with [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|SortOrder]] set to [[30 Official Roblox Docs/API Reference/Enums/SortOrder|Enum.SortOrder.LayoutOrder]]. It has no functionality if the object does not have a sibling UI layout structure.

[[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] are sorted in ascending order where lower values take priority over higher values. Objects with equal values fall back to the order they were added in.

If you are unsure if you'll need to add an element between two existing elements in the future, it's a good practice to use multiples of `100` (`0`, `100`, `200`, etc.). This ensures a large gap of layout order values which you can use for elements ordered in-between other elements.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] which determines the object's **rendering** order instead of sorting order.

### NextSelectionDown

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] selected when the user moves the [[30 Official Roblox Docs/Input/Gamepad input|gamepad]] selector downward. If this property is empty, moving the gamepad downward will not change the selected GUI.

Moving the gamepad selector downward sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] to this object unless the GUI is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]]. Note that this property can be set to a GUI element even if it is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]], so you should ensure that the value of a GUI's selectable property matches your expected behavior.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|NextSelectionUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft|NextSelectionLeft]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight|NextSelectionRight]].

*Code samples for this member (`creating-a-gamepad-selection-grid`) are published on the source page; their code is not part of the open-source repo.*

### NextSelectionLeft

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] selected when the user moves the [[30 Official Roblox Docs/Input/Gamepad input|gamepad]] selector to the left. If this property is empty, moving the gamepad to the left will not change the selected GUI.

Moving the gamepad selector to the left sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] to this object unless the GUI is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]]. Note that this property can be set to a GUI element even if it is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]], so you should ensure that the value of a GUI's selectable property matches your expected behavior.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|NextSelectionUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|NextSelectionDown]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight|NextSelectionRight]].

*Code samples for this member (`creating-a-gamepad-selection-grid`) are published on the source page; their code is not part of the open-source repo.*

### NextSelectionRight

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] selected when the user moves the [[30 Official Roblox Docs/Input/Gamepad input|gamepad]] selector to the right. If this property is empty, moving the gamepad to the right will not change the selected GUI.

Moving the gamepad selector to the right sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] to this object unless the GUI is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]]. Note that this property can be set to a GUI element even if it is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]], so you should ensure that the value of a GUI's selectable property matches your expected behavior.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|NextSelectionUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|NextSelectionDown]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft|NextSelectionLeft]].

*Code samples for this member (`creating-a-gamepad-selection-grid`) are published on the source page; their code is not part of the open-source repo.*

### NextSelectionUp

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] selected when the user moves the [[30 Official Roblox Docs/Input/Gamepad input|gamepad]] selector upward. If this property is empty, moving the gamepad upward will not change the selected GUI.

Moving the gamepad selector upward sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] to this object unless the GUI is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]]. Note that this property can be set to a GUI element even if it is not [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable|Selectable]], so you should ensure that the value of a GUI's selectable property matches your expected behavior.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|NextSelectionDown]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft|NextSelectionLeft]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight|NextSelectionRight]].

*Code samples for this member (`creating-a-gamepad-selection-grid`) are published on the source page; their code is not part of the open-source repo.*

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] pixel and scalar position using a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]. Position is centered around the object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|GuiObject.AnchorPoint]].

The scalar position is relative to the size of the parent GUI element, if any.

The pixel portions of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] value are the same regardless of the parent GUI's size. The values represent the position of the object in pixels. An object's actual pixel position can be read from the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|GuiBase2d.AbsolutePosition]] property.

### Rotation

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the number of degrees by which the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is rotated. Rotation is relative to the **center** of the object, **not** the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]], meaning you cannot change the point of rotation. Additionally, this property is not compatible with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants|ClipsDescendants]].

### Selectable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] can be selected when navigating GUIs using a gamepad.

If this property is `true`, a GUI can be selected. Selecting a GUI also sets the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] property to that object.

When this is `false`, the GUI cannot be selected. However, setting this to `false` when a GUI is selected will not deselect it nor change the value of the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] property.

Add [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionGained|GuiObject.SelectionGained]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionLost|GuiObject.SelectionLost]] will not fire for the element. To deselect a GuiObject, you must change the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] property.

This property is useful if a GUI is connected to several GUIs via properties such as this [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|GuiObject.NextSelectionUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|GuiObject.NextSelectionDown]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject|NextSelectionRight]], or [[30 Official Roblox Docs/API Reference/Classes/GuiObject|NextSelectionLeft]]. Rather than change all of the properties so that the Gamepad cannot select the GUI, you can disable its Selectable property to temporarily prevent it from being selected. Then, when you want the gamepad selector to be able to select the GUI, simply re-enable its selectable property.

*Code samples for this member (`limiting-textbox-selection`) are published on the source page; their code is not part of the open-source repo.*

### SelectionImageObject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property overrides the default selection adornment used for gamepads.

Note that the chosen [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionImageObject|SelectionImageObject]] overlays the selected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] with the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of the image. For best results, you should size the custom `SelectionImageObject` via the scale [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] values to help ensure that the object scales properly over the selected element.

Changing the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionImageObject|SelectionImageObject]] for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element only affects that element. To affect all of a user's GUI elements, set the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SelectionImageObject|PlayerGui.SelectionImageObject]] property.

To determine or set which GUI element is selected by the user, you can use the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|GuiService.SelectedObject]] property. The player uses the gamepad to select different GUI elements, invoking the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionUp|NextSelectionUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionDown|NextSelectionDown]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionLeft|NextSelectionLeft]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#NextSelectionRight|NextSelectionRight]] events.

### SelectionOrder

**Type:** int

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

GuiObjects with a lower SelectionOrder are selected earlier than GuiObjects with a higher SelectionOrder when starting the gamepad selection or calling [[30 Official Roblox Docs/API Reference/Classes/GuiService#Select|GuiService:Select()]] on an ancestor. This property does not affect directional navigation. Default value is 0.

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] scalar and pixel size using a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]].

The scalar size is relative to the size of the parent GUI element, if any.

The pixel portions of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] value are the same regardless of the parent GUI's size. The values represent the size of the object in pixels. An object's actual pixel size can be read from the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]] property.

If the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] has a parent, its size along each axis is also influenced by the parent's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SizeConstraint|SizeConstraint]].

*Code samples for this member (`Health-Bar`) are published on the source page; their code is not part of the open-source repo.*

### SizeConstraint

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SizeConstraint|SizeConstraint]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] axes that the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be based on, relative to the size of its parent.

This property is useful for creating GUI objects that are meant to scale with either the width **or** height of a parent object, but not both, effectively preserving the aspect ratio of the object.

### Transparency

> [!warning] Deprecated
> This property is deprecated and indexing it will return
> `Class.GuiObject.BackgroundTransparency|BackgroundTransparency`.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

A mixed property of [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] and [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextTransparency]].

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property whether the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] and its descendants will be rendered.

The rendering of individual components of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] can be controlled individually through transparency properties such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|GuiObject.BackgroundTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency|ImageLabel.ImageTransparency]].

When this property is `false`, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] will be ignored by layout structures such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]], and [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]]. In other words, the space that the element would otherwise occupy in the layout is used by other elements instead.

*Code samples for this member (`UI-Window`) are published on the source page; their code is not part of the open-source repo.*

### ZIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the order in which a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] renders relative to others.

By default, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] render in ascending priority order where those with lower [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] values are rendered under those with higher values. You can change the render order within a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] by changing the value of its [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ZIndexBehavior|ZIndexBehavior]].

If you are unsure if you'll need to add an element between two existing elements in the future, it's a good practice to use multiples of `100` (`0`, `100`, `200`, etc.). This ensures a large gap of render order values which you can use for elements layered in-between other elements.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] which controls the **sorting** order of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] when used with a layout structure such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] or [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]].

## Methods

### TweenPosition

> [!warning] Deprecated
> This function is deprecated in favor of using `Class.TweenService`, which
> allows for better customization using an object-oriented and event-based
> approach.
>
> - The `easingDirection`, `easingStyle`, and `time` parameters are handled
>   by a `Datatype.TweenInfo`
> - The `override` parameter is no longer relevant; tweens always override
>   previous tweens on the same property.
> - The `callback` parameter is better suited by the `Class.Tween.Completed`
>   event. The `Enum.PlaybackState` enum passed by that event provides a
>   more detailed description of the tween's completion state.

```lua
GuiObject:TweenPosition(endPosition: UDim2, easingDirection: EasingDirection = Out, easingStyle: EasingStyle = Quad, time: float = 1, override: boolean = False, callback: Function = nil): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Smoothly moves a GUI to a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position in the specified time using the specified [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection]] and [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle]]. This method raises an error if `easingStyle` is [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]].

This function will return whether the tween will play. It will not play if another tween is acting on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] and the override parameter is `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize|GuiObject:TweenSize()]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSizeAndPosition|GuiObject:TweenSizeAndPosition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `endPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | Where the GUI should move to. |
| `easingDirection` | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | `Out` | The direction in which to ease the GUI to the _endPosition_. |
| `easingStyle` | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | `Quad` | The style in which to ease the GUI to the _endPosition_. |
| `time` | float | `1` | How long, in seconds, the tween should take to complete. |
| `override` | boolean | `False` | Whether the tween will override an in-progress tween. |
| `callback` | Function | `nil` | A callback function to execute when the tween completes. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the tween will play. |

*Code samples for this member (`GuiObject-TweenPosition1`) are published on the source page; their code is not part of the open-source repo.*

### TweenSize

> [!warning] Deprecated
> This function is deprecated in favor of using `Class.TweenService`, which
> allows for better customization using an object-oriented and event-based
> approach.
>
> - The `easingDirection`, `easingStyle`, and `time` parameters are handled
>   by a `Datatype.TweenInfo`
> - The `override` parameter is no longer relevant; tweens always override
>   previous tweens on the same property.
> - The `callback` parameter is better suited by the `Class.Tween.Completed`
>   event. The `Enum.PlaybackState` enum passed by that event provides a
>   more detailed description of the tween's completion state.

```lua
GuiObject:TweenSize(endSize: UDim2, easingDirection: EasingDirection = Out, easingStyle: EasingStyle = Quad, time: float = 1, override: boolean = False, callback: Function = nil): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Smoothly resizes a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] in the specified time using the specified [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection]] and [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle]]. This method raises an error if `easingStyle` is [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]].

This function will return whether the tween will play. Normally this will always return `true`, but it will return `false` if another tween is active and override is set to `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize|GuiObject:TweenSize()]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSizeAndPosition|GuiObject:TweenSizeAndPosition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `endSize` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The size that the GUI should resize. |
| `easingDirection` | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | `Out` | The direction in which to ease the GUI to the _endSize_. |
| `easingStyle` | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | `Quad` | The style in which to ease the GUI to the _endSize_. |
| `time` | float | `1` | How long, in seconds, the tween should take to complete. |
| `override` | boolean | `False` | Whether the tween will override an in-progress tween. |
| `callback` | Function | `nil` | A callback function to execute when the tween completes. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the tween will play. |

*Code samples for this member (`tween-a-gui-s-size`) are published on the source page; their code is not part of the open-source repo.*

### TweenSizeAndPosition

> [!warning] Deprecated
> This function is deprecated in favor of using `Class.TweenService`, which
> allows for better customization using an object-oriented and event-based
> approach.
>
> - The `easingDirection`, `easingStyle`, and `time` parameters are handled
>   by a `Datatype.TweenInfo`
> - The `override` parameter is no longer relevant; tweens always override
>   previous tweens on the same property.
> - The `callback` parameter is better suited by the `Class.Tween.Completed`
>   event. The `Enum.PlaybackState` enum passed by that event provides a
>   more detailed description of the tween's completion state.

```lua
GuiObject:TweenSizeAndPosition(endSize: UDim2, endPosition: UDim2, easingDirection: EasingDirection = Out, easingStyle: EasingStyle = Quad, time: float = 1, override: boolean = False, callback: Function = nil): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Deprecated`

Smoothly resizes and moves a GUI to a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] size and position in the specified time using the specified [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection]] and [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle]]. This method raises an error if `easingStyle` is [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Bezier]] or [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Spring]].

This function will return whether the tween will play. Normally this will always return `true`, but it will return `false` if another tween is active and override is set to `false`.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize|GuiObject:TweenSize()]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSizeAndPosition|GuiObject:TweenSizeAndPosition()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `endSize` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | The size that the GUI should resize. |
| `endPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | Where the GUI should move to. |
| `easingDirection` | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|EasingDirection]] | `Out` | The direction in which to ease the GUI to the _endSize_ and _endPosition_. |
| `easingStyle` | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|EasingStyle]] | `Quad` | The style in which to ease the GUI to the _endSize_ and _endPosition_. |
| `time` | float | `1` | How long, in seconds, the tween should take to complete. |
| `override` | boolean | `False` | Whether the tween will override an in-progress tween. |
| `callback` | Function | `nil` | A callback function to execute when the tween completes. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the tween will play. |

*Code samples for this member (`GuiObject-TweenSizeAndPosition1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### DragBegin

> [!warning] Deprecated
> This property is deprecated. Use `Class.UIDragDetector` instead, as it
> supports more input types and can be better customized.

```lua
GuiObject.DragBegin(initialPosition: UDim2)
```

**Capabilities:** UI · **Tags:** `Deprecated`

This event fires when a player begins dragging the object.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#DragStopped|GuiObject.DragStopped]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `initialPosition` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] value of the position of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] before any drag operation began. |

*Code samples for this member (`GuiObject-DragBegin1`) are published on the source page; their code is not part of the open-source repo.*

### DragStopped

> [!warning] Deprecated
> This property is deprecated. Use `Class.UIDragDetector` instead, as it
> supports more input types and can be better customized.

```lua
GuiObject.DragStopped(x: int, y: int)
```

**Capabilities:** UI · **Tags:** `Deprecated`

This event fires when a player stops dragging the object.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#DragBegin|GuiObject.DragBegin]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen location in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The mouse's **Y** screen location in pixels, relative to the top left corner of the screen. |

*Code samples for this member (`GuiObject-DragStopped1`) are published on the source page; their code is not part of the open-source repo.*

### InputBegan

```lua
GuiObject.InputBegan(input: InputObject)
```

**Capabilities:** UI

This event fires when a user begins interacting with the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc).

The [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] has a similarly named event that is not restricted to a specific UI element: [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|UserInputService.InputBegan]].

This event will always fire regardless of game state.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded|GuiObject.InputEnded]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged|GuiObject.InputChanged]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]], which contains useful data for querying user input such as the [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|type of input]], [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|state of input]], and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|screen coordinates of the input]]. |

*Code samples for this member (`tracking-the-beginning-of-input-on-a-guiobject`) are published on the source page; their code is not part of the open-source repo.*

### InputChanged

```lua
GuiObject.InputChanged(input: InputObject)
```

**Capabilities:** UI

This event fires when a user changes how they're interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc).

The [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] has a similarly named event that is not restricted to a specific UI element: [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|UserInputService.InputChanged]].

This event will always fire regardless of game state.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|GuiObject.InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputEnded|GuiObject.InputEnded]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]], which contains useful data for querying user input such as the [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|type of input]], [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|state of input]], and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|screen coordinates of the input]]. |

*Code samples for this member (`guiobject-inputchanged-demo`) are published on the source page; their code is not part of the open-source repo.*

### InputEnded

```lua
GuiObject.InputEnded(input: InputObject)
```

**Capabilities:** UI

The InputEnded event fires when a user stops interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc).

The [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] has a similarly named event that is not restricted to a specific UI element: [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputEnded|UserInputService.InputEnded]].

This event will always fire regardless of game state.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|GuiObject.InputBegan]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputChanged|GuiObject.InputChanged]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]], which contains useful data for querying user input such as the [[30 Official Roblox Docs/API Reference/Enums/UserInputType\|Enum.UserInputType]], [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]], and [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position\|InputObject.Position]]. |

*Code samples for this member (`tracking-the-end-of-input-on-a-guiobject`) are published on the source page; their code is not part of the open-source repo.*

### MouseEnter

```lua
GuiObject.MouseEnter(x: int, y: int)
```

**Capabilities:** UI

The MouseEnter event fires when a user moves their mouse into a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element.

Please do not rely on the `x` and `y` arguments passed by this event as a fool-proof way to determine where the user's mouse is when it enters a GUI. These coordinates may vary even when the mouse enters the GUI via the same edge - particularly when the mouse enters the element quickly. This is due to the fact the coordinates indicate the position of the mouse when the event fires rather than the exact moment the mouse enters the GUI.

This event fires even when the GUI element renders beneath another element.

If you would like to track when a user's mouse leaves a GUI element, you can use the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|GuiObject.MouseLeave]] event.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|GuiObject.MouseLeave]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelForward|GuiObject.MouseWheelForward]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelBackward|GuiObject.MouseWheelBackward]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels, relative to the top left corner of the screen. |

*Code samples for this member (`GuiObject-MouseEnter1`) are published on the source page; their code is not part of the open-source repo.*

### MouseLeave

```lua
GuiObject.MouseLeave(x: int, y: int)
```

**Capabilities:** UI

The MouseLeave event fires when a user moves their mouse out of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element.

Please do not rely on the `x` and `y` arguments passed by this event as a fool-proof way to determine where the user's mouse is when it leaves a GUI. These coordinates may vary even when the mouse leaves the GUI via the same edge - particularly when the mouse leaves the element quickly. This is due to the fact the coordinates indicate the position of the mouse when the event fires rather than the exact moment the mouse leaves the GUI.

This event fires even when the GUI element renders beneath another element.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|GuiObject.MouseEnter]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelForward|GuiObject.MouseWheelForward]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelBackward|GuiObject.MouseWheelBackward]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels, relative to the top left corner of the screen. |

### MouseMoved

```lua
GuiObject.MouseMoved(x: int, y: int)
```

**Capabilities:** UI

Fires whenever a user moves their mouse while it is inside a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element. It is similar to [[30 Official Roblox Docs/API Reference/Classes/Mouse#Move|Mouse.Move]], which fires regardless whether the user's mouse is over a GUI element.

Note, this event fires when the mouse's position is updated, therefore it will fire repeatedly while being moved.

The `x` and `y` arguments indicate the updated screen coordinates of the user's mouse in pixels. These can be useful to determine the mouse's location on the GUI, screen, and delta since the mouse's previous position if it is being tracked in a global variable.

The code below demonstrates how to determine the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] offset of the user's mouse relative to a GUI element. [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] is measured inside the screen's GUI inset, while the `x` and `y` arguments of this event are screen coordinates that include it, so the sample calls [[30 Official Roblox Docs/API Reference/Classes/GuiService#GetGuiInset|GetGuiInset()]] to reconcile the two spaces instead of assuming a fixed inset size.

```lua
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")

local CustomScrollingFrame = script.Parent
local SubFrame = CustomScrollingFrame:FindFirstChild("SubFrame")

local mouse = Players.LocalPlayer:GetMouse()

local function getPosition(X, Y)
	local topLeftInset = GuiService:GetGuiInset()

	local gui_X = CustomScrollingFrame.AbsolutePosition.X
	local gui_Y = CustomScrollingFrame.AbsolutePosition.Y

	local pos = Vector2.new(math.abs(X - gui_X), math.abs(Y - gui_Y - topLeftInset.Y))
	print(pos)
end

CustomScrollingFrame.MouseMoved:Connect(getPosition)
```

Note that this event may not fire exactly when the user's mouse enters or exits a GUI element. Therefore, the `x` and `y` arguments may not match up perfectly to the coordinates of the GUI's edges.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|GuiObject.MouseEnter]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|GuiObject.MouseLeave]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelForward|GuiObject.MouseWheelForward]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelBackward|GuiObject.MouseWheelBackward]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels, relative to the top left corner of the screen. |

### MouseWheelBackward

```lua
GuiObject.MouseWheelBackward(x: int, y: int)
```

**Capabilities:** UI

The WheelBackward event fires when a user scrolls their mouse wheel back when the mouse is over a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element. It is similar to [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelBackward|Mouse.WheelBackward]], which fires regardless whether the user's mouse is over a GUI element.

This event fires merely as an indicator of the wheel's backward movement. This means that the `x` and `y` mouse coordinate arguments don't change as a result of this event. These coordinates only change when the mouse moves, which can be tracked by the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]] event.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|GuiObject.MouseEnter]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|GuiObject.MouseLeave]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelForward|GuiObject.MouseWheelForward]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The mouse's **Y** screen coordinate in pixels, relative to the top left corner of the screen. |

### MouseWheelForward

```lua
GuiObject.MouseWheelForward(x: int, y: int)
```

**Capabilities:** UI

The WheelForward event fires when a user scrolls their mouse wheel forward when the mouse is over a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] element. It is similar to [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelForward|Mouse.WheelForward]], which fires regardless whether the user's mouse is over a GUI element.

This event fires merely as an indicator of the wheel's forward movement. This means that the **X** and **Y** mouse coordinate arguments do not change as a result of this event. These coordinates only change when the mouse moves, which can be tracked by the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]] event.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|GuiObject.MouseEnter]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|GuiObject.MouseLeave]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseMoved|GuiObject.MouseMoved]]
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseWheelBackward|GuiObject.MouseWheelBackward]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The mouse's **X** screen coordinate in pixels, relative to the top left corner of the screen. |
| `y` | int |  | The **Y** coordinate of the user's mouse. |

### SelectionGained

```lua
GuiObject.SelectionGained()
```

**Capabilities:** UI

This event fires when the Gamepad selector starts focusing on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

If you want to check from the Gamepad select stops focusing on the GUI element, you can use the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionLost|GuiObject.SelectionLost]] event.

When a GUI gains selection focus, the value of the [[30 Official Roblox Docs/API Reference/Classes/GuiService#SelectedObject|SelectedObject]] property also changes to the that gains selection. To determine which GUI gained selection, check the value of this property.

*Code samples for this member (`GuiObject-SelectionGained1`) are published on the source page; their code is not part of the open-source repo.*

### SelectionLost

```lua
GuiObject.SelectionLost()
```

**Capabilities:** UI

This event fires when the Gamepad selector stops focusing on the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

If you want to check from the Gamepad select starts focusing on the GUI element, you can use the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionGained|GuiObject.SelectionGained]] event.

When a GUI loses selection focus, the value of the [[30 Official Roblox Docs/API Reference/Classes/GuiService|SelectionObject]] property changes either to `nil` or to the GUI element that gains selection focus. To determine which GUI gained selection, or if no GUI is selected, check the value of this property.

*Code samples for this member (`GuiObject-SelectionLost1`) are published on the source page; their code is not part of the open-source repo.*

### TouchLongPress

```lua
GuiObject.TouchLongPress(touchPositions: Array, state: UserInputState)
```

**Capabilities:** UI

This event fires after a brief moment when the player holds their finger on the UI element using a touch-enabled device. It fires with a table of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] that describe the relative screen positions of the fingers involved in the gesture. In addition, it fires multiple times: [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Begin]] after a brief delay, [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Change]] if the player moves their finger during the gesture, and finally [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.End]]. The delay is platform dependent; in Studio it is a little longer than one second.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] that describe the **relative** positions of the fingers involved in the gesture. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | A [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] that describes the state of the gesture:<br><br>- Begin fires once at the beginning of the gesture (after the brief delay) - Change fires if the player moves their finger while pressing down - End fires once at the end of the gesture when they release their finger. |

*Code samples for this member (`Move-UI-Element-with-TouchLongPress`) are published on the source page; their code is not part of the open-source repo.*

### TouchPan

```lua
GuiObject.TouchPan(touchPositions: Array, totalTranslation: Vector2, velocity: Vector2, state: UserInputState)
```

**Capabilities:** UI

This event fires when the player moves their finger on the UI element using a touch-enabled device. It fires shortly before [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchSwipe|GuiObject.TouchSwipe]] would, and does not fire with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchTap|GuiObject.TouchTap]]. This event is useful for allowing the player to manipulate the position of UI elements on the screen.

This event fires with a table of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] that describe the relative screen positions of the fingers involved in the gesture. In addition, it fires multiple times: [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Begin]] after a brief delay, [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Change]] when the player moves their finger during the gesture, and finally with [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.End]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | A Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects, each indicating the position of all the fingers involved in the gesture. |
| `totalTranslation` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Indicates how far the pan gesture has gone from its starting point. |
| `velocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | Indicates how quickly the gesture is being performed in each dimension. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | Indicates the [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |

*Code samples for this member (`Panning-UI-Element`) are published on the source page; their code is not part of the open-source repo.*

### TouchPinch

```lua
GuiObject.TouchPinch(touchPositions: Array, scale: float, velocity: float, state: UserInputState)
```

**Capabilities:** UI

This event fires when the player uses two fingers to make a pinch or pull gesture on the UI element using a touch-enabled device. A **pinch** happens when two or more fingers move closer together, and a **pull** happens when they move apart. This event fires in conjunction with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchPan|GuiObject.TouchPan]]. This event is useful for allowing the player to manipulate the scale (size) of UI elements on the screen, and is most often used for zooming features.

This event fires with a table of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] that describe the relative screen positions of the fingers involved in the gesture. In addition, it fires multiple times: [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Begin]] after a brief delay, [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Change]] when the player moves a finger during the gesture, and finally with [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.End]]. It should be noted that the scale should be used **multiplicatively**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | A Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects, each indicating the position of all the fingers involved in the pinch gesture. |
| `scale` | float |  | A float that indicates the difference from the beginning of the pinch gesture. |
| `velocity` | float |  | A float indicating how quickly the pinch gesture is happening. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | Indicates the [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |

*Code samples for this member (`Pinch-Pull-Scaling`) are published on the source page; their code is not part of the open-source repo.*

### TouchRotate

```lua
GuiObject.TouchRotate(touchPositions: Array, rotation: float, velocity: float, state: UserInputState)
```

**Capabilities:** UI

This event fires when the player uses two fingers to make a pinch or pull gesture on the UI element using a touch-enabled device. Rotation occurs when the angle of the line between two fingers changes. This event fires in conjunction with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchPan|GuiObject.TouchPan]]. This event is useful for allowing the player to manipulate the rotation of UI elements on the screen.

This event fires with a table of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] that describe the relative screen positions of the fingers involved in the gesture. In addition, it fires multiple times: [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Begin]] after a brief delay, [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.Change]] when the player moves a finger during the gesture, and finally with [[30 Official Roblox Docs/API Reference/Enums/UserInputState|Enum.UserInputState.End]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | A Luau array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] objects, each indicating the position of all the fingers involved in the gesture. |
| `rotation` | float |  | A float indicating how much the rotation has gone from the start of the gesture. |
| `velocity` | float |  | A float that indicates how quickly the gesture is being performed. |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|UserInputState]] |  | Indicates the [[30 Official Roblox Docs/API Reference/Enums/UserInputState\|Enum.UserInputState]] of the gesture. |

*Code samples for this member (`Touch-Rotation`) are published on the source page; their code is not part of the open-source repo.*

### TouchSwipe

```lua
GuiObject.TouchSwipe(swipeDirection: SwipeDirection, numberOfTouches: int)
```

**Capabilities:** UI

This event fires when the player performs a swipe gesture on the UI element using a touch-enabled device. It fires with the direction of the gesture (Up, Down, Left or Right) and the number of touch points involved in the gesture. Swipe gestures are often used to change tabs in mobile UIs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `swipeDirection` | [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|SwipeDirection]] |  | A [[30 Official Roblox Docs/API Reference/Enums/SwipeDirection\|Enum.SwipeDirection]] indicating the direction of the swipe gesture (Up, Down, Left or Right). |
| `numberOfTouches` | int |  | The number of touch points involved in the gesture (usually 1). |

*Code samples for this member (`Bouncing-Color-Picker`) are published on the source page; their code is not part of the open-source repo.*

### TouchTap

```lua
GuiObject.TouchTap(touchPositions: Array)
```

**Capabilities:** UI

This event fires when the player performs a tap gesture on the UI element using a touch-enabled device. A tap is a quick single touch without any movement involved (a longer press would fire [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchLongPress|GuiObject.TouchLongPress]], and moving during the touch would fire [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchPan|GuiObject.TouchPan]] and/or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TouchSwipe|GuiObject.TouchSwipe]]). It fires with a table of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] objects that describe the relative positions of the fingers involved in the gesture.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchPositions` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] that describe the **relative** positions of the fingers involved in the gesture. |

*Code samples for this member (`Tap-Transparency-Toggle`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [GuiObject](https://create.roblox.com/docs/reference/engine/classes/GuiObject) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
