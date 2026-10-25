---
title: "Client-server runtime"
description: "An overview of the client-server model in Roblox."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/client-server"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of the client-server model in Roblox.*

## Server

Roblox games are multiplayer by default and run in a client-server model.
The Roblox **server** is the ultimate authority for maintaining the game's
state, and is responsible for keeping all connected clients in sync with the
server.

*(image in the full Top G Vault)*

*Server with connections to three client devices*

## Client

When a game runs, Roblox copies a version of the "edit" data model that
you built and published from Studio and runs it on Roblox servers as the
"runtime" data model.

Connected clients also receive a copy of the runtime data model and any
initialization of the player occurs, such as initializing a player's backpack
(inventory) or local user interface. When a game has
[[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] set to true, the server initially only sends
a subset of content under [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] that is closest to the client. The
client then renders the 3D world and begins running any
applicable scripts.

*(image in the full Top G Vault)*

## Replication

The server constantly updates connected clients, keeping everything in sync
across the server and clients through a process called **replication**, which
synchronizes the data model, physics simulation, and chat messages. Replication
logic exists on both the client and server to ensure synchronization.

### Data

Data model changes can occur in a variety of cases, such as when something in the 3D
world is created or a property of the 3D world changes. This typically occurs
when a script on the server or client makes a change that needs to be reflected
on the other side of the client-server boundary. The following diagrams show
common scenarios for data replication.

**Client → Server**<br><br>
*(image in the full Top G Vault)*

*Communication from any client to the server. For example, a client presses the <kbd>P</kbd> key to drink an invisibility potion, and tells the server to make that player's character invisible to all other players.*

**Server → Client**<br><br>
*(image in the full Top G Vault)*

*Communication from the server to one specific client. For example, a player joins the game and the server populates that player's inventory with a set of items.*

**Server → All Clients**<br><br>
*(image in the full Top G Vault)*

*Communication between the server and all connected clients. For example, displaying a countdown timer to all participants in a race.*

### Physics

Roblox uses a rigid body physics engine, which is responsible for
calculating the movement and interactions of parts in the 3D world. By default,
all parts in Roblox are rigid bodies and participate in simulated physics,
unless otherwise specified. You can also group multiple parts together into
assemblies, which the physics engine treats as a single rigid body.

<br>

*(image in the full Top G Vault)*

*1 assembly; 1 part*

*(image in the full Top G Vault)*

*1 assembly; 18 parts*

*(image in the full Top G Vault)*

*1 assembly; 179 parts*

<br>

Roblox replicates physics simulation data between the server and clients when
necessary. To assist with simulation performance, Roblox can assign ownership of
assemblies to a specific client or server. This means that the client or server
can be responsible for simulating the physics of that assembly. Other clients
receive updates about the assembly's position and movement from the owning
client or server. Ownership typically happens automatically, but you can assign
it directly for fine-tuned responsiveness.

[Video: Visualization-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/network-ownership/Visualization-Demo.mp4)

*Part ownership indicated through colored outlines*

### Chat

Roblox replicates chat messages between the server and client. The server is
responsible for filtering chat messages and deciding which messages to replicate
to other clients. For example, the server may filter out messages that contain
profanity or are too long.

[Video: Player-Conversation-Bubbles.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/players/in-experience-text-chat/Player-Conversation-Bubbles.mp4)

> [!success]
> Most players on Roblox game between 100–300 milliseconds of network latency. Roblox Studio playtesting runs with a default of no latency, but you can change **Network Simulation** settings in the **Network** section of [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]] (<kbd>Alt</kbd><kbd>S</kbd> on Windows; <kbd>⌥</kbd><kbd>S</kbd> on Mac). Use a minimum delay of 50–150 milliseconds in both the inbound and outbound directions to better simulate how network latency will affect your game.

---
*Source: [Client-server runtime](https://create.roblox.com/docs/projects/client-server) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
