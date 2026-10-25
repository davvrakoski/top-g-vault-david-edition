---
title: "Camera"
description: "A class which defines a view of the 3D world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Camera"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A class which defines a view of the 3D world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

The `Camera` object defines a view of the 3D world. In a running experience, each client has its own `Camera` object which resides in that client's local [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], accessible through the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] property.

The most important camera properties are:

- [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] which represents the position and orientation of the camera.

- [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] which is read by the experience's camera scripts and determines how the camera should update each frame.

- [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|CameraSubject]] which is read by the experience's camera scripts and determines what object the camera should follow.

- [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|FieldOfView]] which represents the visible extent of the observable world.

- [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] which represents the point the camera is looking at. It's important this property is set, as certain visuals will be more detailed and will update more frequently depending on how close they are to the focus point.

See [[30 Official Roblox Docs/Workspace/Camera/Customize the camera|Customizing the Camera]] for more information on how to adjust and customize the camera's behavior.

#### Storing Multiple Cameras

Note that when changing [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] to a new [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], all other [[30 Official Roblox Docs/API Reference/Classes/Camera|Cameras]] directly descending from [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] will be destroyed. If you need to store multiple cameras and swap between them on demand, it's recommended that you store them in a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] under [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], inside which they will remain even when [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]] is changed.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject\|CameraSubject]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that is the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] subject. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType\|CameraType]] | [[30 Official Roblox Docs/API Reference/Enums/CameraType\|CameraType]] | Specifies the [[30 Official Roblox Docs/API Reference/Enums/CameraType\|Enum.CameraType]] to be read by the camera scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]], defining its position and orientation in the 3D world. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CoordinateFrame\|CoordinateFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#DiagonalFieldOfView\|DiagonalFieldOfView]] | float | Sets the angle of the camera's diagonal field of view. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView\|FieldOfView]] | float | Sets the angle of the camera's vertical field of view. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfViewMode\|FieldOfViewMode]] | [[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode\|FieldOfViewMode]] | Determines the FOV value of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] that's invariant under viewport size changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Sets the area in 3D space that is prioritized by Roblox's graphical systems. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|focus]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadLocked\|HeadLocked]] | boolean | Toggles whether the camera will automatically track the head motion of a player using a VR device. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale\|HeadScale]] | float | Sets the scale of the user's perspective of the world when using VR. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#MaxAxisFieldOfView\|MaxAxisFieldOfView]] | float | Sets the angle of the camera's field of view along the longest viewport axis. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#NearPlaneZ\|NearPlaneZ]] | float | Describes the negative **Z** offset, in studs, of the camera's near clipping plane. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize\|ViewportSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The dimensions of the device safe area on a Roblox client. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#VRTiltAndRollEnabled\|VRTiltAndRollEnabled]] | boolean | Toggles whether to apply tilt and roll from the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] property while the player is using a VR device. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetLargestCutoffDistance\|GetLargestCutoffDistance()]] | float | **Deprecated.** Returns how much the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] needs to be pushed towards its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] in order to make sure there is no obstructions between the [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetPanSpeed\|GetPanSpeed()]] | float | **Deprecated.** Returns the current 'pan' speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetPartsObscuringTarget\|GetPartsObscuringTarget()]] | Instances | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] that are obscuring the lines of sight between the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] and the cast points. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame\|GetRenderCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the actual [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]where the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] is being rendered, accounting for any roll applied and the impact of VR devices. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRoll\|GetRoll()]] | float | **Deprecated.** Returns in radians the current roll, or rotation around the camera's Z-axis, applied to the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] using [[30 Official Roblox Docs/API Reference/Classes/Camera#SetRoll\|SetRoll()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#GetTiltSpeed\|GetTiltSpeed()]] | float | **Deprecated.** Returns the current tilt speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#Interpolate\|Interpolate()]] | () | **Deprecated.** Tweens the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] in a linear fashion towards a new [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] over a given duration. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#PanUnits\|PanUnits()]] | () | **Deprecated.** Pans the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] around the [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] in 45 degree increments around the **Y** axis. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#ScreenPointToRay\|ScreenPointToRay()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | Creates a unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] from a position on the screen (in pixels), at a set depth from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] orientated in the camera's direction. Accounts for the GUI inset. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#SetCameraPanMode\|SetCameraPanMode()]] | () | **Deprecated.** Sets the [[30 Official Roblox Docs/API Reference/Enums/CameraPanMode\|Enum.CameraPanMode]] to be used by the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] on mobile devices. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#SetRoll\|SetRoll()]] | () | **Deprecated.** Sets the current rotation applied around the camera's Z-axis. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#TiltUnits\|TiltUnits()]] | boolean | **Deprecated.** Tilts the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] around its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] in 10 degree increments around the camera's **X** axis. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportPointToRay\|ViewportPointToRay()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | Creates a unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] from a position on the viewport (in pixels), at a given depth from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]], orientated in the camera's direction. Does not account for the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|CoreUISafeInsets]] inset. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#WorldToScreenPoint\|WorldToScreenPoint()]] | Tuple | Returns the screen location and depth of a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] `worldPoint` and whether this point is within the bounds of the screen. Accounts for the GUI inset. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#WorldToViewportPoint\|WorldToViewportPoint()]] | Tuple | Returns the screen location and depth of a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] `worldPoint` and whether this point is within the bounds of the screen. Does not account for the GUI inset. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#ZoomToExtents\|ZoomToExtents()]] | () | Adjusts the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] so that the specified bounding box is fully visible within the camera's viewport. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#InterpolationFinished\|InterpolationFinished]] |  | **Deprecated.** Fired when the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] has finished interpolating using[[30 Official Roblox Docs/API Reference/Classes/Camera#Interpolate\|Interpolate()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CameraSubject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Basic

