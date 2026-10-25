---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
tags: [deep-dive, roblox, terrain, materialvariant, materialservice, expanded-terrain]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Terrain Tools, Expanded Terrain and Material Variants

## Why this matters
Terrain is the cheapest way to cover large areas on Roblox, but default materials make every map look like every other Roblox map. Material variants, overrides and the newer custom terrain materials are how you get a distinct look without hand-modeling the ground.
They also carry real constraints (texel density, global overrides, beta limitations), so knowing which tool to use avoids repainting an entire world later.

---

## 1. Pick the right tool for the job

| Need | Tool | Scope |
|---|---|---|
| Rough landmass fast | Terrain Editor › Create › **Generate** (biome settings) | Region |
| Match a planned layout | **Import** heightmap (+ optional colormap) | Region |
| Shape, roads, plateaus | Edit › **Draw**, **Sculpt**, **Smooth**, **Flatten** | Brush |
| Water level | Edit › **Sea Level** | Region |
| Change surface look | Edit › **Paint** with a base material, a variant or a custom terrain material | Brush |
| Swap one material everywhere in a region | **Replace** | Region |
| Move or copy chunks | **Select**, **Transform**, `Terrain:CopyRegion` / `PasteRegion` | Region |
| Procedural or runtime terrain | `Terrain:FillBlock`, `FillBall`, `FillCylinder`, `FillWedge`, `WriteVoxels` | Script |

### Heightmap facts (Creator Docs › Terrain)
- **1 heightmap pixel = 4 studs.** Studio supports up to **4096×4096** pixels (`.png` or `.jpg`), which is up to 16,384 studs per side.
- Brighter = higher. The selection region's **Y size** sets the height range (black = bottom, white = top).
- Colormaps map **exact RGB values** to materials. Use hard edges with no anti-aliasing; Studio picks the *closest* material for unknown colours, which causes speckles. Download Roblox's colour key from the Terrain page.

**Workflow:** paint the heightmap in any 2D tool or export it from a terrain generator (World Machine, Gaea, Blender displacement), keep it 16-bit while editing, and export 8-bit `.png` for import if your tool's 16-bit output does not import cleanly. Then use Smooth and Flatten in Studio for gameplay areas.

---

## 2. Three ways to customize terrain appearance

| Approach | What it does | When to use | Watch out |
|---|---|---|---|
| **Terrain material colours** (`Terrain:SetMaterialColor`) | Tints a base material everywhere | Quick palette shift (desaturated grass, warmer sand) | Global per base material |
| **MaterialVariant as an override** (`MaterialService` › Set as Override) | Replaces a base material's textures and physics everywhere, parts **and** terrain | Whole-game art direction (one stylized Grass) | Every Grass in the place changes, including parts |
| **Custom terrain materials** (Expanded Terrain) | Up to **62 paintable** terrain materials, each a base material + optional MaterialVariant + colour | Biomes with several grasses or rocks in one place | Per-place switch, Team Create bugs, see limits below |

### MaterialVariant essentials (Engine API)
`MaterialVariant` lives under `MaterialService` and has:
- `BaseMaterial`: the built-in material it inherits physics from.
- `ColorMap`, `NormalMap`, `RoughnessMap`, `MetalnessMap` (or the newer `*Content` properties), plus `EmissiveMaskContent`, `EmissiveStrength`, `EmissiveTint`.
- `StudsPerTile`: the tile size in studs. This is your texel-density control.
- `MaterialPattern`: `Regular` (straight tiling) or `Organic` (breaks up visible repetition, good for ground).
- `CustomPhysicalProperties`: friction, elasticity and density. **Not respected by custom terrain material slots yet** (documented limitation).

`TerrainDetail` children of a variant let you give terrain **Top**, **Side** and **Bottom** faces different maps, for example grass on top and dirt on cliff sides. This is the biggest single upgrade for natural-looking slopes.

### Texel density you can reason about
Roblox's texture specs state that default terrain displays **512×512 over 8×8 studs** (64 px per stud) and parts show 1024×1024 on an 8×8 face (128 px per stud). For a 1024 px terrain texture:

```
StudsPerTile = TexturePixels / TargetPixelsPerStud
1024 / 64 = 16 studs per tile   (matches default terrain density)
1024 / 32 = 32 studs per tile   (softer, less repetition, blurrier up close)
```

Pick **one** pixels-per-stud target for ground materials in a game and stick to it so neighbouring materials don't look mismatched in sharpness.

---

## 3. Enabling Expanded Terrain (custom terrain materials)

From Creator Docs › Custom terrain materials:

1. Select **Workspace** in the Explorer.
2. In Properties, set **Expanded Terrain** to **Enabled**.
3. Click **Restart** in the Restart Place dialog, then **reopen the place**. It swaps the terrain backend.
4. Terrain Editor › Paint (or Draw/Fill/Sculpt) › open the material picker next to **Source Material** › **+** › name it, choose a base material, optionally a MaterialVariant and a colour.
5. Manage everything in **Window › 3D › Terrain Materials Manager**.

