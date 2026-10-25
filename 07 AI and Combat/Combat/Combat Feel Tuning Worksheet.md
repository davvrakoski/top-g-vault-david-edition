---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "06_AI_NPC_Combat/03_Combat_Feel_Tuning"
title: "Combat Feel Tuning Worksheet"
tags: [roblox, premium, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Combat Feel Tuning Worksheet

A combat system feels good when timing, animation, camera, audio, and reaction agree.

For every attack record:
- startup frames/time
- active window
- recovery
- range
- movement during attack
- turn allowance
- damage
- stamina
- hitstop duration
- camera impulse
- target reaction
- knockback
- sound layers
- VFX layers

## Diagnose common problems

**Feels floaty:** weak anticipation, weak reaction, no timing contrast.
**Feels delayed:** input waits for server before any local presentation.
**Feels unfair:** invisible range, weak telegraph, server/client disagreement.
**Feels spammy:** recovery/cooldown/state gates missing.
**Looks powerful but isn't readable:** too many particles/camera shake hiding target.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[In-Game Screenshot Staging for Marketing]] · [[Projectile Ballistics Math]] · [[Feature Flags and Config-Driven Development]] · [[Server-Authoritative Melee Pattern]]

<!-- TDOD_GRAPH_END -->
