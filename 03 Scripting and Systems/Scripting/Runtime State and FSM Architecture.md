---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "25_Legendary_Production_Layer/02_Runtime_State_and_FSM_Architecture"
title: "Runtime State and FSM Architecture"
tags: ["roblox", "legendary", "production", "cluster/architecture"]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Runtime State and FSM Architecture

## Mission
A reusable way to model characters, enemies, rounds, menus and interactions as explicit states instead of piles of booleans.

## Architecture / ownership
- Define legal states and transitions.
- Keep state data separate from presentation animation.
- Use enter/exit hooks for cleanup.
- Guard re-entry and duplicate transitions.
- Store transition reasons for debugging.

## Recommended build order
1. Write a state diagram first.
2. Create a transition table.
3. Centralize SetState.
4. Make transitions idempotent.
5. Emit state-changed signals for presentation.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **CanAttack, IsStunned, IsRolling, IsDead booleans contradicting each other**.
- **Animation scripts changing gameplay truth**.
- **Unbounded recursive transitions**.
- **Forgotten cleanup on exit**.

## Performance and scale pass
- Identify what runs per-frame, per-player, per-NPC, per-instance, per-transaction, and only-on-change. The multiplicative category is usually the risk.
- Add distance, visibility, sleep, batching, caching, pooling, streaming, or lower-frequency updates only where they preserve correctness.
- Keep cosmetic work on clients when the server only needs the gameplay result.
- Profile the worst realistic scenario, not an empty test place.

## Security and data pass
- Treat client payloads as requests, not truth.
- Validate types, ranges, ownership, state, permissions, rate, and duplicate/replay behavior when relevant.
- For persistent or paid outcomes, design the operation so retrying it does not duplicate rewards.

## Test gates
- [ ] Force every illegal transition and verify it is rejected.
- [ ] Interrupt an attack with stun/death.
- [ ] Respawn during an active state.
- [ ] Log state history for a failing NPC.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Scripting - Hub|Scripting]]

**Related:** [[Legendary Production Hub]]
