---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Crowd Variation - Speed Offsets, Random Start Times and Clip Pools"
tags: [roblox, community-knowledge, animation, npc, crowds, variation]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Anim - Crowd Variation - Speed Offsets, Random Start Times and Clip Pools

Spawn twenty NPCs with the same walk and idle and they move like a marching band: same step, same breath, same head bob, all on the same frame. Players read that instantly as "copy-pasted". You rarely need more clips to fix it; three cheap per-instance tweaks on `AnimationTrack` remove most of the sync, and a small clip pool handles the rest.

## The three cheap knobs

| Knob | API | Typical range | What it hides |
|---|---|---|---|
| Random start phase | `track.TimePosition` after `Play()` | 0 to `track.Length` | everyone stepping on the same frame |
| Speed offset | `track:AdjustSpeed(s)` or the `speed` arg of `Play` | 0.9-1.1 for walk, 0.85-1.15 for idle | identical rhythm |
| Start delay | `task.delay(rng:NextNumber(0, 0.6), ...)` | 0-0.6 s | the whole crowd starting together after a spawn wave |

Keep walk speed offsets small (about +/-10 %) or match them with the NPC's `WalkSpeed`, otherwise feet slide. Idles can vary more because the feet do not travel.

## Clip pools

Give each role a pool of 2-4 clips per state and pick one per NPC at spawn:

```lua
local Pools = {
	Shambler = { Walk = { "rbxassetid://W1", "rbxassetid://W2", "rbxassetid://W3" },
	             Idle = { "rbxassetid://I1", "rbxassetid://I2" } },
}

local rng = Random.new()

local function playVaried(animator: Animator, id: string, baseSpeed: number)
	local a = Instance.new("Animation")
	a.AnimationId = id
	local t = animator:LoadAnimation(a)
	t.Looped = true
	local speed = baseSpeed * rng:NextNumber(0.9, 1.1)
	t:Play(0.2, 1, speed)
	t.TimePosition = rng:NextNumber(0, math.max(t.Length - 0.05, 0))
	return t, speed
end
```

Notes on the snippet:

- `Length` is 0 until the animation asset has loaded. If you see every NPC starting at 0, wait for `t.Length > 0` (or preload the IDs at server start) before setting `TimePosition`.
- Cache the `Animation` objects per ID so 200 NPCs share 5 instances; still load one track per NPC `Animator` (tracks are per animator).
- If the NPC's `WalkSpeed` also varies, scale the walk clip speed by `WalkSpeed / authoredSpeed` and add the random offset on top.

## Seed by NPC, not by frame

For NPCs that stream in and out, use a seeded `Random.new(npcId)` so the same NPC always gets the same clip and speed. It stops a guard from switching walk style every time you walk away and come back.

## Beyond timing

- **Mirrored clips.** A mirrored copy of a limp or a lean doubles the pool for free (mirror in Blender or your animation tool before upload; check that left/right joint names swap correctly).
- **Weighted extra layer.** A low-weight overlay (head tilt, arm sway) at weight 0.2-0.5 on some NPCs changes silhouettes without new full-body clips.
- **Scale and proportions.** Small height differences (`Model:ScaleTo` 0.95-1.05) break the "clone" look as well as any animation change.
- **Idle breaks.** Pair with the idle variety scheduler so each NPC fidgets on its own timer.

## Where to run it

Play crowd tracks where your NPC animation already runs (see the NPC animation at scale note). If clients play NPC animation locally, every client rolls its own random phase; that is fine for ambient crowds, but use the seeded roll when two players compare what they see (for example, a boss telegraph).

## Checklist

- [ ] No two adjacent NPCs share clip + phase + speed.
- [ ] Walk speed offsets within about 10 % or matched to `WalkSpeed`.
- [ ] `TimePosition` set after the clip length is known.
- [ ] Seeded per NPC id for persistent NPCs.

## Related
[[Animation - Hub]] · [[NPC Animation at Scale - Where to Play Tracks and Animator LOD]] · [[Anim - Idle Variety and Fidgets - Weighted Idles and Random Idle Breaks]] · [[Seeded Random - Deterministic Worlds with Random.new]]
