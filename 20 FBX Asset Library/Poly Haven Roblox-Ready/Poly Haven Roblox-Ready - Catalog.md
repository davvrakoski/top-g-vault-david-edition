---
area: "20 FBX Asset Library"
cluster: "Poly Haven"
license: "CC0 1.0"
model_count: 521
tags: [asset, fbx, roblox-ready, cc0]
cssclasses: [tg-a20]
---
# Poly Haven Roblox-Ready - Catalog
> [!topg] 521 realistic Poly Haven models rebuilt for Roblox Studio · 1,852 MeshParts, every one under the 20,000-triangle limit (largest: 19,000) · sized in studs, standing on the ground · 2,340 Roblox-ready 1024 PNG maps · 5.03 GB · CC0

Links: [[FBX Asset Library - Hub]] · [[Materials Textures - Hub]]

## What was done to every model
The originals stay untouched in `20 FBX Asset Library/Poly Haven/`. This folder holds a converted copy of each one, made in Blender 5.2:

1. **Cleaned and grouped.** Extra LODs removed, all object transforms applied. Pieces that touch are joined into one object. Pieces that stand apart (for example the rocks in a rock set or the clumps in a grass pack) stay separate so you can place them one by one.
2. **One material per MeshPart.** A Roblox MeshPart holds one SurfaceAppearance, so each object is split by material (for example glass and metal become two MeshParts).
3. **Triangle limit.** Roblox allows up to 20,000 triangles per mesh (Creator Docs, *Modeling specifications*). We cap each part at 19,000:
   - **390** models were already under the limit and keep **full detail**.
   - **58** models were cut into loose pieces, packed into 2 to 4 MeshParts. They also keep **full detail**.
   - **73** models were too heavy to split and were **decimated** (Collapse, UVs kept) down to 19,000 triangles or fewer per part (6 of them also had some parts split instead). Smooth shading was rebuilt after decimation. For close-up hero shots, use the original or the 4K version.
4. **Scale and pivot.** Scaled from metres to studs (1 stud = 0.28 m, so ×3.5714). The pivot of the whole model is at its bottom centre, so it sits on the ground at Y = 0. Each MeshPart also has its pivot at the bottom centre of its own piece.
5. **Textures for Roblox.** EXR files are not accepted, so every map was converted to a 1024×1024 (max) PNG. Normal maps stay in OpenGL tangent-space format, which is the only format Roblox supports. Alpha maps (leaves, grass, glass) are packed into the ColorMap alpha channel (69 models: files named `_Alpha_ColorMap.png`). Emissive maps became grayscale `_EmissiveMask.png` files (14 models).
6. **Export.** FBX settings follow the Roblox Blender export guide: Apply Scalings = FBX Unit Scale, Z forward / Y up, transforms applied, no leaf bones, triangulated, textures embedded (Path Mode Copy + Embed Textures).

### Files in each model folder
`<Category>/<Model>/`
- `<Model>_Roblox.fbx`: the mesh, with all PNG maps embedded inside it
- `<Model>_ColorMap.png`, `_NormalMap.png`, `_RoughnessMap.png`, `_MetalnessMap.png` (only on metal models), `_EmissiveMask.png` (only on glowing models). Models with several materials add the material name, for example `Lightbulb_01_Alpha_ColorMap.png`.
- `Parts and textures.txt`: only on models with more than one texture set. It lists which maps go on which MeshPart.
- `preview.png`: a thumbnail

## Import into Roblox Studio and build the SurfaceAppearance
**A. Import the model**
1. Open your place in Studio. From the **File** menu, choose **Import** and pick `<Model>_Roblox.fbx`.
2. Check the import preview before you click Import:
   - **Scale Unit**: keep **Studs** (the default). The file is already in studs.
   - **World Forward** = Front and **World Up** = Top (the defaults).
   - **Anchored**: turn on for props that should not fall or roll.
   - **Set Pivot to Scene Origin** and **Use Imported Pivot**: keep on. The model then sits on the ground from its bottom centre.
   - **Upload to Roblox** adds the model to your Toolbox and Asset Manager. Turn it off while you are only testing.
   - **Merge Meshes**: keep **off**. Each part needs its own SurfaceAppearance.
3. Fix any warnings or errors shown in the preview, then click **Import**. You get a Model with one MeshPart per piece or material.
4. The maps are embedded in the FBX, and the Importer reads PBR textures from `.fbx` files. Look in the **Explorer** for a `SurfaceAppearance` under each MeshPart. If one is there with its maps filled in, you are done.

**B. Build or fix a SurfaceAppearance by hand** (use this if a map is missing, or to reuse the maps on other meshes)
1. Upload the PNGs. Open the **Asset Manager** (**Window** menu or **Home** tab), click the import button, and select the model's PNG files. You can also use **File ⟩ Import**, which takes `.png` images too. Uploads go through moderation first.
2. In the **Explorer**, hover over the MeshPart, click **⊕** and insert a **SurfaceAppearance**.
3. Select the SurfaceAppearance. In the **Properties** window, set each map to the uploaded image (enter its asset ID):
   - `ColorMap` ← `_ColorMap.png` (or `_Alpha_ColorMap.png`)
   - `NormalMap` ← `_NormalMap.png`
   - `RoughnessMap` ← `_RoughnessMap.png`
   - `MetalnessMap` ← `_MetalnessMap.png` (leave it empty if the model has none, which means non-metal)
4. **Cut-out materials** (`_Alpha_ColorMap`, used for leaves, grass and glass): set `AlphaMode` to **Transparency**. For hard cut-outs like foliage, keep the MeshPart `Transparency` at **0**. For soft see-through surfaces like glass, set it to at least **0.02**. With the default `AlphaMode` (Overlay), the MeshPart's Color shows through the holes instead.
5. **Glowing parts** (`_EmissiveMask.png`): set `EmissiveMaskContent` to the mask, then adjust `EmissiveStrength` and `EmissiveTint`.
6. On multi-material models, check `Parts and textures.txt` to see which maps belong on which MeshPart.

> [!tip] Performance
> Each MeshPart is one draw. Sets with many separate pieces (book sets, grass packs) are best used by keeping only the pieces you need. Decimated foliage looks best at mid to far distance.

## Catalog
Size is in studs as width × height × depth (Roblox X × Y × Z). Triangles: Poly Haven original → Roblox-ready total.

