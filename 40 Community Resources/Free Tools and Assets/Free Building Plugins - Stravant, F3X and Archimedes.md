---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-building-plugins"
title: "Free Building Plugins - Stravant, F3X and Archimedes"
tags: [roblox, community, tools, free-assets, plugins, building, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "Roblox Creator Store free plugins - link only"
sources:
  - https://devforum.roblox.com/t/my-kits-and-plugins/231162
  - https://devforum.roblox.com/t/teloss-studio-development-setup/718092
  - https://devforum.roblox.com/t/best-building-plugins/2572030
  - https://github.com/F3XTeam/ROBLOX-Building-Tools
  - https://economy.roblox.com/v2/assets/165687726/details
cssclasses: [tg-a40]
---

# Free Building Plugins - Stravant, F3X and Archimedes

The core part-building kit that keeps coming up in DevForum "what plugins do you use" threads (and that r/robloxgamedev users name the same way). All rows: **free on the Creator Store on 2026-10-25**, checked through the Roblox asset API.

| Plugin | Creator | What it does | Last update | Bundle-safe? | Link |
|---|---|---|---|---|---|
| Stravant - GapFill & Extrude | stravant | Fills the gap between two edges with wedges; extrudes faces | 2026-02 | No - link only | https://create.roblox.com/store/asset/165687726 |
| Stravant - ResizeAlign | stravant | Resizes one face to meet another, even on rotated parts (walls, floors) | 2026-07 | No - link only | https://create.roblox.com/store/asset/165534573 |
| Stravant - Model Reflect | stravant | Mirrors a model across a plane for symmetric builds | 2026-01 | No - link only | https://create.roblox.com/store/asset/217792838 |
| Stravant - MaterialFlip | stravant | Click a part to flip which way a directional material (e.g. Wood Planks) runs | 2026-08 | No - link only | https://create.roblox.com/store/asset/166951203 |
| Building Tools by F3X (Plugin) | GigsD4X / F3X team | Move, resize, rotate, paint, surface, material, weld and mesh tools in one panel | 2026-06 | No - link only | https://create.roblox.com/store/asset/144950355 |
| Archimedes (v3.1.9) | Scriptos | Builds arcs, rings and curves by repeating and rotating parts | 2024-10 | No - link only | https://create.roblox.com/store/asset/144938633 |
| Studio Build Suite | Fractality | Move/rotate/resize helper toolset, forked from Anaminus's CmdUtl v5 | 2025-10 | No - link only | https://create.roblox.com/store/asset/260276858 |

## Practical tips from the threads
- **GapFill + ResizeAlign** is the classic pair: ResizeAlign to make surfaces meet, GapFill to close the triangle gaps that rotated parts leave.
- **Archimedes** can make a lot of parts fast. Union or convert to a mesh in Blender afterwards if the part count matters (see [[Texture Memory and Triangle Budgets for Roblox Scenes]]).
- **F3X** also has an in-game version (an exported build can be brought into Studio with its Import plugin). The GitHub repo has **no license file**, so treat its source as all-rights-reserved: use the plugin, don't copy the code.
- A fan "stravant's GeomTools Suite" bundle by another user was **not free** (off sale) on 2026-10-25. Use the original stravant listings above.

## Built-in alternatives first
Studio's own [[Align tool]] and [[Pivot tools]] cover a lot of what older plugins did. Install a plugin only when the built-in tool can't do the job.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Free Detail and Shape Plugins - Pipes, Curves, Cutters and 3D Text]] · [[Plugin and Free Model Safety Checklist]] · [[Studio plugins]] · [[Map Blockout to Art Pass Workflow]]

<!-- TDOD_GRAPH_END -->
