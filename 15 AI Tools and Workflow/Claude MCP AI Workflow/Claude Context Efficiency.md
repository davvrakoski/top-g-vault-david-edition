---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "13_AI_Claude_MCP_Git/02_Claude_Context_Efficiency"
title: "Claude Context Efficiency"
tags: [roblox, premium, "cluster/claude-mcp-ai-workflow"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Claude Context Efficiency

Anthropic's current Claude Code guidance is simple:
- `/clear` when switching tasks.
- `/compact` when continuing a long task and context is filling.
- durable state belongs in project files, not only chat history.

## Better long-run workflow

1. `PROJECT_STATE.md` explains architecture and current status.
2. `RESUME_NOTE.md` holds the last working checkpoint.
3. `TESTS.md` or structured tests record verification.
4. Git records exact code history.
5. Start fresh context when task changes.
6. Ask Claude to inspect the current filesystem rather than dragging months of chat forward.

Anthropic's current prompting guidance also recommends grounding agentic coding by reading referenced files before making claims and using persistent state files for long-horizon work.

Sources:
- https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code
- https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/prompt-templates-and-variables

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[Prompt Library for Claude]] · [[Claude Project Instructions — Production Version]] · [[AI Code Review Prompt]] · [[AI Change Handoff - Resume Template]]

<!-- TDOD_GRAPH_END -->
