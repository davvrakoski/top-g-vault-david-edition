---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Animation Principles for Game Clips - Anticipation, Follow-Through and Holds"
tags: [roblox, community-knowledge, animation, game-feel, animation-principles, keyframing]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gamedeveloper.com/production/the-12-principles-of-animation-in-video-games
  - https://www.gameanim.com/?p=115
  - https://create.roblox.com/docs/animation/editor
  - https://create.roblox.com/docs/animation/curve-editor
  - https://create.roblox.com/docs/reference/engine/enums/PoseEasingStyle
---
# Anim - Animation Principles for Game Clips - Anticipation, Follow-Through and Holds

The classic animation principles (anticipation, follow-through, slow in / slow out, arcs, exaggeration) were written for film, where nobody presses a button. In a game they fight with responsiveness: every frame of windup is a frame the player waits. This note turns the principles into concrete rules for clips made in the Roblox Animation Editor, so your moves look heavy without feeling laggy.

## The three phases of any action clip

Game Anim's "Fast vs Slow" article splits an action into **anticipation** (lead-in), **apex** (the frame the action does its job, such as the punch contact) and **recoil** (back to a neutral pose that blends into idle). Plan every clip in these three blocks before you key anything.

| Phase | Player character | Enemy / NPC |
|---|---|---|
| Anticipation | Very short (a few frames at 30 fps) so input feels instant | Longer and readable, so the player can dodge |
| Apex | 1-3 frames, put an animation marker here | Same, marker drives the hitbox |
| Recoil / follow-through | Can be long, but must be cancellable | Long recoil = punish window |

Rule of thumb from the Game Developer excerpt of Jonathan Cooper's book: move the "weight" out of the anticipation and into the follow-through. The sword snaps out fast, then settles slowly.

## Principles mapped to Roblox tools

- **Anticipation:** a small counter-move before the main move (pull the arm back, dip the hips). In the Animation Editor, key it 2-4 frames before the apex pose. For the player, keep the counter-move small in distance, not just in time, so it does not read as delay.
- **Follow-through and overlap:** different parts arrive at different times. Offset keys: torso leads, upper arm 1-2 frames later, hand and weapon 1-2 frames after that. Select the arm keys in the dope sheet and drag them right; it costs nothing at runtime.
- **Slow in / slow out:** set per-key easing (`Enum.PoseEasingStyle`: `Linear`, `Constant`, `Elastic`, `Bounce`, `CubicV2`; plain `Cubic` is deprecated). Use `CubicV2` on key poses and scrub to check which `PoseEasingDirection` gives the ease you want. `Constant` gives a hard snap (good for impact frames). The Curve Editor lets you shape tangents directly when presets are not enough.
- **Arcs:** hands and weapon tips should travel on curves. Scrub slowly and watch the hand (or the weapon tip) against a background grid. Break the arc only on purpose (a head snapping back on impact).
- **Holds:** a 2-6 frame hold on the apex pose makes the move readable. Pair it with hit-stop in code for contact hits.
- **Exaggeration:** Roblox cameras sit far away; poses that look "too big" in the editor read normally at gameplay distance. Check at gameplay camera distance, not zoomed in.
- **Squash and stretch:** Roblox rigs do not scale joints in animation, so fake it with pose extension (long reach on the apex, compact crouch on landing).

## Give control back early

Long follow-through is fine if the player can leave it. Put a `KeyframeMarker` named something like `CancelWindow` near the end of the recoil and let your combat or movement code accept new input after it fires:

```lua
local canCancel = false
track:GetMarkerReachedSignal("CancelWindow"):Connect(function()
	canCancel = true
end)
track.Stopped:Connect(function()
	canCancel = false
end)
```

If no input arrives, the full follow-through plays and the move keeps its weight.

## Checklist before upload

- [ ] Clip has clear anticipation / apex / recoil blocks.
- [ ] Player clips: anticipation short; enemy clips: anticipation long enough to react to.
- [ ] Apex has a marker; recoil has a cancel marker.
- [ ] Limbs overlap (staggered keys), not all moving on the same frame.
- [ ] Easing set on key poses; no accidental `Linear` robot motion.
- [ ] Reviewed at real camera distance and real playback speed.

## Related
[[Animation - Hub]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Combat Animation Authoring Tips]]
