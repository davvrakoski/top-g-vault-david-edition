---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/avatar-scale-rules"
title: "Avatar Scale Rules - Height, Width, BodyType and Proportion"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar, rthro, scale]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/avatar/character-bodies/specifications
  - https://create.roblox.com/docs/avatar/rigid-accessories/specifications
  - https://create.roblox.com/docs/studio/avatar-settings
  - https://create.roblox.com/docs/marketplace/validation-system
---
# Avatar Scale Rules - Height, Width, BodyType and Proportion

R15 avatars range from blocky Classic bodies to tall Rthro bodies. If your doors, hitboxes, vehicles and camera assume one size, some players will clip, peek over walls or get stuck. This note explains the knobs.

## The scale values on HumanoidDescription

| Property | What it does | Range |
| --- | --- | --- |
| `HeightScale` | Scales top-to-bottom size and accessories not on the head | Factor |
| `WidthScale` | Scales left-to-right size | Factor |
| `DepthScale` | Scales back-to-front size | Factor |
| `HeadScale` | Scales the head and its accessories | Factor |
| `BodyTypeScale` | Blends from the standard R15 shape (0) toward a taller, slimmer Rthro shape (1) | Clamped 0 to 1 |
| `ProportionScale` | How wide (0) or narrow (1) the rig is | Clamped 0 to 1; **no effect when BodyTypeScale is 0** |

The last row is the classic surprise: setting `ProportionScale` on a body with `BodyTypeScale = 0` changes nothing.

## Body scale standards for asset makers

Bodies and accessories carry an `AvatarPartScaleType` value. Validation only accepts `Classic`, `ProportionsSlender` or `ProportionsNormal`, and every MeshPart in one upload must use the same value.

| Standard | Rough height (from the rigid accessory spec mannequins) | Importer Rig Type |
| --- | --- | --- |
| Normal (Rthro) | about 5.75 to 6.5 studs | Rthro |
| Slender (Rthro Narrow) | about 5.25 to 6.25 studs | Rthro Narrow |
| Classic | about 4.75 studs | Default |

## Game design checklist

- **Pick a height band early.** Avatar Settings, Body, Scale, *Custom Scale* lets you clamp all avatars to a min and max height in studs while keeping proportions.
- **Collisions**: *Single Collider* gives everyone the same box, which most competitive games want.
- **Doorways and vents**: build for your max height plus headroom. Test with the tallest preview avatar in the Avatar Settings lineup.
- **Hitboxes**: attach to the root and size by config, not by limbs (more in [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]).
- **First-person and over-shoulder cameras**: read head height at spawn instead of using a constant.
- **Tools**: grip attachments move with hand size; check swords and guns on Classic and Rthro.

## Script example: size-potion with game limits (original)

```lua
-- Server. Multiplies height and width within limits your game chooses.
local MIN_FACTOR, MAX_FACTOR = 0.8, 1.25

local function applySizePotion(humanoid: Humanoid, multiplier: number)
	local desc = humanoid:GetAppliedDescription()
	desc.HeightScale = math.clamp(desc.HeightScale * multiplier, MIN_FACTOR, MAX_FACTOR)
	desc.WidthScale = math.clamp(desc.WidthScale * multiplier, MIN_FACTOR, MAX_FACTOR)
	desc.DepthScale = math.clamp(desc.DepthScale * multiplier, MIN_FACTOR, MAX_FACTOR)
	local ok, err = pcall(function()
		humanoid:ApplyDescriptionAsync(desc)
	end)
	if not ok then
		warn("Size potion failed:", err)
	end
end
```

The 0.8 to 1.25 band is a design choice for this example, not a platform limit. If Avatar Settings also clamps height, the stricter rule wins in practice; test both together.

## Credits

- Roblox Creator Docs: HumanoidDescription reference, character body and rigid accessory specifications, Avatar Settings, UGC validation system (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Avatar Settings vs Scripts - Who Controls the Player Avatar]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Character body specifications]] · [[Rigid accessory specifications]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]]

<!-- TDOD_GRAPH_END -->