`CameraSubject` accepts a variety of [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]]. The default camera scripts respond differently to the available settings:

- By default, the camera scripts follow the local character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], factoring in the humanoid's current state and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#CameraOffset|Humanoid.CameraOffset]].

- When set to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the camera scripts follow its position, with a vertical offset in the case of [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeats]].

`CameraSubject` cannot be set to `nil`. Attempting to do so will revert it to its previous value.

To restore `CameraSubject` to its default value, set it to the local character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]:

*Code samples for this member (`Camera-CameraSubject`) are published on the source page; their code is not part of the open-source repo.*

### CameraType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CameraType|CameraType]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Basic

The default Roblox camera scripts have several built-in behaviors. Setting this property toggles between the various [[30 Official Roblox Docs/API Reference/Enums/CameraType|Enum.CameraType]] behaviors. Note that some camera types require a valid [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|CameraSubject]] to work correctly.

The default camera scripts will not move or update the camera if `CameraType` is set to [[30 Official Roblox Docs/API Reference/Enums/CameraType|Enum.CameraType.Scriptable]]. For more information on positioning and orienting the camera manually, see [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]].

For all `CameraType` settings **except** [[30 Official Roblox Docs/API Reference/Enums/CameraType|Enum.CameraType.Scriptable]], the [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|CameraSubject]] property represents the object whose position the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] is set to.

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property is the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], defining its position and orientation in the 3D world. Note that some transformations, such as the rotation of the head when using VR devices, are not reflected in this property, so you should use [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame|GetRenderCFrame()]] to obtain the "true" [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the camera.

You can move the camera by setting this property. However, the default camera scripts also set it, so you should either:

- Set the camera [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] to [[30 Official Roblox Docs/API Reference/Enums/CameraType|Enum.CameraType.Scriptable]] so that the default camera scripts will not update the camera's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. This method is simplest and recommended in most cases.

- Completely replace the default camera scripts with alternatives. This approach is only recommended if you do not need any default camera functionality.

The most intuitive way to position and orient the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is by using the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#lookAt|CFrame.lookAt()]] constructor. In the following example, the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is positioned at `Datatype.Vector3.new(0, 10, 0)` and is oriented to be looking towards `Datatype.Vector3.new(10, 0, 0)`.

```lua
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable

local pos = Vector3.new(0, 10, 0)
local lookAtPos = Vector3.new(10, 0, 0)

camera.CFrame = CFrame.lookAt(pos, lookAtPos)
```

Although the camera can be placed in the manner demonstrated above, you may want to animate it to move smoothly from one [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] to another. For this, you can either:

- Set the camera's position/orientation every frame with [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]] and the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Lerp|CFrame:Lerp()]] method.
- Create and play a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] that animates the position/orientation of the camera:

  ```lua
  local Players = game:GetService("Players")
  local TweenService = game:GetService("TweenService")

  local camera = workspace.CurrentCamera
  camera.CameraType = Enum.CameraType.Scriptable

  local player = Players.LocalPlayer
  local character = player.Character
  if not character or character.Parent == nil then
  	character = player.CharacterAdded:Wait()
  end

  local pos = camera.CFrame * Vector3.new(0, 20, 0)
  local lookAtPos = character.PrimaryPart.Position
  local targetCFrame = CFrame.lookAt(pos, lookAtPos)

  local tween = TweenService:Create(camera, TweenInfo.new(2), {CFrame = targetCFrame})

  tween:Play()
  ```

