---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/performance-hotkeys"
title: "Performance Hotkeys and Overlays - Quick Reference"
tags: [roblox, community, "cluster/performance-and-security", profiling, cheat-sheet]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/studio/developer-console
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
---
# Performance Hotkeys and Overlays - Quick Reference

Every "why is my game laggy" thread on the DevForum ends with someone asking "what do your stats say?" Here is every overlay key in one place. They're scattered across Creator Hub pages and community guides. **Test in a live client on a real device** whenever you can. Studio runs the server and client together, so its numbers come out higher.

## In a live client

| Keys (Windows / Mac) | Opens | Use it for | Source |
|---|---|---|---|
| **F9** (or the in-game menu) | Developer Console | Memory tab, Server Jobs (heartbeat), Server Stats (avg ping), Script Profiler, logs | Creator Hub *Developer Console* |
| **Shift+F2** | Render Stats | Draw (scene) draw calls and triangles; Draw (Shadow); Draw (UI) | Creator Hub *Improve performance* |
| **Shift+F3** | Network Stats | This client's ping. Press **Shift+1** repeatedly to cycle panels; the 4th panel is **Streaming** | Creator Hub *Instance streaming*, *Identify performance issues* |
| **Shift+F5** | Debug stats summary | Quick FPS and frame-time check | Creator Hub *Identify performance issues* |
| **Ctrl+Alt+F6 / ⌘⌥F6** | MicroProfiler | Frame dumps on device, then analyse on your PC | Creator Hub *Test on hardware* |
| **Ctrl+F7** | Stats panel with **Recv** and memory | Network receive KB/s (red at 50 KB/s) | MrChickenRocket, DevForum 2024 |
| Settings menu | Performance Stats overlay | FPS, memory and ping overlay for anyone | Creator Hub *Test on hardware* |

## In Studio

| Keys | Opens | Note |
|---|---|---|
| **Ctrl+F6 / ⌘F6** | MicroProfiler | Pause a frame with **Ctrl+P / ⌘P** |
| **Ctrl+Shift+F5 / ⌘Shift+F5** | Performance Summary overlay | Shows whether you're over budget |
| **Ctrl+F9 / ⌘F9** | Developer Console | |
| **Shift+Ctrl+F3 / Shift+⌘F3** | Network Stats in a playtest | Studio version of Shift+F3 |
| Settings, then **Physics**, then *Are Timesteps Shown* | Outlines parts by physics rate | For adaptive timestepping |

## A 5-minute triage using only these

1. **Shift+F5**: is FPS low? If not, check **F9 > Server Jobs** for heartbeat below 60. A slow server makes everyone's ping worse.
2. **Shift+F2**: are draw calls or triangles over your baseline budget? (See [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]].)
3. **Ctrl+F7 / Shift+F3**: is Recv approaching 40 KB/s? (See [[Network Receive Budget - 50 KB per Second and What Fills It]].)
4. **F9 > Memory**: is memory still climbing after you stop playing? (See [[Developer Console Memory Categories Explained]].)
5. **Ctrl+Alt+F6**: capture a dump at the worst moment and read it with [[MicroProfiler Reading Guide]].

Hotkeys sometimes change between Roblox releases. If a key does nothing, check the current Creator Hub page linked above.

## Credits

Roblox Creator Hub: *Identify performance issues*, *Improve performance*, *Instance streaming*, *Test on hardware*, *Developer Console*, *Adaptive timestepping* (CC BY 4.0). MrChickenRocket (Peter McNeill), DevForum guest article, 2024.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[MicroProfiler Reading Guide]] · [[Developer Console Memory Categories Explained]] · [[Performance Audit Procedure]] · [[Identify performance issues]] · [[Developer Console]]

<!-- TDOD_GRAPH_END -->
