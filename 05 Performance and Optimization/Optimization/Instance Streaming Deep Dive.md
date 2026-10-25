---
area: "05 Performance and Optimization"
cluster: "Optimization"
source_note: "05_Performance_Engineering/03_Instance_Streaming_Deep_Dive"
title: "Instance Streaming Deep Dive"
tags: [roblox, premium, "cluster/optimization"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Instance Streaming Deep Dive

Instance streaming dynamically loads/unloads Workspace content based on relevance. Roblox currently enables it by default for new places and recommends it as one of the highest-impact memory/load improvements for large worlds.

## Important consequences

- A client cannot assume every Workspace instance exists right now.
- Streaming applies to Workspace descendants, not ReplicatedStorage/ReplicatedFirst.
- Local-only changes to a streamed instance can be lost when it streams out and back.
- Large moving assemblies can create CPU/network spikes because assemblies stream as units.
- Persistent models defeat some memory benefit; use persistence intentionally.

## Model modes

- Nonatomic: parts may stream independently depending on behavior.
- Atomic: model descendants stream together when eligible.
- Persistent: sent early and never streamed out.
- PersistentPerPlayer: persistent for selected players.

## 2026 notes

Roblox documentation recommends `ModelStreamingBehavior = Improved` for efficient model streaming in supported scenarios and documents SLIM level-of-detail options.

## Streaming-safe script checklist

- Never assume a distant door/quest object exists on client.
- Server can own canonical objective state while client displays nearby presentation.
- Use tags/IDs and reacquire streamed instances as necessary.
- Keep long-lived data outside the physical instance when streaming could remove it.
- Test teleporting, respawning, fast vehicles, and high-latency movement.

Source: https://create.roblox.com/docs/workspace/streaming

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Optimization - Hub]]

**Related notes:** [[Object Pooling Without Making a Mess]] · [[Memory Leaks and Lifecycle Management]] · [[Production Labs]] · [[Spatial Hash for Nearby Queries]]

<!-- TDOD_GRAPH_END -->
