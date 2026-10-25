---
title: "VehicleSeat"
description: "A seat object that can be used to control a vehicle."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VehicleSeat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A seat object that can be used to control a vehicle.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `VehicleSeat` objects welds a player to the seat when the player touches the seat. It then forwards the movement inputs to any connected motor joints, allowing control of a vehicle.

While `VehicleSeat` is great for making simple vehicles they do have some limitations. Movement control will only detect motors connected directly to the vehicle seat, or through another rigid connection. This means that if you have a wheel connected to a beam which is then welded to the seat it will work fine, however if you have the wheel connected to a part, which is connected by a hinge to the rest of the car, it will not work.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#AreHingesDetected\|AreHingesDetected]] | int | Displays how many hinges are detected by the `VehicleSeat`. Useful for debugging vehicle designs. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Disabled\|Disabled]] | boolean | Toggles whether the `VehicleSeat` is active or not. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#HeadsUpDisplay\|HeadsUpDisplay]] | boolean | If `true`, a UI speed bar will be displayed on screen that tells you what speed the vehicle is moving at. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#MaxSpeed\|MaxSpeed]] | float | The maximum speed that can be attained. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Occupant\|Occupant]] | [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] that is sitting in the seat. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Steer\|Steer]] | int | **Deprecated.** The direction of movement, tied to left and right movement inputs. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#SteerFloat\|SteerFloat]] | float | The left-to-right movement float, tied to left and right movement inputs. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Throttle\|Throttle]] | int | **Deprecated.** The direction of throttle, tied to forward and backward movement inputs. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#ThrottleFloat\|ThrottleFloat]] | float | The forward-to-reverse throttle float, tied to forward and backward movement inputs. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Torque\|Torque]] | float | How fast the vehicle will be able to attain [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#MaxSpeed\|MaxSpeed]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#TurnSpeed\|TurnSpeed]] | float | The speed at which the vehicle will turn. Higher numbers can cause problems and are not necessarily better. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Sit\|Sit()]] | () | Forces the character with the specified [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] to sit in the `VehicleSeat`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AreHingesDetected

**Type:** int

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Basic, AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

Displays how many hinges are detected by the `VehicleSeat`. Useful for debugging vehicle designs.

### Disabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

Toggles whether the `VehicleSeat` is active or not. If the seat is disabled, it will not automatically weld a character to it on collision and will not allow a character to control the connected vehicle.

### HeadsUpDisplay

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

If `true`, a UI speed bar will be displayed on screen that tells you what speed the vehicle is moving at.

### MaxSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

The maximum speed that can be attained.

### Occupant

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Basic, AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] that is sitting in the seat.

### Steer

> [!warning] Deprecated
> This property is no longer replicated and has been deprecated in favor of
> `Class.VehicleSeat.SteerFloat|SteerFloat` which is a float variant and
> should be used instead.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior · **Tags:** `NotReplicated`

The direction of movement, tied to left and right movement inputs. Can be either `1` (right), `0` (straight), or `-1` (left). Will refresh back to `0` unless constantly set.

### SteerFloat

**Type:** float

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

The left-to-right movement float, tied to left and right movement inputs. Can range between `1` (right) and `-1` (left). Will refresh back to `0` (straight) unless constantly set.

### Throttle

> [!warning] Deprecated
> This property is not longer replicated and has been deprecated in favor of
> `Class.VehicleSeat.ThrottleFloat|ThrottleFloat` which is a float variant
> and should be used instead.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior · **Tags:** `NotReplicated`

The direction of throttle, tied to forward and backward movement inputs. Can be either `1` (forward), `0` (null), or `-1` (reverse). Will refresh back to `0` unless constantly set.

### ThrottleFloat

**Type:** float

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

The forward-to-reverse throttle float, tied to forward and backward movement inputs. Can range between `1` (forward) and `-1` (reverse). Will refresh back to `0` (null) unless constantly set.

### Torque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

How fast the vehicle will be able to attain [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#MaxSpeed|MaxSpeed]]. The greater the number, the faster it will reach the maximum speed.

### TurnSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Basic, AvatarBehavior

The speed at which the vehicle will turn. Higher numbers can cause problems and are not necessarily better.

## Methods

### Sit

```lua
VehicleSeat:Sit(humanoid: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, AvatarBehavior

Forces the character with the specified [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to sit in the `VehicleSeat`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoid` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] being forced to sit in the `VehicleSeat`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [VehicleSeat](https://create.roblox.com/docs/reference/engine/classes/VehicleSeat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
