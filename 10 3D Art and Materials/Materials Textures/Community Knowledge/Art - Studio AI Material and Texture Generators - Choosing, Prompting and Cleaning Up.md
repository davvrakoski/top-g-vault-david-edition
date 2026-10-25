---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Studio AI Material and Texture Generators - Choosing, Prompting and Cleaning Up"
tags: [roblox, community-knowledge, materials, textures, ai-tools, studio]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/material-generator
  - https://create.roblox.com/docs/studio/texture-generator
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/MaterialVariant
---
# Studio AI Material and Texture Generators - Choosing, Prompting and Cleaning Up

Roblox Studio ships two built-in AI tools for surfaces. The **Material Generator** makes tiling materials (saved as MaterialVariants) from a text phrase. The **Texture Generator** paints a texture fitted to a specific mesh from a text or image prompt. Both are quick, but used carelessly they produce a map where every surface has a different style, scale and colour temperature. This note is the practical layer on top of the official pages: which one to pick, prompt patterns that keep a consistent look, and the clean-up steps before shipping.

## Which tool?

| Need | Tool | Output |
|---|---|---|
| Floors, walls, terrain, any repeating surface | Material Generator (*Window > 3D*, or *Generate* in the Material widget) | MaterialVariant in MaterialService, adjustable *Studs Per Tile* and *Organic* toggle |
| One prop or character with its own layout | Texture Generator (select a mesh, *Model > Texture*) | **Fast**: 1K diffuse applied as the MeshPart texture. **Quality**: 4K PBR in a SurfaceAppearance |

The docs say it plainly: Texture Generator suits textures contextual to the asset; for repeating surfaces Material Generator may give better results.

## Prompt patterns that keep a project consistent

Write one **style suffix** and paste it on every prompt, for example: `hand-painted, soft stylized, muted colours, low contrast`. Then vary only the subject.

- **Materials:** add "top down", "close up", "texture" for flat tiles; "simple", "pattern", "flat" for clean repeats; "grayscale" when you want to tint later with part colour.
- **Textures:** describe parts and colours concretely ("dark oak body, brass hinges, red cloth strap"). The docs advise against prompting about geometry changes, the current texture, other scene objects, earlier generations, or reflectivity and transparency.
- **Image prompts** act as a style guide, not a template. A single reference sheet of your art style keeps results closer than words.
- Each *Generate* gives different results. Generate several, pick the closest, and record the exact prompt in your style guide.

## Before you generate (Texture Generator)

1. **UVs matter less than layout:** when texturing a Model of several MeshParts, they must form one sensible body; do not texture a scattered group, or several copies of one mesh in the same run.
2. Choose *View > Manual* and orbit so the most important side faces the camera before *Preview*.
3. Back up the asset. Do not edit it while generation runs; it can fail.
4. Use **Fast** for background props and blockout, **Quality** for close-up focal props.

## Clean-up checklist (after)

- **Memory:** a 4K Quality result per prop adds up fast. For anything not seen close up, re-export the maps at 1024 or 512 (see [[Texture Memory and Triangle Budgets for Roblox Scenes]]).
- **Value and roughness sanity:** compare albedo brightness and roughness to [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]]. Generated maps are often too contrasty or uniformly glossy.
- **Colour match:** pull the results toward your palette with part `Color` (for grayscale materials) or a quick hue/saturation pass in an image editor ([[Art - Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules]]).
- **Material scale:** set *Studs Per Tile* so bricks, planks and tiles match real-ish stud sizes across all variants.
- **Physics:** choose the right *Base Material* when saving a generated MaterialVariant, since it supplies default physical properties and footstep feel.
- **Naming:** rename generated variants and textures with your convention ([[Art - Naming Conventions for Meshes, Materials and Textures]]).

## Pitfalls

- Mixing 10 generated materials with 10 hand-made ones without a shared style suffix: visible style clash.
- Baked-in lighting in generated textures (strong shadows or highlights painted in) fighting real lighting; regenerate with "flat lighting, albedo" style terms or paint them out.
- Expecting identical output twice: save every keeper immediately.

## Related
[[Materials Textures - Hub]] - [[MaterialVariant and MaterialService - Custom Materials for Parts and Terrain]] - [[PBR Value Cheat Sheet - Albedo, Metalness and Roughness Ranges]] - [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]]
