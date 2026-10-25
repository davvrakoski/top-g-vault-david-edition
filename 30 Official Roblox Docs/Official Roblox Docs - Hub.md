---
title: "Official Roblox Docs - Hub"
area: "30 Official Roblox Docs"
cluster: "Hub"
source: "https://create.roblox.com/docs"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, hub]
cssclasses: [tg-a30]
---

# Official Roblox Docs - Hub

An offline, Obsidian-ready mirror of the official **Roblox Creator Documentation** ([create.roblox.com/docs](https://create.roblox.com/docs)), converted from Roblox's open-source [creator-docs repository](https://github.com/Roblox/creator-docs) (commit `4e795e65a41f`, pulled 2026-10-25).

- **993 guide pages** (every page under `content/en-us`, folder structure kept)
- **1208 Engine API reference notes** (one per class, data type, enum, library and global)
- Images used by the pages are stored locally in `_assets/`; videos and downloadable files link to the original files on GitHub.
- Internal doc links and `Class.X` / `Enum.X` references are Obsidian wikilinks; pages that are not part of the repo (for example the generated Open Cloud REST reference) link to create.roblox.com.

## Start here: 30 most useful pages for game devs

1. [[30 Official Roblox Docs/Scripting/Scripting|Scripting]] - Scripting overview: scripts, LocalScripts, ModuleScripts
2. [[30 Official Roblox Docs/Projects/Client-server runtime|Client-server runtime]] - How server and client code split
3. [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|Remote events and callbacks]] - RemoteEvents / RemoteFunctions across the network
4. [[30 Official Roblox Docs/Scripting/Reuse code|Reuse code]] - Reusable code with ModuleScripts
5. [[30 Official Roblox Docs/Scripting/Services|Services]] - Engine services (Players, ReplicatedStorage, ...)
6. [[30 Official Roblox Docs/Scripting/Script types and locations|Script types and locations]] - Where each script type runs
7. [[30 Official Roblox Docs/Scripting/Properties and attributes|Properties and attributes]] - Attributes for custom data on instances
8. [[30 Official Roblox Docs/Scripting/Parallel Luau|Parallel Luau]] - Parallel Luau and Actors
9. [[30 Official Roblox Docs/Scripting/Security/Security and cheat mitigation tactics|Security and cheat mitigation tactics]] - Anti-exploit and server validation
10. [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data stores]] - Saving player data
11. [[30 Official Roblox Docs/Cloud Services/Data Stores/Best practices for data stores|Best practices for data stores]] - Data store design that scales
12. [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits|Data store error codes and limits]] - Data store limits and errors
13. [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|Memory stores]] - Fast cross-server state (queues, sorted maps)
14. [[30 Official Roblox Docs/Cloud Services/Cross-server messaging|Cross-server messaging]] - MessagingService between servers
15. [[30 Official Roblox Docs/Players/Leaderboards|Leaderboards]] - Built-in leaderstats
16. [[30 Official Roblox Docs/Players/In-game tools|In-game tools]] - Tools players can equip
17. [[30 Official Roblox Docs/Characters/Pathfinding|Pathfinding]] - NPC pathfinding
18. [[30 Official Roblox Docs/Animation/Use animations|Use animations]] - Playing animations from scripts
19. [[30 Official Roblox Docs/Workspace/Raycasting|Raycasting]] - Raycasting for hits and line of sight
20. [[30 Official Roblox Docs/Workspace/CFrames|CFrames]] - CFrames: position and rotation math
21. [[30 Official Roblox Docs/Workspace/Collisions|Collisions]] - Collision groups and filtering
22. [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|Instance streaming]] - Instance streaming for big maps
23. [[30 Official Roblox Docs/Physics/Network ownership|Network ownership]] - Physics network ownership
24. [[30 Official Roblox Docs/UI/User interface|User interface]] - Building user interfaces
25. [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] - Cross-device input actions
26. [[30 Official Roblox Docs/Performance Optimization/Improve performance|Improve performance]] - Fixing common performance problems
27. [[30 Official Roblox Docs/Production/Monetization/Developer Products|Developer Products]] - Developer products (repeatable purchases)
28. [[30 Official Roblox Docs/Production/Monetization/Passes|Passes]] - Passes (one-time purchases)
29. [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]] - Teleporting between places
30. [[30 Official Roblox Docs/Luau/Type checking|Type checking]] - Luau type checking

## Engine API reference

- [[30 Official Roblox Docs/API Reference/API Reference|API Reference overview]]
- [[30 Official Roblox Docs/API Reference/Classes/_Index - Classes|Classes]] - 628 notes
- [[30 Official Roblox Docs/API Reference/Datatypes/_Index - Datatypes|Datatypes]] - 49 notes
- [[30 Official Roblox Docs/API Reference/Enums/_Index - Enums|Enums]] - 518 notes
- [[30 Official Roblox Docs/API Reference/Libraries/_Index - Libraries|Libraries]] - 11 notes
- [[30 Official Roblox Docs/API Reference/Globals/_Index - Globals|Globals]] - 2 notes

