---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/mocap-cleanup-for-roblox"
title: "Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original workflow text + original Luau"
sources:
  - https://rancidmilk.itch.io/free-character-animations
  - https://quaternius.itch.io/universal-animation-library
  - http://mocap.cs.cmu.edu/faqs.php
  - https://create.roblox.com/docs/avatar/emotes/export
cssclasses: [tg-a40]
---

# Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide

> Free mocap (CMU, ACCAD, RancidMilk, Rokoko packs) is raw: it travels, it jitters, it does not loop, and it is 120 fps. Roblox wants **in-place, 30 fps, looping** clips because the **Humanoid moves the character**, not the animation. This is the cleanup pass to do in Blender before export.

## The five-step pass

Step | Why | How in Blender
---|---|---
1. **Trim** | Mocap takes start/end with T-poses and walking into frame | Set scene Start/End to the usable part; the Roblox export docs require Start/End to cover exactly the animation
2. **Resample to 30 fps** | CMU is 120 Hz; dense keys bloat uploads and make editing painful | Scene frame rate 30 + bake (Pose > Animation > Bake Action, every frame); UAL v2.1 had to fix clips that were 24 fps instead of 30
3. **Remove travel (in-place)** | Roblox moves the HumanoidRootPart; baked travel makes the character run ahead of its collider and snap back | On the hips/LowerTorso: delete or flatten the forward X/Y location curve (keep the up/down bob). Quaternius ships "root motion disabled" versions for this reason; RancidMilk notes its clips are *not* in-place
4. **Make it loop** | Seams cause a hitch every cycle | Pick two frames with matching foot contacts, cut there, copy the first pose to the last frame, then smooth the last few frames (Graph Editor > Cycles modifier helps preview)
5. **De-jitter** | Marker noise shows up as shaking hands/feet | Graph Editor: select the noisy channels > Smooth Keys (or a Smooth modifier) - lightly, or contacts start to slide

## Matching speed in game (foot slide)
After in-place, foot slide is a **speed mismatch**: the clip's stride covers a set distance per cycle, but the Humanoid walks at `WalkSpeed`. Measure the clip once, then scale playback to the real speed.

```lua
-- Original Luau: scale a locomotion track so feet match the Humanoid's actual speed.
-- strideStudsPerSecond = how fast the clip "walks" at Speed 1 (measure in Studio once).
local function bindSpeedMatch(humanoid: Humanoid, track: AnimationTrack, strideStudsPerSecond: number)
	return humanoid.Running:Connect(function(speed: number)
		if speed < 0.1 then
			track:AdjustSpeed(1) -- idle handled by another track
			return
		end
		track:AdjustSpeed(math.clamp(speed / strideStudsPerSecond, 0.5, 2))
	end)
end
```

- Clamp the factor: beyond about 0.5x-2x the motion itself looks wrong; switch to a walk or sprint clip instead (gait switching is covered in [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]]).
- How to measure `strideStudsPerSecond`: play the in-place clip next to a part moving at a known speed and adjust until the planted foot stops sliding, or measure foot travel per cycle in Blender and convert with 1 stud = 0.28 m.

## Export checklist
- Leaf bones off, Simplify 0, only the cleaned action (official Blender export settings).
- Name the clip after state + variant (`Run_Fwd_01`) so permissions and IDs stay readable.
- Keep the source file and its license note together in your private project folder.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]] · [[Animation foot slide - state fighting]] · [[100STYLE Mocap - Catalog]] · [[Export emotes]]

<!-- TDOD_GRAPH_END -->
