---
title: "3D drag detectors"
description: "3D drag detectors facilitate and encourage interaction with 3D objects in a game, such as opening doors and drawers, sliding a part around, and much more."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/3D-drag-detectors"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*3D drag detectors facilitate and encourage interaction with 3D objects in a game, such as opening doors and drawers, sliding a part around, and much more.*

The [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] instance facilitates and encourages interaction with 3D objects in a game, such as opening doors and drawers, sliding a part around, grabbing and tossing a bowling ball, pulling back and firing a slingshot, and much more. Key features include:

- Place a [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] under any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] to [[30 Official Roblox Docs/UI/3D drag detectors#Make objects draggable|make it draggable]] via all inputs (mouse, touch, gamepad, and VR), all without a single line of code.

- Choose from several [[30 Official Roblox Docs/UI/3D drag detectors#Drag style|drag styles]], define how the object [[30 Official Roblox Docs/UI/3D drag detectors#Response to motion|responds to motion]], and optionally apply [[30 Official Roblox Docs/UI/3D drag detectors#Axis & movement limits|axis or movement limits]].

- Scripts can [[30 Official Roblox Docs/UI/3D drag detectors#Script responses to clicking and dragging|respond to manipulation of dragged objects]] to drive UI or make logical decisions, such as adjusting the light level in a room based on a sliding wall switch dimmer.

- Players can manipulate anchored parts or models and they'll stay exactly where you put them upon release.

- [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]] work in Studio as long as you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools, making it easier to test and adjust draggable objects while editing.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Showcase.mp4)

## Make objects draggable

To make any part or model draggable, simply add a [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] as a direct descendant.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and click the ⊕ button. A contextual menu displays.
1. From the menu, insert a **DragDetector**.

   *(image in the full Top G Vault)*

1. By default, the object will now be draggable in the ground plane, but you can customize its [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]], define how it [[30 Official Roblox Docs/UI/3D drag detectors#Response to motion|responds to motion]], and optionally apply [[30 Official Roblox Docs/UI/3D drag detectors#Axis & movement limits|axis or movement limits]].

> [!warning]
> Remember that [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]] only work in Studio if you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools.

## Customize drag detectors

### Drag style

[[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]] map cursor motion to virtual lines and planes to calculate proposed 3D motion. Through the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] property, you can choose from different mappings to suit your needs. For example, **TranslatePlane** produces translation in a virtual plane, whereas **RotateAxis** produces rotation about a virtual axis.

| Setting | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|TranslateLine]] | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **Y** axis. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|TranslatePlane]] | 2D motion in the plane perpendicular to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **XZ** plane. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|TranslatePlaneOrLine]] | 2D motion in the plane perpendicular to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] and, when the [[30 Official Roblox Docs/UI/3D drag detectors#Modifier input\|modifier]] is active, 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]]. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|TranslateLineOrPlane]] | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] and, when the [[30 Official Roblox Docs/UI/3D drag detectors#Modifier input\|modifier]] is active, 2D motion in the plane perpendicular to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]]. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|TranslateViewPlane]] | 2D motion in the plane perpendicular to the camera's view. In this mode, the plane is constantly updated, even while dragging, and will always face the camera's current view. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|RotateAxis]] | Rotation about the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **Y** axis. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|RotateTrackball]] | Trackball rotation, further customized through the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRadialPullFactor\|TrackballRadialPullFactor]] and [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRollFactor\|TrackballRollFactor]] properties. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|BestForDevice]] | **TranslatePlaneOrLine** for mouse and gamepad; **TranslatePlane** for touch; **6DOF** for VR. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle\|Scriptable]] | Calculates desired motion via a custom function provided through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetDragStyleFunction\|SetDragStyleFunction()]]. |

### Drag direction

By default, 3D motion and the associated [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] map to world space. However, you may want to change the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance|ReferenceInstance]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Orientation|Orientation]], or [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis|Axis]], for example when building drag detectors into [[30 Official Roblox Docs/UI/3D drag detectors#Anchored models with adjustable parts|models with adjustable parts]].

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance\|ReferenceInstance]] | An instance whose pivot provides the **reference frame** for the drag detector. The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame\|DragFrame]] is expressed relative to this reference frame which may be retrieved via [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GetReferenceFrame\|GetReferenceFrame()]]. If the reference frame is `nil`, translation will be in the direction of (or in the plane perpendicular to) the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] property in world space. | `nil` |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Orientation\|Orientation]] | Specifies the **YXZ** rotation of axes of motion relative to the reference frame (does not change the orientation of the reference frame itself). Linear translation and axial rotation will be on this reoriented **Y** axis, and planar translation in the **XZ** plane. Changing this value automatically updates [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] and vice versa. | (0, 0, 0) |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] | The primary axis of motion, expressed relative to the reference frame. Changing this value automatically updates [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Orientation\|Orientation]] and vice versa. | (0, 1, 0) |

