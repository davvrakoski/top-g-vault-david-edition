---
title: "Mouse"
description: "Legacy object that contains members useful for pointer input."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Mouse"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Legacy object that contains members useful for pointer input.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/PlayerMouse|PlayerMouse]], [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

**Mouse** has been superseded by [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]], which cover a broader scope, are more feature rich, and support **cross-platform** patterns better. It remains supported because of its widespread use, but you should strongly consider using these alternatives.

The **Mouse** object houses various API for pointers, primarily for buttons and raycasting. It can be accessed through [[30 Official Roblox Docs/API Reference/Classes/Player#GetMouse|Player:GetMouse()]] called on the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. It is also passed by the [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Tool.Equipped]] event.

- It is most notable for the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Icon|Icon]] property, which changes the cursor's appearance.
- It continually raycasts the screen mouse position into the 3D world using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetFilter|TargetFilter]] property, storing the results of the raycast in the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Hit]], [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Target]], and [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetSurface|TargetSurface]] properties. These can be useful for simple cases, but [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] should be used in more complicated [[30 Official Roblox Docs/Workspace/Raycasting|raycasting]] scenarios.
- [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] can use [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|Plugin:GetMouse()]] to get a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]], which behaves similarly.

```lua
-- From a LocalScript:
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
-- Setting the mouse icon
mouse.Icon = "rbxasset://SystemCursors/Wait"
```

Note:

- This object does not control/restrict pointer movement. For this, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior|UserInputService.MouseBehavior]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseDeltaSensitivity|UserInputService.MouseDeltaSensitivity]].
- If two functions are connected to same input event, such as [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button1Down|Button1Down]], **both** functions will run when the event fires. There is no concept of sinking/passing input, as events don't support this behavior. However, [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]] does have this behavior through [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|BindAction]].
- While a mouse may not be available on all platforms, Mouse will still function on mobile (touch) and console (gamepad), which don't typically have mice or pointer hardware. For explicit cross-platform behaviors, use [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]].

  See [[30 Official Roblox Docs/Input/Input|Input and Camera]] for more information on customizing inputs in your experience.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit\|Hit]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the mouse's position in 3D space. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit\|hit]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Icon\|Icon]] | ContentId | The content ID of the image used as the [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] icon. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#IconContent\|IconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The content of the image used as the [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] icon. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Origin\|Origin]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] positioned at the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]] and oriented toward the mouse's 3D position. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target\|Target]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The object in 3D space the [[30 Official Roblox Docs/API Reference/Classes/Mouse\|mouse]] is pointing to. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target\|target]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetFilter\|TargetFilter]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Determines an object (and its descendants) to be ignored when determining [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit\|Mouse.Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target\|Mouse.Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetSurface\|TargetSurface]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | Indicates the [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] surface at which the mouse is pointing. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#UnitRay\|UnitRay]] | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] directed towards the mouse's world position, originating from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]] world position. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#ViewSizeX\|ViewSizeX]] | int | Describes the width of the game window in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#ViewSizeY\|ViewSizeY]] | int | Describes the height of the game window in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#X\|X]] | int | Describes the X (horizontal) component of the mouse's position on the screen. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Y\|Y]] | int | Describes the Y (vertical) component of the mouse's screen position. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button1Down\|Button1Down]] |  | Fires when the left mouse button is pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button1Up\|Button1Up]] |  | Fires when the left mouse button is released. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button2Down\|Button2Down]] |  | Fires when the right mouse button is pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Button2Up\|Button2Up]] |  | Fired when the right mouse button is released. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Idle\|Idle]] |  | Fired during every heartbeat that the mouse isn't being passed to another mouse event. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#KeyDown\|KeyDown]] | `key` | **Deprecated.** Fires when a Key is pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#keyDown\|keyDown]] | `key` | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#KeyUp\|KeyUp]] | `key` | **Deprecated.** Fires when a Key is released. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#Move\|Move]] |  | Fired when the mouse is moved. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelBackward\|WheelBackward]] |  | Fires when the mouse wheel is scrolled backwards. |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelForward\|WheelForward]] |  | Fires when the mouse wheel is scrolled forwards. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Hit

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the mouse's position in 3D space. Note that [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetFilter|Mouse.TargetFilter]] and its descendants will be ignored.

