---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/big-servers"
title: "Big Servers - Lessons from 100 to 300 Player Sessions"
tags: [roblox, community, "cluster/performance-and-security", server-performance, scaling]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/optimization-tips-for-300-player-sessions/4042542
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/cloud-services/extended-services
---
# Big Servers - Lessons from 100 to 300 Player Sessions

Large servers fail differently from small ones. Costs that scale **per player times per player** (everyone replicating to everyone, every hit checked against every character) blow up long before CPU per player becomes the limit. This note pairs a 2025 DevForum case with the Creator Hub's server-compute guidance.

## The case: a 300-player event game

Vystee (DevForum, Nov 2025) was hired to fix a community game-night game that peaks at **300+ players in one server for about 30 minutes**. Symptoms: **server replies took up to 7 seconds**. The setup: standard Humanoids for 200+ players constantly moving and jumping, **three admin systems** loaded at once (HD Admin, Kohl's Admin, Adonis), contact-damage swords, and an idea for a "master server" sending commands over MessagingService.

### What the replies recommended

- **Client handles visuals; the server only handles what must stay in sync** (gravyMeister).
- **StreamingEnabled is essential** at this scale (GrandiusOptimizus).
- **Send less:** only the data that matters, and that includes server-side property sets, which replicate too. Pack data with buffers or `bit32` (GrandiusOptimizus).
- Use **several focused RemoteEvents** rather than one dispatcher remote for everything (GrandiusOptimizus said this cuts dispatch overhead).
- Move read-heavy work that doesn't write to instances into **Parallel Luau**. Try **native codegen** for heavy maths.
- **Drop Humanoids** and use a custom character controller where feasible (GrandiusOptimizus). That's a big rewrite, so weigh it against the event's lifespan.
- Avoid "bloatware" modules and single-script setups, and **trust only what profiling shows**.
- halosviel's hygiene list: audit free models and kits, use object pooling, reuse TweenInfo objects, parent new instances last, avoid `while wait() do`.
- Not mentioned in the replies, but clearly worth doing: **one admin system, not three.** Each one loads its own remotes, loops and UI.

## Official server-compute facts (Creator Hub)

- **Server heartbeat is capped at 60 FPS.** Check *Steps Per Sec* on the Heartbeat row in the Developer Console's **Server Jobs** tab, or look for frames over **16.67 ms** in the MicroProfiler.
- A slow server frame **raises everyone's ping**, because network processing waits for the frame to finish. That matches the 7-second replies in the case above.
- Every server gets a default amount of CPU that **grows with each player**. **Extended Services for Compute** more than doubles the per-player CPU. The docs say most games see no benefit; it helps games with heavy server physics or extensive server authority. Check persistent heartbeat drops and core utilisation on the Performance dashboard first, and **cut the work before paying for CPU**.

## Scaling checklist for 100+ players

| Area | Do |
|---|---|
| Characters | Streaming on. Consider custom or lighter characters for crowds. No per-frame server writes to characters. |
| Combat | Hit checks use spatial queries near the attacker, never loops over every player every frame (see [[Spatial Hash for Nearby Queries]]). |
| Remotes | Rate-limited, batched, small payloads. No remote fired to all clients every frame. |
| Admin and tools | One admin system. Remove unused kits and their remotes. |
| Physics | Stay under the throttle and assembly budgets (see [[Physics Throttling, Sleep and Adaptive Timestepping]]). |
| Cross-server | MessagingService has tight limits. Don't use it as a real-time command bus (see [[MessagingService Cross-Server Patterns and Limits]]). |
| Measure | Load-test with a full server before the event. Log heartbeat, ping and receive KB/s per minute. |

## Credits

DevForum: Vystee, gravyMeister (LilGingerBoy1235), halosviel, GrandiusOptimizus (*Optimization Tips for 300+ Player Sessions*, Nov 2025). Roblox Creator Hub, *Identify performance issues* and *Extended Services* (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Server Heartbeat, Ping and Bandwidth Monitoring]] · [[Network Receive Budget - 50 KB per Second and What Fills It]] · [[Extended Services]] · [[Identify performance issues]] · [[MessagingService Cross-Server Patterns and Limits]]

<!-- TDOD_GRAPH_END -->
