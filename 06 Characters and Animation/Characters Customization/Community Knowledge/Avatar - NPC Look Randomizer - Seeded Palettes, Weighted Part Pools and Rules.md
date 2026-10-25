---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - NPC Look Randomizer - Seeded Palettes, Weighted Part Pools and Rules"
tags: [roblox, community-knowledge, avatar, npc, humanoiddescription, procedural, randomizer]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Avatar - NPC Look Randomizer - Seeded Palettes, Weighted Part Pools and Rules

Shopkeepers, townsfolk, survivors, zombies, crowd fans: games need dozens of NPCs that look different but still belong to the same world. Hand-dressing each one does not scale, and pure `math.random` on every slot produces clowns (neon pants, three hats, a tiny head on a giant body). A good randomizer is **data + weights + rules + a seed**: art direction stays in a table, and each NPC id always rebuilds the same look.

## The data table

Keep pools per **faction or role**, not one global pool, so a police NPC never rolls a pirate hat.

```lua
-- ModuleScript: NpcLooks
return {
	Townsfolk = {
		skin = { Color3.fromRGB(255, 204, 153), Color3.fromRGB(234, 184, 146),
		         Color3.fromRGB(198, 134, 66), Color3.fromRGB(141, 85, 36), Color3.fromRGB(94, 59, 34) },
		shirts = { { id = 0000001, w = 5 }, { id = 0000002, w = 3 }, { id = 0000003, w = 1 } },
		pants  = { { id = 0000011, w = 4 }, { id = 0000012, w = 4 } },
		hair   = { { id = 0000021, w = 3 }, { id = 0000022, w = 3 }, { id = 0, w = 1 } }, -- 0 = bald
		hats   = { { id = 0, w = 6 }, { id = 0000031, w = 1 } },        -- mostly no hat
		height = { 0.92, 1.06 },
		width  = { 0.9, 1.05 },
	},
}
```

(IDs above are placeholders; use asset IDs you own or that are free to use.)

## The builder

```lua
local Players = game:GetService("Players")
local Looks = require(script.Parent.NpcLooks)

local function pick(rng, pool)
	local total = 0
	for _, e in pool do total += e.w end
	local r = rng:NextNumber(0, total)
	for _, e in pool do
		r -= e.w
		if r <= 0 then return e.id end
	end
	return pool[#pool].id
end

local function buildDescription(role: string, npcId: number)
	local data = Looks[role]
	local rng = Random.new(npcId)              -- same id -> same look, every server
	local d = Instance.new("HumanoidDescription")

	local skin = data.skin[rng:NextInteger(1, #data.skin)]
	d.HeadColor, d.TorsoColor = skin, skin
	d.LeftArmColor, d.RightArmColor = skin, skin
	d.LeftLegColor, d.RightLegColor = skin, skin

	d.Shirt = pick(rng, data.shirts)
	d.Pants = pick(rng, data.pants)
	local hair, hat = pick(rng, data.hair), pick(rng, data.hats)
	d.HairAccessory = hair ~= 0 and tostring(hair) or ""
	d.HatAccessory = hat ~= 0 and tostring(hat) or ""

	d.HeightScale = rng:NextNumber(data.height[1], data.height[2])
	d.WidthScale = rng:NextNumber(data.width[1], data.width[2])
	d.DepthScale = d.WidthScale            -- keep body depth tied to width
	return d
end

local npc = Players:CreateHumanoidModelFromDescription(buildDescription("Townsfolk", 1042), Enum.HumanoidRigType.R15)
```

Accessory slot properties (`HatAccessory`, `HairAccessory`, and so on) are comma-separated ID strings; for layered clothing use `SetAccessories`.

## Rules that stop clown outfits

- **Skin applies to every body part** in one go (as above), never per limb.
- **Correlated values:** tie `DepthScale` to `WidthScale`, and keep `HeadScale` inside a tight band (0.95-1.0); big head variance reads as cartoon.
- **Colour palettes, not RGB noise:** pick shirt/pant tints from a curated palette per faction.
- **Exclusions:** if a hat is picked, choose from the "fits under hat" hair list. Store this as a flag on hair entries.
- **Rare items are rare:** a weight of 1 against 6 keeps special looks special. A "named" NPC (quest giver) bypasses the randomizer with a fixed description.

## Why seed by NPC id

- The same guard looks identical after streaming out and back in, after a server restart, and on every player's screen.
- Bugs are reproducible: "NPC 1042 has clipping hair" is a fixable report.
- You can store just the id and role in save data, not the whole outfit.

## Performance

- Build descriptions on the server once; cache spawned templates per id if many NPCs respawn, and clone them (cloning a built model is cheaper than building from a description each time).
- Limit unique assets per area: 8 shirts x 6 hair already gives a lot of variety while keeping downloads small.
- Combine with animation variety (speed offsets, idle breaks) for crowds; looks alone do not fix a marching-band crowd.

## Related
[[Characters Customization - Hub]] · [[NPC Appearance Pipeline - From HumanoidDescription to Spawned Rig]] · [[Weighted Random Selection]] · [[Anim - Crowd Variation - Speed Offsets, Random Start Times and Clip Pools]]
