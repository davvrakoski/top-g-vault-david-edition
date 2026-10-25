---
title: "In-game UI containers"
description: "In-game UI containers hold SurfaceGuis, BillboardGuis, and GuiObjects that you want to display in the 3D space."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/in-experience-containers"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*In-game UI containers hold SurfaceGuis, BillboardGuis, and GuiObjects that you want to display in the 3D space.*

In-game UI containers hold [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that you want to display within your game's 3D world.

- A [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] allows for the rendering of UI objects onto a part's surface in the 3D world while also allowing for basic user interaction to occur.
- A [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is a container for UI objects to appear in the 3D space but always face the camera.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/in-experience/Showcase.mp4)

## Surface UI

Similar to [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]] and [[30 Official Roblox Docs/API Reference/Classes/Texture|Textures]], UI objects such as [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabels]] parented to a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] face the same direction as the surface they're on, editable through the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|SurfaceGui.Face]] property.

*(image in the full Top G Vault)*

To apply a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to an in-game [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], simply parent it to that part and set the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|SurfaceGui.Face]] property. Child UI objects then appear on that face of the parent part.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Alternatively, you can place the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] inside a container like [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] and then set its [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] property to any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], as well as the target [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|Face]]. Setting [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] overrides direct parent association, allowing for more flexibility in placement since it can be set from a script during runtime.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!warning]
> Interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will only receive user input if they are parented to the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], typically via placing the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] as noted above. Additionally, the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|CanQuery]] property must be `true` for the interactive UI element to receive input.

> [!success]
> To assist in choosing the correct face for a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], right-click the target part and select **Show Orientation Indicator**. This displays a blue circle with an **F** and a line attached to the object's [[30 Official Roblox Docs/API Reference/Enums/NormalId|Front]] face, and a green arrow that points in the direction of the object's [[30 Official Roblox Docs/API Reference/Enums/NormalId|Top]] face.

### Size and position

The "canvas" of a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] occupies the entire [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|Face]] of the parent or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Adornee|Adornee]] part. As a best practice, it's recommended that you use **scale** values for the [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]] of child UI objects like [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabels]]. You can also apply a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] to children of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to maintain their desired aspect ratio regardless of the face's size.

[Video: SurfaceGui-Sizing.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/in-experience/SurfaceGui-Sizing.mp4)

### Occlusion mode

The [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#AlwaysOnTop|AlwaysOnTop]] property determines whether the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will render over top of 3D content or be occluded by it. When set to `false` (default), the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] renders like other 3D content and is occluded by other 3D objects. When set to `true`, it always renders over top of 3D content and it is not influenced by [[30 Official Roblox Docs/UI/In-game UI containers#Brightness and light influence|brightness/light]] in the 3D environment.

### Brightness and light influence

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] work in conjunction to determine how environmental light affects the UI content of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] determines the factor by which emitted light is scaled in a range of `0` to `1000`, letting you match the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to its environment. For instance, a video billboard can be brightened inside a dark room by increasing [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] to `10`.

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] controls how much the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] is influenced by lighting in the place, in a range from `0` to `1`. Setting this to `1` means that surrounding lighting has complete control over the appearance, while setting it to `0` means that the lighting has no effect.

#### Brightness = 0

*(image in the full Top G Vault)*

#### Brightness = 10

*(image in the full Top G Vault)*

> [!warning]
> Note that [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#Brightness|Brightness]] is inaccessible in Studio and has no effect when either [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#LightInfluence|LightInfluence]] is `1` or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#AlwaysOnTop|AlwaysOnTop]] is `true`.

### Distance visibility

[[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#MaxDistance|MaxDistance]] controls how far from the camera the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] will be displayed before it stops rendering. A value of `0` means there is no limit and it will render infinitely far away. The default value of `1000` works fine for most cases.

For [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGuis]] that appear outdoors, it's recommended that [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#MaxDistance|MaxDistance]] is high enough to ensure that the container's UI is sufficiently small on the screen when it appears or disappears, minimizing the sudden pop‑in/out effect.

### Display order

If multiple [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] containers exist on the same face, you can layer them by Z‑index through their [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui#ZOffset|ZOffset]] property (changing this does not visually "lift" or "sink" the container from the surface).

## Billboard UI

The [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] container displays UI objects in the 3D space but, unlike [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], children of a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] always face the camera. This container is useful for displaying front‑facing info above in-game objects such as health meters or names above player characters, markers to guide players to an object in the 3D world, and more.

*(image in the full Top G Vault)*

To link a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] to an in-game [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], simply parent it to that part or attachment and, if desired, adjust its [[30 Official Roblox Docs/UI/In-game UI containers#Size and position|size/position]].

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Alternatively, you can place the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] inside a container like [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] and then set its [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] property to any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]. This method offers more flexibility in placement since [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Adornee|Adornee]] can be set from a script during runtime, for example to place a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] over the head of player characters during runtime.

> [!warning]
> Interactive UI elements like [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] inside a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will only receive user input if they are parented to the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]], typically via placing the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] as noted above.

### Size and position

For billboard sizing, the [[30 Official Roblox Docs/UI/Position and size UI objects#Size|scale]] components of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Size|Size]] property set the billboard's stud size in 3D space. For example, a setting of

`{10, 0},{2, 0}`

(`Datatype.UDim2.fromScale(10, 2)`)

 forms a billboard with a 10:2 aspect ratio that scales larger or smaller depending on its distance from the camera.

For positioning, the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#StudsOffset|StudsOffset]] property shifts the billboard canvas on the **X** axis (left/right), **Y** axis (up/down), and **Z** axis (forward/back) relative to the camera.

[Video: BillboardGui-Sizing-Positioning.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/in-experience/BillboardGui-Sizing-Positioning.mp4)

> [!success]
> When creating a size-scaled [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] that contains a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], it's useful to enable the label's [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] property so that its text scales along with the billboard canvas as the camera distance changes.

### Occlusion mode

The [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#AlwaysOnTop|AlwaysOnTop]] property determines whether the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will render over top of 3D content or be occluded by it. When set to `false` (default), the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] renders like other 3D content and is occluded by other 3D objects. When set to `true`, it always renders over top of 3D content and it is not influenced by [[30 Official Roblox Docs/UI/In-game UI containers#Brightness and light influence|brightness/light]] in the 3D environment.

### Brightness and light influence

[[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] work in conjunction to determine how environmental light affects the UI content of the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]].

[[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] determines the factor by which emitted light is scaled in a range of `0` to `1000`, letting you match the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] to its environment. For instance, a video billboard can be brightened inside a dark room by increasing [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] to `10`.

[[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] controls how much the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] is influenced by lighting in the place, in a range from `0` to `1`. Setting this to `1` means that surrounding lighting has complete control over the appearance, while setting it to `0` means that the lighting has no effect.

#### LightInfluence = 1

*(image in the full Top G Vault)*

#### LightInfluence = 0

*(image in the full Top G Vault)*

> [!warning]
> Note that [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#Brightness|Brightness]] is inaccessible in Studio and has no effect when either [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#LightInfluence|LightInfluence]] is `1` or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui#AlwaysOnTop|AlwaysOnTop]] is `true`.

### Distance visibility

[[30 Official Roblox Docs/API Reference/Classes/BillboardGui#MaxDistance|MaxDistance]] controls how far from the camera the [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] will be displayed before it stops rendering. A value of `0` or `inf` (default) means there is no limit and it will render infinitely far away.

---
*Source: [In-game UI containers](https://create.roblox.com/docs/ui/in-experience-containers) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
