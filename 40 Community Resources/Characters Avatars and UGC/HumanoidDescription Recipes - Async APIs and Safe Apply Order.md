---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/humanoiddescription-recipes"
title: "HumanoidDescription Recipes - Async APIs and Safe Apply Order"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar, humanoiddescription, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://devforum.roblox.com/t/humanoidapplydescriptionfinished-never-fires/3948914
---
# HumanoidDescription Recipes - Async APIs and Safe Apply Order

`HumanoidDescription` is the one object that says what a Humanoid character should look like: body parts, colors, the scale values, classic clothing, rigid and layered accessories, animations and emotes. This note collects the habits that keep appearance code predictable in 2026.

## 1. Use the Async names

The Creator Hub API reference now marks the old method names as deprecated and points to `Async` versions. The old names still exist, but new code should use these:

| Deprecated | Use instead |
| --- | --- |
| `Humanoid:ApplyDescription()` | `Humanoid:ApplyDescriptionAsync()` |
| `Humanoid:ApplyDescriptionReset()` | `Humanoid:ApplyDescriptionResetAsync()` |
| `Players:GetHumanoidDescriptionFromUserId()` | `Players:GetHumanoidDescriptionFromUserIdAsync()` |
| `Players:GetHumanoidDescriptionFromOutfitId()` | `Players:GetHumanoidDescriptionFromOutfitIdAsync()` |
| `Players:CreateHumanoidModelFromDescription()` | `Players:CreateHumanoidModelFromDescriptionAsync()` |
| `Player:LoadCharacterWithHumanoidDescription()` | `Player:LoadCharacterWithHumanoidDescriptionAsync()` |

All of them yield and can fail (network, moderated or deleted assets), so wrap them in `pcall`.

## 2. The four rules

1. **Start from the applied description.** Read `humanoid:GetAppliedDescription()`, edit the copy, apply it. A fresh `Instance.new("HumanoidDescription")` wipes everything you did not set.
2. **Pick Async or ResetAsync on purpose.** `ApplyDescriptionAsync` assumes nothing else touched the character since the last apply, so it only applies differences. If your game also adds accessories or parts by hand (tools, shop hats, gore), use `ApplyDescriptionResetAsync`, which forces the character to match even after outside changes.
3. **Do not mix manual edits with an apply in flight.** The docs warn that changing assets on the character while a description is applying can give undefined results.
4. **Do it on the server and serialize per player.** Two overlapping applies on the same Humanoid race each other, so queue them. After `LoadCharacterWithHumanoidDescriptionAsync`, the docs say not to call it again for that player until `CharacterAppearanceLoaded` has fired.

## 3. Accessory fields

- Rigid accessories live in comma-separated string properties: `HatAccessory`, `HairAccessory`, `FaceAccessory`, `NeckAccessory`, `ShouldersAccessory`, `FrontAccessory`, `BackAccessory`, `WaistAccessory`.
- Layered clothing lives in `AccessoryBlob` (JSON). Do not hand-edit the JSON; use `description:GetAccessories(includeRigid)` and `description:SetAccessories(list, includeRigid)`. Each entry has `AssetId`, `AccessoryType`, `IsLayered`, `Order` and (optionally) `Puffiness`.
- Higher `Order` draws on top (jacket over shirt).

## 4. `UseAvatarSettings`

When `HumanoidDescription.UseAvatarSettings` is true, `ApplyDescriptionAsync` and `CreateHumanoidModelFromDescriptionAsync` also apply the game's **Avatar Settings** (scale limits, overrides). Turn it on for NPCs built from player descriptions so they obey the same rules as real players. See [[Avatar Settings vs Scripts - Who Controls the Player Avatar]].

## 5. A safe server helper (original example)

```lua
-- ServerScriptService/AppearanceService (ModuleScript)
local Players = game:GetService("Players")

local AppearanceService = {}
local busy: {[Player]: boolean} = {}

-- editFn receives a copy of the current description and edits it in place.
function AppearanceService.edit(player: Player, editFn: (HumanoidDescription) -> ())
	if busy[player] then
		return false, "busy"
	end
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return false, "no humanoid"
	end

	busy[player] = true
	local description = humanoid:GetAppliedDescription()
	editFn(description)

	local ok, err = pcall(function()
		humanoid:ApplyDescriptionResetAsync(description)
	end)
	busy[player] = nil
	return ok, err
end

Players.PlayerRemoving:Connect(function(player)
	busy[player] = nil
end)

return AppearanceService
```

Usage from a validated RemoteEvent handler:

```lua
AppearanceService.edit(player, function(desc)
	desc.HeadColor = Color3.fromRGB(234, 184, 146)
	desc.HatAccessory = "" -- remove every rigid hat
end)
```

## 6. Events

`ApplyDescriptionAsync` yields until done, so you usually do not need `Humanoid.ApplyDescriptionFinished`. If you do listen to it, connect **before** you call apply. In a 2025 DevForum thread (HpacAm, answered by MayorGnarwhal and HeCatchThose) the event seemed to never fire only because it was connected after the yielding call returned.

## Common mistakes

- Building a new description from scratch and wondering why the player lost their hair.
- Calling apply from a LocalScript on the player's own character and expecting others to see it.
- Applying on every slider tick in a customizer. Preview locally (see [[Character Preview in a ViewportFrame - WorldModel Pattern]]) and apply once on confirm.

## Credits

- Roblox Creator Docs, *Character appearance* and API reference (CC BY 4.0, code samples MIT). Facts summarized in our own words.
- DevForum thread by HpacAm, replies by MayorGnarwhal and HeCatchThose (event ordering).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Character appearance]] · [[HumanoidDescription]] · [[ApplyDescription Problems - DevForum Fix List]] · [[Player and Character Lifecycle Without Race Conditions]] · [[Avatar Scale Rules - Height, Width, BodyType and Proportion]]

<!-- TDOD_GRAPH_END -->
