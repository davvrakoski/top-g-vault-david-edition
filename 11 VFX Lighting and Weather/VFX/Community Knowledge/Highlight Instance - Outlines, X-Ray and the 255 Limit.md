---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Highlight Instance - Outlines, X-Ray and the 255 Limit"
tags: [roblox, community-knowledge, vfx, highlight, outline, readability]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/highlighting
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://create.roblox.com/docs/reference/engine/enums/HighlightDepthMode
---
# Highlight Instance - Outlines, X-Ray and the 255 Limit

A `Highlight` draws a silhouette outline and a coloured fill over a Model or BasePart. It is the standard Roblox tool for "you can interact with this", "teammate behind the wall", "selected unit", "this enemy is marked" and hit flashes. It is cheap per object but has a hard cap and a few behaviours that surprise people.

## Properties

| Property | Use |
|---|---|
| `Adornee` | What to highlight; or parent the Highlight directly to the Model/Part |
| `FillColor`, `FillTransparency` | Interior overlay (default red tint); 1 = outline only |
| `OutlineColor`, `OutlineTransparency` | Silhouette edge (default white) |
| `DepthMode` | `AlwaysOnTop` (seen through walls) or `Occluded` (hidden behind objects) |
| `Enabled` | Toggle; the docs say this has no performance impact on its own |

## The 255 limit

The docs: only **255** Highlights display on a client at once; extras are silently ignored. A **disabled** Highlight still uses one of the 255 slots. So:

- Don't pre-place a disabled Highlight on every enemy, pickup and door in a big map. Create them when needed and `Destroy()` them when done, or keep a pool well under the limit.
- Highlight a whole **Model** with one Highlight (Adornee = model), not one per part.
- On low-end devices highlights may look more pixelated, but otherwise the same.

## Recipes

**Interactable hover (outline only)**
- `FillTransparency = 1`, `OutlineColor` = your interact colour, `OutlineTransparency = 0`, `DepthMode = Occluded`.
- Create on hover/near (for example from a ProximityPrompt's `PromptShown`), destroy on hide.

**Teammate X-ray**
- `DepthMode = AlwaysOnTop`, `FillTransparency = 0.75`, team colour outline. Only on the **local** client and only for teammates. Doing this for enemies is a wallhack; decide that deliberately as a game mechanic (e.g. a scan ability with a duration).

**Hit flash**
- On hit, set `FillColor = white`, `FillTransparency = 0.2`, then tween `FillTransparency` to 1 over 0.12 s. One reusable Highlight per character, client-side.

```lua
local TweenService = game:GetService("TweenService")
local FLASH = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function hitFlash(model: Model)
	local h = model:FindFirstChild("HitFlash") :: Highlight?
	if not h then
		h = Instance.new("Highlight")
		h.Name = "HitFlash"
		h.OutlineTransparency = 1
		h.DepthMode = Enum.HighlightDepthMode.Occluded
		h.Parent = model
	end
	h.FillColor = Color3.new(1, 1, 1)
	h.FillTransparency = 0.2
	TweenService:Create(h, FLASH, { FillTransparency = 1 }):Play()
end
```

(This keeps one Highlight per hit character. For large crowds, destroy it after the flash so you stay under 255.)

**Selected units (RTS / tower defence)**
- Outline only, bright, `AlwaysOnTop` so selection reads behind terrain. Cap the visible selection set (show highlights on the first ~100 and a count in the UI).

**Objective marker through walls**
- `AlwaysOnTop` with faint fill. Pair with a screen-edge arrow for off-screen objectives.

## Readability and accessibility

- Outline colour carries meaning; pair it with a shape or icon for colourblind players (see the colourblind palette note), and use your theme tokens so presets update Highlights too.
- Thin outlines vanish at distance; for far objectives add a BillboardGui marker.
- Don't stack meanings on one object (selected + damaged + objective). Pick the highest-priority highlight and show the rest in UI.

## Pitfalls

- Server-created Highlights replicate to everyone. Client-only meanings (your hover, your teammate view) must be created on the client.
- Highlighting huge models (a whole building) looks noisy and tells the player nothing; highlight the door, not the house.
- Check how your model's hitbox or helper parts look under the Highlight; if they show up in the silhouette, highlight a sub-model that contains only the visible mesh (behaviour with fully transparent parts not stated in the docs; test it).

## Related
[[VFX - Hub]] · [[VFX Color Language and Readability]] · [[Custom ProximityPrompt UI]] · [[Colorblind-Safe Palettes for Game UI]]