### Appliances
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Boombox/preview.png\|96]] | [Boombox](https://polyhaven.com/a/boombox) | 10,168 (as-is) | 2 | 2.58 × 1.68 × 0.67 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Cash Register 01/preview.png\|96]] | [Cash Register 01](https://polyhaven.com/a/CashRegister_01) | 9,927 (as-is) | 2 | 2.14 × 2.22 × 2.23 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Ceiling Fan/preview.png\|96]] | [Ceiling Fan](https://polyhaven.com/a/ceiling_fan) | 16,356 (as-is) | 1 | 5.22 × 1.84 × 5.22 | emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Coffee Cart 01/preview.png\|96]] | [Coffee Cart 01](https://polyhaven.com/a/CoffeeCart_01) | 27,659 (as-is) | 3 | 7.74 × 6.13 × 3.83 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Drill Press 01/preview.png\|96]] | [Drill Press 01](https://polyhaven.com/a/drill_press_01) | 58,526 (as-is) | 4 | 1.27 × 3.22 × 2.14 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Exterior Aircon Unit/preview.png\|96]] | [Exterior Aircon Unit](https://polyhaven.com/a/exterior_aircon_unit) | 18,986 (as-is) | 4 | 6.43 × 3.31 × 1.34 | 2 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Gaming Console/preview.png\|96]] | [Gaming Console](https://polyhaven.com/a/gaming_console) | 31,710 → 18,429 | 1 | 1.16 × 0.36 × 1.14 | decimated, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Scandinavian Masonry Heater/preview.png\|96]] | [Scandinavian Masonry Heater](https://polyhaven.com/a/scandinavian_masonry_heater) | 9,350 (as-is) | 1 | 4.17 × 8.43 × 4.77 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Vintage Microwave/preview.png\|96]] | [Vintage Microwave](https://polyhaven.com/a/vintage_microwave) | 8,120 (as-is) | 2 | 3.83 × 1.88 × 2.66 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Appliances/Vintage Radio Transceiver/preview.png\|96]] | [Vintage Radio Transceiver](https://polyhaven.com/a/vintage_radio_transceiver) | 42,350 (as-is) | 3 | 2.05 × 1.55 × 1.48 | split, full detail

### Bed
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Bed/Old Bed Frame/preview.png\|96]] | [Old Bed Frame](https://polyhaven.com/a/old_bed_frame) | 49,990 (as-is) | 3 | 3.23 × 4.29 × 7.15 | split, full detail

### Books
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Books/Binder Notebook/preview.png\|96]] | [Binder Notebook](https://polyhaven.com/a/binder_notebook) | 18,077 (as-is) | 2 | 2.09 × 0.09 × 0.71 | 2 separate pieces

### Containers
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Brass Vase 03/preview.png\|96]] | [Brass Vase 03](https://polyhaven.com/a/brass_vase_03) | 2,616 (as-is) | 1 | 0.29 × 0.72 × 0.29 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Brass Vase 04/preview.png\|96]] | [Brass Vase 04](https://polyhaven.com/a/brass_vase_04) | 2,760 (as-is) | 1 | 0.29 × 0.61 × 0.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Can Rusted/preview.png\|96]] | [Can Rusted](https://polyhaven.com/a/can_rusted) | 3,520 (as-is) | 1 | 0.44 × 0.54 × 0.45 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Ceramic Pot/preview.png\|96]] | [Ceramic Pot](https://polyhaven.com/a/ceramic_pot) | 3,592 (as-is) | 1 | 2.34 × 1.33 × 1.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Ceramic Vase 03/preview.png\|96]] | [Ceramic Vase 03](https://polyhaven.com/a/ceramic_vase_03) | 11,136 (as-is) | 1 | 0.4 × 1.48 × 0.4 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Ceramic Vase 04/preview.png\|96]] | [Ceramic Vase 04](https://polyhaven.com/a/ceramic_vase_04) | 9,000 (as-is) | 1 | 0.65 × 1.22 × 0.65 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Cigarette Pack/preview.png\|96]] | [Cigarette Pack](https://polyhaven.com/a/cigarette_pack) | 11,956 (as-is) | 1 | 0.2 × 0.33 × 0.09 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Cleaner Tin 01/preview.png\|96]] | [Cleaner Tin 01](https://polyhaven.com/a/cleaner_tin_01) | 3,560 (as-is) | 1 | 0.31 × 0.47 × 0.31 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Compost Bag 02/preview.png\|96]] | [Compost Bag 02](https://polyhaven.com/a/compost_bag_02) | 12,096 (as-is) | 1 | 1.93 × 1.55 × 1.68 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Industrial Plastic Container/preview.png\|96]] | [Industrial Plastic Container](https://polyhaven.com/a/industrial_pastic_container) | 7,118 (as-is) | 1 | 1.63 × 1.5 × 2.26 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Metal Jug/preview.png\|96]] | [Metal Jug](https://polyhaven.com/a/metal_jug) | 6,040 (as-is) | 1 | 0.7 × 1.03 × 0.7 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Metal Toolbox/preview.png\|96]] | [Metal Toolbox](https://polyhaven.com/a/metal_toolbox) | 14,228 (as-is) | 1 | 1.43 × 1.09 × 0.97 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Multi Cleaner Bottle/preview.png\|96]] | [Multi Cleaner Bottle](https://polyhaven.com/a/multi_cleaner_bottle) | 6,792 (as-is) | 1 | 0.32 × 0.82 × 0.32 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Oil Tin/preview.png\|96]] | [Oil Tin](https://polyhaven.com/a/oil_tin) | 2,834 (as-is) | 1 | 0.41 × 0.73 × 0.55 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Old Military Crate/preview.png\|96]] | [Old Military Crate](https://polyhaven.com/a/old_military_crate) | 20,952 (as-is) | 2 | 6.48 × 1.07 × 3.48 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Planter Box 02/preview.png\|96]] | [Planter Box 02](https://polyhaven.com/a/planter_box_02) | 10,944 (as-is) | 1 | 4.47 × 1.62 × 1.67 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Planter Box 03/preview.png\|96]] | [Planter Box 03](https://polyhaven.com/a/planter_box_03) | 13,112 (as-is) | 1 | 3.27 × 3.05 × 2.34 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Planter Pot Clay/preview.png\|96]] | [Planter Pot Clay](https://polyhaven.com/a/planter_pot_clay) | 3,080 (as-is) | 1 | 0.95 × 0.79 × 0.94 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Plastic Bottle Gallon/preview.png\|96]] | [Plastic Bottle Gallon](https://polyhaven.com/a/plastic_bottle_gallon) | 13,728 (as-is) | 1 | 0.59 × 0.98 × 0.45 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Plastic Crate 03/preview.png\|96]] | [Plastic Crate 03](https://polyhaven.com/a/plastic_crate_03) | 21,740 → 18,430 | 1 | 1.72 × 0.95 × 0.95 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Russian Food Cans 01/preview.png\|96]] | [Russian Food Cans 01](https://polyhaven.com/a/russian_food_cans_01) | 1,348 (as-is) | 3 | 0.51 × 0.3 × 0.17 | 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Seedling Tray 01/preview.png\|96]] | [Seedling Tray 01](https://polyhaven.com/a/seeding_tray_01) | 8,334 (as-is) | 1 | 0.79 × 0.22 × 0.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Watering Can Metal 01/preview.png\|96]] | [Watering Can Metal 01](https://polyhaven.com/a/watering_can_metal_01) | 11,837 (as-is) | 1 | 0.68 × 0.7 × 1.62 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wicker Basket 01/preview.png\|96]] | [Wicker Basket 01](https://polyhaven.com/a/wicker_basket_01) | 22,276 (as-is) | 2 | 1.37 × 0.42 × 1.05 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wicker Basket 02/preview.png\|96]] | [Wicker Basket 02](https://polyhaven.com/a/wicker_basket_02) | 17,850 (as-is) | 1 | 1.24 × 0.72 × 0.91 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wine Barrel 01/preview.png\|96]] | [Wine Barrel 01](https://polyhaven.com/a/wine_barrel_01) | 10,820 (as-is) | 1 | 2.65 × 3.11 × 2.7 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wooden Barrels 01/preview.png\|96]] | [Wooden Barrels 01](https://polyhaven.com/a/wooden_barrels_01) | 33,142 (as-is) | 18 | 15.86 × 3.42 × 11.94 | 18 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wooden Crate 01/preview.png\|96]] | [Wooden Crate 01](https://polyhaven.com/a/wooden_crate_01) | 6,576 (as-is) | 1 | 2.95 × 1.25 × 1.46 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wooden Crate 02/preview.png\|96]] | [Wooden Crate 02](https://polyhaven.com/a/wooden_crate_02) | 5,176 (as-is) | 1 | 4.17 × 1.66 × 1.89 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Containers/Wooden Military Crate/preview.png\|96]] | [Wooden Military Crate](https://polyhaven.com/a/wooden_military_crate) | 22,986 (as-is) | 2 | 4.44 × 1.66 × 1.86 | split, full detail

### Decorative
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Antique Ceramic Vase 01/preview.png\|96]] | [Antique Ceramic Vase 01](https://polyhaven.com/a/antique_ceramic_vase_01) | 9,408 (as-is) | 1 | 0.91 × 1.57 × 0.91 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Brass Candleholders/preview.png\|96]] | [Brass Candleholders](https://polyhaven.com/a/brass_candleholders) | 41,936 (as-is) | 8 | 3.76 × 2.98 × 1.3 | split, full detail, 3 separate pieces, alpha cut-out, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Brass Diya Lantern/preview.png\|96]] | [Brass Diya Lantern](https://polyhaven.com/a/brass_diya_lantern) | 12,742 (as-is) | 3 | 0.44 × 1.36 × 0.44 | alpha cut-out, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Brass Vase 01/preview.png\|96]] | [Brass Vase 01](https://polyhaven.com/a/brass_vase_01) | 21,440 (as-is) | 2 | 0.81 × 2.47 × 0.81 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Brass Vase 02/preview.png\|96]] | [Brass Vase 02](https://polyhaven.com/a/brass_vase_02) | 6,890 (as-is) | 1 | 0.75 × 1.89 × 0.75 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Bronze Ray Statue/preview.png\|96]] | [Bronze Ray Statue](https://polyhaven.com/a/bronze_ray_statue) | 1,844 (as-is) | 1 | 2.53 × 2.11 × 1.91 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Bronze Shark Statue/preview.png\|96]] | [Bronze Shark Statue](https://polyhaven.com/a/bronze_shark_statue) | 7,334 (as-is) | 1 | 1.26 × 1.54 × 2.71 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Bronze Whale Statue/preview.png\|96]] | [Bronze Whale Statue](https://polyhaven.com/a/bronze_whale_statue) | 3,816 (as-is) | 1 | 3.33 × 3.83 × 4.88 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Bull Head/preview.png\|96]] | [Bull Head](https://polyhaven.com/a/bull_head) | 17,148 (as-is) | 1 | 1.09 × 1.55 × 1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Ceramic Vase 02/preview.png\|96]] | [Ceramic Vase 02](https://polyhaven.com/a/ceramic_vase_02) | 11,128 (as-is) | 1 | 0.78 × 1.1 × 0.78 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Chess Set/preview.png\|96]] | [Chess Set](https://polyhaven.com/a/chess_set) | 76,920 (as-is) | 5 | 1.98 × 0.4 × 1.98 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Concrete Cat Statue/preview.png\|96]] | [Concrete Cat Statue](https://polyhaven.com/a/concrete_cat_statue) | 11,950 (as-is) | 1 | 0.55 × 1.01 × 0.89 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Fancy Picture Frame 01/preview.png\|96]] | [Fancy Picture Frame 01](https://polyhaven.com/a/fancy_picture_frame_01) | 938 (as-is) | 2 | 2.15 × 1.66 × 0.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Fancy Picture Frame 02/preview.png\|96]] | [Fancy Picture Frame 02](https://polyhaven.com/a/fancy_picture_frame_02) | 35,102 → 18,432 | 2 | 2.36 × 2.75 × 0.32 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Garden Gnome/preview.png\|96]] | [Garden Gnome](https://polyhaven.com/a/garden_gnome) | 28,858 → 18,429 | 1 | 0.92 × 2.14 × 0.75 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Gothic Statue/preview.png\|96]] | [Gothic Statue](https://polyhaven.com/a/gothic_statue) | 27,739 → 18,426 | 1 | 5.28 × 6.21 × 5.58 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Hanging Picture Frame 01/preview.png\|96]] | [Hanging Picture Frame 01](https://polyhaven.com/a/hanging_picture_frame_01) | 2,586 (as-is) | 3 | 2.12 × 3 × 0.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Hanging Picture Frame 02/preview.png\|96]] | [Hanging Picture Frame 02](https://polyhaven.com/a/hanging_picture_frame_02) | 3,678 (as-is) | 3 | 2.69 × 1.79 × 0.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Horse Head/preview.png\|96]] | [Horse Head](https://polyhaven.com/a/horse_head) | 12,068 (as-is) | 1 | 0.77 × 1.5 × 1.19 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Lambis Shell/preview.png\|96]] | [Lambis Shell](https://polyhaven.com/a/lambis_shell) | 12,498 (as-is) | 1 | 0.5 × 0.17 × 0.27 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Lion Head/preview.png\|96]] | [Lion Head](https://polyhaven.com/a/lion_head) | 47,214 → 18,430 | 1 | 1.15 × 1.56 × 0.74 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Mantel Clock 01/preview.png\|96]] | [Mantel Clock 01](https://polyhaven.com/a/mantel_clock_01) | 25,721 (as-is) | 3 | 1.22 × 0.57 × 0.45 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Marble Bust 01/preview.png\|96]] | [Marble Bust 01](https://polyhaven.com/a/marble_bust_01) | 17,456 (as-is) | 1 | 0.97 × 1.84 × 1.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Ornate Mirror 01/preview.png\|96]] | [Ornate Mirror 01](https://polyhaven.com/a/ornate_mirror_01) | 14,246 (as-is) | 1 | 1.74 × 2.66 × 0.09 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Planter Box 01/preview.png\|96]] | [Planter Box 01](https://polyhaven.com/a/planter_box_01) | 8,094 (as-is) | 1 | 3.26 × 1.52 × 1.48 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Potted Plant 01/preview.png\|96]] | [Potted Plant 01](https://polyhaven.com/a/potted_plant_01) | 176,226 → 87,756 | 5 | 2.1 × 4.82 × 2.26 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Potted Plant 02/preview.png\|96]] | [Potted Plant 02](https://polyhaven.com/a/potted_plant_02) | 69,806 (as-is) | 5 | 2.5 × 3 × 2.35 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Potted Plant 04/preview.png\|96]] | [Potted Plant 04](https://polyhaven.com/a/potted_plant_04) | 8,929 (as-is) | 1 | 0.6 × 0.96 × 0.66 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Standing Chalkboard 01/preview.png\|96]] | [Standing Chalkboard 01](https://polyhaven.com/a/standing_chalkboard_01) | 2,372 (as-is) | 2 | 3.28 × 5.39 × 2.71 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Standing Picture Frame 01/preview.png\|96]] | [Standing Picture Frame 01](https://polyhaven.com/a/standing_picture_frame_01) | 1,634 (as-is) | 3 | 0.72 × 0.89 × 0.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Standing Picture Frame 02/preview.png\|96]] | [Standing Picture Frame 02](https://polyhaven.com/a/standing_picture_frame_02) | 2,986 (as-is) | 3 | 0.77 × 0.95 × 0.37 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Sungka Board/preview.png\|96]] | [Sungka Board](https://polyhaven.com/a/sungka_board) | 7,304 (as-is) | 1 | 0.5 × 0.13 × 2.14 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Sungka Board 02/preview.png\|96]] | [Sungka Board 02](https://polyhaven.com/a/sungka_board_02) | 42,558 (as-is) | 3 | 3.33 × 0.09 × 0.63 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Throw Pillows 01/preview.png\|96]] | [Throw Pillows 01](https://polyhaven.com/a/throw_pillows_01) | 6,362 (as-is) | 1 | 3.36 × 1.61 × 1.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Vintage Electric Kettle/preview.png\|96]] | [Vintage Electric Kettle](https://polyhaven.com/a/vintage_electric_kettle) | 14,838 (as-is) | 2 | 1.15 × 1.09 × 0.89 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Vintage Grandfather Clock 01/preview.png\|96]] | [Vintage Grandfather Clock 01](https://polyhaven.com/a/vintage_grandfather_clock_01) | 8,582 (as-is) | 2 | 2.23 × 7.82 × 1.52 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Vintage Suitcase/preview.png\|96]] | [Vintage Suitcase](https://polyhaven.com/a/vintage_suitcase) | 16,474 (as-is) | 2 | 5.74 × 2.03 × 0.85 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Wall Clock/preview.png\|96]] | [Wall Clock](https://polyhaven.com/a/wall_clock) | 3,658 (as-is) | 2 | 1.14 × 1.14 × 0.17 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Decorative/Wooden Candlestick/preview.png\|96]] | [Wooden Candlestick](https://polyhaven.com/a/wooden_candlestick) | 212,992 → 18,429 | 1 | 0.35 × 0.78 × 0.35 | decimated

### Electronics
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Circuit Board/preview.png\|96]] | [Circuit Board](https://polyhaven.com/a/circuit_board) | 14,430 (as-is) | 2 | 1.44 × 0.28 × 1.42 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Electric Stove/preview.png\|96]] | [Electric Stove](https://polyhaven.com/a/electric_stove) | 13,914 (as-is) | 2 | 1.79 × 3.07 × 2.31 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Filmstrip Projector 8mm/preview.png\|96]] | [Filmstrip Projector 8mm](https://polyhaven.com/a/filmstrip_projector_8mm) | 32,697 (as-is) | 5 | 0.91 × 1.23 × 2.15 | split, full detail, 3 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Lightbulb Led/preview.png\|96]] | [Lightbulb Led](https://polyhaven.com/a/lightbulb_led) | 6,420 (as-is) | 1 | 0.22 × 0.36 × 0.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Retro Multimeter/preview.png\|96]] | [Retro Multimeter](https://polyhaven.com/a/retro_multimeter) | 8,948 (as-is) | 2 | 0.77 × 1 × 0.72 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Security Camera 01/preview.png\|96]] | [Security Camera 01](https://polyhaven.com/a/security_camera_01) | 13,571 (as-is) | 2 | 0.61 × 1.02 × 1.98 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Television 02/preview.png\|96]] | [Television 02](https://polyhaven.com/a/television_02) | 2,310 (as-is) | 1 | 1.43 × 1.47 × 1.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Electronics/Vintage Video Camera/preview.png\|96]] | [Vintage Video Camera](https://polyhaven.com/a/vintage_video_camera) | 18,682 (as-is) | 2 | 0.25 × 0.52 × 0.47 | alpha cut-out

### Food
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Bananas/preview.png\|96]] | [Bananas](https://polyhaven.com/a/bananas) | 46,868 (as-is) | 4 | 2.14 × 0.64 × 0.87 | split, full detail, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Carrot Cake/preview.png\|96]] | [Carrot Cake](https://polyhaven.com/a/carrot_cake) | 13,790 (as-is) | 1 | 0.81 × 0.35 × 0.8 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Apple 01/preview.png\|96]] | [Food Apple 01](https://polyhaven.com/a/food_apple_01) | 7,012 (as-is) | 1 | 0.35 × 0.3 × 0.34 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Avocado 01/preview.png\|96]] | [Food Avocado 01](https://polyhaven.com/a/food_avocado_01) | 7,743 (as-is) | 1 | 0.34 × 0.51 × 0.34 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Ginger 01/preview.png\|96]] | [Food Ginger 01](https://polyhaven.com/a/food_ginger_01) | 7,205 (as-is) | 1 | 0.86 × 2.05 × 0.53 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Kiwi 01/preview.png\|96]] | [Food Kiwi 01](https://polyhaven.com/a/food_kiwi_01) | 7,748 (as-is) | 1 | 0.25 × 0.32 × 0.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Lime 01/preview.png\|96]] | [Food Lime 01](https://polyhaven.com/a/food_lime_01) | 8,100 (as-is) | 1 | 0.21 × 0.27 × 0.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Lychee 01/preview.png\|96]] | [Food Lychee 01](https://polyhaven.com/a/food_lychee_01) | 6,783 (as-is) | 1 | 0.15 × 0.18 × 0.15 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Food Pomegranate 01/preview.png\|96]] | [Food Pomegranate 01](https://polyhaven.com/a/food_pomegranate_01) | 8,142 (as-is) | 1 | 0.41 × 0.41 × 0.41 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Long Life Food/preview.png\|96]] | [Long Life Food](https://polyhaven.com/a/long_life_food) | 4,712 (as-is) | 4 | 1.87 × 0.85 × 0.41 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Pears Asian 01/preview.png\|96]] | [Pears Asian 01](https://polyhaven.com/a/food_pears_asian_01) | 12,572 (as-is) | 1 | 0.45 × 0.25 × 0.6 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Food/Sweet Potato/preview.png\|96]] | [Sweet Potato](https://polyhaven.com/a/sweet_potato) | 2,042 (as-is) | 1 | 0.21 × 0.36 × 0.22 | 

### Furniture
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Arm Chair 01/preview.png\|96]] | [Arm Chair 01](https://polyhaven.com/a/ArmChair_01) | 5,626 (as-is) | 1 | 3.03 × 3.8 × 2.73 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Barber Shop Chair 01/preview.png\|96]] | [Barber Shop Chair 01](https://polyhaven.com/a/BarberShopChair_01) | 4,280 (as-is) | 1 | 2.7 × 5.32 × 4.74 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Chinese Armchair/preview.png\|96]] | [Chinese Armchair](https://polyhaven.com/a/chinese_armchair) | 2,675 (as-is) | 1 | 3.03 × 5.67 × 2.82 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Chinese Commode/preview.png\|96]] | [Chinese Commode](https://polyhaven.com/a/chinese_commode) | 6,775 (as-is) | 1 | 16.04 × 7.21 × 4.18 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Chinese Screen Panels/preview.png\|96]] | [Chinese Screen Panels](https://polyhaven.com/a/chinese_screen_panels) | 784 (as-is) | 1 | 4.62 × 5.73 × 1.35 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Chinese Sofa/preview.png\|96]] | [Chinese Sofa](https://polyhaven.com/a/chinese_sofa) | 704 (as-is) | 1 | 8.16 × 3.07 × 3.46 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Classic Console 01/preview.png\|96]] | [Classic Console 01](https://polyhaven.com/a/ClassicConsole_01) | 7,566 (as-is) | 1 | 5.51 × 3.39 × 2.1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Classic Nightstand 01/preview.png\|96]] | [Classic Nightstand 01](https://polyhaven.com/a/ClassicNightstand_01) | 2,002 (as-is) | 1 | 2.03 × 2.5 × 1.51 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Coffee Table 01/preview.png\|96]] | [Coffee Table 01](https://polyhaven.com/a/CoffeeTable_01) | 10,404 (as-is) | 1 | 5.5 × 1.87 × 3.47 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Coffee Table Round 01/preview.png\|96]] | [Coffee Table Round 01](https://polyhaven.com/a/coffee_table_round_01) | 4,044 (as-is) | 1 | 4.65 × 1.75 × 4.65 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Dining Chair 02/preview.png\|96]] | [Dining Chair 02](https://polyhaven.com/a/dining_chair_02) | 22,013 (as-is) | 2 | 1.55 × 3.48 × 2.06 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Dining Table/preview.png\|96]] | [Dining Table](https://polyhaven.com/a/dining_table) | 1,048 (as-is) | 1 | 8.06 × 3.13 × 4.97 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Drawer Cabinet/preview.png\|96]] | [Drawer Cabinet](https://polyhaven.com/a/drawer_cabinet) | 26,406 (as-is) | 2 | 4.08 × 6.72 × 1.74 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gallinera Chair/preview.png\|96]] | [Gallinera Chair](https://polyhaven.com/a/gallinera_chair) | 11,560 (as-is) | 1 | 2.07 × 3.69 × 2.16 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gallinera Table/preview.png\|96]] | [Gallinera Table](https://polyhaven.com/a/gallinera_table) | 5,528 (as-is) | 1 | 2.96 × 1.74 × 1.85 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gothic Bed 01/preview.png\|96]] | [Gothic Bed 01](https://polyhaven.com/a/GothicBed_01) | 18,741 (as-is) | 1 | 5.33 × 5.48 × 7.29 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gothic Cabinet 01/preview.png\|96]] | [Gothic Cabinet 01](https://polyhaven.com/a/GothicCabinet_01) | 12,170 (as-is) | 1 | 6.14 × 8.43 × 3.99 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gothic Coffee Table/preview.png\|96]] | [Gothic Coffee Table](https://polyhaven.com/a/gothic_coffee_table) | 23,836 (as-is) | 2 | 5.15 × 2 × 5.15 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Gothic Commode 01/preview.png\|96]] | [Gothic Commode 01](https://polyhaven.com/a/GothicCommode_01) | 3,897 (as-is) | 1 | 4.29 × 4.33 × 2.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Green Chair 01/preview.png\|96]] | [Green Chair 01](https://polyhaven.com/a/GreenChair_01) | 4,213 (as-is) | 1 | 2.4 × 3.78 × 2.37 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Industrial Coffee Table/preview.png\|96]] | [Industrial Coffee Table](https://polyhaven.com/a/industrial_coffee_table) | 41,300 (as-is) | 3 | 2.78 × 2.28 × 2.71 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Metal Office Desk/preview.png\|96]] | [Metal Office Desk](https://polyhaven.com/a/metal_office_desk) | 6,898 (as-is) | 1 | 7.14 × 2.81 × 3.38 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Metal Stool 01/preview.png\|96]] | [Metal Stool 01](https://polyhaven.com/a/metal_stool_01) | 8,334 (as-is) | 1 | 1.26 × 3.15 × 1.27 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Metal Stool 02/preview.png\|96]] | [Metal Stool 02](https://polyhaven.com/a/metal_stool_02) | 6,532 (as-is) | 1 | 1.6 × 1.64 × 1.69 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Metal Stool 03/preview.png\|96]] | [Metal Stool 03](https://polyhaven.com/a/metal_stool_03) | 6,576 (as-is) | 1 | 1.65 × 3.65 × 1.68 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Mid Century Lounge Chair/preview.png\|96]] | [Mid Century Lounge Chair](https://polyhaven.com/a/mid_century_lounge_chair) | 6,148 (as-is) | 1 | 3.6 × 4.18 × 4.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Modern Arm Chair 01/preview.png\|96]] | [Modern Arm Chair 01](https://polyhaven.com/a/modern_arm_chair_01) | 8,916 (as-is) | 2 | 2.93 × 3.65 × 3.52 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Modern Coffee Table 01/preview.png\|96]] | [Modern Coffee Table 01](https://polyhaven.com/a/modern_coffee_table_01) | 4,504 (as-is) | 1 | 4.29 × 1.39 × 2.14 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Modern Coffee Table 02/preview.png\|96]] | [Modern Coffee Table 02](https://polyhaven.com/a/modern_coffee_table_02) | 13,645 (as-is) | 2 | 4.28 × 1.32 × 4.28 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Modern Wooden Cabinet/preview.png\|96]] | [Modern Wooden Cabinet](https://polyhaven.com/a/modern_wooden_cabinet) | 24,976 (as-is) | 2 | 8.71 × 2.43 × 1.86 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Modular Street Seating/preview.png\|96]] | [Modular Street Seating](https://polyhaven.com/a/modular_street_seating) | 25,156 (as-is) | 15 | 15.5 × 3.39 × 2.75 | 13 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Ottoman 01/preview.png\|96]] | [Ottoman 01](https://polyhaven.com/a/Ottoman_01) | 4,240 (as-is) | 1 | 3.16 × 2.23 × 2.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Outdoor Table Chair Set 01/preview.png\|96]] | [Outdoor Table Chair Set 01](https://polyhaven.com/a/outdoor_table_chair_set_01) | 9,828 (as-is) | 2 | 2.65 × 3.07 × 6.13 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Bench/preview.png\|96]] | [Painted Wooden Bench](https://polyhaven.com/a/painted_wooden_bench) | 630 (as-is) | 1 | 4.16 × 3.18 × 1.77 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Cabinet/preview.png\|96]] | [Painted Wooden Cabinet](https://polyhaven.com/a/painted_wooden_cabinet) | 2,227 (as-is) | 1 | 4.27 × 4.22 × 2.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Cabinet 02/preview.png\|96]] | [Painted Wooden Cabinet 02](https://polyhaven.com/a/painted_wooden_cabinet_02) | 966 (as-is) | 1 | 3.56 × 9.17 × 2.58 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Chair 01/preview.png\|96]] | [Painted Wooden Chair 01](https://polyhaven.com/a/painted_wooden_chair_01) | 724 (as-is) | 1 | 1.54 × 3.42 × 1.93 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Chair 02/preview.png\|96]] | [Painted Wooden Chair 02](https://polyhaven.com/a/painted_wooden_chair_02) | 1,246 (as-is) | 1 | 2.28 × 4.51 × 2.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Nightstand/preview.png\|96]] | [Painted Wooden Nightstand](https://polyhaven.com/a/painted_wooden_nightstand) | 470 (as-is) | 1 | 1.8 × 2.2 × 1.82 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Shelves/preview.png\|96]] | [Painted Wooden Shelves](https://polyhaven.com/a/painted_wooden_shelves) | 524 (as-is) | 1 | 1.83 × 4.02 × 1.31 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Sofa/preview.png\|96]] | [Painted Wooden Sofa](https://polyhaven.com/a/painted_wooden_sofa) | 5,826 (as-is) | 1 | 8.76 × 4.58 × 2.81 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Painted Wooden Table/preview.png\|96]] | [Painted Wooden Table](https://polyhaven.com/a/painted_wooden_table) | 600 (as-is) | 1 | 8.59 × 3.42 × 4.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Plastic Monobloc Chair 01/preview.png\|96]] | [Plastic Monobloc Chair 01](https://polyhaven.com/a/plastic_monobloc_chair_01) | 3,356 (as-is) | 1 | 2.29 × 3.14 × 2.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Rockingchair 01/preview.png\|96]] | [Rockingchair 01](https://polyhaven.com/a/Rockingchair_01) | 11,866 (as-is) | 1 | 2.53 × 3.55 × 2.98 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Round Wooden Table 01/preview.png\|96]] | [Round Wooden Table 01](https://polyhaven.com/a/round_wooden_table_01) | 8,640 (as-is) | 1 | 5 × 3.59 × 5 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Round Wooden Table 02/preview.png\|96]] | [Round Wooden Table 02](https://polyhaven.com/a/round_wooden_table_02) | 4,254 (as-is) | 1 | 2.84 × 2.66 × 2.84 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/School Chair 01/preview.png\|96]] | [School Chair 01](https://polyhaven.com/a/SchoolChair_01) | 5,072 (as-is) | 1 | 2.02 × 3.59 × 2.41 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/School Desk 01/preview.png\|96]] | [School Desk 01](https://polyhaven.com/a/SchoolDesk_01) | 4,162 (as-is) | 1 | 2.54 × 3.15 × 1.95 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Shelf 01/preview.png\|96]] | [Shelf 01](https://polyhaven.com/a/Shelf_01) | 182 (as-is) | 1 | 3.58 × 7.43 × 0.92 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Side Table 01/preview.png\|96]] | [Side Table 01](https://polyhaven.com/a/side_table_01) | 2,756 (as-is) | 1 | 1.96 × 1.97 × 1.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Side Table Tall 01/preview.png\|96]] | [Side Table Tall 01](https://polyhaven.com/a/side_table_tall_01) | 6,408 (as-is) | 1 | 1.37 × 2.72 × 1.37 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Small Wooden Table 01/preview.png\|96]] | [Small Wooden Table 01](https://polyhaven.com/a/small_wooden_table_01) | 3,410 (as-is) | 1 | 3.27 × 1.9 × 1.57 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Sofa 01/preview.png\|96]] | [Sofa 01](https://polyhaven.com/a/Sofa_01) | 4,101 (as-is) | 1 | 5.61 × 2.84 × 2.35 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Sofa 02/preview.png\|96]] | [Sofa 02](https://polyhaven.com/a/sofa_02) | 2,728 (as-is) | 1 | 6.45 × 2.53 × 2.92 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Sofa 03/preview.png\|96]] | [Sofa 03](https://polyhaven.com/a/sofa_03) | 8,004 (as-is) | 2 | 9.75 × 3.99 × 3.3 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Steel Frame Shelves 01/preview.png\|96]] | [Steel Frame Shelves 01](https://polyhaven.com/a/steel_frame_shelves_01) | 4,348 (as-is) | 1 | 3.92 × 7.64 × 1.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Steel Frame Shelves 02/preview.png\|96]] | [Steel Frame Shelves 02](https://polyhaven.com/a/steel_frame_shelves_02) | 4,348 (as-is) | 1 | 2.12 × 7.65 × 1.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Vintage Cabinet 01/preview.png\|96]] | [Vintage Cabinet 01](https://polyhaven.com/a/vintage_cabinet_01) | 61,096 (as-is) | 5 | 7.22 × 7.98 × 2.39 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Vintage Day Bed/preview.png\|96]] | [Vintage Day Bed](https://polyhaven.com/a/vintage_day_bed) | 2,715 (as-is) | 1 | 7.04 × 4.03 × 3.05 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Vintage Wooden Drawer 01/preview.png\|96]] | [Vintage Wooden Drawer 01](https://polyhaven.com/a/vintage_wooden_drawer_01) | 5,184 (as-is) | 1 | 6.13 × 3.9 × 3.6 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Bookshelf Worn/preview.png\|96]] | [Wooden Bookshelf Worn](https://polyhaven.com/a/wooden_bookshelf_worn) | 10,106 (as-is) | 1 | 4.91 × 7.37 × 2.08 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Chair 01/preview.png\|96]] | [Wooden Chair 01](https://polyhaven.com/a/WoodenChair_01) | 19,992 (as-is) | 2 | 2.46 × 8.12 × 2.35 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Display Shelves 01/preview.png\|96]] | [Wooden Display Shelves 01](https://polyhaven.com/a/wooden_display_shelves_01) | 3,174 (as-is) | 1 | 3.85 × 5.56 × 1.33 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Picnic Table/preview.png\|96]] | [Wooden Picnic Table](https://polyhaven.com/a/wooden_picnic_table) | 10,210 (as-is) | 2 | 8 × 2.66 × 10.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Table 01/preview.png\|96]] | [Wooden Table 01](https://polyhaven.com/a/WoodenTable_01) | 952 (as-is) | 1 | 6.43 × 1.96 × 2.35 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Table 02/preview.png\|96]] | [Wooden Table 02](https://polyhaven.com/a/WoodenTable_02) | 1,514 (as-is) | 1 | 1.07 × 1.49 × 1.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Table 02 B/preview.png\|96]] | [Wooden Table 02 B](https://polyhaven.com/a/wooden_table_02) | 196 (as-is) | 1 | 4.05 × 2.86 × 2.52 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Wooden Table 03/preview.png\|96]] | [Wooden Table 03](https://polyhaven.com/a/WoodenTable_03) | 2,298 (as-is) | 1 | 4.74 × 2.96 × 2.01 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Furniture/Worn Metal Rack/preview.png\|96]] | [Worn Metal Rack](https://polyhaven.com/a/worn_metal_rack) | 6,372 (as-is) | 1 | 3.27 × 6.79 × 2.14 | 

### Grass
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Grass/Grass Bermuda 01/preview.png\|96]] | [Grass Bermuda 01](https://polyhaven.com/a/grass_bermuda_01) | 941 (as-is) | 17 | 6.02 × 0.57 × 0.51 | 17 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Grass/Grass Medium 01/preview.png\|96]] | [Grass Medium 01](https://polyhaven.com/a/grass_medium_01) | 24,730 (as-is) | 17 | 20.02 × 1.22 × 1.17 | 17 separate pieces, alpha cut-out

### Industrial
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Ammo Box/preview.png\|96]] | [Ammo Box](https://polyhaven.com/a/ammo_box) | 4,382 (as-is) | 1 | 0.31 × 0.63 × 0.92 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Barrel 02/preview.png\|96]] | [Barrel 02](https://polyhaven.com/a/Barrel_02) | 2,688 (as-is) | 1 | 1.74 × 3.14 × 1.73 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Barrel 03/preview.png\|96]] | [Barrel 03](https://polyhaven.com/a/barrel_03) | 1,473 (as-is) | 1 | 2.26 × 3.32 × 2.28 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Barrel Stove/preview.png\|96]] | [Barrel Stove](https://polyhaven.com/a/barrel_stove) | 9,216 (as-is) | 1 | 2.12 × 3.06 × 2.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Barrel_01/preview.png\|96]] | [Barrel_01](https://polyhaven.com/a/Barrel_01) | 2,682 (as-is) | 1 | 2.01 × 3.14 × 2.01 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Cardboard Box 01/preview.png\|96]] | [Cardboard Box 01](https://polyhaven.com/a/cardboard_box_01) | 16,952 (as-is) | 1 | 1.38 × 1.22 × 1.84 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Chemistry Set/preview.png\|96]] | [Chemistry Set](https://polyhaven.com/a/chemistry_set) | 41,958 (as-is) | 38 | 3.85 × 1.53 × 1.26 | 32 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Concrete Road Barrier/preview.png\|96]] | [Concrete Road Barrier](https://polyhaven.com/a/concrete_road_barrier) | 60,928 → 18,430 | 1 | 5.52 × 2.97 × 2.28 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Concrete Road Barrier 02/preview.png\|96]] | [Concrete Road Barrier 02](https://polyhaven.com/a/concrete_road_barrier_02) | 23,822 → 18,430 | 1 | 5.59 × 3.97 × 1.58 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Drain Cleaner/preview.png\|96]] | [Drain Cleaner](https://polyhaven.com/a/drain_cleaner) | 4,338 (as-is) | 1 | 0.59 × 0.64 × 0.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Fire Alarm/preview.png\|96]] | [Fire Alarm](https://polyhaven.com/a/fire_alarm) | 2,705 (as-is) | 1 | 0.36 × 0.51 × 0.09 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Fire Hydrant/preview.png\|96]] | [Fire Hydrant](https://polyhaven.com/a/fire_hydrant) | 86,316 (as-is) | 6 | 3.12 × 2.86 × 1.13 | split, full detail, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Gate Latch 01/preview.png\|96]] | [Gate Latch 01](https://polyhaven.com/a/gate_latch_01) | 5,480 (as-is) | 1 | 0.73 × 0.31 × 0.27 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Hand Truck/preview.png\|96]] | [Hand Truck](https://polyhaven.com/a/hand_truck) | 13,220 (as-is) | 1 | 2.12 × 5.01 × 2.47 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Industrial Microscope/preview.png\|96]] | [Industrial Microscope](https://polyhaven.com/a/industrial_microscope) | 16,598 (as-is) | 1 | 0.77 × 1.65 × 1.78 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Industrial Pipe Lamp/preview.png\|96]] | [Industrial Pipe Lamp](https://polyhaven.com/a/industrial_pipe_lamp) | 8,626 (as-is) | 2 | 0.65 × 1.3 × 0.94 | emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Korean Fire Extinguisher 01/preview.png\|96]] | [Korean Fire Extinguisher 01](https://polyhaven.com/a/korean_fire_extinguisher_01) | 9,913 (as-is) | 3 | 1 × 2.35 × 1.31 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Ladder Sectioned 01/preview.png\|96]] | [Ladder Sectioned 01](https://polyhaven.com/a/ladder_sectioned_01) | 29,140 (as-is) | 2 | 2.36 × 7.62 × 0.63 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Measuring Tape 01/preview.png\|96]] | [Measuring Tape 01](https://polyhaven.com/a/measuring_tape_01) | 2,868 (as-is) | 1 | 0.14 × 0.26 × 0.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Metal Trash Can/preview.png\|96]] | [Metal Trash Can](https://polyhaven.com/a/metal_trash_can) | 13,960 (as-is) | 2 | 6.35 × 3.24 × 1.99 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Airduct Circular 01/preview.png\|96]] | [Modular Airduct Circular 01](https://polyhaven.com/a/modular_airduct_circular_01) | 14,280 (as-is) | 13 | 14.9 × 4.73 × 5.23 | 13 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Airduct Rectangular 01/preview.png\|96]] | [Modular Airduct Rectangular 01](https://polyhaven.com/a/modular_airduct_rectangular_01) | 45,090 (as-is) | 24 | 27.37 × 4.49 × 9.24 | 17 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Electric Cables/preview.png\|96]] | [Modular Electric Cables](https://polyhaven.com/a/modular_electric_cables) | 42,078 (as-is) | 20 | 7.42 × 2.7 × 0.77 | 20 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Electricity Poles/preview.png\|96]] | [Modular Electricity Poles](https://polyhaven.com/a/modular_electricity_poles) | 200,610 (as-is) | 36 | 46.85 × 25 × 6.99 | split, full detail, 30 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Fire Escape/preview.png\|96]] | [Modular Fire Escape](https://polyhaven.com/a/modular_fire_escape) | 11,322 (as-is) | 5 | 23.79 × 34.84 × 5.07 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Industrial Pipes 01/preview.png\|96]] | [Modular Industrial Pipes 01](https://polyhaven.com/a/modular_industrial_pipes_01) | 12,340 (as-is) | 6 | 5.01 × 6.98 × 1.1 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Metal Gutter/preview.png\|96]] | [Modular Metal Gutter](https://polyhaven.com/a/modular_metal_gutter) | 16,490 (as-is) | 12 | 8.1 × 6.58 × 5.41 | 12 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Pipes/preview.png\|96]] | [Modular Pipes](https://polyhaven.com/a/modular_pipes) | 94,856 (as-is) | 62 | 14.96 × 8.7 × 1.63 | 59 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Modular Pipes Plastic 01/preview.png\|96]] | [Modular Pipes Plastic 01](https://polyhaven.com/a/modular_pipes_plastic_01) | 45,868 (as-is) | 15 | 2.9 × 0.27 × 1.29 | 15 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Old Military Compressor/preview.png\|96]] | [Old Military Compressor](https://polyhaven.com/a/old_military_compressor) | 79,042 → 18,685 | 2 | 2.13 × 4.21 × 5.98 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Old Tyre/preview.png\|96]] | [Old Tyre](https://polyhaven.com/a/old_tyre) | 2,880 (as-is) | 1 | 2.14 × 2.14 × 0.59 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Overhead Crane/preview.png\|96]] | [Overhead Crane](https://polyhaven.com/a/overhead_crane) | 89,964 (as-is) | 6 | 44.61 × 18.33 × 14.29 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Pipe Wrench/preview.png\|96]] | [Pipe Wrench](https://polyhaven.com/a/pipe_wrench) | 10,746 (as-is) | 1 | 0.3 × 1.45 × 0.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Portable Generator/preview.png\|96]] | [Portable Generator](https://polyhaven.com/a/portable_generator) | 26,419 (as-is) | 3 | 2.92 × 2.06 × 2.01 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Portable Welding Cart/preview.png\|96]] | [Portable Welding Cart](https://polyhaven.com/a/portable_welding_cart) | 29,418 (as-is) | 3 | 2.99 × 5.58 × 2.34 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Power Box 01/preview.png\|96]] | [Power Box 01](https://polyhaven.com/a/power_box_01) | 21,272 (as-is) | 2 | 1.23 × 1.8 × 0.38 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Propane Torch 02/preview.png\|96]] | [Propane Torch 02](https://polyhaven.com/a/propane_torch_02) | 2,960 (as-is) | 1 | 0.26 × 1.43 × 0.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Rollershutter Window 02/preview.png\|96]] | [Rollershutter Window 02](https://polyhaven.com/a/rollershutter_window_02) | 1,120 (as-is) | 2 | 12.86 × 5.57 × 0.6 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Rollershutter Window 03/preview.png\|96]] | [Rollershutter Window 03](https://polyhaven.com/a/rollershutter_window_03) | 1,120 (as-is) | 2 | 10.63 × 5.52 × 0.55 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Rusted Wheel Rim 01/preview.png\|96]] | [Rusted Wheel Rim 01](https://polyhaven.com/a/rusted_wheel_rim_01) | 16,440 (as-is) | 1 | 1.45 × 1.45 × 0.54 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Rusted Wheel Rim 02/preview.png\|96]] | [Rusted Wheel Rim 02](https://polyhaven.com/a/rusted_wheel_rim_02) | 15,256 (as-is) | 1 | 1.21 × 1.21 × 0.42 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Security Camera 02/preview.png\|96]] | [Security Camera 02](https://polyhaven.com/a/security_camera_02) | 12,477 (as-is) | 2 | 0.5 × 0.74 × 1.41 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Small Oil Can 01/preview.png\|96]] | [Small Oil Can 01](https://polyhaven.com/a/small_oil_can_01) | 16,746 (as-is) | 1 | 0.95 × 0.85 × 0.37 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Spray Paint Bottles 02/preview.png\|96]] | [Spray Paint Bottles 02](https://polyhaven.com/a/spray_paint_bottles_02) | 6,576 (as-is) | 2 | 0.7 × 0.78 × 0.28 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Tool Cart/preview.png\|96]] | [Tool Cart](https://polyhaven.com/a/tool_cart) | 29,394 (as-is) | 2 | 4.55 × 3.45 × 2.69 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Utility Box 01/preview.png\|96]] | [Utility Box 01](https://polyhaven.com/a/utility_box_01) | 4,404 (as-is) | 1 | 1.86 × 4 × 1.54 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Water Manhole Cover/preview.png\|96]] | [Water Manhole Cover](https://polyhaven.com/a/water_manhole_cover) | 6,301 (as-is) | 1 | 2.47 × 0.24 × 2.47 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Industrial/Wooden Hammer 01/preview.png\|96]] | [Wooden Hammer 01](https://polyhaven.com/a/wooden_hammer_01) | 3,617 (as-is) | 1 | 0.4 × 1 × 0.08 | 

### Instrument
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Instrument/Vintage Binoculars/preview.png\|96]] | [Vintage Binoculars](https://polyhaven.com/a/vintage_binocular) | 19,362 (as-is) | 2 | 0.69 × 0.24 × 0.71 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Instrument/Vintage Microscope/preview.png\|96]] | [Vintage Microscope](https://polyhaven.com/a/vintage_microscope) | 20,631 (as-is) | 3 | 0.38 × 1.43 × 0.65 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Instrument/Vintage Spacecraft Instrument/preview.png\|96]] | [Vintage Spacecraft Instrument](https://polyhaven.com/a/vintage_spacecraft_instrument) | 13,279 (as-is) | 2 | 1.47 × 0.96 × 0.73 | alpha cut-out

### Lighting
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Caged Hanging Light/preview.png\|96]] | [Caged Hanging Light](https://polyhaven.com/a/caged_hanging_light) | 22,893 (as-is) | 2 | 4.15 × 2.68 × 1.12 | split, full detail, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Chandelier 01/preview.png\|96]] | [Chandelier 01](https://polyhaven.com/a/Chandelier_01) | 26,860 (as-is) | 3 | 2.67 × 2.85 × 2.91 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Chandelier 02/preview.png\|96]] | [Chandelier 02](https://polyhaven.com/a/Chandelier_02) | 21,514 (as-is) | 3 | 2.42 × 3.03 × 2.21 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Chandelier 03/preview.png\|96]] | [Chandelier 03](https://polyhaven.com/a/Chandelier_03) | 29,301 (as-is) | 3 | 2.79 × 3.72 × 2.81 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Chinese Chandelier/preview.png\|96]] | [Chinese Chandelier](https://polyhaven.com/a/chinese_chandelier) | 7,828 (as-is) | 1 | 3.14 × 2.67 × 3.14 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Desk Lamp Arm 01/preview.png\|96]] | [Desk Lamp Arm 01](https://polyhaven.com/a/desk_lamp_arm_01) | 26,286 (as-is) | 3 | 0.74 × 3.1 × 2.1 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Hanging Industrial Lamp/preview.png\|96]] | [Hanging Industrial Lamp](https://polyhaven.com/a/hanging_industrial_lamp) | 9,530 (as-is) | 2 | 1.96 × 4.84 × 1.96 | emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Industrial Caged Sconce/preview.png\|96]] | [Industrial Caged Sconce](https://polyhaven.com/a/industrial_caged_sconce) | 26,576 (as-is) | 11 | 4.32 × 3.26 × 1.39 | 11 separate pieces, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Industrial Wall Lamp/preview.png\|96]] | [Industrial Wall Lamp](https://polyhaven.com/a/industrial_wall_lamp) | 4,446 (as-is) | 2 | 0.98 × 1.54 × 0.5 | alpha cut-out, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Industrial Wall Sconce/preview.png\|96]] | [Industrial Wall Sconce](https://polyhaven.com/a/industrial_wall_sconce) | 9,826 (as-is) | 2 | 0.54 × 1.22 × 0.9 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Lantern Chandelier 01/preview.png\|96]] | [Lantern Chandelier 01](https://polyhaven.com/a/lantern_chandelier_01) | 5,971 (as-is) | 3 | 2.07 × 3.13 × 2.05 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Lightbulb 01/preview.png\|96]] | [Lightbulb 01](https://polyhaven.com/a/lightbulb_01) | 4,372 (as-is) | 2 | 0.21 × 0.36 × 0.21 | alpha cut-out, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Modern Ceiling Lamp 01/preview.png\|96]] | [Modern Ceiling Lamp 01](https://polyhaven.com/a/modern_ceiling_lamp_01) | 5,602 (as-is) | 3 | 1.54 × 3.4 × 1.54 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Mounted Fluorescent Lights/preview.png\|96]] | [Mounted Fluorescent Lights](https://polyhaven.com/a/mounted_fluorescent_lights) | 17,820 (as-is) | 14 | 3.26 × 0.13 × 2.31 | 7 separate pieces, emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Plastic Torch 6V/preview.png\|96]] | [Plastic Torch 6V](https://polyhaven.com/a/pastic_torch_6v) | 4,352 (as-is) | 2 | 0.49 × 0.51 × 0.8 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Portable Searchlight/preview.png\|96]] | [Portable Searchlight](https://polyhaven.com/a/portable_searchlight) | 18,802 (as-is) | 2 | 0.59 × 0.66 × 0.9 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Pull Chain Light Socket/preview.png\|96]] | [Pull Chain Light Socket](https://polyhaven.com/a/pull_chain_light_socket) | 10,902 (as-is) | 1 | 0.39 × 0.59 × 0.39 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Security Light/preview.png\|96]] | [Security Light](https://polyhaven.com/a/security_light) | 4,668 (as-is) | 3 | 1.15 × 1.9 × 1.49 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Street Lamp 01/preview.png\|96]] | [Street Lamp 01](https://polyhaven.com/a/street_lamp_01) | 30,610 (as-is) | 4 | 2.52 × 13.82 × 1.38 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Street Lamp 02/preview.png\|96]] | [Street Lamp 02](https://polyhaven.com/a/street_lamp_02) | 20,338 (as-is) | 4 | 1.38 × 5.98 × 2.88 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Vintage Flashlight/preview.png\|96]] | [Vintage Flashlight](https://polyhaven.com/a/vintage_flashlight) | 10,562 (as-is) | 2 | 0.34 × 0.52 × 1.09 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Lighting/Vintage Oil Lamp/preview.png\|96]] | [Vintage Oil Lamp](https://polyhaven.com/a/vintage_oil_lamp) | 7,208 (as-is) | 3 | 0.79 × 2.86 × 0.79 | alpha cut-out, emissive

### Nature
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Bark Debris 01/preview.png\|96]] | [Bark Debris 01](https://polyhaven.com/a/bark_debris_01) | 193,406 → 73,720 | 4 | 4.32 × 0.4 × 2.4 | decimated, 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Celandine 01/preview.png\|96]] | [Celandine 01](https://polyhaven.com/a/celandine_01) | 8,966 (as-is) | 5 | 8 × 0.66 × 1.1 | 5 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Cheiridopsis Succulent/preview.png\|96]] | [Cheiridopsis Succulent](https://polyhaven.com/a/cheiridopsis_succulent) | 82,438 (as-is) | 13 | 7.72 × 0.97 × 3.42 | split, full detail, 7 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Land Rocks 02/preview.png\|96]] | [Coast Land Rocks 02](https://polyhaven.com/a/coast_land_rocks_02) | 1,291,146 → 18,429 | 1 | 37.32 × 4.94 × 17.47 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Land Rocks 03/preview.png\|96]] | [Coast Land Rocks 03](https://polyhaven.com/a/coast_land_rocks_03) | 1,096,655 → 18,430 | 1 | 32.07 × 5.49 × 20.11 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Land Rocks 04/preview.png\|96]] | [Coast Land Rocks 04](https://polyhaven.com/a/coast_land_rocks_04) | 1,086,668 → 18,430 | 1 | 35.58 × 3.05 × 41.07 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Line 01/preview.png\|96]] | [Coast Line 01](https://polyhaven.com/a/coast_line_01) | 539,491 → 18,429 | 1 | 195.02 × 9.14 × 153.41 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Line 02/preview.png\|96]] | [Coast Line 02](https://polyhaven.com/a/coast_line_02) | 756,940 → 18,430 | 1 | 162.98 × 7.94 × 83.18 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Rocks 01/preview.png\|96]] | [Coast Rocks 01](https://polyhaven.com/a/coast_rocks_01) | 679,936 → 18,430 | 1 | 212.49 × 11.72 × 151.85 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Rocks 02/preview.png\|96]] | [Coast Rocks 02](https://polyhaven.com/a/coast_rocks_02) | 1,260,423 → 18,429 | 1 | 164.2 × 11.53 × 176.67 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Rocks 03/preview.png\|96]] | [Coast Rocks 03](https://polyhaven.com/a/coast_rocks_03) | 813,464 → 18,430 | 1 | 75.46 × 11.42 × 100.99 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coast Rocks 05/preview.png\|96]] | [Coast Rocks 05](https://polyhaven.com/a/coast_rocks_05) | 771,724 → 18,430 | 1 | 10.84 × 3.56 × 10.06 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coastal Cliff 01/preview.png\|96]] | [Coastal Cliff 01](https://polyhaven.com/a/coastal_cliff_01) | 461,824 → 18,430 | 1 | 328.4 × 36.75 × 39.11 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coastal Cliff 02/preview.png\|96]] | [Coastal Cliff 02](https://polyhaven.com/a/coastal_cliff_02) | 943,284 → 18,430 | 1 | 146.29 × 35.96 × 30.88 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Coastal Cliff 04/preview.png\|96]] | [Coastal Cliff 04](https://polyhaven.com/a/coastal_cliff_04) | 1,537,429 → 18,430 | 1 | 309.93 × 39.28 × 86.53 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Crystalline Iceplant/preview.png\|96]] | [Crystalline Iceplant](https://polyhaven.com/a/crystalline_iceplant) | 13,094 (as-is) | 8 | 6.05 × 0.29 × 2.64 | 8 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dead Quiver Branch 01/preview.png\|96]] | [Dead Quiver Branch 01](https://polyhaven.com/a/dead_quiver_branch_01) | 14,834 (as-is) | 1 | 0.91 × 1.57 × 0.81 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dead Quiver Branch 02/preview.png\|96]] | [Dead Quiver Branch 02](https://polyhaven.com/a/dead_quiver_branch_02) | 14,386 (as-is) | 1 | 1.03 × 1.88 × 0.72 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dead Quiver Trunk/preview.png\|96]] | [Dead Quiver Trunk](https://polyhaven.com/a/dead_quiver_trunk) | 17,978 (as-is) | 1 | 1.09 × 7.12 × 0.96 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dead Tree Trunk/preview.png\|96]] | [Dead Tree Trunk](https://polyhaven.com/a/dead_tree_trunk) | 101,802 → 18,430 | 1 | 10.89 × 1.03 × 0.99 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dead Tree Trunk 02/preview.png\|96]] | [Dead Tree Trunk 02](https://polyhaven.com/a/dead_tree_trunk_02) | 83,128 → 18,430 | 1 | 14.48 × 3.77 × 3.77 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Dry Quiver Leaf/preview.png\|96]] | [Dry Quiver Leaf](https://polyhaven.com/a/dry_quiver_leaf) | 78,720 → 36,860 | 2 | 1.42 × 1.52 × 0.68 | decimated, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Fir Sapling/preview.png\|96]] | [Fir Sapling](https://polyhaven.com/a/fir_sapling) | 433,021 → 56,730 | 6 | 9.8 × 4.65 × 2.95 | decimated, 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Fir Tree 01/preview.png\|96]] | [Fir Tree 01](https://polyhaven.com/a/fir_tree_01) | 6,982,937 → 127,814 | 8 | 67.06 × 67.64 × 23.24 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Flower Empodium/preview.png\|96]] | [Flower Empodium](https://polyhaven.com/a/flower_empodium) | 3,053 (as-is) | 5 | 4.72 × 0.96 × 1.01 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Flower Gazania/preview.png\|96]] | [Flower Gazania](https://polyhaven.com/a/flower_gazania) | 14,340 (as-is) | 8 | 5.29 × 0.59 × 2.51 | 8 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Flower Heliophila/preview.png\|96]] | [Flower Heliophila](https://polyhaven.com/a/flower_heliophila) | 101,621 → 36,009 | 2 | 9.83 × 1.42 × 5.06 | decimated, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Flower Stinkkruid/preview.png\|96]] | [Flower Stinkkruid](https://polyhaven.com/a/flower_stinkkruid) | 80,716 (as-is) | 7 | 6.09 × 0.64 × 1.07 | split, full detail, 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Flower Ursinia/preview.png\|96]] | [Flower Ursinia](https://polyhaven.com/a/flower_ursinia) | 24,933 (as-is) | 5 | 7.83 × 0.61 × 1.23 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Grass Medium 02/preview.png\|96]] | [Grass Medium 02](https://polyhaven.com/a/grass_medium_02) | 7,842 (as-is) | 3 | 4.68 × 1.45 × 1.55 | 3 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Island Tree 01/preview.png\|96]] | [Island Tree 01](https://polyhaven.com/a/island_tree_01) | 1,599,403 → 55,290 | 3 | 16.95 × 17.94 × 17.17 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Island Tree 02/preview.png\|96]] | [Island Tree 02](https://polyhaven.com/a/island_tree_02) | 1,072,213 → 55,290 | 3 | 14.34 × 12.24 × 14.53 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Island Tree 03/preview.png\|96]] | [Island Tree 03](https://polyhaven.com/a/island_tree_03) | 2,085,320 → 55,289 | 3 | 10.61 × 9.34 × 10.42 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Jacaranda Tree/preview.png\|96]] | [Jacaranda Tree](https://polyhaven.com/a/jacaranda_tree) | 3,863,832 → 49,469 | 3 | 86.81 × 69.53 × 68.27 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Moss 01/preview.png\|96]] | [Moss 01](https://polyhaven.com/a/moss_01) | 204 (as-is) | 8 | 0.77 × 0.14 × 0.11 | 8 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Mountainside/preview.png\|96]] | [Mountainside](https://polyhaven.com/a/mountainside) | 153,472 → 18,430 | 1 | 36.48 × 37.57 × 18.77 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulder 02/preview.png\|96]] | [Namaqualand Boulder 02](https://polyhaven.com/a/namaqualand_boulder_02) | 97,964 → 18,429 | 1 | 9.05 × 3.14 × 4.41 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulder 03/preview.png\|96]] | [Namaqualand Boulder 03](https://polyhaven.com/a/namaqualand_boulder_03) | 64,826 → 18,430 | 1 | 8.58 × 5.26 × 10.94 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulder 04/preview.png\|96]] | [Namaqualand Boulder 04](https://polyhaven.com/a/namaqualand_boulder_04) | 59,066 → 18,430 | 1 | 9.01 × 6.79 × 8.92 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulder 05/preview.png\|96]] | [Namaqualand Boulder 05](https://polyhaven.com/a/namaqualand_boulder_05) | 89,618 → 18,430 | 1 | 4.86 × 1.91 × 2.67 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulder 06/preview.png\|96]] | [Namaqualand Boulder 06](https://polyhaven.com/a/namaqualand_boulder_06) | 109,114 → 18,430 | 1 | 2.41 × 2.33 × 4.33 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Boulders 01/preview.png\|96]] | [Namaqualand Boulders 01](https://polyhaven.com/a/namaqualand_boulders_01) | 40,850 → 34,488 | 2 | 3.78 × 0.9 × 2.09 | decimated, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Cliff 01/preview.png\|96]] | [Namaqualand Cliff 01](https://polyhaven.com/a/namaqualand_cliff_01) | 94,369 → 18,429 | 1 | 29.57 × 17.71 × 15.67 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Cliff 02/preview.png\|96]] | [Namaqualand Cliff 02](https://polyhaven.com/a/namaqualand_cliff_02) | 194,080 → 18,429 | 1 | 72.23 × 25.68 × 23.56 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Rocks 01/preview.png\|96]] | [Namaqualand Rocks 01](https://polyhaven.com/a/namaqualand_rocks_01) | 85,716 → 68,872 | 4 | 5.17 × 0.54 × 0.77 | decimated, 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Namaqualand Stones 01/preview.png\|96]] | [Namaqualand Stones 01](https://polyhaven.com/a/namaqualand_stones_01) | 70,124 → 62,970 | 5 | 3.65 × 0.3 × 0.4 | decimated, 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Nettle Plant/preview.png\|96]] | [Nettle Plant](https://polyhaven.com/a/nettle_plant) | 31,304 (as-is) | 6 | 3.87 × 0.78 × 0.34 | 6 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Othonna Cerarioides/preview.png\|96]] | [Othonna Cerarioides](https://polyhaven.com/a/othonna_cerarioides) | 276,063 → 183,937 | 18 | 14.18 × 7.04 × 6.41 | decimated, 7 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Periwinkle Plant/preview.png\|96]] | [Periwinkle Plant](https://polyhaven.com/a/periwinkle_plant) | 34,350 (as-is) | 6 | 4.41 × 1.47 × 1.15 | 6 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Pine Sapling Medium/preview.png\|96]] | [Pine Sapling Medium](https://polyhaven.com/a/pine_sapling_medium) | 6,038,139 → 89,593 | 9 | 55.41 × 41.07 × 19.31 | decimated, 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Pine Sapling Small/preview.png\|96]] | [Pine Sapling Small](https://polyhaven.com/a/pine_sapling_small) | 398,144 → 56,844 | 6 | 9.44 × 4.64 × 2.75 | decimated, 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Pine Tree 01/preview.png\|96]] | [Pine Tree 01](https://polyhaven.com/a/pine_tree_01) | 17,182,252 → 145,893 | 9 | 77.93 × 72.82 × 30.54 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Quiver Tree 01/preview.png\|96]] | [Quiver Tree 01](https://polyhaven.com/a/quiver_tree_01) | 150,124 → 36,859 | 2 | 4.22 × 9.7 × 3.46 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Quiver Tree 02/preview.png\|96]] | [Quiver Tree 02](https://polyhaven.com/a/quiver_tree_02) | 82,074 → 18,429 | 1 | 3.11 × 5.25 × 3.14 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Rock 09/preview.png\|96]] | [Rock 09](https://polyhaven.com/a/rock_09) | 12,416 (as-is) | 1 | 0.26 × 0.12 × 0.52 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Root Cluster 01/preview.png\|96]] | [Root Cluster 01](https://polyhaven.com/a/root_cluster_01) | 225,261 → 18,429 | 1 | 14.72 × 5.39 × 9.59 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Root Cluster 02/preview.png\|96]] | [Root Cluster 02](https://polyhaven.com/a/root_cluster_02) | 339,641 → 24,387 | 2 | 8.51 × 0.71 × 9.66 | decimated, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Sand Rocks Small 01/preview.png\|96]] | [Sand Rocks Small 01](https://polyhaven.com/a/sand_rocks_small_01) | 739,469 → 18,429 | 1 | 16.52 × 1.92 × 13.87 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Searsia Burchellii/preview.png\|96]] | [Searsia Burchellii](https://polyhaven.com/a/searsia_burchellii) | 616,336 → 55,857 | 3 | 29.84 × 11.62 × 17.99 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Searsia Lucida/preview.png\|96]] | [Searsia Lucida](https://polyhaven.com/a/searsia_lucida) | 377,192 → 72,916 | 10 | 17.06 × 8.32 × 10.11 | decimated, 3 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Shrub 01/preview.png\|96]] | [Shrub 01](https://polyhaven.com/a/shrub_01) | 156,012 (as-is) | 14 | 9.24 × 1.41 × 0.78 | split, full detail, 9 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Shrub 02/preview.png\|96]] | [Shrub 02](https://polyhaven.com/a/shrub_02) | 27,254 (as-is) | 4 | 17.57 × 4.94 × 6.63 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Shrub 03/preview.png\|96]] | [Shrub 03](https://polyhaven.com/a/shrub_03) | 8,287 (as-is) | 4 | 4.88 × 1.44 × 0.54 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Shrub 04/preview.png\|96]] | [Shrub 04](https://polyhaven.com/a/shrub_04) | 27,327 (as-is) | 3 | 2.67 × 1 × 0.67 | 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Single Root/preview.png\|96]] | [Single Root](https://polyhaven.com/a/single_root) | 61,027 → 18,429 | 1 | 1.98 × 0.64 × 6.56 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Street Rat/preview.png\|96]] | [Street Rat](https://polyhaven.com/a/street_rat) | 57,216 → 18,430 | 1 | 0.11 × 0.12 × 0.53 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Tree Small 02/preview.png\|96]] | [Tree Small 02](https://polyhaven.com/a/tree_small_02) | 2,062,487 → 55,855 | 3 | 10.5 × 16.37 × 15.37 | decimated, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Tree Stump 01/preview.png\|96]] | [Tree Stump 01](https://polyhaven.com/a/tree_stump_01) | 41,046 → 18,430 | 1 | 5.09 × 2.04 × 5.68 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Tree Stump 02/preview.png\|96]] | [Tree Stump 02](https://polyhaven.com/a/tree_stump_02) | 62,345 → 18,429 | 1 | 5.44 × 1.87 × 4.97 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Weed Plant 02/preview.png\|96]] | [Weed Plant 02](https://polyhaven.com/a/weed_plant_02) | 11,116 (as-is) | 5 | 7.59 × 0.27 × 1.04 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Nature/Wild Rooibos Bush/preview.png\|96]] | [Wild Rooibos Bush](https://polyhaven.com/a/wild_rooibos_bush) | 27,519 (as-is) | 6 | 8.14 × 1.93 × 3.01 | 2 separate pieces, alpha cut-out

### Office
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Office/Classic Laptop/preview.png\|96]] | [Classic Laptop](https://polyhaven.com/a/classic_laptop) | 14,450 (as-is) | 2 | 2.33 × 1.94 × 1.74 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Office/Clipboard/preview.png\|96]] | [Clipboard](https://polyhaven.com/a/clipboard) | 6,176 (as-is) | 1 | 0.82 × 0.15 × 1.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Office/Projector Screen/preview.png\|96]] | [Projector Screen](https://polyhaven.com/a/projector_screen) | 8,727 (as-is) | 2 | 3.91 × 6.43 × 3.27 | 

### Plants
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Anthurium Botany 01/preview.png\|96]] | [Anthurium Botany 01](https://polyhaven.com/a/anthurium_botany_01) | 67,152 (as-is) | 6 | 9.98 × 1.75 × 6.42 | 6 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Calathea Orbifolia 01/preview.png\|96]] | [Calathea Orbifolia 01](https://polyhaven.com/a/calathea_orbifolia_01) | 16,688 (as-is) | 5 | 8.9 × 1.52 × 4.26 | 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Dandelion 01/preview.png\|96]] | [Dandelion 01](https://polyhaven.com/a/dandelion_01) | 54,764 (as-is) | 7 | 15.05 × 0.61 × 0.92 | split, full detail, 5 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Didelta Spinosa/preview.png\|96]] | [Didelta Spinosa](https://polyhaven.com/a/didelta_spinosa) | 417,187 → 18,401 | 1 | 7.62 × 7.38 × 16.28 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Fern 02/preview.png\|96]] | [Fern 02](https://polyhaven.com/a/fern_02) | 6,232 (as-is) | 4 | 7.04 × 1.53 × 6.16 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Fir Sapling Medium/preview.png\|96]] | [Fir Sapling Medium](https://polyhaven.com/a/fir_sapling_medium) | 1,533,513 → 76,700 | 9 | 52.83 × 31.75 × 18.84 | decimated, 3 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Leipoldtia Schultzei/preview.png\|96]] | [Leipoldtia Schultzei](https://polyhaven.com/a/leipoldtia_schultzei) | 385,504 → 91,349 | 5 | 8.25 × 1.13 × 2.89 | decimated, 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Pachira Aquatica 01/preview.png\|96]] | [Pachira Aquatica 01](https://polyhaven.com/a/pachira_aquatica_01) | 76,914 (as-is) | 9 | 24.53 × 6.8 × 3.56 | split, full detail, 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Pine Roots/preview.png\|96]] | [Pine Roots](https://polyhaven.com/a/pine_roots) | 162,693 → 36,859 | 2 | 6.33 × 0.55 × 6.76 | decimated, 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Plants/Shrub Sorrel 01/preview.png\|96]] | [Shrub Sorrel 01](https://polyhaven.com/a/shrub_sorrel_01) | 3,319 (as-is) | 11 | 1.26 × 0.21 × 0.52 | 11 separate pieces

### Props
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Adjustable Wrench/preview.png\|96]] | [Adjustable Wrench](https://polyhaven.com/a/adjustable_wrench) | 5,390 (as-is) | 1 | 0.24 × 0.91 × 0.11 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Alarm Clock 01/preview.png\|96]] | [Alarm Clock 01](https://polyhaven.com/a/alarm_clock_01) | 8,985 (as-is) | 2 | 0.47 × 0.62 × 0.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/All Purpose Cleaner/preview.png\|96]] | [All Purpose Cleaner](https://polyhaven.com/a/all_purpose_cleaner) | 4,624 (as-is) | 1 | 0.56 × 1.14 × 0.42 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/American Football/preview.png\|96]] | [American Football](https://polyhaven.com/a/american_football) | 4,480 (as-is) | 1 | 1.62 × 0.91 × 0.91 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Antique Estoc/preview.png\|96]] | [Antique Estoc](https://polyhaven.com/a/antique_estoc) | 8,246 (as-is) | 1 | 1.33 × 5.33 × 0.53 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Antique Katana 01/preview.png\|96]] | [Antique Katana 01](https://polyhaven.com/a/antique_katana_01) | 6,670 (as-is) | 1 | 0.33 × 3.58 × 0.33 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Baseball 01/preview.png\|96]] | [Baseball 01](https://polyhaven.com/a/baseball_01) | 10,848 (as-is) | 1 | 0.26 × 0.27 × 0.27 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Baseball Bat/preview.png\|96]] | [Baseball Bat](https://polyhaven.com/a/baseball_bat) | 2,672 (as-is) | 1 | 0.23 × 3.26 × 0.23 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Binoculars/preview.png\|96]] | [Binoculars](https://polyhaven.com/a/binoculars) | 19,248 (as-is) | 2 | 0.6 × 0.24 × 1.03 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Bleach Bottle/preview.png\|96]] | [Bleach Bottle](https://polyhaven.com/a/bleach_bottle) | 4,052 (as-is) | 1 | 0.32 × 1.05 × 0.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Book Encyclopedia Set 01/preview.png\|96]] | [Book Encyclopedia Set 01](https://polyhaven.com/a/book_encyclopedia_set_01) | 67,306 (as-is) | 5 | 1.97 × 0.85 × 0.58 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Brass Blowtorch/preview.png\|96]] | [Brass Blowtorch](https://polyhaven.com/a/brass_blowtorch) | 11,750 (as-is) | 1 | 0.46 × 0.75 × 0.93 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Brass Goblets/preview.png\|96]] | [Brass Goblets](https://polyhaven.com/a/brass_goblets) | 9,600 (as-is) | 3 | 1.62 × 0.98 × 1.06 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Brass Pan 01/preview.png\|96]] | [Brass Pan 01](https://polyhaven.com/a/brass_pan_01) | 4,340 (as-is) | 1 | 0.68 × 0.19 × 1.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Brass Pot 01/preview.png\|96]] | [Brass Pot 01](https://polyhaven.com/a/brass_pot_01) | 3,760 (as-is) | 1 | 1.08 × 1.04 × 1.08 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Brass Pot 02/preview.png\|96]] | [Brass Pot 02](https://polyhaven.com/a/brass_pot_02) | 3,344 (as-is) | 1 | 1.31 × 0.39 × 1.08 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Bunsen Burner/preview.png\|96]] | [Bunsen Burner](https://polyhaven.com/a/bunsen_burner) | 8,434 (as-is) | 1 | 0.5 × 0.62 × 0.5 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Camera 01/preview.png\|96]] | [Camera 01](https://polyhaven.com/a/Camera_01) | 26,987 (as-is) | 4 | 0.76 × 0.28 × 0.94 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Cannon 01/preview.png\|96]] | [Cannon 01](https://polyhaven.com/a/cannon_01) | 41,444 (as-is) | 6 | 4.4 × 2.77 × 8.21 | split, full detail, 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Carved Wooden Elephant/preview.png\|96]] | [Carved Wooden Elephant](https://polyhaven.com/a/carved_wooden_elephant) | 2,752 (as-is) | 1 | 0.39 × 0.34 × 0.21 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Carved Wooden Plate/preview.png\|96]] | [Carved Wooden Plate](https://polyhaven.com/a/carved_wooden_plate) | 2,112 (as-is) | 1 | 0.97 × 0.14 × 0.96 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Cassette Player/preview.png\|96]] | [Cassette Player](https://polyhaven.com/a/cassette_player) | 4,830 (as-is) | 3 | 0.46 × 0.85 × 0.17 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Cement Bag/preview.png\|96]] | [Cement Bag](https://polyhaven.com/a/cement_bag) | 844 (as-is) | 1 | 1.65 × 0.64 × 2.5 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/CheeseBox_01/preview.png\|96]] | [CheeseBox_01](https://polyhaven.com/a/CheeseBox_01) | 884 (as-is) | 2 | 0.86 × 0.33 × 0.48 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Cigarette Case/preview.png\|96]] | [Cigarette Case](https://polyhaven.com/a/cigarette_case) | 16,912 (as-is) | 2 | 1.15 × 0.09 × 0.36 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Compost Bags/preview.png\|96]] | [Compost Bags](https://polyhaven.com/a/compost_bags) | 18,708 (as-is) | 1 | 6.53 × 2.53 × 3.31 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Covered Car/preview.png\|96]] | [Covered Car](https://polyhaven.com/a/covered_car) | 12,592 (as-is) | 1 | 6.39 × 5.04 × 15.64 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Croissant/preview.png\|96]] | [Croissant](https://polyhaven.com/a/croissant) | 1,990 (as-is) | 1 | 0.71 × 0.22 × 0.27 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Cross Pein Hammer/preview.png\|96]] | [Cross Pein Hammer](https://polyhaven.com/a/cross_pein_hammer) | 2,124 (as-is) | 1 | 0.35 × 1.07 × 0.09 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Dartboard/preview.png\|96]] | [Dartboard](https://polyhaven.com/a/dartboard) | 6,800 (as-is) | 1 | 1.61 × 1.61 × 0.14 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Decorative Book Set 01/preview.png\|96]] | [Decorative Book Set 01](https://polyhaven.com/a/decorative_book_set_01) | 397,856 (as-is) | 87 | 8.95 × 1.02 × 1.15 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Digital Wrist Watch/preview.png\|96]] | [Digital Wrist Watch](https://polyhaven.com/a/digital_wrist_watch) | 10,390 (as-is) | 2 | 0.13 × 0.03 × 0.78 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Dirty Football/preview.png\|96]] | [Dirty Football](https://polyhaven.com/a/dirty_football) | 19,998 → 18,430 | 1 | 0.79 × 0.79 × 0.79 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Drill 01/preview.png\|96]] | [Drill 01](https://polyhaven.com/a/Drill_01) | 2,926 (as-is) | 1 | 0.65 × 0.66 × 0.19 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Dry Branches Medium 01/preview.png\|96]] | [Dry Branches Medium 01](https://polyhaven.com/a/dry_branches_medium_01) | 16,803 (as-is) | 3 | 3.78 × 1.22 × 4.64 | 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Dustpan/preview.png\|96]] | [Dustpan](https://polyhaven.com/a/dustpan) | 4,332 (as-is) | 1 | 1.19 × 0.36 × 1.31 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Fish Knife/preview.png\|96]] | [Fish Knife](https://polyhaven.com/a/fish_knife) | 2,736 (as-is) | 1 | 0.1 × 0.77 × 0.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Fishermans Hat/preview.png\|96]] | [Fishermans Hat](https://polyhaven.com/a/fishermans_hat) | 10,304 (as-is) | 1 | 1.16 × 0.44 × 1.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Football/preview.png\|96]] | [Football](https://polyhaven.com/a/football) | 4,296 (as-is) | 2 | 1.82 × 0.79 × 0.79 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Gamepad/preview.png\|96]] | [Gamepad](https://polyhaven.com/a/gamepad) | 9,546 (as-is) | 1 | 1.44 × 0.07 × 1.55 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Garden Gloves 01/preview.png\|96]] | [Garden Gloves 01](https://polyhaven.com/a/garden_gloves_01) | 6,822 (as-is) | 1 | 0.81 × 0.27 × 1.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Hamburger Buns/preview.png\|96]] | [Hamburger Buns](https://polyhaven.com/a/hamburger_buns) | 11,588 (as-is) | 3 | 1.42 × 0.23 × 0.41 | 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Handsaw Wood/preview.png\|96]] | [Handsaw Wood](https://polyhaven.com/a/handsaw_wood) | 2,548 (as-is) | 1 | 0.15 × 0.59 × 2.26 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Horse Statue 01/preview.png\|96]] | [Horse Statue 01](https://polyhaven.com/a/horse_statue_01) | 22,388 → 18,910 | 2 | 0.16 × 0.22 × 0.11 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Jug 01/preview.png\|96]] | [Jug 01](https://polyhaven.com/a/jug_01) | 5,770 (as-is) | 1 | 0.98 × 0.75 × 0.6 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Katana Stand 01/preview.png\|96]] | [Katana Stand 01](https://polyhaven.com/a/katana_stand_01) | 3,780 (as-is) | 1 | 1.06 × 0.65 × 0.19 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Kite Shield/preview.png\|96]] | [Kite Shield](https://polyhaven.com/a/kite_shield) | 10,306 (as-is) | 2 | 1.94 × 4.98 × 0.48 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Korean Public Payphone 01/preview.png\|96]] | [Korean Public Payphone 01](https://polyhaven.com/a/korean_public_payphone_01) | 48,132 (as-is) | 3 | 1.43 × 2.64 × 1.08 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Lantern 01/preview.png\|96]] | [Lantern 01](https://polyhaven.com/a/Lantern_01) | 33,902 (as-is) | 3 | 0.44 × 1.05 × 0.35 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Lateral Sea Marker/preview.png\|96]] | [Lateral Sea Marker](https://polyhaven.com/a/lateral_sea_marker) | 13,014 (as-is) | 1 | 10.73 × 24.42 × 10.73 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Leather Cleaner Can/preview.png\|96]] | [Leather Cleaner Can](https://polyhaven.com/a/leather_cleaner_can) | 2,296 (as-is) | 1 | 0.25 × 0.61 × 0.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Lemon/preview.png\|96]] | [Lemon](https://polyhaven.com/a/lemon) | 4,012 (as-is) | 1 | 0.25 × 0.34 × 0.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Life Jacket/preview.png\|96]] | [Life Jacket](https://polyhaven.com/a/life_jacket) | 8,968 (as-is) | 1 | 2.48 × 3.54 × 0.66 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Lubricant Spray/preview.png\|96]] | [Lubricant Spray](https://polyhaven.com/a/lubricant_spray) | 5,476 (as-is) | 1 | 0.24 × 0.59 × 0.23 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Machete/preview.png\|96]] | [Machete](https://polyhaven.com/a/machete) | 3,032 (as-is) | 1 | 0.16 × 2.7 × 0.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Magnifying Glass 01/preview.png\|96]] | [Magnifying Glass 01](https://polyhaven.com/a/magnifying_glass_01) | 7,240 (as-is) | 2 | 0.47 × 0.97 × 0.1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Medical Box/preview.png\|96]] | [Medical Box](https://polyhaven.com/a/medical_box) | 3,718 (as-is) | 1 | 1.88 × 0.35 × 1.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Medical Tape/preview.png\|96]] | [Medical Tape](https://polyhaven.com/a/medical_tape) | 1,408 (as-is) | 1 | 0.16 × 0.09 × 0.16 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Megaphone 01/preview.png\|96]] | [Megaphone 01](https://polyhaven.com/a/Megaphone_01) | 15,814 (as-is) | 1 | 1.32 × 1.07 × 0.82 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Metal Detector/preview.png\|96]] | [Metal Detector](https://polyhaven.com/a/metal_detector) | 15,518 (as-is) | 1 | 0.85 × 3.43 × 3.08 | emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Metal Jerrycan/preview.png\|96]] | [Metal Jerrycan](https://polyhaven.com/a/metal_jerrycan) | 20,022 (as-is) | 2 | 1.25 × 1.63 × 0.61 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Metal Jerrycan Green/preview.png\|96]] | [Metal Jerrycan Green](https://polyhaven.com/a/metal_jerrycan_green) | 9,636 (as-is) | 1 | 1.29 × 1.79 × 0.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Metal Tool Chest/preview.png\|96]] | [Metal Tool Chest](https://polyhaven.com/a/metal_tool_chest) | 13,360 (as-is) | 1 | 2.45 × 2.33 × 1.45 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Modified Thermos/preview.png\|96]] | [Modified Thermos](https://polyhaven.com/a/modified_thermos) | 11,576 (as-is) | 1 | 0.51 × 1.09 × 0.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Mousetrap/preview.png\|96]] | [Mousetrap](https://polyhaven.com/a/mousetrap) | 5,136 (as-is) | 1 | 0.2 × 0.06 × 0.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Multi Cleaner 5 Litre/preview.png\|96]] | [Multi Cleaner 5 Litre](https://polyhaven.com/a/multi_cleaner_5_litre) | 4,332 (as-is) | 1 | 0.78 × 1.07 × 0.38 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ocean Buoy/preview.png\|96]] | [Ocean Buoy](https://polyhaven.com/a/ocean_buoy) | 12,240 (as-is) | 1 | 3.81 × 9.49 × 3.4 | emissive
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Office Notepads/preview.png\|96]] | [Office Notepads](https://polyhaven.com/a/office_notepads) | 666 (as-is) | 10 | 3.94 × 0.08 × 2.36 | 10 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Old Gas Mask/preview.png\|96]] | [Old Gas Mask](https://polyhaven.com/a/old_gas_mask) | 18,900 (as-is) | 1 | 0.75 × 4.02 × 1.1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ornate Medieval Dagger/preview.png\|96]] | [Ornate Medieval Dagger](https://polyhaven.com/a/ornate_medieval_dagger) | 6,290 (as-is) | 1 | 0.43 × 1.25 × 0.09 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ornate Medieval Mace/preview.png\|96]] | [Ornate Medieval Mace](https://polyhaven.com/a/ornate_medieval_mace) | 14,762 (as-is) | 1 | 0.34 × 2.25 × 0.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ornate War Hammer/preview.png\|96]] | [Ornate War Hammer](https://polyhaven.com/a/ornate_war_hammer) | 5,192 (as-is) | 1 | 0.51 × 2.54 × 0.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Picke Dirty 01/preview.png\|96]] | [Picke Dirty 01](https://polyhaven.com/a/picke_dirty_01) | 6,196 (as-is) | 1 | 1.96 × 3.98 × 0.25 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Broom/preview.png\|96]] | [Plastic Broom](https://polyhaven.com/a/plastic_broom) | 18,736 (as-is) | 2 | 1.49 × 4.28 × 2.02 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Container/preview.png\|96]] | [Plastic Container](https://polyhaven.com/a/plastic_container) | 4,070 (as-is) | 1 | 3.2 × 1.53 × 2.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Crate 01/preview.png\|96]] | [Plastic Crate 01](https://polyhaven.com/a/plastic_crate_01) | 18,320 (as-is) | 1 | 1.06 × 0.94 × 1.46 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Crate 02/preview.png\|96]] | [Plastic Crate 02](https://polyhaven.com/a/plastic_crate_02) | 5,840 (as-is) | 1 | 1.81 × 0.91 × 1.45 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Jerrycan/preview.png\|96]] | [Plastic Jerrycan](https://polyhaven.com/a/plastic_jerrycan) | 7,348 (as-is) | 1 | 0.96 × 1.14 × 1.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Plastic Thermos/preview.png\|96]] | [Plastic Thermos](https://polyhaven.com/a/plastic_thermos) | 5,514 (as-is) | 1 | 0.5 × 1.14 × 0.39 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Pocket Watch/preview.png\|96]] | [Pocket Watch](https://polyhaven.com/a/pocket_watch) | 15,615 (as-is) | 2 | 0.21 × 0.27 × 0.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Portable Cassette Player/preview.png\|96]] | [Portable Cassette Player](https://polyhaven.com/a/portable_cassette_player) | 13,307 (as-is) | 3 | 0.62 × 0.47 × 0.14 | 2 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Postcard Set 01/preview.png\|96]] | [Postcard Set 01](https://polyhaven.com/a/postcard_set_01) | 2,720 (as-is) | 1 | 2.42 × 1.95 × 0 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Pot Enamel 01/preview.png\|96]] | [Pot Enamel 01](https://polyhaven.com/a/pot_enamel_01) | 11,416 (as-is) | 1 | 0.94 × 0.64 × 0.64 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Propane Tank/preview.png\|96]] | [Propane Tank](https://polyhaven.com/a/propane_tank) | 5,238 (as-is) | 1 | 1.2 × 1.98 × 1.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Propane Torch/preview.png\|96]] | [Propane Torch](https://polyhaven.com/a/propane_torch) | 4,848 (as-is) | 1 | 0.24 × 1.17 × 0.21 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ratchet Wrench/preview.png\|96]] | [Ratchet Wrench](https://polyhaven.com/a/ratchet_wrench) | 8,796 (as-is) | 1 | 0.16 × 0.88 × 0.15 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Round Spectacles/preview.png\|96]] | [Round Spectacles](https://polyhaven.com/a/round_spectacles) | 11,810 (as-is) | 2 | 0.56 × 0.17 × 0.53 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Rubber Boots/preview.png\|96]] | [Rubber Boots](https://polyhaven.com/a/rubber_boots) | 56,128 (as-is) | 4 | 3.18 × 1.33 × 0.95 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Rubber Duck Toy/preview.png\|96]] | [Rubber Duck Toy](https://polyhaven.com/a/rubber_duck_toy) | 4,288 (as-is) | 1 | 0.76 × 1.02 × 1.07 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Seadogs Compass/preview.png\|96]] | [Seadogs Compass](https://polyhaven.com/a/seadogs_compass) | 11,645 (as-is) | 1 | 0.29 × 0.31 × 0.51 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Service Pistol/preview.png\|96]] | [Service Pistol](https://polyhaven.com/a/service_pistol) | 27,548 (as-is) | 4 | 1.08 × 1 × 0.11 | 4 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Signal Flashlight/preview.png\|96]] | [Signal Flashlight](https://polyhaven.com/a/signal_flashlight) | 9,730 (as-is) | 3 | 0.25 × 0.54 × 0.16 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Sledgehammer 01/preview.png\|96]] | [Sledgehammer 01](https://polyhaven.com/a/sledgehammer_01) | 2,596 (as-is) | 1 | 0.74 × 3.59 × 0.32 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Small Lpg Tank/preview.png\|96]] | [Small Lpg Tank](https://polyhaven.com/a/small_lpg_tank) | 15,042 (as-is) | 1 | 1.46 × 2.29 × 1.46 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Spinning Wheel 01/preview.png\|96]] | [Spinning Wheel 01](https://polyhaven.com/a/spinning_wheel_01) | 52,023 (as-is) | 3 | 1.75 × 3.45 × 3.66 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Spray Paint Bottles/preview.png\|96]] | [Spray Paint Bottles](https://polyhaven.com/a/spray_paint_bottles) | 5,040 (as-is) | 2 | 0.56 × 0.82 × 0.23 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Stationery Supplies/preview.png\|96]] | [Stationery Supplies](https://polyhaven.com/a/stationery_supplies) | 4,412 (as-is) | 9 | 1.08 × 0.59 × 0.3 | 9 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Strawberry Chocolate Cake/preview.png\|96]] | [Strawberry Chocolate Cake](https://polyhaven.com/a/strawberry_chocolate_cake) | 27,054 → 18,430 | 1 | 0.87 × 0.28 × 0.86 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Tea Set 01/preview.png\|96]] | [Tea Set 01](https://polyhaven.com/a/tea_set_01) | 40,296 (as-is) | 8 | 3.28 × 0.59 × 1.73 | 8 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Television 01/preview.png\|96]] | [Television 01](https://polyhaven.com/a/Television_01) | 1,918 (as-is) | 1 | 2.14 × 1.63 × 1.68 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Trashbag/preview.png\|96]] | [Trashbag](https://polyhaven.com/a/trashbag) | 4,482 (as-is) | 1 | 1.89 × 2.05 × 1.65 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Treasure Chest/preview.png\|96]] | [Treasure Chest](https://polyhaven.com/a/treasure_chest) | 103,330 → 18,429 | 1 | 3.43 × 2.21 × 1.87 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Trowel 01/preview.png\|96]] | [Trowel 01](https://polyhaven.com/a/trowel_01) | 5,242 (as-is) | 1 | 0.35 × 0.37 × 1.24 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Ukulele 01/preview.png\|96]] | [Ukulele 01](https://polyhaven.com/a/Ukulele_01) | 8,912 (as-is) | 1 | 0.64 × 1.88 × 0.18 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Vintage Crutches 01/preview.png\|96]] | [Vintage Crutches 01](https://polyhaven.com/a/vintage_crutches_01) | 10,628 (as-is) | 1 | 1.37 × 5.73 × 0.73 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Vintage Lighter/preview.png\|96]] | [Vintage Lighter](https://polyhaven.com/a/vintage_lighter) | 3,366 (as-is) | 2 | 0.28 × 0.23 × 0.05 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Vintage Pocket Watch/preview.png\|96]] | [Vintage Pocket Watch](https://polyhaven.com/a/vintage_pocket_watch) | 16,098 (as-is) | 3 | 0.22 × 0.29 × 0.05 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Vintage Stapler/preview.png\|96]] | [Vintage Stapler](https://polyhaven.com/a/vintage_stapler) | 4,370 (as-is) | 3 | 0.74 × 0.34 × 0.17 | 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Vintage Telephone Wall Clock/preview.png\|96]] | [Vintage Telephone Wall Clock](https://polyhaven.com/a/vintage_telephone_wall_clock) | 15,864 (as-is) | 2 | 1.22 × 1.79 × 0.69 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wet Floor Sign 01/preview.png\|96]] | [Wet Floor Sign 01](https://polyhaven.com/a/WetFloorSign_01) | 228 (as-is) | 1 | 1.07 × 2.25 × 1.28 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wheelchair 01/preview.png\|96]] | [Wheelchair 01](https://polyhaven.com/a/wheelchair_01) | 40,252 (as-is) | 3 | 2.94 × 3.94 × 3.9 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wine Bottles 01/preview.png\|96]] | [Wine Bottles 01](https://polyhaven.com/a/wine_bottles_01) | 28,848 (as-is) | 16 | 2.42 × 1.18 × 0.29 | 4 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Axe/preview.png\|96]] | [Wooden Axe](https://polyhaven.com/a/wooden_axe) | 3,348 (as-is) | 1 | 0.17 × 2.25 × 0.77 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Axe 02/preview.png\|96]] | [Wooden Axe 02](https://polyhaven.com/a/wooden_axe_02) | 2,218 (as-is) | 1 | 0.18 × 2.52 × 0.81 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Axe 03/preview.png\|96]] | [Wooden Axe 03](https://polyhaven.com/a/wooden_axe_03) | 3,886 (as-is) | 1 | 0.18 × 2.26 × 0.57 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Bowl 01/preview.png\|96]] | [Wooden Bowl 01](https://polyhaven.com/a/wooden_bowl_01) | 14,122 (as-is) | 1 | 1.12 × 0.33 × 1.1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Bowl 02/preview.png\|96]] | [Wooden Bowl 02](https://polyhaven.com/a/wooden_bowl_02) | 4,666 (as-is) | 1 | 0.47 × 0.26 × 0.44 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Broom/preview.png\|96]] | [Wooden Broom](https://polyhaven.com/a/wooden_broom) | 14,258 (as-is) | 2 | 1.75 × 5.19 × 0.4 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Bucket 01/preview.png\|96]] | [Wooden Bucket 01](https://polyhaven.com/a/wooden_bucket_01) | 5,116 (as-is) | 1 | 1.31 × 1.96 × 1.22 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Bucket 02/preview.png\|96]] | [Wooden Bucket 02](https://polyhaven.com/a/wooden_bucket_02) | 7,252 (as-is) | 1 | 2.2 × 1.25 × 2.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Cutting Board/preview.png\|96]] | [Wooden Cutting Board](https://polyhaven.com/a/wooden_cutting_board) | 3,520 (as-is) | 1 | 1.61 × 0.15 × 0.88 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Handle Saber/preview.png\|96]] | [Wooden Handle Saber](https://polyhaven.com/a/wooden_handle_saber) | 4,031 (as-is) | 1 | 0.09 × 3.34 × 0.44 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Lantern 01/preview.png\|96]] | [Wooden Lantern 01](https://polyhaven.com/a/wooden_lantern_01) | 8,321 (as-is) | 2 | 0.79 × 1.89 × 0.84 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Wooden Spoon/preview.png\|96]] | [Wooden Spoon](https://polyhaven.com/a/wooden_spoon) | 6,576 (as-is) | 1 | 0.31 × 0.09 × 0.99 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Props/Yellow Onion/preview.png\|96]] | [Yellow Onion](https://polyhaven.com/a/yellow_onion) | 5,444 (as-is) | 1 | 0.26 × 0.31 × 0.25 | 

### Rocks
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Boulder 01/preview.png\|96]] | [Boulder 01](https://polyhaven.com/a/boulder_01) | 66,122 → 18,430 | 1 | 4.54 × 3.59 × 6.54 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 01/preview.png\|96]] | [Moon Rock 01](https://polyhaven.com/a/moon_rock_01) | 9,958 (as-is) | 1 | 0.76 × 0.27 × 0.4 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 02/preview.png\|96]] | [Moon Rock 02](https://polyhaven.com/a/moon_rock_02) | 3,304 (as-is) | 1 | 0.88 × 0.72 × 0.9 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 03/preview.png\|96]] | [Moon Rock 03](https://polyhaven.com/a/moon_rock_03) | 5,598 (as-is) | 1 | 0.4 × 0.21 × 0.31 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 04/preview.png\|96]] | [Moon Rock 04](https://polyhaven.com/a/moon_rock_04) | 7,636 (as-is) | 1 | 0.43 × 0.19 × 0.62 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 05/preview.png\|96]] | [Moon Rock 05](https://polyhaven.com/a/moon_rock_05) | 9,850 (as-is) | 1 | 0.26 × 0.26 × 0.29 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 06/preview.png\|96]] | [Moon Rock 06](https://polyhaven.com/a/moon_rock_06) | 6,920 (as-is) | 1 | 0.31 × 0.2 × 0.33 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Moon Rock 07/preview.png\|96]] | [Moon Rock 07](https://polyhaven.com/a/moon_rock_07) | 6,820 (as-is) | 1 | 0.35 × 0.22 × 0.26 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Rock 07/preview.png\|96]] | [Rock 07](https://polyhaven.com/a/rock_07) | 14,844 (as-is) | 1 | 0.6 × 0.51 × 1.14 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Rock Face 01/preview.png\|96]] | [Rock Face 01](https://polyhaven.com/a/rock_face_01) | 20,174 → 18,429 | 1 | 25.39 × 17.79 × 20.09 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Rock Face 02/preview.png\|96]] | [Rock Face 02](https://polyhaven.com/a/rock_face_02) | 29,566 → 18,430 | 1 | 17.39 × 16.91 × 12.4 | decimated
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Rock Moss Set 01/preview.png\|96]] | [Rock Moss Set 01](https://polyhaven.com/a/rock_moss_set_01) | 63,127 (as-is) | 6 | 28.59 × 6.32 × 24.82 | 6 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Rock Moss Set 02/preview.png\|96]] | [Rock Moss Set 02](https://polyhaven.com/a/rock_moss_set_02) | 57,647 (as-is) | 7 | 29.56 × 4.89 × 12.18 | 7 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Rocks/Stone 01/preview.png\|96]] | [Stone 01](https://polyhaven.com/a/stone_01) | 53,520 → 18,430 | 1 | 0.52 × 0.26 × 0.32 | decimated

### Seating
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Bar Chair Round 01/preview.png\|96]] | [Bar Chair Round 01](https://polyhaven.com/a/bar_chair_round_01) | 14,373 (as-is) | 1 | 1.73 × 2.68 × 1.74 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Chinese Stool/preview.png\|96]] | [Chinese Stool](https://polyhaven.com/a/chinese_stool) | 1,090 (as-is) | 1 | 2.14 × 2.25 × 1.81 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Folding Wooden Stool/preview.png\|96]] | [Folding Wooden Stool](https://polyhaven.com/a/folding_wooden_stool) | 6,324 (as-is) | 1 | 1.89 × 1.58 × 1.95 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Painted Wooden Stool/preview.png\|96]] | [Painted Wooden Stool](https://polyhaven.com/a/painted_wooden_stool) | 676 (as-is) | 1 | 1.37 × 2.07 × 1.45 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Wooden Stool 01/preview.png\|96]] | [Wooden Stool 01](https://polyhaven.com/a/wooden_stool_01) | 10,946 (as-is) | 1 | 1.52 × 1.56 × 1.58 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Seating/Wooden Stool 02/preview.png\|96]] | [Wooden Stool 02](https://polyhaven.com/a/wooden_stool_02) | 11,146 (as-is) | 1 | 0.95 × 0.65 × 0.65 | 

### Shelves
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Shelves/Chinese Cabinet/preview.png\|96]] | [Chinese Cabinet](https://polyhaven.com/a/chinese_cabinet) | 15,668 (as-is) | 1 | 4.51 × 10.26 × 1.95 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Shelves/Steel Frame Shelves 03/preview.png\|96]] | [Steel Frame Shelves 03](https://polyhaven.com/a/steel_frame_shelves_03) | 8,396 (as-is) | 2 | 8.4 × 8.26 × 2.58 | 

### Ships
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Ships/Dutch Ship Large 01/preview.png\|96]] | [Dutch Ship Large 01](https://polyhaven.com/a/dutch_ship_large_01) | 110,616 (as-is) | 7 | 29.96 × 114.57 × 122.33 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Ships/Dutch Ship Large 02/preview.png\|96]] | [Dutch Ship Large 02](https://polyhaven.com/a/dutch_ship_large_02) | 96,506 (as-is) | 6 | 30.49 × 114.57 × 122.33 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Ships/Dutch Ship Medium/preview.png\|96]] | [Dutch Ship Medium](https://polyhaven.com/a/dutch_ship_medium) | 69,162 (as-is) | 5 | 24.32 × 88.06 × 85.97 | split, full detail, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Ships/Ship Pinnace/preview.png\|96]] | [Ship Pinnace](https://polyhaven.com/a/ship_pinnace) | 196,169 → 178,469 | 13 | 34.02 × 116.34 × 142.1 | split, full detail, alpha cut-out

### Structures
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Large Castle Door/preview.png\|96]] | [Large Castle Door](https://polyhaven.com/a/large_castle_door) | 12,640 (as-is) | 1 | 7.19 × 10.59 × 1.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Large Iron Gate/preview.png\|96]] | [Large Iron Gate](https://polyhaven.com/a/large_iron_gate) | 38,140 (as-is) | 3 | 10.54 × 10.46 × 0.35 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Modular Chainlink Fence/preview.png\|96]] | [Modular Chainlink Fence](https://polyhaven.com/a/modular_chainlink_fence) | 89,232 (as-is) | 16 | 28.98 × 9.01 × 7.68 | split, full detail, 12 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Modular Factory Facade/preview.png\|96]] | [Modular Factory Facade](https://polyhaven.com/a/modular_factory_facade) | 175,014 (as-is) | 185 | 190.46 × 103.57 × 19.13 | 76 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Modular Fort 01/preview.png\|96]] | [Modular Fort 01](https://polyhaven.com/a/modular_fort_01) | 28,218 (as-is) | 41 | 254.91 × 48.83 × 152.39 | 20 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Modular Urban Apartments Facade/preview.png\|96]] | [Modular Urban Apartments Facade](https://polyhaven.com/a/modular_urban_apartments_facade) | 270,045 (as-is) | 161 | 184.04 × 60.71 × 23.8 | 51 separate pieces, alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Modular Wooden Pier/preview.png\|96]] | [Modular Wooden Pier](https://polyhaven.com/a/modular_wooden_pier) | 84,780 (as-is) | 7 | 11.08 × 26.84 × 67.95 | split, full detail, 3 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Rollershutter Door/preview.png\|96]] | [Rollershutter Door](https://polyhaven.com/a/rollershutter_door) | 1,104 (as-is) | 2 | 11 × 8.57 × 1.07 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Rollershutter Window 01/preview.png\|96]] | [Rollershutter Window 01](https://polyhaven.com/a/rollershutter_window_01) | 1,104 (as-is) | 2 | 18.21 × 6.61 × 1.07 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Stone Fire Pit/preview.png\|96]] | [Stone Fire Pit](https://polyhaven.com/a/stone_fire_pit) | 3,887 (as-is) | 1 | 5.17 × 1.39 × 5.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Structures/Utility Box 02/preview.png\|96]] | [Utility Box 02](https://polyhaven.com/a/utility_box_02) | 6,268 (as-is) | 1 | 3.29 × 4 × 1.54 | 

### Table
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Table/Chinese Console Table/preview.png\|96]] | [Chinese Console Table](https://polyhaven.com/a/chinese_console_table) | 13,648 (as-is) | 1 | 6.14 × 2.36 × 1.21 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Table/Chinese Tea Table/preview.png\|96]] | [Chinese Tea Table](https://polyhaven.com/a/chinese_tea_table) | 2,508 (as-is) | 1 | 3 × 1.78 × 2.98 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Table/Industrial Storage Cart/preview.png\|96]] | [Industrial Storage Cart](https://polyhaven.com/a/industrial_storage_cart) | 18,902 (as-is) | 1 | 5.73 × 4.92 × 3.94 | 

### Tools
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Bench Vice 01/preview.png\|96]] | [Bench Vice 01](https://polyhaven.com/a/bench_vice_01) | 2,864 (as-is) | 1 | 0.72 × 1.02 × 1.41 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Bolt Cutters 01/preview.png\|96]] | [Bolt Cutters 01](https://polyhaven.com/a/bolt_cutters_01) | 3,410 (as-is) | 1 | 0.54 × 2.87 × 0.13 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Combination Wrench/preview.png\|96]] | [Combination Wrench](https://polyhaven.com/a/combination_wrench) | 1,986 (as-is) | 1 | 0.2 × 0.08 × 1.2 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Crowbar 01/preview.png\|96]] | [Crowbar 01](https://polyhaven.com/a/crowbar_01) | 2,300 (as-is) | 1 | 0.14 × 1.98 × 0.46 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Flathead Screwdriver/preview.png\|96]] | [Flathead Screwdriver](https://polyhaven.com/a/flathead_screwdriver) | 2,300 (as-is) | 1 | 0.11 × 0.93 × 0.11 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Garden Sprinkler 01/preview.png\|96]] | [Garden Sprinkler 01](https://polyhaven.com/a/garden_sprinkler_01) | 8,192 (as-is) | 1 | 1.25 × 0.72 × 0.89 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Hand Plane No4/preview.png\|96]] | [Hand Plane No4](https://polyhaven.com/a/hand_plane_no4) | 8,220 (as-is) | 1 | 1.18 × 0.71 × 0.3 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Hatchet/preview.png\|96]] | [Hatchet](https://polyhaven.com/a/hatchet) | 5,250 (as-is) | 1 | 0.09 × 1.03 × 0.37 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Old Drill Press/preview.png\|96]] | [Old Drill Press](https://polyhaven.com/a/old_drill_press) | 21,842 (as-is) | 2 | 1.88 × 3.75 × 2.18 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Pliers/preview.png\|96]] | [Pliers](https://polyhaven.com/a/pliers) | 4,540 (as-is) | 1 | 0.2 × 0.64 × 0.06 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Plunger/preview.png\|96]] | [Plunger](https://polyhaven.com/a/plunger) | 3,278 (as-is) | 1 | 0.61 × 1.5 × 0.61 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Rusted Hacksaw/preview.png\|96]] | [Rusted Hacksaw](https://polyhaven.com/a/rusted_hacksaw) | 6,546 (as-is) | 1 | 1.77 × 0.39 × 0.12 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Rusted Spade 01/preview.png\|96]] | [Rusted Spade 01](https://polyhaven.com/a/rusted_spade_01) | 11,436 (as-is) | 1 | 0.6 × 3.93 × 0.16 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Screwdriver/preview.png\|96]] | [Screwdriver](https://polyhaven.com/a/screwdriver) | 3,412 (as-is) | 1 | 0.1 × 0.75 × 0.1 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Screwdrivers 02/preview.png\|96]] | [Screwdrivers 02](https://polyhaven.com/a/screwdrivers_02) | 3,548 (as-is) | 2 | 0.36 × 0.1 × 0.96 | 2 separate pieces
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Small Plastic Torch/preview.png\|96]] | [Small Plastic Torch](https://polyhaven.com/a/small_plastic_torch) | 13,252 (as-is) | 2 | 0.36 × 0.2 × 0.81 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Tire Pump/preview.png\|96]] | [Tire Pump](https://polyhaven.com/a/tire_pump) | 6,572 (as-is) | 1 | 0.91 × 2.07 × 0.36 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Tongue & Groove Pliers/preview.png\|96]] | [Tongue & Groove Pliers](https://polyhaven.com/a/tongue_groove_pliers) | 2,694 (as-is) | 1 | 0.22 × 0.05 × 0.87 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Vintage Hand Drill/preview.png\|96]] | [Vintage Hand Drill](https://polyhaven.com/a/vintage_hand_drill) | 8,338 (as-is) | 1 | 0.44 × 1.73 × 0.45 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Wooden Ladder/preview.png\|96]] | [Wooden Ladder](https://polyhaven.com/a/wooden_ladder) | 8,492 (as-is) | 1 | 3.43 × 4.77 × 1.79 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Tools/Wooden Ladder 02/preview.png\|96]] | [Wooden Ladder 02](https://polyhaven.com/a/wooden_ladder_02) | 6,126 (as-is) | 1 | 3.53 × 6.15 × 2.21 | 

### Vases
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Vases/Ceramic Vase 01/preview.png\|96]] | [Ceramic Vase 01](https://polyhaven.com/a/ceramic_vase_01) | 10,296 (as-is) | 1 | 0.73 × 1.43 × 0.73 | 

### Wall Decoration
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Wall Decoration/Garden Hose Wall Mounted 01/preview.png\|96]] | [Garden Hose Wall Mounted 01](https://polyhaven.com/a/garden_hose_wall_mounted_01) | 11,684 (as-is) | 1 | 1.67 × 1.99 × 0.89 | 
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Wall Decoration/Hanging Picture Frame 03/preview.png\|96]] | [Hanging Picture Frame 03](https://polyhaven.com/a/hanging_picture_frame_03) | 24,348 (as-is) | 4 | 1.38 × 1.79 × 0.11 | split, full detail
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Wall Decoration/Lifebuoy/preview.png\|96]] | [Lifebuoy](https://polyhaven.com/a/lifebuoy) | 10,728 (as-is) | 1 | 2.8 × 3 × 0.55 | 

### Weapons
Preview | Model | Triangles | Parts | Size (studs) | Notes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Weapons/Bolt Action Rifle 7.62/preview.png\|96]] | [Bolt Action Rifle 7.62](https://polyhaven.com/a/bolt_action_rifle_7_62) | 19,985 (as-is) | 3 | 4.4 × 0.73 × 0.24 | alpha cut-out
![[20 FBX Asset Library/Poly Haven Roblox-Ready/Weapons/Stick Grenade/preview.png\|96]] | [Stick Grenade](https://polyhaven.com/a/stick_grenade) | 4,612 (as-is) | 1 | 0.29 × 1.36 × 0.29 | 

## Verification
Every output was imported again in Blender and checked automatically: **521 of 521 pass**. Every MeshPart is at or under 19,000 triangles (the Roblox limit is 20,000). All embedded textures load and are 1024 px or smaller. The size in studs matches the converted geometry, and the bottom of every model sits at height 0. Spot checks against Poly Haven's real-world sizes also match (for example Chess Set: 553 mm → 1.98 studs; Oil Tin: 205 mm → 0.73 studs). Cannon 01's texture maps were assigned by file name, because its FBX has no texture links.

## License
All models and textures are by Poly Haven and released as **CC0 1.0** (public domain). You may use them commercially, change them and include them in paid products, and no credit is required. The conversion work in this folder is part of the Top G Vault.

Links: [[FBX Asset Library - Hub]] · [[Materials Textures - Hub]]
