---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "True First Person - Seeing Your Own Body with LocalTransparencyModifier"
tags: [roblox, community-knowledge, characters, first-person, camera, transparency]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://devforum.roblox.com/t/first-person-arm-view/964912
  - https://devforum.roblox.com/t/how-can-i-put-first-person-arms-into-the-players-viewport/2269957
---
# True First Person - Seeing Your Own Body with LocalTransparencyModifier

When the default camera zooms into first person, Roblox hides your whole character so the head does not block the view. Horror and immersive games often want the opposite: look down and see your legs, see your arms holding a flashlight. This "true first person" (or "body cam") look is done with one client-only property, `BasePart.LocalTransparencyModifier`, plus a camera offset so the head does not fill the screen.

## How the property works

`LocalTransparencyModifier` multiplies `Transparency` on **this client only**; it never replicates. The final value is `1 - (1 - Transparency) * (1 - LocalTransparencyModifier)`. The default camera scripts set it to 1 on body parts when you zoom in. To show the body, set it back to 0 every frame, because the camera can re-apply it.

```lua
-- LocalScript in StarterCharacterScripts
local RunService = game:GetService("RunService")
local character = script.Parent
local HIDDEN_TYPES = {
	[Enum.AccessoryType.Hat] = true, [Enum.AccessoryType.Hair] = true,
	[Enum.AccessoryType.Face] = true, [Enum.AccessoryType.Neck] = true,
}

local function shouldHide(part: BasePart): boolean
	if part.Name == "Head" then return true end
	local acc = part.Parent
	return acc:IsA("Accessory") and HIDDEN_TYPES[acc.AccessoryType] == true
end

RunService.RenderStepped:Connect(function()
	for _, part in character:GetDescendants() do
		if part:IsA("BasePart") then
			part.LocalTransparencyModifier = shouldHide(part) and 1 or 0
		end
	end
end)
```

Looping descendants each frame is fine for one character; cache the list on `DescendantAdded` / `DescendantRemoving` if you also show other things.

## What to keep hidden

| Part | Show? | Why |
| --- | --- | --- |
| Head, face, hair, hats, glasses | Hide | They sit where the camera is |
| Neck accessories, collars | Usually hide | Clip into the bottom of the view |
| Torso, arms, legs | Show | The point of the effect |
| Layered clothing | Show | Hidden-surface removal already handles under-layers |

Hiding by `AccessoryType` (Hat, Hair, Face, Neck) is more reliable than by name.

## Camera position

With the camera in the head, looking down shows the inside of the torso. Fixes, often combined:

- `Humanoid.CameraOffset = Vector3.new(0, 0, -1)` pushes the camera slightly forward (local to the root) so you look past the chest.
- Lock first person with `StarterPlayer.CameraMode = Enum.CameraMode.LockFirstPerson` (or set `Player.CameraMode` from a script).
- Limit look-down pitch with your own camera script if the inside of the neck is still visible.

## Animation side effects

- Default animations swing the arms in front of the camera while running; many games author first-person-friendly walk/run clips with lower arm swing, played only for the local player.
- Head-bob comes for free (the head moves with animation), which can be too strong; offset the camera by a damped version of the head motion instead of the raw value.

## When to use a viewmodel instead

True first person is great for exploration and horror. For shooters, a separate viewmodel is usually better: arms and weapon render with tuned offsets and never clip into walls. Some games mix both: body visible from the neck down, plus a viewmodel for arms when a weapon is equipped.

## Pitfalls

- Shadows: hidden parts still cast shadows unless `CastShadow` is off; a missing head shadow looks odd, so most games leave it.
- Mirrors and ViewportFrames show what is really rendered; a hidden head is hidden there too.
- Do not set `Transparency` instead; that replicates and hides your head for everyone.

## Related
[[Characters Customization - Hub]] · [[First-Person Viewmodels - Arms Rig, Camera Binding and Sway]] · [[Character Controllers]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]]
