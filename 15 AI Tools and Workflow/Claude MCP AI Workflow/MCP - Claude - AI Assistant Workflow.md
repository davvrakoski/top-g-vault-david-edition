---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "10_QA_Tooling_AI_Obsidian/38_MCP_-_CLAUDE_-_AI_ASSISTANT_WORKFLOW"
title: "MCP / CLAUDE / AI ASSISTANT WORKFLOW"
tags: [roblox, tdod-vault, reference, "cluster/claude-mcp-ai-workflow"]
status: verified-baseline
cssclasses: [tg-a15]
---

# MCP / CLAUDE / AI ASSISTANT WORKFLOW

=================================================

MCP = Model Context Protocol.
It allows compatible AI clients to communicate with external tools/services exposed by MCP servers.

IMPORTANT:
"Connect Claude to Roblox Studio" is not one universal built-in switch.
You need a specific supported integration/tool/plugin/server.
Do not install random executables or MCP servers without reviewing source, permissions, and trust.

SAFE WORKFLOW:
1. Identify exact MCP server.
2. Read official repo/docs.
3. Check what commands/files/network access it gets.
4. Use least privileges.
5. Do not expose secrets.
6. Use a test project first.
7. Keep Git backup.
8. Review AI changes.
9. Test.
10. Only then use it on main project.

CLAUDE + GITHUB:
Best results come from a normal source-controlled filesystem project.
Rojo can help expose Roblox code as files.
Claude can then reason about files, diffs, architecture, and tests more reliably than screenshots alone.

AI PROJECT BOOTSTRAP:
Give AI:
- game summary
- architecture
- folder tree
- important modules
- current bug
- expected behavior
- reproduction steps
- recent logs
- constraints
- "do not break" list

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[AI Change Handoff - Resume Template]] · [[Plugin and MCP Supply-Chain Security]] · [[Prompt Library for Claude]] · [[Claude Project Instructions — Production Version]]

<!-- TDOD_GRAPH_END -->
