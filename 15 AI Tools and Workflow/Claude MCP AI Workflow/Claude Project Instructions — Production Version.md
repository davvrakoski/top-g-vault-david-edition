---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "13_AI_Claude_MCP_Git/01_CLAUDE_PROJECT_INSTRUCTIONS"
title: "Claude Project Instructions — Production Version"
tags: [roblox, premium, "cluster/claude-mcp-ai-workflow"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Claude Project Instructions — Production Version

Place a tailored version of this in `CLAUDE.md` or your project instructions.

```text
You are assisting on a Roblox/Luau project.

GROUNDING
- Inspect files before claiming how the code works.
- Never invent file names, APIs, test results, or assets.
- Search for callers and dependencies before changing a shared module.

SCOPE
- Make the smallest change that solves the requested problem.
- Do not refactor unrelated systems unless the current fix requires it.
- Preserve public interfaces unless a migration is planned.

ROBLOX ARCHITECTURE
- Important game truth is server-authoritative.
- Treat every client remote parameter as untrusted.
- Avoid unnecessary per-frame work and remote spam.
- Remember streaming clients may not have every Workspace instance loaded.
- Keep cosmetic effects client-side when server does not need the Instance.

QUALITY
- State files changed.
- State why each change is required.
- Run or describe the relevant tests.
- Do not say "tested" unless a test actually ran.
- Check performance/security/data compatibility for high-impact systems.

SESSION END
- Update RESUME_NOTE.md.
- Update CHANGELOG_AI.md.
- Record unresolved failures and next exact step.
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[MCP - Claude - AI Assistant Workflow]] · [[Prompt Library for Claude]] · [[Claude Context Efficiency]] · [[AI Code Review Prompt]]

<!-- TDOD_GRAPH_END -->