### Response to motion

The [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ResponseStyle|ResponseStyle]] property specifies how an object responds to the proposed motion, depending on whether the object is [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] or not.

| Setting | Anchored behavior | Unanchored behavior |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle\|Geometric]] | Both inside the running game and in Studio edit mode, the position/orientation of an anchored object will be updated to exactly reflect the proposed motion. | For an unanchored object, behavior is the same as for an anchored object. However, in a running game, the object will be anchored at the start of the drag and restored to unanchored upon drag release. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle\|Physical]] | An anchored object will default to **Geometric** behavior, as it is not affected by forces. | An unanchored object will be moved by [[30 Official Roblox Docs/UI/3D drag detectors#Physics response\|constraint forces]] that attempt to bring it to the desired position and/or orientation given by the proposed motion. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorResponseStyle\|Custom]] | The object will not move at all, but [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame\|DragFrame]] will still be updated and you can [[30 Official Roblox Docs/UI/3D drag detectors#Script responses to clicking and dragging\|respond to drag manipulation]] however you'd like. | (same as anchored) |

> [!warning]
> Remember that [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]] only work in Studio if you're **not** using the **Select**, **Move**, **Scale**, or **Rotate** tools.

### Axis & movement limits

By default, there are no limits to 3D motion beyond the inherent restrictions of the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]]. If necessary, you can apply minimum and maximum limits to both translation and rotation. Note, however, that these are **not** constraints; they merely impede the drag detector's attempts to generate motion in order to remain within limits.

| Properties | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragTranslation\|MinDragTranslation]]<br> [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragTranslation\|MaxDragTranslation]] | Limits to drag translation in each dimension. If MaxDragTranslation is greater than MinDragTranslation, translation will be clamped within that range. | (0, 0, 0) |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragAngle\|MinDragAngle]]<br> [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragAngle\|MaxDragAngle]] | Only relevant if [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle\|DragStyle]] is set to **RotateAxis**. If [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxDragAngle\|MaxDragAngle]] is greater than [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MinDragAngle\|MinDragAngle]], rotation will be clamped within that range. | 0 |

> [!warning]
> When using axis/movement limits, you should always set the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance|ReferenceInstance]] so that the limits are relative to a dedicated reference frame. If you fail to establish the reference frame, each drag of the object will reset its limits to its own current world space position/orientation.

### Drag permissions

Permission of players to interact with a given drag detector instance can be specified by the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#PermissionPolicy|PermissionPolicy]] property. This is set to [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy|Enum.DragDetectorPermissionPolicy.Everybody]] by default, and it can also be changed to support scripted permission controls as shown in the code sample.

| Setting | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy\|Nobody]] | No players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy\|Everybody]] | All players can interact with the [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Enums/DragDetectorPermissionPolicy\|Scriptable]] | Players' drag permissions will be determined by a function registered through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetPermissionPolicyFunction\|SetPermissionPolicyFunction()]]. Under this setting, failure to register a function or returning an invalid result will prevent all players from dragging. |

```lua title="DragDetector - Scripted Drag Permission"
local dragDetector = script.Parent.DragDetector
dragDetector.PermissionPolicy = Enum.DragDetectorPermissionPolicy.Scriptable

dragDetector:SetPermissionPolicyFunction(function(player, part)
	if player and player:GetAttribute("IsInTurn") then
		return true
	elseif part and not part:GetAttribute("IsDraggable") then
		return false
	else
		return true
	end
end)
```

### Physics response

Assuming a dragger's [[30 Official Roblox Docs/UI/3D drag detectors#Response to motion|response style]] is set to **Physical** and it is applied to an unanchored object, that object will be moved by constraint forces that attempt to bring it to the position/orientation given by the proposed motion. You can further customize the physical response through the following properties:

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ApplyAtCenterOfMass\|ApplyAtCenterOfMass]] | When false, drag force is applied at the point the user clicks on. When true, force is applied at the object's center of mass. | false |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxForce\|MaxForce]] | Maximum force applied for the object to reach its goal. | 10000000 |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#MaxTorque\|MaxTorque]] | Maximum torque applied for the object to reach its goal. | 10000 |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Responsiveness\|Responsiveness]] | Higher values cause the object to reach its goal more rapidly. | 10 |

### Modifier input

Some [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] modes allow users to hold down a **modifier** key/button to manipulate the dragged object in different ways. By default, the modifier is [[30 Official Roblox Docs/API Reference/Enums/KeyCode|LeftControl]] on PC, [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonR1]] on gamepad, or [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonL2]] on VR. You can customize these modifiers through the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#KeyboardModeSwitchKeyCode|KeyboardModeSwitchKeyCode]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector#GamepadModeSwitchKeyCode|GamepadModeSwitchKeyCode]], or [[30 Official Roblox Docs/API Reference/Classes/DragDetector#VRSwitchKeyCode|VRSwitchKeyCode]] properties of the drag detector instance.

