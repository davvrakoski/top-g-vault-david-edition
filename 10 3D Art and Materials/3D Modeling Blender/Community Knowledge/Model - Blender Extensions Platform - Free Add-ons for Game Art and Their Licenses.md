---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Blender Extensions Platform - Free Add-ons for Game Art and Their Licenses"
tags: [roblox, community-knowledge, 3d-art, blender, add-ons, licensing, tools]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://extensions.blender.org/add-ons/looptools/
  - https://extensions.blender.org/add-ons/bool-tool/
  - https://extensions.blender.org/add-ons/f2/
  - https://extensions.blender.org/add-ons/extra-mesh-objects/
  - https://extensions.blender.org/add-ons/texel-density-checker/
  - https://devtalk.blender.org/t/changes-to-add-on-and-themes-bundling-4-2-onwards/34593
  - https://www.blender.org/about/license/
---
# Blender Extensions Platform - Free Add-ons for Game Art and Their Licenses

Since Blender 4.2, most add-ons that used to ship inside Blender (LoopTools, F2, Bool Tool and many more) are no longer bundled. They live on the official **Extensions Platform** (extensions.blender.org) and install from inside Blender. This matters to Roblox devs for two reasons: tutorials that say "enable LoopTools in Preferences" no longer work on a fresh install, and the platform is the **safest** place to get free add-ons, because every listing is open source, reviewed, and clearly licensed. The Roblox-specific add-ons (official Roblox Blender Plugin, TexTools, UvSquares) are already covered in [[Free Blender Add-ons for Roblox Work]]; this note covers general modeling helpers.

## How to install (4.2 and later)

1. *Edit > Preferences > Get Extensions*, allow online access once.
2. Search the name, click **Install**. Updates appear in the same panel.
3. Offline: download the .zip from extensions.blender.org and use *Install from Disk*.

## Licence rule in one line

Add-ons on the platform are GPL (most listings say **GPL-3.0-or-later**; some older ones, like LoopTools, show GPL-2.0-or-later). The GPL covers the add-on's **code**. Blender's own licence page states that what you create with Blender (models, textures, renders) is yours, so meshes you make with these tools can ship in a Roblox game. You just cannot redistribute the add-on's code under a different licence. For our vault rules, the add-on itself is "link only" (not bundle-safe); your output is unaffected.

## Useful add-ons for game assets (all verified on the platform, Oct 2026)

| Add-on | Licence (listing) | What it helps with |
|---|---|---|
| **LoopTools** | GPL-2.0-or-later | Circle (perfect round holes for bolts, pipes), Flatten, Relax, Space, GStretch. Edit Mode > context menu or Sidebar > Edit |
| **F2** | GPL-3.0-or-later | Smarter **F** key: fills a face from one selected vertex or edge, fast for retopology and patching holes |
| **Bool Tool** | GPL-3.0-or-later | Quick boolean add/subtract with managed cutter objects for hard-surface props ([[Art - Hard-Surface Props with Booleans - Cleanup for Clean Game Shading]]) |
| **Extra Mesh Objects** | GPL-3.0-or-later | Extra primitive shapes in the Add menu as starting points (exact shape list unverified here; check the listing) |
| **Texel Density Checker** | GPL-3.0-or-later | Measures and sets texel density across objects; helps keep every prop's texture resolution consistent ([[UV Unwrapping and Texel Density in Studs]]) |

Still built into Blender (no install): **Node Wrangler** (stayed a core add-on for node editing), **Rigify**, FBX and glTF exporters.

## Safety checklist for any add-on

- Prefer extensions.blender.org or the author's own GitHub over re-upload sites.
- Read the listed licence and the last update date; abandoned add-ons may break on new Blender versions.
- Add-ons run Python with full access to your computer. Treat "free" add-ons from random file hosts like any downloaded program, and never install one bundled with a free model pack you do not trust (the same caution as [[Plugin and Free Model Safety Checklist]]).
- Keep a list of required add-ons in your project README so teammates can reproduce your file.

## When to skip an add-on

- If a built-in tool does the job: Blender's own *Mesh > Clean Up*, *Merge by Distance*, *Limited Dissolve*, and the Bevel and Weighted Normal modifiers cover most game cleanup.
- If the add-on only exists to make paid-tool-style results for renders (hair particles, volumetrics); those effects do not survive export to Roblox.

## Pitfalls

- Following a pre-4.2 tutorial and not finding the add-on in Preferences: it moved to Get Extensions.
- Mixing in paid add-ons from marketplaces: fine for your own use, but check each licence before sharing the .blend with a team.
- Calling an add-on "bundle-safe" because it is free: free and GPL are not the same as MIT or CC0.

## Related
[[3D Modeling Blender - Hub]] - [[Free Blender Add-ons for Roblox Work]] - [[Free 3D Apps Beside Blender - Blockbench, Instant Meshes and MeshLab]] - [[Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL]]
