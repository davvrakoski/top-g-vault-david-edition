---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Healing Zones and Safe Zones"
tags: [roblox, community-knowledge, scripting, recipe, luau, zones, healing, safe-zone, pvp, collectionservice]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/datatypes/CFrame
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/scripting/attributes
---
# Recipe - Healing Zones and Safe Zones

Box-shaped areas that heal players standing in them, hurt them (poison gas, fire), or mark them safe from PvP damage. Lobbies, spawn rooms, campfires and toxic swamps all reuse this one script. It avoids `Touched`/`TouchEnded`, which flicker as limbs animate, and instead checks every half-second whether each player's root is inside each zone's box. General zone tooling (ZonePlus, QuickZone) is compared in [[Zone Detection - ZonePlus, QuickZone and Doing It Yourself]]; this is the small do-it-yourself version, wired to health and PvP.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Zones` | Script | `ServerScriptService` |
| `CombatRules` | ModuleScript | `ServerScriptService` |
| zone parts | Part, Anchored, `CanCollide` off, `CanTouch` off, `CanQuery` off, Transparency 0.8 | `Workspace` |

Tags and attributes on zone parts:
- `HealZone`: `HealPerSecond` (default 10)
- `HurtZone`: `DamagePerSecond` (default 15)
- `SafeZone`: no attributes; sets `InSafeZone = true` on the character while inside

Only the part's box is used (its `CFrame` and `Size`); rotated boxes work, ball shapes are treated as boxes.

## Zone loop
```lua
-- ServerScriptService/Zones (Script)
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local TICK = 0.5

local function inside(zone: BasePart, point: Vector3): boolean
	local rel = zone.CFrame:PointToObjectSpace(point)
	local half = zone.Size / 2
	return math.abs(rel.X) <= half.X and math.abs(rel.Y) <= half.Y and math.abs(rel.Z) <= half.Z
end

local function firstZoneContaining(tag: string, point: Vector3): BasePart?
	for _, zone in CollectionService:GetTagged(tag) do
		if zone:IsA("BasePart") and inside(zone, point) then
			return zone
		end
	end
	return nil
end

while true do
	task.wait(TICK)
	for _, player in Players:GetPlayers() do
		local character = player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local root = humanoid and humanoid.RootPart
		if not root or humanoid.Health <= 0 then continue end
		local pos = root.Position

		local safe = firstZoneContaining("SafeZone", pos) ~= nil
		if character:GetAttribute("InSafeZone") ~= safe then
			character:SetAttribute("InSafeZone", safe) -- replicates; client UI can show "SAFE"
		end

		local heal = firstZoneContaining("HealZone", pos) -- no stacking: first zone wins
		if heal then
			local rate = heal:GetAttribute("HealPerSecond") or 10
			humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + rate * TICK)
		end

		local hurt = firstZoneContaining("HurtZone", pos)
		if hurt and not safe then
			local rate = hurt:GetAttribute("DamagePerSecond") or 15
			humanoid:TakeDamage(rate * TICK) -- respects ForceField
		end
	end
end
```

## The PvP gate every weapon calls
```lua
-- ServerScriptService/CombatRules (ModuleScript)
local Players = game:GetService("Players")
local CombatRules = {}

function CombatRules.canDamage(attacker: Player?, victim: Model): boolean
	if victim:GetAttribute("InSafeZone") then return false end
	if victim:GetAttribute("Invulnerable") then return false end -- e.g. dash i-frames
	if attacker then
		local attackerChar = attacker.Character
		if attackerChar and attackerChar:GetAttribute("InSafeZone") then
			return false -- no shooting out of spawn
		end
		local victimPlayer = Players:GetPlayerFromCharacter(victim)
		if victimPlayer and victimPlayer.Team and victimPlayer.Team == attacker.Team then
			return false -- friendly fire off
		end
	end
	return true
end

return CombatRules
```
In each damage handler: `if CombatRules.canDamage(player, targetModel) then humanoid:TakeDamage(dmg) end`.

## How to test
1. Place a red `HurtZone` box and a green `HealZone` box. Walk into red: health drops 7.5 per tick. Walk into green: it refills, never above `MaxHealth`.
2. Put a `SafeZone` over spawn and overlap it with the hurt zone: no damage inside the overlap.
3. Rotate a zone 45 degrees: the edges still match what you see.
4. Two-player test with any weapon calling `canDamage`: hits do nothing while either player stands in the safe zone.
5. Check the `InSafeZone` attribute flipping in the server Explorer as you cross the boundary.

## Common mistakes
- **`Touched` + `TouchEnded` for zones.** Animated limbs fire them constantly; players flicker in and out.
- **Healing every frame** with a fixed amount: frame-rate dependent. Scale by the tick length, as above.
- **Writing `Health` to hurt players.** Use `TakeDamage` so ForceFields and future damage hooks work.
- **Leaving `CanQuery` on** for invisible zones: your weapon raycasts will hit the zone box. Turn off `CanCollide`, `CanTouch` and `CanQuery` on zone parts.
- **Hundreds of zones and players.** This is O(players x zones) every 0.5 s. That is fine for tens of zones; beyond that, use a spatial query (`GetPartBoundsInBox` per zone) or a library.

## Related
[[Scripting - Hub]] · [[Zone Detection - ZonePlus, QuickZone and Doing It Yourself]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]] · [[Recipe - Dash]]
