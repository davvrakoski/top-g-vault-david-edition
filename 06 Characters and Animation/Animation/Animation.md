---
area: "06 Characters and Animation"
cluster: "Animation"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/20_ANIMATION"
title: "ANIMATION"
tags: [roblox, tdod-vault, reference, "cluster/animation"]
status: verified-baseline
cssclasses: [tg-a06]
---

# ANIMATION

=================================================

Roblox Animation Editor works with rigs.

IMPORTANT:
- use animation markers/events
- sync footsteps to foot contact
- sync weapon hitboxes to attack windows
- blend locomotion
- avoid foot sliding
- test at actual game speed
- use separate upper/lower body logic only if needed
- use IK for procedural targeting/reaching where appropriate

ATTACK ANIMATION:
Windup -> Active -> Recovery

Damage should happen during Active, not instantly when button is pressed.

LOCOMOTION:
Idle
Walk forward/back/strafe
Run
Sprint
Jump start
Air loop
Land
Turn-in-place if style needs it
Crouch

POLISH:
- breathing
- head look
- hand placement
- weapon sway
- recoil
- additive flinch
- procedural foot placement where useful

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Animation - Hub]]

**Related notes:** [[Springs and Damping for Game Feel]] · [[Animation Layering, IK and Markers]] · [[Procedural Animation, Springs and Recoil]] · [[Stylized and Anime Lighting]]

<!-- TDOD_GRAPH_END -->
