---
title: "ControllerPartSensor"
description: "A `SensorBase` that outputs data about another `BasePart` based on `Humanoid` floor and ladder detection logic."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ControllerPartSensor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] that outputs data about another [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] based on [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] floor and ladder detection logic.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]] → [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] that outputs data about another [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] based on [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] floor and ladder detection logic. It is primarily used for sending data to a character controller. Using a [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor|ControllerPartSensor]] allows you to detect [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the same manner as the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] uses for detecting floors and ladders.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitFrame\|HitFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The position in world space where the sensor hit the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart\|ControllerPartSensor.SensedPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitNormal\|HitNormal]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The surface normal at the position where the sensor hit the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart\|ControllerPartSensor.SensedPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#LadderSearchHeight\|LadderSearchHeight]] | float | The upper bound, in studs, of the vertical region the sensor searches for a ladder when [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode\|ControllerPartSensor.SensorMode]] is set to a ladder mode. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#LadderSearchOffset\|LadderSearchOffset]] | float | The downward offset, in studs, that positions the vertical region the sensor searches for a ladder when [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode\|ControllerPartSensor.SensorMode]] is set to a ladder mode. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SearchDistance\|SearchDistance]] | float | The distance from the sensor's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] to use when sensing other parts. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedMaterial\|SensedMaterial]] | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] | The surface [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart\|ControllerPartSensor.SensedPart]] that the sensor is currently detecting. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart\|SensedPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] hit by the sensor. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode\|SensorMode]] | [[30 Official Roblox Docs/API Reference/Enums/SensorMode\|SensorMode]] | Determines what behavior this [[30 Official Roblox Docs/API Reference/Classes/SensorBase\|SensorBase]] uses when sensing other parts. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]], [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HitFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true · **Capabilities:** Basic

The position in world space where the sensor hit the [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart|ControllerPartSensor.SensedPart]].

### HitNormal

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true · **Capabilities:** Basic

The surface normal at the position where the sensor hit the SensedPart.

### LadderSearchHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** Basic

Top of the vertical extent the sensor scans for a climbable ladder, in studs relative to the sensor's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Together with [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#LadderSearchOffset|ControllerPartSensor.LadderSearchOffset]], it defines the height range: the region extends upward to `LadderSearchHeight` minus `LadderSearchOffset`.

Defaults to `6`; clamped to non-negative values.

Only affects sensing when [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode|ControllerPartSensor.SensorMode]] is a ladder mode such as [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Ladder]]. Because `SensorMode` defaults to [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]], this has no effect until `SensorMode` is changed.

### LadderSearchOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** Basic

Downward offset, in studs relative to the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], that positions the vertical extent scanned for a climbable ladder. Behaves like a hip-height offset: increasing it lowers both the bottom and top of the searched region, and scales the rung-spacing tolerance used to decide whether a surface is climbable.

Defaults to `5`; clamped to non-negative values.

Only affects sensing when [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensorMode|ControllerPartSensor.SensorMode]] is a ladder mode such as [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Ladder]]. Because `SensorMode` defaults to [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]], this has no effect until `SensorMode` is changed.

### SearchDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** Basic

The distance from the sensor's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to use when sensing other parts.

### SensedMaterial

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Material|Material]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Surface [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] of the part the sensor currently detects, matching the material [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] floor and ladder detection report for the same contact. Updated as an output alongside [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#SensedPart|ControllerPartSensor.SensedPart]], [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitFrame|ControllerPartSensor.HitFrame]], and [[30 Official Roblox Docs/API Reference/Classes/ControllerPartSensor#HitNormal|ControllerPartSensor.HitNormal]] each time the sensor senses.

Defaults to [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material.Air]].

### SensedPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true · **Capabilities:** Basic

A reference to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] hit by the sensor.

### SensorMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SensorMode|SensorMode]]

**Thread safety:** ReadSafe · **Category:** Input · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines what behavior this [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] uses when sensing other parts.

A setting of [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Ladder]] performs the same ladder detection logic used by a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to populate sensor output. It currently always senses along the forward vector of its parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

A setting of [[30 Official Roblox Docs/API Reference/Enums/SensorMode|Enum.SensorMode.Floor]] performs the same floor detection logic used by a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to populate sensor output. It currently always senses along the negative up vector of the world.

---
*Source: [ControllerPartSensor](https://create.roblox.com/docs/reference/engine/classes/ControllerPartSensor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
