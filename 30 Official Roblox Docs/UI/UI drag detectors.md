---
title: "UI drag detectors"
description: "UI drag detectors facilitate and encourage interaction with 2D user interface elements in a game, such as sliders and spinners."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/ui-drag-detectors"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*UI drag detectors facilitate and encourage interaction with 2D user interface elements in a game, such as sliders and spinners.*

The [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] instance facilitates and encourages interaction with 2D user interface elements in a game, such as sliders, spinners, and more. Key features include:

- Place a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] under any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instance to make it draggable via all user inputs without a single line of code.

- Choose from several [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] options, define how the object responds to motion via [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle|ResponseStyle]], and optionally apply axis, movement limits, or drag boundaries.

- Scripts can respond to manipulation of dragged objects to drive logic responses, such as adjusting settings.

- [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetectors]] work in Studio's edit and play mode as long as you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools, nor certain plugins or Studio's **UI** editor tools.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/Showcase.mp4)

> [!info]
> For drag detectors that manipulate 3D objects in a game, such as opening doors and drawers or sliding a part around, see [[30 Official Roblox Docs/UI/3D drag detectors|3D Drag Detectors]].

## Make UI elements draggable

To make any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instances draggable, simply add a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] as a direct descendant.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] instance and click the ⊕ button. A contextual menu displays.
1. From the menu, insert a **UIDragDetector**.

   *(image in the full Top G Vault)*

1. By default, the object will now be draggable in the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] interface.

> [!warning]
> Remember that [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetectors]] only work in Studio if you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools, nor certain plugins or Studio's **UI** editor tools.

## Customize UI drag detectors

### Drag style

[[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetectors]] map cursor motion to calculate proposed 2D motion and/or rotation. Through the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] property, you can choose from different mappings to suit your needs. For example, [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.TranslatePlane]] produces translation in the 2D plane of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], while [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.Rotate]] normally produces a rotation instead of translation.

| Setting | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|TranslateLine]] | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis\|DragAxis]]. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|TranslatePlane]] | 2D motion in the plane of the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Rotate]] | By default, rotation about the absolute center position of the detector's parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]]. If [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] is set, rotation happens about that instance's absolute center position. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Scriptable]] | Calculates desired motion via a custom function provided through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction\|SetDragStyleFunction()]]. |

### Drag direction

By default, 2D motion and the associated [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] map to the space of the ancestor [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]]. However, you may want to change the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance|ReferenceUIInstance]] or the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis|DragAxis]] when building different UI components.

| Setting | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] | A [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] instance whose local space and absolute center position is the reference space and origin for the detector. Setting this reference affects properties such as [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]], [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation\|DragRotation]], and the behavior of [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis\|DragAxis]]. | `nil` |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis\|DragAxis]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] value that defines the axis of movement for the dragged object when [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle\|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Enum.UIDragDetectorDragStyle.TranslateLine]]. The axis is defined in the local space of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] unless [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ReferenceUIInstance\|ReferenceUIInstance]] is defined, in which case the axis is defined in that instance's local space. | (1, 0) |

### Response to motion

The [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle|UIDragDetector.ResponseStyle]] property specifies how an object's position value is changed by the proposed motion. The custom response styles let you use the resulting [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2|UIDragDetector.DragUDim2]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation|UIDragDetector.DragRotation]] values as desired, without having the detector's parent execute the proposed motion.

| Setting | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle\|Offset]] | Move by the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values of the detector's parent's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|GuiObject.Position]] value. This is the setting by default. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle\|Scale]] | Move by the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] values of the detector's parent's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|GuiObject.Position]] value. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle\|CustomOffset]] | The UI element will not move at all, but the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values of the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] will still be updated and the detector's events will still fire, allowing you to respond to drag manipulation however you'd like. |
| [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle\|CustomScale]] | The UI element will not move at all, but the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] values of the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2\|DragUDim2]] will still be updated and the detector's events will still fire, allowing you to respond to drag manipulation however you'd like. |

