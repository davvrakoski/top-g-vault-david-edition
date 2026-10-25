---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/roblox-weapons-npc-kits"
title: "Roblox Weapons Kit and NPC Kit - Official Prefabs (Limited Use License)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", official, weapons, npc, zombie, limited-use-license]
verified: 2026-10-25
license: "Roblox Limited Use License"
sources:
  - https://create.roblox.com/docs/resources/weapons-kit
  - https://create.roblox.com/docs/resources/npc-kit
  - https://create.roblox.com/docs/resources/limited-use-license
cssclasses: [tg-a40]
---
# Roblox Weapons Kit and NPC Kit - Official Prefabs (Limited Use License)

**Publisher:** Roblox · **Terms:** both pages state the content can be used under Roblox's **Limited Use License**.

These are not whole games, but together they are the official "drop in combat" pair: guns plus enemies that fight back. Dropped into one of the [[Roblox Studio Templates - Official Uncopylocked Starter Games]], they are a fast way to prototype a shooter or zombie wave game.

| Kit | What it contains |
|---|---|
| Weapons Kit | Projectile-based weapons with an over-the-shoulder camera: Pistol, Shotgun, Auto Rifle, Submachine Gun, Sniper Rifle, Crossbow, Grenade Launcher, Rocket Launcher, Railgun. High projectile speed fakes hitscan. |
| NPC Kit | Drooling Zombie, Soldiers, RO-01 Robots, NP-C 9000 Robots. Each has Animate, Health, NPC and sound scripts plus a Configuration (PatrolEnabled, AttackDamage, AttackRadius, RagdollEnabled). Zombies and soldiers pick targets by CollectionService tags (SoldierEnemy, SoldierFriend, ZombieFriend). |

**Genre:** shooter and zombie/wave combat building blocks.

## How to add them
**Weapons Kit**
1. Open a weapon's Creator Store page from the kit doc, click **Get Model**.
2. In Studio, Toolbox > **Inventory**, click the weapon. Choose **Yes** to put it in StarterPack or **No** to drop it in the world as a pickup.
3. The first time, move its `WeaponsSystem` folder into ServerScriptService; all later weapons share it.

**NPC Kit**
1. Click **Get** on the NPC's store page.
2. Studio Toolbox > **Inventory**, click it to place it.
3. Edit the Configuration values and tags to set who fights whom.

## Terms in plain words
Limited, revocable permission to build these into your own Roblox experiences and modify their source for that purpose; keep attribution and notices; no use outside Roblox; Roblox keeps ownership and can end the license. See [[Limited use license]].

## Caveats
- Older kits; test against current Studio and replace deprecated APIs.
- Because the license is revocable and Roblox-only, do not sell the kit code itself as part of a template pack.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[Weapons kit]] · [[NPC kit]] · [[Zombie Survival Starter Architecture]] · [[FPS TPS Starter Architecture]] · [[How to legally build on an open-source Roblox game]]

<!-- TDOD_GRAPH_END -->
