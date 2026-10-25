---
title: "RotationOrder"
description: "The order of rotation axes used for Euler angles encoding of rotations."
api_type: enum
aliases: ["Enum.RotationOrder"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/RotationOrder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The order of rotation axes used for Euler angles encoding of rotations.*

## Description

Euler angles encode a rotation in 3D space via a sequence of three rotations along the X, Y, and Z axes. The `RotationOrder` enum specifies the order in which the engine performs these rotations.

To help visualize the many rotation orders, you can test them manually in Studio with the [[30 Official Roblox Docs/Parts/Parts#Rotate|Rotate]] tool or by inserting [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] statements between individual rotations of a cube with a unique face:

```lua
local cube = Instance.new("Part")
cube.Shape = Enum.PartType.Block
local rx, ry, rz = math.rad(90), math.rad(90), math.rad(90)

task.wait(5)
cube.CFrame *= CFrame.fromEulerAngles(rx, 0, 0)  -- X
task.wait(5)
cube.CFrame *= CFrame.fromEulerAngles(0, ry, 0)  -- Y
task.wait(5)
cube.CFrame *= CFrame.fromEulerAngles(0, 0, rz)  -- Z
```

An equivalent operation is:

```lua
local cube = Instance.new("Part")
cube.Shape = Enum.PartType.Block
local rx, ry, rz = math.rad(90), math.rad(90), math.rad(90)

cube.CFrame = CFrame.fromEulerAngles(rx, ry, rz, Enum.RotationOrder.XYZ)
```

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `XYZ` | 0 | X, Y, Z order. |
| `XZY` | 1 | X, Z, Y order. |
| `YZX` | 2 | Y, Z, X order. |
| `YXZ` | 3 | Y, X, Z order. |
| `ZXY` | 4 | Z, X, Y order. |
| `ZYX` | 5 | Z, Y, X order. |

---
*Source: [RotationOrder](https://create.roblox.com/docs/reference/engine/enums/RotationOrder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
