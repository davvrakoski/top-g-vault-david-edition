---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
tags: [deep-dive, roblox, performance, textures, triangles, budgets, instancing]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Texture Memory and Triangle Budgets for Roblox Scenes

## Why this matters
On Roblox the slowest device in your audience sets the frame rate and memory ceiling, and many players are on mid- or entry-level phones. Scenes that look fine on a development PC can stutter, blur (texture streaming drops quality) or crash on phones.
Budgets turn "optimize later" into rules artists can follow while they build. This note combines Roblox's documented limits with measured numbers from the vault's own asset library.

---

## 1. Hard limits and official guidance

| Topic | Documented rule (Creator Docs) |
|---|---|
| Triangles per mesh | A single mesh can't exceed **20,000 triangles** |
| Texture upload size | Up to **4096×4096** |
| UV/texture map space | The same spec page's UV section lists **1024×1024** as the maximum supported pixel space for texture maps. The page is inconsistent with the 4096 upload limit; treat 1024 as the practical ceiling for mesh maps |
| Basic texture sizing | ~5×5-stud object → 256²; ~10×10 → 512²; ~20×20 → 1024² |
| PBR sizing | **256² per 2×2×2-stud space**; 512² at ~4×4×4; 1024² (max) at ~8×8×8 |
| Default texel density | Parts: 1024² across an 8×8-stud face; terrain: 512² across 8×8 studs |
| Downsampling | When many textures render at once, Roblox may downsample |
| Texture streaming | **Automatic**: baseline quality first, then raised per texture by importance (screen size) up to the device's memory budget. Supports MeshPart, SurfaceAppearance, Texture, Decal, MaterialVariant, Beam, ParticleEmitter and base materials |
| Atlases | Docs: favor **unique individual textures over atlases** unless the atlas is on batchable parts, because requesting high resolution for one region streams the whole atlas at that resolution |

Texture streaming means oversized textures cause blurriness and memory pressure rather than instant failure, which is why it's easy not to notice the problem.

---

## 2. What the vault library actually costs (measured 2026-10-25)

All **492** Poly Haven FBX files under `20 FBX Asset Library\Poly Haven` were imported in Blender 5.2 and triangle-counted:

| Measure | Result |
|---|---|
| Files where **every** mesh object is ≤ 20,000 tris (each can become a MeshPart) | **380 / 492** |
| Files whose **total** is ≤ 20,000 tris | 334 / 492 |
| Files with more than one material (imports as several MeshParts) | 133 / 492 |

By category (median total triangles per file):

| Category | Files | Every mesh ≤20k | Median tris | Max tris |
|---|---:|---:|---:|---:|
| Furniture | 64 | 60 | 4,504 | 61,096 |
| Props | 111 | 101 | 8,434 | 397,856 |
| Tools | 19 | 19 | 5,250 | 21,842 |
| Containers | 26 | 24 | 10,820 | 22,276 |
| Industrial | 47 | 39 | 14,280 | 200,610 |
| Decorative | 38 | 28 | 12,068 | 176,226 |
| Lighting | 22 | 16 | 10,902 | 30,610 |
| Rocks | 14 | 10 | 20,174 | 123,976 |
| Structures | 11 | 10 | 38,140 | 270,045 |
| **Nature** (trees, etc.) | 71 | **19** | **155,864** | **17,182,252** |
| **Plants** | 10 | 4 | 76,914 | 1,533,513 |
| Ships | 4 | 0 | 110,616 | 196,169 |

**Takeaways**
- Most furniture, props and tools pass the per-mesh limit as-is, but "passes the limit" ≠ "fits your scene budget". A 15k-tri chair repeated 40 times is 600k triangles.
- **Nature and plants are scan-dense** and need heavy decimation, LODs or replacement (Kenney Nature Kit pieces are a few hundred tris each).
- Kenney kits are tiny by comparison (measured: 12–304 tris for Modular Buildings pieces). Their cost is **instance count**, not triangles.

> The library hub's "Roblox-ready as-is" column shows 0 for Poly Haven. That likely reflects texture format (`.exr` maps) or total-file triangle counts rather than per-mesh counts. Treat the measurements above as the triangle picture, and convert textures per [[SurfaceAppearance PBR from Poly Haven Textures]].

---

## 3. Memory math you can do on a napkin

Roblox doesn't publish its GPU texture formats or compression. For **planning**, use uncompressed sizes as a worst case, then measure in the client:

| Map size | RGBA 8-bit | + mipmaps (~×1.33) |
|---|---:|---:|
| 256² | 0.25 MB | ~0.33 MB |
| 512² | 1 MB | ~1.33 MB |
| 1024² | 4 MB | ~5.3 MB |
| 2048² | 16 MB | ~21 MB |
| 4096² | 64 MB | ~85 MB |

A PBR set is 3–4 maps (colour, normal, roughness, metalness). **One unique 1024² PBR set ≈ 16–21 MB worst case; the same set at 512² ≈ 4–5 MB.** One hundred unique props at 1024² PBR is gigabytes on paper, which is why reuse matters more than any single asset.

**Measure, don't trust the napkin:** open the Developer Console (**F9**) › **Memory** and watch **GraphicsTexture** (texture memory) and **GraphicsMeshParts** (mesh memory). Compare a busy area against the spawn on a phone profile and on a real low-end device.

---

## 4. A budget sheet for a typical mobile-first game

These are starting budgets to **validate on your own target devices**. Roblox doesn't publish per-scene budgets:

