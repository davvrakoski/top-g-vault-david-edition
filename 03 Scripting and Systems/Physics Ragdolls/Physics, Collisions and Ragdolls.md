---
area: "03 Scripting and Systems"
cluster: "Physics Ragdolls"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/18_PHYSICS_COLLISIONS_and_RAGDOLLS"
title: "PHYSICS, COLLISIONS & RAGDOLLS"
tags: [roblox, tdod-vault, reference, "cluster/physics-ragdolls"]
status: verified-baseline
cssclasses: [tg-a03]
---

# PHYSICS, COLLISIONS & RAGDOLLS

=================================================

Roblox uses rigid-body physics.

KEY CONCEPTS:
- assemblies
- network ownership
- constraints
- collision groups
- linear/angular velocity
- raycasting
- mass
- anchored vs unanchored
- humanoid states

COLLISION GROUPS EXAMPLE:
Players
NPCs
PlayerProjectiles
NPCProjectiles
Vehicles
Debris
World
Triggers

Avoid unnecessary collisions:
Debris should not collide with everything.
Cosmetic VFX should usually not collide.
Character accessories may not need full collisions.

RAGDOLL:
- disable/control Motor6D joints appropriately
- create constraints/attachments
- change humanoid state
- avoid violent unstable constraints
- limit ragdoll duration
- restore joints safely
- protect against repeated ragdoll calls
- test slopes, stairs, doors, vehicles

RAGDOLL QUALITY:
The secret is not "more physics."
It is:
- stable joints
- sensible limits
- controlled impulse
- correct collision filtering
- transition animation
- recovery animation
- camera stability

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Physics Ragdolls - Hub]]

**Related notes:** [[Ragdoll Engineering and Recovery]]

<!-- TDOD_GRAPH_END -->
