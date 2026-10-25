---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "9-Slice Panels and Buttons - SliceCenter and SliceScale"
tags: [roblox, community-knowledge, ui, 9-slice, imagelabel, ui-art]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/9-slice
  - https://create.roblox.com/docs/reference/engine/classes/ImageLabel
  - https://create.roblox.com/docs/reference/engine/enums/ScaleType
---
# 9-Slice Panels and Buttons - SliceCenter and SliceScale

Most stylised game UI (wooden signs, sci-fi frames, pixel-art boxes, speech bubbles) is built from a handful of border images. If you stretch those images, the corners smear and the border gets thick on wide buttons. 9-slicing splits one image into a 3x3 grid: corners never scale, edges stretch along one axis, and only the centre stretches both ways. One small texture then fits every button, tooltip and dialog size, including text that grows after translation.

## How the grid scales

| Piece | Scaling |
|---|---|
| 4 corners | none |
| top and bottom edges | horizontal only |
| left and right edges | vertical only |
| centre | both directions |

## Setup in Studio

1. Use an `ImageLabel` or `ImageButton` with a valid `Image`.
2. Set `ScaleType = Slice`. The `SliceCenter` property only shows in the Properties window after this.
3. Click `SliceCenter`, then the `...` button to open the 9-Slice Editor and drag the four red guide lines to where the corner art ends.
4. Check the result at a very wide, a very tall and a tiny size.

The docs warn that the editor's offsets (pixels from each image edge) are **not** the same numbers as `SliceCenter`. `SliceCenter` is a `Rect` in source-image pixels: `Min` is the top-left corner of the centre cell and `Max` is its bottom-right corner.

```lua
-- 96x96 source image with 24 px corners on every side
local panel = Instance.new("ImageLabel")
panel.Image = "rbxassetid://0000000000" -- your uploaded frame texture
panel.ScaleType = Enum.ScaleType.Slice
panel.SliceCenter = Rect.new(24, 24, 72, 72) -- Min (24,24), Max (96-24, 96-24)
panel.SliceScale = 0.5 -- draw the corners at half their pixel size
panel.BackgroundTransparency = 1
```

## SliceScale: one texture, many border thicknesses

`SliceScale` (default 1.0) scales the corner and edge pieces as if you had uploaded a resized texture. This gives you border thickness as a design token:

- Author the frame at 2x (for example 48 px corners on a 192 px image) so it stays sharp on high-DPI phones.
- Use `SliceScale = 0.5` for normal size and `0.35` for compact chips.
- Drive it from your UI scale setting so a "large UI" option thickens borders with the text.

## Art rules that save rework

- **Keep the centre flat.** The centre stretches in both directions, so gradients and patterns there will distort. Put texture detail in corners only.
- **Edges must tile visually when stretched.** A straight line or a flat colour band stretches cleanly; a repeating rivet pattern does not (it smears). For repeating patterns, use a separate `Tile` image instead.
- **Leave transparent padding consistent.** If the art has a drop shadow baked in, the slice guides must include it, and the content inside needs padding (`UIPadding`) to avoid sitting on the shadow.
- **Pixel art:** set `ResampleMode = Pixelated` so scaled corners stay crisp, and use whole-number `SliceScale` values (1, 2, 3).
- **Tint with `ImageColor3`.** Upload the frame in white or light grey and tint per state (normal, hover, disabled, rarity colour) instead of uploading many coloured copies.

## Common mistakes

- Setting `SliceCenter` from the editor offsets by hand (wrong numbers; the centre ends up inverted or huge).
- A button smaller than its two corners added together. When the element is smaller than the corner pieces, they overlap and look broken; set a minimum size with `UISizeConstraint`.
- Using `UICorner` on a 9-sliced image. The corner art already rounds it; double-rounding clips the border.
- Text placed directly on the image with no `UIPadding`, so it touches the border art.

## Checklist

- [ ] `ScaleType = Slice`, `SliceCenter` set in source pixels
- [ ] Tested at extreme aspect ratios and at the smallest real size
- [ ] Border thickness driven by `SliceScale`, not by re-uploading
- [ ] Tinted with `ImageColor3`; one white master texture per frame style
- [ ] `UISizeConstraint` minimum stops corner overlap

## Related
[[UI UX - Hub]] · [[UI Design System and Tokens]] · [[Visual Style Guide Template]] · [[Free UI Kits and Mockup Files]]
