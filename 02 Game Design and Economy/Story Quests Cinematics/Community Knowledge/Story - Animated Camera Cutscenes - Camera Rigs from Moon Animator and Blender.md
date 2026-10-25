---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Animated Camera Cutscenes - Camera Rigs from Moon Animator and Blender"
tags: [roblox, community-knowledge, story, cutscene, camera, animation, moon-animator, blender]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/open-source-in-game-camera-rig/1001900
  - https://devforum.roblox.com/t/how-do-you-make-cutscenes/975405
  - https://devforum.roblox.com/t/i-made-a-plugin-and-blender-addon-that-converts-camera-animations-to-studio/2980715
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/animation/editor
---
# Animated Camera Cutscenes - Camera Rigs from Moon Animator and Blender

Scripted camera paths (waypoints plus splines, see [[Cutscene Cameras - Spline Paths, Letterbox and Skip]]) are great for fly-throughs. They are poor at **handheld, character-driven shots**: a camera that stumbles with a running survivor, whips toward a scream, or tracks a monster's lunge frame by frame. For those, many Roblox developers **animate the camera like a character**: keyframe a part in an animation tool, then make the camera follow that part every frame. It lets an animator block the actors and the camera in the same timeline, which is how film-style cutscenes are made.

## The core trick: camera follows an animated part

1. Build a **camera rig**: a small model with a root part and one extra part, `CamPart`, joined with a `Motor6D` so it can be animated like a limb (an `AnimationController` + `Animator` inside, or a `Humanoid`).
2. Animate `CamPart` in your tool alongside the actor rigs.
3. In game, play the animation on the camera rig and, every frame, copy `CamPart.CFrame` to the camera.

```lua
-- client: drive the camera from an animated part
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local function playCameraAnim(rig, animTrack)
	local camPart = rig.CamPart
	camera.CameraType = Enum.CameraType.Scriptable
	RunService:BindToRenderStep("CutsceneCam", Enum.RenderPriority.Camera.Value + 1, function()
		camera.CFrame = camPart.CFrame
	end)
	animTrack:Play(0) -- 0 fade so the first frame is exact
	animTrack.Stopped:Wait()
	RunService:UnbindFromRenderStep("CutsceneCam")
	camera.CameraType = Enum.CameraType.Custom
end
```

Binding just after the default camera priority means your value wins each frame. Keep the rig **anchored at the scene origin** and author the animation relative to it so you can reuse the scene in another place by moving the rig.

## Tool paths

**Moon Animator 2 (paid plugin, link only).** Its camera object has an **AttachToPart** property. A DevForum resource by ellieflopper (January 2021, "Camera Manipulation Rig + Effects Module", no license stated, so link only) describes keying AttachToPart to the rig's `CamPart`, exporting the animation as a KeyframeSequence, and uploading it. The same post says it is meant for cutscenes, not gameplay sway, and that its shake effect needs a Humanoid camera subject. Price and value discussion: [[Moon Animator 2 - Paid Plugin Verdict]].

**Blender.** Blender's camera tools (graph editor, follow-path, noise modifiers for handheld shake) are far stronger than anything in Studio. Two approaches:

- Animate an **armature bone** as the camera, export the rig and animation as FBX, and import it as an animation for your camera rig. The bone becomes `CamPart`.
- Use a community converter. A DevForum creator (May 2024) built a plugin plus Blender add-on for camera animation, and reported that converting rotations from Blender's axes to Roblox's Y-up system was the hardest part. No release or license was confirmed in the thread, so treat it as a reference, not a tool to depend on.

**Built-in Animation Editor.** It animates rigs, so the camera-rig method works with it too: animate `CamPart` as one more joint. Moon Animator's AttachToPart convenience is not needed if your playback script copies the part's CFrame. (Whether the built-in editor has gained a dedicated camera track is unverified; check the current [Animation Editor docs](https://create.roblox.com/docs/animation/editor).)

## FOV, cuts and shake

- **FOV:** animations do not carry `Camera.FieldOfView`. Store it in an attribute on `CamPart` keyed by your timeline, or encode it as the part's size on one axis and read it each frame (hacky, but common).
- **Hard cuts:** keyframes one frame apart produce a smear. Add a constant-interpolation key, or split shots into separate animations and swap on cut.
- **Handheld shake:** bake it in Blender with a noise modifier; it is cheaper and more controllable than runtime shake.

## Pitfalls

- **Animation ownership.** Animations must be owned by the experience owner (user or group) to play in game. Upload under the same group as the place.
- **Rig streamed out.** With `StreamingEnabled`, make the camera rig a `Model` with `ModelStreamingMode = Atomic` or `Persistent`, or keep it in `ReplicatedStorage` and clone it on the client.
- **Character rigs in the scene** must match the animation's rig type (R15 vs R6).
- **Always restore** the camera on skip and death; reuse one exit function.

## Related
[[Story Quests Cinematics - Hub]] · [[Cinematic and Cutscene Direction]] · [[Story - Cutscene Timeline Runner - Tracks, Seeking and Safe Cleanup]] · [[Custom Camera Systems in Luau]]
