---
title: "Viewport frames"
description: "ViewportFrames use a camera to render 3D objects into a 2D viewport."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/viewport-frames"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*ViewportFrames use a camera to render 3D objects into a 2D viewport.*

A [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] uses a camera to render 3D objects into a 2D viewport. Ideal use cases include:

- A minimap of your game directly in the corner of a user's screen.
- 3D models of items in an inventory menu.
- Rotating objects that a character has equipped.

## Viewport configurations

3D objects that users view through a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] can either move with their camera, remain static, or rotate within the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]. This object can also include a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] child as a cubemap for reflections.

### With Camera

If you want a 3D object to move with the camera:

1. Position your camera view within the game so that the object you want to see within the frame is visible.
2. Add a new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] to the [[30 Official Roblox Docs/UI/On-screen UI containers|screen]] and then make sure it's selected in the **Explorer**.
3. In the **Properties** window, assign the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera|CurrentCamera]] property to the camera:

	 1. Select the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera|CurrentCamera]] property. Your cursor changes.
	 2. In the **Explorer** window, click on the top-level [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object.

4. Parent the desired 3D object to the new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]. Note that if you still want to see the object within your game, you must duplicate it in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and then parent the **duplicate** object to the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].

When you move your camera, the object will also move within the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].

> [!warning]
> When you want to update the view of your [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], be sure to update the camera, **not** the objects within the view.

### Static

If you want the 3D object to remain static:

1. Position your camera view within the game so that the object you want to see is in the exact position you want to see it within the frame.
2. In the **Explorer** window, duplicate the top-level [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object, then rename it to an identifiable name like `ViewportCam`.
3. Add a new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] to the [[30 Official Roblox Docs/UI/On-screen UI containers|screen]] and then make sure it's selected in the **Explorer**.
4. In the **Properties** window, assign the frame's [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera|CurrentCamera]] property to the **duplicated** camera:

	 1. Select the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#CurrentCamera|CurrentCamera]] property. Your cursor changes.
	 2. In the **Explorer** window, click on the duplicated camera object.

5. Parent the desired 3D object to the new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]]. Note that if you still want to see the object within your game, you must duplicate it in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and then parent the **duplicate** object to the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].

### Rotation

If you want a 3D object such as a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to rotate on its own within the frame:

1. Add a new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] to the [[30 Official Roblox Docs/UI/On-screen UI containers|screen]].
2. In the **Explorer** window, drag the desired [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] into the new [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].
3. Insert a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] into the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] and paste in the following code.

	```lua
	local RunService = game:GetService("RunService")

	local viewportFrame = script.Parent

	-- Parameters to experiment with
	local cameraDistance = 10
	local cameraFieldOfView = 50
	local objectPitchAngle = 40
	local objectRotationSpeed = 50

	-- Viewport camera initialization
	local viewportCamera = Instance.new("Camera")
	viewportCamera.FieldOfView = cameraFieldOfView
	viewportFrame.CurrentCamera = viewportCamera
	viewportCamera.Parent = viewportFrame

	-- Viewport object initialization
	local object = viewportFrame:FindFirstChildWhichIsA("BasePart")
	if object then
		object.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(objectPitchAngle), 0, 0)

		-- Update loop
		local t = 0
		RunService.PostSimulation:Connect(function(delta)
			t += delta
			viewportCamera.CFrame = CFrame.Angles(0, math.rad(t * objectRotationSpeed), 0) * CFrame.new(0, 0, cameraDistance)
		end)
	else
		warn("3D object not found as child of viewport frame")
	end
	```

### Skybox Reflections

[[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrames]] can use a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] child as a cubemap for reflections, in which case only the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object's six `Skybox[…]` properties are used. Assuming these properties are valid, lighting inside the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] acts similarly to when [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentSpecularScale|Lighting.EnvironmentSpecularScale]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting#EnvironmentDiffuseScale|Lighting.EnvironmentDiffuseScale]] are both set to `1`.

To implement skybox cubemap reflections:

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object as a direct child of the [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].
1. Set the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object's six texture properties ([[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxBk|SkyboxBk]], [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxDn|SkyboxDn]], [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxFt|SkyboxFt]], [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxLf|SkyboxLf]], [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxRt|SkyboxRt]], [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxUp|SkyboxUp]]).
1. For [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] that should appear within the frame, set their [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]] property greater than 0, or use a reflectant material like [[30 Official Roblox Docs/API Reference/Enums/Material|Glass]] or [[30 Official Roblox Docs/API Reference/Enums/Material|Foil]]. For [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] that should appear within the frame, apply a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] with a properly-configured [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#MetalnessMap|MetalnessMap]].

## Lighting and appearance

Lighting within a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]] is controlled through three properties:

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#Ambient\|Ambient]] | Determines the overall lighting hue applied to the area within the viewport frame. Defaults to `Datatype.Color3.fromRGB(200, 200, 200)` (ghost grey). |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightDirection\|LightDirection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the direction of the light source from position `(0, 0, 0)`. Defaults to `(-1, -1, -1)`. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightColor\|LightColor]] | Color of the directional light. Defaults to `Datatype.Color3.fromRGB(140, 140, 140)` (silver). |

Additionally, you can adjust the overall rendered appearance of the viewport throuugh the following properties:

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageColor3\|ImageColor3]] | Changes the image color/tint without modification of the rendered object. The default colorization value is `Datatype.Color3.new(1, 1, 1)` (white) at which no color modification occurs. |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageTransparency\|ImageTransparency]] | Changes the image transparency without modification of the rendered object. A value of `0` (default) is completely opaque and a value of `1` is completely transparent (invisible). |

---
*Source: [Viewport frames](https://create.roblox.com/docs/ui/viewport-frames) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
