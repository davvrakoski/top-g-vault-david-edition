---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Interest Management - Choosing Which Entities Each Player Receives"
tags: [roblox, community-knowledge, networking, interest-management, bandwidth, custom-replication, streaming]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gafferongames.com/post/state_synchronization/
  - https://devforum.roblox.com/t/lightweight-npcs/4224897
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/classes/Player#ReplicationFocus
  - https://doi.org/10.1145/1230040.1230069
---
# Interest Management - Choosing Which Entities Each Player Receives

Once you replicate entities yourself ([[Net - Custom Entity Replication - Server Data, Client Models]]), sending every entity to every player scales as players x entities and collapses fast: 40 players x 500 NPCs x 10 Hz is 200,000 pose updates per second. **Interest management** (area of interest, relevance filtering) is the step that decides, per player, which entities they get and how often. Roblox already does this for Instances through StreamingEnabled; for custom data you have to do it yourself.

## Built-in interest management you already have

- **Instance streaming** sends parts near each player's replication focus and streams out distant ones. Radius and behaviour are controlled by `Workspace.StreamingTargetRadius`, `StreamingMinRadius`, per-model `ModelStreamingMode`, and `Player.ReplicationFocus` (set it to a camera subject or vehicle when the player's view is not their character) ([[Instance Streaming Deep Dive]]).
- It does **not** filter RemoteEvent traffic. Anything you `FireAllClients` goes to everyone.

## Step 1: a spatial grid on the server

Bucket entities into a uniform grid (for example 64-stud cells) keyed by cell coordinates. Moving an entity updates its cell only when it crosses a boundary. Per player, the candidate set is the entities in the cells overlapping their interest radius, not a scan of all entities.

```lua
local CELL = 64
local function cellKey(p: Vector3): number
	local cx, cz = math.floor(p.X / CELL), math.floor(p.Z / CELL)
	return cx * 65536 + cz -- fine for maps within +/-2 million studs
end
```

A 2006 ACM NetGames comparison of interest-management algorithms (Boulanger, Kienzle and Verbrugge) reported that cheap tile-based filters can approximate ideal visibility-based filtering at very low cost, so a grid is a solid default.

## Step 2: hysteresis, so entities do not flicker

Use two radii per player: **enter** at 250 studs, **exit** at 300. An entity already in a player's set stays until it passes the exit radius. Without the gap, an NPC pacing on the boundary spawns and despawns every update, costing a reliable spawn message each time.

Track per player: `known[id] = true`. Entering the set sends a reliable spawn (with current state); leaving sends a reliable despawn. Only known entities receive pose updates.

## Step 3: rate tiers by relevance

Not every relevant entity needs the same rate:

| Tier | Example | Pose rate |
| --- | --- | --- |
| Critical | Boss you are fighting, your own pet, party members | 15-20 Hz |
| Near | Within 80 studs | 10 Hz |
| Far | 80-250 studs | 2-4 Hz |
| Off-screen | Behind the camera, far | 1 Hz or only on state change |

MrChickenRocket's lightweight NPC framework uses a per-player cull check hook for exactly this, with 2 Hz replication plus immediate updates on sudden changes.

## Step 4: a byte budget with a priority accumulator

Glenn Fiedler's "State Synchronization" article describes a **priority accumulator**: each entity has a per-player float; every tick you add its current priority (higher for near or interacting entities), sort, and pack the highest ones into the packet until the byte budget is full; sent entities reset to zero, skipped ones keep their value and go first next time. Low-priority entities still update eventually, and bandwidth stays fixed no matter how crowded the area gets.

On Roblox, set the budget per player per tick from your network receive target (for example 8-15 KB/s for NPC traffic), and remember unreliable payloads above 1000 bytes are dropped; send several packets per tick if needed.

## Gameplay-driven relevance

Distance is the default, but some things are relevant regardless:

- Party members and the entity the player is targeting (always critical).
- Global objects like a world boss health bar: send a tiny summary to everyone, full pose only to those nearby.
- **Security angle:** do not send what the player should not know. Hidden enemies in stealth games, loot contents, other teams' positions behind walls: if it is not in their interest set, wallhacks cannot reveal it.

## Testing

- Log per-player bytes per second sent by your replicator, and compare with the client's network receive stat ([[Server Heartbeat, Ping and Bandwidth Monitoring]]).
- Stress with bots crowding one spot; the budget should hold and far entities degrade gracefully ([[Load Testing Roblox Servers - Simulated Players and Bots]]).

## Related
[[Networking Security - Hub]] · [[Net - Snapshot Interpolation - Render Delay, Buffers and Extrapolation Limits]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Network Receive Budget - 50 KB per Second and What Fills It]]
