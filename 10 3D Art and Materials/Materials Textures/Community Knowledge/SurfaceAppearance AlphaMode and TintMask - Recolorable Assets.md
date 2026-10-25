---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "SurfaceAppearance AlphaMode and TintMask - Recolorable Assets"
tags: [roblox, community-knowledge, materials, surfaceappearance, alpha, tint, customization]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/enums/AlphaMode
  - https://create.roblox.com/docs/art/modeling/surface-appearance
  - https://devforum.roblox.com/t/surfaceappearancecolor/854063
---
# SurfaceAppearance AlphaMode and TintMask - Recolorable Assets

`SurfaceAppearance.AlphaMode` decides what the alpha channel of the `ColorMap` means. Picking the right mode is how you get see-through foliage and fences, colour-customizable cars and skins, and paint that shows the part colour underneath. The `TintMask` mode plus the `SurfaceAppearance.Color` property (a long-requested feature on the DevForum) lets you ship **one** texture set and recolour it per team, per player choice or per rarity.

## The four modes

| Mode | Alpha channel means | Use for |
| --- | --- | --- |
| `Overlay` (default) | Where alpha is low, the part's own `Color` shows through | Logos and stripes over a colourable base |
| `Transparency` | Cut-out / see-through | Leaves, grass cards, chain-link fences, lace |
| `TintMask` | How strongly `SurfaceAppearance.Color` tints that pixel | Recolourable paint, cloth, hair |
| `Opaque` | Ignored; fully opaque everywhere | Anything solid; avoids surprises from stray alpha |

## Transparency mode: two behaviours

From the API reference:

- `MeshPart.Transparency = 0` + `AlphaMode.Transparency`: pixels are either fully opaque or not; this **works better with depth effects and occlusion** (good for foliage).
- `MeshPart.Transparency >= 0.02`: a blended mode for smooth gradients and soft edges, but not all effects are supported and occlusion may be imperfect (good for glass-like fades, bad for dense foliage).

So for trees, keep the part at 0 transparency and paint hard-edged alpha. Soft alpha edges at Transparency 0 look jaggy; sharpen them in the texture.

## TintMask recipe (recolourable car paint)

1. In your texture tool, paint the albedo as **neutral light grey** where paint goes, keep real colours elsewhere (tyres, chrome, lights).
2. Put a mask in the albedo's alpha: white = fully tintable, black = untinted.
3. Export PNG with alpha. Import and set `AlphaMode = TintMask`.
4. Set `SurfaceAppearance.Color` to the paint colour.

The tint multiplies, so a grey of about 70-80% gives bright, saturated results; pure white base can blow out highlights, dark grey makes every colour muddy.

```lua
-- Recolour all paint panels of a car model
local function paintCar(car: Model, color: Color3)
	for _, sa in car:GetDescendants() do
		if sa:IsA("SurfaceAppearance") and sa.AlphaMode == Enum.AlphaMode.TintMask then
			sa.Color = color
		end
	end
end
```

`Color` is a normal property (no plugin security on it in the reference), so setting it at runtime is the intended use; most other SurfaceAppearance texture properties are plugin-only and cannot be swapped by game scripts.

## Overlay vs TintMask

`Overlay` shows the **part colour** in transparent areas (one flat colour, no shading detail from the texture). `TintMask` keeps the texture's shading and multiplies colour in, which looks much better for cloth and paint. Prefer TintMask for customization.

## Pitfalls

- Stray alpha in an albedo meant to be opaque causes holes or tinting; use `Opaque` for those assets.
- JPG has no alpha; use PNG/TGA.
- Tinting cannot make a colour lighter than the base grey; plan the grey level for your brightest colour.
- Transparent foliage is expensive on mobile when overdraw piles up; keep card counts modest.

## Related
[[Materials Textures - Hub]] · [[SurfaceAppearance PBR from Poly Haven Textures]] · [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[Fur, Hair, Teeth and Eyes — Hero Material Tricks]]
