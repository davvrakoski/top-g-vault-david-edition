---
title: "FluidForceSensor"
description: "A `SensorBase` that outputs `Force`, `Torque` and `CenterOfPressure`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FluidForceSensor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] that outputs [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Force|Force]], [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Torque|Torque]] and [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#CenterOfPressure|CenterOfPressure]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`FluidForceSensor` is a [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] which outputs the results of fluid force simulation from the last physics frame for the part it is attached to. The sensor outputs the [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Force|Force]], [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Torque|Torque]] and [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#CenterOfPressure|CenterOfPressure]] which were computed by the fluid force simulation on the last physics frame.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#CenterOfPressure\|CenterOfPressure]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Assembly center of pressure offset from its center of mass in world coordinates. |
| [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Force\|Force]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Assembly fluid force in world coordinates. |
| [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Torque\|Torque]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Assembly fluid torque in world coordinates. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#EvaluateAsync\|EvaluateAsync()]] | Tuple | Asynchronously computes force, torque, and center of pressure for the parent part of a sensor given provided inputs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CenterOfPressure

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Assembly center of pressure offset from its center of mass in world coordinates.

### Force

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Assembly fluid force in world coordinates.

### Torque

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Assembly fluid torque in world coordinates.

## Methods

### EvaluateAsync

```lua
FluidForceSensor:EvaluateAsync(linearVelocity: Vector3, angularVelocity: Vector3, cframe: CFrame): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Asynchronously computes force, torque, and center of pressure for the parent part of a sensor given provided inputs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `linearVelocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Linear velocity in world coordinates. |
| `angularVelocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Angular velocity in world coordinates. |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] to be used for evaluation. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Force\|Force]], [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#Torque\|Torque]] and [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor#CenterOfPressure\|CenterOfPressure]] calculated given the input parameters. |

---
*Source: [FluidForceSensor](https://create.roblox.com/docs/reference/engine/classes/FluidForceSensor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
