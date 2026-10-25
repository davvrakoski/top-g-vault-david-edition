---
area: "01 Start Here"
cluster: "Start Here"
title: "Explorer, Properties and Toolbox - Beginner Field Guide"
tags: [roblox, community-knowledge, start-here, studio, explorer, toolbox]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/explorer
  - https://create.roblox.com/docs/studio/properties
  - https://create.roblox.com/docs/projects/assets/toolbox
  - https://create.roblox.com/docs/tutorials/curriculums/studio/explore-ui
---
# Explorer, Properties and Toolbox - Beginner Field Guide

These three windows are where you spend most of your time outside the viewport. Explorer answers "what exists and where", Properties answers "how is it set up", and Toolbox answers "where do I get assets". Beginners lose hours because a script sits in the wrong Explorer folder, or because a property they never noticed (like `Anchored`) is wrong, so it pays to learn these windows on purpose.

## Explorer: the tree of everything

The Explorer shows every object and service in the open place. That tree is the **data model**. Each place in a game has its own tree, so switching places changes what you see.

Top-level entries you will touch first:

| Service | Beginner meaning |
| --- | --- |
| `Workspace` | The 3D world players see |
| `Lighting` | Sky, time of day, atmosphere |
| `ReplicatedStorage` | Shared stuff both server and players can read |
| `ServerScriptService` | Server code (players never receive it) |
| `ServerStorage` | Server-only objects you clone in later |
| `StarterGui` | UI copied to each player |
| `StarterPack` | Tools copied to each player's backpack |
| `StarterPlayer` | Holds `StarterPlayerScripts` and `StarterCharacterScripts` |
| `SoundService` | Global sounds and audio settings |
| `Teams` | Team objects (if your game uses teams) |

Handy Explorer actions:
- Hover a parent and click **(+)** to insert a child object directly in the right place.
- `Ctrl+D` duplicates into the same parent. `Ctrl+Shift+V` (**Paste Into**) pastes inside the selected object. Plain `Ctrl+V` pastes into Workspace, which surprises people.
- `Ctrl+Shift+X` jumps to the Explorer search box. Search, then `Ctrl+A` selects only the matches.
- Arrow keys walk the tree: Right expands, Left goes to the parent, Home/End jump to top/bottom.
- `Ctrl+G` groups as a Model, `Ctrl+Alt+G` groups as a Folder.

**Rule of thumb:** name things as you create them. Forty objects called `Part` are unreadable, to you and to scripts.

## Properties: the settings panel

Select anything and Properties lists its settings in groups (Appearance, Data, Behavior, Collision and so on). Tips:
- Use the filter box at the top to find a property by name.
- Multi-select objects to change one property on all of them at once.
- The **Attributes** section lets you add your own named values (for example `Damage = 10`) that scripts read with `GetAttribute`.
- The **Tags** section lets you tag instances so one script can find them all through `CollectionService`.

The properties behind most beginner bugs are listed in [[Part Properties Every Beginner Must Know]].

## Toolbox: assets, with care

| Tab | Contents |
| --- | --- |
| **Creator Store** | Free and paid assets from Roblox and other creators |
| **Inventory** | Assets you or your groups uploaded or took from the store |
| **Recent** | What you used lately |
| **Creations** | Like Inventory, but only things you made |

Safety routine before keeping any free model:
1. Save your place first so you can revert.
2. Insert the model, then search Explorer inside it for `Script`, `LocalScript` and `ModuleScript`.
3. Open each script. Delete anything with `require(` plus a long number, `getfenv`, `loadstring`, or unreadable obfuscated text.
4. Prefer assets from verified creators or from Roblox itself.

Full routine: [[Plugin and Free Model Safety Checklist]].

## Pitfalls

- **Wrong parent:** a part pasted into Workspace instead of inside your Model breaks scripts that expect `script.Parent.Door`.
- **Hidden duplicates:** two children with the same name under one parent. Scripts grab one of them and you get "random" bugs. Rename.
- **Cannot click a part:** it is probably `Locked`. Select it in Explorer and untick `Locked`.

## Related
[[00 START HERE - Top G Vault]] · [[Install Studio and Your First Hour - Interface Tour]] · [[Free Model Backdoors - Spot and Remove Them]] · [[CollectionService Tag-Driven Architecture]] · [[30 Official Roblox Docs/Studio/Explorer window|Explorer window (official)]]
