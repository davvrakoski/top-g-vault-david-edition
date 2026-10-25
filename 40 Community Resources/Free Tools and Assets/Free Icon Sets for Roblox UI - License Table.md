---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-icon-sets"
title: "Free Icon Sets for Roblox UI - License Table"
tags: [roblox, community, ui, icons, free-assets, license, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://github.com/google/material-design-icons
  - https://github.com/lucide-icons/lucide
  - https://github.com/tabler/tabler-icons
  - https://github.com/phosphor-icons/core
  - https://github.com/tailwindlabs/heroicons
  - https://game-icons.net/about.html
  - https://kenney.nl/assets/game-icons
cssclasses: [tg-a40]
---

# Free Icon Sets for Roblox UI - License Table

Icons for shop buttons, inventory slots, settings menus and HUDs. Licenses read on each project's own repo or site on 2026-10-25.

| Set | Maker | Style | License | Credit? | Bundle-safe? | Link |
|---|---|---|---|---|---|---|
| **Kenney Game Icons** (105 files) | Kenney | Game controls, prompts, UI symbols | CC0 | No | **YES** (Kenney already logged in [[Asset Licenses and Credits]]) | https://kenney.nl/assets/game-icons |
| **Tabler Icons** (6,200+) | Tabler | Clean outline UI icons | MIT | Keep license | **YES** | https://github.com/tabler/tabler-icons |
| **Heroicons** | Tailwind Labs | Outline + solid UI icons | MIT | Keep license | **YES** | https://github.com/tailwindlabs/heroicons |
| **Phosphor** | Phosphor Icons | Six weights, flexible UI set | MIT | Keep license | **YES** | https://github.com/phosphor-icons/core |
| **Lucide** | Lucide contributors (Feather fork) | Consistent outline UI icons | ISC (permissive) | Keep notice | No - link only (permissive, but not on the vault's bundle list) | https://github.com/lucide-icons/lucide |
| **Material Symbols** | Google | Huge UI set, many styles | Apache-2.0 | Keep notice | No - link only | https://github.com/google/material-design-icons |
| **game-icons.net** (~4,000) | Lorc, Delapouite and 30+ others | RPG/fantasy item and ability icons | CC BY 3.0 | **Yes**: "Icons made by {author}. Available on https://game-icons.net" | No - link only (CC BY 3.0, not 4.0) | https://game-icons.net |

## Getting them into Roblox
1. Most sets ship as **SVG**; Roblox images need a raster file. Export PNG at 2x your largest on-screen size (e.g. 128 px for a 64 px button).
2. Recolor before export, or export **white** icons and tint them in Studio with `ImageColor3` so one upload serves every color.
3. Pack many small icons into a **spritesheet** and use `ImageRectOffset` / `ImageRectSize` to cut fewer uploads and load faster.
4. Asphalt can convert SVG to PNG and upload a whole folder: [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]].

## Credits
For game-icons.net, put the credit (author names + site) in your game description or credits screen. MIT / ISC / Apache sets need the license text kept with the files you ship (a `LICENSE` note in your repo), not an in-game credit.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Free UI Kits and Mockup Files]] · [[UI Design System]] · [[Text & image buttons]] · [[Free 2D Art Apps - Krita, GIMP, Photopea and Pixel Editors]]

<!-- TDOD_GRAPH_END -->
