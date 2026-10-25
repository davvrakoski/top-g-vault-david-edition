---
area: "14 Testing and QA"
cluster: "Testing"
source_note: "11_QA_Production/03_Pre_Release_Gate"
title: "Pre-Release Gate"
tags: [roblox, premium, "cluster/testing"]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Pre-Release Gate

Do not publish a major release until all CRITICAL items pass.

CRITICAL:
- no data corruption path known
- purchases/entitlements verified
- server authority on economy/combat
- no secrets in client/source repo
- no crash-level performance regression
- maturity questionnaire accurate
- moderation-sensitive assets reviewed

HIGH:
- mobile UI usable
- controller navigation works if supported
- major analytics events firing
- new/returning player path works
- rollback build identified

POLISH:
- thumbnail/icon final
- patch notes
- Discord announcement
- known-issues note

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing - Hub]]

**Related notes:** [[Definition of Done]] · [[Bug Report Template]] · [[Testing and QA]] · [[Debugging Playbook]]

<!-- TDOD_GRAPH_END -->
