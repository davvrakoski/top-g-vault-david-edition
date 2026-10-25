---
title: "NPC kit"
description: "The NPC Kit provides several pre-built, customizable NPCs for use in any game."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/npc-kit"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The NPC Kit provides several pre-built, customizable NPCs for use in any game.*

> [!info]
> The content of this project and documentation can be used under Roblox's [[30 Official Roblox Docs/Resources/Limited use license|Limited Use License]].

NPCs (non-player characters) can add a lot of depth to a game. All of the following NPCs can be visually customized, their [[30 Official Roblox Docs/Resources/NPC kit#Configuration|behavior modified]], and the zombie/soldiers can even defend an area by attacking players or other characters using a [[30 Official Roblox Docs/Resources/NPC kit#Assign tags|tag system]] to set behavior.

To use an NPC in your game:

1. Select one of the following NPC kits:

   *(image in the full Top G Vault)* ([link](https://www.roblox.com/library/3924238625/Drooling-Zombie-Rthro))

   *Drooling Zombie*

   *(image in the full Top G Vault)* ([link](https://www.roblox.com/library/3924234975/Soldier-Rthro))

   *Soldiers*

   *(image in the full Top G Vault)* ([link](https://www.roblox.com/library/3924232032/RO-01-Robot))

   *RO-01 Robots*

   *(image in the full Top G Vault)* ([link](https://www.roblox.com/library/3924229481/NP-C-9000-Robot))

   *NP-C 9000 Robots*

2. On the NPC's item page, click the green **Get** button and confirm the transaction.
3. In Studio, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md).
4. Select your toolbox **Inventory** section.

   *(image in the full Top G Vault)*

5. Locate the NPC and click it to add it into the place.

## Character structure

Each NPC model typically contains the following objects:

| Object name or [Type] | Type | Description |
| --- | --- | --- |
| Animations | [[30 Official Roblox Docs/API Reference/Classes/Folder\|Folder]] | Contains [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animations]], such as an `AttackAnimation` or `DeathAnimation`. |
| Initial Poses | [[30 Official Roblox Docs/API Reference/Classes/Folder\|Folder]] | Contains posing information. |
| [[30 Official Roblox Docs/Resources/NPC kit#Animate\|Animate]] | [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] | Loads and plays animations on the character rig. See [[30 Official Roblox Docs/Resources/NPC kit#Animate\|Animate]] for more details. |
| [Accessory] | [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] | One of possibly multiple [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessories]] for the NPC such as hats, weapons, etc. |
| Health | [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] | Typically regenerates the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] health over time. Disabling this will prevent the character from regenerating health. |
| Humanoid | [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] | Manages [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] related properties, such as [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]], [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed\|Humanoid.WalkSpeed]], [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType\|Humanoid.DisplayDistanceType]], etc. |
| NPC | [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] | Defines character-specific behaviors such as roaming, attacking, etc. Parents the following objects:<br><br> **Maid** ([[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]]) defines a class useful in releasing resources used.<br><br> **Ragdoll** ([[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]]) defines a function that transforms a character into a loose physics-affected body (parents a RigTypes [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]] that defines several helper functions). |
| RbxNpcSounds | [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] | Defines and manages behavior related to character sound effects like running, dying, etc. |
| [[30 Official Roblox Docs/Resources/NPC kit#BodyParts\|BodyParts]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | Various character body parts attached to the HumanoidRootPart or neighboring body parts through Motor6D or constraint objects. See [[30 Official Roblox Docs/Resources/NPC kit#BodyParts\|BodyParts]] for more details. |
| HumanoidRootPart | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A special invisible part that's considered the root of the rig; this is also the `PrimaryPart` of the character's [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |
| [[30 Official Roblox Docs/Resources/NPC kit#Configuration\|Configuration]] | [[30 Official Roblox Docs/API Reference/Classes/Configuration\|Configuration]] | Contains value objects which tune various behaviors. See [[30 Official Roblox Docs/Resources/NPC kit#Configuration\|Configuration]] for more details. |

> [!info]
> **Square brackets []** refer to the object in general and the name doesn't matter. For example, [Model] refers to the weapon's [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and you can rename it to whatever makes sense.

### Design notes

When using the NPC kit, keep in mind the following design notes:

- The visual appearance of an NPC can be customized by adding/modifying various [BodyParts] objects and by adding [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects.

- The Soldiers, Drooling Zombie, and NP-C 9000 Robots use Rthro as the base of their rig. However, the RO-01 Robots use a modified Rthro base that adds thruster parts connected to the **UpperTorso** using `WeldConstraints`. Using simple joints in this way lets you include extra geometry for your characters without changing the original base rig.

- At a basic level, NPC animations can be customized by modifying the `AnimationId` of existing Animation objects within the **Animate** script poses, or those within the **Animations** folder. Such a change is essentially an asset swap - to change the finer details, you can create custom copies of existing animations, and to play animations under different conditions, you can edit the **Animate** or **NPC** scripts directly. For more information, see [[30 Official Roblox Docs/Animation/Animation in Roblox|Animation]].

### Animate

The Animate [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in the NPC [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] handles [[30 Official Roblox Docs/Animation/Animation in Roblox|animation]] related configurations and contains the following objects:

| Object name or [Type] | Type | Description |
| --- | --- | --- |
| ScaleDampeningPercent | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines how animation speeds are modified as the character is scaled (less than 1 implies animation playback scales inversely as a character is scaled). |
| PlayEmote | [[30 Official Roblox Docs/API Reference/Classes/BindableFunction\|BindableFunction]] | This can be invoked by other scripts in order to force the assumption of a pose. |
| [Pose] | [[30 Official Roblox Docs/API Reference/Classes/StringValue\|StringValue]] | Reference to a playable animation category such as idle, jump, walk, etc. This object can parent any number of [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animations]]. <br> <br>These [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animations]] parent a **Weight** ([[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]]) that prioritizes one of multiple animations to play while the pose is assumed; typically used to add variety to idle and dance poses. |

### BodyParts

The BodyPart [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in the NPC [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] represent the various character body parts and contains the following objects:

| Object name or [Type] | Type | Description |
| --- | --- | --- |
| AvatarPartScaleType | [[30 Official Roblox Docs/API Reference/Classes/StringValue\|StringValue]] | Determines how the part will be scaled; values can be **Classic**, **ProportionsNormal**, or **ProportionsSlender**. |
| OriginalSize | [[30 Official Roblox Docs/API Reference/Classes/Vector3Value\|Vector3Value]] | Determines the size of the part when the character scaling is 1. |
| [Attachment] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | Defines a point relative to the individual part which scripts, effects, and objects such as a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] or [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] may utilize during positioning. |
| [Motor6D] | [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] | An animated joint between two body parts. Note that [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animator]] depends on the name of [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6Ds]] to be consistent with that of the [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6Ds]] used when an animation was created, so avoid renaming this object. |
| [Joint] | [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|JointInstance]] | A non-animated joint between two body parts. |
| [Sound] | [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] | Commonly found in the head or `HumanoidRootPart`; plays sounds from within the rig as controlled by the `RbxNpcSounds` script. |

### Configuration

Each NPC includes a [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]] object within its hierarchy which acts as a container of value objects. These are used by the NPC script to tune various behaviors. Unless otherwise specified, these apply to all of the characters.

| Object name or [Type] | Type | Description |
| --- | --- | --- |
| DestroyOnDeath | [[30 Official Roblox Docs/API Reference/Classes/BoolValue\|BoolValue]] | Causes the entire NPC to be destroyed shortly after it dies. Disable this for ragdolls to be persistent. |
| PatrolEnabled | [[30 Official Roblox Docs/API Reference/Classes/BoolValue\|BoolValue]] | Causes the NPC to wander in an area around its starting position. |
| PatrolRadius | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines the maximum distance an NPC will wander from its starting position, assuming **PatrolEnabled** is true. |
| RagdollEnabled | [[30 Official Roblox Docs/API Reference/Classes/BoolValue\|BoolValue]] | Causes the NPC to go limp when it dies, instead of breaking apart. |
| AttackDamage | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines how much health is lost by a victim when attacked by the NPC. This applies for Zombie and Soldier kits only. |
| AttackDelay | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines the minimum number of seconds between shots. This applies for Soldier kits only. |
| AttackMode | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Specifies what the soldier will attack, based on the [[30 Official Roblox Docs/Resources/NPC kit#Assign tags\|tagging system]]. This applies for Soldier kits only. |
| AttackRadius | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines the maximum distance the NPC must be from a potential victim before it attempts to attack. This applies for Zombie and Soldier kits only. |
| ClipCapacity | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines how many bullets the soldier can fire before needing to reload. This applies for Soldier kits only. |
| ReloadDelay | [[30 Official Roblox Docs/API Reference/Classes/NumberValue\|NumberValue]] | Defines how many seconds must pass before the soldier's weapon clip is reloaded. This applies for Soldier kits only. |

## Assign tags

The **NPC** script uses [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tags to manage aggression toward other characters and players. Various tags from the following table can be assigned as follows:

- To assign tag(s) to another NPC, assign them to the NPC's top-level [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] using the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of its properties.
- To assign a tag to a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] character, you can add a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to **StarterCharacterScripts** with a [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag|CollectionService:AddTag()]] call. For example:

  ```lua
  local CollectionService = game:GetService("CollectionService")

  CollectionService:AddTag(script.Parent, "SoldierEnemy")
  ```

| Tag | Purpose |
| --- | --- |
| **SoldierEnemy** or **SoldierFriend** | Determines if a soldier, based on its **AttackMode** configuration value, should attack another character. When the soldier's **AttackMode** is set to `1`, other characters must be tagged with **SoldierEnemy** to be considered attackable. When the soldier's **AttackMode** is set to `2`, all objects without the **SoldierFriend** tag are considered attackable. When the soldier's **AttackMode** is set to `3`, these tags are ignored entirely and the soldier will attack all characters. |
| **ZombieFriend** | This tag is used by the zombie to determine whether it should not attack a character. When applied, the zombie becomes docile toward the tagged character. |

---
*Source: [NPC kit](https://create.roblox.com/docs/resources/npc-kit) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
