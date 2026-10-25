---
title: "AudioDeviceInput"
description: "Produces audio streams from physical devices, such as microphones."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioDeviceInput"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Produces audio streams from physical devices, such as microphones.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] produces audio streams from physical devices, such as microphones. It provides a single **Output** pin which can be connected to other pins via [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]. [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] has properties for selecting which [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is producing the stream, and controlling whether or not they are muted.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType\|AccessType]] | [[30 Official Roblox Docs/API Reference/Enums/AccessModifierType\|AccessModifierType]] | Determines whether the list of user IDs provided to [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#SetUserIdAccessList\|SetUserIdAccessList]] is treated as an allow-list or deny-list. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Active\|Active]] | boolean | Controls whether the physical device is actively recording. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#IsReady\|IsReady]] | boolean | Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] is ready to produce sound. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Muted\|Muted]] | boolean | Controls whether this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] is muted. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Player\|Player]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | Determines whose device is producing sound. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Volume\|Volume]] | float | Volume level which is multiplied onto the output audio stream. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#GetUserIdAccessList\|GetUserIdAccessList()]] | Array | Returns a list of user IDs that are either permitted to hear or blocked from hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#SetUserIdAccessList\|SetUserIdAccessList()]] | () | Sets a list of user IDs that are either permitted to hear or blocked from hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccessType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AccessModifierType|AccessModifierType]]

**Thread safety:** ReadSafe · **Category:** Permissions · **Loaded/Saved:** true/true · **Capabilities:** Audio, Input

Determines whether the list of user IDs provided to [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#SetUserIdAccessList|SetUserIdAccessList]] is treated as an allow-list or deny-list.

If [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType|AccessType]] is [[30 Official Roblox Docs/API Reference/Enums/AccessModifierType|Enum.AccessModifierType.Allow]], then **only** the supplied user IDs are **permitted** to hear this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]]. If [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType|AccessType]] is [[30 Official Roblox Docs/API Reference/Enums/AccessModifierType|Enum.AccessModifierType.Deny]], then **only** the supplied user IDs are **blocked** from hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]].

Since player voices are networked, this property should only be assigned from the server in order to replicate properly.

### Active

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Recording · **Loaded/Saved:** true/true · **Capabilities:** Audio, Input

Controls whether the physical device is actively recording. This property is only set by Roblox core scripts, but it may be read by user scripts. Generally, an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] may only be producing sound if [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Active|Active]] is true **and** [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Muted|Muted]] is false.

### IsReady

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Recording · **Loaded/Saved:** false/true · **Capabilities:** Audio, Input · **Tags:** `ReadOnly`, `NotReplicated`

Denotes whether this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] is ready to produce sound, meaning all network connections have been established.

### Muted

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Recording · **Loaded/Saved:** true/true · **Capabilities:** Audio, Input

Controls whether this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] is muted. Unlike [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Active|Active]], this property is publicly scriptable.

Generally, an [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] may only be heard if [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Active|Active]] is true **and** [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Muted|Muted]] is false.

*Code samples for this member (`audio-wiring---push-to-talk`) are published on the source page; their code is not part of the open-source repo.*

### Player

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]

**Thread safety:** ReadSafe · **Category:** Recording · **Loaded/Saved:** true/true · **Capabilities:** Audio, Input, Players

Determines whose device is producing sound. In order to replicate properly, this should only be assigned from the server. Assigning this property locally generally does not work, unless [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#Player|Player]] is [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]].

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Audio, Input

Volume level which is multiplied onto the output audio stream. Ranges from 0 to 3.

## Methods

### GetConnectedWires

```lua
AudioDeviceInput:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Input

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] has one "Output" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetInputPins

```lua
AudioDeviceInput:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Input

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
AudioDeviceInput:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Input

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]], this is `Output` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetUserIdAccessList

```lua
AudioDeviceInput:GetUserIdAccessList(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Input

Returns a list of user IDs that are either permitted to hear or blocked from hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]], depending on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType|AccessType]].

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of user IDs that are either in the allow-list or the deny-list. |

### SetUserIdAccessList

```lua
AudioDeviceInput:SetUserIdAccessList(userIds: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** Audio, Input

Sets a list of user IDs that are either permitted to hear or blocked from hearing this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]], depending on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput#AccessType|AccessType]].

Note that this method replicates from server to client; in general, it should only be called from the server in order to replicate properly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userIds` | Array |  | An array of user IDs to apply to this [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]]. |

**Returns**

| Type | Description |
| --- | --- |
| () | void |

## Events

### WiringChanged

```lua
AudioDeviceInput.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** Audio, Input

Event that fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput\|AudioDeviceInput]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [AudioDeviceInput](https://create.roblox.com/docs/reference/engine/classes/AudioDeviceInput) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
