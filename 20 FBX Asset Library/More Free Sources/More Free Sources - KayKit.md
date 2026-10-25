---
area: "20 FBX Asset Library"
cluster: "KayKit"
license: "CC0 1.0"
fbx_count: 903
tags: [asset, fbx, cc0, kaykit, stylized]
cssclasses: [tg-a20]
---
# More Free Sources - KayKit
> [!topg] 10 packs · 903 FBX files · 0.22 GB · CC0 1.0

Stylised low-poly kits by **Kay Lousberg (KayKit)** from the official KayKit-Game-Assets GitHub repos: city builder, dungeon (remastered), furniture, halloween, medieval hexagon world, prototype blocks, restaurant, space base — plus **rigged, animated characters** (5 adventurer variants, 4 skeletons). The Roblox-style look makes these some of the most directly usable assets in the library. (The older KayKit packs from OpenGameArt are in [[More Free Sources - OpenGameArt CC0]].)

## License
- Each repo ships Kay's own `LICENSE.txt`: "License: (Creative Commons Zero, CC0) ... free to use in personal, educational and commercial projects" (checked 2026-10-25).
- Credit optional: "Kay Lousberg, www.kaylousberg.com". KayKit logo/brand images were **not** copied.

## Packs
Preview | Pack | Category | FBX | Triangles (min–max) | Roblox ≤20k | Made by | License
:-:|---|---|--:|--:|:-:|---|---
![[20 FBX Asset Library/More Free Sources/KayKit/Characters (Rigged)/KayKit Adventurers/preview.png|96]] | [KayKit Adventurers (5 rigged)](https://github.com/KayKit-Game-Assets/KayKit-Character-Pack-Adventures-1.0) | Characters (Rigged) | 32 | 52–7,032 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Characters (Rigged)/KayKit Skeletons/preview.png|96]] | [KayKit Skeletons (4 rigged)](https://github.com/KayKit-Game-Assets/KayKit-Character-Pack-Skeletons-1.0) | Characters (Rigged) | 17 | 40–6,014 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit City Builder Bits/preview.png|96]] | [KayKit City Builder Bits](https://github.com/KayKit-Game-Assets/KayKit-City-Builder-Bits-1.0) | Kits | 41 | 18–1,885 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Dungeon Remastered/preview.png|96]] | [KayKit Dungeon Remastered](https://github.com/KayKit-Game-Assets/KayKit-Dungeon-Remastered-1.0) | Kits | 203 | 20–3,499 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Furniture Bits/preview.png|96]] | [KayKit Furniture Bits](https://github.com/KayKit-Game-Assets/KayKit-Furniture-Bits-1.0) | Kits | 53 | 44–1,018 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Halloween Bits/preview.png|96]] | [KayKit Halloween Bits](https://github.com/KayKit-Game-Assets/KayKit-Halloween-Bits-1.0) | Kits | 63 | 56–2,064 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Medieval Hexagon Pack/preview.png|96]] | [KayKit Medieval Hexagon Pack](https://github.com/KayKit-Game-Assets/KayKit-Medieval-Hexagon-Pack-1.0) | Kits | 221 | 16–5,659 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Prototype Bits/preview.png|96]] | [KayKit Prototype Bits](https://github.com/KayKit-Game-Assets/KayKit-Prototype-Bits-1.0) | Kits | 72 | 6–3,130 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Restaurant Bits/preview.png|96]] | [KayKit Restaurant Bits](https://github.com/KayKit-Game-Assets/KayKit-Restaurant-Bits-1.0) | Kits | 144 | 32–4,422 | ✅ | Kay Lousberg | CC0 1.0
![[20 FBX Asset Library/More Free Sources/KayKit/Kits/KayKit Space Base Bits/preview.png|96]] | [KayKit Space Base Bits](https://github.com/KayKit-Game-Assets/KayKit-Space-Base-Bits-1.0) | Kits | 57 | 12–1,464 | ✅ | Kay Lousberg | CC0 1.0

## Files
`20 FBX Asset Library/More Free Sources/KayKit/<Category>/<Pack>/` → one `.fbx` per model, shared `textures/`, `preview.png` (first 30 models), `LICENSE.txt`.

## Roblox import tips
1. Studio → **Avatar/Model tab → Import 3D** (3D Importer) → pick the `.fbx`. Keep the `textures/` folder next to the FBX so the importer finds the maps; if a texture does not come in, add a **SurfaceAppearance** and set ColorMap / NormalMap / RoughnessMap by hand from `textures/`.
2. Roblox's limit is **20,000 triangles per MeshPart**. Almost every kit piece is far below it; the table flags any pack with pieces over 20k (decimate those in Blender before import).
3. Files are in **metres** with the origin at the bottom centre (kits keep their authored pivots so pieces snap). If an import is tiny or huge, set the importer's scale or resize the MeshPart (1 stud ≈ 0.28 m).
4. Set **CollisionFidelity = Box/Hull** and **RenderFidelity = Automatic** on big scans to save memory; anchor static props.
5. Roblox textures max out at 1024 px in game, so the 2048 px maps here are downscaled on upload — no need to resize first.

- **Rigged characters** (KayKit Adventurers/Skeletons): import with the 3D Importer as a rig; the FBX carries the armature and all of KayKit's baked animations. Roblox imports the animations as separate clips you can publish with the Animation Editor.

[[More Free Sources - Hub]] · [[FBX Asset Library - Hub]]