Developers can get obtain the position of Hit like so:

```
local position = mouse.Hit.Position
```

Hit is often used by [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] to fire a weapon towards the mouse in third person.

Developers looking for the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the mouse is pointing at should use [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]].

#### How is Mouse.Hit calculated?

The position of the Hit CFrame is calculated as the point of intersection between the mouse's internal [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] (an extended version of [[30 Official Roblox Docs/API Reference/Classes/Mouse#UnitRay|Mouse.UnitRay]]) and an object in 3D space (such as a part).

The orientation of the Hit CFrame corresponds with the direction of the [[30 Official Roblox Docs/API Reference/Classes/Mouse#UnitRay|Mouse.UnitRay]].

```
local unitRayDirection = mouse.UnitRay.Direction
local mouseHitDirection = mouse.Hit.lookVector
-- unitRayDirection ≈ mouseHitDirection
-- the vectors are approximately equal
```

Note, the roll of the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] is not used when calculating the orientation of the Hit [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

The mouse's internal ray extends for 1,000 studs. If the mouse is not pointing at an object in 3D space (for example when pointing at the sky), this property will be 1,000 studs away from the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]].

*Code samples for this member (`Mouse-Hit-Laser-Beam`, `mouse-origin-v-mouse-hit`) are published on the source page; their code is not part of the open-source repo.*

### hit

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Mouse.Hit` which should be
> used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

### Icon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

**Icon** is a property that determines the image used as the pointer. If blank, a default arrow is used. While the cursor hovers over a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], this property is temporarily ignored.

To hide the cursor entirely, **do not** use a transparent image – instead, set [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|UserInputService.MouseIconEnabled]] to false.

For getting/setting the user mouse icon in experiences, you should use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIcon|UserInputService.MouseIcon]]. [[30 Official Roblox Docs/API Reference/Classes/Mouse#Icon|Mouse.Icon]] will be deprecated after the new API for plugins to set the mouse cursor is released.

##### Designing a Cursor

The following guidelines may prove useful when creating your own mouse cursors:

- The dimensions of the image used determines the size of the cursor.
- The dimensions of the image should not exceed 256 pixels on any axis.
- The **center** of the image is where mouse inputs are issued.
- The default mouse image is 64x64 pixels, with the mouse taking up 17x24 pixels of space.

##### System Cursors

When using a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]] retrieved from [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|Plugin:GetMouse()]], you can use the following icons similar to your system's default cursors, such as hands, arrows, I-beams, etc. You can use these with GUI events like [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|MouseEnter]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|MouseLeave]], and [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Down|MouseButton1Down]] to provide a consistent Studio experience when interacting with certain kinds of GUI components. Note that these only work for Studio plugins; they will not work for other [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] objects.

| Look* | Asset | Suggested Use |
| --- | --- | --- |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Arrow` | Default clicking and selection. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/PointingHand` | Hovering over an active link/button. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/OpenHand` | Hovering over a draggable item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/ClosedHand` | Dragging an item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/IBeam` | Hovering in a text field. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNS` | Hovering over a vertical resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeEW` | Hovering over a horizontal resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNESW` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNWSE` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeAll` | Hovering over a multi-direction resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitNS` | Hovering over a vertical "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitEW` | Hovering over a horizontal "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Forbidden` | Hovering over a locked/forbidden item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Wait` | Indicating an action is in progress. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Busy` | Indicating the system is busy. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Cross` | Hovering over a pinpoint selection area. |

** These appearances are approximations — the actual look is dependent on your operating system.*

*Code samples for this member (`dragon-mouse-icon`) are published on the source page; their code is not part of the open-source repo.*

### IconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

**Icon** is a property that determines the image used as the pointer. If blank, a default arrow is used. While the cursor hovers over a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], this property is temporarily ignored. This property only supports asset URIs.

To hide the cursor entirely, **do not** use a transparent image – instead, set [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|UserInputService.MouseIconEnabled]] to false.

