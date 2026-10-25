---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Sprint, Crouch and Slide - A Movement State Layer over the Humanoid"
tags: [roblox, community-knowledge, animation, movement, state-machine, humanoid]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
---
# Sprint, Crouch and Slide - A Movement State Layer over the Humanoid

The `Humanoid` has its own physics states (`Running`, `Jumping`, `Freefall`, `Landed`, `Climbing`, `Swimming`, `Seated`, `Physics`, `Dead` and so on), but it knows nothing about sprinting, crouching, sliding or aiming. Games that bolt these on with scattered booleans get the classic bugs: crouch-walk animation stuck after a jump, sprint continuing while swimming, slide that never ends. A small **movement state layer** that sits on top of the Humanoid's states fixes this and makes the animation choice one table lookup.

## Two layers, one owner

| Layer | Who owns it | Examples |
| --- | --- | --- |
| Physics state | `Humanoid` (read via `GetState()` / `StateChanged`) | Running, Freefall, Swimming, Climbing |
| Gameplay stance | Your client controller module | Walk, Sprint, Crouch, Slide, Aim |

The controller runs on the owning client (player characters are client-simulated), reads both layers, and decides: WalkSpeed, HipHeight/camera offset, which locomotion clip plays.

## Allowed-transition table

```lua
local Allowed = {
	Walk   = { Sprint = true, Crouch = true },
	Sprint = { Walk = true, Slide = true },
	Crouch = { Walk = true },
	Slide  = { Crouch = true, Walk = true }, -- exit only when timer ends
}

local function setStance(ctrl, new)
	if not Allowed[ctrl.stance][new] then return false end
	ctrl.stance = new
	ctrl:apply() -- speed, clip, hitbox
	return true
end
```

Force stance back to `Walk` whenever the Humanoid enters `Swimming`, `Climbing`, `Seated` or `Dead`. Hook this once:

```lua
humanoid.StateChanged:Connect(function(_, newState)
	if newState == Enum.HumanoidStateType.Swimming
		or newState == Enum.HumanoidStateType.Climbing
		or newState == Enum.HumanoidStateType.Seated then
		ctrl.stance = "Walk"
		ctrl:apply()
	end
end)
```

## Per-stance settings (typical starting values)

| Stance | WalkSpeed | Locomotion clip | Extra |
| --- | --- | --- | --- |
| Walk | 16 (Roblox default) | default run/walk | |
| Sprint | 24-26 | sprint loop at `Movement` priority | Drain stamina; block while aiming |
| Crouch | 8 | crouch idle + crouch walk | Lower `Humanoid.CameraOffset` Y by ~1.5; shrink hitbox |
| Slide | starts at sprint speed, decays to 0 in ~0.8 s | slide pose (`Action`) | `AutoRotate = false`; exit into Crouch if a ceiling is above |

The numbers are game-design starting points, not engine rules.

## Animation hookup

- Load stance clips once. Use `Movement` priority for stance loops so `Action` attacks still win.
- Speed-match: `track:AdjustSpeed(currentSpeed / clipAuthoredSpeed)` so feet do not slide at 24 WalkSpeed with a clip authored for 16.
- When stance changes, crossfade (0.15-0.2 s) rather than hard stop.

## Hitbox and ceiling checks

Crouching only visually is a common exploit-free but unfair bug: the player looks small but the server-side hitbox is full height. Options:

- Lower `Humanoid.HipHeight` while crouched (changes the actual standing height), or
- Keep the character, but use a separate server hit volume that shrinks with a replicated `Stance` attribute.

Before standing up, raycast or `Workspace:Blockcast` upward from the head; if blocked, stay crouched.

## Input

Bind sprint/crouch with `ContextActionService` so touch buttons come for free; support both hold-to-sprint and toggle (mobile players prefer toggle).

## Server's role

The server does not need to run stances, but it should clamp what matters: maximum horizontal speed per stance (anti speed-hack), and the replicated `Stance` attribute used for hit volumes and footstep loudness.

## Related
[[Animation - Hub]] · [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]] · [[Animation foot slide - state fighting]] · [[Character Controllers]]