### CoordinateFrame

> [!warning] Deprecated
> This item has been superseded by `Class.Camera.CFrame` which should be
> used in all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

The old version of the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property which functions identically to it.

This item should be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in order to work as expected online.

### DiagonalFieldOfView

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Sets how many degrees in the diagonal direction (from one corner of the viewport to its opposite corner) the camera can view. See [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|FieldOfView]] for a more general explanation of field of view.

Note that `DiagonalFieldOfView` represents the field of view that is visible by the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] rendering into the fullscreen area which may be occluded by notches or screen cutouts on some devices. See [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize|ViewportSize]] for more information.

### FieldOfView

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Basic

The `FieldOfView` (FOV) property sets how many degrees in the vertical direction the camera can view. This property is clamped between `1` and `120` degrees and defaults at `70`. Very low or very high fields of view are not recommended as they can be disorientating to players.

Note that uniform scaling is enforced, meaning the vertical and horizontal field of view are always related by the aspect ratio of the screen.

Suggested uses for `FieldOfView` include:

- Reducing FOV to give the impression of magnification, for example when using binoculars.
- Increasing FOV when the player is "sprinting" to give the impression of a lack of control.

Note that `FieldOfView` represents the field of view that is visible by the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] rendering into the fullscreen area which may be occluded by notches or screen cutouts on some devices. See [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize|ViewportSize]] for more information.

### FieldOfViewMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode|FieldOfViewMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Basic

The camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|FieldOfView]] (FOV) must be updated to reflect [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize|ViewportSize]] changes. The value of `FieldOfViewMode` determines which FOV value will be kept constant.

For example, when this property is set to [[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode|Enum.FieldOfViewMode.Vertical]], the horizontal FOV is updated when the viewport is resized, but the vertical FOV is kept constant. If this property is set to [[30 Official Roblox Docs/API Reference/Enums/FieldOfViewMode|Enum.FieldOfViewMode.Diagonal]], both horizontal and vertical FOV might be changed to keep the diagonal FOV constant.

### Focus

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Certain graphical operations the engine performs, such as updating lighting, can take time or computational effort to complete. The camera's `Focus` property tells the engine which area in 3D space to prioritize when performing such operations. For example, dynamic lighting from objects such as [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLights]] may not render at distances far from the focus.

The default Roblox camera scripts automatically set `Focus` to follow the [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|CameraSubject]] (usually a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]). However, `Focus` will **not** automatically update when [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] is set to [[30 Official Roblox Docs/API Reference/Enums/CameraType|Enum.CameraType.Scriptable]] or when the default camera scripts are not being used. In these cases, you should update `Focus` every frame, using [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]] method at the [[30 Official Roblox Docs/API Reference/Enums/RenderPriority|Enum.RenderPriority.Camera]] priority.

`Focus` has no bearing on the position or orientation of the camera; see [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] for this.

### focus

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Camera.Focus|Focus` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

### HeadLocked

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Toggles whether the camera will automatically track the head motion of a player using a VR device. When `true` (default), the engine combines [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] with the [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] of the user's head to render the player's view with head tracking factored in. The view will be rendered at the following [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]:

```lua
local UserInputService = game:GetService("UserInputService")

local camera = workspace.CurrentCamera

local headCFrame = UserInputService:GetUserCFrame(Enum.UserCFrame.Head)
headCFrame = headCFrame.Rotation + headCFrame.Position * camera.HeadScale