### Translation & rotation limits

By default, there are no limits to 2D motion behind the inherent restrictions of the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]]. Limits for both minimum and maximum translations and rotations can be declared with the following properties if desired. Additionally, you can define how the dragged object is constrained within the bounds of a specified [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] such as a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]].

| Properties | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation\|MinDragTranslation]]<br> [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation\|MaxDragTranslation]] | Limits to drag translation in each dimension, defined by a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] value. If [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragTranslation\|MaxDragTranslation]] is greater than [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragTranslation\|MinDragTranslation]], translation will be clamped within that range. | {0, 0}, {0, 0} |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle\|MinDragAngle]]<br> [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle\|MaxDragAngle]] | Only relevant if [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle\|DragStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle\|Enum.UIDragDetectorDragStyle.Rotate]], or if the functions set through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SetDragStyleFunction\|SetDragStyleFunction()]] or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#AddConstraintFunction\|AddConstraintFunction()]] defines a rotation value. If [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MaxDragAngle\|MaxDragAngle]] is greater than [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#MinDragAngle\|MinDragAngle]], rotation will be clamped within that range. | 0 |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingBehavior\|BoundingBehavior]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] instance's bounding behavior when its [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]] is set. Setting this to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|EntireObject]] bounds the entire dragged UI within the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]], while setting it to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|HitPoint]] bounds the dragged UI only by the exact hit/grab point and its respective position after translation/rotation. As a convenience, the default of [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|Automatic]] mimics the [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|EntireObject]] behavior for a UI object that's entirely contained by the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]], or else [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|HitPoint]] for a UI object that's partially outside the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI\|BoundingUI]]. | [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorBoundingBehavior\|Automatic]] |

### Speed adjustments

Through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed|SelectionModeDragSpeed]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeRotateSpeed|SelectionModeRotateSpeed]], you can fine‑tune the maximum drag/rotate speeds for a detector. Furthermore, through [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping|UIDragSpeedAxisMapping]], you can fine‑tune the **X**/**Y** dimension dragging speeds, based on the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed|SelectionModeDragSpeed]].

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed\|SelectionModeDragSpeed]] | Defines the maximum drag speed for translation as a combination of [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] of the first ancestor [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui\|SurfaceGui]] the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeRotateSpeed\|SelectionModeRotateSpeed]] | Defines the maximum angle per second at which the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] can rotate. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#UIDragSpeedAxisMapping\|UIDragSpeedAxisMapping]] | Determines the **X**/**Y** dimension dragging speeds, based on the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed\|SelectionModeDragSpeed]]. The default is [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|XY]], meaning the **X** and **Y** axis speeds are based off the **X** and **Y** [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]]/[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values respectively.<br><br>Alternatives are [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|XX]] and [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|YY]], meaning both the **X** and **Y** axis speeds are based off the **X** ([[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|XX]]) or **Y** ([[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|YY]]) axis for [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale\|Scale]], while the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values still apply to their respective axis. For example, if the first ancestor [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] is sized 800×600 and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#SelectionModeDragSpeed\|SelectionModeDragSpeed]] is `{0.1, 10}, {0.1, 20}`, a setting of [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|XX]] results in an **X**/**Y** drag speed of `80+10`/`80+20`, while [[30 Official Roblox Docs/API Reference/Enums/UIDragSpeedAxisMapping\|YY]] results in `60+10`/`60+20` (note the [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset\|Offset]] values remain the same in both cases). |

## Script responses to clicking and dragging

