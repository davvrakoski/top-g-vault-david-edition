---
title: "PackageService"
description: "Manages Roblox Studio packages, tracking their metadata and versions and handling updates to package contents."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PackageService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Manages Roblox Studio packages, tracking their metadata and versions and handling updates to package contents.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/PackageService|PackageService]] manages packages in Roblox Studio. A package is a reusable asset built from an instance tree that keeps a link back to its source asset so changes can be published to and pulled from every place that uses it.

The service tracks lightweight metadata for each package, including its latest published version number, the creator's identity, and the current user's access permissions. It also drives operations on package contents: requesting and loading a package's instances, checking whether a package has been modified relative to its published version, and updating a package tree to a newer version or reverting it to its published state.

---
*Source: [PackageService](https://create.roblox.com/docs/reference/engine/classes/PackageService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