-- This will be equivalent to Camera:GetRenderCFrame()
local renderCFrame = camera.CFrame * headCFrame
```

It is recommended to **not** disable this property for the following reasons:

- Players may experience motion sickness if an equivalent head tracking solution is not added.
- The Roblox Engine performs latency optimizations when `HeadLocked` is true.

##### See Also

- [[30 Official Roblox Docs/API Reference/Classes/VRService#GetUserCFrame|VRService:GetUserCFrame()]] which can be used to obtain the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the head.
- [[30 Official Roblox Docs/API Reference/Classes/VRService#RecenterUserHeadCFrame|VRService:RecenterUserHeadCFrame()]] which is used to recenter the head to the current position and orientation of the VR device.
- The [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame|GetRenderCFrame()]] method which returns the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] combined with the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the user's head.

### HeadScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

`HeadScale` is the scale of the user's perspective of the world when using VR.

The size of 1 stud in VR is `0.3 meters / HeadScale`, meaning that larger `HeadScale` values equate to the world looking smaller from the user's perspective when using VR devices. For example, a part that's 1 stud tall appears to be 0.6 meters tall to a VR player with a `HeadScale` of `0.5`.

This property is automatically controlled by [[30 Official Roblox Docs/API Reference/Classes/VRService#AutomaticScaling|VRService.AutomaticScaling]] to align the player's perspective with the size of their avatar. If you intend to control `HeadScale` yourself or use custom characters, toggle [[30 Official Roblox Docs/API Reference/Classes/VRService#AutomaticScaling|VRService.AutomaticScaling]] to [[30 Official Roblox Docs/API Reference/Enums/VRScaling|Enum.VRScaling.Off]].

This property should not be confused with [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid.HeadScale]] which is a [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] parented to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to control its scaling.

### MaxAxisFieldOfView

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

The `MaxAxisFieldOfView` property sets how many degrees along the longest viewport axis the camera can view.

When the longest axis is the vertical axis, this property will behave similar to the [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|FieldOfView]] property. This is generally the case when a device is in a portrait orientation. In a landscape orientation, the longest axis will be the horizontal axis; in this case, the property describes the horizontal field of view of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

### NearPlaneZ

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The `NearPlaneZ` property describes how far away the camera's near clipping plane is, in studs. The near clipping plane is a geometric plane that sits in front of the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]]. Anything between this plane and the camera will not render, creating a cutaway view when viewing objects at very short distances. The value of `NearPlaneZ` varies across different platforms and is currently always between `-0.1` and `-0.5`.

*(image in the full Top G Vault)*

### ViewportSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

`ViewportSize` returns the dimensions of the device safe area on the current screen. This area is a rectangle which includes the Roblox top bar area but does not include any device notches or screen cutouts. The units of `ViewportSize` are Roblox UI offset units which may be different from native display pixels.

*(image in the full Top G Vault)*

As noted above, `ViewportSize` is not equal to the fullscreen area size on displays with cutouts or notches. To obtain the fullscreen area size on all displays, you can query the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]] property of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] with [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] set to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|None]]. See [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets]] for a more information about how screen areas are defined.

Finally, note that `ViewportSize` is not the actual viewport size the camera uses for rendering (the camera renders in the fullscreen area). Also, the [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView|FieldOfView]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#DiagonalFieldOfView|DiagonalFieldOfView]] properties are based on the fullscreen area, not `ViewportSize`.

##### Camera Updates

Only the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] currently referred to by [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] has its `ViewportSize` updated each frame during the [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]] step. The `ViewportSize` of all other cameras in your experience won't be updated, including those used for [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrames]].

### VRTiltAndRollEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property toggles whether to apply tilt and roll from the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property while the player is using a VR device.

To prevent motion sickness, the horizon should remain level. Tilting and rolling the player's view while using a VR device can cause a disconnect between the player's physical space and the virtual space they are viewing. Changing the apparent downwards direction can cause players to lose balance or experience dizziness.

For these reasons, it is generally advisable to leave this property disabled, unless you have extensively tested your experience for these effects. Even with tilt and roll enabled, you may want to ensure the player always has a stable reference frame, such as the interior of a vehicle or a floor that can help the player ground themselves in their physical space.

## Methods

### GetLargestCutoffDistance

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
Camera:GetLargestCutoffDistance(ignoreList: Instances): float
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method is used by `PopperCam` in the default camera scripts to ensure obstructions do not come between the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] and its subject.

This method will check all [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] with the following exceptions:

- Any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] specified in the `ignoreList` (including its descendants) will be ignored
- [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] set to false are ignored
- [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] with a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|BasePart.Transparency]] greater than 0.95 will be ignored Water [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] is ignored

Note, as this method requires an `ignoreList` to run, you should pass an empty table when none is required.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ignoreList` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] to ignore. Descendants of these instances will also be ignored. |

**Returns**

