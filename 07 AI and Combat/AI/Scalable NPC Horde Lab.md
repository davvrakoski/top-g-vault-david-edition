---
area: "07 AI and Combat"
cluster: "AI"
source_note: "27_Production_Labs/03_Scalable_NPC_Horde_Lab"
title: "Scalable NPC Horde Lab"
tags: [roblox, legendary, lab, "cluster/ai"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Scalable NPC Horde Lab

## Goal
Scale from one NPC to a crowd without multiplying expensive perception/pathfinding work every frame.

## Build procedure
1. Build one deterministic NPC FSM.
2. Add perception intervals.
3. Add path recompute rules.
4. Add stuck recovery.
5. Add distance-based brain tick rate.
6. Add global crowd director.
7. Stagger expensive work.
8. Create max-crowd benchmark scene.
9. Profile server heartbeat and path workload.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] player stands still.
- [ ] player sprints across zones.
- [ ] many NPCs acquire same player.
- [ ] all players separate.
- [ ] blocked doorway.
- [ ] NPC cap reached.

## Pass condition
Pass when adding distant sleeping NPCs has much smaller cost than adding equal numbers of fully active combat NPCs.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[AI - Hub|AI]]

**Related:** [[Legendary Production Hub]]
