---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "MicroProfiler Reading Guide"
tags: [deep-dive, roblox, microprofiler, profiling, frame-time, performance]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# MicroProfiler Reading Guide

**Why this matters:** "the game lags" is not actionable; "the 38 ms spike every 2 seconds is `Simulation/physicsSteppedTotal` caused by a ragdoll pile" is, and the MicroProfiler is the tool that turns the first sentence into the second.
This guide teaches you to open it on the right device, read the frame graph and timeline, recognise the labels that matter, add your own labels, profile the server, and compare captures before and after a fix.

It complements [[Performance Audit Procedure]] (the process) and [[Performance and Profiling]] (the overview).

---

## 1. Frame budgets you are aiming for

| Target FPS | Frame budget |
| --- | --- |
| 30 | 33.3 ms |
| 60 | 16.7 ms |
| 120 | 8.3 ms |

The MicroProfiler is about **frame time**, and especially **consistency**. Roblox's docs give the example of 59 frames at 10 ms and one at 410 ms: the average looks like 60 FPS, the player feels a huge stutter. Spikes matter more than averages.

---

## 2. Open it on the right device

- **Studio and desktop client**: `Ctrl+F6` (`Cmd+F6` on Mac) toggles it (the official walkthrough also uses `Ctrl+Alt+F6`; if one does nothing, try the other). `Ctrl+P` pauses and drops into the detailed view.
- **Mobile client**: Settings > MicroProfiler **On**, then on a computer on the **same network** open the shown address and port (for example `172.18.56.105:1338`) in a browser. Append `/90` (or another number) to capture more than the default 30 frames.
- **Server**: from the desktop client in a game you can edit, open the Developer Console (`F9`), choose **MicroProfiler**, **Server** tab, set frames (max 60) and a delay (max 4 s), then **Begin server recording**. The console prints the dump path.

Profile on a **mid-range phone or tablet** whenever possible. A gaming PC hides problems, especially with a 60 FPS cap: a 4 ms frame and a 16 ms frame both look perfect, while the 16 ms one is a 40 ms frame on a phone. Studio itself adds overhead and runs server and client in one process, so use it for quick checks, not final numbers.

---

## 3. The frame graph: colours and what they mean

Each bar is one frame; taller is slower; newest on the right.

| Bar colour | Meaning (from Roblox docs) | Usual suspects |
| --- | --- | --- |
| **Orange** | Jobs wall time exceeded render wall time: worker threads (scripts, physics, animation) were the bottleneck | Scripts, physics, humanoids, animation |
| **Blue** | Render wall time exceeded jobs: the main render thread was the bottleneck | Too many objects in view, moving parts, lighting/shadows |
| **Red** | Render-bound **and** GPU wait above 2.5 ms | Overdraw, huge textures, heavy effects, high-resolution rendering |

There is no "good" colour. A mix is fine if you meet your frame budget. Colours tell you **where to look** when you do not.

Two shapes to recognise:

- **Uniformly tall bars**: something runs **every frame** (a Heartbeat loop, constant raycasts, too many animated rigs). Fix by doing less per frame.
- **Periodic spikes**: something runs **occasionally** (an autosave serialising a big table, a wave spawner cloning 50 NPCs, garbage collection, a streaming burst). Fix by spreading the work across frames or pre-warming.

---

## 4. The timeline: reading the detail

After pausing, the timeline shows every labelled task in the selected frames.

- **Rows are threads.** Look for **Main** (RBX Main: input, humanoids, animation, physics ownership, sound, waiting script resumes), **Worker** threads (networking, physics, pathfinding; many are asleep), and the **Render** thread (prepare, perform, present).
- **Labels stack**: a label below another is part of it. Always drill down to the **widest child**; a parent can never be shorter than its children.
- **Navigation**: drag to pan, scroll to zoom, right-click a label to zoom to exactly its duration, `Ctrl+F` to jump to the longest occurrence of a label across the capture.
- **Filters**: the Groups and Threads menus hide noise. Start with only Main + Render, then add workers.
- **Timers mode** lists every label with time and call counts. Sort by total time to find small tasks that run thousands of times.

---

## 5. Labels worth memorising

From Roblox's MicroProfiler tag reference, grouped by what you would fix:

| Label | What it is | Typical fix |
| --- | --- | --- |
| `Simulation/gameStepped/stepHumanoid` | Humanoid state and movement | Fewer Humanoids; disable unused states (Climbing, Swimming) on NPCs; simpler NPC controllers |
| `Simulation/gameStepped/stepAnimation` | Animators stepping tracks | Fewer animated rigs, animation LOD for distant NPCs |
| `Simulation/gameStepped/RunService.Stepped` | Your `Stepped` callbacks | Reduce work; spread across frames |
| `Render/PreRender/fireBindToRenderSteppedCallbacks` | Your `BindToRenderStep` / pre-render code | Keep only camera/input-critical work here |
| `WaitingHybridScriptJob` | Resuming waiting scripts (`task.wait`, events) | Fewer threads waking every frame |
| `GC` | Luau garbage collection | Allocate less per frame: reuse tables, avoid creating closures/Vector3s in hot loops |
| `Simulation/physicsSteppedTotal/physicsStepped/...` (`worldStep/stepContacts`, `SpatialFilter/filterStep`) | Physics solver and contacts | Fewer moving/colliding parts, simpler collision fidelity, sleep, no self-collision in ragdolls |
| `Simulation/assemble` | Rebuilding assemblies after joints change | Avoid creating/breaking welds every frame |
| `Simulation/handleFallenParts` | Parts below the kill plane | Destroy fallen debris |
| `rasterizeTile`, `computePath` | Pathfinding tiles and paths | Fewer `ComputeAsync` calls, reuse paths, avoid moving obstacles that invalidate tiles |
| `Net PacketReceive`, `Replicator/ProcessPackets` | Receiving/applying replication | Replicate less: fewer property changes, fewer instances |
| `Allocate Bandwidth and Run Senders/Dispatch Data Senders` | Sending property changes, remotes, new instances | Batch remotes, stop writing unchanged properties/attributes |
| `.../Dispatch StreamJob` | Streaming regions to clients | Lower streaming radii, fewer replication foci |
| `Perform/Scene/computeLightingPerform` (`LightGridCPU`, `ShadowMapSystem`) | Lighting and shadow work | Fewer shadow-casting lights, smaller light ranges |
| `Prepare/UpdatePrepare/updateDynamicParts` | Moving parts being prepared for render | Fewer moving parts; anchor static ones |
| `Perform/fillGuiVertices`, `Perform/Scene/UI` | UI geometry | Fewer UI elements changing every frame |
| `Perform/Present/waitUntilCompleted` | CPU waiting for the GPU | GPU-bound: overdraw, transparency, particles, textures |
| `LoadImage` | Decoding images | Fewer and smaller textures, preload outside gameplay |

