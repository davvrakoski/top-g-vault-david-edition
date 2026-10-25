---
title: "TeleportOptions"
description: "Optional input arguments to the `TeleportService:TeleportAsync()` function."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TeleportOptions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Optional input arguments to the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] function.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

This class is an optional parameter to the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] function that allows developers to provide arguments for the teleport call.

Certain arguments in this class are not compatible with each other and cause an error when passed to [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]]:

- ReservedServerAccessCode + ServerInstanceId
- ShouldReserveServer + ServerInstanceId
- ShouldReserveServer + ReservedServerAccessCode

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ReservedServerAccessCode\|ReservedServerAccessCode]] | string | The reserved server access code that indicates the reserved server that the teleport should be to. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ServerInstanceId\|ServerInstanceId]] | string | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|DataModel.JobId]] of the server instance to teleport to. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ShouldReserveServer\|ShouldReserveServer]] | boolean | A flag to indicate if a reserved server should be allocated and the players should then be teleported to this allocation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#GetTeleportData\|GetTeleportData()]] | Variant | Returns the teleport data stored in the [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions\|TeleportOptions]] instance by [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData\|TeleportOptions:SetTeleportData()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData\|SetTeleportData()]] | () | Setter function for data to be passed to the destination place. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ReservedServerAccessCode

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Teleport

This property indicates the reserved server access code for the reserved server that the user(s) should be teleported to.

The access code is obtained either from [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync|TeleportService:ReserveServerAsync()]] or from [[30 Official Roblox Docs/API Reference/Classes/TeleportAsyncResult#ReservedServerAccessCode|TeleportAsyncResult.ReservedServerAccessCode]].

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

### ServerInstanceId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Teleport

This property indicates the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]] of the server instance the user(s) should be teleported to.

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

### ShouldReserveServer

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Teleport

This property indicates whether the teleport call should create a new reserved server. When set to true, a reserved server will be created and the player(s) will be teleported to the new server.

If set to false, the player(s) will be teleported to the public server with the specified [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ServerInstanceId|TeleportOptions.ServerInstanceId]] if provided. When [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ServerInstanceId|TeleportOptions.ServerInstanceId]] is blank or no matching server is found, a new public server will be created to teleport the player(s) to.

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

## Methods

### GetTeleportData

```lua
TeleportOptions:GetTeleportData(): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Teleport

This function returns the teleport data stored in the [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] instance by [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData|TeleportOptions:SetTeleportData()]].

Once a player has teleported, teleport data can be retrieved using the [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] and [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]] functions.

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

**Returns**

| Type | Description |
| --- | --- |
| Variant | The teleport data previously stored by [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData\|TeleportOptions:SetTeleportData()]], or nil if no data was set. |

### SetTeleportData

```lua
TeleportOptions:SetTeleportData(teleportData: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Teleport

This is a setter function for data to be passed to the destination place. On the destination place, this data can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] or [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]].

For example, the following snippet would send the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|DataModel.PlaceId]] and [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]] in a dictionary passing the teleport data in a [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] instance using [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#SetTeleportData|TeleportOptions:SetTeleportData()]]:

```lua
-- Server
local teleportOptions = Instance.new("TeleportOptions")
local teleportData = {
    placeId = game.PlaceId,
    jobId = game.JobId
}
teleportOptions:SetTeleportData(teleportData)
TeleportService:TeleportAsync(game.PlaceId, {player}, teleportOptions)
```

This data could then be retrieved upon arrival using the GetLocalPlayerTeleportData() function as follows:

```lua
-- Client
local TeleportService = game:GetService("TeleportService")

local teleportData = TeleportService:GetLocalPlayerTeleportData()
if teleportData then
    local placeId = teleportData.placeId
    local jobId = teleportData.JobId
end
```

If no `teleportData` was set in the teleportation function this GetLocalPlayerTeleportData() will return `nil`.

#### Allowed data types

Teleport data may only contain value types. It cannot contain [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] or other types that reference engine state, as these cannot safely cross the boundary between servers.

Allowed:

- Primitives: `bool`, `number`, and `string`
- Value types such as [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]], [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]], [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], `Enum` items, and similar
- Tables and arrays (without mixed keys) containing only the allowed types above, nested up to a reasonable depth and size

Not allowed (these will be removed from the data before the teleport completes):

- [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and instance references
- [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|Connections]], [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]], and functions
- `SharedTable`
- Types that reference engine or [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] state, such as [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]], [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]], and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]]

If teleport data contains a disallowed type, that value is removed and an error is written to the developer console. Convert instance references to plain values (for example, a numeric ID or a string path).

For more information on how to send and receive user data along with teleports, see, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleporting Between Places]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `teleportData` | Variant |  | Data to be passed to the destination place. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [TeleportOptions](https://create.roblox.com/docs/reference/engine/classes/TeleportOptions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
