---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Custom Entity Replication - Server Data, Client Models"
tags: [roblox, community-knowledge, networking, npc, custom-replication, bandwidth, hordes]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/lightweight-npcs/4224897
  - https://devforum.roblox.com/t/10000-physical-npcs-running-with-60-fps-on-low-end-device/3660293
  - https://devforum.roblox.com/t/how-to-prevent-npc-network-receive/4214247
  - https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent
  - https://create.roblox.com/docs/reference/engine/libraries/buffer
---
# Custom Entity Replication - Server Data, Client Models

Roblox replication is built for a few dozen characters, not 300 zombies or 2,000 tower-defense enemies. Every server-side Humanoid model replicates its parts, physics and animation to every client, and network receive is the first budget to break ([[Network Receive Budget - 50 KB per Second and What Fills It]]). Large-crowd games on the devforum converge on the same architecture: **the server simulates entities as plain data; clients build and animate the models themselves from a compact stream**. This note is the blueprint.

## Reported numbers (community, not official)

- MrChickenRocket's "Lightweight NPCs" demo: 300 NPCs, 500-stud cull radius, ~13 KB/s received, with 10 Hz thinking and **2 Hz replication** plus extra updates on sudden changes (jump, animation switch).
- A 10,000-zombie test: 29-bit packed positions (10/9/10 bits for X/Y/Z), about 3.6 bytes per NPC per update; clients lerp at 40 Hz between 5 Hz updates. The author moved to **deltas** because absolute coordinates far from the origin wasted bits.
- The same thread's earlier Humanoid-based version used ~15 KB/s for 500 NPCs at 20 Hz and 0.2-stud precision.

Treat these as orders of magnitude for planning, then measure your own.

## Architecture

**Server**
- `entities[id] = {def, pos, yaw, state, hp, target}` in a plain table. No Model in Workspace, or at most an invisible anchored proxy if you need server raycasts against it.
- AI ticks at a low fixed rate (5-10 Hz), staggered across frames ([[Scalable NPC Update Scheduler]]).
- Hit detection runs on this data (sphere or capsule checks), never on client models.

**Wire**
- **Reliable** RemoteEvent for rare events: spawn (`id, defId, pos`), despawn, state change (`attack`, `stagger`, `die`), and a full snapshot when a player joins or enters a new area.
- **Unreliable** RemoteEvent for frequent pose updates, packed in a buffer, per player, only for nearby entities ([[Net - Interest Management - Choosing Which Entities Each Player Receives]]). Payloads over 1000 bytes are dropped, so split large updates across frames.

**Client**
- Clones a template from ReplicatedStorage on spawn; pools models instead of destroying them.
- Interpolates pose from a small buffer ([[Net - Snapshot Interpolation - Render Delay, Buffers and Extrapolation Limits]]).
- Plays animations locally from the replicated `state` ([[NPC Animation at Scale - Where to Play Tracks and Animator LOD]]).

## Packing a pose

```lua
-- 1 entity = id (u16) + x,z (i16, 0.25-stud steps) + y (i16, 0.25) + yaw (u8) = 9 bytes
local function writePose(b: buffer, offset: number, id: number, pos: Vector3, yaw: number): number
	buffer.writeu16(b, offset, id)
	buffer.writei16(b, offset + 2, math.clamp(math.round(pos.X * 4), -32768, 32767))
	buffer.writei16(b, offset + 4, math.clamp(math.round(pos.Y * 4), -32768, 32767))
	buffer.writei16(b, offset + 6, math.clamp(math.round(pos.Z * 4), -32768, 32767))
	buffer.writeu8(b, offset + 8, math.round((yaw % (2 * math.pi)) / (2 * math.pi) * 255))
	return offset + 9
end
```

At 9 bytes each, about 100 entities fit in one unreliable payload. If your map is larger than +/-8,000 studs, send positions relative to a zone origin or as deltas. More techniques: [[Buffers and Bit Packing for Network Payloads]].

## Keeping models off the replication path

The cleanest option is simply not to create the NPC model on the server. Devforum replies also point out that instances parented under the server's `workspace.CurrentCamera` do not replicate; that only helps if no client should see them, and the asker reported `MoveTo` behaving badly for Humanoids placed there, so prefer data-only entities. The same thread suggests `AnimationController` rigs instead of Humanoids when an NPC only needs to play animations.

## Join-in-progress and correctness

- On join, send a reliable full snapshot of entities in range; then switch to the stream.
- Version each entity's state (`stateSeq`) so a late reliable message cannot roll a dead NPC back to "walking".
- Clients never report hits on these entities as truth; they send "I swung at id 42" and the server checks range and line of sight using its own data ([[Remote Payload Validation]]).

## When not to do this

Custom replication is a lot of code: spawning, pooling, interpolation, animation, death ragdolls, streaming, and server NPCs no longer physically bump into each other (a concern raised in the thread), so you must add separation steering yourself. For modest counts (a rough guide, not a measured threshold: under ~50 active NPCs), try the cheap fixes first: anchored NPCs moved with `BulkMoveTo`, fewer Humanoids, client-played animations ([[NPC Crowds, Animation LOD and Server Budgets]]).

## Related
[[Networking Security - Hub]] · [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] · [[Net - Server-Owned NPCs - Network Ownership for Moving NPCs]] · [[Scalable NPC Horde Lab]]
