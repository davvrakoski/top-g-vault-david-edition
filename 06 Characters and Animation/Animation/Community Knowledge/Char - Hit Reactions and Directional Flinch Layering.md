---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Char - Hit Reactions and Directional Flinch Layering"
tags: [roblox, community-knowledge, animation, combat, hit-reaction, flinch]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/enums/AnimationPriority
---
# Char - Hit Reactions and Directional Flinch Layering

A hit that plays no reaction feels like it missed. Good combat games answer every confirmed hit with three things inside about 100 ms: a short flinch on the victim, a pause or "hit-stop" on the attacker, and a sound/VFX. On Roblox the flinch is just another `AnimationTrack`, but it has to sit on top of locomotion without stopping it and without letting enemies stun-lock each other.

## Build a small reaction set

| Clip | Length | Joints keyed |
|---|---|---|
| `Flinch_Front`, `Flinch_Back`, `Flinch_Left`, `Flinch_Right` | 0.25-0.4 s | Upper body only (UpperTorso, Head, arms) |
| `Stagger_Heavy` | 0.6-0.9 s | Full body, small root step back |
| `Knockdown` (optional) | 1.0 s+ | Full body; hand off to ragdoll or get-up |

Key rule: a track only overrides joints that it actually keys. An upper-body-only flinch at `Action` priority leaves the legs on the walk/run cycle, so a player who is hit while running keeps running. That is the Roblox version of "additive upper-body layering".

## Pick the direction

Compare the attacker's position with the victim's facing in the victim's local space:

```lua
local function hitDirection(victimRoot, attackerPos)
	local localDir = victimRoot.CFrame:PointToObjectSpace(attackerPos)
	if math.abs(localDir.X) > math.abs(localDir.Z) then
		return localDir.X > 0 and "Right" or "Left"
	end
	return localDir.Z < 0 and "Front" or "Back" -- -Z is forward
end
```

## Play it right

```lua
local track = animator:LoadAnimation(flinchAnims[dir]) -- cache, load once
track.Priority = Enum.AnimationPriority.Action2
track:Play(0.05, 1, 1) -- fade 0.05 s, weight 1, speed 1
```

- **Fade in fast (0.03-0.08 s)** or the hit reads late. Fade out slower (0.15 s) so the pose recovers smoothly.
- **Scale weight by damage:** `track:AdjustWeight(math.clamp(damage / 40, 0.4, 1))` makes chip damage a twitch and big hits a full flinch, from one clip.
- **Restart instead of stacking:** if the same flinch is playing, call `track.TimePosition = 0` rather than loading a new track.
- **Priority ladder:** locomotion `Movement`, attacks `Action`, flinch `Action2`, stagger/knockdown `Action3`, death `Action4`. A heavy stagger should interrupt an attack; a chip flinch should not.

## Hit-stop and feel

- Freeze both tracks briefly with `AdjustSpeed(0)` for 0.04-0.08 s, then restore. Keep it short in PvP: long freezes feel like lag.
- Add a small procedural kick on top (spring on `Motor6D.Transform` of the torso) so repeated hits look different.
- Camera shake only for the player who was hit or who landed a heavy hit.

## Anti stun-lock rules

- Give each victim a **flinch cooldown** (for example 0.35 s); during it, damage still applies but no new flinch plays.
- Only `Stagger_Heavy` and `Knockdown` should cancel the victim's attack; light flinches are cosmetic.
- Decide reactions on the **server** (it knows the hit was valid), then fire the direction to clients. For player characters, the owning client plays the track so it replicates; NPC tracks play on the server.

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Procedural Animation, Springs and Recoil]]
