---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Cutscene Timeline Runner - Tracks, Seeking and Safe Cleanup"
tags: [roblox, community-knowledge, story, cutscene, tweenservice, timeline]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/animation/events
---
# Cutscene Timeline Runner - Tracks, Seeking and Safe Cleanup

Most first cutscenes on Roblox are a long chain of `tween:Play()` and `task.wait(2)`. That works until you need to **skip**, **start halfway for a late joiner**, **pause**, or **stop cleanly when the player dies**. A yield chain cannot jump to second 7.5; it can only wait through it. The fix is a small **timeline runner**: the cutscene is data (tracks of keyed events on a shared clock) and one function evaluates "what should be true at time *t*". Camera paths and letterboxing are covered in [[Cutscene Cameras - Spline Paths, Letterbox and Skip]]; this note is the engine that sequences camera, dialogue, sound, animation and world changes together.

## Cutscene as data

```lua
-- ReplicatedStorage/Cutscenes/Ch1Intro
return {
	length = 14,
	tracks = {
		camera = { -- keyed shots; the runner interpolates between them
			{t = 0,  shot = "WideHall"},
			{t = 5,  shot = "DoorClose", ease = "Sine"},
			{t = 10, shot = "FaceMara"},
		},
		dialogue = {
			{t = 1.0, key = "CH1_MARA_01", dur = 3.5},
			{t = 10.5, key = "CH1_MARA_02", dur = 3},
		},
		sound = {
			{t = 4.8, id = "DoorSlam"},
		},
		anim = {
			{t = 0, rig = "Mara", anim = "Mara_Walk"},
			{t = 9.5, rig = "Mara", anim = "Mara_Turn"},
		},
		world = { -- state changes that must exist even if skipped
			{t = 5, op = "SetDoor", id = "HallDoor", open = false},
		},
	},
}
```

Two kinds of track behave differently:

- **Continuous** tracks (camera, fades, FOV) have a value at every moment. The runner computes it from the surrounding keys.
- **Event** tracks (sound, dialogue start, animation start, world ops) fire once when the clock passes their `t`.

## The runner loop

```lua
local RunService = game:GetService("RunService")

local function run(cut, startAt, onDone)
	local t = startAt or 0
	local fired = {}
	local alive = true
	local conn
	conn = RunService.RenderStepped:Connect(function(dt)
		t += dt
		applyCamera(cut.tracks.camera, t)             -- continuous
		for name, track in cut.tracks do
			if name ~= "camera" then
				for i, ev in track do
					local id = name .. i
					if not fired[id] and t >= ev.t then
						fired[id] = true
						fire(name, ev, t - ev.t)      -- pass lateness for seeking
					end
				end
			end
		end
		if t >= cut.length then
			conn:Disconnect(); alive = false; onDone()
		end
	end)
	return function() -- cancel / skip handle
		if alive then conn:Disconnect(); alive = false; onDone() end
	end
end
```

The `lateness` argument matters for seeking: if a late joiner starts at t = 6, the door-slam sound at 4.8 is 1.2 s late. `fire()` should **skip one-shot sounds** that are more than about 0.3 s late, **start animations** at `TimePosition = lateness`, and **show dialogue** only if it is still within its `dur`.

## Skipping = apply the end state

Skip is not "stop". It is "jump to the end, then exit":

1. Fire every **world** event not yet fired (doors closed, NPCs moved, items given). These must happen whether watched or not.
2. Do **not** fire sounds or dialogue.
3. Put actors at their final pose (stop tracks, `PivotTo` their end CFrame).
4. Run the shared exit (camera back to `Custom`, controls on, HUD back).

Keep **gameplay consequences on the server** (giving a key, starting the monster). The client cutscene only presents them. Then a skipped or broken cutscene can never block progress.

## Cleanup you can trust

Everything a cutscene creates (tweens, connections, cloned props, sounds, `AnimationTrack`s) goes into one cleanup list (a Trove or Janitor-style object, or a plain table of functions). The exit function runs it whether the cutscene ended, was skipped, the player died (`Humanoid.Died`), or the character was removed.

Animation markers (`AnimationTrack:GetMarkerReachedSignal("Impact")`) are a good way to time sounds to animation hits, but they will not fire if you seek past them. For seekable cutscenes, put the sound on the timeline at the marker's time instead.

## Authoring tips

- Keep cutscene length to 5-20 s on Roblox; split longer scenes with gameplay between.
- Name shots, not coordinates: `shot = "DoorClose"` refers to a camera part in a `Cutscenes` folder so level designers can move it.
- Preview tool: a Studio-only command that runs a cutscene from any `t`. You will use it a hundred times.
- Subtitles come from the dialogue track automatically ([[Subtitles and Captions - Readable Defaults for Roblox]]).

## Pitfalls

- **`task.wait` drift:** waits are not exact; a yield chain slowly desyncs from music. A clock-driven loop does not.
- **Dialogue that blocks** on a click inside a cutscene breaks seeking and group viewing. Make cutscene dialogue timed; use the conversation UI only outside cutscenes ([[NPC Conversation UX - Prompts, Typewriter Text and Skipping]]).
- **Server-run cutscene cameras.** The camera is client-only; the server only says which cutscene to start and when.

## Related
[[Story Quests Cinematics - Hub]] · [[Cinematic and Cutscene Direction]] · [[Cutscene Cameras - Spline Paths, Letterbox and Skip]] · [[Dialogue and Cutscene Blueprint]]
