---
title: "PlayerScripts"
description: "A container for client-side scripts to be run inside `Player` objects within the `Players` service."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PlayerScripts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container for client-side scripts to be run inside [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects within the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

`PlayerScripts` is a container object located inside [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects within the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service. It is created automatically when a player joins the game and its main purpose is to contain client scripts copied from the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] container within the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] service.

Unlike the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] containers, the `PlayerScripts` container is not accessible to the server and server‑side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects will not run when parented to `PlayerScripts`.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#ClearComputerCameraMovementModes\|ClearComputerCameraMovementModes()]] | () | Unregisters all `ComputerCameraMovementMode` enums from the game's settings menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#ClearComputerMovementModes\|ClearComputerMovementModes()]] | () | Unregisters all `ComputerMovementMode` enums from the game's settings menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#ClearTouchCameraMovementModes\|ClearTouchCameraMovementModes()]] | () | Unregisters all `TouchCameraMovementMode` enums from the game's settings menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#ClearTouchMovementModes\|ClearTouchMovementModes()]] | () | Unregisters all `TouchMovementMode` enums from the game's settings menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterComputerCameraMovementMode\|RegisterComputerCameraMovementMode()]] | () | Registers that a computer camera movement mode is available to be selected from the game menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterComputerMovementMode\|RegisterComputerMovementMode()]] | () | Registers that a computer movement mode is available to be selected from the game menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterTouchCameraMovementMode\|RegisterTouchCameraMovementMode()]] | () | Registers that a touch camera movement mode is available to be selected from the game menu. |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterTouchMovementMode\|RegisterTouchMovementMode()]] | () | Registers that a touch movement mode is available to be selected from the game menu. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClearComputerCameraMovementModes

```lua
PlayerScripts:ClearComputerCameraMovementModes(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Removes every [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|Enum.ComputerCameraMovementMode]] currently registered on this [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance, so the in-experience settings menu offers no computer camera modes until one is registered again with [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterComputerCameraMovementMode|PlayerScripts:RegisterComputerCameraMovementMode()]]. The call always notifies the settings menu, which rebuilds its camera-mode options to reflect the now-empty set.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClearComputerMovementModes

```lua
PlayerScripts:ClearComputerMovementModes(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Removes every [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|Enum.ComputerMovementMode]] currently registered on this [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance, so the in-experience settings menu offers no computer movement modes until one is registered again with [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterComputerMovementMode|PlayerScripts:RegisterComputerMovementMode()]]. The call always notifies the settings menu, which rebuilds its movement-mode options to reflect the now-empty set.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClearTouchCameraMovementModes

```lua
PlayerScripts:ClearTouchCameraMovementModes(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Removes every [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|Enum.TouchCameraMovementMode]] currently registered on this [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance, so the in-experience settings menu offers no touch camera modes until one is registered again with [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterTouchCameraMovementMode|PlayerScripts:RegisterTouchCameraMovementMode()]]. The call always notifies the settings menu, which rebuilds its camera-mode options to reflect the now-empty set.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClearTouchMovementModes

```lua
PlayerScripts:ClearTouchMovementModes(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Removes every [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode]] currently registered on this [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance, so the in-experience settings menu offers no touch movement modes until one is registered again with [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts#RegisterTouchMovementMode|PlayerScripts:RegisterTouchMovementMode()]]. The call always notifies the settings menu, which rebuilds its movement-mode options to reflect the now-empty set.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterComputerCameraMovementMode

```lua
PlayerScripts:RegisterComputerCameraMovementMode(cameraMovementMode: ComputerCameraMovementMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Adds `cameraMovementMode` to the set of [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|Enum.ComputerCameraMovementMode]] options a player can select in the in-experience settings menu on mouse-and-keyboard devices. A new [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance is pre-populated with the default computer camera modes ([[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|Enum.ComputerCameraMovementMode.Default]], [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|Enum.ComputerCameraMovementMode.Classic]], and [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|Enum.ComputerCameraMovementMode.Follow]]); the first call to this method clears that default set so that only the modes you explicitly register are offered, and each later call adds one more. Registering a mode notifies the settings menu so its list of camera options updates.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cameraMovementMode` | [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode\|ComputerCameraMovementMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode\|Enum.ComputerCameraMovementMode]] to add to the selectable options in the settings menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterComputerMovementMode

```lua
PlayerScripts:RegisterComputerMovementMode(movementMode: ComputerMovementMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Adds `movementMode` to the set of [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|Enum.ComputerMovementMode]] options a player can select in the in-experience settings menu on mouse-and-keyboard devices. A new [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance is pre-populated with the default computer movement modes ([[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|Enum.ComputerMovementMode.Default]], [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|Enum.ComputerMovementMode.KeyboardMouse]], and [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|Enum.ComputerMovementMode.ClickToMove]]); the first call to this method clears that default set so that only the modes you explicitly register are offered, and each later call adds one more. Registering a mode notifies the settings menu so its list of movement options updates.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `movementMode` | [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode\|ComputerMovementMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode\|Enum.ComputerMovementMode]] to add to the selectable options in the settings menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterTouchCameraMovementMode

```lua
PlayerScripts:RegisterTouchCameraMovementMode(cameraMovementMode: TouchCameraMovementMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Adds `cameraMovementMode` to the set of [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|Enum.TouchCameraMovementMode]] options a player can select in the in-experience settings menu on touch devices. A new [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance is pre-populated with the default touch camera modes ([[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|Enum.TouchCameraMovementMode.Default]], [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|Enum.TouchCameraMovementMode.Classic]], and [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|Enum.TouchCameraMovementMode.Follow]]); the first call to this method clears that default set so that only the modes you explicitly register are offered, and each later call adds one more. Registering a mode notifies the settings menu so its list of camera options updates.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cameraMovementMode` | [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode\|TouchCameraMovementMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode\|Enum.TouchCameraMovementMode]] to add to the selectable options in the settings menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RegisterTouchMovementMode

```lua
PlayerScripts:RegisterTouchMovementMode(movementMode: TouchMovementMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

Adds `movementMode` to the set of [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode]] options a player can select in the in-experience settings menu on touch devices. A new [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] instance is pre-populated with the default touch movement modes ([[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode.Default]], [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode.Thumbstick]], [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode.ClickToMove]], and [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|Enum.TouchMovementMode.DynamicThumbstick]]); the first call to this method clears that default set so that only the modes you explicitly register are offered, and each later call adds one more. Registering a mode notifies the settings menu so its list of movement options updates.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `movementMode` | [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode\|TouchMovementMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode\|Enum.TouchMovementMode]] to add to the selectable options in the settings menu. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [PlayerScripts](https://create.roblox.com/docs/reference/engine/classes/PlayerScripts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
