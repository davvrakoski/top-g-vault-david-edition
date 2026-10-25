---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-blender-addons"
title: "Free Blender Add-ons for Roblox Work"
tags: [roblox, community, tools, blender, free-assets, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://github.com/Roblox/roblox-blender-plugin
  - https://github.com/SavMartin/TexTools-Blender
  - https://github.com/Radivarig/UvSquares
  - https://devforum.roblox.com/t/blender-rig-exporter-animation-importer/34729
  - https://www.blender.org/about/license/
cssclasses: [tg-a40]
---

# Free Blender Add-ons for Roblox Work

Free add-ons that solve Roblox-specific Blender jobs: uploading, UVs and texture baking, and part-rig animation. Blender itself is GPL, but its license page says what you make with it is your own property, so models made with these tools are yours to ship.

| Add-on | Maintainer | Job | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| **Roblox Blender Plugin** (official) | Roblox | Upload selected meshes/collections from Blender to Roblox as **packages** via Open Cloud; re-upload updates the same package | MIT | YES (code) - but link, don't bundle | https://github.com/Roblox/roblox-blender-plugin |
| TexTools | SavMartin (originally renderhjs) | UV tools plus texture baking (AO, normal, ID maps) | GPL-3.0 | No - link only | https://github.com/SavMartin/TexTools-Blender |
| UvSquares | Radivarig | Straighten a quad UV selection into a grid (clean trims and tiling) | GPL-2.0 | No - link only | https://github.com/Radivarig/UvSquares |
| Blender rig exporter / animation importer | Den_S | Pairs with the Studio plugin to animate Motor6D rigs in Blender and bring the animation back | Not stated (pastebin script) | No - link only | https://devforum.roblox.com/t/blender-rig-exporter-animation-importer/34729 |

Also built into Blender, no install needed: **Node Wrangler** (shader setup), **Rigify** (rig generation) and the **Decimate** modifier (LODs / lower triangle counts).

## Roblox Blender Plugin quick facts (from its README)
- Needs **Blender 3.2+**. Install the release zip with Edit > Preferences > Add-ons > Install from Disk, then click **Install Dependencies** in the Roblox sidebar tab once and restart.
- Log in through the browser and pick your account and/or **groups**; the "Upload to" menu then lets you choose the group that owns your game.
- Uploads show up in Studio at Toolbox > Inventory > **My Packages**. The add-on saves a "Roblox Package ID" custom property on the object; delete it to upload as a new asset instead of a new version.
- Roblox accepts bug-fix pull requests only, not new features.
- The official doc page is [[Roblox Blender plugin]].

## Before you export anything
Follow [[FBX Import Settings, Scale and Collision Fidelity]] and the official [[Blender validation tool]] for avatar items. For whole-asset checks see [[Blender Game-Ready Audit]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Roblox Blender plugin]] · [[Meshes, Topology and Blender]] · [[Free 3D Apps Beside Blender - Blockbench, Instant Meshes and MeshLab]] · [[Free Rigging and Animation Helper Plugins]]

<!-- TDOD_GRAPH_END -->
