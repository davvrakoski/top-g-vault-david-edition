---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/draw-calls-mesh-instancing"
title: "Draw Calls and Mesh Instancing - Official Rules vs Forum Lore"
tags: [roblox, community, "cluster/performance-and-security", rendering, draw-calls]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://devforum.roblox.com/t/part-instancing-pre-release-announcement/130333
  - https://devforum.roblox.com/t/mesh-instancing/281502
  - https://devforum.roblox.com/t/does-roblox-use-mesh-instancing/399564
---
# Draw Calls and Mesh Instancing - Official Rules vs Forum Lore

"Do my 500 identical rocks cost 500 draw calls?" comes up on the DevForum every few months. This note sorts the answers into what the Creator Hub says today, what Roblox engineering announced back in 2018, and what is still just forum guesswork.

## How to see your draw calls

- In a client, press **Shift+F2** to open **Render Stats**. The **Timing** section shows the current draw call count. Studio has the same panel. (Creator Hub, *Improve performance*.)
- Look in the spot where FPS drops. The docs name **excessive object density** as a common cause: a dense area needs more draw calls to render.

## The current official rule (Creator Hub)

Meshes with the **same MeshContent** go into one draw call when:

1. their **SurfaceAppearance** is identical, if they have one; otherwise their **TextureContent** is identical, and
2. their **Material** is identical, when they have neither a SurfaceAppearance nor a TextureID.

The docs also warn about these:

- **Decals, textures and particles don't batch well.** Each one adds draw calls. Changing ParticleEmitter properties at runtime can hurt performance a lot.
- **Missed instancing.** Importing a whole scene in one go often gives every copy its own mesh or texture asset ID. Import one asset, then duplicate it inside Studio, so the copies share IDs.

## What the 2018 engineering announcement added

zeuxcg (a Roblox engineer) wrote the *Part instancing pre-release announcement* in May 2018 and updated it that July. The engine has changed since then, so read it as background, not as a spec:

- **Properties that kept a batch together:** CFrame, Size (with exceptions), Color/BrickColor, Reflectance. Color does not break instancing.
- **Batch wreckers:** MeshId, TextureId, Material, and above all **Transparency**. At the time, every transparent part got its own draw call. The update said overhead had been reduced, but it did not say the rule was gone.
- **Clustering:** the world was split into chunks of about 128×64×128 studs. The July update added instancing across clusters on desktop.
- **Cap:** about 512 instances per draw call, described as a limit "for now."
- **Lighting.Outlines** turned off part instancing for the whole place. Meshes and CSG were not affected.
- zeuxcg told developers **not** to design levels around cluster size, because those details could change.

## Forum claims, rated

| Claim seen on the DevForum | Status |
|---|---|
| Same MeshId means instanced (2019 replies) | **Incomplete.** The current docs also require matching texture or SurfaceAppearance, and material in some cases. |
| Colour does not matter (sircfenner, 2019) | Matches the 2018 announcement. The current docs don't list colour as a condition. |
| Transparent meshes are never instanced (XAXA, 2019, quoting the announcement) | That was true in 2018. Current docs don't say it, but the official overdraw warning about layered transparency still applies. Treat transparency as expensive. |
| Distant copies render separately | Outdated for desktop, per the July 2018 update. |

## Practical checklist

- Reuse **one** MeshId and one SurfaceAppearance or TextureID for every copy of a prop. A copy with its own texture ID costs an extra draw call.
- Prefer a few reusable kit pieces over many one-off meshes.
- Use Shift+F2 to check draw calls before and after a change. Don't guess.
- Keep semi-transparent glass, foliage cards and decals to the areas players actually look at.
- For distant scenery, the docs point to Model **LevelOfDetail = SLIM** with instance streaming on.

## Small audit script (Command Bar)

This script counts how many distinct mesh and texture pairs a folder uses. A high ratio of pairs to parts means few chances to instance.

```lua
-- Run in the Studio Command Bar. Change the root if you need to.
local root = workspace
local pairsSeen, parts = {}, 0
for _, inst in root:GetDescendants() do
	if inst:IsA("MeshPart") then
		parts += 1
		local sa = inst:FindFirstChildOfClass("SurfaceAppearance")
		local key = inst.MeshId .. "|" .. (sa and ("SA:" .. sa.ColorMap) or inst.TextureID) .. "|" .. inst.Material.Name
		pairsSeen[key] = (pairsSeen[key] or 0) + 1
	end
end
local unique = 0
for _ in pairsSeen do unique += 1 end
print(("MeshParts: %d, unique mesh/texture/material keys: %d"):format(parts, unique))
```

The key is only an approximation, since it compares the SurfaceAppearance ColorMap only. Use it to find hot spots, not as a draw call count.

## Credits

- Roblox Creator Hub, *Improve performance* (CC BY 4.0).
- zeuxcg, *Part instancing pre-release announcement*, DevForum, 2018.
- XAXA, Aotrou, sircfenner, Legoracer and others in the DevForum threads *Mesh Instancing* (2019) and *Does Roblox use mesh instancing?* (2019).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[Instance Count and Part Budgets]] · [[MicroProfiler Reading Guide]] · [[Improve performance]] · [[SLIM]]

<!-- TDOD_GRAPH_END -->
