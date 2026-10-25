---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-audio-editors"
title: "Free Audio Editors - Audacity and LMMS"
tags: [roblox, community, audio, tools, free-assets, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "GPL (both)"
sources:
  - https://github.com/audacity/audacity
  - https://github.com/LMMS/lmms
cssclasses: [tg-a40]
---

# Free Audio Editors - Audacity and LMMS

| App | Maker | Job | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| **Audacity** | Audacity team | Trim, fade, normalise, convert and clean sound effects and voice lines | GPLv3 (many files GPLv2+; docs CC BY 3.0) | No - link only | https://github.com/audacity/audacity |
| **LMMS** | LMMS community | Free DAW for making your own music: piano roll, beat sequencer, mixer, 15+ built-in synths, VST2 and SoundFont2 support | GPL-2.0 | No - link only | https://github.com/LMMS/lmms |

## Audacity checklist before a Roblox upload
1. **Trim silence** at the start; a 50 ms gap makes UI clicks feel laggy.
2. **Fade** the last few milliseconds to avoid pops.
3. **Normalise / loudness-match** a set of sounds together so they share a level.
4. **Mono** for 3D world sounds (positional), stereo only for music and 2D UI.
5. Export **.ogg or .mp3** at 48 kHz or below, under 7 minutes and 20 MB (Roblox limits; see [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]]).
6. Keep the original WAV in your project folder.

## LMMS caution
The GPL covers the program, not the songs you compose with it. **Bundled samples and presets** are a separate question: LMMS's repo page does not state their license, so for a commercial track prefer synths you program yourself, or samples whose CC0 license you checked.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Free SFX Generators - ChipTone and jsfxr]] · [[Free Music for Roblox Games - License Table]] · [[Audio Mixing Playbook]] · [[Dialogue, Voice, Subtitles and Ducking]]

<!-- TDOD_GRAPH_END -->
