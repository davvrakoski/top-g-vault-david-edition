---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/combat-animation-authoring-tips"
title: "Combat Animation Authoring Tips"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original text + original Luau"
sources:
  - https://www.wayline.io/blog/level-up-indie-game-melee-combat
  - https://create.roblox.com/docs/animation/events
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://quaternius.itch.io/universal-animation-library-2
cssclasses: [tg-a40]
---

# Combat Animation Authoring Tips

> The vault already covers combat **systems** (hitboxes, combos, validation, hitstop - see Related). This note is the **animator's side**: how to build or adapt free attack clips so the system has something good to drive. Community consensus (DevForum, Reddit, indie melee write-ups like Wayline's): clear **anticipation - impact - recovery**, fast hits, slower recovery.

## The three phases, in frames at 30 fps

Phase | Light attack | Heavy attack | What sells it
---|---|---|---
Anticipation (wind-up) | 3-5 frames | 8-14 frames | Pull the weapon back, shift weight to the back foot, tense the shoulders. Too subtle = weak; too long = sluggish
Impact (active) | 2-3 frames | 3-4 frames | Fastest part of the clip; big arc, torso twist, front foot plants. Hold the contact pose 1-2 frames (or use hitstop in code)
Recovery | 6-10 frames | 12-20 frames | Overshoot then settle back to guard; this is where combos cancel

Starting points, not rules; tune them in [[Combat Feel Tuning Worksheet]].

## Authoring rules for Roblox
1. **Mark the windows in the animation**, not in code timers: add animation events `HitStart`, `HitEnd`, `CancelOpen` at the right frames. Free clips (UAL 2 melee, CMU fighting) need these added after import.
2. **Upper-body attacks, lower-body locomotion:** author attacks that only key the torso/arms when you want attack-while-moving; play them at Action priority so legs keep the walk cycle ([[Animator Priorities, Weights and Blending Done Right]]).
3. **No root motion:** Roblox clips do not move the character. Lunges and dashes = in-place animation + scripted velocity. Strip hip travel from mocap ([[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]]).
4. **Readability at game-camera distance:** exaggerate silhouettes; a pose that reads in a close-up can vanish at third-person zoom. Check in a play test, not in the editor close-up.
5. **Attack-speed stats:** scale with `AdjustSpeed`, so markers scale with it - another reason to keep windows in markers.
6. **Mirror pairs:** for combo strings, alternate sides (L/R) so the end pose of one swing flows into the anticipation of the next.

## Marker-driven windows (original Luau)

```lua
-- Client: play an attack and expose its hit / cancel windows from animation events.
local function playAttack(animator: Animator, animation: Animation, speed: number)
	local track = animator:LoadAnimation(animation) -- cache tracks in real code
	local state = { hitActive = false, canCancel = false }
	local connections = {}

	table.insert(connections, track:GetMarkerReachedSignal("HitStart"):Connect(function()
		state.hitActive = true
	end))
	table.insert(connections, track:GetMarkerReachedSignal("HitEnd"):Connect(function()
		state.hitActive = false
	end))
	table.insert(connections, track:GetMarkerReachedSignal("CancelOpen"):Connect(function()
		state.canCancel = true
	end))
	table.insert(connections, track.Stopped:Connect(function()
		state.hitActive, state.canCancel = false, false
		for _, c in connections do c:Disconnect() end
	end))

	track.Priority = Enum.AnimationPriority.Action
	track:Play(0.05, 1, speed)
	return track, state
end
```

- The client uses `state.hitActive` for local hit detection/feedback; the server still checks timing itself ([[Server Melee Validation]]).
- `canCancel` gates the next combo input ([[Combo Systems and Input Buffering]]).

## Free sources that suit combat
- Quaternius UAL 2 (melee, sword dash, knockback; CC0 per its page, use-only in this vault) - [[Quaternius Universal Animation Library - CC0 Use Notes]].
- CMU fighting/boxing takes (use-only) - [[CMU Mocap Database - License and Converted Sets]].
- Your own video capture for signature moves - [[Free Video Mocap Options for Roblox]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Melee Combo Blueprint]] · [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Combo Systems and Input Buffering]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Combat - Hub]]

<!-- TDOD_GRAPH_END -->
