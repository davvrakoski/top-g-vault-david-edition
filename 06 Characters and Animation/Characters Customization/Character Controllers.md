---
area: "06 Characters and Animation"
cluster: "Characters Customization"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/19_CHARACTER_CONTROLLERS"
title: "CHARACTER CONTROLLERS"
tags: [roblox, tdod-vault, reference, "cluster/characters-customization"]
status: verified-baseline
cssclasses: [tg-a06]
---

# CHARACTER CONTROLLERS

=================================================

CHARACTER FEEL COMPONENTS:
- acceleration
- deceleration
- turn rate
- jump height
- gravity feel
- air control
- slope behavior
- sprint
- crouch
- camera lag
- animation responsiveness
- footstep timing
- input buffering
- coyote time if platforming
- landing reaction

STATE MACHINE:
Idle
Walk
Run
Sprint
Jump
Fall
Land
Crouch
Attack
Stunned
Ragdoll
Dead
Interact

Do not allow impossible transitions.
Example:
Dead -> Sprint = invalid.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Customization - Hub]]

**Related notes:** [[Character Damage, Limbs and Status Model]] · [[Character Customization Blueprint]] · [[Character Customization]] · [[Loading and Spawn Pipeline Blueprint]]

<!-- TDOD_GRAPH_END -->
