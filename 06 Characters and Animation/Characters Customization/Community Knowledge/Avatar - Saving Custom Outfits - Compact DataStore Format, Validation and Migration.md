---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - Saving Custom Outfits - Compact DataStore Format, Validation and Migration"
tags: [roblox, community-knowledge, avatar, outfits, datastore, customization, save-data]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/DataStore
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Avatar - Saving Custom Outfits - Compact DataStore Format, Validation and Migration

Games with their own wardrobe (roleplay clothes, class armour, unlockable hats) must save what each player wears and owns. The tempting shortcut is to serialise the whole `HumanoidDescription` (every asset ID and colour) into the data store. That bloats save data, breaks when you change an asset, and lets a crafted request "wear" anything. Save **item keys from your own catalog**, not raw asset IDs, and rebuild the description on the server.

## Your catalog is the source of truth

```lua
-- ReplicatedStorage.Wardrobe (shared catalog)
return {
	shirt_red_hoodie = { slot = "Shirt", assetId = 0000101, price = 0 },
	pants_cargo      = { slot = "Pants", assetId = 0000201, price = 150 },
	hat_knight       = { slot = "Hat",   assetId = 0000301, price = 500 },
	hair_spiky_blue  = { slot = "Hair",  assetId = 0000401, price = 250 },
}
```

(Placeholder IDs; use assets you own or may use.) If you swap an asset for a better version later, change `assetId` here and every saved outfit updates automatically.

## Save format

```lua
-- In the player's profile
Outfit = {
	v = 2,                                   -- schema version
	slots = { Shirt = "shirt_red_hoodie", Pants = "pants_cargo", Hat = "hat_knight" },
	skin = 3,                                -- index into your skin palette, not an RGB
	presets = {                              -- saved looks (cap the count, e.g. 6)
		{ name = "Battle", slots = { Hat = "hat_knight" } },
	},
},
Owned = { shirt_red_hoodie = true, pants_cargo = true, hat_knight = true },
```

Short string keys and palette indices keep each outfit to a few dozen bytes, far below the per-key data store size limit, even with several presets.

## Build on the server

```lua
local Wardrobe = require(game.ReplicatedStorage.Wardrobe)
local Palette = require(game.ReplicatedStorage.SkinPalette)

local SLOT_TO_PROP = { Shirt = "Shirt", Pants = "Pants" }          -- numeric ID properties
local SLOT_TO_ACCESSORY = { Hat = "HatAccessory", Hair = "HairAccessory" } -- comma lists

local function buildDescription(profile, base: HumanoidDescription)
	local d = base:Clone()
	for slot, key in profile.Outfit.slots do
		local item = Wardrobe[key]
		if item and item.slot == slot and profile.Owned[key] then -- validate every slot
			if SLOT_TO_PROP[slot] then
				d[SLOT_TO_PROP[slot]] = item.assetId
			elseif SLOT_TO_ACCESSORY[slot] then
				d[SLOT_TO_ACCESSORY[slot]] = tostring(item.assetId)
			end
		end
	end
	local skin = Palette[profile.Outfit.skin] or Palette[1]
	for _, part in { "Head", "Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg" } do
		d[part .. "Color"] = skin
	end
	return d
end
-- humanoid:ApplyDescription(buildDescription(profile, baseDescription))
```

`base` can be the player's own avatar description (keep their face and body) or a neutral template (uniform games).

## Validation rules

- **Equip requests** from the client send item keys. The server checks the key exists, the slot matches, and the player owns it, then saves and applies.
- **On load**, re-validate every slot. Items removed from the catalog or no longer owned (refunds, ended events) are silently dropped back to a default.
- **Rate-limit** equip requests; spam-clicking the wardrobe should not call `ApplyDescription` 20 times a second. Debounce and apply the latest request after about 0.2 s.

## Migration

Bump `v` whenever the format changes and migrate on load:

```lua
local function migrate(outfit)
	if outfit.v == 1 then
		-- v1 stored a single hat as a raw asset id
		outfit.slots = { Hat = LegacyHatIds[outfit.hat] }
		outfit.hat = nil
		outfit.v = 2
	end
	return outfit
end
```

Never delete a catalog key that might be saved; mark it `retired = true` (not sold, still wearable) or map it to a replacement in the migration.

## Real Marketplace items

If players try on real catalog items, do not save those into your own outfit system as "owned". For Marketplace items, use the AvatarEditorService save prompts so the player saves to their real Roblox avatar (see the in-game editor note).

## Related
[[Characters Customization - Hub]] · [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[AvatarEditorService In-Game Editor - Build Order]] · [[Remote Payload Validation]]
