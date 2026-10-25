---
area: "12 UI Audio and Camera"
cluster: "Accessibility Localization"
source_note: "23_Expanded_Knowledge/38_Player_Settings_Persistence_and_Device_Profiles"
title: "Player Settings, Persistence & Device Profiles"
tags: [roblox, premium, "cluster/accessibility-localization"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Player Settings, Persistence & Device Profiles

Settings are a quality feature and an accessibility feature.

## Common settings
master/music/SFX volume, sensitivity, camera shake, flash intensity, subtitles, UI scale, graphics-related cosmetic toggles, hold/toggle preferences and keybind/action options where supported.

## Persistence
Save durable user preferences server-side or through supported settings architecture while still allowing fast local application. Use defaults that work before data loads.

## Device profiles
A player using touch may need different default UI and sensitivity than a controller user. Detect input changes without permanently locking the player to the first device seen.

## Lab
Change every setting, rejoin, switch input method and reset to defaults. Verify no setting becomes stuck.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Accessibility Localization - Hub]]

**Related notes:** [[Settings and Accessibility Blueprint]] · [[Accessibility, Input and Localization]] · [[Gamepad and Console Design]] · [[Localization Production Workflow]]

<!-- TDOD_GRAPH_END -->
