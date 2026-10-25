---
area: "07 AI and Combat"
cluster: "AI"
source_note: "10_QA_Tooling_AI_Obsidian/40_HOW_TO_SAVE_AI_USAGE_-_CONTEXT"
title: "HOW TO SAVE AI USAGE / CONTEXT"
tags: [roblox, tdod-vault, reference, "cluster/ai"]
status: verified-baseline
cssclasses: [tg-a07]
---

# HOW TO SAVE AI USAGE / CONTEXT

=================================================

LONG AI SESSIONS GET WORSE WHEN:
- chat contains unrelated tasks
- huge logs are pasted repeatedly
- assistant rereads giant files every message
- every prompt says "study everything"
- no project summary exists

BETTER:
1. One task per session.
2. Keep PROJECT_STATE.md current.
3. Keep RESUME_NOTE.md current.
4. Ask AI to update notes before ending.
5. Start a fresh task with only relevant files.
6. Use /compact when continuing the same long task in Claude Code.
7. Use /clear when switching tasks; project files/CLAUDE.md remain available.
8. Do not keep a conversation alive just because it is old.
9. Put durable knowledge in files, not only chat history.
10. Store decisions, not every token of conversation.

END-OF-SESSION AI PROMPT:
"Before we stop, create/update RESUME_NOTE.md with the exact state of the project, what you changed, files touched, tests performed, failures, and the next 3 steps. Do not include filler. Then update DECISIONS.md for any architectural decision made today."

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[AI - Hub]]

**Related notes:** [[Advanced NPC - AI Behavior]] · [[Encounter Director and Pacing]] · [[Traffic, NPC Vehicles and Road Graphs]] · [[Final 'ai Read This First' Instruction]]

<!-- TDOD_GRAPH_END -->