Script work shows up under script labels that include the script name. When a script label is wide, add your own labels inside it (next section).

---

## 6. Custom labels: make your code readable in the profiler

```luau
--!strict
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function(dt)
	debug.profilebegin("AI.Tick")

	debug.profilebegin("AI.Sense")
	senseAll(dt)
	debug.profileend()

	debug.profilebegin("AI.Decide")
	decideAll(dt)
	debug.profileend()

	debug.profilebegin("AI.Move")
	moveAll(dt)
	debug.profileend()

	debug.profileend()
end)
```

Rules:

- Every `profilebegin` needs exactly one `profileend` on **every** path, including early returns. A missing end corrupts the rest of the frame's hierarchy.
- Use stable **`System.Phase`** names. Do not put dynamic strings (player names, counts) in labels; each unique string becomes a new label.
- Labels are cheap but not free; label systems and phases, not every function call.
- Labels work in parallel code too, which is how you confirm Parallel Luau work is spread across worker threads ([[Parallel Luau Actors - A Worked Example]]).

---

## 7. A repeatable workflow

1. **Reproduce the worst realistic case**: full server, most NPCs, busiest area, the target device. An empty baseplate tells you nothing.
2. **Open the overlay** (`Ctrl+Shift+F5` shows the Performance Summary in Studio) to see whether you are over budget at all.
3. **Capture**: open the MicroProfiler, let it run through the problem, pause.
4. **Classify**: sustained or spiky? orange, blue or red?
5. **Drill**: widest label, then its widest child, down to something you can name. For spikes, click the tallest bar to jump to it.
6. **Hypothesise and label**: add `debug.profilebegin` labels around the suspect code; re-capture to confirm.
7. **Fix one thing**, re-capture under the same conditions, compare.
8. **Record** before/after numbers in your performance log ([[Performance Log Template]]).

---

## 8. Dumps, flame graphs and diffs

- **Save to file / Dump** writes an HTML file (on Windows under `%LOCALAPPDATA%\Roblox\logs`). Dumps contain the selected frames only, except counters mode which covers the whole session.
- Open dumps in a browser for the **web UI**, which has extras: **X-Ray** (colours frames by memory allocation; press `C` to toggle size vs count), **Export** to CPU or memory **flame graphs**, and **Groups**/**Threads** modes.
- **Diff**: drag a second dump onto the web UI to build a diff flame graph, then **Combine & Compare**. Combine several dumps per side (for example four before and four after an update) for a steadier comparison; never combine dumps from different places.
- Flame graphs are the best way to find **death by a thousand cuts**: tasks that never cause a spike but run so often that their total dominates.
- In Studio you can also ask the built-in Assistant to analyse a paused capture; treat its report as a starting hypothesis and verify it with labels.

---

## 9. Reading GC and allocation problems

A `GC` label that grows, or X-Ray showing heavy allocation every frame, means your code creates garbage in hot paths. Common sources:

- Building new tables per frame (`{}` in Heartbeat, `table.insert` into fresh arrays).
- Creating closures inside loops (`for ... do connect(function() ... end) end` per frame).
- String concatenation in loops; `string.format` for debug text every frame.
- `GetChildren()`/`GetDescendants()`/`GetTagged()` every frame (each returns a new array).

Fix by caching arrays, reusing scratch tables (`table.clear`), hoisting closures, and maintaining sets incrementally. See [[Script Profiler, Native Code Gen and Luau Hot Paths]].

---

## Common mistakes

- Profiling only in Studio on a fast PC and declaring victory.
- Reading the average FPS instead of the tallest bars.
- Stopping at a parent label ("Heartbeat is slow") instead of drilling to the widest child.
- Unbalanced `profilebegin`/`profileend` after an early `return`.
- Dynamic label strings that explode the label list.
- Changing three things between captures, so you cannot tell what helped.
- Ignoring the server: lag can be server frame time, visible as rubber-banding rather than low FPS.
- Comparing captures taken in different scenes or with different player counts.

## Checklist

- [ ] Frame budget chosen per platform (for example 16.7 ms desktop, 33.3 ms low-end mobile).
- [ ] Captures taken on a real mid-range mobile device and on a full server.
- [ ] Spike vs sustained and colour classified before guessing.
- [ ] Every major system has `System.Phase` labels.
- [ ] Before/after dumps saved and diffed for each optimisation.
- [ ] Results written to the performance log.

**Related:** [[Performance - Hub]] · [[Performance and Profiling]] · [[Performance Audit Procedure]] · [[Mobile FPS collapses]] · [[Mobile Performance Deep Dive]]