| Type | Description |
| --- | --- |
| float | The distance, in studs, that the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] needs to be pushed towards its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] to ensure there are no obstructions between the [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

### GetPanSpeed

> [!warning] Deprecated
> This method has been deprecated and no longer works. It should not be used
> in new work.

```lua
Camera:GetPanSpeed(): float
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method is broken and should not be used.

This method returns the current pan speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

The pan speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] describes the speed at which the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is rotating around its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] around the **Y** axis.

**Returns**

| Type | Description |
| --- | --- |
| float | The speed at which the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] is rotating around its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] on the **Y** axis. |

### GetPartsObscuringTarget

```lua
Camera:GetPartsObscuringTarget(castPoints: Array, ignoreList: Instances): Instances
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that are obscuring the lines of sight between the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] and [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] positions in the `castPoints` array. Any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] included in the `ignoreList` array will be ignored, along with their descendants.

The `castPoints` parameter is given as an array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] positions. Note that the array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] returned is in an arbitrary order, and no additional raycast data is provided. If you need data such as hit position, hit material, or surface normal, you should opt for the [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] method.

```lua
local camera = workspace.CurrentCamera

local castPoints = {
	Vector3.new(0, 10, 0),
	Vector3.new(0, 15, 0)
}
local ignoreList = {}

local partsObscuringTarget = camera:GetPartsObscuringTarget(castPoints, ignoreList)
```

If [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] obscures a cast point, [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] obscuring the cast point between the obscuring [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] and the cast point will not be returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `castPoints` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] positions of cast points. |
| `ignoreList` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] that should be ignored, along with their descendants. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] that obscure the lines of sight between the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] and the `castPoints`. |

### GetRenderCFrame

```lua
Camera:GetRenderCFrame(): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns the actual [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] as it is rendered, including the impact of VR (VR head transformations are not applied to the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property, so it is best practice to use [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame|GetRenderCFrame()]] to obtain the "true" [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of a player's view).

For example, when using VR, the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is actually rendered at the following [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]:

```lua
local UserInputService = game:GetService("UserInputService")

local camera = workspace.CurrentCamera

local headCFrame = UserInputService:GetUserCFrame(Enum.UserCFrame.Head)
headCFrame = headCFrame.Rotation + headCFrame.Position * camera.HeadScale
renderCFrame = camera.CFrame * headCFrame
```

The camera's render [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] will only be changed to account for the head when the [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadLocked|HeadLocked]] property is true.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] is being rendered at. |

### GetRoll

> [!warning] Deprecated
> This method has been deprecated.

```lua
Camera:GetRoll(): float
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method returns, in radians, the current roll applied to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] using [[30 Official Roblox Docs/API Reference/Classes/Camera#SetRoll|SetRoll()]]. Roll is defined as rotation around the camera's Z-axis.

This method only returns roll applied using the [[30 Official Roblox Docs/API Reference/Classes/Camera#SetRoll|SetRoll()]] method. Roll manually applied to the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] is not accounted for. To obtain the actual roll of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], including roll manually applied, you can use the following snippet:

**Returns**

| Type | Description |
| --- | --- |
| float | The current roll applied by [[30 Official Roblox Docs/API Reference/Classes/Camera#SetRoll\|SetRoll()]], in radians. |

*Code samples for this member (`Camera-GetRoll1`, `Camera-GetRoll`) are published on the source page; their code is not part of the open-source repo.*

### GetTiltSpeed

> [!warning] Deprecated
> This method has been deprecated and no longer works.

```lua
Camera:GetTiltSpeed(): float
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method is broken and should not be used.

This method returns the current tilt speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

The tilt speed of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] describes the speed at which the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is rotating around its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] around the camera's **X** axis.

**Returns**

| Type | Description |
| --- | --- |
| float | The speed at which the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] is rotating around its [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] around the camera's **X** axis. |

### Interpolate

> [!warning] Deprecated
> This method has been deprecated. Instead use `Class.TweenService` to
> smoothly animate the `Class.Camera`, see the code snippets below for an
> example.

```lua
Camera:Interpolate(endPos: CFrame, endFocus: CFrame, duration: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method tweens the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] in a linear fashion towards a new [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] and [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] over a given duration, for example:

```lua
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable

camera:Interpolate(
	CFrame.new(0, 10, 100),
	CFrame.new(0, 0, 100),
	5
)
```

Throughout the tween, the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] will be orientated towards the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]].

When the tween has completed, the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#InterpolationFinished|InterpolationFinished]] event will fire.

If this method is called while the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] is already tweening, the older tween will be stopped (without firing [[30 Official Roblox Docs/API Reference/Classes/Camera#InterpolationFinished|InterpolationFinished]]) and overridden by the new tween.

Interpolate can only be used if the current [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] is `Scriptable`, regardless of whether the default camera scripts are being used. If it is used with any other [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] an error will be thrown.

You are advised to use [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] to tween the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] instead as it is more reliable and offers a variety of easing styles. See below for an example:

```lua
local TweenService = game:GetService("TweenService")

local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Scriptable

local tween = TweenService:Create(
	camera,
	TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{
		CFrame = CFrame.new(0, 10, 100),
		Focus = CFrame.new(0, 0, 100)
	}
)

tween:Play()
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `endPos` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] to tween to. |
| `endFocus` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Focus]] to tween to. |
| `duration` | float |  | The duration, in seconds, of the tween. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PanUnits

> [!warning] Deprecated
> This method was used for legacy camera controls and has since been
> deprecated. Do not use in new work.

```lua
Camera:PanUnits(units: int): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method pans the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] around the [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] in 45 degree increments around the **Y** axis.

The rotation is applied to the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property.

This method pans the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] in 45 degree increments, for example:

```lua
workspace.CurrentCamera:PanUnits(1) -- 45 degrees
workspace.CurrentCamera:PanUnits(-2) -- -90 degrees
```

PanUnits does not require the [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] to be `Scriptable`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `units` | int |  | The number of 45 degree increments by which to pan the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ScreenPointToRay

```lua
Camera:ScreenPointToRay(x: float, y: float, depth: float = 0): Ray
```

**Thread safety:** Safe · **Capabilities:** Basic

This method creates a unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] from a 2D position on the screen (defined in pixels), accounting for the GUI inset. The [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] originates from the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] equivalent of the 2D position in the world at the given depth (in studs) away from the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

