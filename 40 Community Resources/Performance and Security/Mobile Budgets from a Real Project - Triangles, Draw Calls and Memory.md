---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/mobile-budgets-real-project"
title: "Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory"
tags: [roblox, community, "cluster/performance-and-security", mobile, budgets, rendering, memory]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
---
# Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory

Most "how many parts can I have?" answers are guesses. This note collects the **numbers people have actually published**. The main source is MrChickenRocket's (Peter McNeill) guest article on the DevForum, *Real world building and scripting optimization for Roblox* (Aug 2024, Roblox Staff category), built on the uncopylocked *Cardboard Box Simulator*. The Creator Hub's own guidance is alongside for comparison.

## Recommended budgets (MrChickenRocket, mid-2024, graphics quality 10, 60 FPS target)

| Metric | Budget | How to check |
|---|---|---|
| Scene triangles | **500,000** | Render stats, *Draw (scene)* |
| Scene draw calls | **500** | Render stats, *Draw (scene)* |
| UI draw calls | worry above **~150** | *Draw (UI)* |
| Client memory | support **2 GB phones** (the article first said under 1.3 GB, then a correction changed it to "support 2 GB and up") | F9 console Memory, Ctrl+F7 |
| Network receive | stay **well below 40 KB/s** (see [[Network Receive Budget - 50 KB per Second and What Fills It]]) | Ctrl+F7 *Recv* |

**The Creator Hub example** (*Design for performance*): a team checking its baseline device might find it needs to stay under **1,000 draw calls and 1,000,000 triangles**. That's an illustration of how to find *your* limit, not a universal rule. The two sources disagree by 2x. That's the whole point: **choose a baseline device and measure on it.**

## Who you're actually building for (Creator Hub, *Test on hardware*)

- Android is roughly **65%** of a typical game's players. About **60%** of those devices have **2 to 4 GB** of RAM, about 35% have 4 to 8 GB, and about 5% have more.
- More than half of players are on devices scoring **10,000 to 20,000 on Passmark**.
- Studio's device emulation **isn't accurate for memory**, because Studio runs both server and client. Profile on a real phone, and run **10 to 15 minute** sessions to catch thermal throttling.

## How the example project split its budget

- **Fixed map:** about 300k triangles and 300 draw calls. **Flexible** (players, pets, coins, effects): about 200k and 200.
- The map was cut into about **30 zones** of about 100×100 studs, with at most **8** visible at once, so each zone got about **40k triangles and 40 draw calls**. One shipped zone measured 44,353 triangles and 23 draw calls.
- In an average view the game used about 100 scene draw calls and about 150k triangles, far under budget.

## Building techniques that hit those numbers

- **Kitbash** from a small set of reusable meshes (corner, plank, beveled cube at about 80 triangles), and vary colour, rotation and scale so copies still **batch**. A four-mesh kitbashed tree drew in 2 draw calls for every copy.
- **Bake part models into meshes:** a townhouse went from 12 draw calls and about 100 instances to **6 draw calls and 6 meshes**.
- Keep a **small material palette** and use vertex colour for variety.
- **Draw call traps:** transparency, unique textures and decals, SurfaceGuis and BillboardGuis, beams, particles (**1 draw call per emitter**) and terrain material mixing. A commenter said fixing semi-transparent parts with decals saved them 100+ draw calls.
- **Lighting:** the project shipped with **ShadowMap**, described as slightly faster than Future, especially on phones. Future is suggested for indoor games, with few shadow-casting lights.
- **CastShadow on small details:** the article recommends turning it off. A commenter said the docs claim it doesn't help. The current Creator Hub *Improve performance* page does list disabling `CastShadow` on small parts as an optimization. Measure *Draw (Shadow)* before and after in your own scene.

## Budget sheet (copy into your design doc)

| Bucket | Triangles | Draw calls | Notes |
|---|---|---|---|
| Static map (per visible area) | | | |
| Characters and avatars | | | |
| Props, pets, pickups | | | |
| VFX (emitters x 1 draw call) | | | |
| UI | n/a | under ~150 | |
| **Total** | under baseline limit | under baseline limit | measured on baseline device |

## Credits

MrChickenRocket (Peter McNeill), *Real world building and scripting optimization for Roblox*, DevForum, Aug 2024, plus commenters. Roblox Creator Hub, *Design for performance*, *Test on hardware* and *Improve performance* (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Mobile Performance Deep Dive]] · [[Performance Budget Template]] · [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[Design for performance]] · [[Test on hardware]]

<!-- TDOD_GRAPH_END -->
