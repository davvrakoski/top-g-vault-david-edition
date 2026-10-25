---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/community-optimization-tips-fact-checked"
title: "Community Optimization Tips - Fact-Checked"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/how-to-optimize-your-game-explained/4708702
  - https://devforum.roblox.com/t/psa-dont-use-instancenew-with-parent-argument/30296
cssclasses: [tg-a40]
---

# Community Optimization Tips - Fact-Checked

"How to optimize your game" lists get posted constantly. A June 2026 one (@zurai02, 1.4k views) is typical: mostly right, a few half-truths. Here is each tip with a verdict, so you know which to apply blindly and which to measure.

| Tip from the list | Verdict | Notes |
|---|---|---|
| Set CollisionFidelity to Box for non-walkable decor; Hull for complex shapes | **Good** | Big win for detailed meshes players never stand on. |
| Set mesh RenderFidelity to Performance | **Situational** | It trades away visual detail. `Automatic` (distance-based) is the sane default; use Performance on background clutter and check it visually. |
| Avoid lots of semi-transparent or unanchored parts | **Good** | Transparency costs rendering (sorting/overdraw); every unanchored part is physics work. Anchor static scenery. |
| Merge repeated props into a single Union for instancing | **Wrong as written** | Engine instancing benefits come from many copies of the **same mesh asset**. Use one MeshPart and duplicate it; giant unions are often worse. |
| Turn on StreamingEnabled | **Good, with work** | Big memory win, but client code must be streaming-safe ([[StreamingEnabled Gotchas and Streaming-Safe Client Code]]). The list suggested letting an AI rewrite scripts for it; review those changes by hand. |
| CastShadow off on pebbles, grass, small decor | **Good** | Cheap, rarely noticed visually. |
| CanTouch / CanQuery off on scenery | **Good** | Fewer touch checks and fewer spatial-query candidates. CanQuery can only be turned off when CanCollide is off. |
| Use `--!strict` type checking | **Good for bugs, not speed** | It catches mistakes in the editor; it is not a runtime optimization by itself. |
| Add `--!optimize 2` | **Mostly pointless** | @emblazes pointed out live games already compile at level 2; the directive mainly changes Studio testing. |

## Tips the list missed (community favorites)

- **Profile first**: MicroProfiler and the Script Profiler tell you whether you are CPU, GPU, physics or network bound. Optimizing the wrong layer is the most common waste.
- **Set Parent last** when creating instances ([[Set Parent Last - The Instance.new Parent Argument]]).
- **Fewer per-frame loops**: one Heartbeat dispatcher beats 200 scripts each with their own loop.
- **Pool frequently spawned objects** ([[Object Pooling Without Making a Mess]]).

```lua
-- Command Bar helper (own code): disable shadows/touch/query on tagged decor in one pass
local CollectionService = game:GetService("CollectionService")
for _, part in CollectionService:GetTagged("Decor") do
	if part:IsA("BasePart") then
		part.CastShadow = false
		part.CanTouch = false
		if not part.CanCollide then
			part.CanQuery = false
		end
	end
end
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Performance Audit Procedure]] · [[MicroProfiler Reading Guide]] · [[Instance Count and Part Budgets]] · [[Mobile Performance Deep Dive]]

<!-- TDOD_GRAPH_END -->
