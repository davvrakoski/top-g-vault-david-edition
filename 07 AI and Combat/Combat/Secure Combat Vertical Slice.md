---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "27_Production_Labs/01_Secure_Combat_Vertical_Slice"
title: "Secure Combat Vertical Slice"
tags: [roblox, legendary, lab, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Secure Combat Vertical Slice

## Goal
Build one melee weapon from input to server-confirmed damage, animation timing, reaction, VFX and analytics.

## Build procedure
1. Create weapon definition with damage/range/cooldown.
2. Create explicit player combat state.
3. Play local anticipation animation.
4. Send attack intent, not damage.
5. Server validates state/cooldown/weapon ownership.
6. Server performs or constrains hit query.
7. Apply damage once per target per attack ID.
8. Broadcast/trigger cosmetic hit presentation.
9. Log invalid-request counts during test.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] normal hit.
- [ ] miss.
- [ ] wall between attacker/target.
- [ ] attack spam.
- [ ] duplicate request.
- [ ] stun during windup.
- [ ] death during attack.
- [ ] 150ms+ latency.

## Pass condition
Pass when the weapon still feels responsive under latency and no arbitrary client payload can create damage.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Legendary Production Hub]]
