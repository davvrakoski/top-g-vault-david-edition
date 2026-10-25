---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
source_note: "05_VFX_Weather_Destruction/16_BLOOD_-_DAMAGE_VFX_-_GORE_POLICY"
title: "BLOOD / DAMAGE VFX / GORE POLICY"
tags: [roblox, tdod-vault, reference, "cluster/vfx"]
status: verified-baseline
cssclasses: [tg-a11]
---

# BLOOD / DAMAGE VFX / GORE POLICY

=================================================

ROBLOX POLICY MATTERS.

Current Roblox maturity guidance distinguishes:
- unrealistic blood
- realistic blood
- light/heavy blood
- strong violence
- restricted age-verified experiences

Graphic realistic violence and heavy realistic blood may force Restricted/18+ eligibility and still cannot cross Roblox's prohibited extreme-content line.

Therefore:
1. Decide your target audience BEFORE building gore.
2. Complete Roblox's Maturity & Compliance questionnaire accurately.
3. Do not assume "18+" means anything is allowed.
4. Re-check current rules before release.
5. Keep thumbnails/icons compliant too.

BLOOD VFX TECHNIQUE:
- impact particle burst
- short directional spray
- optional small surface decal
- fade/remove old decals
- pool reusable emitters
- cap decals per area
- cap active blood FX globally
- distance-cull effects
- client-render cosmetic blood after server-confirmed damage

DO NOT:
- replicate hundreds of cosmetic blood particles from server
- leave infinite decals forever
- create thousands of physical blood parts
- use realistic gore if your intended audience/rating does not allow it

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[VFX - Hub]]

**Related notes:** [[Blood - Gore System — Architecture + Policy Gate]] · [[VFX]] · [[Fire, Smoke, Lightning and Destruction]] · [[Destructible Props Blueprint]]

<!-- TDOD_GRAPH_END -->