### Replication

When the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#RunLocally|RunLocally]] property is false (default), the client interprets all input to produce data that it sends to the server to perform the drag. In this mode, all custom event signals and registered functions must be in server [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]].

When the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#RunLocally|RunLocally]] property is true, no events are replicated to the server. All custom event signals and registered functions must be in client scripts, and you must use [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|remote events]] to propagate necessary changes to the server.

## Script responses to clicking and dragging

Through [[30 Official Roblox Docs/UI/3D drag detectors#Event signals|event signals]], property changes, [[30 Official Roblox Docs/API Reference/Enums/DragDetectorDragStyle|Scriptable]] drag style, and custom functions, scripts can respond to the manipulation of dragged objects to drive UI or make logical decisions, such as adjusting the light level in a room based on a sliding wall switch dimmer.

### Event signals

Through the following event signals, you can detect when a user starts, continues, and ends dragging an object.

| Event | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] | Fires when a user starts dragging the object. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragContinue\|DragContinue]] | Fires when a user continues dragging the object after [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStart\|DragStart]] has been initiated. |
| [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragEnd\|DragEnd]] | Fires when a user stops dragging the object. |

```lua title="DragDetector - Event Signals" highlight="7,9,11,13,15,17"
local dragDetector = script.Parent.DragDetector

local highlight = Instance.new("Highlight")
highlight.Enabled = false
highlight.Parent = script.Parent

dragDetector.DragStart:Connect(function()
	highlight.Enabled = true
end)

dragDetector.DragContinue:Connect(function()

end)

dragDetector.DragEnd:Connect(function()
	highlight.Enabled = false
end)
```

### Drag frame changes

In addition to [[30 Official Roblox Docs/UI/3D drag detectors#Event signals|event signals]], you can monitor changes to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame|DragFrame]] directly.

```lua title="DragDetector - DragFrame Changes" highlight="3,6"
local dragDetector = script.Parent.DragDetector

dragDetector:GetPropertyChangedSignal("DragFrame"):Connect(function()
	local currentDragTranslation = dragDetector.DragFrame.Position
	print(currentDragTranslation)
end)
```

### Scripted drag style

If you set a detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] to **Scriptable**, you can provide your own function that takes in a [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] and returns a world space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. The detector will move the motion so that the dragged object goes to that custom location/orientation.

```lua title="DragDetector - Scripted DragStyle" highlight="2,7,31,32,34"
local Workspace = game:GetService("Workspace")

local dragDetector = script.Parent.DragDetector
dragDetector.DragStyle = Enum.DragDetectorDragStyle.Scriptable

local cachedHitPoint = Vector3.zero
local cachedHitNormal = Vector3.yAxis

local function followTheCursor(cursorRay)
	-- Exclude dragged object from raycast detection
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {dragDetector.Parent}
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude

	local hitPoint = Vector3.zero
	local hitNormal = Vector3.yAxis

	local raycastResult = Workspace:Raycast(cursorRay.Origin, cursorRay.Direction, raycastParams)
	if raycastResult then
		hitPoint = raycastResult.Position
		hitNormal = raycastResult.Normal.Unit
	else
		hitPoint = cachedHitPoint
		hitNormal = cachedHitNormal
	end

	cachedHitPoint = hitPoint
	cachedHitNormal = hitNormal

	local lookDir1 = hitNormal:Cross(Vector3.xAxis)
	local lookDir2 = hitNormal:Cross(Vector3.yAxis)
	local lookDir = if lookDir1.Magnitude > lookDir2.Magnitude then lookDir1.Unit else lookDir2.Unit
	return CFrame.lookAt(hitPoint, hitPoint + lookDir, hitNormal)
end

dragDetector:SetDragStyleFunction(followTheCursor)
```

### Custom constraint function

Drag detectors do not have built-in motion rules about grids and snapping, but you can register custom constraint functions to edit the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragFrame|DragFrame]] before it is applied. For example, you can keep motion on a grid by rounding positions to multiples of the grid increment, or simulate a chess game with rules of motion legal to each piece.

