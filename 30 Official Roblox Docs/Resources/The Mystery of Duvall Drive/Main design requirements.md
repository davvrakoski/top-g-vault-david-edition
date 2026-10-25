---
title: "Main design requirements"
description: "Explains the fundamental design concepts used in The Mystery of Duvall Drive."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/the-mystery-of-duvall-drive/main-design-requirements"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the fundamental design concepts used in The Mystery of Duvall Drive.*

The following list provides an overview of the main technical design requirements we thought about as we worked on [The Mystery of Duvall Drive](https://www.roblox.com/games/7902470429/The-Mystery-of-Duvall-Drive). For more information on the visual design of these elements, see the [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/The Mystery of Duvall Drive|Mystery of Duvall Drive Showcase]], which highlights Studio's various features and tools we used to create the immersive environment.

## Missions

There are several types of missions players must solve in order to progress through the game, including navigating a [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Develop a moving world#Make the corrupted treehouse|series of spinning platforms]] until players are able to retrieve a special item, or finding different ingredients in an [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Develop a moving world#Make the expanding pantry|expanding pantry]] and placing them into a boiling pot. To organize the scripting process of creating and debugging missions, we created a mission framework and a debug version.

### Mission framework

To ensure that we unified each step of the mission throughout the game, we designed a **simple puzzle mission framework** for each mission which consisted of hooks for the start and finish of the puzzle, a spot to read configuration data, and a button to complete the puzzle for [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Main design requirements#Debug version|debugging purposes]]. For more detailed information on this process and its parameters, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems#Missions logic|Missions Logic]].

#### Seals and game states

When players entered specific rooms, we wanted them to interact with special small objects known as **seals** to trigger missions. After they solved the mission, we wanted them to grab the seal and place it in a predefined location within the foyer in order to progress through the overall gameplay. After they placed the seal in the correct location, they could then continue to another room within the house and start the next mission by clicking on that room's special object.

*(image in the full Top G Vault)*

*We developed a simple grabbing system for holding an object by attaching the object to the character's right arm.*

*(image in the full Top G Vault)*

*The foyer where players need to place each seal to progress throughout the game.*

To implement this, we created **game states**, which would specify the period of time players could begin process like:

- Looking for a "corrupted" seal in a room to trigger the mission.
- Pick up the "restored" seal when they solve the mission.
- Place the seal into the foyer circle.

Game states largely control the flow of the game and how players interact with the game's [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Immersive narrative|narrative]]. For more information, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems#GameStateManager|GameStateManager]].

#### Normal and corrupt rooms

We wanted to have two states of six rooms in the house: a normal state and a corrupted state. When a player would touch a corrupted seal in a room to trigger the room's corrupted state, the environment would change to a darker atmosphere with modified lighting, environmental objects, and special effects. Players would then have to solve the mission in order to return to the room's normal state.

*(image in the full Top G Vault)*

*The study's normal state*

*(image in the full Top G Vault)*

*The study's corrupt state*

To implement this, we prepared a special space in the game that was very far from the house, about 6,500 studs away in the **X** direction that could accommodate the corrupt state of a room. When a player triggers any corrupted state, the corrupt state of that specific room clones into this area from [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] to the **TempStorage/Cloned** folder, then players [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Main design requirements#Teleportation|teleport]] into that room. Small [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] exist within each normal and corrupt room that serve as spawn points for players when entering or leaving rooms. After they solve the mission, we simultaneously teleport players back into the normal state of the room, and destroy all objects in the corrupt state of the room. For more information on the game states that control this teleportation process, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems#GameStateManager|GameStateManager]].

### Debug version

To assist us in periodically debugging missions, we created a version of the game where we wouldn't have to wait in the lobby or for cutscenes. This version had keyboard-based cheats and buttons that would allow us to automatically complete missions so we could quickly test aspects of the game. We would periodically copy and publish this version into the version we planned to release that had the proper gameplay flow. To distinguish these two versions, we made a **DemoGlobalSettings** script to check the placeID, see if it's running in Studio, and enable/disable various gameplay cheats and buttons. For more information, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems#Missions logic|Missions Logic]] and [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#Configuration scripts|Configuration Scripts]].

## Teleportation

There are three types of teleportation that occur within the game:

1. Teleporting players from the simple lobby to the main gameplay area in a [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Main design requirements#Reserved servers|reserved server]].
1. Teleporting players from a room's normal state to the corrupt state, then back again while showing a [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Main design requirements#Cutscenes|cutscene]].
1. Teleporting players within some puzzles, or when they [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Main design requirements#Respawn players|respawn]] after falling off the gameplay area.

### Reserved servers

We decided to group players into groups of five in a **simple lobby** before teleporting them over to a **reserved server** for the main gameplay area of the house. The lobby provided time for additional players to join and play together, and reserved servers prevented additional players from missing aspects of the gameplay and narrative from joining the game late. This teleportation only happens once.

*(image in the full Top G Vault)*

### Cutscenes

We wanted to be able to transport players throughout the game whenever they accomplish certain tasks, such as touching a seal or completing a mission. To implement this, we developed a simple version of a script-based tool called **EventManager** that controlled various properties and attributes, ran scripts and audio, and performed camera shakes over a duration of time. This allowed us to both move players and stream in and out different rooms while hiding this process from the player using special effects. For more information, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems#EventManager|EventManager]].

[Video: cutscene.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/resources/mystery-of-duvall-drive/technical-overview/cutscene.mp4)

### Respawn players

The third type of teleportation we wanted to implement was a short teleport with only a player [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] coordinate change within some puzzles and when players fall and respawn. Unlike the previous two types of teleportation, this type doesn't explicitly request async streaming.

[Video: respawning-players.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/resources/mystery-of-duvall-drive/technical-overview/respawning-players.mp4)

## Gameplay scripting

Scripting allowed us to execute on specific gameplay elements, such as fading UI elements, creating trigger volumes for key events, and highlighting objects when they were in focus with the player's cursor. Many of these systems relied on tagging objects to perform custom behavior, then using a variety of client or server scripts to contain specific workflows depending on what action needed to happen at set points in the game. For more information on how we implemented these systems, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Foundational gameplay systems|Foundational gameplay systems]] and [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems|Supporting Systems]].

### Custom behavior with tags

We wanted a way to add custom behavior for objects, such as locking doors so players would have to stay within the room until they completed the active mission. To implement this, we decided to use tags for specific objects, then we used [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] to find these objects and connect any corresponding [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] to add custom behavior. We had one [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] for each tag category that acted as a manager to handle all objects tagged under that category so we could keep the [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in a single location rather than being copied many times in [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. For more information, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#DoorManager|DoorManager]], [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#MasterAnimator|MasterAnimator]], [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#DrawerManager|DrawerManager]], [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#KillVolumes|KillVolumes]], [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#PlayerMissionRespawn|PlayerMissionRespawn]], and [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Supporting systems#PianoManager|PianoManager]].

The "manager" [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] uses an `Init` function to find any objects tagged when the game starts, and connect a custom behavior to them. For example, DoorManager finds any object tagged with **Door**, then it attaches the correct behavior to the door objects (moves the door open when clicked, plays a door swing sound effect, etc.). However, any objects that are added or removed during runtime, such as any objects that are added to a corrupted room after a player interacts with a corrupted seal, miss this initial call and never get the expected behavior. To solve this, we use [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|CollectionService.GetInstanceAddedSignal]] and [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|CollectionService.GetInstanceRemovedSignal]] to grant the same behavior to new objects that are tagged and untagged, respectively.

### Client and server scripts

We wanted to reduce bandwidth for different aspects of gameplay that would be expensive on performance. We decided that when object functionality can affect simulation for other players, such as moving object through collision, we would run this on the **server**, but if something is more related to environment design, such as lights, environmental animations that don't affect gameplay, special effects, and audio, we would run them on **clients**. This would reduce bandwidth, and keep both movement and environment changes smoother on user devices.

---
*Source: [Main design requirements](https://create.roblox.com/docs/resources/the-mystery-of-duvall-drive/main-design-requirements) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
