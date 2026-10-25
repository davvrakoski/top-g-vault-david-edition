---
area: "07 AI and Combat"
cluster: "Combat"
title: "Headshots and Hit Zones - Damage Multipliers and Accessory Hits"
tags: [roblox, community-knowledge, combat, guns, headshots, hit-zones, raycast]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-to-make-a-raycasting-gun/723716
  - https://devforum.roblox.com/t/help-with-a-gun-script-i-made/692918
  - https://devforum.roblox.com/t/weapons-kit-headshot-system/1729259
  - https://devforum.roblox.com/t/acessorydetector/3915362
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult
---
# Headshots and Hit Zones - Damage Multipliers and Accessory Hits

Hit zones turn aim into skill: headshots reward precision, limb hits soften spray. The common DevForum version is a raycast gun that checks `result.Instance.Name == "Head"` and doubles damage. It works until a player wears a big hat or hair (the ray hits the accessory's Handle, not the Head), an R6 rig names parts differently from R15, or a custom NPC has no "Head" at all. This note gives a robust zone lookup and the server checks around it.

## Map parts to zones, do not compare names everywhere

```lua
local ZONE_BY_PART = {
	Head = "Head",
	UpperTorso = "Torso", LowerTorso = "Torso", Torso = "Torso", HumanoidRootPart = "Torso",
	LeftUpperArm = "Limb", LeftLowerArm = "Limb", LeftHand = "Limb",
	RightUpperArm = "Limb", RightLowerArm = "Limb", RightHand = "Limb",
	LeftUpperLeg = "Limb", LeftLowerLeg = "Limb", LeftFoot = "Limb",
	RightUpperLeg = "Limb", RightLowerLeg = "Limb", RightFoot = "Limb",
	["Left Arm"] = "Limb", ["Right Arm"] = "Limb", ["Left Leg"] = "Limb", ["Right Leg"] = "Limb", -- R6
}

local MULT = { Head = 2.0, Torso = 1.0, Limb = 0.75 }

local function zoneOf(part: BasePart): (Humanoid?, string)
	-- accessory hits: Handle sits inside an Accessory inside the character
	local accessory = part:FindFirstAncestorOfClass("Accessory")
	if accessory then
		local weld = part:FindFirstChildWhichIsA("Weld") or part:FindFirstChild("AccessoryWeld")
		local attachedTo = weld and (weld.Part1 ~= part and weld.Part1 or weld.Part0)
		local char = accessory.Parent
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		return hum, attachedTo and ZONE_BY_PART[attachedTo.Name] or "Head"
	end
	local char = part:FindFirstAncestorOfClass("Model")
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	return hum, ZONE_BY_PART[part.Name] or part:GetAttribute("HitZone") or "Torso"
end
```

Custom NPCs can set a `HitZone` attribute on any part ("Head", "WeakSpot", "Armor") so the same code handles bosses with glowing weak points.

## Should accessories count?

Decide once, per game:

- **Count hats as the zone they attach to** (above): fair for big hats, slightly generous.
- **Ignore accessories**: add them to the raycast exclude list (put characters' accessories in a collision group or filter them with `RaycastParams`), so the ray passes through hats to the real head. More precise, but wide hair can then "absorb" visual hits that do nothing.
- Competitive games often go further and use **invisible, standardized hitbox parts** (same size for every avatar) with `CanQuery = true`, while visual parts have `CanQuery = false`. This removes avatar-size advantages (tiny avatars are harder to hit) and makes zones identical for everyone.

## Server validation

The client may predict the headshot marker, but the server recomputes:

1. Re-raycast on the server from the validated muzzle position along the claimed direction (with lag compensation if you use it).
2. Determine the zone from the **server's** result, not from the client's claim.
3. Apply `baseDamage * MULT[zone]`, with distance falloff if the weapon has it.
4. Track headshot rate per player over many shots; a sustained rate far above your playerbase's distribution is a strong aimbot signal for the suspicion system (not an instant ban).

## Feedback

- Distinct headshot sound and hitmarker colour, sent only after server confirmation (or predicted with the rare correction).
- Damage numbers coloured by zone.
- Kill feed icon for headshot kills.

## Tuning starting points

| Weapon | Head | Torso | Limb |
| --- | --- | --- | --- |
| Pistol / rifle | 2.0 | 1.0 | 0.75 |
| Sniper | 2.5-4 (one-shot head) | 1.0 | 0.8 |
| Shotgun (per pellet) | 1.25 | 1.0 | 0.8 |
| Melee | 1.0 (no zones) | 1.0 | 1.0 |

## Pitfalls

- `Mouse.Target` or client hit names trusted by the server.
- Assuming R15 names on R6 rigs (the forum's classic "headshots never work" bug).
- Forgetting the `HumanoidRootPart`: it is large and invisible; map it to Torso or exclude it, otherwise shots near the body hit it.

## Related
[[Combat - Hub]] - [[Hitscan and Projectile Weapon Blueprint]] - [[Lag Compensation and Server Rewind for Melee and Hitscan]] - [[Recoil, Spread and Bloom for Roblox Guns]]
