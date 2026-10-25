---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Developer Console Memory Categories Explained"
tags: [deep-dive, roblox, memory, developer-console, luauheap, profiling]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Developer Console Memory Categories Explained

**Why this matters:** client crashes on phones and slow, climbing server memory are both memory problems, and the Developer Console tells you exactly which category is responsible if you know how to read it.
This note explains every PlaceMemory category in plain terms (what fills it, what shrinks it), how to use the LuauHeap snapshots to find leaks, how to tag your own systems, and how to log memory from live servers.

---

## 1. Where to look

Open the Developer Console with **F9** in the client (or Studio). Two tools matter here:

- **Memory**: live MB per category, with a chart per category over time. Switch **Client** / **Server** with the dropdown.
- **LuauHeap**: snapshots of the Luau heap (your scripts' tables, functions, threads, and the instances they reference), with several analysis views and snapshot comparison.

Read the **client** numbers on a real device, not Studio: Studio runs editor, server and client together and inflates everything. Roblox's own guidance is to use the client for accurate readouts.

---

## 2. The top-level groups

| Group | What it is | Can you change it? |
| --- | --- | --- |
| **CoreMemory** | Engine internals: networking, avatars, core GUI | Indirectly (fewer avatars, less replication) |
| **PlaceMemory** | What you built: instances, parts, meshes, textures, sounds, terrain, scripts | **Yes, this is your main target** |
| **PlaceScriptMemory** | Memory per script and per custom memory tag | **Yes** |
| **CoreScriptMemory** | Roblox's own scripts | No |
| **UntrackedMemory** | Allocations the engine cannot attribute | Rarely; watch for growth |

PlaceMemory and PlaceScriptMemory are where optimisation happens.

---

## 3. PlaceMemory categories, decoded

Descriptions are from the Roblox memory usage docs; the "fills it" and "shrinks it" columns are practical guidance.

| Category | What it is | Usually filled by | How to shrink it |
| --- | --- | --- | --- |
| **HttpCache** | Assets downloaded from Roblox and cached in memory | Many unique images, meshes, audio | Reuse assets; fewer unique decals/textures; streaming |
| **Instances** | Every Instance in the place | Unbounded spawning, UI rebuilt on every open, debris never destroyed | Destroy what you are done with; pool; streaming ([[Instance Count and Part Budgets]]) |
| **Signals** | Event connections between instances | Connections never disconnected | Cleanup containers per lifetime ([[Signals, Connections and Leak-Proof Cleanup]]) |
| **LuaHeap** | Heap for core and custom scripts | Large tables, caches that only grow, leaked closures | LuauHeap snapshots (section 5) |
| **Script** | Luau scripts themselves (bytecode, native code) | Huge numbers of scripts; `--!native` everywhere | One script per system, not per part; native only where it pays |
| **PhysicsCollision** | Collision data | Precise collision fidelity on many meshes | `Box`/`Hull` fidelity; `CanCollide`/`CanTouch`/`CanQuery` off when unused |
| **PhysicsParts** | Physics geometry and kinetics | Many unanchored or complex-collision parts | Anchor static parts; reduce collision fidelity |
| **GraphicsSolidModels** | Render data for solid models (unions) | Many CSG unions | Convert heavy unions to meshes |
| **GraphicsMeshParts** | Render data for MeshParts | Many unique, high-poly meshes | Reuse the same mesh asset (instancing); LOD; streaming |
| **GraphicsParticles** | Particle systems | Many emitters, high rates, big textures | Fewer emitters; lower rate; pool VFX ([[VFX Performance, LOD and Pooling]]) |
| **GraphicsParts** | Render data for parts | Very high part counts | Merge static detail into meshes; streaming |
| **GraphicsSpatialHash** | General rendering structures | Large numbers of renderable objects | Fewer objects in the world at once |
| **GraphicsTerrain** | Terrain rendering | Large detailed terrain | Smaller playable terrain; streaming |
| **GraphicsTexture** | Texture memory | Many unique and high-resolution textures | Smaller textures, shared atlases, fewer unique SurfaceAppearances |
| **GraphicsTextureCharacter** | Character texture memory | Many avatars with layered clothing | Avatar settings; SLIM avatars for distant characters |
| **Sounds** | In-memory sounds | Many loaded sound assets | Unload unused sounds; fewer unique clips |
| **StreamingSounds** | Streamed audio | Long music tracks | Usually fine; watch counts |
| **TerrainVoxels** | Terrain voxel data | Big terrain volumes | Trim unused terrain |
| **TerrainPhysics** | Terrain physics | Big collidable terrain | Same |
| **Gui** | Common GUI elements | Hundreds of frames/images, duplicated screens | Reuse screens, virtualise long lists |
| **Animation** | Animation data (poses, cached KeyframeSequences) | Many unique animations loaded | Load only what the current mode uses |
| **Navigation** | Pathfinding structures | Large navmeshes, many agents | Fewer `ComputeAsync` calls, smaller areas |

The `Enum.DeveloperMemoryTag` enum (used by the `Stats` API, section 6) also exposes `BaseParts`, `GeometryCSG`, `GraphicsSlimModels` and an `Internal` tag, so names in scripts may differ slightly from the console labels.

Roblox's identify-performance guide highlights **GraphicsMeshParts**, **GraphicsTexture** and **Sounds** as the usual big client consumers, because assets dominate client memory. Its highest-impact recommendation for asset memory is enabling **instance streaming** ([[StreamingEnabled Gotchas and Streaming-Safe Client Code]]).

---

## 4. Reading the charts: leak or load?

Expand a category to see its chart. Classify the shape:

- **Step up, then flat**: loading content (new area, new round). Normal.
- **Sawtooth that returns to baseline**: allocate and free per round. Normal.
- **Staircase that never comes down**: something is retained every cycle. A leak.
- **Steady linear climb on the server**: per-player data or connections not cleaned up on leave. A leak that scales with player churn.

The test that settles it: repeat one action 50-100 times (open/close a menu, spawn/despawn an NPC wave, join/leave with test accounts) and compare the category before and after, allowing time for garbage collection ([[Memory grows over time]]).

---

## 5. LuauHeap: finding what holds the memory

Take a snapshot (**Create Snapshot**), do the suspect action many times, take another, compare. Views:

| View | Shows | Use it to |
| --- | --- | --- |
| **Graph** | Tree of objects from the `registry` root with **Size** (self + contents) and **Self** | See which module or function owns the big tables |
| **Object Tags** | Totals by Luau type (`table`, `function`, `thread`, ...) | Spot thousands of leaked threads or closures |
| **Memory Categories** | Totals by memory category (script name by default, or your custom tags) | Attribute heap to systems |
| **Object Classes** | Totals by engine class referenced from Luau (`CFrame`, `Animation`, ...) | Find hoarded userdata |
| **Unique References / Unparented Instances** | Instances with **no parent** still reachable from scripts, with the path that pins them | Find destroyed-but-referenced instances (classic leak) |

Graph node names you will see: `Module @Path.To.Module` (a module's returned table), `name:123 =Path.To.Script` (a function in that script; anonymous functions have no name), `upvalue` (captured variables), `[key]` (objects used as table keys), `stack`, `constants`. Nodes under 2 KB are grouped as `...`.

Typical leak signature: **Unparented Instances** grows each cycle, and the pinning path ends in an `upvalue` of a function connected to a long-lived signal. The fix is disconnecting that connection when its owner ends.

---

## 6. Tag your own systems

By default heap memory is categorised by script name. Tag threads by system so the Memory Categories view and PlaceScriptMemory speak your language:

```luau
--!strict
-- At the start of each long-lived thread of a system.
debug.setmemorycategory("Inventory")
-- ... allocations made by this thread now count under "Inventory" ...
debug.resetmemorycategory()
```

Set the category at the top of each system's main thread and inside its spawned workers (each thread has its own current category). Use a small fixed set of names (one per system).

---

## 7. Logging memory from live servers

The console shows one server at a time. For trends across all servers, log from code using the `Stats` service:

```luau
--!strict
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")

local WATCH: { Enum.DeveloperMemoryTag } = {
	Enum.DeveloperMemoryTag.Instances,
	Enum.DeveloperMemoryTag.LuaHeap,
	Enum.DeveloperMemoryTag.Signals,
	Enum.DeveloperMemoryTag.BaseParts, -- the enum has no PhysicsParts item (that name is console-only)
}

task.spawn(function()
	while true do
		task.wait(300)
		local parts = { ("total=%.0fMB players=%d instances=%d"):format(
			Stats:GetTotalMemoryUsageMb(), #Players:GetPlayers(), Stats.InstanceCount) }
		for _, tag in WATCH do
			table.insert(parts, ("%s=%.1f"):format(tag.Name, Stats:GetMemoryUsageMbForTag(tag)))
		end
		print("[MemWatch] " .. table.concat(parts, " "))
	end
end)
```

Notes from the `Stats` reference: per-tag APIs return 0 (with a warning) when `Stats.MemoryTrackingEnabled` is false, and `GetTotalMemoryUsageMb` comes from the operating system, so it will not equal the sum of tags. Send these lines to your logging pipeline rather than relying on Output ([[Observability and Debug Logging]]).

**Server memory budget**: Roblox documents total server memory as `6.25 GiB + 100 MiB x largest number of connected players` and recommends staying **below 50%** of it. A 30-player server has about 9.18 GiB; aim to stay under ~4.6 GiB. Servers gain memory as players join but do not lose it when they leave. Watch the Performance Dashboard for server memory and for client crash rates; Roblox suggests investigating if crash rates rise above **2-3%**, especially right after an update.

---

## 8. Quick triage table

| Symptom | First category to check | Likely fix |
| --- | --- | --- |
| Phones crash on join | GraphicsTexture, GraphicsMeshParts, HttpCache | Streaming, smaller/shared textures, fewer unique meshes |
| Phones crash after 20+ minutes | Instances, LuaHeap, Signals | Leak hunt with LuauHeap |
| Server memory climbs with player churn | LuaHeap, Signals, Instances (server) | Clean per-player tables and connections on leave |
| Memory jumps when a menu opens | Gui, HttpCache | Build UI once, reuse; lazy-load images |
| Physics memory high | PhysicsParts, PhysicsCollision | Anchor, Box fidelity, disable unused collision flags |
| Spikes with many players | GraphicsTextureCharacter | Avatar scaling/settings, SLIM avatars |

---

## Common mistakes

- Reading Studio memory numbers as if they were phone numbers.
- Calling a step-up a leak (or a staircase "just caching").
- Only checking totals; categories tell you what to fix.
- Forgetting the server tab; server leaks hurt every player in that server.
- Taking one LuauHeap snapshot instead of comparing two around a repeated action.
- Setting memory categories with dynamic names (per player), creating noise.
- Optimising textures when the real problem is 40,000 instances.

## Checklist

- [ ] Baseline memory per category recorded on target devices for each major area.
- [ ] 100-cycle leak tests for menus, rounds, NPC waves and join/leave.
- [ ] LuauHeap before/after snapshots for any suspected leak.
- [ ] Systems tagged with `debug.setmemorycategory`.
- [ ] Live servers log total, instance count and key tags every few minutes.
- [ ] Server memory kept under 50% of the documented allowance.
- [ ] Crash rate watched on the Performance Dashboard after every release.

**Related:** [[Performance - Hub]] · [[Memory grows over time]] · [[Memory Leaks and Lifecycle Management]] · [[Mobile Performance Deep Dive]] · [[Performance Budget Template]]

> Updated 2026-10-25: code sample used `Enum.DeveloperMemoryTag.PhysicsParts`, which does not exist (script error); changed to `BaseParts` (source: https://create.roblox.com/docs/reference/engine/enums/DeveloperMemoryTag)