For getting/setting the user mouse icon in experiences, you should use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIcon|UserInputService.MouseIcon]]. [[30 Official Roblox Docs/API Reference/Classes/Mouse#Icon|Mouse.Icon]] will be deprecated after the new API for plugins to set the mouse cursor is released.

##### Designing a Cursor

The following guidelines may prove useful when creating your own mouse cursors:

- The dimensions of the image used determines the size of the cursor.
- The dimensions of the image should not exceed 256 pixels on any axis.
- The **center** of the image is where mouse inputs are issued.
- The default mouse image is 64x64 pixels, with the mouse taking up 17x24 pixels of space.

##### System Cursors

When using a [[30 Official Roblox Docs/API Reference/Classes/PluginMouse|PluginMouse]] retrieved from [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetMouse|Plugin:GetMouse()]], you can use the following icons similar to your system's default cursors, such as hands, arrows, I-beams, etc. You can use these with GUI events like [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|MouseEnter]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|MouseLeave]], and [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Down|MouseButton1Down]] to provide a consistent Studio experience when interacting with certain kinds of GUI components. Note that these only work for Studio plugins; they will not work for other [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] objects.

| Look* | Asset | Suggested Use |
| --- | --- | --- |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Arrow` | Default clicking and selection. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/PointingHand` | Hovering over an active link/button. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/OpenHand` | Hovering over a draggable item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/ClosedHand` | Dragging an item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/IBeam` | Hovering in a text field. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNS` | Hovering over a vertical resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeEW` | Hovering over a horizontal resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNESW` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNWSE` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeAll` | Hovering over a multi-direction resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitNS` | Hovering over a vertical "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitEW` | Hovering over a horizontal "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Forbidden` | Hovering over a locked/forbidden item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Wait` | Indicating an action is in progress. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Busy` | Indicating the system is busy. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Cross` | Hovering over a pinpoint selection area. |

** These appearances are approximations — the actual look is dependent on your operating system.*

*Code samples for this member (`dragon-mouse-icon`) are published on the source page; their code is not part of the open-source repo.*

### Origin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

The origin [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] property is a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] indicating where the mouse originated from. It is positioned at the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] and oriented toward the mouse's 3D position.

[[30 Official Roblox Docs/API Reference/Classes/Mouse#UnitRay|Mouse.UnitRay]] starts at the same position as Origin, and extends for a stud in the same direction.

```lua
local unitRay = mouse.UnitRay
local origin = mouse.Origin
-- unitRay.Direction = origin.p
-- unitRay.Direction ≈ origin.lookVector
```

For the position of the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] in 3D space, see [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]].

*Code samples for this member (`mouse-origin-v-mouse-hit`) are published on the source page; their code is not part of the open-source repo.*

### Target

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

The object in 3D space the [[30 Official Roblox Docs/API Reference/Classes/Mouse|mouse]] is pointing to.

Note:

- If [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetFilter|Mouse.TargetFilter]] has been set, the target filter and its descendants will be ignored.
- When the mouse is not pointing at a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], for example when it is pointing at the sky, Target will be `nil`.
- Developers looking for the position of the mouse in 3D space should use [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]].

*Code samples for this member (`Mouse-Button1Down`) are published on the source page; their code is not part of the open-source repo.*

