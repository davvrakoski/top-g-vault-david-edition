---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Stylized Food Props - Shapes, Colour and Budgets"
tags: [roblox, community-knowledge, 3d-art, blender, props, food, stylized]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/subdivision_surface.html
  - https://docs.blender.org/manual/en/latest/sculpt_paint/vertex_paint/introduction.html
  - https://create.roblox.com/docs/reference/engine/classes/Tool
---
# Stylized Food Props - Shapes, Colour and Budgets

Food is everywhere in Roblox: cafe and restaurant roleplays, cooking simulators, "eat to grow" games, healing items and collectibles. Food reads as "tasty" through **soft rounded shapes, saturated warm colours and a little shine**, not through detail. Because food is often held, stacked in large numbers or sold in a shop UI, it must also be cheap. This note is a fast, repeatable recipe for a whole menu of props.

## Shape rules

- **Round everything.** Start from primitives and use a low-level **Subdivision Surface** (level 1) or a 2-3 segment Bevel, then apply. Hard edges make food look like plastic toys in the wrong way.
- **Exaggerate the signature feature:** the burger's sesame bun, the pizza's cheese drip, the donut's icing edge. One hero feature per item.
- **Layer stacks** (burgers, sandwiches, cakes) as separate flattened cylinders with slight random scale and rotation so they look hand-made. Join them at the end.
- **Bite-ready proportions:** for a held item, about 1-1.5 studs across reads well in the hand (house guidance).

## Recipe examples (house budgets)

| Item | Build | Triangles |
|---|---|---|
| Apple | UV sphere 12 x 8, pull top in, cone stem, flat leaf card | 150-300 |
| Donut | Torus 16 x 8; duplicate top half, shrink-wrap and wavy-edge it for icing | 300-600 |
| Burger | 5-7 stacked cylinders 12-16 sides, lettuce as a wavy ring | 400-900 |
| Pizza slice | Triangle prism, rounded crust roll, cheese as a slightly displaced top layer | 150-400 |
| Cake | Cylinder layers, inset/extrude drips on the top edge | 300-800 |
| Drink cup | 12-side cylinder, tapered, lid and straw as separate shells | 150-350 |

## Colour without heavy textures

- **Vertex colours or a palette atlas** work beautifully for food ([[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]]). A 64 x 64 or 128 x 128 palette shared by the whole menu keeps memory tiny.
- Use warm, saturated mid-values for "cooked" (golden browns, reds) and add a lighter top tone to suggest light hitting the top.
- Sprinkles, seeds and pepperoni: paint them in the texture, or use a few low-poly instances only on hero items. Fifty modelled sesame seeds cost more than the whole bun.

## Shine and wetness

- In Studio, a `SurfaceAppearance` with a roughness map lets icing, sauce and fruit look glossy (roughness about 0.2-0.4) while bread stays matte (0.7-0.9). See [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]].
- Built-in `SmoothPlastic` can give a clean candy look with no texture at all for very stylised games.

## Making a menu efficiently

1. Model a shared "plate" and "wrapper" set first; many items sit on them.
2. Keep every item's origin at the **bottom centre** (sits on plates and counters) or at the **grip point** if it is a `Tool`.
3. Render shop icons from the same Blender camera and lighting so the UI looks consistent, or use a ViewportFrame in Studio.
4. Export each item as its own mesh so it can be instanced; a counter with 30 identical donuts is cheap.

## Pitfalls

- Realistic food photos as textures on low-poly shapes: clashes with the stylised look.
- Highly subdivided meshes left unapplied/high: a single donut at 10k triangles multiplied by a bakery shelf is a frame-rate problem.
- Brown on brown: put a contrasting element (green lettuce, red sauce) on every brown item so it reads.

## Related
[[3D Modeling Blender - Hub]] - [[Low-Poly Colour Workflows - Palette Atlas vs Vertex Colours]] - [[Art - Prop Style Guide - Shape Language, Bevel Size and Detail Density]] - [[Art - Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules]]
