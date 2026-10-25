---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - Scene Analysis Walkthrough - Script, Animation, Audio Memory and Unparented Instances"
tags: [roblox, community-knowledge, performance, memory, studio-tools, profiling, scene-analysis]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/scene-analysis
  - https://create.roblox.com/docs/reference/engine/classes/SceneAnalysisService
  - https://create.roblox.com/docs/reference/engine/classes/HeapProfilerService
  - https://create.roblox.com/docs/studio/optimization/memory-usage
---
# Speed - Scene Analysis Walkthrough - Script, Animation, Audio Memory and Unparented Instances

Scene Analysis is a Studio window that answers "what is this place made of, and who is holding it in memory?" as a treemap, for the client or the server, during a play test. It is faster than digging through the Developer Console when you do not yet know where to look. This walkthrough runs it as a leak hunt and a scene audit, and shows the matching APIs for automating the same checks.

## Open it

**Window > Performance Summary > Scene Analysis**, then start a Play or Test session. Pick a mode; the treemap shows relative sizes and a list underneath. Right-click an item to jump to it in the Explorer (or select all instances that use an audio or animation asset). Use the search bar to filter by name.

## The six modes and what to look for

| Mode | Shows | Red flag |
|---|---|---|
| Script memory | Luau VM memory per Script / LocalScript / ModuleScript, grouped by location | one module growing during play |
| Unparented instances | count per class of instances that scripts still reference but are no longer in the DataModel | counts rising after repeated actions |
| Instance composition | instance counts by category (Characters, Geometry, Textures and more) and class | a class far bigger than expected (the docs' example: 25,000 particle emitters you did not mean to have) |
| Audio memory | memory per audio asset | music for areas the player is not in |
| Animation memory | loaded animation clip memory | clips for models that were destroyed |
| Triangle composition | triangles and draw calls by pass: Shadows, Opaque, Transparent, Terrain, Grass, Particles, Sky, UI | a pass dominating (for example shadows) |

The docs warn the triangle numbers on a powerful PC will not match a mid-range phone; use it for proportions, not budgets.

## Leak hunt routine

1. Start a test; open **Unparented instances** and **Script memory**. Note the totals.
2. Repeat one suspect action 20 times: open and close the shop, respawn, start and end a round.
3. Compare. Unparented counts are normal in small numbers (held references are not automatically bugs, and instances flagged for GC may briefly show under `Unknown`). A count that grows by roughly the repeat count is your leak, and the view names the **host script**.
4. Check **Animation memory**: the docs call animations one of the most common production leaks, typically scripts keeping tracks alive after their model was destroyed.
5. For allocation-level detail, follow up with the LuauHeap view in the Developer Console.

## Scene audit routine (before a release)

- **Instance composition** on the client after join: are there classes you did not expect? Free models and leftover test objects show up here.
- **Audio memory** in the busiest area: is anything loaded that the area does not play?
- **Triangle composition** at the most crowded viewpoint: which pass dominates?

## Automating it

`SceneAnalysisService` exposes the same data as nested tables (`Name`, `Size`, `Children`): `GetScriptMemoryAsync`, `GetUnparentedInstancesAsync`, `GetInstanceCompositionAsync`, `GetTriangleCompositionAsync`, `GetAnimationMemoryAsync`, `GetAudioMemoryAsync`. The docs say it is exposed through the Studio MCP server, which means an AI assistant connected to Studio can pull these numbers during a test. The reference does not state a security level, so whether game scripts can call it at runtime is (unverified); plan to use it from Studio tooling.

`HeapProfilerService` (PluginSecurity, so plugins and the command bar) captures a full Luau heap snapshot as JSON: `ServerRequestDataAsync()` for the server, `ClientRequestDataAsync(player)` for a client. Requesting one runs a full GC cycle first, and remote requests time out after 10 seconds. Saving two snapshots (before and after a repeated action) and diffing the `Report` sections is a scriptable leak test.

```lua
-- Command bar (server view): summarise script memory
local SA = game:GetService("SceneAnalysisService")
local tree = SA:GetScriptMemoryAsync()
for _, service in tree.Children do
	print(service.Name, math.floor(service.Size / 1024), "KB")
end
```

## Pitfalls

- Reading server memory in a Studio solo test: Studio runs both sides; use Team Test or a live server for real server numbers.
- Treating any unparented instance as a bug: pooled objects are intentionally unparented and referenced.
- Forgetting to repeat the action: one-off numbers cannot distinguish load from leak.

## Related
[[Performance - Hub]] · [[Developer Console Memory Categories Explained]] · [[Soak Tests - Long-Session Memory and Leak Checks]] · [[Speed - Connection Leak Finder - Counting Live Connections by Tag]]
