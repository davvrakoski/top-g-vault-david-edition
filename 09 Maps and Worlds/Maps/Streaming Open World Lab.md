---
area: "09 Maps and Worlds"
cluster: "Maps"
source_note: "27_Production_Labs/04_Streaming_Open_World_Lab"
title: "Streaming Open World Lab"
tags: [roblox, legendary, lab, "cluster/maps"]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Streaming Open World Lab

## Goal
Make a multi-district map survive fast travel, vehicles, respawns and missing client instances.

## Build procedure
1. Enable streaming in a test copy early.
2. Split world into named districts/cells.
3. Replace fragile local Workspace assumptions.
4. Move non-immediate server assets out of ReplicatedStorage.
5. Add fast-travel loading handshake.
6. Activate AI by zones.
7. Test POIs that stream out during UI interactions.
8. Create memory/join-time baseline.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] spawn in distant district.
- [ ] teleport repeatedly.
- [ ] drive at max vehicle speed.
- [ ] open UI then stream source object out.
- [ ] two players at opposite map ends.

## Pass condition
Pass when no client script hangs forever waiting for an instance that is legitimately streamed out.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Maps - Hub|Maps]]

**Related:** [[Legendary Production Hub]]
