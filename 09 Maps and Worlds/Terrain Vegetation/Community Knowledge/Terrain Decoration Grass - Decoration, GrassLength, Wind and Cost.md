---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Terrain Decoration Grass - Decoration, GrassLength, Wind and Cost"
tags: [roblox, community-knowledge, terrain, grass, foliage, performance]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Terrain
  - https://create.roblox.com/docs/parts/terrain
  - https://create.roblox.com/docs/environment/global-wind
  - https://devforum.roblox.com/t/optimize-smooth-terrain-better/3781706
  - https://devforum.roblox.com/t/optimized-interactive-grass/3085357
  - https://devforum.roblox.com/t/alternatives-to-grass/423304
---
# Terrain Decoration Grass - Decoration, GrassLength, Wind and Cost

Animated terrain grass is the fastest way to make an open field feel alive, and it is the only grass on Roblox that costs almost no build time. It also has hard limits: it only grows on one material, it is configured globally, scripts cannot toggle it, and it adds triangles on every client. Knowing those limits up front decides whether a map uses terrain grass, mesh grass cards, or both.

## The facts (Engine API and Terrain guide)

| Item | Detail |
| --- | --- |
| `Terrain.Decoration` | Turns animated grass on for the `Grass` terrain material. Tagged **NotScriptable**: set it in Studio's Properties window, not from code. |
| `Terrain.GrassLength` | 0.1 to 1. Also NotScriptable. |
| Material | The docs name only the `Grass` material. `LeafyGrass`, `Ground`, `Mud` stay flat. Whether custom terrain materials based on Grass also grow blades: (unverified), test in your place. |
| Wind | `Workspace.GlobalWind` sets direction and strength for grass, dynamic clouds and particles. |
| Accessibility | The Global Wind guide notes grass speed (not direction) is reduced for players with **Reduce Motion** on. |

Because the properties are not scriptable, there is no supported "grass off on low graphics" switch. The engine scales its own detail with graphics quality, but your only design control is where you paint `Grass`.

## What the community measured

The "Optimize Smooth Terrain Better" thread (3781706, community posters, no staff replies) is the most concrete discussion:

- The opening post counted over 108,000 triangles and 247 draw calls for the default terrain baseplate, and argued draw calls are the real problem on mobile.
- One reply estimated that decoration grass can roughly double triangles compared to the bare grass plate.
- Other replies said terrain already has LOD, and that terrain may now occlude other objects, but water and decoration grass do not occlude.
- A well-known community developer in the thread argued triangles are not the main cost, pointing at draw calls, fragment shading and memory instead.

Treat these as directional, not rules, and check your own map with the Render stats overlay.

## Painting strategy

1. **Paint Grass only where players walk and look.** Use `LeafyGrass` or `Ground` under trees, on slopes and in places the camera rarely sees up close. This is the only real density control you have.
2. **Use grass to guide.** Short paths of `Ground`/`Mud` through `Grass` read as trails without any props.
3. **Keep GrassLength moderate** (around 0.5-0.7). Long grass hides small pickups, enemies and ledges; it is a gameplay change, not only a look.
4. **Tint with `SetMaterialColor`** for season events (check that the blades pick up the tint in your place; not stated in the docs).
5. **Set GlobalWind per mood**: a gentle vector for hubs, a stronger one for storms. Unlike `Decoration`, `GlobalWind` is a normal scriptable property, so weather systems can change it at runtime.

## When to use mesh grass instead

| Need | Choice |
| --- | --- |
| Grass on parts or meshes (rooftops, planters) | Mesh grass cards |
| Grass that bends around players | Custom systems, at a cost |
| Different grass looks in different biomes | Mesh clumps plus terrain grass where it fits |
| Mobile-first game with huge fields | Terrain grass in the play space, flat material beyond |

Custom interactive grass is possible but expensive. A 2024 DevForum creation ("Optimized Interactive Grass", BubasGaming) moved grass parts with one `BulkMoveTo` call per frame and reported roughly 120-150 FPS with the simulation running versus the 240 FPS cap without it, on the author's hardware. No license was stated, so treat it as reference only.

## Mesh grass settings checklist

- `CanCollide`, `CanTouch`, `CanQuery` all false
- `CastShadow` false
- `CollisionFidelity = Box`, `RenderFidelity = Performance` or Automatic
- One mesh asset reused everywhere so copies instance
- Clumps, not single blades: fewer, larger cards

## Related
[[Terrain Vegetation - Hub]] · [[Vegetation Layering and Composition]] · [[Terrain Tools, Expanded Terrain and Material Variants]] · [[BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame]]
