---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/roblox-audio-rules"
title: "Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds"
tags: [roblox, community, audio, license, free-assets, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "Roblox Terms - Creator Store audio is use-only"
sources:
  - https://create.roblox.com/docs/audio/assets
  - https://create.roblox.com/docs/production/creator-store
cssclasses: [tg-a40]
---

# Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds

The questions people keep asking on r/robloxgamedev after the audio privacy change: "why is my sound silent in the live game?", "how many sounds can I upload?" and "can I use any sound from the Toolbox?". Short answers below; full official text in [[Audio assets]].

## Upload rules (official, 2026-10-25)
| Rule | Value |
|---|---|
| Free audio imports per 30 days | **2,000** if ID-verified, **100** if not |
| Formats | .mp3, .ogg, .wav, .flac |
| Limits | under 20 MB, under 7 minutes, 48 kHz or lower; mono, stereo, 3.0 or 5.1 |
| Rights | You must hold the legal rights to the audio |
| Default privacy | **Private**: only you can use it until you grant access to friends, groups or experiences |
| Sound effect vs song | Auto-classified. Songs can appear on your game's page (ID-verified uploader, Audio Terms accepted, passes checks). Sound effects can't appear there but can be shared on the Creator Store |

## "My sound plays in Studio but not in the game"
Almost always **privacy**: the audio is owned by your user account but the game belongs to a group (or the other way round). Fix: upload under the **same owner as the game**, or grant the experience permission on the asset. See [[Asset privacy]].

## Using Creator Store / Toolbox audio
- The Creator Store has free audio from Roblox, the community and music partners. You can use it **inside your Roblox games**.
- It is **use-only** for this vault: Roblox lets you distribute only assets you created. Never download Creator Store audio to re-upload, sell, or bundle it.
- A community sound in the Toolbox is only as clean as its uploader. A "free" upload of a famous song or a ripped game sound can still be taken down. Prefer Roblox's own and partner audio, or your own uploads from sources in [[Free Sound Effect Sources - License Table]].

## Practical pipeline
1. Keep originals (WAV) in your project folder with a license log ([[Asset and License Log Template]]).
2. Normalise loudness before upload so the mixer starts sane ([[Audio Mixing Playbook]]).
3. Batch-upload with Asphalt to the game's owning group: [[Asset Pipelines as Code - Asphalt, Tarmac and Mantle]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Audio assets]] · [[Audio Framework]] · [[Asset privacy]] · [[Free Music for Roblox Games - License Table]]

<!-- TDOD_GRAPH_END -->
