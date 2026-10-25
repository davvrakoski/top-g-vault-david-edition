---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Photogrammetry Scans to Roblox - Decimate, Bake and Delight"
tags: [roblox, community-knowledge, 3d-art, blender, photogrammetry, scanning, realistic]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.realityscan.com/download
  - https://github.com/alicevision/Meshroom
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://docs.blender.org/manual/en/latest/render/cycles/baking.html
---
# Photogrammetry Scans to Roblox - Decimate, Bake and Delight

Photogrammetry turns many photos of a real object (a rock, a tree stump, a statue you own, a pile of bricks) into a textured 3D model. It is the fastest way to get believable realistic props, but raw scans are unusable in Roblox: millions of triangles, messy UVs, 8K textures and baked-in sunlight. The job is to **transfer the scan's detail onto a light game mesh**. This is the same high-to-low workflow as sculpting, so it pairs with [[Baking Normal and AO Maps in Blender for Roblox]] and [[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]].

## Capture tools (licences checked Oct 2026)

| Tool | Cost / licence | Notes |
|---|---|---|
| **RealityScan** (Epic, formerly RealityCapture) | Free for students, educators and individuals/companies under USD 1M annual gross revenue; proprietary EULA | Desktop app via the Epic Games Launcher; fast, high quality |
| **Meshroom** (AliceVision) | Open source, MPL-2.0 (per repo; confirm the COPYING file) | Free, runs locally, needs a CUDA-capable GPU for the dense steps (unverified for every version) |
| Phone scanning apps | Varies | Good for quick props; read each app's terms on who owns the output |

Only scan things you have the right to use: your own objects, public-domain sculptures, natural objects. Scanning branded products, artworks under copyright or people without consent creates legal problems.

## Shooting tips (short)

- Overcast, even light; no hard shadows. Shadows get baked into the texture and are hard to remove.
- 60-80% overlap between photos, walk around the object at 2-3 heights.
- Avoid shiny, transparent or plain-white objects; photogrammetry needs texture detail.

## Cleanup in Blender

1. **Import the high mesh** (OBJ/FBX/PLY). Delete floating junk and the ground plane around the object.
2. **Make the low mesh:**
   - Natural objects (rocks, stumps): duplicate the scan, add **Decimate** (Collapse) to about 1,000-5,000 triangles (house guidance), or *Remesh* (Voxel) then Decimate for a cleaner result.
   - Man-made objects: retopologise by hand or model a simple matching shape.
3. **UV unwrap the low mesh** (Smart UV Project is fine for rocks), leaving margin between islands.
4. **Bake** in Cycles from high to low with *Selected to Active*: **Diffuse (colour only)**, **Normal**, and optionally **AO**. Use a cage or extrusion distance so the bake catches all detail.
5. Bake at 2048 and downsize for Roblox. The texture specifications page now lists support up to 4096 x 4096 (the same page still has an older 1024 line), but recommends about 256 for a 5-stud object, 512 for 10 studs and 1024 for 20 studs. Most scanned props look fine at 512.

## Delighting (removing baked lighting)

- Because the scan's colour includes the light of the day it was shot, it fights Roblox lighting. Reduce it:
  - In an image editor, use a high-pass or "divide by blurred copy" to flatten large light gradients.
  - Multiply out the baked AO: bake AO from the high mesh, then lighten the colour map where AO is dark.
  - Lower contrast and keep albedo values in the PBR range ([[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]]).
- Generate roughness from the colour map (inverted, levels-adjusted greyscale) as a starting point; scanned rocks are usually 0.7-0.95 rough.

## Into Studio

- Import the low mesh with its four maps via the Importer, or assemble a `SurfaceAppearance` manually ([[Texture Export from Blender and Substance for SurfaceAppearance]]).
- Collision: **Hull** or **Box** for rocks; never `PreciseConvexDecomposition` on a scan unless gameplay needs it.
- Reuse: rotate and scale the same 3-5 scanned rocks around a map rather than scanning 30 unique ones; instancing keeps memory down ([[Texture Memory and Triangle Budgets for Roblox Scenes]]).

## Pitfalls

- Uploading the raw scan: over the 20,000-triangle mesh cap, and huge textures get downsampled anyway.
- Visible hard shadows in the colour map: re-shoot on a cloudy day; no filter fully fixes it.
- Realistic scans in a stylised game: they will never match. Decide art direction first ([[Stylized vs Realistic Art Direction on Roblox]]).

## Related
[[3D Modeling Blender - Hub]] - [[Baking Normal and AO Maps in Blender for Roblox]] - [[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]] - [[Realistic Rock and Cliff Surfaces — PBR Without Waste]]
