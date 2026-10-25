---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
tags: [deep-dive, roblox, pbr, surfaceappearance, poly-haven, textures]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# SurfaceAppearance PBR from Poly Haven Textures

## Why this matters
The vault's Poly Haven models come with real scanned PBR textures, but not in a form Roblox accepts as-is: several maps are `.exr` files, the "4K Pro" set is far larger than any Roblox prop needs, and the maps must land in the right `SurfaceAppearance` slots with the right colour handling.
This note turns those files into correct, budget-sized Roblox PBR materials. It includes a tested Blender batch converter and the rules that keep scanned assets from looking wrong under Roblox lighting.

---

## 1. What the vault's Poly Haven folders contain

Example, `20 FBX Asset Library\Poly Haven\Furniture\Arm Chair 01\` (inspected 2026-10-25):

| File | Map | Roblox-ready? |
|---|---|---|
| `ArmChair_01_1k.fbx` | Mesh (measured 5,626 tris in Blender) | Yes, under the 20,000-tri limit |
| `textures\Armchair_01_diff_1k.jpg` | Albedo (colour) | Yes (`.jpg` supported) |
| `textures\Armchair_01_nor_gl_1k.exr` | Normal, **OpenGL** (`_gl`) | **No**, `.exr` is not supported; convert to PNG |
| `textures\Armchair_01_roughness_1k.jpg` | Roughness | Yes |
| `textures\Armchair_01_metallic_1k.exr` | Metalness | **No**, convert; this one is all black (non-metal), so you can skip it |

The `Poly Haven 4K Pro` folder has the same assets at 4K, with `.exr` normal/rough/metal maps and some multi-material models (for example `Boombox` has separate `boombox_*` and `boombox_speakers_*` texture sets). **4K is a source for baking, not a shipping size** for almost any Roblox prop.

Good news: Poly Haven's `nor_gl` maps are already **OpenGL tangent-space**, which is what Roblox requires. Never use a `nor_dx` (DirectX) map without flipping the green channel.

---

## 2. Roblox's PBR rules (Creator Docs › PBR textures, Texture specifications)

| Slot (`SurfaceAppearance`) | Content | Format the docs specify |
|---|---|---|
| `ColorMap` / `ColorMapContent` | Albedo, optional alpha | RGB 24-bit (alpha in the colour map when needed) |
| `NormalMap` / `NormalMapContent` | Tangent-space normal | RGB 24-bit, **OpenGL** only |
| `RoughnessMap` / `RoughnessMapContent` | 0 = glossy, 1 = matte | Single channel grayscale 8-bit |
| `MetalnessMap` / `MetalnessMapContent` | 0 = non-metal, 1 = metal | Single channel grayscale 8-bit |
| `EmissiveMaskContent` (+ `EmissiveStrength`, `EmissiveTint`) | Glow mask | Single channel grayscale 8-bit |

More facts that matter:
- A `SurfaceAppearance` **overrides the MeshPart's `TextureID`**.
- You generally **can't modify `SurfaceAppearance` properties from scripts during a game**; the engine pre-processes them. Swap whole objects or use separate meshes for variants. (`AssetService:CreateSurfaceAppearanceAsync` exists for advanced runtime creation; check its reference page before relying on it.)
- `AlphaMode`: `Overlay` (default; transparent areas reveal `MeshPart.Color`), `Transparency` (cut-outs for leaves and lace), `TintMask` (blend tinted over untinted colour), `Opaque` (ignore alpha; **beta** at the time of writing).
- Studio uses the **metalness workflow** only. Metalness should usually be 0 or 1.
- The docs note Roblox's Fresnel can add unexpected specular at grazing angles; they suggest adding about **+0.1 roughness** if a rough material looks too shiny.

---

## 3. Size the textures before converting

Roblox's PBR budget guidance: **256×256 for every 2×2×2-stud space**, stepping up only for larger assets, with a maximum of 1024 for PBR maps on most content:

| Asset size (studs, cube) | Map size |
|---|---|
| ~1×1×1 | 64–128 |
| ~2×2×2 | 256 |
| ~4×4×4 | 512 |
| ~8×8×8 and up | 1024 (max) |

The Arm Chair at real-world scale is about 0.85 × 0.77 × 1.07 m, roughly 3 × 3 × 4 studs, so **512** is the right target and 1024 is the ceiling. The 4K Pro maps are about 64× the pixels you need.

---

## 4. Batch converter (tested with Blender 5.2, 2026-10-25)

Converts `.exr`/`.jpg`/`.png` maps to **8-bit PNG**, keeps colour maps in sRGB and data maps (normal, roughness, metal) as Non-Color so values are not colour-shifted, and downsizes to a maximum size.

```python
# exr_to_png.py: run with
#   blender -b --factory-startup --python exr_to_png.py -- "<textures folder>" "<output folder>" 512
import bpy, sys, os