As this method acknowledges the GUI inset, the offset applied to GUI elements (such as from the top bar) is accounted for. This means the screen position specified will start in the top left corner below the top bar. For an otherwise identical method that does not account for the GUI offset, use [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportPointToRay|ViewportPointToRay()]].

As the [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] created is a unit ray, it is only one stud long. To create a longer ray, you can do the following:

```lua
local camera = workspace.CurrentCamera
local length = 500
local unitRay = camera:ScreenPointToRay(100, 100)
local extendedRay = Ray.new(unitRay.Origin, unitRay.Direction * length)
```

This method only works for the current [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] camera. Other cameras, such as those you create for a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], have an initial viewport size of

`(1, 1)`

 and are only updated after you set them to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. The mismatch in viewport size causes the camera to return a ray with an incorrect [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Direction|Ray.Direction]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | float |  | The position on the **X** axis, in pixels, of the screen point at which to originate the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. This position accounts for the GUI inset. |
| `y` | float |  | The position on the **Y** axis, in pixels, of the screen point at which to originate the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. This position accounts for the GUI inset. |
| `depth` | float | `0` | The depth from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]], in studs, from which to offset the origin of the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | A unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]], originating from the equivalent [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] world position of the given screen coordinates at the given depth away from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. This ray is orientated in the direction of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

### SetCameraPanMode

> [!warning] Deprecated
> This method has been deprecated and should not be used in new work.

```lua
Camera:SetCameraPanMode(mode: CameraPanMode = Classic): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method sets the [[30 Official Roblox Docs/API Reference/Enums/CameraPanMode|Enum.CameraPanMode]] to be used by the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] on mobile devices.

When the \*'EdgeBump' [[30 Official Roblox Docs/API Reference/Enums/CameraPanMode|Enum.CameraPanMode]] is used, swipe to pan is disabled and the edge bump camera controls are enabled.

SetCameraPan mode has no effect on Windows or Mac users.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | [[30 Official Roblox Docs/API Reference/Enums/CameraPanMode\|CameraPanMode]] | `Classic` | The [[30 Official Roblox Docs/API Reference/Enums/CameraPanMode\|Enum.CameraPanMode]] to set the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetRoll

> [!warning] Deprecated
> This method has been deprecated. Instead use the
> `Class.Camera.CFrame|CFrame` property to 'roll' the `Class.Camera`.

```lua
Camera:SetRoll(rollAngle: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method is outdated and no longer considered best practice.

This method sets the current roll, in radians, of the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]. The roll is applied after the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] and represents the rotation around the camera's Z-axis.

