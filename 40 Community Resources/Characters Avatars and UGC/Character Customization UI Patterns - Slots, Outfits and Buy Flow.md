---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/customization-ui-patterns"
title: "Character Customization UI Patterns - Slots, Outfits and Buy Flow"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ui, customization, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/players/avatar-editor
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/players/avatar-inspect-menu
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# Character Customization UI Patterns - Slots, Outfits and Buy Flow

Patterns that work for in-game character customizers, whether the items are your own game cosmetics or real Marketplace items.

## 1. Model the avatar as slots, not a list

Keep a plain Luau table as the source of truth and build a `HumanoidDescription` from it only when you preview or apply.

| Slot group | Examples | Rule |
| --- | --- | --- |
| Body | skin color, head, body bundle, scale sliders | one value each |
| Classic clothing | Shirt, Pants, T-shirt | one each |
| Layered clothing | T-shirt, shirt, sweater, jacket, pants, shorts, dress or skirt, shoes | many, each with an `Order` |
| Rigid accessories | hat, hair, face, neck, shoulder, front, back, waist | allow a small max per type |
| Animation | idle, walk, run, jump, fall, climb, swim, mood | one each |

This makes undo, randomize, presets and saving trivial: they are table copies.

## 2. Screen layout that players already know

- Left: category tabs (Body, Tops, Bottoms, Accessories, Animations, Outfits).
- Center: big rotating preview (see [[Character Preview in a ViewportFrame - WorldModel Pattern]]).
- Right or bottom: item grid with price or "Owned" badge, and a "Wearing" strip that lists equipped items with remove buttons.
- Layered clothing needs a **reorder** control (drag or up/down arrows) because order changes the look.
- Phones: tabs on top, grid below, preview shrinks; buttons at least about 44 px tall.

## 3. Try, then buy, then save

1. **Try**: change the preview only (client).
2. **Buy**: show total price for non-owned items; one button calls a server function that uses `PromptPurchase` or `PromptBulkPurchase`.
3. **Apply**: server applies the description to the live character.
4. **Save**: for game cosmetics, DataStore; for real Marketplace items, offer `PromptSaveAvatar` or `PromptCreateOutfit` through AvatarEditorService (see [[AvatarEditorService In-Game Editor - Build Order]]).

## 4. Never trust the client's outfit

A RemoteEvent that applies any IDs the client sends lets exploiters wear anything (including items you never meant to allow). Validate on the server.

```lua
-- Server: validates a requested outfit against your own allowed catalog.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AppearanceService = require(script.Parent.AppearanceService) -- see HumanoidDescription recipes note

local ALLOWED_HATS: {[number]: boolean} = { [0] = true } -- fill with your tested IDs
local MAX_HATS = 3
local lastRequest: {[Player]: number} = {}

ReplicatedStorage.Remotes.RequestOutfit.OnServerEvent:Connect(function(player, hats)
	local now = os.clock()
	if (lastRequest[player] or 0) > now - 1 then return end -- 1 request per second
	lastRequest[player] = now

	if typeof(hats) ~= "table" or #hats > MAX_HATS then return end
	local clean = {}
	for _, id in hats do
		if typeof(id) == "number" and ALLOWED_HATS[id] then
			table.insert(clean, tostring(id))
		end
	end

	AppearanceService.edit(player, function(desc)
		desc.HatAccessory = table.concat(clean, ",")
	end)
end)
```

For real Marketplace items you do not curate, check ownership on the server or let players wear try-ons only inside the preview.

## 5. Small touches that raise conversion

- "Wear the whole look" button on mannequins and outfits.
- Show what other players wear: the built-in **Avatar Inspect Menu** lets players view and buy items from other avatars, and in-game purchases there also earn the game owner a commission.
- Randomize button (fun, and it shows off the catalog).
- Keep the camera on the face while picking heads and hair, on the full body for clothing.

## Credits

- Roblox Creator Docs: *Avatar Editor Service*, *Character appearance*, *Avatar Inspect Menu*, MarketplaceService reference (CC BY 4.0). Layout and code are our own synthesis.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Character Customization Blueprint]] · [[Character Customization]] · [[AvatarEditorService In-Game Editor - Build Order]] · [[Character Preview in a ViewportFrame - WorldModel Pattern]] · [[Avatar Inspect Menu]]

<!-- TDOD_GRAPH_END -->
