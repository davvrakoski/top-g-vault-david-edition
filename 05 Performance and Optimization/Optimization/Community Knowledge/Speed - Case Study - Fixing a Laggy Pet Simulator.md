---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Case Study - Fixing a Laggy Pet Simulator"
tags: [roblox, community-knowledge, optimization, case-study, simulator, pets, replication]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
---
# Speed - Case Study - Fixing a Laggy Pet Simulator

Simulators multiply everything by player count and by progress: each of 20 players brings 8 pets, smashes breakables that drop 30 coins each, clicks 10 times per second, and watches numbers in the quadrillions tick up. Each of those is cheap alone and expensive together. This walkthrough fixes the typical "great with 3 players, unplayable in a full server after an hour" simulator.

## Reproduce

Full server, late-game save files (max pets equipped, best area), 20 minutes of farming. Measure server heartbeat, server Script Profiler, client MicroProfiler on a phone, Recv KB/s per client, and client instance count in the farming area.

## Culprits and fixes

**1. Pets simulated on the server.** 20 players x 8 pets = 160 physics-driven models, each moved by constraints or CFrame on the server and replicated to everyone. Fix: the server stores only which pets are equipped (attributes or values); each client spawns and animates all pets locally. The server never moves a pet. Full pattern in [[Companion and Pet Follower AI]]. Extra client savings: hide pets of players beyond ~100 studs and use simple hover animation instead of rigs for far pets.

**2. Coin drops as server parts.** A breakable bursting into 30 unanchored coin parts per hit on the server is the tycoon drop problem at a larger scale. Fix: the server decides the reward and sends one event "player X broke Y, value Z"; clients spawn cosmetic coins that fly to the player and vanish. Auto-collect on the client is cosmetic; the server already credited the money.

**3. Click remote spam.** One remote per click at 10 clicks per second per player is 200 remote calls per second in a full server, each running validation. Fix: the client counts clicks locally and sends a batch a few times per second (`{clicks = 7, t = ...}`); the server clamps to a maximum believable rate and credits once. See [[Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster]].

**4. Leaderstats and currency values updated per gain.** Every change replicates. Accumulate on the server and publish the visible value a few times per second, or send the number only to its owner and show other players a rounded value.

**5. Big-number formatting every frame.** Formatting "1.23Qa" with `string.format` and suffix tables in `RenderStepped` for dozens of labels creates garbage each frame. Update text only when the value changes, and throttle animated count-ups to ~10 Hz. See [[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]].

**6. Particle overload.** Every pet with a sparkle emitter, every coin with a trail, every egg-hatch with a burst. Use `ParticleEmitter:Emit(count)` bursts instead of always-on emitters, keep `Rate` low on persistent effects, and drop decorative emitters on far pets.

**7. Egg-hatch and UI spikes.** Opening a hatch animation that clones a large ViewportFrame scene per egg causes a frame spike. Pre-build one viewport rig and reuse it; see [[Perf - ViewportFrame Cost - Item Previews Without Frame Drops]].

**8. Areas loaded all at once.** Ten zone worlds in Workspace without streaming means every phone holds every world. Enable streaming, or keep zones in ServerStorage and load the active zone per player with client-side cloning of cosmetic detail.

## Target state

| Item | Before | After |
|---|---|---|
| Pets on server | 160 models | 0 (data only) |
| Coin parts on server | hundreds | 0 |
| Click remotes per second (20 players) | ~200 | ~60 batched |
| Currency replication | per gain | 3 to 5 per second |

"Before" values are illustrative; record your own.

## Pitfalls

- Trusting batched click counts: always clamp to a max rate and check the player is near the target.
- Making pets client-side but leaving pet abilities (coin magnet, damage) on the client too: gameplay effects stay server-computed from equipped-pet data.
- Testing with your own maxed save only: many players with mid-game saves create more variety (more unique pet meshes) than one maxed player.

## Related
[[Optimization - Hub]] · [[Simulator Genre Breakdown - Click, Upgrade, Zone, Rebirth]] · [[Speed - Case Study - Fixing a Laggy Tycoon]] · [[Object Pooling Without Making a Mess]]
