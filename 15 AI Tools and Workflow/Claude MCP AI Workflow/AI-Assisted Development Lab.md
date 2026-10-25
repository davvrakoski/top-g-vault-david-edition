---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "27_Production_Labs/12_AI_Assisted_Development_Lab"
title: "AI-Assisted Development Lab"
tags: [roblox, legendary, lab, "cluster/claude-mcp-ai-workflow"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# AI-Assisted Development Lab

## Goal
Use Claude/AI to fix one real system while proving that the AI inspected context, made a bounded change and left a usable handoff.

## Build procedure
1. Create PROJECT_STATE/RESUME_NOTE.
2. Give expected/actual/repro.
3. Require file inspection before edits.
4. Ask for dependency/risk map.
5. Make one bounded change.
6. Review diff.
7. Run available tests.
8. Record tests actually executed.
9. Update resume/changelog.

## Evidence to collect
- before/after profiler screenshots or measurements when performance is involved;
- logs for rejected/failed actions;
- a short capture of the happy path;
- a note describing the worst failure discovered;
- exact build/device/server conditions.

## Test matrix
- [ ] AI invents nonexistent file.
- [ ] tool unavailable.
- [ ] test fails.
- [ ] large unrelated diff.
- [ ] new session must resume.

## Pass condition
Pass when another developer or fresh AI session can continue from the notes without rereading the entire chat history.

## Failure review
If the lab fails, do not paper over it with waits, more particles, more retries or a giant refactor. Identify which layer owns the failure: state, timing, networking, data, physics, streaming, presentation, device input, or content. Fix the owner, then rerun the same test.

## Knowledge graph connections
**Primary cluster:** [[Claude MCP AI Workflow - Hub|Claude MCP AI Workflow]]

**Related:** [[Legendary Production Hub]]
