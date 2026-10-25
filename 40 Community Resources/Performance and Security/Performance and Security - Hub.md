---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/hub"
title: "Performance and Security - Hub"
tags: [roblox, community, graph-hub, "cluster/performance-and-security"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/
  - https://create.roblox.com/docs/performance-optimization
  - https://create.roblox.com/docs/scripting/security
---
# Performance and Security - Hub

This hub collects community-tested knowledge on **profiling and budgets** (draw calls, triangles, memory, bandwidth, physics, big servers, Parallel Luau) and **security hardening** (admin commands, secrets, webhooks, DataStore abuse, bans, text filtering, sandboxing, account safety). Each note pairs Creator Hub facts with what DevForum developers measured or ran into. Every note credits its sources and links them in `sources`, and all code is original Luau.

> **How to read these:** Community numbers are measurements from one person's game, not engine specifications. Use them to get a sense of scale, then measure on **your own baseline device**. For API truth, see [[Official Roblox Docs - Hub]]. For the existing deep dives this hub builds on, see [[Performance - Hub]], [[Optimization - Hub]] and [[Networking Security - Hub]].

## Budgets and measurement
- [[Performance Hotkeys and Overlays - Quick Reference]]: every stats overlay key (Shift+F2/F3/F5, Ctrl+F7, F9, MicroProfiler) and a 5-minute triage.
- [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]]: MrChickenRocket's published budgets (500k tris, 500 draw calls, 2 GB phones) next to the Creator Hub's device statistics.
- [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]]: what actually batches today, the 2018 engineering notes, and forum claims rated.
- [[Release Regression Check - Performance Dashboard by Place Version]]: post-publish routine at +1h, +24h and +7d with red flags per chart.

## Client rendering and loading
- [[Manual Client Culling - Zone Visibility and Distance Culling]]: parent-to-nil zones and distance culling, with a frame-spread LocalScript.
- [[UI Performance - Gradients, Big Lists and Per-Frame Updates]]: UIGradient rules, virtualized ScrollingFrame, skipping hidden UI.
- [[PreloadAsync and Loading Screens - Preload Less, Load Faster]]: what PreloadAsync really does, what to preload, a tagged preloader with a time cap.

## Network and replication
- [[Network Receive Budget - 50 KB per Second and What Fills It]]: the 40/50 KB/s throttle points, the assembly budget, event-driven props.
- [[Server-Side Tweens and Property Churn - Hidden Replication Cost]]: server decides, clients animate; TweenService V2 caveats.
- [[Remote Event Invocation Queue Exhausted - What It Means]]: why messages get dropped and how to find the remote responsible.

## Server performance
- [[Physics Throttling, Sleep and Adaptive Timestepping]]: GetPhysicsThrottling, sleep thresholds, Adaptive vs Fixed, a 2026 Adaptive bug.
- [[Big Servers - Lessons from 100 to 300 Player Sessions]]: a 300-player case study plus the official server-compute and Extended Services guidance.
- [[SharedTable and Actor Count - Community Benchmarks]]: measured SharedTable costs, how many Actors, a benchmark harness.

## Security hardening
- [[Admin Command Safety - Server-Side Permission Checks]]: deny by default, cached ranks, a validated command gate.
- [[Cmdr Permissions - BeforeRun Hooks Done Right]]: Cmdr's documented security model and a server-only hook.
- [[Ban API in Practice - BanAsync, Alt Detection and Appeals]]: documented limits, the scope-mismatch unban trap, alt-ban lessons.
- [[DataStore Abuse Prevention - Remotes That Hit Your Budget]]: why GetSortedAsync behind a remote is a lever, plus a cached leaderboard.
- [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]: which filter call for which case, the offline-author gap.
- [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]]: secrets store facts, HTTP limits, one gateway module.
- [[Discord Webhooks from Roblox - Why They Break and Safer Logging]]: the 2021 403s, the proxy era, sanitised batched logging.
- [[loadstring and Code-From-Strings - Why to Keep It Off]]: remote code execution risk, backdoored interpreter modules, alternatives.
- [[Sandboxing Toolbox Models with Script Capabilities]]: the beta sandbox, risky capabilities, starter capability sets.
- [[Developer Account Takeovers - Session Theft and Group Hygiene]]: the 2026 infostealer campaign, plus group and collaborator hardening.

## Related elsewhere in the vault
[[Free Model Backdoors - Spot and Remove Them]] · [[Anti-Cheat Reality Check - What Servers Can and Cannot Catch]] · [[Server-Side Movement Validation and Anti-Exploit Checks]] · [[Remote Rate Limiting Pattern]] · [[MicroProfiler Reading Guide]] · [[Developer Console Memory Categories Explained]] · [[Parallel Luau Actors - A Worked Example]] · [[NPC Crowds, Animation LOD and Server Budgets]]

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Performance - Hub]] · [[Optimization - Hub]] · [[Networking Security - Hub]] · [[Reddit Scripting and Systems - Hub]] · [[Official Roblox Docs - Hub]]

<!-- TDOD_GRAPH_END -->
