---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
source_note: "25_Legendary_Production_Layer/27_Git_Script_Sync_Rojo_Team_Workflow"
title: "Git Script Sync Rojo Team Workflow"
tags: ["roblox", "legendary", "production", "cluster/git-version-control"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Git Script Sync Rojo Team Workflow

## Mission
Choosing the correct source-control workflow for Roblox Studio, external editors, code review and team collaboration.

## Architecture / ownership
- Studio as source of truth + Script Sync for scripts.
- filesystem as source of truth + Rojo for broader project structure.
- Git branches/PRs.
- format/lint/type checks.
- binary asset ownership process.

## Recommended build order
1. Choose one source-of-truth model deliberately.
2. use small commits.
3. review diffs before sync/publish.
4. protect main branch.
5. document package/plugin versions.
6. avoid two people editing same binary asset blindly.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Mixing sync models without rules**.
- **Committing secrets**.
- **Generated files polluting diffs**.
- **Mass refactor and feature change in one commit**.
- **No rollback tag before release**.

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
- [ ] fresh clone/setup.
- [ ] conflict resolution.
- [ ] revert one feature.
- [ ] new teammate onboarding.
- [ ] Studio changes while editor closed.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Git Version Control - Hub|Git Version Control]]

**Related:** [[Legendary Production Hub]]
