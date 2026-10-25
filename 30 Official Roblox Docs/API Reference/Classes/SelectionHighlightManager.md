---
title: "SelectionHighlightManager"
description: "Studio service that draws selection outline highlights for the local user's selection and for Team Create collaborators' selections."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SelectionHighlightManager"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Studio service that draws selection outline highlights for the local user's selection and for Team Create collaborators' selections.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Studio-only service; not intended for experience scripts. Manages the selection outline highlights shown in the viewport. It tracks the [[30 Official Roblox Docs/API Reference/Classes/Selection|Selection]] service and, for each selected instance, creates a highlight with color and thickness matching the current selection style. Highlights are applied to [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] objects (excluding the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] itself) and recurse into [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] containers that have highlightable descendants; selected [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] UI objects are outlined with a drawn rectangle.

In Team Create, the service also renders other collaborators' selections using each collaborator's assigned color, and removes them when a collaborator goes idle or when a user toggles collaborator selection highlights off.

---
*Source: [SelectionHighlightManager](https://create.roblox.com/docs/reference/engine/classes/SelectionHighlightManager) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
