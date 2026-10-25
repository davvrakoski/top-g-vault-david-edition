---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "Cutscene Cameras - Spline Paths, Letterbox and Skip"
tags: [roblox, community-knowledge, camera, cutscene, cinematic, spline]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/camera
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://www.redblobgames.com/articles/curved-paths/
---
# Cutscene Cameras - Spline Paths, Letterbox and Skip

Intros, boss reveals and "the door opened over there" moments need a scripted camera. The usual first attempt chains `TweenService` tweens between camera parts, which gives visible corners at every waypoint and speed jumps between segments. A spline through the waypoints gives one continuous move, and a small amount of structure (lock input, hide HUD, letterbox, always allow skip, restore everything) separates a polished cutscene from a soft-lock bug.

## Lifecycle

1. **Enter:** set `Camera.CameraType = Enum.CameraType.Scriptable`, hide gameplay HUD, disable player controls, show letterbox bars.
2. **Play:** drive `Camera.CFrame` (and optionally `FieldOfView`) every render step from a timeline.
3. **Exit (always, including skip and death):** restore `CameraType = Custom`, `CameraSubject = humanoid`, controls, HUD and FOV.

Wrap exit in one function and call it from every path. A missed restore leaves players stuck with a frozen camera, which is a top "game broken" report.

## Waypoints in the world

Place small anchored, invisible parts named `Shot01`, `Shot02`... in a folder. Each part's CFrame is a camera pose; attributes hold timing (`Time` in seconds from start) and optional `FOV`. Designers can then move shots in Studio without touching code.

## Smooth path: Catmull-Rom through the points

A Catmull-Rom spline passes **through** every waypoint and is smooth between them, which is exactly what camera paths need (Red Blob Games has a good visual explainer of curved paths):

```lua
local function catmullRom(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, t: number): Vector3
	local t2, t3 = t * t, t * t * t
	return 0.5 * ((2 * p1) + (-p0 + p2) * t
		+ (2 * p0 - 5 * p1 + 4 * p2 - p3) * t2
		+ (-p0 + 3 * p1 - 3 * p2 + p3) * t3)
end

local function samplePath(shots: { CFrame }, u: number): CFrame
	-- u from 0 to 1 across the whole path
	local n = #shots
	local f = u * (n - 1)
	local i = math.clamp(math.floor(f) + 1, 1, n - 1)
	local t = f - (i - 1)
	local p0 = shots[math.max(i - 1, 1)].Position
	local p1, p2 = shots[i].Position, shots[i + 1].Position
	local p3 = shots[math.min(i + 2, n)].Position
	local pos = catmullRom(p0, p1, p2, p3, t)
	local rot = shots[i].Rotation:Lerp(shots[i + 1].Rotation, t * t * (3 - 2 * t)) -- smoothstep
	return CFrame.new(pos) * rot
end
```

Drive `u` with an ease (for example smoothstep on overall time) so the move starts and ends gently. Uneven spacing between waypoints changes speed; space points evenly or re-parameterise by distance if speed matters.

## Look-at shots

For "camera orbits the boss" moments, compute position from the path and aim with `CFrame.lookAt(pos, target.Position)` instead of authoring rotations. Smooth the look target (exponential damping) so a moving boss doesn't make the camera twitch.

## Presentation

| Element | Default |
|---|---|
| Letterbox bars | Two black frames, each about 10-12% of screen height, tween in over 0.3 s |
| HUD | Hidden; restore on exit |
| Core GUI | `StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)` during, then restore what you had |
| FOV | 40-60 for cinematic shots, back to the player's value on exit |
| Depth of field | Optional `DepthOfFieldEffect` focus on the subject; remove on exit |
| Subtitles | On by default during cutscenes |

## Skip and replay rules

- Skip button or key (and gamepad button) visible after about 1 second. Make skip **instant** and safe: jump the timeline to the end state, then run exit.
- First-time cutscenes can be unskippable for at most a few seconds; repeat viewings should always be skippable. Store "seen" flags in player data.
- Multiplayer: never freeze everyone's camera for one player's cutscene unless the game is designed around it. Personal cutscenes are client-side only.
- Keep cutscenes short (5-20 s). Roblox players leave long unskippable intros.

## Controls

Disabling movement is usually done through the default PlayerModule's controls (`require(player.PlayerScripts.PlayerModule):GetControls():Disable()` and `:Enable()`). It's widely used in community code but belongs to the default player scripts rather than a documented engine API (unverified in the official docs), so wrap it in your own function in case it changes.

## Related
[[Camera Game Feel - Hub]] · [[Custom Camera Systems in Luau]] · [[Frame-Rate Independent Camera Smoothing]] · [[Loading, Intro and Outro]]