> [!warning] Documented limitations
> - Custom physical properties on a MaterialVariant are **not yet** respected by custom terrain material slots.
> - Editing terrain in **Team Create** "might introduce meshing or visual bugs". Have one person edit terrain at a time, and back up the place first.
> - Heightmap and colormap import may produce different results than before; colormaps become more sensitive to your material colours.
> - Deleting a custom material that terrain still uses turns that terrain **bright purple**. Use **Replace** before deleting.
>
> I could not find an "Expanded Terrain" property in the public Engine API reference as of this date. Treat it as a Studio setting and test on a **copy** of your place before enabling it on a live one.

### A biome palette that stays manageable
Plan names before painting; renames are cheap but repainting is not:

| Slot name | Base | Variant | Use |
|---|---|---|---|
| `Grass_Meadow` | Grass | `MV_GrassMeadow` (Organic, 16 SPT) | Open fields |
| `Grass_Dry` | Grass | same variant, warmer colour | Paths' edges, hills |
| `Ground_Path` | Ground | `MV_DirtPath` | Walkable trails (readability) |
| `Rock_Cliff` | Rock | `MV_CliffRock` + TerrainDetail Side | Slopes |
| `Sand_Beach` | Sand | default | Shore |

Colour variations of **one** variant cost nothing extra in texture memory; distinct variants each add texture sets.

---

## 4. Scripting terrain (procedural or runtime)

Terrain voxels are on a 4-stud grid. `FillBlock` and friends snap to it, so design procedural pieces in multiples of 4.

```lua
-- Server or command bar: carve a flat 64x64 arena with a path material ring
local terrain = workspace.Terrain
local center = Vector3.new(0, 20, 0)

-- Clear the volume with Air, then lay the floor
terrain:FillBlock(CFrame.new(center + Vector3.new(0, 16, 0)), Vector3.new(64, 32, 64), Enum.Material.Air)
terrain:FillBlock(CFrame.new(center), Vector3.new(64, 8, 64), Enum.Material.Grass)

-- A ring of path using a cylinder, then put grass back in the middle
terrain:FillCylinder(CFrame.new(center + Vector3.new(0, 4, 0)), 1, 30, Enum.Material.Ground)
terrain:FillCylinder(CFrame.new(center + Vector3.new(0, 4, 0)), 1, 24, Enum.Material.Grass)

-- Swap all Ground to Mud inside a region (Region3 must be aligned to the 4-stud grid)
local region = Region3.new(center - Vector3.new(32, 8, 32), center + Vector3.new(32, 8, 32)):ExpandToGrid(4)
terrain:ReplaceMaterial(region, 4, Enum.Material.Ground, Enum.Material.Mud)
```

Global tint through code (handy for seasonal events):

```lua
workspace.Terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(196, 168, 92)) -- autumn
```

For runtime edits in a live game, keep them on the server and small; terrain changes replicate, and large `WriteVoxels` calls are expensive.

---

## 5. Performance and readability notes
- Terrain grass `Decoration` (animated grass blades) costs performance on low-end devices. Test with it on and off in the Device Simulator's entry-level phone profile.
- `Organic` pattern reduces repetition but does not fix a low-resolution texture. Fix `StudsPerTile` first.
- Keep paths and walkable areas a **different value** (lighter or darker) from surrounding ground so players can navigate on small screens.
- Water: `Terrain.WaterWaveSize` and `WaterTransparency` change readability and cost. Very clear, wavy water over large areas is noticeably more expensive on low-end devices.

---

## Common mistakes
- Using a MaterialVariant **override** for one biome and accidentally restyling every part using that base material.
- Mismatched `StudsPerTile` between neighbouring materials, so one looks sharp and the next looks blurry.
- Enabling Expanded Terrain on the live place without testing on a copy, then hitting Team Create meshing bugs.
- Deleting a custom terrain material still in use (purple terrain).
- Anti-aliased colormaps creating material speckles at every border.
- Expecting `CustomPhysicalProperties` (slippery ice) to work through custom terrain slots; it doesn't yet.
- Procedural terrain code that doesn't snap to the 4-stud voxel grid, which leaves jagged or missing edges.

## Checklist
- [ ] Heightmap planned at 4 studs/pixel, ≤4096 px, hard-edged colormap
- [ ] Ground pixels-per-stud target chosen; `StudsPerTile` set to match
- [ ] Override vs custom terrain material decision written down
- [ ] Expanded Terrain tested on a copy; one terrain editor at a time in Team Create
- [ ] TerrainDetail Side face set for cliff materials
- [ ] Paths visually distinct from surrounding ground
- [ ] Grass decoration and water settings checked on an entry-level phone profile
- [ ] Material palette documented (slot name, base, variant, use)

---

**Sources checked (2026-10-25):** Creator Docs: Parts › Terrain; Studio › Terrain Editor; Parts › Custom terrain materials; Parts › Materials (Custom materials, overrides, terrain details); Art › Texture specifications; Engine API: Terrain, MaterialVariant, TerrainDetail, MaterialPattern.

**Related:** [[Terrain Vegetation - Hub]] · [[Terrain and Biome Production]] · [[Materials Textures - Hub]] · [[Procedural Vegetation Scatter and Biome Rules]] · [[Vegetation Layering and Composition]] · [[Realistic Rock and Cliff Surfaces — PBR Without Waste]]
