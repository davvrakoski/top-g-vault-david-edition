---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Choosing MaxPlayers - Server Memory, CPU and Map Size"
tags: [roblox, community-knowledge, performance, server, maxplayers, capacity]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://devforum.roblox.com/t/even-more-server-memory/3293192
  - https://devforum.roblox.com/t/server-memory-formula-inaccurate-on-creator-docs/3913740
  - https://devforum.roblox.com/t/increase-server-size/306199
---
# Choosing MaxPlayers - Server Memory, CPU and Map Size

Server size is a design decision with a performance price. More players per server makes hubs feel busy and helps social games, but every extra player adds a character to simulate, replicate and render on everyone else's device. Many games pick a number once at launch (often by copying a competitor) and never revisit it. This note gives the numbers Roblox documents, the community's experience, and a method for choosing.

## What Roblox documents

- The Identify Performance Issues page gives the server memory allotment as `6.25 GiB + (100 MiB x largest number of connected players)` and advises keeping server memory below 50%.
- The same page notes servers gain memory as players connect but do not lose it when they leave (the formula uses the peak).
- The docs' own example: 30 players gives about 9.18 GiB, and it stays 9.18 GiB if 10 of them leave.
- The "Even More Server Memory" announcement (DevForum 3293192) raised the per-player term from 50 MB to 100 MB. A later thread (3913740) points out that 6.4 GB in the post and 6.25 GiB in the docs are the same 6,400 MiB written in different units.

Worked examples from the formula (our arithmetic): 20 players is about 8.2 GiB, 50 players about 11.1 GiB, 100 players about 16.0 GiB.

## Why memory is rarely the real limit

Community replies in the memory thread argue servers usually hit **CPU** limits first: physics for every character, Humanoid state updates, scripts that loop over all players, and replication work grow with player count. Clients pay too: each extra visible avatar costs draw calls, animation and accessory memory, which hits phones hardest.

## Cost that scales with player count

| System | Scaling | Mitigation |
| --- | --- | --- |
| Character physics and Humanoids | linear | Avoid server-side per-frame work per character |
| Replication of character movement | roughly players x observers | Streaming, smaller maps per server |
| `for _, p in Players:GetPlayers()` loops every frame | linear per loop | Run at 5-10 Hz, not every Heartbeat |
| Leaderboards, UI lists | linear, client side | Virtualize lists |
| Avatar rendering on clients | linear in visible avatars | `EnableSLIMAvatars`, accessory limits |
| Chat and voice | grows with players | Usually fine; voice servers have their own limits |

## Choosing a number

1. **Start from the design.** Round-based PvP: the mode decides (8-16 for most). Simulators and tycoons: plot count decides (6-10 plots is common). Social hangouts: more players helps, 30-50 is typical.
2. **Map density check.** Players per 1,000 square studs of playable space. Too low and the server feels empty; too high and spawns and objectives crowd.
3. **Load test** with the target count: Studio's local server test with several clients is a weak proxy; a live private server with friends or test accounts is better. Record server heartbeat, physics step time and client FPS on a phone.
4. **Leave headroom.** Pick a number where the server holds 60 Hz heartbeat with 25% to spare and server memory stays under the 50% guideline.
5. **Revisit after launch.** Look at average players per server in analytics. If most servers never fill, a smaller max makes them feel full sooner.

## Related settings

- **Preferred player count / server fill** (in Places settings): controls how full servers get before Roblox opens new ones, separate from the hard maximum. Check the current Creator Hub wording before relying on specifics (unverified here).
- **Reserved slots for friends:** joining friends can push past the fill target, so budget for the true max.

## Pitfalls

- Raising MaxPlayers without retesting is the classic way to make an existing game laggy overnight.
- Scripts written for 10 players (per-pair distance checks, O(n^2) loops) break at 50.
- Bigger servers mean bigger blast radius for exploiters and griefers; moderation tools must scale too.

## Related
[[Performance - Hub]] · [[Server Heartbeat, Ping and Bandwidth Monitoring]] · [[Big Servers - Lessons from 100 to 300 Player Sessions]] · [[Empty Server Problem - Bots, Lead-In Areas and Community]]
