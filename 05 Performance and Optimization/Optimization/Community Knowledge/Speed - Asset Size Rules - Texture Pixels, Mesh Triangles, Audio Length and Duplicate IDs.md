---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Asset Size Rules - Texture Pixels, Mesh Triangles, Audio Length and Duplicate IDs"
tags: [roblox, community-knowledge, optimization, assets, textures, meshes, audio, memory]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/art/modeling/texture-specifications
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/audio/assets
  - https://create.roblox.com/docs/performance-optimization/identify
---
# Speed - Asset Size Rules - Texture Pixels, Mesh Triangles, Audio Length and Duplicate IDs

Most client memory in a finished game is assets: textures, meshes and sounds. The surprise for many creators is that **file size on disk does not predict memory**. A 200 KB JPG and a 4 MB PNG at the same resolution cost the same graphics memory once loaded. This note collects the rules that actually move memory, with the official limits, so you can set upload standards for your team before the art pile grows.

## Textures: pixels are the cost

- The Creator Hub states that graphics memory depends on **pixel count**, not file size. A 1024x1024 texture uses **4x** the memory of 512x512.
- Images are **transcoded to a fixed format** on upload, so saving as 8-bit, stripping alpha or compressing before upload shrinks the download but **not** memory.
- Supported upload resolution: up to 4096x4096 per the texture specification page (the same page's UV section still says 1024x1024 for texture map space; treat 1024 as the practical maximum for in-game maps and recheck before relying on 4K).
- The engine starts with low-quality versions and ramps up based on device memory, distance and screen size, but sizing correctly still matters.

**Sizing guide (official):**

| Object size | Texture |
|---|---|
| ~5x5 studs | 256x256 |
| ~10x10 studs | 512x512 |
| ~20x20 studs | 1024x1024 |
| Minor UI images | under 256x256 |
| Anything not filling much of the screen | at most 512x512 |

PBR (SurfaceAppearance): budget 256x256 per 2x2x2 studs of asset; 1024x1024 is the maximum tier (full characters). Each extra map (normal, roughness, metalness) is another texture in memory, so skip maps you do not need.

**Cheap wins**
- One tintable texture plus `SurfaceAppearance.Color` instead of one texture per colour.
- Trim sheets for architecture; sprite sheets for UI icons with `ImageRectOffset` / `ImageRectSize`.
- Built-in materials over custom textures where the look allows; they use far less memory.

## Meshes

- A single mesh cannot exceed **20,000 triangles** (general specifications).
- Each unique mesh ID is its own memory and draw-call cost. Reuse one mesh at many sizes and rotations instead of importing variants.
- The 3D Importer does not de-duplicate: importing a whole map with 400 identical floor tiles creates 400 mesh assets. Import one tile and clone it.
- Collision geometry is memory too; see the collision fidelity notes.

## Audio

- Upload limits: under **20 MB** and **7 minutes**, sample rate at most **48 kHz**, mono or stereo (and some surround layouts).
- The Creator Hub lists audio as a surprising memory contributor when a game loads all of it up front. Load music and ambience per area; keep one-shot effects short.
- Memory for a track unloads when no instances reference it any more (Scene Analysis audio view).

## Duplicates: the silent multiplier

The same image or mesh uploaded twice gets two IDs and loads twice. The docs suggest collecting every image ID in the place, downloading and comparing them with an external tool, and sorting unique mesh IDs by size to spot duplicates. Using packages for shared assets prevents most of it.

```lua
-- Command bar: count unique texture IDs by property
local ids = {}
for _, d in game:GetDescendants() do
	local ok, v = pcall(function()
		return d:IsA("Decal") and d.Texture
			or d:IsA("MeshPart") and d.TextureID
			or (d:IsA("ImageLabel") or d:IsA("ImageButton")) and d.Image
	end)
	if ok and typeof(v) == "string" and v ~= "" then ids[v] = (ids[v] or 0) + 1 end
end
local n = 0; for _ in ids do n += 1 end
print("unique image ids:", n)
```

## Upload checklist for the team

- [ ] Texture size chosen from the object-size table, not "as big as possible"
- [ ] No per-colour duplicates; tint instead
- [ ] Mesh under 20k triangles, one ID per shape
- [ ] Map pieces imported once and cloned
- [ ] Audio trimmed, 48 kHz or lower, loaded per area
- [ ] Check `GraphicsTexture`, `GraphicsMeshParts` and `Sounds` in F9 Memory after adding content

## Related
[[Optimization - Hub]] · [[Developer Console Memory Categories Explained]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]] · [[Unions vs MeshParts - When CSG Costs More Than It Saves]]
