---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "01_Foundations/03_ROBLOX_STUDIO_BASICS"
title: "ROBLOX STUDIO BASICS"
tags: [roblox, tdod-vault, reference, "cluster/maps"]
status: verified-baseline
cssclasses: [tg-a09]
---

# ROBLOX STUDIO BASICS

=================================================

Learn these services and containers:
- Workspace: live 3D world.
- Players: connected players.
- ReplicatedStorage: things both client and server may need.
- ReplicatedFirst: minimal early-loading content.
- ServerStorage: server-only assets.
- ServerScriptService: server-only scripts/modules.
- StarterPlayer: character/player scripts.
- StarterGui: UI cloned to players.
- Lighting: environment lighting/effects.
- SoundService: global audio control.
- CollectionService: tags and grouped behavior.
- RunService: frame/update lifecycle.
- TweenService: interpolation.
- PathfindingService: path generation.
- Workspace (WorldRoot): collision groups (PhysicsService is deprecated for this).
- DataStoreService: permanent saved data.
- MemoryStoreService: temporary cross-server data.
- MessagingService: cross-server messages.
- HttpService: JSON/HTTP utilities when allowed.
- MarketplaceService: purchases/passes.
- TeleportService: place/server travel.
- ContentProvider: targeted asset preloading.

RULE:
Do not throw every asset into ReplicatedStorage.
Anything replicated to every client contributes to memory/load cost.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Maps - Hub]]

**Related notes:** [[Buildings, Interiors and Modular Streaming]] · [[Multi-Place Experience Architecture]] · [[Large Maps, Streaming and World Design]] · [[World Interaction System Blueprint]]

<!-- TDOD_GRAPH_END -->

> Updated 2026-10-25: collision groups now live on Workspace/WorldRoot; PhysicsService is deprecated (source: https://create.roblox.com/docs/reference/engine/classes/PhysicsService)
