---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "ECS Networking - Replicating jecs Components with Replecs"
tags: [roblox, community-knowledge, networking, ecs, jecs, matter, replecs, replication]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/Ukendio/jecs
  - https://github.com/PepeElToro41/replecs
  - https://pepeeltoro41.github.io/replecs/started/setting-up/
  - https://pepeeltoro41.github.io/replecs/started/replication/
  - https://github.com/evaera/matter
  - https://github.com/matter-ecs/matter
---
# ECS Networking - Replicating jecs Components with Replecs

An Entity Component System keeps game state as plain data (entities with components) processed by systems. That shape is a gift for networking: instead of scattering remotes through gameplay code, you replicate **component changes** from the server world to a client world in one place. This note covers how that works on Roblox today, the libraries involved and their licenses, and the pitfalls. For whether ECS suits your game at all, read [[ECS on Roblox - When It Fits]] first.

## The libraries (status checked 2026-10-25)

| Library | What | License | Status |
| --- | --- | --- | --- |
| jecs (Ukendio) | Archetype ECS for Luau with first-class relationships | MIT | Not archived; check recent commits before adopting |
| Replecs (PepeElToro41) | ECS replication library, built around jecs; Wally `pepeeltoro41/replecs`, npm `@rbxts/replecs` | MIT | Has docs site and demo place; release cadence unverified |
| Matter (evaera) | Roblox ECS with a debugger | MIT | Original repo archived July 2024; community fork `matter-ecs/matter` continues |

All three are MIT, so code can be bundled in a game with the license notice kept (bundle-safe under this vault's rules). Replecs' installation page says it needs jecs v0.9.0-rc.9 or later.

## The replication model

1. **Shared component registry.** Both server and client must agree on which components can replicate and what they are called. In Replecs every replicable component gets the `replecs.shared` tag and a `jecs.Name`, marked identically on both sides; replicating an unmarked component errors.
2. **Server is the writer.** Gameplay systems run on the server world. The replicator watches which entities and components are networked and builds per-player buffers.
3. **Join in progress.** A new player gets a **full** state buffer once, then incremental updates. Replecs ignores a joining player until you call `server:mark_player_ready(player)`; you then send `server:get_full(player)` in the same frame before collecting updates, or changes made in between are lost for that player (per its docs).
4. **Steady state.** Every 1/10-1/30 s the server calls `collect_updates()` (reliable) and `collect_unreliable()` (for things like positions), each yielding `player, buffer, variants` to fire through your own RemoteEvent / UnreliableRemoteEvent.
5. **Client applies.** `apply_full`, `apply_updates`, `apply_unreliable` write into the client world; client systems render from it.

Replecs lists per-entity, per-component player filtering, entity id remapping (server ids differ from client ids), optional custom serdes per component, and automatic splitting for the ~1 KB unreliable limit.

## Design rules that keep ECS netcode sane

- **Replicate facts, not derived data.** Send `Health`, `Position`, `State`; let client systems derive `HealthBarColor` or animation choice.
- **Split components by rate.** Put fast-changing data (`Transform`) in its own component sent unreliably; keep `Inventory` or `Team` reliable. One component that mixes both forces everything onto the reliable path.
- **Filter for privacy and bandwidth.** Use per-player filters so a stealth unit's `Position` is not sent to enemies, and far entities are not sent at all ([[Net - Interest Management - Choosing Which Entities Each Player Receives]]).
- **Client never writes shared components** that the server replicates. Client input goes to the server as validated remote calls; the server system updates the component ([[Remote Payload Validation]]).
- **Relationships need care.** If entity A is `ChildOf` B and B is filtered out for a player, decide what A means on that client. Replecs treats `jecs.ChildOf` as implicitly shared.
- **Interpolate on the client.** Replicated `Transform` arrives at 10-30 Hz; render from a buffer ([[Net - Snapshot Interpolation - Render Delay, Buffers and Extrapolation Limits]]).

## Rolling your own (no library)

The pattern is small enough to hand-write for a few component types:

```lua
-- Server: per tick, collect changed components into a dirty list
local dirty: {[number]: {[string]: any}} = {} -- entityId -> {componentName = value}

local function markChanged(entity: number, name: string, value: any)
	local row = dirty[entity] or {}
	dirty[entity] = row
	row[name] = value
end

-- every 0.1 s
local function flush(remote: RemoteEvent)
	if next(dirty) == nil then return end
	remote:FireAllClients(dirty) -- per-player filtering would build one table per player
	dirty = {}
end
```

Hand-rolled works until you need filtering, id remapping and buffer packing; that is when a library pays off.

## Where to see it in practice

- [[Sentinel - Wave Horde Survival in roblox-ts and Matter (MIT)]] uses Matter in a full game.
- [[Buffer Networking Libraries Compared - Blink, Zap, ByteNet, QuickNet, Jolt]] for the transport layer under any ECS.

## Related
[[Networking Security - Hub]] · [[ECS on Roblox - When It Fits]] · [[Net - Custom Entity Replication - Server Data, Client Models]] · [[Buffers and Bit Packing for Network Payloads]]