Through [[30 Official Roblox Docs/UI/UI drag detectors#Event signals|event signals]], property changes, [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Scriptable]] drag style, and custom functions, scripts can respond to the manipulation of dragged UI elements to drive various settings or make logical decisions, such as sliders that adjust music and sound effect volume separately.

> [!warning]
> For user-initiated script responses like [[30 Official Roblox Docs/UI/UI drag detectors#Event signals|Event Signals]] and [[30 Official Roblox Docs/UI/UI drag detectors#Scripted drag style|Scripted Drag Style]], you'll most commonly need to put your script code inside a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]].

### Event signals

Through the following event signals, you can detect when a user starts, continues, and ends dragging an object.

| Event | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStart\|DragStart]] | Fires when a user starts dragging the object. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragContinue\|DragContinue]] | Fires when a user continues dragging the object after [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStart\|DragStart]] has been initiated. |
| [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragEnd\|DragEnd]] | Fires when a user stops dragging the object. |

The following slider designates its container as the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] to limit its movement within the container area, allowing the scale‑based [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|TranslateLine]] drag to be limited to the full width of the container without extra scripting.

[Video: Transparency-Slider.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/Transparency-Slider.mp4)

> [!info]
> To test this example, download the [`TransparencySlider.rbxm`](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/TransparencySlider.rbxm) file, right‑click [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select **Insert** ⟩ **Import Roblox Model**, and choose the downloaded file.

```lua title="UIDragDetector - Event Signal Transparency Change"
-- Hierarchy is SliderContainer ⟩ Handle ⟩ UIDragDetector ⟩ (this script)
local sliderContainer = script.Parent.Parent.Parent
local handle = sliderContainer:FindFirstChild("Handle")
local uiDragDetector = handle:FindFirstChildWhichIsA("UIDragDetector")

uiDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale  -- Set dragging by scale
uiDragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine  -- Restricts dragging to line
uiDragDetector.BoundingUI = sliderContainer

-- Initially set container transparency to X scale value of handle
sliderContainer.BackgroundTransparency = 1 - handle.Position.X.Scale

-- Expand handle border to indicate grab start
uiDragDetector.DragStart:Connect(function(inputPosition)
	handle:FindFirstChildWhichIsA("UIStroke").Thickness = 6
end)

-- Change transparency by how much it dragged in scale
uiDragDetector.DragContinue:Connect(function(inputPosition)
	sliderContainer.BackgroundTransparency = 1 - handle.Position.X.Scale
end)

-- Revert handle border to indicate grab end
uiDragDetector.DragEnd:Connect(function(inputPosition)
	handle:FindFirstChildWhichIsA("UIStroke").Thickness = 4
end)
```

### Position & rotation changes

In addition to [[30 Official Roblox Docs/UI/UI drag detectors#Event signals|event signals]], you can monitor changes to the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2|DragUDim2]] and/or [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation|DragRotation]] properties directly.

The following detector has its [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Rotate]], allowing users to drag the handle around the hue rotator ring, all while detecting changes to drag rotation through [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Instance:GetPropertyChangedSignal()]].

[Video: Hue-Rotator.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/Hue-Rotator.mp4)

> [!info]
> To test this example, download the [`HueRotator.rbxm`](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/HueRotator.rbxm) file, right‑click [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select **Insert** ⟩ **Import Roblox Model**, and choose the downloaded file.

```lua title="UIDragDetector - DragRotation Change"
local handle = script.Parent.Parent  -- UI element to drag
local uiDragDetector = handle:FindFirstChildWhichIsA("UIDragDetector")

uiDragDetector.DragStyle = Enum.UIDragDetectorDragStyle.Rotate  -- Set drag style to rotate

local function changeHue()
	local currAngle = (math.fmod(handle.Rotation, 360)) / 360
	if currAngle < 0 then
		currAngle += 1
	end
	handle.BackgroundColor3 = Color3.fromHSV(currAngle, 1, 1)
end

-- Initially set hue to handle rotation
changeHue()

-- Connect function to GetPropertyChangedSignal() of the detector's drag rotation
uiDragDetector:GetPropertyChangedSignal("DragRotation"):Connect(changeHue)
```

### Scripted drag style

If you set a detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|UIDragDetector.DragStyle]] to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|Enum.UIDragDetectorDragStyle.Scriptable]], you can provide your own function that takes in a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] of the input position and returns a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] (position) and a float (rotation). The detector will update the object to the computed position/rotation based off of the returns, the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]] property, and the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRelativity|DragRelativity]] property.

