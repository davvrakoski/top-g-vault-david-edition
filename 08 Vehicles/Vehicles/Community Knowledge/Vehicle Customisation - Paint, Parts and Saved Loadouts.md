---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicle Customisation - Paint, Parts and Saved Loadouts"
tags: [roblox, community-knowledge, vehicles, customisation, datastore, monetization]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/customizable-vehicle-spawner/364741
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/scripting/attributes
---
# Vehicle Customisation - Paint, Parts and Saved Loadouts

Customisation is where car games make money and keep players: paint, rims, spoilers, underglow, horn sounds. The engineering challenge is to store it compactly, apply it the same way in the garage preview and in the world, and never let the client decide what it owns.

## Store options, not instances
Save small ids and numbers, never instance names that artists may rename:

```lua
-- per player, per car
loadouts = {
	Hatch01 = { v = 2, paint = "C_RED_GLOSS", rims = "R_05", spoiler = "S_NONE", glow = "G_OFF" },
}
```
- Keep a catalog module (shared, in ReplicatedStorage) mapping ids to data: colour values, material, mesh template name, price, and which car classes it fits.
- Version the loadout (`v`) so you can migrate when ids change.
- Unknown ids on load fall back to defaults instead of erroring (a removed item must not break the car).

## One apply function, used everywhere
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Catalog = require(ReplicatedStorage.VehicleCatalog)

local function applyLoadout(car: Model, loadout)
	local paint = Catalog.paint[loadout.paint] or Catalog.paint.DEFAULT
	for _, part in car.Body:GetDescendants() do
		if part:IsA("BasePart") and part:HasTag("Paintable") then
			part.Color = paint.color
			part.Material = paint.material
		end
	end
	local rim = Catalog.rims[loadout.rims] or Catalog.rims.DEFAULT
	for _, slot in car.Wheels:GetChildren() do
		local old = slot:FindFirstChild("Rim")
		if old then old:Destroy() end
		local new = ReplicatedStorage.RimMeshes[rim.template]:Clone()
		new.Name = "Rim"
		-- weld the visual rim to the physics wheel; make it massless and non-colliding
		new.Massless, new.CanCollide, new.CanQuery, new.CanTouch = true, false, false, false
		new.CFrame = slot.CFrame
		local weld = Instance.new("WeldConstraint")
		weld.Part0, weld.Part1, weld.Parent = slot, new, new
		new.Parent = slot
	end
	car:SetAttribute("Loadout", HttpService:JSONEncode(loadout)) -- optional, for clients
end
```
The server calls it on spawn; the garage preview calls the **same** function on a local display clone. One code path means the preview never lies.

Tag paintable parts (`CollectionService` tags) instead of painting everything: windows, lights and tyres should not change colour.

## Server-side purchase and equip
1. Client: "equip RIM_05 on Hatch01".
2. Server: is the id real, does it fit this car class, does the player own it (or can afford it now)? Then update the loadout in the player's data and re-apply to their live car.
3. Never trust a colour sent by the client for paid paints. Free colour pickers can accept a `Color3`, but clamp and validate the type.

## Performance and art notes
- Visual parts are `Massless` and non-colliding so upgrades do not change handling (unless the upgrade is meant to).
- Prefer recolouring a `SurfaceAppearance` with a colour map designed for tinting over swapping many textures; each unique texture costs memory.
- Underglow: a `SurfaceLight` or neon strip with no shadows; it is a light source, so count it in the light budget.

## Monetisation fit
Cosmetics are the least pay-to-win thing you can sell in a racing game. Keep performance upgrades earnable in play; sell paints, rims, horns and effects.

## Related
[[Vehicles - Hub]] · [[Vehicle Spawner and Garage System - Server Flow]] · [[Character Preview in a ViewportFrame - WorldModel Pattern]] · [[Ethical Monetization Lines - Where Devs Draw Pay-to-Win]]