| Budget | Starting target | How to check |
|---|---|---|
| Triangles visible in a busy view | 300k–800k | Render Stats (**Shift+F2**) in a client |
| Draw calls in a busy view | As low as practical; watch for spikes | Render Stats › Timing |
| Unique PBR sets in a zone | 20–40, mostly ≤512² | Asset audit script below |
| Hero assets at 1024² | A handful per zone | Art review |
| Transparent overlapping surfaces | Minimal | Visual check (overdraw) |
| Shadow-casting lights in view | Few | Lighting review |
| `RenderFidelity = Precise` | Near zero | Audit script |

---

## 5. Instancing: the biggest free win

The performance docs explain that Roblox **instances** identical meshes, cutting draw calls, when copies share the same mesh and material inputs. Copies with different mesh or texture IDs can't be instanced. The classic cause is importing a **whole scene at once** instead of importing each asset once and duplicating it in Studio.

Audit script (adapted from the docs) that groups MeshParts by name and asset IDs:

```lua
-- Command bar: find same-named meshes that don't share MeshId/TextureID (missed instancing)
local byName = {}
for _, d in workspace:GetDescendants() do
	if d:IsA("MeshPart") then
		local sa = d:FindFirstChildOfClass("SurfaceAppearance")
		local key = d.MeshId .. "|" .. d.TextureID .. "|" .. (sa and sa.ColorMap or "")
		byName[d.Name] = byName[d.Name] or {}
		byName[d.Name][key] = (byName[d.Name][key] or 0) + 1
	end
end
for name, variants in byName do
	local count = 0
	for _ in variants do count += 1 end
	if count > 1 then
		print(("%s has %d different mesh/texture combos (possible duplicates)"):format(name, count))
	end
end
```

Also from the docs: decals, textures and particles batch poorly; `ParticleEmitter` property changes can be expensive; and **too many `RenderFidelity = Precise`** meshes is a common triangle problem.

---

## 6. Reducing cost without visible loss

| Technique | When |
|---|---|
| Downsize maps to the PBR guidance (256 per 2 studs) | Always, first |
| Drop maps that do nothing (all-black metalness, flat normal) | Always |
| Share one material across variants (recolour via `MeshPart.Color` with Overlay alpha or vertex colours) | Prop families |
| Decimate in Blender (Decimate modifier, *Collapse*, ratio tuned per asset) | Scans over budget |
| Bake detail from high-poly into a normal map | Hero props |
| Vertex colours instead of textures | Stylized assets; the Blender docs note it reduces texture memory |
| Merge static, never-interacted clusters into one mesh | After layout lock |
| `CastShadow = false` on small props | Clutter |
| Leave `RenderFidelity = Automatic` | Almost always |
| Stream zones with `ModelStreamingMode` | Large maps |

---

## 7. Asset audit (run before each release)

```lua
-- Command bar: rough per-place texture inventory
local seen, counts = {}, { SurfaceAppearance = 0, MeshTexture = 0, Decal = 0, MaterialVariant = 0 }
local function add(kind, id)
	if id and id ~= "" and not seen[id] then
		seen[id] = true
		counts[kind] += 1
	end
end
for _, d in game:GetDescendants() do
	if d:IsA("SurfaceAppearance") then
		add("SurfaceAppearance", d.ColorMap); add("SurfaceAppearance", d.NormalMap)
		add("SurfaceAppearance", d.RoughnessMap); add("SurfaceAppearance", d.MetalnessMap)
	elseif d:IsA("MeshPart") then add("MeshTexture", d.TextureID)
	elseif d:IsA("Decal") or d:IsA("Texture") then add("Decal", d.Texture)
	elseif d:IsA("MaterialVariant") then add("MaterialVariant", d.ColorMap)
	end
end
for k, v in counts do print(k, "unique textures:", v) end
```

It counts unique texture IDs only; it can't see resolution. Pair it with an artist-maintained asset sheet listing map sizes.

---

## Common mistakes
- Treating the 20k-tri limit as a target instead of a ceiling.
- Shipping scan-dense nature assets (100k+ tris per tree) and duplicating them across a forest.
- Using 1024² or 4K maps on small props "because streaming handles it". Streaming lowers quality; it doesn't fix memory waste.
- Unique textures for every copy of a prop (no instancing).
- Importing a whole Blender scene in one go, which produces different IDs per copy.
- Big texture atlases on non-batchable parts (the whole atlas streams at the highest requested resolution).
- Only testing on a PC.

## Checklist
- [ ] Every mesh ≤ 20k tris; heavy categories decimated or replaced
- [ ] Map sizes follow the PBR guidance; useless maps dropped
- [ ] Assets imported once and duplicated in Studio (shared IDs)
- [ ] Instancing audit shows no unexpected duplicate combos
- [ ] Developer Console Memory (GraphicsTexture, GraphicsMeshParts) checked in the busiest zone on a phone profile
- [ ] Render Stats triangles and draw calls recorded for 3 key views
- [ ] `RenderFidelity` Precise audit near zero; small props no shadows
- [ ] Budget sheet updated per zone

---

**Sources checked (2026-10-25):** Creator Docs: Art › General specifications; Art › Texture specifications; Parts › Textures and decals (Texture streaming); Performance optimization › Improve (rendering, instancing, draw calls); Studio › Developer Console / memory usage (GraphicsTexture, GraphicsMeshParts). Vault library measured with Blender 5.2 (492 Poly Haven FBX, sample Kenney FBX).

**Related:** [[Materials Textures - Hub]] · [[Low, Mid, and High Poly Strategy]] · [[Optimization - Hub]] · [[Art Content Pipeline]] · [[Texture and PBR Specs — 2026 Snapshot]] · [[FBX Asset Library - Hub]]