```lua title="DragDetector - Custom Constraint Function" highlight="4,14,27,28,30"
local dragDetector = script.Parent.DragDetector
local startPartPosition = nil

local SNAP_INCREMENT = 4

dragDetector.DragStart:Connect(function()
	startPartPosition = script.Parent.Position
end)

dragDetector.DragEnd:Connect(function()
	startPartPosition = nil
end)

local function snapToWorldGrid(proposedMotion)
	if startPartPosition == nil then
		return proposedMotion
	end
	local snapIncrement = SNAP_INCREMENT // 1
	if snapIncrement < 1 then
		return proposedMotion
	end
	local newWorldPosition = startPartPosition + proposedMotion.Position
	local roundedX = ((newWorldPosition.X / snapIncrement + 0.5) // 1) * snapIncrement
	local roundedY = ((newWorldPosition.Y / snapIncrement + 0.5) // 1) * snapIncrement
	local roundedZ = ((newWorldPosition.Z / snapIncrement + 0.5) // 1) * snapIncrement
	local newRoundedWorldPosition = Vector3.new(roundedX, roundedY, roundedZ)
	return proposedMotion.Rotation + (newRoundedWorldPosition - startPartPosition)
end

local connection = dragDetector:AddConstraintFunction(2, snapToWorldGrid)
-- When applicable, remove the constraint function by invoking connection:Disconnect()
```

## Example usage

### Unanchored physical objects

A basic implementation of drag detectors is a tower balance game where players must carefully remove pieces and attempt to keep the tower upright. In the following tower structure, each piece has a child [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] with a default [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] of **TranslatePlane** so that players can pull the pieces outward but not upward or downward.

[Video: Balance-Tower.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Balance-Tower.mp4)

### Anchored models with adjustable parts

You can easily create and share models which are primarily anchored, but which have one or more child parts/models that players can drag. For example, the following desk has two drawers which players can open to inspect what's inside.

[Video: Desk-Drawers.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Desk-Drawers.mp4)

> [!warning]
> When making children of models draggable, you should set the drag detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#ReferenceInstance|ReferenceInstance]] to an object within the model that can serve as a dedicated reference frame, for example the desk's top surface. This establishes a consistent reference [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for the style/direction of dragging, even if the model is rotated.

### Drag detectors and constraints

You can combine drag detectors with [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]], for example a marionette puppet. In the following setup, the control handles are anchored, the body parts are unanchored, and constraints hold the marionette together. Moving the handles with the **TranslateViewPlane** [[30 Official Roblox Docs/API Reference/Classes/DragDetector#DragStyle|DragStyle]] makes the marionette dance, and the individual body parts may also be moved with drag detectors, all while the model retains its integrity.

[Video: Marionette.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Marionette.mp4)

### 3D user interfaces

3D user interfaces are easily achievable through drag detectors, such as adjusting the brightness of a [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]] based on a sliding switch dimmer. You can also detect the **X** and **Z** axes individually to control two different aspects of a 3D user interface, such as the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]] of a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].

[Video: Color-Slider.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Color-Slider.mp4)

```lua title="DragDetector - 3D User Interface"
local model = script.Parent
local slider = model.SliderPart
local originPart = model.OriginPart
local emitter = script.Parent.EmitterPart.ParticleEmitter

local dragDetector = slider.DragDetector
dragDetector.ReferenceInstance = originPart
dragDetector.MinDragTranslation = Vector3.zero
dragDetector.MaxDragTranslation = Vector3.new(10, 0, 10)

local dragRangeX = dragDetector.MaxDragTranslation.X - dragDetector.MinDragTranslation.X
local dragRangeZ = dragDetector.MaxDragTranslation.Z - dragDetector.MinDragTranslation.Z

local MIN_PARTICLE_SIZE = 1
local MAX_PARTICLE_SIZE = 1.5
local MIN_PARTICLE_SPEED = 2.5
local MAX_PARTICLE_SPEED = 5
local COLOR1 = Color3.fromRGB(255, 150, 0)
local COLOR2 = Color3.fromRGB(255, 0, 50)

local function updateParticles(emitter)
	local dragFactorX = (dragDetector.DragFrame.Position.X - dragDetector.MinDragTranslation.X) / dragRangeX
	local dragFactorZ = (dragDetector.DragFrame.Position.Z - dragDetector.MinDragTranslation.Z) / dragRangeZ

	-- Adjust particle size and speed based on drag detector X factor
	emitter.Size = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.1, MIN_PARTICLE_SIZE + ((MAX_PARTICLE_SIZE - MIN_PARTICLE_SIZE) * dragFactorX)),
		NumberSequenceKeypoint.new(1, 0)
	}
	local speed = MIN_PARTICLE_SPEED + ((MAX_PARTICLE_SPEED - MIN_PARTICLE_SPEED) * dragFactorX)
	emitter.Speed = NumberRange.new(speed, speed * 1.2)
	-- Adjust particle color based on drag detector Z factor
	local color = COLOR2:Lerp(COLOR1, dragFactorZ)
	emitter.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, color),
		ColorSequenceKeypoint.new(1, color)
	}
end

dragDetector:GetPropertyChangedSignal("DragFrame"):Connect(function()
	updateParticles(emitter)
end)
```

---
*Source: [3D drag detectors](https://create.roblox.com/docs/ui/3D-drag-detectors) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
