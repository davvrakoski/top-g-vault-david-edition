---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Animating Props and Creatures with AnimationController - Doors, Chests and Beasts"
tags: [roblox, community-knowledge, animation, animationcontroller, props, creatures, rigs]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AnimationController
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
  - https://create.roblox.com/docs/reference/engine/classes/Bone
  - https://create.roblox.com/docs/animation/editor
---
# Anim - Animating Props and Creatures with AnimationController - Doors, Chests and Beasts

Not everything that moves needs a Humanoid or a tween. A treasure chest that creaks open with a bounce, a vending machine that shakes, a drawbridge, a four-legged creature, a flag: all of these can be keyframed in the Animation Editor and played with an `AnimationController`. You get easing, markers, blending and priorities for free, and the Humanoid's physics and state machine cost goes away.

## When to pick what

| Need | Use |
|---|---|
| One part moving A to B, no style | `TweenService` on a CFrame or a hinge |
| Several parts moving together with keyed timing (lid, lock, gems) | `AnimationController` + `Motor6D` rig |
| Organic deformation (tentacle, tail, cloth flap) | Skinned `MeshPart` with `Bone`s + `AnimationController` |
| Walks around, pathfinds, takes damage like a character | Humanoid or a controller-based NPC |

## Rig a prop in five steps

1. Group the parts into a `Model`. Pick a **root part** (the chest base) and set it as `PrimaryPart`. Anchor only the root.
2. Join each moving part to its parent with a `Motor6D` (`Part0` = parent, `Part1` = moving part). Put the joint's pivot where the part should rotate (for a lid: the hinge line) by setting `C0`/`C1`, or with a rig plugin.
3. Unanchor every non-root part and check that welds do not also hold them (a `WeldConstraint` on the lid will fight the motor).
4. Add an `AnimationController` to the model and an `Animator` under it.
5. Open the Animation Editor, select the model, key the clip, publish, and play it with `Animator:LoadAnimation()`.

Skinned meshes imported from Blender arrive with `Bone` instances already; steps 2-3 are replaced by the bone hierarchy.

## Playing it

```lua
local chest = workspace.Chest
local animator = chest.AnimationController.Animator

local openAnim = Instance.new("Animation")
openAnim.AnimationId = "rbxassetid://CHEST_OPEN"
local openTrack = animator:LoadAnimation(openAnim)
openTrack.Looped = false

chest.ProximityPrompt.Triggered:Connect(function()
	openTrack:Play(0.1)
	openTrack:GetMarkerReachedSignal("LidUp"):Once(function()
		-- spawn loot VFX exactly when the lid clears
	end)
end)
```

To hold the final pose after a one-shot ends, pause at the end instead of letting it stop: listen for the marker at the last frame and call `openTrack:AdjustSpeed(0)`. Otherwise joints return to their rest pose when the track stops.

## Replication rule

From the `Animator` reference: for an `Animator` that is not inside a player's character, tracks must be **loaded and played on the server** to replicate, and the `Animator` must be created on the server. That gives you two clean options:

- **Shared state** (a door everyone sees open): play on the server.
- **Cosmetic, many copies** (100 swaying lanterns, fish): play on each client with a client-created `Animator`; it will not replicate, which is exactly what you want for cheap ambient motion.

## Creatures

- Quadrupeds and monsters can be pure `AnimationController` rigs moved by your own code (`AlignPosition`/`AlignOrientation` or CFrame stepping), which is far cheaper than a Humanoid for crowds.
- Keep a consistent rest pose and joint naming across creature variants so one clip set fits many skins.
- Movement code should pick clips by speed (idle / walk / run) and play them through one `Animator`, the same way you would for a character.

## Pitfalls

- Root part unanchored and no physics constraint: the whole prop falls through the map.
- Animation Editor refuses the model: it needs a root part and joints; check that every moving part is connected through `Motor6D` or `Bone` back to the root.
- Lid snaps back after opening: the track stopped; hold the last pose or switch to a looping "open idle" clip.
- Too many always-playing prop animations on the server cost replication; move ambient ones to clients.

## Related
[[Animation - Hub]] · [[NPC Animation at Scale - Where to Play Tracks and Animator LOD]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Perf - Humanoid Cost Knobs for NPCs - States, EvaluateStateMachine and Humanoid-Free Rigs]]
