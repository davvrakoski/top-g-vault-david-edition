---
title: "Skyboxes"
description: "Skyboxes are cubes made up of six individual images that create an immersive background."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/skybox"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Skyboxes are cubes made up of six individual images that create an immersive background.*

A **skybox** is a cube made up of six individual images that create an immersive sky background in a game. When the images are designed to be perfectly aligned with each other, the skybox appears to be panoramic without the impression of being inside a cube. This makes games feel larger than they really are, and it adds depth to your atmosphere, such as simulating deep space or underwater environments.

Additionally, the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object includes celestial bodies such as a sun, moon, and stars which dynamically appear, rise, and set based on the
[[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] or [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]].

Finally, the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object can be used as a cubemap for reflections in [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrames]]. For details, see [[30 Official Roblox Docs/UI/Viewport frames|viewport frames]].

## Skybox construction

If you've created your own skybox images, you must first [import](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) them to Roblox before you can use them in a skybox. Each image must be seamless along **all edges** of neighboring images when "folded" into a cube.

### Image Faces

*(image in the full Top G Vault)*

### Skybox "Folded"

*(image in the full Top G Vault)*

<br>

To create a skybox:

1. In the **Explorer** window, insert a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object into the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service.

   *(image in the full Top G Vault)*

1. Select the new [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object, then in the **Properties** window, assign a texture to each of the following sky properties:

   - **SkyboxBk** — The **back** square of the skybox.
   - **SkyboxDn** — The **down** square of the skybox.
   - **SkyboxFt** — The **front** square of the skybox.
   - **SkyboxLf** — The **left** square of the skybox.
   - **SkyboxRt** — The **right** square of the skybox.
   - **SkyboxUp** — The **up** square of the skybox.

   *(image in the full Top G Vault)*

## Celestial bodies

By default, the [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] object includes celestial bodies such as a sun, moon, and stars. These bodies dynamically appear, rise, and set based on the
[[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] or [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] property values.

You can customize celestial bodies through the following properties:

- [[30 Official Roblox Docs/API Reference/Classes/Sky#SunTextureId|SunTextureId]] — Sets the texture of the sun.
- [[30 Official Roblox Docs/API Reference/Classes/Sky#SunAngularSize|SunAngularSize]] — Sets the relative size of the sun in degrees.
- [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonTextureId|MoonTextureId]] — Sets the texture of the moon.
- [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonAngularSize|MoonAngularSize]] — Sets the relative size of the moon in degrees.
- [[30 Official Roblox Docs/API Reference/Classes/Sky#StarCount|StarCount]] — Sets the amount of stars in the skybox.

> [!info]
> To disable all celestial bodies, you can toggle off the [[30 Official Roblox Docs/API Reference/Classes/Sky#CelestialBodiesShown|CelestialBodiesShown]] property. Alternatively, you can disable only the sun and/or moon (while keeping the stars) by setting [[30 Official Roblox Docs/API Reference/Classes/Sky#SunAngularSize|SunAngularSize]] or [[30 Official Roblox Docs/API Reference/Classes/Sky#MoonAngularSize|MoonAngularSize]] to `0`.

## Orientation

The [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxOrientation|SkyboxOrientation]] property changes the orientation of the skybox surfaces. The property takes a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] of degree values in the typical **XYZ** order, but rotation is **applied** first around the **Y** axis, then **X**, and then **Z** to allow for predictable control over complex movements.

[Video: Skybox-Orientation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/skybox/Skybox-Orientation.mp4)

An easy way to script an orientation animation is to spin around the **Y** axis (keeping the horizon level), then tilt this axis by setting **X** and **Z** to a fixed value. The following script, for example, animates the **Y** axis for spinning while keeping a consistent 30° tilt on the **X** axis.

```lua
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local sky = Lighting:FindFirstChild("Sky")

local ROTATION_SPEED = 5  -- In degrees per second

RunService.Heartbeat:Connect(function(deltaTime)
	sky.SkyboxOrientation = Vector3.new(
		30,
		(sky.SkyboxOrientation.Y + ROTATION_SPEED * deltaTime) % 360,
		0
	)
end)
```

> [!info]
> The modulo operation `%` is optional but recommended. You can use values above `360` or below `0`, but using smaller numbers avoids issues when the animation runs for a very long time (due to limited precision).

Note that skybox orientation is a low-cost feature which works seamlessly across all platforms and visual quality levels. As a result, some intentional exceptions include:

- If the sky is visible in indoor reflections such as a mirror surface through an open window, that specific reflected view will not be rotated. Achieving this would require expensive re‑rendering and convolving of cubemaps which would significantly impact performance and broad availability.
- Only the skybox surfaces rotate; [[30 Official Roblox Docs/Environment/Skyboxes#Celestial bodies|celestial bodies]] are not affected by this property.
- If you utilize a [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] within a [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]], it will reflect the global [[30 Official Roblox Docs/API Reference/Classes/Sky#SkyboxOrientation|SkyboxOrientation]] values. You cannot adjust the angle per [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame|ViewportFrame]].
- The [[30 Official Roblox Docs/Environment/Dynamic clouds|dynamic clouds]] feature under [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] is not impacted.

---
*Source: [Skyboxes](https://create.roblox.com/docs/environment/skybox) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
