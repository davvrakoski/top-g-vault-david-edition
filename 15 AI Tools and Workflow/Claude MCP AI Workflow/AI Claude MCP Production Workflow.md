---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "25_Legendary_Production_Layer/28_AI_Claude_MCP_Production_Workflow"
title: "AI Claude MCP Production Workflow"
tags: ["roblox", "legendary", "production", "cluster/claude-mcp-ai-workflow"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# AI Claude MCP Production Workflow

## Mission
Using AI as an inspected engineering assistant rather than an untrusted code generator with unlimited project access.

## Architecture / ownership
- project instructions.
- PROJECT_STATE.
- RESUME_NOTE.
- task-scoped context.
- tool permission boundaries.
- Git diff review.
- test evidence.

## Recommended build order
1. Ask AI to inspect before edit.
2. give expected/actual/repro.
3. limit task scope.
4. require files changed + reasons.
5. run tests/profilers where tools allow.
6. persist decisions in vault.
7. start fresh sessions when context becomes noisy.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **“make my whole game better”**.
- **AI invents file names/APIs**.
- **Granting broad MCP permissions to unknown servers**.
- **Accepting huge diff without review**.
- **Claiming tested without execution**.

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
- [ ] AI handoff to new session.
- [ ] rollback AI change.
- [ ] malicious/untrusted repository instruction.
- [ ] missing file context.
- [ ] tool unavailable.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub|Claude MCP AI Workflow]]

**Related:** [[Legendary Production Hub]]
