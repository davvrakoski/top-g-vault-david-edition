---
title: "Data model"
description: "Explains the hierarchy of objects that describe everything about a place."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/data-model"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the hierarchy of objects that describe everything about a place.*

![](https://www.youtube.com/watch?v=3Q0R1-Xkw9U)

Every place is represented by a data model, a hierarchy of objects that describe
everything about the place. The data model contains all objects that make up the
3D world, such as parts, terrain, lighting, and other environmental elements. It
also contains objects that can control runtime behavior, such as scripts that
modify properties, call methods and functions, and respond to events that enable
dynamic behavior and interactivity.

The Roblox Engine uses the data model as a source of truth for a place's state,
so it can simulate and render it on client devices. For more information on how
the Roblox Engine interprets the data model, see [[30 Official Roblox Docs/Projects/Client-server runtime|Client-Server Runtime]].

## Objects

![](https://www.youtube.com/watch?v=FzmFAm00A8g)

You place and organize objects in the data model to describe a place in Roblox.
Every object in Roblox inherits from the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] class, which defines
generic properties, methods, and events that are common to all objects. Objects
also define their own characteristics depending on the functionality the object
provides. There are many categories of objects with a wide variety of uses, but
you'll frequently work with [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]]
objects, commonly referred to as parts and scripts.

For a comprehensive list of all the features of the Roblox Engine, see the
[[30 Official Roblox Docs/API Reference/API Reference|reference documentation]].

### 3D building blocks

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is the core class for physically-simulated 3D building blocks in the world. It defines the properties and methods common to all physical objects with properties like position, size, and orientation.

| Object | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] | A primitive [[30 Official Roblox Docs/Parts/Parts\|part]] that can take the shape of a block, ball, cylinder, wedge, or corner wedge. |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | An imported [[30 Official Roblox Docs/Parts/Meshes\|mesh]] from 3D modeling software like Maya or Blender. |
| [[30 Official Roblox Docs/API Reference/Classes/TrussPart\|TrussPart]] | A truss beam that characters can climb like a ladder. |

While you can theoretically create a fully functional Roblox game using
just simple parts, you'll most likely import [[30 Official Roblox Docs/Parts/Meshes|meshes]] and combine primitive parts into more complex objects and structures through [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]].

### Scripts

You can add interactivity and behavior to your place's 3D world and define logic
with scripts. You write scripts in the Luau programming language to do things
like moving parts, calling other scripts, and responding to events. Because
Roblox works in a client-server model, you can run scripts on the server,
client, or have them communicate across the network boundary.

- A [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] object represents a script that can only run on the server.
- A [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] object represents a script that can only run on the
  client.
- A [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] object represents a reusable script that you can
  [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] from both
  server and client scripts.

For scripts to behave properly, you must place them in the correct containers in
the data model. For more information, see the [[30 Official Roblox Docs/Projects/Data model#Server|Server]] and [[30 Official Roblox Docs/Projects/Data model#Client|Client]] sections.

## Object organization

While you have a lot of flexibility in how you organize your data model, the
Roblox Engine expects certain objects to be in certain **container services**
which are objects that have specific behaviors and can affect the behaviors of
the objects they contain. The main categories of container services include:

- **Workspace** — [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] stores all objects that render in the 3D
  world.
- **Environment** — Containers like [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] and [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]]
  that contain objects for environmental settings and elements.
- **Replication** — Containers for content and logic that replicates between the
  server and client, such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and
  [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]].
- **Server** — Containers for server-side only content and logic, such as
  [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] and [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].
- **Client** — Containers for client-side content and logic, such as
  [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] and [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].
