---
area: "12 UI Audio and Camera"
cluster: "Audio"
source_note: "09_UI_UX_Audio_Camera/03_Audio_Mixing_Playbook"
title: "Audio Mixing Playbook"
tags: [roblox, premium, "cluster/audio"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Audio Mixing Playbook

Use categories so one subsystem cannot destroy the entire mix.

Suggested buses/groups:
- Master
- Music
- UI
- Dialogue
- Weapons
- Impacts
- Footsteps
- Vehicles
- Weather
- Ambience

## Priority
Dialogue/critical cue > danger/combat cue > interaction > ambience > decoration.

## Variation
For repeated sounds:
- multiple samples when possible
- mild pitch variation
- mild volume variation
- cooldown to prevent machine-gun repetition

## Spatial audio
Match rolloff to gameplay importance. A distant gunshot can be audible farther than a small footstep. Do not make every sound global/non-positional.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Audio - Hub]]

**Related notes:** [[Footsteps and Surface Audio]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Audio Zones, Occlusion and Mixing]] · [[Audio]]

<!-- TDOD_GRAPH_END -->