### target

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Mouse.Target` which should
> be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

### TargetFilter

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines an object to be ignored by the mouse when calculating [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]]. The descendants of the object are also ignored, so it is possible to ignore multiple objects so long as they are a descendant of the object to which this property is set. This property is useful when filtering models containing special effects or decorations that should not affect [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]] or [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]].

This property can be set to any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] or `nil`, for example:

```lua
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
mouse.TargetFilter = Workspace.Model
```

Note that the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] of the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] is ignored by the mouse automatically.

### TargetSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] surface at which the mouse is pointing. This property is derived from the world position of mouse ([[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]]) and the part toward which the mouse is pointing ([[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]]).

This property isn't meaningful when the mouse is not pointing at a part, for example when the mouse is pointing at the sky. At the moment, this property is set to 'Right' under these circumstances. Before using this property, check that the mouse's target is not `nil`.

*Code samples for this member (`Mouse-TargetSurface`, `Mouse-TargetSurface-2`) are published on the source page; their code is not part of the open-source repo.*

### UnitRay

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

The UnitRay property is a [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] directed toward the mouse's position in 3D space (described by [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]]). It originates from the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Like all unit rays, it has a distance of 1.

*Code samples for this member (`Mouse-UnitRay`) are published on the source page; their code is not part of the open-source repo.*

### ViewSizeX

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

The ViewSizeX property describes the horizontal component of the game window's size in pixels.

*Code samples for this member (`normalized-mouse-position`) are published on the source page; their code is not part of the open-source repo.*

### ViewSizeY

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

The ViewSizeY property describes the vertical component of the game window's size in pixels. This length includes the space used by the topbar.

*Code samples for this member (`normalized-mouse-position`) are published on the source page; their code is not part of the open-source repo.*

### X

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

When detecting changes in the mouse's position on-screen, it is recommended that you use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|ContextActionService:BindAction()]] with [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseMovement]] or [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|UserInputService.InputChanged]], which both describe the position of the mouse using the [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] (a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]) of an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]], instead of using this and related properties.

The X property describes the horizontal component of the mouse's position on the screen. The position is measured in pixels relative to the top left corner, under the topbar. This property can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Mouse#Y|Mouse.Y]] to produce a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] representing the mouse's position:

```lua
local position = Vector2.new(mouse.X, mouse.Y)
```

This property does not fire [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] or the signal returned from [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal]]. Use the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Move|Mouse.Move]] event instead.

*Code samples for this member (`normalized-mouse-position`) are published on the source page; their code is not part of the open-source repo.*

### Y

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

When detecting changes in the mouse's position on-screen, it is recommended that you use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|ContextActionService:BindAction()]] with [[30 Official Roblox Docs/API Reference/Enums/UserInputType|Enum.UserInputType.MouseMovement]] or [[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputChanged|UserInputService.InputChanged]], which both describe the position of the mouse using the [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|Position]] (a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]) of an [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]], instead of using this and related properties.

The Y property describes the vertical component of the mouse's position on the screen. The position is measured in pixels relative to the top left corner, under the topbar. This property can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Mouse#X|Mouse.X]] to produce a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] representing the mouse's position:

```lua
local position = Vector2.new(mouse.X, mouse.Y)
```

This property does not fire [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] or the signal returned from [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal]]. Use the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Move|Mouse.Move]] event instead.

*Code samples for this member (`normalized-mouse-position`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Button1Down

```lua
Mouse.Button1Down()
```

**Capabilities:** Input

This event fires when the player presses their left mouse button. Note that this can be accessed from a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]; for example, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], the code below prints `Button1Down` whenever the left mouse button is pressed.

```lua
local tool = script.Parent  -- Make sure this is a Tool object

tool.Equipped:Connect(function(mouse)
	mouse.Button1Down:Connect(function()
		print("Button1Down")
	end)
end)
```

You can find out the position of the mouse in world space and if it's pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Target]] properties.

### Button1Up

```lua
Mouse.Button1Up()
```

**Capabilities:** Input

This event fires when the player releases their left mouse button. Note that this can be accessed from a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]; for example, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], the code below prints `Button1Up` whenever the left mouse button is released.

```lua
local tool = script.Parent  -- Make sure this is a Tool object

tool.Equipped:Connect(function(mouse)
	mouse.Button1Up:Connect(function()
		print("Button1Up")
	end)
end)
```

You can find out the position of the mouse in world space and if it's pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Target]] properties.

### Button2Down

```lua
Mouse.Button2Down()
```

**Capabilities:** Input

This event fires when the player presses their right mouse button. Note that this can be accessed from a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]; for example, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], the code below prints `Button2Down` whenever the right mouse button is pressed.

```lua
local tool = script.Parent  -- Make sure this is a Tool object

tool.Equipped:Connect(function(mouse)
	mouse.Button2Down:Connect(function()
		print("Button2Down")
	end)
end)
```

You can find out the position of the mouse in world space and if it's pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Target]] properties.

### Button2Up

```lua
Mouse.Button2Up()
```

**Capabilities:** Input

This event fires when the player releases their right mouse button. Note that this can be accessed from a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]; for example, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], the code below prints `Button2Up` whenever the right mouse button is released.

```lua
local tool = script.Parent  -- Make sure this is a Tool object