args = sys.argv[sys.argv.index("--") + 1:]
in_dir, out_dir = args[0], args[1]
max_size = int(args[2]) if len(args) > 2 else 1024
os.makedirs(out_dir, exist_ok=True)
COLOR_HINTS = ("diff", "albedo", "basecolor", "base_color", "_col")

for name in sorted(os.listdir(in_dir)):
    low = name.lower()
    if not low.endswith((".exr", ".jpg", ".jpeg", ".png", ".tif", ".tiff")):
        continue
    src = bpy.data.images.load(os.path.join(in_dir, name), check_existing=False)
    is_color = any(h in low for h in COLOR_HINTS) and "nor" not in low
    space = 'sRGB' if is_color else 'Non-Color'
    src.colorspace_settings.name = space
    w, h = src.size
    if max(w, h) > max_size:
        s = max_size / max(w, h)
        w, h = max(1, int(w * s)), max(1, int(h * s))
        src.scale(w, h)
    dst = bpy.data.images.new(os.path.splitext(name)[0], width=w, height=h, alpha=False, float_buffer=False)
    dst.colorspace_settings.name = space
    buf = [0.0] * (w * h * 4)
    src.pixels.foreach_get(buf)
    for i in range(3, len(buf), 4):
        buf[i] = 1.0
    dst.pixels.foreach_set(buf)
    dst.filepath_raw = os.path.join(out_dir, os.path.splitext(name)[0] + ".png")
    dst.file_format = 'PNG'
    dst.save()
    print("CONVERTED", name, w, "x", h, space)
    bpy.data.images.remove(src); bpy.data.images.remove(dst)