By default, the returned [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] and float will be the **final** desired position/rotation in the local space of the detector's parent. Existing translation/rotation limits will still apply, as will boundary limits imposed by a specified [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] instance.

The following example drags a UI element following a sine wave computed by the change in **X** coordinate input. Note that the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragSpace|DragSpace]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragSpace|Enum.UIDragDetectorDragSpace.Relative]].

```lua title="UIDragDetector - Drag Following Sine Wave"
local frame = script.Parent  -- UI element to drag
local uiDragDetector = frame:FindFirstChildWhichIsA("UIDragDetector")

local initialXValue = 0
local maxHeightChange = 200
local pixelsPerRadian = 75  -- Lower this value to increase frequency

uiDragDetector.DragStart:Connect(function(inputPosition)
	initialXValue = inputPosition.X
end)

local function computeSinWaveCoordinate(inputPosition)
	local deltaX = inputPosition.X - initialXValue
	-- Negative Y delta so that it goes "up" on the screen with positive Y change
	local deltaY = -math.sin(deltaX / pixelsPerRadian) * maxHeightChange
	return UDim2.fromOffset(deltaX, deltaY)
end

uiDragDetector:SetDragStyleFunction(computeSinWaveCoordinate)
```

### Custom constraint function

[[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetectors]] do not have built-in motion rules about grids and snapping, but you can register custom constraint functions to edit the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragUDim2|UIDragDetector.DragUDim2]] and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragRotation|UIDragDetector.DragRotation]] before they are applied. For example, you can keep motion on a grid by rounding positions to specific increments, or define allowed areas of motion. Note that this is applied **before** any existing translation/rotation limits.

> [!info]
> Multiple constraint functions can be registered and they will be called in the order of their priority value passed in upon registration, from least to greatest.

The following example utilizes a constraint function that clamps the planar drag into an **X**/**Y** grid based on the number of rows and columns. Note that the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle|ResponseStyle]] is set to [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle|Enum.UIDragDetectorResponseStyle.Scale]] and its [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] is set to the grid container.

[Video: Grid-Drag.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/Grid-Drag.mp4)

> [!info]
> To test this example, download the [`GridDrag.rbxm`](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/GridDrag.rbxm) file, right‑click [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select **Insert** ⟩ **Import Roblox Model**, and choose the downloaded file.

```lua title="UIDragDetector - Drag in Grid, Snapping to Tiles"
-- Hierarchy is GridContainer ⟩ Handle ⟩ UIDragDetector ⟩ (this script)
local gridContainer = script.Parent.Parent.Parent
local handle = gridContainer:FindFirstChild("Handle")  -- UI element to drag
local uiDragDetector = handle:FindFirstChildWhichIsA("UIDragDetector")

uiDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale  -- Set dragging by scale
uiDragDetector.DragRelativity = Enum.UIDragDetectorDragRelativity.Relative
uiDragDetector.BoundingUI = gridContainer

local NUM_COLUMNS = 10
local NUM_ROWS = 5

local xScaleIncrement = 1 / NUM_COLUMNS
local yScaleIncrement = 1 / NUM_ROWS
local initialParentPosition = uiDragDetector.Parent.Position

uiDragDetector.DragStart:Connect(function()
	initialParentPosition = uiDragDetector.Parent.Position
end)

local function dragToGridOnly(proposedPosition, proposedRotation)
	local griddedXScale = math.round(proposedPosition.X.Scale / xScaleIncrement) * xScaleIncrement
	local griddedYScale = math.round(proposedPosition.Y.Scale / yScaleIncrement) * yScaleIncrement

	return UDim2.fromScale(griddedXScale, griddedYScale), proposedRotation
end

uiDragDetector:AddConstraintFunction(1, dragToGridOnly)
```

---
*Source: [UI drag detectors](https://create.roblox.com/docs/ui/ui-drag-detectors) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
