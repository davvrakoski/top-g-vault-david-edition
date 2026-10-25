---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "06_Characters_Animation_AI_Combat_Vehicles/22_COMBAT"
title: "COMBAT"
tags: [roblox, tdod-vault, reference, "cluster/combat"]
status: verified-baseline
cssclasses: [tg-a07]
---

# COMBAT

=================================================

COMBAT PIPELINE:
Input
-> local anticipation
-> request
-> server validation
-> hit test
-> damage
-> state change
-> confirmed VFX/audio
-> replication

MELEE HIT DETECTION OPTIONS:
- raycasts
- box overlap
- sphere/radius checks
- swept hitboxes
- tagged hitbox parts

Do not rely only on .Touched for fast precise weapons.

MELEE SYSTEM DATA:
WeaponConfig = {
 Damage,
 Range,
 AttackSpeed,
 Combo,
 StaminaCost,
 Knockback,
 Hitstop,
 HitReact,
 SoundSet,
 VFXSet
}

COMBO:
Attack1 -> Attack2 -> Attack3
Use timing windows.
Reset if player waits too long.
Prevent spamming by state/cooldown.

GUNS:
Client predicts visual shot.
Server validates fire rate/ammo/aim plausibility.
Server decides damage.
Avoid trusting client hit damage.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Melee Combo Blueprint]] · [[Vehicle Damage and Impact Blueprint]] · [[Vehicle Damage, Repair and Failure States]] · [[Dynamic Music and Combat States]]

<!-- TDOD_GRAPH_END -->
