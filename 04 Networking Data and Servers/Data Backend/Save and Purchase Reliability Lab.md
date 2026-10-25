---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
source_note: "27_Production_Labs/02_Save_and_Purchase_Reliability_Lab"
title: "Save & Purchase Reliability Lab"
tags: [roblox, legendary, lab, "cluster/data-backend"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Save & Purchase Reliability Lab

## Goal
Prove that a reward is not lost or duplicated when requests retry, servers close, or old save schemas load.

## Build procedure
1. Create versioned default profile.
2. Create at least two migration fixtures.
3. Implement one transaction API for currency/items.
4. Add a processed transaction/receipt concept.
5. Simulate duplicate processing.
6. Simulate write failure and retry behavior.
7. Document Studio test-data isolation.
8. Record a recovery procedure.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] new player.
- [ ] old save.
- [ ] malformed save.
- [ ] duplicate receipt.
- [ ] full inventory grant.
- [ ] server shutdown path.
- [ ] transaction replay.

## Pass condition
Pass when every replay produces the same final state as processing the transaction once.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Data Backend - Hub|Data Backend]]

**Related:** [[Legendary Production Hub]]