For example, the following would invert the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]:

```lua
workspace.CurrentCamera:SetRoll(math.pi) -- math.pi radians = 180 degrees
```

SetRoll has no effect on any roll applied using the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property. Roll applied using SetRoll is not reflected in the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property but is reflected in the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] returned by[[30 Official Roblox Docs/API Reference/Classes/Camera#GetRenderCFrame|GetRenderCFrame()]].

This method can only be used when the [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] is set to `Scriptable`, regardless of whether the default camera scripts are being used. If it is used with any other [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] a warning is given in the output.

Any roll applied using this method will be lost when the [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] is changed from `Scriptable`.

To obtain the roll set using this method use [[30 Official Roblox Docs/API Reference/Classes/Camera#GetRoll|GetRoll()]].

As this method is outdated, you are advised to instead apply roll to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] using the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property. For example:

```lua
local currentCFrame = workspace.CurrentCamera.CFrame
local rollCFrame = CFrame.Angles(0, 0, roll)
workspace.CurrentCamera.CFrame = currentCFrame * rollCFrame
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rollAngle` | float |  | The roll angle, in radians, to be applied to the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### TiltUnits

> [!warning] Deprecated
> This method was used for legacy camera controls and has been deprecated.
> Do not use in new work.

```lua
Camera:TiltUnits(units: int): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This method tilts the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] by rotating it around the [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus|Focus]] around the camera's **X** axis by a given multiple of 10 degrees.

The rotation is applied to the camera's [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] property and is constrained between `-81.05` and `81.05` degrees.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `units` | int |  | The number of 10 degree units by which to tilt the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] tilt applied was constrained. |

### ViewportPointToRay

```lua
Camera:ViewportPointToRay(x: float, y: float, depth: float = 0): Ray
```

**Thread safety:** Safe · **Capabilities:** Basic

This method creates a unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] from a 2D position in device safe viewport coordinates, defined in pixels. The ray originates from the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] equivalent of the 2D position in the world at the given depth (in studs) away from the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

As illustrated below, `(0, 0)` corresponds to the top‑left point of the Roblox top bar. This means that the input 2D position does **not** account for the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] inset, but it does account for any [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]].

*(image in the full Top G Vault)*

Note that UI instances use a different coordinate system ([[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|GuiObject.AbsolutePosition]] uses the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] viewport coordinate system while this method uses the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]] viewport coordinate system). If you would like to specify position in core UI coordinates, please use [[30 Official Roblox Docs/API Reference/Classes/Camera#ScreenPointToRay|ScreenPointToRay()]].

Also note that this method only works for the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] camera. Other cameras, such as those you create for a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], have an initial viewport size of `(1, 1)` and are only updated after you set them to [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]]. The mismatch in viewport size causes the camera to return a ray with an incorrect [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Direction|Ray.Direction]].

This method can be used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize|ViewportSize]] property to create a ray from the centre of the screen, for example:

```lua
local camera = workspace.CurrentCamera

local viewportPoint = camera.ViewportSize / 2
local unitRay = camera:ViewportPointToRay(viewportPoint.X, viewportPoint.Y, 0)
```

As the [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] created is a unit ray, it is only one stud long. To create a longer ray, you can do the following:

```lua
local camera = workspace.CurrentCamera

local length = 500
local viewportPoint = camera.ViewportSize / 2
local unitRay = camera:ViewportPointToRay(viewportPoint.X, viewportPoint.Y, 0)
local extendedRay = Ray.new(unitRay.Origin, unitRay.Direction * length)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | float |  | The position on the **X** axis, in pixels, of the viewport point at which to originate the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]], in device safe area coordinates. |
| `y` | float |  | The position on the **Y** axis, in pixels, of the viewport point at which to originate the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]], in device safe area coordinates. |
| `depth` | float | `0` | The depth from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]], in studs, from which to offset the origin of the [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] | A unit [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]], originating from the equivalent [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] world position of the given viewport coordinates at the given depth away from the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. This ray is orientated in the direction of the [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]]. |

### WorldToScreenPoint

```lua
Camera:WorldToScreenPoint(worldPoint: Vector3): Tuple
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns the screen location and depth of a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] `worldPoint` and whether this point is within the bounds of the screen.

This method takes in account the current GUI inset, such as the space occupied by the top bar, meaning that the 2D position returned is in the same term as GUI positions and can be used to place GUI elements. For an otherwise identical method that ignores the GUI inset, see [[30 Official Roblox Docs/API Reference/Classes/Camera#WorldToViewportPoint|WorldToViewportPoint()]].

```lua
local camera = workspace.CurrentCamera

