---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "03_Networking_Security/01_Threat_Model_Worksheet"
title: "Threat Modeling Every Roblox Feature"
tags: [roblox, premium, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Threat Modeling Every Roblox Feature

Before coding a remote-enabled feature, fill this out.

## Feature threat model

**Feature:**
**Client request:**
**Server-owned truth:**
**Maximum legitimate request rate:**
**Maximum legitimate distance:**
**Required ownership/item/state:**
**Worst malicious parameters:**
**Worst spam scenario:**
**Can this affect another player?**
**Can this create or destroy currency/items?**
**Can this cause expensive physics/pathfinding?**
**Audit/log data needed:**
**Rate-limit response:**

## Server validation order

1. Confirm player/session is valid.
2. Validate types before using values.
3. Validate enum/ID against an allowlist.
4. Validate state/cooldown.
5. Validate ownership.
6. Validate spatial plausibility if physical interaction is involved.
7. Validate economy cost/reward from server configuration.
8. Perform the authoritative action.
9. Replicate the result, not the client's claim.

## Anti-patterns

- Remote named secretly and assumed secure.
- Client tells server exact reward amount.
- Client tells server target took damage without a plausible server check.
- Remote creates arbitrary Instance class/name supplied by client.
- A purchase RemoteFunction trusts a price from UI.
- Rate limiting exists only on the client.

Official principle: Roblox's current security guidance says the server should be the ultimate source of truth for simulation state, rules, progression, and critical decisions.

Source: https://create.roblox.com/docs/scripting/security/security-tactics

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Networking Security - Hub]]

**Related notes:** [[Latency, Prediction and Reconciliation]] · [[Anti-Dupe Transaction Blueprint]] · [[Remote Rate Limiting Pattern]] · [[MCP Security and Setup Principles]]

<!-- TDOD_GRAPH_END -->
