---
area: "12 UI Audio and Camera"
cluster: "UI UX"
source_note: "09_UI_UX_Audio_Camera/01_Cross_Platform_UI_System"
title: "Cross-Platform UI System"
tags: [roblox, premium, "cluster/ui-ux"]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Cross-Platform UI System

Design from the interaction model, not from one 1920×1080 screenshot.

## Component rules
- reusable button, panel, modal, tab, tooltip, toast, meter
- centralized typography and spacing tokens
- predictable focus order for gamepad
- minimum comfortable touch targets
- safe-zone-aware layout
- scale + constraints instead of fixed absolute positioning everywhere

## Device checks
Desktop:
- mouse hover/focus
- keyboard shortcuts

Mobile:
- thumbs do not cover critical HUD
- no tiny text
- test multiple aspect ratios

Gamepad:
- visible selected state
- no dead-end focus
- shoulder/tab navigation where appropriate
- back button behavior consistent

Community discussions repeatedly point out that a UI that looks good on PC can fail badly on mobile; treat responsive behavior as a core requirement, not a final polish pass.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[UI UX - Hub]]

**Related notes:** [[Polish Checklist]] · [[12-Week Roblox Developer Curriculum]] · [[Modern Roblox Toolchain Menu]] · [[Modular Environment Kit Blueprint]]

<!-- TDOD_GRAPH_END -->
