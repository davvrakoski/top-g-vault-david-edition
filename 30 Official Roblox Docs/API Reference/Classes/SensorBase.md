---
title: "SensorBase"
description: "An abstract class for various sensor instance types."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SensorBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class for various sensor instance types.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/AtmosphereSensor|AtmosphereSensor]], [[30 Official Roblox Docs/API Reference/Classes/BuoyancySensor|BuoyancySensor]], [[30 Official Roblox Docs/API Reference/Classes/ControllerSensor|ControllerSensor]], [[30 Official Roblox Docs/API Reference/Classes/FluidForceSensor|FluidForceSensor]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A [[30 Official Roblox Docs/API Reference/Classes/SensorBase|SensorBase]] is an instance that, when parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], outputs additional data about the world around that part. Often, other systems will consume the sensor's output data.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SensorBase#UpdateType\|UpdateType]] | [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType\|SensorUpdateType]] | Determines how the sensor will update its output data. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SensorBase#Sense\|Sense()]] | () | **Deprecated.** Recomputes the sensor's output properties immediately. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SensorBase#OnSensorOutputChanged\|OnSensorOutputChanged]] |  | Fires when one of the sensor's output properties changes value. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### UpdateType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|SensorUpdateType]]

**Thread safety:** ReadSafe · **Category:** Settings · **Loaded/Saved:** true/true

Determines how the sensor will update its output data.

With [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.OnRead]], internal sensor logic is run so that the output properties are always up to date. In this mode, the sensor will only run if you read the properties and they are currently outdated.

With [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.Manual]], the output properties will never change. Instead, you can write your own scripts to set the output properties as you like.

## Methods

### Sense

> [!warning] Deprecated
> This method should not be used in new work.

```lua
SensorBase:Sense(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Recomputes the sensor's output properties immediately.

This method is deprecated and should not be used in new work. When [[30 Official Roblox Docs/API Reference/Classes/SensorBase#UpdateType|UpdateType]] is [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.OnRead]] (the default), the sensor recalculates its output properties automatically the next time you read them, so calling this method is unnecessary. When [[30 Official Roblox Docs/API Reference/Classes/SensorBase#UpdateType|UpdateType]] is [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.Manual]], the outputs are never recomputed automatically; set the output properties yourself rather than calling this method.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### OnSensorOutputChanged

```lua
SensorBase.OnSensorOutputChanged()
```

Fires when one of the sensor's output properties changes value. The event carries no arguments; read the relevant output property to get its new value.

A sensor only recomputes its outputs while [[30 Official Roblox Docs/API Reference/Classes/SensorBase#UpdateType|UpdateType]] is [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.OnRead]] (the default), so with the default update type this event fires as the outputs are recalculated on read. When [[30 Official Roblox Docs/API Reference/Classes/SensorBase#UpdateType|UpdateType]] is [[30 Official Roblox Docs/API Reference/Enums/SensorUpdateType|Enum.SensorUpdateType.Manual]], the outputs — and therefore this event — change only when you set the output properties yourself.

---
*Source: [SensorBase](https://create.roblox.com/docs/reference/engine/classes/SensorBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
