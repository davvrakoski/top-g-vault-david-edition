---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "AI 3D Generators Compared - Roblox Cube, Meshy and Tripo - Cleanup and Licence Caveats"
tags: [roblox, community-knowledge, 3d-art, ai, generation, licensing, cube]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/model-generation
  - https://create.roblox.com/docs/reference/engine/classes/GenerationService
  - https://github.com/Roblox/cube
  - https://raw.githubusercontent.com/Roblox/cube/main/LICENSE
  - https://www.meshy.ai/terms-of-use
  - https://www.tripo3d.ai/blog/commercial-use-ai-3d-models
---
# AI 3D Generators Compared - Roblox Cube, Meshy and Tripo - Cleanup and Licence Caveats

Text- and image-to-3D tools can produce a textured prop in a minute. For Roblox they are three different things: a **built-in engine API** (Roblox's Cube model via `GenerationService`), a **research model** you can run yourself (Cube open weights), and **web services** (Meshy, Tripo and others) whose terms decide who owns the output. The vault already has a full Tripo pipeline ([[Tripo → Blender → Roblox Production Pipeline]]); this note compares the options and lists the licence traps.

## Option 1: Roblox's GenerationService (in Studio and in-game)

- `GenerationService:GenerateModelAsync(inputs, schema, options)` builds models from a `TextPrompt` and/or an `Image`. Optional inputs: `Size` (approximate), `MaxTriangles` (lower = more faceted low-poly look), `GenerateTextures` (default true).
- Schemas: `PredefinedSchema = "Car5"` (body + four wheels named for scripts) or `"Body1"` (one MeshPart), or a custom `SchemaDefinition` listing part groups.
- Results are normal Roblox instances, replicate to all players, and need no upload or licence check on your side, which makes this the cleanest choice for **player-generated content** and quick prototypes.
- `GenerateMeshAsync` is deprecated; use `GenerateModelAsync`. The older API documents per-minute rate limits and a prompt length limit, so plan for failures (wrap calls in `pcall`, show a retry message).
- Always rescale and anchor the result yourself; size is only approximate ([[Model generation]]).

## Option 2: Cube open weights (GitHub: Roblox/cube)

- Runs locally (Python, model weights from Hugging Face, roughly 16-24 GB of GPU memory per the README).
- **Licence: "Cube3D Research-Only RAIL-MS License"**, limited to academic or research purposes. Do **not** ship assets made with the self-hosted model in a commercial game on that basis; use the in-engine API instead.

## Option 3: web generators (licence summary, checked 2026-10-25)

| Service | Free plan | Paid plan |
|---|---|---|
| **Meshy** | Terms section 3.2: Meshy owns free-plan output and makes it available under **CC BY 4.0** with credit to Meshy; no private option | Customer owns output (to the extent law allows); can keep content private. Non-enterprise content may be used for training (section 2.9) |
| **Tripo** | Sources **conflict**: Tripo's own blog says free tier is CC BY 4.0, other pages say no commercial rights for free users (unverified; the terms page blocked our fetch) | Paid tiers grant commercial use per Tripo's help pages |

Practical rule: for anything sold or monetised, use a **paid plan** or the in-engine API, keep a screenshot/PDF of the terms on the day you generated, and log each asset in [[Asset and License Log Template]]. If you use CC BY output, credit the service in your game's credits ([[Attribution in Practice - Credits Screens and License Files]]).

## Content and IP caveats

- Prompts naming brands, characters or artists can reproduce protected designs. Generated look-alikes of famous characters are still a takedown risk.
- AI output is still subject to Roblox moderation and Community Standards when uploaded.

## Cleanup checklist (any generator)

1. **Scale and orientation:** set real size in studs, apply transforms, set the origin/pivot ([[Art - Pivots for Moving Props - Blender Origins, PivotOffset and Hinges]]).
2. **Triangles:** web outputs are often 20k-200k+; decimate or retopologise to budget ([[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]]). The import cap is 20,000 triangles per mesh.
3. **Geometry errors:** merge by distance, remove floating bits, fix non-manifold edges and flipped normals.
4. **Texture:** remove baked shadows and fake highlights; resize to 512-1024; rebuild roughness rather than trusting the generated one.
5. **Style match:** recolour to your palette ([[Art - Colour Palettes for a Consistent Look - Value, Saturation and Accent Rules]]); AI props from different prompts drift in colour and detail density.
6. **Collision:** Box or Hull; never precise on lumpy AI meshes.

## Pitfalls

- Treating "free tier" output as yours without reading the terms.
- Running the open-source Cube weights for a commercial game (research-only licence).
- Shipping 100k-triangle AI props because they "look fine in Studio" on a desktop GPU.

## Related
[[3D Modeling Blender - Hub]] - [[Tripo → Blender → Roblox Production Pipeline]] - [[Art - Retopology Basics - Turning Sculpts and AI Meshes into Game Meshes]] - [[Creative Commons for Game Assets - What Each License Allows]]
