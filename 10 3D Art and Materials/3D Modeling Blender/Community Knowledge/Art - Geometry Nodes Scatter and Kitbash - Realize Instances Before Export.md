---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Geometry Nodes Scatter and Kitbash - Realize Instances Before Export"
tags: [roblox, community-knowledge, 3d-art, blender, geometry-nodes]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/4.2/modeling/geometry_nodes/instances/realize_instances.html
  - https://blenderartists.org/t/geo-nodes-instances-to-real-instances/1409710
  - https://blenderartists.org/t/geometry-nodes-convert-scattered-geometries-to-mesh/1287642
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Geometry Nodes Scatter and Kitbash - Realize Instances Before Export

Geometry Nodes in Blender can scatter pebbles over a cliff, grow bolts along a pipe, or assemble a building from kit pieces in seconds. The catch for Roblox: what you see in the viewport is mostly **instances**, and instances do not survive a normal FBX export the way you expect. Forum reports and the FBX exporter notes agree that instancing is not preserved; the reliable path is a **Realize Instances** node, then apply the modifier, then export. The other half of the decision is whether you should bake the scatter into a mesh at all, or rebuild it in Studio.

## Basic scatter graph

1. *Group Input* (the surface mesh) to **Distribute Points on Faces**. Use *Poisson Disk* mode with *Distance Min* so pieces do not overlap.
2. Points to **Instance on Points**, with a *Collection Info* node (tick *Separate Children* and *Pick Instance*) as the instance source for variety.
3. **Random Value** (float) into *Scale*; another into *Rotation* Z for natural variation. **Align Euler to Vector** with the surface normal tilts pieces with the slope.
4. **Realize Instances** turns every instance into real geometry.
5. **Join Geometry** with the original surface, to *Group Output*.
6. On a copy of the object: *Apply* the Geometry Nodes modifier. Curves and some object types cannot apply directly; convert to mesh first (*Object > Convert > Mesh*).

## Kitbash use

- Snap greebles (vents, pipes, bolts) along edges with *Mesh to Points* or *Curve to Points*, then instance kit pieces.
- Realize and apply, then run a merge-by-distance to weld touching pieces, and check normals.
- Bake the result into a trim or a normal map if it is only surface detail ([[Trim Sheets for Roblox Environments]]).

## Bake it, or place it in Studio?

| Situation | Best route |
|---|---|
| Small detail welded into one prop (moss on a rock, bolts on a door) | Realize, apply, export one MeshPart |
| Ground scatter over a large area (rocks, grass tufts, debris) | Export **one** of each piece and place copies in Studio |
| Medium cluster (a rock pile) | Realize into one mesh per cluster, reuse the cluster |

Why: identical MeshParts reuse one mesh asset, and Roblox can stream and cull many small parts independently. One huge realized scatter is a unique, large mesh that cannot be culled piece by piece, and it hits the 20,000 triangle per-mesh limit fast.

## Transferring a scatter layout to Studio

If you want Blender's distribution but Studio's instancing, store point positions instead of geometry: a small Blender Python script can print position, rotation and scale per instance, and a Studio command-bar script recreates them as clones of one MeshPart. Keep generated data out of the game's runtime folders and run it once in edit mode. (Workflow shared in community threads; the exact scripts are yours to write.)

## Pitfalls

- Exporting without applying: the FBX contains only the base mesh, or every instance as a separate object with a confusing name.
- Realizing thousands of instances: Blender slows sharply, so lower density while designing.
- Random seeds change the layout each time you edit; lock the *Seed* value once you like it.
- Normals of realized pieces facing inward after negative random scale; keep scale positive.

## Related
[[3D Modeling Blender - Hub]] - [[Modular Kits and Grid Snapping in Studs]] - [[Trim Sheets for Roblox Environments]] - [[Texture Memory and Triangle Budgets for Roblox Scenes]]
