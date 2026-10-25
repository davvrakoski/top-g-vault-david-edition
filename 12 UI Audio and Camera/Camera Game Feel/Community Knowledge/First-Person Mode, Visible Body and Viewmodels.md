---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "First-Person Mode, Visible Body and Viewmodels"
tags: [roblox, community-knowledge, camera, first-person, viewmodel, fps]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/camera
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# First-Person Mode, Visible Body and Viewmodels

Shooters, horror games and immersive sims usually want first person. Roblox gives a basic version for free (`CameraMode = LockFirstPerson`), but out of the box the body disappears, tools float, and the camera sits inside the head. There are two common upgrades: a **true first-person body** (you see your own legs and arms) and a **viewmodel** (a separate arms-and-weapon model drawn in front of the camera, like most FPS games). This note covers both and the comfort settings around them.

## Step 1: lock first person

```lua
local player = game.Players.LocalPlayer
player.CameraMode = Enum.CameraMode.LockFirstPerson
-- or allow zooming in and out but start in first person:
player.CameraMinZoomDistance = 0.5
player.CameraMaxZoomDistance = 0.5
```

`StarterPlayer` has the same properties to set the default for everyone. The default camera script locks the mouse to the centre in first person.

## Step 2a: showing your own body

The default camera hides your character in first person by setting `LocalTransparencyModifier` on its parts. It sets this every frame, so you must override it every frame too, after the camera updates:

```lua
local RunService = game:GetService("RunService")
local SHOW = { LeftUpperLeg = true, LeftLowerLeg = true, LeftFoot = true,
	RightUpperLeg = true, RightLowerLeg = true, RightFoot = true,
	LeftUpperArm = true, LeftLowerArm = true, LeftHand = true,
	RightUpperArm = true, RightLowerArm = true, RightHand = true }

RunService:BindToRenderStep("ShowBody", Enum.RenderPriority.Camera.Value + 1, function()
	local char = player.Character
	if not char then return end
	for _, part in char:GetChildren() do
		if part:IsA("BasePart") and SHOW[part.Name] then
			part.LocalTransparencyModifier = 0
		end
	end
end)
```

Keep the head, hair and hats hidden (they block the view). Push the camera forward slightly with `Humanoid.CameraOffset` (for example `Vector3.new(0, 0, -1)`) so you don't see inside the neck when looking down. Check this with several avatar body types: tall and wide avatars clip differently.

## Step 2b: viewmodel arms

A viewmodel is a client-only model (arms + weapon) positioned at the camera every frame. Players see crisp, well-animated hands regardless of their avatar; other players still see the normal third-person character holding the tool.

```lua
local viewmodel = game.ReplicatedStorage.Viewmodels.Rifle:Clone()
viewmodel.Parent = workspace.CurrentCamera -- local-only, never replicated
for _, p in viewmodel:GetDescendants() do
	if p:IsA("BasePart") then
		p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = false, false, false, false
		p.Anchored = true
	end
end

RunService:BindToRenderStep("Viewmodel", Enum.RenderPriority.Camera.Value + 1, function(dt)
	local cam = workspace.CurrentCamera
	viewmodel:PivotTo(cam.CFrame * swayOffset(dt) * bobOffset(dt))
end)
```

- Animate the viewmodel with its own `AnimationController` + `Animator` (unanchor the root and weld parts, or use bones) for reload and inspect.
- **Sway:** lag the viewmodel slightly behind mouse movement (smoothed rotation delta) and spring it back.
- **Bob:** small sine offset driven by movement speed; scale it to 0 when standing still.
- **Clipping into walls:** pull the viewmodel back along the camera's look direction when a short raycast from the camera hits something closer than the barrel. (Roblox has no separate weapon render layer.)
- Parent it under the camera, delete it on death and respawn, and hide the third-person tool locally.

## Camera feel in first person

| Setting | Suggested default | Note |
|---|---|---|
| FOV | 70-80, player slider | See the FOV note |
| Head bob | Small, with an off switch | Strong bob is a top motion-sickness trigger |
| Landing dip | 0.1-0.2 studs, spring back | Sells weight |
| Recoil | Rotational kick that recovers | Better than shake for guns |
| Shake | Much lower than in third person | Respect Reduce Motion |

## Mobile and gamepad

- Mobile first person needs a fire button and aim-drag area on the right; the default thumbstick stays on the left.
- Gamepad aim assist (slight slowdown or magnetism near targets) makes controller first person playable. Keep it client-side presentation; hit validation stays on the server.

## Pitfalls

- Parenting a viewmodel to `workspace` instead of the camera: other systems (raycasts, region queries) start hitting it.
- Forgetting `CanQuery = false`: your own bullets hit your own gun.
- Setting `LocalTransparencyModifier` once on spawn; the default camera script resets it every frame.

## Related
[[Camera Game Feel - Hub]] · [[Custom Camera Systems in Luau]] · [[FOV Punch, Sprint FOV and Zoom]] · [[Frame-Rate Independent Camera Smoothing]]
