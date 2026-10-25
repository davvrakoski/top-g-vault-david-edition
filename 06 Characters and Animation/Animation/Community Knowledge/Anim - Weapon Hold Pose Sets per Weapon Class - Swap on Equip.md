---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Weapon Hold Pose Sets per Weapon Class - Swap on Equip"
tags: [roblox, community-knowledge, animation, weapons, tools, pose-sets]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/using
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/enums/AnimationPriority
---
# Anim - Weapon Hold Pose Sets per Weapon Class - Swap on Equip

A pistol, a rifle, a greatsword and a flashlight should not all be held with the default "arm stuck out" tool pose. Games that feel finished give each **weapon class** its own hold pose set (idle hold, walk hold, aim, sprint-lower), and every weapon of that class shares the set. This note is about organising and swapping those sets; the grip joint itself is covered in the Motor6D grips note.

## Classes, not weapons

Author poses per class so 40 weapons need 5 pose sets, not 40:

| Class | Hold idle | Walk / run | Aim or guard | Sprint |
|---|---|---|---|---|
| Unarmed | default idle | default | fists up (optional) | default |
| One-hand light (pistol, knife, torch) | low ready, one arm | upper-body only | arm extended | arm down |
| Two-hand long (rifle, spear) | port arms across chest | upper-body only | shouldered | barrel low |
| Two-hand heavy (greatsword, hammer) | on shoulder | heavy upper body | guard stance | dragging / on shoulder |
| Shield + one-hand | shield forward | upper-body only | block raised | shield lowered |

Store the class on the Tool: `tool:SetAttribute("HoldClass", "TwoHandLong")`.

## How the layers stack

- **Locomotion** (`Core`/`Idle`/`Movement` from `Animate`) keeps the legs walking.
- **Hold pose** loops at `Movement` priority (or `Action` if your locomotion uses `Movement`) and keys **only** `UpperTorso`, arms and hands, maybe `Head`. Unkeyed joints fall through to locomotion, so legs keep moving.
- **Actions** (swing, reload, fire recoil) play at `Action`-`Action4` on top and win the arm joints while they run.
- **Aim** can be a second looping track at the same priority as the hold with weight blended from 0 to 1, or an IK chain.

## The tool slot in Animate

When a Tool with a handle is equipped, the default `Animate` script plays a "tool none" hold on the right arm (the slot is named `toolnone` in current R15 copies; check yours in a play session). Two choices:

1. Set that slot's AnimationId to an empty hold that keys nothing, then run your own class holds (recommended: one system owns the arms).
2. Swap the slot's ID per class on equip. Simple, but `Animate` caches tracks, so the new ID only shows after the slot is re-entered.

## Swap on equip (LocalScript in StarterCharacterScripts)

```lua
local animator = script.Parent:WaitForChild("Humanoid"):WaitForChild("Animator")
local HoldSets = require(game.ReplicatedStorage.HoldSets) -- class -> {Idle=id, Aim=id}

local cache = {}       -- class -> loaded tracks (load once, reuse)
local active = nil

local function tracksFor(class)
	if cache[class] then return cache[class] end
	local set = {}
	for name, id in HoldSets[class] do
		local a = Instance.new("Animation")
		a.AnimationId = id
		local t = animator:LoadAnimation(a)
		t.Priority = Enum.AnimationPriority.Movement
		t.Looped = true
		set[name] = t
	end
	cache[class] = set
	return set
end

script.Parent.ChildAdded:Connect(function(child)
	if not child:IsA("Tool") then return end
	local class = child:GetAttribute("HoldClass")
	if not class or not HoldSets[class] then return end
	if active then active.Idle:Stop(0.15) end
	local set = tracksFor(class)
	active = set
	set.Idle:Play(0.15)
	child.AncestryChanged:Once(function()
		set.Idle:Stop(0.15)
		if active == set then active = nil end -- a newer tool may own it now
	end)
end)
```

A Tool is parented into the character model while equipped, which is why `ChildAdded` on the character works as the equip hook.

## Authoring tips

- Make all hold poses from the **same rest grip** so a weapon swap only moves the arms, never the wrist offset.
- Keep the elbows clear of the torso at gameplay camera distance; thick avatars and layered clothing clip into tight poses.
- Add a tiny breathing motion (1-2 degrees on `UpperTorso`) so the hold does not look frozen over a still idle.
- Sprint-lower poses stop guns pointing at the camera in third person and give a readable "not ready to fire" state.

## Pitfalls

- Hold track keys the legs: walking freezes. Delete leg keys from hold clips.
- Two systems (Animate's tool slot and yours) both drive the right arm: the arm jitters between them.
- Loading new tracks on every equip leaks; cache per class as above.
- Swapping between two weapons of the same class shares one track: in the unequip handler, only stop it if the character no longer holds a tool of that class (test pistol-to-pistol swaps).

## Related
[[Animation - Hub]] · [[Animating Tools and Weapons with Motor6D Grips]] · [[Animator Priorities, Weights and Blending Done Right]] · [[IKControl Recipes - Foot Planting, Aiming and Look-At]]
