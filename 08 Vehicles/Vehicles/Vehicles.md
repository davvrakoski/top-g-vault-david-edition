---
area: "08 Vehicles"
cluster: "Vehicles"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/23_VEHICLES"
title: "VEHICLES"
tags: [roblox, tdod-vault, reference, "cluster/vehicles"]
status: verified-baseline
cssclasses: [tg-a08]
---

# VEHICLES

=================================================

VEHICLE SYSTEMS:
- seat/input
- steering
- suspension
- acceleration
- braking
- traction
- camera
- sounds
- lights
- damage
- enter/exit
- replication
- network ownership
- NPC avoidance
- mobile/gamepad controls

RUNNING SOMEBODY OVER:
Server validates:
- vehicle velocity
- contact/overlap
- target state
- cooldown per target
Then server applies damage/knockback.
Client plays cosmetic impact FX.

DO NOT:
Apply 60 damage events per second from continuous wheel contact.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles - Hub]]

**Related notes:** [[Vehicle Enter - Exit, Seats and Camera]] · [[3D Asset QA Scorecard]] · [[Vehicle Suspension, Chassis and Grip]]

<!-- TDOD_GRAPH_END -->