tool.Equipped:Connect(function(mouse)
	mouse.Button2Up:Connect(function()
		print("Button2Up")
	end)
end)
```

You can find out the position of the mouse in world space and if it's pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Target]] properties.

### Idle

```lua
Mouse.Idle()
```

**Capabilities:** Input

Fired during every heartbeat that the mouse isn't being passed to another mouse event.

Note, this event should not be used to determine when the mouse is still. As it fires every heartbeat it will fire between [[30 Official Roblox Docs/API Reference/Classes/Mouse#Move|Mouse.Move]] events.

For information on how to obtain the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object, please see the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] page.

Developers can find out the position of the mouse in world-space, and if it is pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]] properties.

Note, developers are recommended to use [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] instead of the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object in new work.

*Code samples for this member (`Mouse-Idle1`) are published on the source page; their code is not part of the open-source repo.*

### KeyDown

> [!warning] Deprecated
> Mouse events have been superseded by `Class.UserInputService` which should
> be used in all new work.

```lua
Mouse.KeyDown(key: string)
```

**Capabilities:** Input · **Tags:** `Deprecated`

This event fires when a Key is pressed, with the passed argument being the key that was pressed.

Note:

- Not all keys generate this event. However, you can get around this with a few of the keys, "/" for example, by using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#KeyUp|Mouse.KeyUp]] event.
- Some keys generate the same string as other keys.
- It's possible for the string to be empty (possibly due to "\0" key code).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

*Code samples for this member (`Mouse-KeyDown1`) are published on the source page; their code is not part of the open-source repo.*

### keyDown

> [!warning] Deprecated
> This event is a deprecated variant of `Class.Mouse.KeyDown` which has also
> been deprecated. Neither event should be used in new work.

```lua
Mouse.keyDown(key: string)
```

**Capabilities:** Input · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

### KeyUp

> [!warning] Deprecated
> Mouse events have been superseded by `Class.UserInputService` which should
> be used in all new work.

```lua
Mouse.KeyUp(key: string)
```

**Capabilities:** Input · **Tags:** `Deprecated`

This event is fired when a Key is released, with the passed argument being the key that was released.

Note:

- Not all keys generate this event. However, you can get around this with a few of the keys, "/" for example, by using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#KeyUp|KeyUp]] event.
- Some keys generate the same string as other keys.
- It's possible for the string to be empty (possibly due to "\0" key code).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

*Code samples for this member (`Mouse-KeyUp1`) are published on the source page; their code is not part of the open-source repo.*

### Move

```lua
Mouse.Move()
```

**Capabilities:** Input

Fired when the mouse is moved.

Note, this event is fired when the mouse's position is updated, therefore it will fire repeatedly while being moved.

For information on how to obtain the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object, please see the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] page.

Developers can find out the position of the mouse in world-space, and if it is pointing at any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] using the [[30 Official Roblox Docs/API Reference/Classes/Mouse#Hit|Mouse.Hit]] and [[30 Official Roblox Docs/API Reference/Classes/Mouse#Target|Mouse.Target]] properties.

```
mouse.Move:Connect(function()
	local position = mouse.Hit.p
	local target = mouse.Target
	print(target, position)
end)
```

Note, developers are recommended to use [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] instead of the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object in new work.

*Code samples for this member (`move-parts-with-the-mouse`) are published on the source page; their code is not part of the open-source repo.*

### WheelBackward

```lua
Mouse.WheelBackward()
```

**Capabilities:** Input

The WheelBackward event fires when the mouse wheel is scrolled backwards. Possible uses for this event include toggling a gun's scope in a first person shooter (FPS) or zooming the player's camera.

This can be used alongside the scrolling forward event, [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelForward|Mouse.WheelForward]].

For information on how to obtain the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object, please see the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] page.

Note, developers are recommended to use [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] instead of the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object in new work.

*Code samples for this member (`Mouse-WheelBackward1`) are published on the source page; their code is not part of the open-source repo.*

### WheelForward

```lua
Mouse.WheelForward()
```

**Capabilities:** Input

The WheelForward event fires when the mouse wheel is scrolled forwards. Possible uses for this event include toggling a gun's scope in a first person shooter (FPS) or zooming the player's camera.

This can be used alongside the scrolling backward event, [[30 Official Roblox Docs/API Reference/Classes/Mouse#WheelBackward|Mouse.WheelBackward]].

For information on how to obtain the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object, please see the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] page.

Note, developers are recommended to use [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] instead of the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] object in new work.

*Code samples for this member (`Mouse-WheelForward1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Mouse](https://create.roblox.com/docs/reference/engine/classes/Mouse) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
