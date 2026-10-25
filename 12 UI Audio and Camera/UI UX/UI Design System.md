---
area: "12 UI Audio and Camera"
cluster: "UI UX"
source_note: "25_Legendary_Production_Layer/14_UI_Design_System"
title: "UI Design System"
tags: ["roblox", "legendary", "production", "cluster/ui-ux"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# UI Design System

## Mission
A component/token architecture that makes menus, HUDs and responsive layouts consistent across devices.

## Architecture / ownership
- design tokens.
- component library.
- screen/router state.
- input focus model.
- safe-area/responsive rules.
- animation durations/easing.
- accessibility preferences.

## Recommended build order
1. Define spacing/type/color tokens.
2. build Button/Card/Modal/List primitives.
3. test touch and gamepad from first screen.
4. use universal styling where appropriate.
5. separate data binding from visual components.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Hardcoded colors in hundreds of instances**.
- **Mouse-only hover interactions**.
- **Tiny touch targets**.
- **Gamepad focus traps**.
- **Animations that block input**.
- **UI copy embedded in images**.

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
- [ ] small phone.
- [ ] tablet.
- [ ] 16:9/ultrawide.
- [ ] controller-only.
- [ ] long localized text.
- [ ] large text setting.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[UI UX - Hub|UI UX]]

**Related:** [[Legendary Production Hub]]