- **Chat** — Containers for objects that enable chat features, such as
  [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

> [!info]
> The Roblox Engine has many more services that provide
> built-in functionality that you can call within your scripts. The Roblox Engine
> doesn't give these services special treatment in the data model. For more
> information, see [[30 Official Roblox Docs/Scripting/Services|services]].

In addition, you can further organize your objects with the following objects:

- **Folders** — A [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] is for organizational purposes and doesn't
  define any behavior. For example, you can use folders to group similar objects
  like a set of scripts in server storage.
- **Models** — A [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is mainly intended for geometric groupings of
  parts, such as grouping together a desk set that includes a chair, table, and
  a lamp. To organize more complex sets, you can even nest models within models.

### Workspace

[[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] contains all objects that make up a place's 3D world. You can
add objects to the workspace to customize your 3D world, such as base parts,
mesh parts, and models. Clients render everything that appears in this container
and nothing outside of it, so you can control what users see and interact with
in your place. Although not actually rendered, you can also add scripts that are
parented to the parts and models that they are associated with. By default, the
workspace is pre-populated with a [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] and [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object.

#### Camera

[[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] determines how the client views the 3D world. By default, there
is one camera in the workspace, but you can add multiple camera objects for
creating different perspectives and views. Every client takes these settings and
creates its own camera view that the server can't directly modify.

For example, you can set a camera to follow user movements or stay fixed in a
particular location. You can also adjust the field of view, distance, and angle
to create different visual effects of how users view your 3D world.

For more information, see [[30 Official Roblox Docs/Workspace/Camera/Customize the camera|customize the camera]].

#### Terrain

[[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] lets you create landscapes for your place. You can apply a
material to the terrain to simulate desired natural environments, such as grass,
water, sand, or a custom material. Though you can only have one terrain object
for your 3D world and apply one material to that terrain, you can use the
[[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]] to edit regions of your
terrain.

For more information, see [[30 Official Roblox Docs/Parts/Environmental terrain|environmental terrain]].

### Environment

Custom lighting can make your 3D world much more immersive and realistic. The [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service contains objects that control global lighting settings of your place, such as [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] for simulating atmospheric effects or [[30 Official Roblox Docs/API Reference/Classes/Sky|Sky]] to alter the sun, moon, and stars in your environments. In addition, you can use [[30 Official Roblox Docs/Effects/Light sources|light sources]] to emit light from specific objects.

Adding [[30 Official Roblox Docs/Audio/Audio|audio]] to your games is also crucial for elevating your games to new heights. By strategically using positional and non-positional audio, you can immerse players into your worlds, provide them useful feedback for their actions, and direct their attention to what they need to do to be successful in their objectives.

### Replication

**Replication** is the process of the server synchronizing the state of your
place with all connected clients. The Roblox Engine intelligently and
automatically replicates data, physics, and chat messages between the server and
client for many cases, but you can also specify certain objects to replicate by
placing them in specific containers.

#### ReplicatedFirst

[[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] contains objects that you want to replicate to a client
when it joins your place. It typically contains objects that are essential to
initialize a player, such as client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] objects and the
objects associated with the scripts. All content in this container is replicated
from the server to the client only once.

#### ReplicatedStorage

[[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] contains objects that are available to both the server
and connected clients. Any changes that occur on the client persist but won't be
replicated to the server. The server can overwrite changes on the client to
maintain consistency. This container is typically used for [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]]
objects that need to be shared and accessed by both [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (server-side)
and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] (client-side) objects. In addition, you can use this
container to replicate any objects that don't need to exist in the 3D world
until needed, such as a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] for cloning and parenting to all
incoming character models.

For more information on how replication works, see [[30 Official Roblox Docs/Projects/Client-server runtime|client-server runtime]].

### Server

The data model defines dedicated containers for server-side only objects that
are never replicated to the client. This allows the server to affect client
behavior and state without exposing the server's objects and logic to the
client.

> [!info]
> You can use remote events and functions to allow
> client-side communication with the server.

#### ServerScriptService

[[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] contains [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects,
[[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] objects that are required by server scripts, and other
scripting-related objects that are only meant for server use. If your scripts
require other, non-scripting objects, you must place them in
[[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]]. Scripts in this container are never replicated to
clients, which allows you to have secure, server-side logic.

#### ServerStorage

[[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] contains objects that are only meant for server use. You
can use this container to store objects that you want to clone and parent to the
workspace or other containers at runtime. For example, you can store large
objects such as maps in this container until they are needed and move them into
the workspace only when required. This lets you decrease client network traffic
on initial join.

> [!info]
> Scripts don't run when they are parented to this
> container, but scripts inside [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] can access and run
> [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] objects in this container.

### Client

The client container services are meant for objects that are replicated to every
connected client. This category of containers replicate to every connected
client and typically contain 3D objects and associated [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]
objects. All objects you store in these containers are non-persistent across
sessions and reset every time a client rejoins. You can put objects in these
containers such as player GUIs, client-side scripts, and other objects that are
only relevant to the client.

When a client connects to a server, the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] container service
listens for users joining your place and creates a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object for
every client. The server copies the objects from the client containers in the
edit data model to the corresponding location in the runtime data model inside
the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] object. The following table describes the original container
it resides on in the container and the resulting container they are copied to on
the client:

| Edit data model | Runtime data model | Notes |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPack\|StarterPack]] | `Player.Backpack` | Scripts that set up the player's inventory and generally contain [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] objects but often contains local scripts as well. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]] | `Player.PlayerGui` | Scripts that can manage the player's local GUI. When a player respawns, the contents of PlayerGui are emptied. The server copies the objects inside StarterGui into the PlayerGui. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts\|StarterPlayerScripts]] | `Player.PlayerScripts` | General purpose scripts for the client. For example, if you want to create special effects on the client when certain conditions are met, you can place a local script in this container to do that. The server cannot access this container. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts\|StarterCharacterScripts]] | `Player.Character` | Scripts that are copied to the client when they spawn. These scripts do not persist when the player respawns. |
| [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst\|ReplicatedFirst]] |  | The contents of this container are replicated to all clients (but not back to the server) first, before anything else. |

> [!info]
> For more information on edit and runtime data models, see [[30 Official Roblox Docs/Projects/Client-server runtime#Client|client-server runtime]].

> [!warning]
> You don't add [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects to the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] container
> service explicitly.

### Chat

#### TextChatService

[[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] represents the service that handles various,
in-game text chat tasks, such as managing channels, decorating messages,
filtering text, creating commands, and developing custom chats interfaces.

For more information, see [[30 Official Roblox Docs/Chat/Text chat overview|text chat overview]].

#### VoiceChatService

[[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] represents the proximity-based voice chat
feature that simulates realistic communication based on how close you are to
other users. You can use this service to toggle the feature on and off.

For more information, see [[30 Official Roblox Docs/Chat/Voice Chat|voice chat]].

## Folders and models

There are two primary methods for grouping objects in the data model:
**folders** and **models**. Both are containers for objects, but they have
different purposes.

- **Folders** are best for storing sections of an environment, such as the lobby or a combat arena.
- **Models** are used for sets of objects, such as a desk set that includes a chair,
  table, and a lamp. To organize more complex sets, nest models inside models.

You should always name your objects descriptively. This makes it easy to
find and modify objects later on if needed.

*(image in the full Top G Vault)*

*Objects organized into [[30 Official Roblox Docs/API Reference/Classes/Folder|Folders]]*

*(image in the full Top G Vault)*

*Various "map" models to swap between [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]]*

---
*Source: [Data model](https://create.roblox.com/docs/projects/data-model) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
