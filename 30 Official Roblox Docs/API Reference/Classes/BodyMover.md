---
title: "BodyMover"
description: "Base class for objects that continually exert forces to assemblies."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyMover"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Base class for objects that continually exert forces to assemblies.*

> [!warning] Deprecated
> This class has been deprecated. See the
> [mover constraints](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md) article for an
> overview of `Class.BodyMover` replacements, as well as the
> [legacy conversion notes](30%20Official%20Roblox%20Docs/Physics/Mover%20constraints.md#legacy-mover-conversion).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]], [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]], [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]], [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]], [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]], [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]], [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion|RocketPropulsion]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Deprecated`

## Description

`BodyMover` is the abstract base class for the set of legacy objects that exert forces to assemblies in different ways. In general, the subclasses of `BodyMover` are:

- [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] exerts a force relative to world coordinates.
- [[30 Official Roblox Docs/API Reference/Classes/BodyPosition|BodyPosition]] exerts force to maintain a certain world position.
- [[30 Official Roblox Docs/API Reference/Classes/BodyVelocity|BodyVelocity]] exerts force to maintain a certain velocity.
- [[30 Official Roblox Docs/API Reference/Classes/BodyThrust|BodyThrust]] exerts a force relative to object coordinates which applies torque if positioned in a certain way.
- [[30 Official Roblox Docs/API Reference/Classes/BodyGyro|BodyGyro]] exerts torque to maintain a certain orientation.
- [[30 Official Roblox Docs/API Reference/Classes/BodyAngularVelocity|BodyAngularVelocity]] exerts torque to maintain a certain angular velocity.
- [[30 Official Roblox Docs/API Reference/Classes/RocketPropulsion|RocketPropulsion]] exerts both translational and rotational forces to cause an assembly to track down another.

---
*Source: [BodyMover](https://create.roblox.com/docs/reference/engine/classes/BodyMover) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
