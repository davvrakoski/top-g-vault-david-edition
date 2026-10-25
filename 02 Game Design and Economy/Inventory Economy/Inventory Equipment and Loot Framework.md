---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "25_Legendary_Production_Layer/06_Inventory_Equipment_and_Loot_Framework"
title: "Inventory Equipment and Loot Framework"
tags: ["roblox", "legendary", "production", "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Inventory Equipment and Loot Framework

## Mission
A server-authoritative item system that scales from simple hotbars to rarity, equipment, crafting and trading.

## Architecture / ownership
- ItemDefinition ID versus owned ItemInstance ID.
- quantity/durability/modifiers on instance.
- containers/equipment slots.
- transaction API for add/remove/move.
- loot table definitions separated from inventory code.

## Recommended build order
1. Define item schema.
2. build transaction service.
3. build equip rules.
4. replicate a player-safe view.
5. build UI on top of replicated state.
6. add persistence/migrations last.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Client moving items by directly editing data**.
- **Stack duplication during split/merge**.
- **Two requests consuming the same item**.
- **UI becoming source of truth**.
- **Random loot rolled independently on client**.

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
- [ ] spam move/split/equip.
- [ ] fill inventory then award item.
- [ ] disconnect during trade/craft.
- [ ] duplicate transaction ID.
- [ ] load removed item definition.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Inventory Economy - Hub|Inventory Economy]]

**Related:** [[Legendary Production Hub]]
