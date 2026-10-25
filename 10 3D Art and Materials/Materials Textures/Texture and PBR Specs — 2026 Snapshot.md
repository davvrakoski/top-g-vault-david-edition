---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
source_note: "07_3D_Art_Pipeline/02_Texture_PBR_Specs_2026"
title: "Texture and PBR Specs — 2026 Snapshot"
tags: [roblox, premium, "cluster/materials-textures"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Texture and PBR Specs — 2026 Snapshot

Roblox currently documents:
- uploaded texture files can support resolutions up to 4096×4096 in relevant general workflows
- manually reducing resolution can improve memory
- example guidance: small ~5×5 stud object 256², medium ~10×10 512², larger ~20×20 1024²
- SurfaceAppearance supports Color/Albedo, Normal, Roughness, Metalness, and Emissive Mask maps
- normal maps use OpenGL tangent-space convention
- a mesh uses a single UV set in the documented modeling workflow

Important: avatar/Marketplace/PBR validation can impose stricter per-map limits than generic image upload capability. Always use the current specification page for the asset category you are shipping.

Sources:
- https://create.roblox.com/docs/art/modeling/texture-specifications
- https://create.roblox.com/docs/art/modeling/surface-appearance

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Materials Textures - Hub]]

**Related notes:** [[Materials, PBR and Textures]] · [[Material Response Framework]] · [[Low, Mid, and High Poly Strategy]]

<!-- TDOD_GRAPH_END -->
