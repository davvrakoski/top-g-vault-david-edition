---
area: "06 Characters and Animation"
cluster: "Characters Customization"
source_note: "23_Expanded_Knowledge/36_Character_Damage_Limbs_and_Status_Model"
title: "Character Damage, Limbs & Status Model"
tags: [roblox, premium, "cluster/characters-customization"]
verified: 2026-10-25
cssclasses: [tg-a06]
---

# Character Damage, Limbs & Status Model

Character damage needs a model before VFX.

## Separate concepts
Health, armor, limb condition, status effects, stagger, knockdown and death are different layers. Do not make a blood particle decide whether a character is injured.

## Hit regions
If the game uses body-region damage, define authoritative mappings and multipliers. Visual dismemberment or injury effects must follow the game’s maturity target and platform rules.

## Status effects
Burn, bleed, poison, slow or stun need stack rules, duration rules, immunity/refresh behavior and cleanup on death/respawn.

## Lab
Write a table of every status effect and what happens when it is applied twice, cleansed, the player dies, or the source disconnects.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Customization - Hub]]

**Related notes:** [[Character Customization]] · [[Loading and Spawn Pipeline Blueprint]] · [[Character Customization Blueprint]] · [[Character Controllers]]

<!-- TDOD_GRAPH_END -->
