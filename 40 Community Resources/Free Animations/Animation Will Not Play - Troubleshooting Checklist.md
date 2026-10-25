---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/animation-will-not-play-checklist"
title: "Animation Will Not Play - Troubleshooting Checklist"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original text and Luau"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/animation/using
  - https://devforum.roblox.com/t/2388217
  - https://devforum.roblox.com/t/animation-not-playing/2016927
  - https://devforum.roblox.com/t/animations-not-playing-in-the-actual-game/1902491
  - https://devforum.roblox.com/t/sharing-animation-assets-with-connections-and-groups/3892540
cssclasses: [tg-a40]
---

# Animation Will Not Play - Troubleshooting Checklist

> Distilled from the recurring "animation not playing" threads on the DevForum (the same questions dominate r/robloxgamedev). Work top to bottom; the first three cover most cases.

## The checklist

# | Symptom | Likely cause | Fix
---|---|---|---
1 | Works for you in Studio, not for others / not in the live game | **Ownership**: the animation is owned by you, the game by a group (or vice versa) | Re-publish under the game owner, or grant the experience in Permissions ([[Animation Permissions and Sharing - 2025 Update]])
2 | Plays but the default walk/idle "wins" | **Priority** too low (Core/Idle) | Set Movement/Action in the editor before publishing, or `track.Priority = Enum.AnimationPriority.Action` ([[Animator Priorities, Weights and Blending Done Right]])
3 | Nothing happens, no error | **Rig mismatch**: R15 animation on an R6 character (or custom rig with different part names) | Check `Humanoid.RigType`; publish one version per rig
4 | Others see it late or not at all | Played on the **server** for a player character after they joined, or loaded on the wrong side | For player characters, load and play on that player's client via the Animator; it replicates. NPCs: play on the server
5 | Plays once then stops (should loop) | Looping not set when published | Tick Looping in the editor or set `track.Looped = true` before `Play()`
6 | Freezes on the last pose | Played with no stop logic, or ends on a held keyframe | Stop it on `track.Stopped`, or add a recovery pose
7 | Wrong ID format error | Pasted the **catalog/bundle** ID instead of the animation asset ID | Use the animation asset ID as `rbxassetid://<id>`
8 | Character slides frozen after swapping Animate IDs | IDs from a pack that failed to load, or tracks still running | Stop playing tracks, then replace the `Animate` values (see [[Use animations]])
9 | Jitter / fights another animation | Two tracks of the same priority on the same joints | Separate priorities or fade one out
10 | Imported FBX looks twisted | Rest-pose mismatch on import | Re-import with the right **Rest Pose Source** ([[Clip Editor Import Settings - August 2026 Update]])

## Diagnostic snippet (original Luau, run in a LocalScript while testing)

```lua
-- Prints every playing track on the local character with its priority and owner-visible ID.
local Players = game:GetService("Players")

local function dumpTracks(character: Model)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		warn("[AnimCheck] No Animator under the Humanoid - animations cannot replicate")
		return
	end
	print(("[AnimCheck] RigType=%s"):format(humanoid.RigType.Name))
	for _, track in animator:GetPlayingAnimationTracks() do
		print(("[AnimCheck] %s | id=%s | priority=%s | weight=%.2f | looped=%s | length=%.2f"):format(
			track.Name, track.Animation.AnimationId, track.Priority.Name,
			track.WeightCurrent, tostring(track.Looped), track.Length))
	end
end

local player = Players.LocalPlayer
if player.Character then dumpTracks(player.Character) end
player.CharacterAdded:Connect(function(character)
	task.wait(2) -- give the Animate script time to start
	dumpTracks(character)
end)
```

- `Length` stays **0** until the animation asset has loaded. A track that stays at 0 is usually blocked (ownership / bad ID).
- No line for your track at all = `Play()` never ran, or ran on another Animator.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Animator Priorities, Weights and Blending Done Right]] · [[Debugging Playbook]] · [[Animator]] · [[AnimationTrack]] · [[Use animations]] · [[Works in Studio, Breaks Live - Checklist]]

<!-- TDOD_GRAPH_END -->
