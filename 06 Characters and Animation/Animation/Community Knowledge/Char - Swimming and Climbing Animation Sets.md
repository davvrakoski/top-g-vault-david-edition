---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Char - Swimming and Climbing Animation Sets"
tags: [roblox, community-knowledge, animation, swimming, climbing, humanoid]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/characters/character-controller-library
---
# Char - Swimming and Climbing Animation Sets

Swim and climb are the two locomotion states players notice most when they look wrong: a character that runs in place underwater or slides up a ladder in a T-pose breaks the feel instantly. On a Humanoid character both states are driven by the default `Animate` script, so replacing them is mostly about knowing which slots exist, what triggers each state, and how speed is reported.

## What triggers each state

| State | Trigger | Signal |
|---|---|---|
| `Enum.HumanoidStateType.Swimming` | Character is inside **Terrain water** (not a blue Part) | `Humanoid.Swimming(speed)` |
| `Enum.HumanoidStateType.Climbing` | Humanoid faces climbable geometry: a `TrussPart`, or a ladder of `Part` rungs with gaps it can step on | `Humanoid.Climbing(speed)` |

- Water made from Parts never triggers Swimming. Fake water needs your own state (custom gravity + a looping swim track), or use Terrain water.
- `Climbing` speed is signed: negative while climbing down, near 0 while holding still. Use it to pause the climb clip, not just to scale it.

## The animation slots

The R15 `Animate` LocalScript (copied into each character) holds `StringValue` folders, each with an `Animation` child: `climb`, `swim`, `swimidle`, plus walk, run, jump, fall, idle and others. Two safe ways to swap them:

1. **HumanoidDescription (preferred for players):** set `SwimAnimation` and `ClimbAnimation` (asset IDs of animation *packages* or published animations) then `Humanoid:ApplyDescription()`. This also survives respawn if you reapply on `CharacterAdded`.
2. **Edit the Animate script values:** on `CharacterAdded`, wait for `Animate`, then set `Animate.swim.Swim.AnimationId` (child names can differ: always `FindFirstChildWhichIsA("Animation")`). Change IDs **before** the state first plays, otherwise the old track stays cached until the state is re-entered.

```lua
-- LocalScript in StarterCharacterScripts
local animate = script.Parent:WaitForChild("Animate")
local function setSlot(slot, id)
	local folder = animate:FindFirstChild(slot)
	local anim = folder and folder:FindFirstChildWhichIsA("Animation")
	if anim then anim.AnimationId = id end
end
setSlot("swim", "rbxassetid://0000000") -- your stroke loop
setSlot("swimidle", "rbxassetid://0000000") -- treading water
setSlot("climb", "rbxassetid://0000000")
```

## Authoring tips

- **Swim stroke:** loop length 1.0-1.4 s reads well at default `WalkSpeed` 16. Keep the root (LowerTorso) roughly level; the engine already tilts nothing for you, so a body that is pitched forward in the clip is what sells horizontal swimming.
- **Swim idle:** slow treading loop (2-3 s), head above the water line. The default script switches between swim and swimidle on a speed threshold, so make the transition pose of both clips similar.
- **Climb:** author one full hand-over-hand cycle that matches rung spacing (Truss cells are 2 studs). The `Animate` script scales climb playback by climb speed, so a clip keyed for speed 1 will look correct at any `WalkSpeed`.
- Set priority to `Core` or `Movement` for these loops so action tracks (attacks, flinches) can still layer on top.

## Pitfalls

- Climb clips that move the root out of place push the character off the ladder; keep it in-place.
- Custom rigs without the standard `Animate` script get none of this: you must connect `Humanoid.StateChanged` and play tracks yourself.
- On the Character Controller Library stack, swimming and climbing are separate controllers (`SwimController`, `ClimbController`) and you drive animation from the active controller instead.

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Humanoid vs Character Controller Library - Choosing a Movement Stack]] · [[Sprint, Crouch and Slide - A Movement State Layer over the Humanoid]]
