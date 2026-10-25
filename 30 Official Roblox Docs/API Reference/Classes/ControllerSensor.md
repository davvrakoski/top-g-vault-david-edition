---
title: "ControllerSensor"
description: "An abstract base class for `SensorBase` types that supply sensory data to a character controller."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ControllerSensor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract base class for [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] types that supply sensory data to a character controller.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]] is an abstract base class for [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] types whose output is intended to be consumed by a physics-based character controller such as a [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]]. A [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] reads its [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#GroundSensor|ControllerManager.GroundSensor]] and [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#ClimbSensor|ControllerManager.ClimbSensor]], both of which are [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensors]], to determine how its [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart|ControllerManager.RootPart]] interacts with the world.

[[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]] adds no members of its own; it groups the concrete sensor types that provide controller-relevant data, such as [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]], which detects floors and ladders using the same logic as a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. Because it is abstract, you don't create a [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]] directly; use one of its subclasses instead.

---
*Source: [ControllerSensor](https://create.roblox.com/docs/reference/engine/classes/ControllerSensor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
