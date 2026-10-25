---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-detail-shape-plugins"
title: "Free Detail and Shape Plugins - Pipes, Curves, Cutters and 3D Text"
tags: [roblox, community, tools, free-assets, plugins, building, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "Roblox Creator Store free plugins - link only"
sources:
  - https://devforum.roblox.com/t/teloss-studio-development-setup/718092
  - https://devforum.roblox.com/t/my-kits-and-plugins/231162
  - https://devforum.roblox.com/t/threedtext-2-plugin-create-text-with-meshparts/290144
  - https://economy.roblox.com/v2/assets/2273628561/details
cssclasses: [tg-a40]
---

# Free Detail and Shape Plugins - Pipes, Curves, Cutters and 3D Text

Second-tier building helpers: you won't use them every day, but they save an hour when you need them. All free on 2026-10-25 (Roblox asset API). Several are old but still install; test on a copy of your place.

| Plugin | Creator | What it does | Last update | Bundle-safe? | Link |
|---|---|---|---|---|---|
| Pipes | Fractality | Quickly builds pipe runs and bends | 2019-01 | No - link only | https://create.roblox.com/store/asset/382465996 |
| oozledraw toolbar: draw curve/rope | Oozlebachr | Draw curves and ropes: wires, cables, vines | 2014-01 | No - link only | https://create.roblox.com/store/asset/142509225 |
| Brick Cutter | Ozzypig | Line or cross cuts: drag two cuts and the section between them is removed; snap setting (default 1 stud) | 2018-08 | No - link only | https://create.roblox.com/store/asset/143152131 |
| CSG Curve Cutter | Defaultio | Cuts flat 2D or rough 3D shapes out of parts with CSG, using orthographic views; good for quick low-detail models | 2016-06 | No - link only | https://create.roblox.com/store/asset/377278481 |
| ThreeDText 2 | XAXA | Makes 3D text out of MeshParts | 2019-12 | No - link only | https://create.roblox.com/store/asset/2273628561 |
| Model Resize Plugin 2.1 | DaMrNelson | Drag-to-resize whole models (props, small details) | 2015-03 | No - link only | https://create.roblox.com/store/asset/143613186 |
| Part Distributor | evaera | Evenly places N parts between a start part and an end part (fences, lamp rows, rails) | 2018-01 | No - link only | https://create.roblox.com/store/asset/897010273 |
| Resurface | cxmeels | Brings back the classic Surface tool (studs and other surface types) for a retro look | 2025-11 | No - link only | https://create.roblox.com/store/asset/5070921519 |

## Notes
- **CSG and cutters** create unions; unions cost more than plain parts and can have bad collision. Check collision fidelity after cutting (see [[FBX Import Settings, Scale and Collision Fidelity]] for the fidelity options).
- **Model Resize 2.1** predates Studio's own model scaling; try Studio's own Scale tool or the `Model:ScaleTo()` API on the model first.
- **3D text from MeshParts** is cheaper to render than hundreds of letter parts, but every letter is still a separate mesh. For signs far from the player, a SurfaceGui or a texture is lighter.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Free Building Plugins - Stravant, F3X and Archimedes]] · [[Free Selection, Cleanup and Utility Plugins]] · [[Meshes, Topology and Blender]]

<!-- TDOD_GRAPH_END -->
