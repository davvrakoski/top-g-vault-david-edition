---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/hdri-to-roblox-skybox"
title: "HDRI to Roblox Skybox - Free Converter Workflow"
tags: [roblox, community, tools, sky, lighting, free-assets, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MIT (converter); sky images per source"
sources:
  - https://github.com/matheowis/HDRI-to-CubeMap
  - https://matheowis.github.io/HDRI-to-CubeMap/
  - https://create.roblox.com/docs/environment/skybox
cssclasses: [tg-a40]
---

# HDRI to Roblox Skybox - Free Converter Workflow

Roblox skies are **six square images** on a `Sky` object (SkyboxBk, Dn, Ft, Lf, Rt, Up), not one panorama. Most free skies online are equirectangular HDRIs (one wide 2:1 image). This free converter turns one into the other.

| Tool / source | Maker | What | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| **HDRI-to-CubeMap** | matheowis | Web app: load a spherical .hdr / .png / .jpg, rotate and preview, save as cube faces | MIT | YES (code) - link it | https://matheowis.github.io/HDRI-to-CubeMap/ |
| Poly Haven HDRIs | Poly Haven | Free skies to convert | CC0 (already in the vault) | YES | see [[Asset Licenses and Credits]] |

## Steps
1. Pick a CC0 HDRI (Poly Haven) or render your own sky in Blender. Avoid "free skybox" uploads in the Toolbox unless the uploader made them.
2. Open the converter, load the image, rotate it so the sun/horizon sits where you want, and save the six faces.
3. Resize faces to a square power-of-two size (1024 is a good balance; the faces are big on screen but you pay texture memory for six of them).
4. Import the six images (Asset Manager or [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]]).
5. Insert a **Sky** in **Lighting** and assign each face (see the official [[Skyboxes]] page).
6. **Test with a labeled cube first.** Converters name faces like +X / -X / +Y / -Y / +Z / -Z; which one becomes SkyboxFt vs SkyboxRt depends on the tool, so expect to swap or rotate one or two faces the first time. Note the mapping once and reuse it.

## Tips
- HDRIs are often very bright or dark when converted to 8-bit PNG. Adjust exposure in the converter or an image editor until the horizon looks right.
- Match **Lighting** to the sky: sun direction (GeographicLatitude / ClockTime) and Atmosphere color. See [[Free Terrain, Lighting and Sky Plugins]] for Atmos, which previews skies quickly.
- If the HDRI already has a sun painted in, turn off `Sky.CelestialBodiesShown` (or clear the sun texture) so you don't get two suns, and point the engine sun the same way for matching shadows.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Skyboxes]] · [[Sky]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[Free Terrain, Lighting and Sky Plugins]]

<!-- TDOD_GRAPH_END -->
