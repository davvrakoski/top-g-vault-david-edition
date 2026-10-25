---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Smooth and Hard Edges - Shading Normals for Roblox Meshes"
tags: [roblox, community-knowledge, blender, shading, normals, topology]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/studio/importer
  - https://docs.blender.org/manual/en/latest/modeling/meshes/editing/mesh/normals.html
---
# Smooth and Hard Edges - Shading Normals for Roblox Meshes

A low-poly mesh looks either clean and crafted or lumpy and "AI-generated" mostly because of its **vertex normals**, not its triangle count. Normals tell the renderer which way each vertex faces; smooth normals blend lighting across faces, split (hard) normals make a crisp edge. Roblox imports whatever normals your FBX/glTF carries, so the shading you see in Blender's Solid view is close to what Studio shows. Getting this right costs zero triangles.

## The three looks

| Look | How | Use for |
| --- | --- | --- |
| **Flat** (every face hard) | Shade Flat | Low-poly stylized art, crystals, rocks in faceted style |
| **Smooth** (every edge soft) | Shade Smooth | Organic shapes: characters, fruit, terrain-like meshes |
| **Smooth with hard edges** | Shade Auto Smooth (by angle, e.g. 30-40°) or marked Sharp edges | Props and architecture: crates, guns, furniture |

Most hard-surface game props want the third. In Blender 4.1+ "Auto Smooth" became a modifier/node group (*Shade Auto Smooth*); older versions have it in Object Data > Normals.

## The rule that prevents black smears

Large flat faces next to bevels go dark and gradient-y when normals smooth across a 90° edge. Fixes, in order of preference:

1. **Mark the edge sharp** (hard) and put a **UV seam** on the same edge. Hard edges split vertices anyway, so a seam there costs nothing extra and avoids normal map seams.
2. **Add a small bevel** (1-2 segments) and use **Weighted Normal** (modifier) so big faces stay flat and the bevel takes the curvature. This is the standard "mid-poly" trick and reads great without any normal map.
3. Bake a normal map from a high-poly (see the baking note) when you need the most quality.

## Export and import

- FBX export: Geometry > Smoothing = **Normals Only** or **Face** (writes your custom normals). Apply the Weighted Normal / Auto Smooth modifiers on export (Apply Modifiers on).
- Triangulate before baking/exporting when a normal map is involved, so tangents match.
- In the Studio Importer, check for flipped faces; **Invert Negative Faces** fixes meshes exported with negative scale, but fixing scale in Blender (Apply Scale) is better.
- Roblox meshes are single-sided by default. Inside-out normals mean invisible faces: in Blender, turn on *Face Orientation* overlay; everything visible should be blue.

## Normals and vertex count

Every hard edge and every UV seam splits vertices. That is fine; just avoid random hard edges on curved surfaces (tubes, wheels) where they show as stripes and add vertices for nothing.

## Quick checks before export

- [ ] Face Orientation overlay all blue on the outside
- [ ] Shade setting chosen per object (flat, smooth or auto smooth)
- [ ] Hard edges coincide with UV seams
- [ ] Weighted Normal applied on bevelled props
- [ ] Scale applied (no negative scale)

## Pitfalls

- Merging two meshes with different shading settings: recheck after Join.
- Decimate destroys custom normals; re-run Weighted Normal afterwards.
- AI-generated meshes often arrive fully smooth; re-shade with auto smooth by angle and clean the worst areas by hand.

## Related
[[3D Modeling Blender - Hub]] · [[Meshes, Topology and Blender]] · [[Baking Normal and AO Maps in Blender for Roblox]] · [[Blender Game-Ready Audit]]
