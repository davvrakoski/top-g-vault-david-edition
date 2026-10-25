---
area: "06 Characters and Animation"
cluster: "Animation"
title: "First-Person Viewmodels - Arms Rig, Camera Binding and Sway"
tags: [roblox, community-knowledge, animation, fps, viewmodel, camera]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/enums/RenderPriority
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://devforum.roblox.com/t/the-first-person-element-of-a-first-person-shooter/160434
  - https://devforum.roblox.com/t/animating-fps-viewmodel-arms/1122319
  - https://devforum.roblox.com/t/how-can-i-put-first-person-arms-into-the-players-viewport/2269957
---
# First-Person Viewmodels - Arms Rig, Camera Binding and Sway

Every serious Roblox shooter hides the real character in first person and draws a separate, client-only "viewmodel": a pair of arms plus the weapon, glued to the camera. This lets you animate reloads and inspects at close range with exaggerated poses, a tighter field of view feel and no clipping into walls, while other players still see your normal third-person character. The pattern is old and stable on the DevForum; the details below are the parts people usually get wrong.

## Rig layout

```
Viewmodel (Model, PrimaryPart = CameraBone)
  CameraBone (Part, Anchored, CanCollide/CanQuery/CanTouch off, Transparency 1)
  LeftArm / RightArm (MeshParts, CanCollide off, CastShadow off)
  Weapon (Model welded or Motor6D'd to a GunRoot part)
  AnimationController > Animator
  Motor6Ds: CameraBone -> each arm, CameraBone -> GunRoot
```

- The **root sits at the camera position**; animations are authored relative to it, so "arms in front of the eyes" is just the arm offsets.
- Use an `AnimationController` with an `Animator`, not a `Humanoid`. You get tracks, priorities and markers without humanoid physics.
- Turn off `CastShadow` on viewmodel parts, or the floating arms cast a shadow onto walls in front of you.

## Binding to the camera

Update **after** the camera script has moved the camera, before the frame draws:

```lua
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local vm = viewmodelTemplate:Clone()
vm.Parent = camera  -- client-only; parenting to Camera is a common choice

RunService:BindToRenderStep("Viewmodel", Enum.RenderPriority.Camera.Value + 1, function(dt)
	vm:PivotTo(camera.CFrame * swayOffset(dt))
end)
```

`Enum.RenderPriority.Camera` is 200, so `+1` runs right after the default camera. Binding to `RenderStepped` without a priority can run before the camera and gives a one-frame lag that looks like jitter.

## Hiding the real body

The default camera sets `LocalTransparencyModifier` on body parts when zoomed in. Your own code may need to re-apply it each frame (the camera can reset it on zoom changes): set it to `1` on arms and accessories you do not want, or to `0` if you want visible legs ("true first person").

## Sway and bob (keep it small)

- **Mouse sway:** read the camera's rotation delta each frame, feed it into a spring, and rotate the viewmodel by a fraction of it (a few degrees max).
- **Walk bob:** `sin(t * speed) * amplitude` on X and `abs(sin)` on Y, scaled by `HumanoidRootPart.AssemblyLinearVelocity.Magnitude / WalkSpeed`.
- **Aim down sights:** lerp an offset CFrame from hip to an `AimPoint` attachment on the weapon so its sight lines up with the camera centre.
- Clamp every offset; the most common complaint in playtests is motion sickness from sway that is too strong.

## Animating it

- Author the viewmodel clips in the Animation Editor on a copy of the rig placed at the origin, with a camera part showing the eye position.
- Keep the third-person tool animations separate: other players never see viewmodel clips, so you still need a third-person reload clip on the real character.
- Fire gameplay from the server's view of time, not from viewmodel markers alone; use markers for sounds and casings.

## Pitfalls

- Viewmodel parts with `CanQuery` on will block your own raycasts.
- Huge FOV changes stretch the arms; many games keep arm offsets tuned for FOV 70 and adjust slightly per FOV.
- Do not replicate the viewmodel to the server; it is purely visual and per player.

## Related
[[Animation - Hub]] · [[Animating Tools and Weapons with Motor6D Grips]] · [[Springs and Damping for Game Feel]] · [[Animation Markers for Hit Frames, Footsteps and Sync]]
