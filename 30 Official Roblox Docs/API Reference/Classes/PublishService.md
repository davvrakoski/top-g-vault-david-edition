---
title: "PublishService"
description: "A service that centralizes uploading assets to Roblox, including publishing cage mesh edits and creating assets or asset versions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PublishService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that centralizes uploading assets to Roblox, including publishing cage mesh edits and creating assets or asset versions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Requires `RobloxScript` security; used by Studio publishing and avatar-import workflows rather than ordinary experience code. Centralizes uploading assets to Roblox: publishing edited cage meshes from [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] instances, publishing an instance's descendant assets in parallel, and creating assets or asset versions while polling for the resulting asset ID.

---
*Source: [PublishService](https://create.roblox.com/docs/reference/engine/classes/PublishService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
