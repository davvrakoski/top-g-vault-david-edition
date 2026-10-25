---
title: "Pickup system"
description: "Explains the pickup system for the Battle Royale game kit."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/battle-royale/pickup-system"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the pickup system for the Battle Royale game kit.*

The Roblox Battle Royale **pickup system** lets players pick up different kinds of objects, although it's currently only used for weapon pickups. In game, weapons are spawned around the game map and — when players get close enough — an on-screen key/action/button prompt appears along with the weapon name and description.

*(image in the full Top G Vault)*

> [!info]
> Roblox Battle Royale uses the [[30 Official Roblox Docs/Resources/Weapons kit|Weapons Kit]], so please consult its documentation for details and customization options.

## Structure

There are several important folders related to the pickup system. Make sure that these folders are set up correctly in your project:

- `Workspace/PickupSpawners` — Contains pickup spawner [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] which tell the system where to place visual pickup [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] (see the next point). Note that these spawners are **not required** to be in this folder since the system looks for parts tagged with the **PickupSpawner** tag instead of the folder path.

  *(image in the full Top G Vault)*

     > [!info]
     > Pickup spawners can be placed at any physical location in the game, but they will choose a weapon **randomly** from `ReplicatedStorage/Assets/Weapons` and use the name-matched pickup model as a visual representation.

- `ReplicatedStorage/Assets/Weapons` — Contains the weapons (functional [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]]) that the pickup system grants when a weapon pickup is activated.

  *(image in the full Top G Vault)*

- `ReplicatedStorage/Assets/Pickups` — Contains the pickup [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] that the system will place at pickup spawners in the game world. **These should be visual models only**, not functional weapon Tools.

  *(image in the full Top G Vault)*

## Add new pickups

As noted above, pickups require both a functional [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] and a visual [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] that will be spawned in the game world.

### Tool

1. Create a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] and give it a unique name. You can create new weapons based upon those in the [[30 Official Roblox Docs/Resources/Weapons kit|Weapons Kit]] or take tools from the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md).
2. Place the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] in `ReplicatedStorage/Assets/Weapons`.

   *(image in the full Top G Vault)*

### Model

1. Create a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] for the visual pickup and give it the **same name** as you gave the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].
2. Through the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of its properties, apply the following tags to the model:

   - **Action**
   - **Pickup**
   - **WeaponPickup**
   - **WeaponSystemIgnore**
   - One of the rarity tags as outlined in [[30 Official Roblox Docs/Resources/Battle Royale/Pickup system#Rarity|Rarity]].

3. Place the model in `ReplicatedStorage/Assets/Pickups`.

   *(image in the full Top G Vault)*

### Rarity

Pickup rarity is not defined by any mathematical formula, but you can associate an on-screen GUI like those pictured below to suggest an item's rarity.

1. Open the `ReplicatedFirst/Configurations/RarityConfiguration` script. This script contains tables for each rarity category, each of which includes a color value (`Color`) for the pickup's particle effect and an asset ID (`Image`) for the on-screen GUI background. For each GUI:

   - The item name will appear as the model/weapon name.
   - The description will appear as the rarity name (such as **Epic**) plus **Item**.

   The default rarities are as follows, but feel free to define your own.

   | Rarity | GUI |
   | --- | --- |
   | Common | *(image in the full Top G Vault)* |
   | Uncommon | *(image in the full Top G Vault)* |
   | Rare | *(image in the full Top G Vault)* |
   | Epic | *(image in the full Top G Vault)* |
   | Legendary | *(image in the full Top G Vault)* |
   | Special | *(image in the full Top G Vault)* |

2. For the pickup [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] you created previously (located in `ReplicatedStorage/Assets/Pickups`), assign one of the tags you've defined in the `RarityConfiguration` script.

---
*Source: [Pickup system](https://create.roblox.com/docs/resources/battle-royale/pickup-system) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
