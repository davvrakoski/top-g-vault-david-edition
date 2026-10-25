---
area: "40 Community Resources"
cluster: "Maps Worlds and Level Design"
source_note: "community/maps-level-design/real-world-heightmaps"
title: "Real-World Heightmaps - Free DEM Sources and Licenses"
tags: [roblox, community, terrain, heightmap, licenses, "cluster/maps-worlds-and-level-design"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/studio/terrain-editor
  - https://github.com/tangrams/heightmapper
  - https://github.com/tilezen/joerd/blob/master/docs/attribution.md
  - https://developers.google.com/earth-engine/datasets/catalog/USGS_3DEP_10m_collection
  - https://documentation.dataspace.copernicus.eu/APIs/SentinelHub/Data/DEM/resources/license/License-COPDEM-30.pdf
---
# Real-World Heightmaps - Free DEM Sources and Licenses

Real terrain (a canyon, a volcano, a coastline) makes a great starting point for a Roblox map: the shapes look natural because they are. The data comes as a DEM (digital elevation model). This note covers where to get it legally, the credit you owe, and the maths to make it fit Roblox's heightmap import. The import itself (Terrain Editor, 4 studs per pixel, up to 4096 px, colormaps) is covered in [[Terrain Tools, Expanded Terrain and Material Variants]].

## Sources and their terms (checked 2026-10-25)
| Source | Coverage | Terms | Credit to show |
|---|---|---|---|
| **USGS 3DEP** (US elevation program) | USA, ~10 m and 1 m | Public domain; USGS *requests* credit when published | "3DEP data courtesy of the U.S. Geological Survey" |
| **Copernicus DEM GLO-30** | Worldwide, ~30 m | Free licence; distribution needs the licence's exact source notice, and a "produced using Copernicus WorldDEM-30" notice for modified data. Read the PDF before commercial use | Copy the notice text from the licence PDF |
| **Tangram Heightmapper** (tool) | Worldwide, in the browser | Tool code is **MIT**. It renders Mapzen/Tilezen terrain tiles, which mix many sources (3DEP, SRTM, EU-DEM, ETOPO1 and others), each with its own attribution | Check the Tilezen attribution list for your area |
| **Generated terrain** (Blender's A.N.T. Landscape add-on, noise in Studio) | Anywhere you want | Your own output | None |

"Free to use in your game" is not the same as "free to put in a pack you sell". For the vault's bundles, only your own generated terrain or public-domain data is safe without extra notices.

## Tangram Heightmapper workflow
Heightmapper (tangrams on GitHub) is a browser map that shows elevation in greyscale:
1. Pan and zoom to the area you want.
2. Leave **auto-expose** on: it stretches the darkest point in view to black and the highest to white. Turn it off to set fixed min/max heights (needed if you tile several images).
3. Use **Render** for a higher-quality stitched image, or **Export** for the current view.
4. Note the **z:x scale factor** it shows; it tells you how tall the terrain should be relative to its width to stay true-scale.

## The scale maths
Roblox imports **1 pixel = 4 studs**. Real DEM pixels are 10-30 m. So a real landscape always shrinks horizontally:

- 30 m DEM pixel -> 4 studs (1.12 m). Horizontal scale = 1.12 / 30 = **1:27**.
- To keep the same proportions, shrink height by the same factor: **height in studs = real relief (m) x 4 / pixel size (m)**.
- Example: a 600 m tall valley from a 30 m DEM: 600 x 4 / 30 = **80 studs** of height range. Set the import region's Y size to about 80.
- Exaggerate on purpose: real terrain at 1:27 often looks flat in a game. 1.5-2x the true-scale height (120-160 studs here) usually reads better. Decide by playing, not by numbers.

Size check: a 1024 x 1024 px heightmap becomes 4,096 x 4,096 studs. At 16 studs/s that is over four minutes to walk across one edge. Crop to the part you need.

## Prepare the image
1. Crop to a square (or your map's shape) at the final pixel size.
2. Make sure the lowest playable ground is not pure black if you want water: set sea level in Studio separately.
3. Remove noise: a light blur (1-2 px) avoids "staircase" terrain.
4. Export a greyscale PNG. Keep a 16-bit master for editing; export 8-bit if your tool's 16-bit file does not import cleanly.
5. After import, flatten gameplay areas (towns, arenas, roads) with the Flatten and Smooth brushes. Real terrain is rarely flat enough for building.

## Record the credit
Put the dataset name, date and credit line in your game's credits and in the map's design note, even when it is only requested, not required.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps Worlds and Level Design - Hub]]

**Related notes:** [[Terrain Tools, Expanded Terrain and Material Variants]] · [[Terrain Editor]] · [[Procedural Terrain with math.noise and WriteVoxels]] · [[Free Terrain, Lighting and Sky Plugins]]

<!-- TDOD_GRAPH_END -->