local worldPoint = Vector3.new(0, 10, 0)
local vector, onScreen = camera:WorldToScreenPoint(worldPoint)

local screenPoint = Vector2.new(vector.X, vector.Y)
local depth = vector.Z
```

Note this method does not perform any raycasting and the boolean indicating whether `worldPoint` is within the bounds of the screen will be `true` regardless of whether the point is obscured by [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `worldPoint` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] world position. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] whose **X** and **Y** components represent the offset of the `worldPoint` from the top left corner of the screen, in pixels. The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] **Z** component represents the depth of the `worldPoint` from the screen (in studs).<br><br>- A boolean indicating if the `worldPoint` is within the bounds of the screen. |

### WorldToViewportPoint

```lua
Camera:WorldToViewportPoint(worldPoint: Vector3): Tuple
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns the screen location and depth of a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] `worldPoint` and whether this point is within the bounds of the screen.

This method does not take in account the current GUI inset, such as the space occupied by the top bar, meaning that the 2D position returned is taken from the top left corner of the viewport. Unless you are using [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#IgnoreGuiInset|ScreenGui.IgnoreGuiInset]], this position is not appropriate for placing GUI elements.

For an otherwise identical method that accounts for the GUI inset, see [[30 Official Roblox Docs/API Reference/Classes/Camera#WorldToScreenPoint|WorldToScreenPoint()]].

```lua
local camera = workspace.CurrentCamera

local worldPoint = Vector3.new(0, 10, 0)
local vector, onScreen = camera:WorldToViewportPoint(worldPoint)

local viewportPoint = Vector2.new(vector.X, vector.Y)
local depth = vector.Z
```

Note this method does not perform any raycasting and the boolean indicating whether `worldPoint` is within the bounds of the screen will be `true` regardless of whether the point is obscured by [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

##### ViewportFrame Cameras

Only [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] has its internal viewport dimensions updated by the engine each frame. Cameras used inside a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] do not receive viewport updates, so the X and Y components returned by this method will be in the range [0, 1] rather than in pixels. In practice, this means the returned values can be used as scale coordinates (for example, [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2.fromScale(vector.X, vector.Y)]]) to position GUI elements relative to the ViewportFrame.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `worldPoint` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] world position. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] whose **X** and **Y** components represent the offset of the `worldPoint` from the top left corner of the viewport, in pixels for [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]]. For cameras inside a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame\|ViewportFrame]], the values are normalized to [0, 1]. The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] **Z** component represents the depth of the `worldPoint` from the screen (in studs).<br><br>- A boolean indicating if the `worldPoint` is within the bounds of the screen. |

### ZoomToExtents

```lua
Camera:ZoomToExtents(boundingBoxCFrame: CFrame, boundingBoxSize: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method adjusts the [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame|CFrame]] so that a specified bounding box is fully visible within the camera's viewport, without cropping any part of the box.

The bounding box is defined by its center and orientation (`boundingBoxCFrame`) and its size (`boundingBoxSize`).

This can be used to focus the camera on a 3D object or model, such as when framing content in a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], taking screenshots, or smoothly transitioning the camera to highlight specific content.

The method automatically accounts for the camera's field of view and viewport aspect ratio to ensure the entire bounding box fits.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boundingBoxCFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing the center and orientation of the bounding box to fit into the viewport. |
| `boundingBoxSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] size of the bounding box to fit into the viewport. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Camera-ZoomToExtents`) are published on the source page; their code is not part of the open-source repo.*

## Events

### InterpolationFinished

> [!warning] Deprecated
> This event has been deprecated. Instead use `Class.TweenService` to
> smoothly animate the `Class.Camera`.

```lua
Camera.InterpolationFinished()
```

**Capabilities:** Basic

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] has finished interpolating using the [[30 Official Roblox Docs/API Reference/Classes/Camera#Interpolate|Camera:Interpolate()]] method. It will not fire if a tween is interrupted due to [[30 Official Roblox Docs/API Reference/Classes/Camera#Interpolate|Camera:Interpolate()]] being called again.

You are advised to use [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] to animate the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] instead, as it is more reliable and provides more options for easing styles.

---
*Source: [Camera](https://create.roblox.com/docs/reference/engine/classes/Camera) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
