---
area: "13 Growth and Monetization"
cluster: "Community Discord"
source_note: "25_Legendary_Production_Layer/30_Community_Feedback_and_Discord_Operations"
title: "Community Feedback and Discord Operations"
tags: ["roblox", "legendary", "production", "cluster/community-discord"]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Community Feedback and Discord Operations

## Mission
Turning a community into useful QA and product feedback without letting the loudest person dictate design.

## Architecture / ownership
- announcement channel.
- structured bug reports.
- suggestion intake.
- known issues.
- test cohort.
- moderation rules.
- feedback tagging.
- release notes.

## Recommended build order
1. Ask behavior questions, not “is it good?”.
2. separate bugs from preferences.
3. look for repeated patterns.
4. publish known issues.
5. protect private builds/assets.
6. close the loop after fixes.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Polls replacing analytics**.
- **Arguing with every critic**.
- **Promising every suggestion**.
- **Leaking keys/build links**.
- **Unclear moderation/escalation**.

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
- [ ] can tester reproduce with template.
- [ ] can team find top repeated issue.
- [ ] can a new member find current build/rules quickly.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Community Discord - Hub|Community Discord]]

**Related:** [[Legendary Production Hub]]