```

Test result on Arm Chair 01: all four maps written as 8-bit PNG; the converted normal map averaged RGB ≈ (0.50, 0.50, 0.89), which is the expected "mostly flat" tangent-space normal. Saving float `.exr` data directly with `image.save()` produced **16-bit** PNGs; the byte-image copy above is what forces 8-bit.

> [!note] Grayscale maps
> The converter writes 3-channel PNGs with identical channels for roughness and metal. Roblox's spec lists *single-channel 8-bit* for these maps. If you want strict compliance, convert to true grayscale with an image tool (for example ImageMagick `magick in.png -colorspace Gray out.png`). Either way, check the result in Studio.

---

## 5. Two ways to get the material onto the mesh

### A. Let the Importer create it (cleanest)
1. In Blender, import the FBX, open the **Shading** tab, and connect the **converted PNGs** to the Principled BSDF: colour → Base Color, roughness → Roughness, metal → Metallic, normal → **Normal Map node** → Normal. Set the non-colour image nodes to *Non-Color*.
2. Export FBX with Roblox's documented settings: **Path Mode = Copy, Embed Textures on, Apply Scalings = FBX Unit Scale**.
3. Import in Studio. The Importer brings PBR textures through and creates the `SurfaceAppearance`.

### B. Assemble in Studio
1. Import the mesh, then upload the PNGs (Importer or Asset Manager).
2. Insert a `SurfaceAppearance` under the MeshPart and paste each asset ID into `ColorMap`, `NormalMap`, `RoughnessMap` and `MetalnessMap` (leave Metalness empty for non-metals).
3. **Reuse:** once one MeshPart looks right, copy that `SurfaceAppearance` to every copy of the asset. Identical asset IDs are loaded once.

---

## 6. Making scanned assets look right in Roblox

- **Albedo has baked shadows?** Poly Haven albedos are generally delit, but if a texture has baked lighting it will look dirty under Roblox lights. Prefer albedo over "diffuse" maps; the docs explain diffuse maps often contain shading that conflicts with PBR.
- **Too shiny at angles:** add ~0.1 roughness (documented tip).
- **Material values:** check against Roblox's *Material reference* page before inventing numbers. Base material values on real physical characteristics, not one lighting setup.
- **Style clash:** photo-scanned props next to Kenney low-poly kits look out of place. Pick one direction per area, or stylize scans (lower roughness variation, simplified albedo).
- **Triangle check:** many scanned assets are far above 20,000 triangles. In a full-library measurement pass, `boulder_01_1k` measured about **124,000 triangles**, roughly six times the per-mesh limit, so it needs decimation first (see [[Texture Memory and Triangle Budgets for Roblox Scenes]]).

---

## 7. Alternative: Material Generator and MaterialVariant
For tileable surfaces (floors, walls, ground) don't use a UV-specific `SurfaceAppearance` at all. Use a **MaterialVariant** with tiling PBR maps (Poly Haven's texture library is a good CC0 source) or generate one with Studio's **Material Generator**. One variant can cover thousands of parts. See [[Terrain Tools, Expanded Terrain and Material Variants]].

---

## Common mistakes
- Uploading `.exr` maps (unsupported) or renaming them to `.png` without converting.
- Converting normal or roughness maps as sRGB colour, which shifts values and gives wrong shading.
- Using DirectX normal maps (the green channel is inverted under Roblox lighting).
- Shipping 4K Pro maps on a chair; budget 512 for a prop of that size.
- Uploading an all-black metalness map: extra memory for no visual change.
- Expecting to tweak `SurfaceAppearance` maps from a game script at runtime.
- Setting `AlphaMode = Transparency` on opaque assets (sorting and cost) or leaving foliage on `Overlay`, where it shows the part colour instead of cut-outs.
- Putting a unique `SurfaceAppearance` on every copy instead of reusing the same asset IDs.

## Checklist
- [ ] Map sizes chosen from the 256-per-2-stud guidance (≤1024)
- [ ] All `.exr` maps converted to 8-bit PNG; data maps as Non-Color
- [ ] Normal map confirmed OpenGL (`nor_gl`)
- [ ] Black metalness maps dropped
- [ ] SurfaceAppearance created by the Importer or assembled once and reused
- [ ] AlphaMode set deliberately (Overlay / Transparency / TintMask)
- [ ] Mesh under 20k triangles per MeshPart
- [ ] Look checked under at least two lighting setups (day/night or indoor/outdoor)
- [ ] CC0 source recorded in the asset log

---

**Sources checked (2026-10-25):** Creator Docs: Art › PBR textures (Surface appearance); Art › Texture specifications; Art › Blender and Maya texture settings; Art › Export settings; Engine API: SurfaceAppearance, AssetService.CreateSurfaceAppearanceAsync. Vault files in `20 FBX Asset Library\Poly Haven` and `Poly Haven 4K Pro` inspected and converted with Blender 5.2.

**Related:** [[Materials Textures - Hub]] · [[Texture and PBR Specs — 2026 Snapshot]] · [[Materials, PBR and Textures]] · [[Poly Haven - Furniture]] · [[Material Response Framework]] · [[FBX Asset Library - Hub]]
