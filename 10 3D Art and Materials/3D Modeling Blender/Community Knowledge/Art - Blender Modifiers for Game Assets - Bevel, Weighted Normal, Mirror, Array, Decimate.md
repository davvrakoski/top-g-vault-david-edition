---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Blender Modifiers for Game Assets - Bevel, Weighted Normal, Mirror, Array, Decimate"
tags: [roblox, community-knowledge, 3d-art, blender, modifiers]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/modeling/modifiers/index.html
  - https://docs.blender.org/manual/en/4.2/modeling/modifiers/normals/smooth_by_angle.html
  - https://blenderartists.org/t/blender-4-1-auto-smooth-is-now-a-modifier-only/1488922
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Blender Modifiers for Game Assets - Bevel, Weighted Normal, Mirror, Array, Decimate

Modifiers let you keep a model editable (non-destructive) while still exporting clean game geometry. A small, fixed stack covers most Roblox props: Mirror to model half, Array for repeats, Bevel for edges that catch light, Weighted Normal so low-poly shading looks solid, and Decimate when you need a cheaper version fast. The FBX exporter can apply the stack for you on export, so the source file stays flexible. Option names below match the Blender manual (4.x); check your version.

## Recommended order (top to bottom)

1. **Mirror**
2. **Array** (if needed)
3. **Bevel**
4. **Weighted Normal** (or Smooth by Angle in 4.1+)
5. **Triangulate** (optional, last)

Order matters: bevelling before mirroring puts a bevel on the mirror seam.

## Mirror

- Model one half; axis X for most props and characters.
- Turn on **Clipping** so seam vertices cannot cross the centre, and **Merge** so the halves weld.
- **Bisect** cuts off anything that strays past the axis.
- Mirrored UVs share texture space (cheaper) but baked normal maps and text on decals will mirror too; offset the mirrored UV island by exactly 1 UV unit if you need unique bakes.

## Array

- **Relative Offset** for fences, stairs, chains; **Merge** welds touching copies.
- **Object Offset** with an empty rotated by 360/N gives radial arrays (wheel spokes, columns around a tower).
- **Fit Type: Fit Length** makes railings fill an exact stud length, useful with [[Modular Kits and Grid Snapping in Studs]].
- For long repeats in a level, prefer one short piece duplicated in Studio: identical meshes reuse one asset, while a huge arrayed mesh is one big unique asset.

## Bevel

- Small bevels (1-3 cm, 1-2 segments) make low-poly edges catch highlights and read as "finished".
- **Limit Method: Angle** (around 30°) bevels only hard edges; **Weight** lets you choose edges by bevel weight.
- **Harden Normals** keeps flat faces flat after bevelling (needs smooth shading).
- **Clamp Overlap** avoids self-intersecting geometry on thin parts.
- Bevels cost triangles quickly; check the count after applying.

## Weighted Normal

- Re-weights vertex normals so big flat faces stay flat and the shading gradient moves into the small bevel faces. This is the cheapest way to get the "mid-poly" look without a normal map.
- **Weighting Mode: Face Area** is the usual choice; enable **Keep Sharp** to respect marked sharp edges.
- Since Blender 4.1 the old Auto Smooth checkbox is gone; smoothing by angle is a **Smooth by Angle** modifier (a geometry-nodes asset) added with *Shade Auto Smooth*. Put Weighted Normal after it.
- Export with custom normals: FBX includes them, and Roblox keeps imported normals (see [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]]).

## Decimate

- **Collapse** with a **Ratio** (0.5 = half the faces) is quick for LODs and AI-generated meshes. Turn on **Symmetry** for symmetric objects and **Triangulate** to see the true result.
- **Planar** dissolves flat areas by angle; great for CAD-like or AI meshes with dense flat panels.
- **Un-Subdivide** reverses subdivision on grid-like meshes.
- Decimate destroys UV seams and clean loops on organic shapes; for hero assets use retopology instead (see [[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]]).

## Before export

- Roblox meshes must stay under 20,000 triangles each. Check *Viewport Overlays > Statistics* with modifiers active.
- Either tick the exporter's *Apply Modifiers* or apply manually on a copy. Keep the unapplied source file.
- Triangulating yourself (Triangulate modifier, *Keep Normals* on) makes Blender and Studio show identical shading.

## Related
[[3D Modeling Blender - Hub]] - [[Smooth and Hard Edges - Shading Normals for Roblox Meshes]] - [[Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs]] - [[Blender Game-Ready Audit]]
