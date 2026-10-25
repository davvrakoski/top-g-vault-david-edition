---
area: "01 Start Here"
cluster: "Start Here"
title: "Roblox Glossary for New Developers"
tags: [roblox, community-knowledge, start-here, glossary, terminology]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/data-model
  - https://create.roblox.com/docs/projects/client-server
  - https://create.roblox.com/docs/production/publishing/publish-games-and-places
  - https://create.roblox.com/docs/production/monetization/passes
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/creator-rewards
  - https://create.roblox.com/docs/production/monetization/developer-exchange
---
# Roblox Glossary for New Developers

Roblox has its own vocabulary, and tutorials, DevForum posts and job listings assume you know it. Not knowing that a "place" is not a "game", or that "studs" are the unit of length, makes everything harder to read. This glossary covers the terms a beginner meets in the first months, grouped by topic, in plain words.

## Project structure

| Term | Meaning |
| --- | --- |
| **Experience / game** | What players join. Roblox's docs now say "game" again; older docs say "experience". Has a Universe ID |
| **Place** | One level/map inside a game, with its own data model. A game has a start place and may have more (lobby, dungeon) |
| **Universe** | Internal name for a game and all its places |
| **Data model** | The tree of every object in a place, rooted at `game` |
| **Instance** | Any object in the tree: a Part, a Script, a Folder, a Player |
| **Service** | A top-level system object (`Workspace`, `Players`, `ReplicatedStorage`), fetched with `game:GetService()` |
| **Workspace** | The service holding the 3D world |
| **Uncopylocked** | A game whose owner allows anyone to open an editable copy |

## Building

| Term | Meaning |
| --- | --- |
| **Stud** | Roblox length unit; part sizes and speeds are in studs (walk speed default 16 studs/second) |
| **Part / BasePart** | A physical block, sphere, wedge etc. BasePart is the parent class of all part types, including MeshPart |
| **MeshPart** | A part using an imported 3D mesh |
| **Model** | A group of instances that moves together (`Ctrl+G`) |
| **Anchored** | Frozen in place, ignores gravity |
| **Assembly** | Parts welded together that physics moves as one body |
| **Attachment / Constraint** | A point on a part / a physical link between attachments (hinge, spring, rope, weld) |
| **Terrain** | Voxel landscape (grass, water, rock) made with the Terrain Editor |
| **CFrame** | Coordinate frame: position plus rotation in one value |
| **Vector3** | An X, Y, Z value, used for positions, sizes and directions |

## Characters

| Term | Meaning |
| --- | --- |
| **Character** | The player's avatar model in the world |
| **Humanoid** | The object inside a character that handles health, walking, jumping and animation |
| **HumanoidRootPart** | The invisible root part of a character; its position is the character's position |
| **R6 / R15** | Avatar rigs with 6 or 15 body parts; R15 is the modern default |
| **Rig** | A character skeleton you can animate |
| **Spawn / SpawnLocation** | Pad where characters appear |

## Scripting

| Term | Meaning |
| --- | --- |
| **Luau** | Roblox's language, derived from Lua 5.1, with types and extras |
| **Script / LocalScript / ModuleScript** | Server-or-client code / client-only code / reusable code loaded with `require` |
| **RunContext** | Property deciding whether a Script runs as server or client |
| **Event / Connection** | Something that fires (`Touched`) / your function hooked to it with `:Connect` |
| **Debounce** | A cooldown flag that stops an event triggering repeatedly |
| **RemoteEvent / RemoteFunction** | Messages between client and server |
| **Replication** | The server copying world changes to clients |
| **Network ownership** | Which machine simulates a part's physics (players own their own character) |
| **StreamingEnabled** | Clients receive only the nearby part of the map; far parts can be missing |
| **Attribute / Tag** | Custom value on an instance / a label to group instances (CollectionService) |
| **Tween** | Smooth property animation via TweenService |
| **leaderstats** | The Folder name that makes values show in the player list |
| **DataStore** | Cloud storage for persistent data like saves |
| **MemoryStore / MessagingService** | Fast temporary cross-server data / cross-server messages |
| **Open Cloud** | Web APIs to manage games and data from outside Roblox |

## Tools and collaboration

| Term | Meaning |
| --- | --- |
| **Studio** | The editor |
| **Creator Hub / Creator Dashboard** | Website for docs and for managing games, items, analytics, money |
| **Toolbox / Creator Store** | Asset browser / marketplace of models, audio, plugins |
| **Asset ID** | Numeric ID of an uploaded asset (`rbxassetid://123`) |
| **Package** | A reusable asset whose copies update together |
| **Plugin** | A Studio extension |
| **Team Create** | Real-time collaborative editing |
| **Free model** | A free Creator Store model; may contain malicious scripts |
| **Backdoor** | Hidden code that gives someone remote control of your game |
| **Exploiter** | A player running cheat software that can edit their own client |

## Money and metrics

| Term | Meaning |
| --- | --- |
| **Robux** | Roblox's virtual currency |
| **Pass (game pass)** | One-time purchase for a permanent perk |
| **Developer product** | Purchase that can be bought repeatedly (currency packs, revives) |
| **Creator Rewards** | Program paying Robux for driving daily engagement and audience expansion |
| **DevEx** | Developer Exchange: cashing out earned Robux for real money, if eligible |
| **CCU** | Concurrent users: players online in your game at once |
| **DAU / MAU** | Daily / monthly active users |
| **D1 / D7 retention** | Share of new players who return 1 / 7 days later |
| **Session length** | How long a visit lasts |
| **ARPDAU** | Average revenue per daily active user |

## Genre slang

**Obby** (obstacle course), **Tycoon** (build-and-earn), **Simulator** (click/grind and upgrade), **Roleplay/RP** (social life sim), **Tower defense**, **Round-based** (lobby, then matches), **Hangout** (social space), **Grind** (repeating actions to progress).

## Related
[[00 START HERE - Top G Vault]] · [[Client and Server in Plain Words]] · [[The Data Model and Finding Objects - GetService, FindFirstChild, WaitForChild]] · [[Roblox 2026 Platform Snapshot]] · [[Knowledge Graph]]
