---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - Invisibility, Ghost and Cloak Effects - Per-Viewer Visibility Done Right"
tags: [roblox, community-knowledge, avatar, invisibility, stealth, vfx, transparency]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Decal
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Avatar - Invisibility, Ghost and Cloak Effects - Per-Viewer Visibility Done Right

Stealth abilities, spectator ghosts, a Predator-style cloak, a "dead players become ghosts" mode: all of them come down to hiding a character fully or partly, sometimes only from some viewers. The naive version (loop the character, set `Transparency = 1`) misses faces, accessories, nametags, shadows and footsteps, and it cannot show teammates a faint outline while enemies see nothing.

## Everything that can give a player away

| Thing | Property to change |
|---|---|
| Body parts and accessory handles (`BasePart`s, including `MeshPart` layered clothing) | `Transparency` or `LocalTransparencyModifier` |
| Face and other decals / textures on parts | `Decal.Transparency` |
| Shadows | `BasePart.CastShadow = false` |
| Nametag / health bar | `Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None`, or hide your BillboardGui |
| Your cosmetics | Trails and emitters: `Enabled = false` |
| Held tool | The tool's parts are inside the character; include them |
| Sound | Footsteps and ability sounds still play; decide if that is the counter-play |

`HumanoidRootPart` is already invisible; skip it so you do not "restore" it to visible later. Store each part's original transparency (as an attribute) before changing it, so restore is exact.

## Same for everyone vs per viewer

**Same for everyone (simple stealth):** the server sets `Transparency` on all the pieces above. Everyone, including the player, sees the same.

**Per viewer (teammates see a ghost, enemies see nothing):** the server only sets an attribute, for example `character:SetAttribute("Cloaked", true)`. Each client decides how much to hide using `LocalTransparencyModifier`, which only affects rendering on that client:

```lua
-- LocalScript (StarterPlayerScripts)
local Players = game:GetService("Players")
local me = Players.LocalPlayer

local function apply(character, player)
	local cloaked = character:GetAttribute("Cloaked")
	local friendly = player.Team == me.Team
	local amount = not cloaked and 0 or (friendly and 0.6 or 1)
	for _, d in character:GetDescendants() do
		if d:IsA("BasePart") and d.Name ~= "HumanoidRootPart" then
			d.LocalTransparencyModifier = amount
		elseif d:IsA("Decal") then
			d.LocalTransparencyModifier = amount
		end
	end
end

local function watch(player)
	player.CharacterAdded:Connect(function(character)
		character:GetAttributeChangedSignal("Cloaked"):Connect(function()
			apply(character, player)
		end)
		character.DescendantAdded:Connect(function() apply(character, player) end) -- tools, accessories
	end)
end
for _, p in Players:GetPlayers() do if p ~= me then watch(p) end end
Players.PlayerAdded:Connect(watch)
```

Caveat: for the **local** character, the default camera's transparency controller also writes `LocalTransparencyModifier` when you zoom into first person, so your values can be overwritten. For the cloaked player's own view, use a screen effect (tint, vignette) instead of fading their own body.

## Ghost and cloak looks

- **Ghost:** transparency 0.5-0.7 plus a `Highlight` with `FillTransparency` around 0.8 and a soft outline; `DepthMode = Occluded` so ghosts do not shine through walls.
- **Cloak shimmer:** fade in steps (0, 0.5, 0.85, 1) over 0.3 s with a brief `Highlight` flash, and briefly reveal (0.5) when the cloaked player attacks or takes damage. The reveal is the counter-play.
- **Spectator ghost:** also put the ghost in a collision group that does not collide with living players, and disable touch-based damage.

## Security

Invisibility for enemies is a client-side render choice. An exploiter can always un-hide characters locally (they have the parts). For competitive stealth, also stop sending information the enemy should not have: do not reveal cloaked players on the minimap, and give the server final say in hit detection.

## Pitfalls

- Restoring to 0 instead of the original value makes glass visors and transparent accessories opaque.
- Frequent body-part property changes can trigger layered clothing rebuild spikes (see the loading performance note); prefer one change per state, not per-frame flicker.
- Forgetting new descendants: a tool equipped while cloaked appears floating. Re-apply on `DescendantAdded`.

## Related
[[Characters Customization - Hub]] · [[True First Person - Seeing Your Own Body with LocalTransparencyModifier]] · [[Highlight Instance - Outlines, X-Ray and the 255 Limit]] · [[Char - Team Outlines with Highlight]]
