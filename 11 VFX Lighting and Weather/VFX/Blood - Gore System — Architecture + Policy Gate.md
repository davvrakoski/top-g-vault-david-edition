---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "08_VFX_Lighting_Weather/03_Gore_System_Architecture_and_Policy"
title: "Blood/Gore System — Architecture + Policy Gate"
tags: [roblox, premium, "cluster/vfx"]
verified: 2026-10-25
cssclasses: [tg-a11]
---

# Blood/Gore System — Architecture + Policy Gate

Build the content-rating decision **before** building the VFX.

## Architecture
Server:
- authoritative damage
- body state/dismemberment permission where applicable
- compact event: hit type, location, normal, severity

Client:
- particles
- decals
- camera-local droplets if used
- sound presentation
- temporary debris presentation where safe

## Performance
- decal pool + per-zone cap
- particle pool
- global concurrent cap
- distance reduction
- no endless physical droplets
- cleanup timer

## 2026 Roblox maturity snapshot
Current Creator Hub guidance classifies strong graphic realistic violence and heavy realistic blood under Restricted experiences, available only to age-verified 18+ users where regionally permitted. Extreme gore remains prohibited.

Source: https://create.roblox.com/docs/production/promotion/content-maturity

Always re-check the policy before release; this area changes and moderation decisions depend on actual presentation.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[Post-Processing - Bloom, Color and DOF]] · [[VFX Budget and Readability]] · [[VFX]] · [[Blood - Damage VFX - Gore Policy]]

<!-- TDOD_GRAPH_END -->
