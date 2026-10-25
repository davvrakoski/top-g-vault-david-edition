---
title: "Projects"
description: "An overview of projects and games in Roblox."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of projects and games in Roblox.*

A Roblox project is a collection of [[30 Official Roblox Docs/Projects/Projects#Places|places]], [[30 Official Roblox Docs/Projects/Projects#Assets|assets]], [[30 Official Roblox Docs/Projects/Projects#Settings|settings]], and other resources that together represent a **game**. Roblox stores your projects in the cloud for convenient collaboration, editing, and version control. You create and manage projects with [[30 Official Roblox Docs/Studio/Roblox Studio|Roblox Studio]], an all‑in‑one IDE that provides building, scripting, testing, and publishing tools.

## Places

Games on Roblox are made up of individual **places**, comparable to scenes in Unity or maps in Unreal Engine. Each place contains all components for that portion of the game, including its specific environment, parts, meshes, scripts, and user interface.

See the pages for [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|creating and publishing]], [[30 Official Roblox Docs/Projects/Configure games and places|configuring]], and [[30 Official Roblox Docs/Projects/Release game updates|updating]] games and places for details.

*(image in the full Top G Vault)*

Every place is represented by a **data model**, a hierarchy of objects that describe everything about the place. The Roblox Engine uses the data model as a source of truth for a place's state, so it can simulate and render it on client devices. For more information on how the engine interprets the data model, see [[30 Official Roblox Docs/Projects/Client-server runtime|Client-server runtime]].

Proper, intentional object organization within the data model is essential for
functionality and maintenance of your project. For more information on what
objects are available and how to organize and use them, see
[[30 Official Roblox Docs/Projects/Data model|Data model]].

## Assets

In Roblox, assets such as images, meshes, and audio are stored as **cloud-based assets**, so you don't need to bundle local copies into a saved Studio game. Each asset in the cloud is assigned a unique **asset ID** from which multiple games can utilize them. You can create assets directly in Studio, such as models, or import assets like images, audio, and meshes from other tools.

`rbxassetid://7229442422`
*(image in the full Top G Vault)*

`rbxassetid://6768917255`
*(image in the full Top G Vault)*

`rbxassetid://9125402735`

[Audio: Boom-Impact.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/general/Boom-Impact.mp3)

By default, assets are private to your game and you can use an asset in any place by referencing its ID. You can also distribute them to the community in the [Creator Store](https://create.roblox.com/store/), so others can use them as well.

For more information on how to import and publish assets, see [Assets](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

## Packages

[Packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md) are reusable object hierarchies that you can define and reuse in multiple places across multiple games. For any large project, packages offer the following benefits:

- Packages can be used as asset kits, allowing you to duplicate a set of objects as needed.
- Packages make it easier to update assets. For instance, a package can include a tree that's duplicated many times in an environment. If you need to make a change, such as swap textures for the tree, it can be updated once in the package instead of for each individual instance.
- A package can start with graybox assets, and eventually be replaced with final art assets. When assets are replaced, they retain all original positions and orientations.

## Settings

Game settings are managed from the [Creator Dashboard](https://create.roblox.com/dashboard/creations) or within Studio, including:

- **Basic Info** — Basic information about the game, such as its name, description, and genre. Much of the information here is used in your game's listing.
- **Communication** — Settings which enable eligible users to use [[30 Official Roblox Docs/Chat/Voice Chat|voice chat]] or animate their avatar via their camera within your game.
- **Permissions** — Configures who can access your game. When games are first published, they are only accessible to you as the creator, users with **Edit** or **Playtest** access, and group members with the appropriate [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|roles and permissions]]. When you're ready, you can [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Release games|release]] the game to a wider audience.
- **Monetization** — Options for earning revenue from your game, as outlined in [[30 Official Roblox Docs/Production/Monetization/Monetization|Monetization]].
- **Localization** — Configuration for different [[30 Official Roblox Docs/Production/Localization/Localization|languages and regions]].
- **Avatar** — Settings related to avatars, such as avatar scaling and
  clothing overrides.

## Collaboration

With Studio's **built-in collaboration tools**, team members can contribute to
games independently on their own time, or alongside others. Key features
include:

- Group admins can manage which members have access to collaborate and which do
  not, effectively maintaining proper roles within a large team.
- Collaborators can build alongside other team members in real time and
  automatically see changes made by others.
- Collaborators can independently edit the same scripts that others may be
  editing, test locally, and commit their changes to the cloud-based project
  when ready.

For more information, see [[30 Official Roblox Docs/Projects/Collaboration|Collaboration]].

## Testing

Your [[30 Official Roblox Docs/Projects/Groups (teams)|team]] can instantly test a game on PC, mobile, VR, and other devices you wish to support through the Roblox app; no need to compile builds, deploy to app stores, or await app store approval.

Studio offers a suite of options for testing a game before releasing it to the public:

- **Rapid playtesting** that provides a close simulation of the game
  running on the Roblox application.
- **Multi-client simulation** for comparing how each client "sees" other clients
  within the game.
- **Device emulation** that provides insight on how controls operate on a mobile
  device or how on-screen UI displays on different screens and aspect ratios.
- **Collaborative playtesting** with members of your team.

For more information on each testing option, see [[30 Official Roblox Docs/Studio/Studio testing modes|Studio testing modes]].

---
*Source: [Projects](https://create.roblox.com/docs/projects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
