---
title: "ProcessInstancePhysicsService"
description: "An internal engine service that generates collision geometry (physics data) for `MeshPart` and `PartOperation` instances that need new physics."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ProcessInstancePhysicsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An internal engine service that generates collision geometry (physics data) for [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances that need new physics.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

An internal engine service with no scriptable properties, methods, events, or callbacks. It computes collision geometry (physics data) for instances whose collision mesh needs to be built or rebuilt, including [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances (from [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshId]]) and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances from solid modeling, at the requested [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity|Enum.CollisionFidelity]].

---
*Source: [ProcessInstancePhysicsService](https://create.roblox.com/docs/reference/engine/classes/ProcessInstancePhysicsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
