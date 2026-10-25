---
title: "Folder"
description: "A simple container used to hold and organize Roblox instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Folder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A simple container used to hold and organize Roblox instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/GeneratedFolder|GeneratedFolder]]
- **Memory category:** Instances

## Description

A simple container used to hold and organize Roblox instances. Unlike other container classes like [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], a folder generally offers no additional functionality. Folders behave the same way as folders in a computer file system, meaning they can also be parented to each other.

#### Usage in UI Hierarchies

Each [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] in your UI hierarchy can define its own [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] ([[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout|UIGridLayout]], [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]], [[30 Official Roblox Docs/API Reference/Classes/UITableLayout|UITableLayout]]), or use a default position-based layout. For example, you can set up a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] with multiple [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] children, each with a different [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] type. Additionally, [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] contents are exempt from the effects of a [[30 Official Roblox Docs/API Reference/Classes/UILayout|UILayout]] sibling.

---
*Source: [Folder](https://create.roblox.com/docs/reference/engine/classes/Folder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
