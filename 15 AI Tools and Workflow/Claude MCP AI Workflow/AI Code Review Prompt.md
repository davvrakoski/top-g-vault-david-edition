---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "13_AI_Claude_MCP_Git/04_AI_Code_Review_Prompt"
title: "AI Code Review Prompt"
tags: [roblox, premium, "cluster/claude-mcp-ai-workflow"]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# AI Code Review Prompt

```text
Review this Roblox change as a skeptical senior engineer.

Do not rewrite it yet.
Evaluate:
1. correctness
2. server authority/security
3. remote validation/rate limiting
4. streaming assumptions
5. memory/connection cleanup
6. per-frame CPU cost
7. network replication cost
8. physics cost
9. data migration risk
10. mobile/gamepad impact
11. race conditions/yields
12. test coverage

For every issue provide:
- severity: critical/high/medium/low
- exact file/function
- failure scenario
- smallest safe correction
- test that proves the correction

If a claim cannot be verified from the files, say UNKNOWN instead of guessing.
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[Claude Project Instructions — Production Version]] · [[Claude Context Efficiency]] · [[AI Change Handoff - Resume Template]] · [[Plugin and MCP Supply-Chain Security]]

<!-- TDOD_GRAPH_END -->
