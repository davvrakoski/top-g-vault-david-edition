---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/place-to-rojo"
title: "Moving an Existing Place to Rojo - syncback and rbxlx-to-rojo"
tags: [roblox, community, tools, rojo, migration, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MPL-2.0 (Rojo and rbxlx-to-rojo)"
sources:
  - https://github.com/rojo-rbx/rojo/releases
  - https://github.com/rojo-rbx/rbxlx-to-rojo
cssclasses: [tg-a40]
---

# Moving an Existing Place to Rojo - syncback and rbxlx-to-rojo

The most common question after "should I use Rojo?" is "my game already exists in Studio, how do I get it into files?". Two free tools do it.

| Tool | Maintainer | Status | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| `rojo syncback` (built into Rojo **7.7.0+**) | rojo-rbx | New in 7.7.0; latest release v7.7.1 | MPL-2.0 | No - link only | https://github.com/rojo-rbx/rojo/releases |
| rbxlx-to-rojo | rojo-rbx | Older one-time converter (last push 2023-11) | MPL-2.0 | No - link only | https://github.com/rojo-rbx/rbxlx-to-rojo |

## Option A: `rojo syncback` (preferred in 2026)
- The Rojo 7.7.0 release notes describe it as built to solve the long-standing problem of turning an existing place file into a Rojo project.
- Configure it with the new **`syncbackRules`** field in the project file.
- It only pulls instances that sit **under nodes listed in your project file**, so map your services (ServerScriptService, ReplicatedStorage, ...) first.

## Option B: rbxlx-to-rojo (one-time)
1. In Studio: **File > Save to File As** and save a `.rbxl` or `.rbxlx`.
2. Make an empty output folder.
3. Run rbxlx-to-rojo, pick the place file, pick the folder.
4. It needs Rojo 0.5.0-alpha.12 or newer and fails if the place has no scripts.

## Migration checklist (both options)
- [ ] Back up the place (Version History plus a local file).
- [ ] Decide what stays **Studio-owned** (maps, terrain, big models) vs **file-owned** (code, config). Most teams sync code only and keep the map in the place.
- [ ] Commit the first conversion to Git **before** changing anything, so later diffs are readable.
- [ ] Open the synced project in a test place and play-test before switching the team over.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Git, Github, Rojo and Team Workflow]] · [[Argon - Two-Way Sync Alternative to Rojo]] · [[Place files]]

<!-- TDOD_GRAPH_END -->