Most used: [[30 Official Roblox Docs/API Reference/Classes/Players|Players]], [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]], [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]], [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]], [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]], [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]], [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], [[30 Official Roblox Docs/API Reference/Libraries/task|task]], [[30 Official Roblox Docs/API Reference/Libraries/math|math]]

## Luau language reference

- [[30 Official Roblox Docs/Luau Language/Luau Language - Index|Luau Language index]] - 23 pages from the official Luau docs at luau.org (MIT License, © Roblox Corporation and Lua.org, PUC-Rio): syntax, type checking, standard library, performance, linting.

## Sections (guide pages per section)

| Section | Pages | Folder |
| --- | --- | --- |
| AI | 4 | `30 Official Roblox Docs/AI` |
| Animation | 10 | `30 Official Roblox Docs/Animation` |
| Art | 77 | `30 Official Roblox Docs/Art` |
| Assistant | 5 | `30 Official Roblox Docs/Assistant` |
| Audio | 4 | `30 Official Roblox Docs/Audio` |
| Avatar | 43 | `30 Official Roblox Docs/Avatar` |
| Avatar Setup | 2 | `30 Official Roblox Docs/Avatar Setup` |
| Characters | 9 | `30 Official Roblox Docs/Characters` |
| Chat | 14 | `30 Official Roblox Docs/Chat` |
| Cloud | 37 | `30 Official Roblox Docs/Cloud` |
| Cloud Services | 21 | `30 Official Roblox Docs/Cloud Services` |
| Creator Programs | 21 | `30 Official Roblox Docs/Creator Programs` |
| Education | 167 | `30 Official Roblox Docs/Education` |
| Effects | 6 | `30 Official Roblox Docs/Effects` |
| Environment | 7 | `30 Official Roblox Docs/Environment` |
| General | 18 | `30 Official Roblox Docs/General` |
| Get Started | 8 | `30 Official Roblox Docs/Get Started` |
| IP Licensing | 6 | `30 Official Roblox Docs/IP Licensing` |
| Input | 6 | `30 Official Roblox Docs/Input` |
| Luau | 22 | `30 Official Roblox Docs/Luau` |
| Marketplace | 12 | `30 Official Roblox Docs/Marketplace` |
| Matchmaking | 6 | `30 Official Roblox Docs/Matchmaking` |
| Parts | 10 | `30 Official Roblox Docs/Parts` |
| Performance Optimization | 13 | `30 Official Roblox Docs/Performance Optimization` |
| Physics | 29 | `30 Official Roblox Docs/Physics` |
| Players | 10 | `30 Official Roblox Docs/Players` |
| Production | 124 | `30 Official Roblox Docs/Production` |
| Projects | 25 | `30 Official Roblox Docs/Projects` |
| Resources | 51 | `30 Official Roblox Docs/Resources` |
| Scripting | 22 | `30 Official Roblox Docs/Scripting` |
| Sound | 4 | `30 Official Roblox Docs/Sound` |
| Studio | 27 | `30 Official Roblox Docs/Studio` |
| Tutorials | 135 | `30 Official Roblox Docs/Tutorials` |
| UI | 28 | `30 Official Roblox Docs/UI` |
| Workspace | 10 | `30 Official Roblox Docs/Workspace` |
| API Reference | 1208 | `30 Official Roblox Docs/API Reference` |
| Luau Language (luau.org, MIT) | 23 | `30 Official Roblox Docs/Luau Language` |

## What is not included

- **Videos and downloads** (about 4.7 GB of .mp4 plus .zip/.rbxl/.fbx files) are not copied; each one is a link to the file in the GitHub repo.
- **Engine API code samples**: the API YAML only stores sample IDs; their code is not in the open-source repo, so each note names the IDs and links to the live page. Code that appears inside descriptions is included.
- **Open Cloud REST reference** (generated from OpenAPI JSON) is not converted; links point to create.roblox.com.
- A few interactive landing-page widgets (React components) are rebuilt as plain text, headings, images and links.

## Attribution and license

> [!info] Attribution
> Content from Roblox Creator Docs (github.com/Roblox/creator-docs), © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.

- Prose license: `LICENSE-CC-BY-4.0.txt` in this folder (Creative Commons Attribution 4.0 International, copied from the repo's `LICENSE`)
- Code license: `LICENSE-CODE-MIT.txt` in this folder (MIT, Copyright (c) 2023 Roblox Corporation, copied from the repo's `LICENSE-CODE`)
- Every note carries `source:` (its create.roblox.com URL) and `license:` in its frontmatter, plus a source line at the bottom.
- "Formatting only" means: MDX/React components turned into Obsidian callouts, headings, tables and images; links rewritten to work inside the vault; API YAML laid out as notes; React landing-page widgets rebuilt from their own data. The wording of the docs is unchanged; the only added text is source/attribution lines and short notes where an image or generated table is missing.
- Roblox is a trademark of Roblox Corporation. This mirror is not made, endorsed or sponsored by Roblox.

> [!info] Attribution (Luau Language folder)
> Content from the Luau documentation (github.com/luau-lang/site), Copyright (c) 2019-2026 Roblox Corporation, Copyright (c) 1994-2019 Lua.org, PUC-Rio, MIT License (full text in `Luau Language/LICENSE-LUAU-MIT.txt`). Converted for Obsidian; changes: formatting only.
