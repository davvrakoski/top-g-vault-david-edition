---
title: "StudioDeviceSimulatorService"
description: "Service allowing you to control Studio's Device Simulator."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioDeviceSimulatorService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service allowing you to control Studio's Device Simulator.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Provides programmatic control over Studio's Device Simulator. Use this service to switch between device presets, override resolution and pixel density, control orientation and scaling, and manage custom device profiles from a plugin or from an external tool connected through the MCP server.

All methods are asynchronous and yield the calling coroutine. The service is available in **Edit mode** and **Play Client**. Methods that modify the active simulation state are blocked in **PlayServer** mode.

##### Limitations

- All methods are asynchronous and yield the calling coroutine.
- Methods that modify the active simulation state (`SetDeviceAsync`, `StopSimulationAsync`, `SetOrientationAsync`, `SetResolutionAsync`, `SetPixelDensityAsync`, `SetScalingModeAsync`) error in PlayServer mode. They work in Edit mode and Play Client.
- `UpdateDeviceAsync` and `RemoveDeviceAsync` error when called on built-in presets.
- Resolution, DPI, and scaling mode methods require an active device and error when `GetDeviceAsync()` returns "default".
- Resolution and DPI overrides are session-level. They are not persisted and are cleared on `SetDeviceAsync`.
- Built-in presets are immutable.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#CreateDeviceAsync\|CreateDeviceAsync()]] | string | Creates a custom device preset and returns its ID. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetDeviceAsync\|GetDeviceAsync()]] | string | Returns the ID of the currently active device, or `"default"` if none is active. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetDeviceInfoAsync\|GetDeviceInfoAsync()]] | Dictionary | Returns the configuration dictionary for the specified device. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetDeviceListAsync\|GetDeviceListAsync()]] | Array | Returns an array of all available device IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetOrientationAsync\|GetOrientationAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] | Returns the current simulated screen orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetPixelDensityAsync\|GetPixelDensityAsync()]] | float | Returns the current simulated pixel density in DPI. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetResolutionAsync\|GetResolutionAsync()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Returns the current simulated viewport resolution. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetScalingModeAsync\|GetScalingModeAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|DeviceSimulatorScalingMode]] | Returns how the simulated resolution currently maps to the Studio viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#RemoveDeviceAsync\|RemoveDeviceAsync()]] | () | Removes a custom device from the catalog. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetDeviceAsync\|SetDeviceAsync()]] | () | Activates the specified device or stops simulation if `"default"` is passed. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetOrientationAsync\|SetOrientationAsync()]] | () | Sets the simulated screen orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetPixelDensityAsync\|SetPixelDensityAsync()]] | () | Overrides the simulated pixel density in DPI for the current session. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetResolutionAsync\|SetResolutionAsync()]] | () | Overrides the simulated viewport resolution for the current session. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetScalingModeAsync\|SetScalingModeAsync()]] | () | Sets how the simulated resolution maps to the Studio viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#StopSimulationAsync\|StopSimulationAsync()]] | () | Stops the active device simulation. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#UpdateDeviceAsync\|UpdateDeviceAsync()]] | () | Updates the configuration of an existing custom device. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#ConfigurationChanged\|ConfigurationChanged]] |  | Fires when the active simulation state changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateDeviceAsync

```lua
StudioDeviceSimulatorService:CreateDeviceAsync(config: Dictionary): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Creates a custom device and returns its newly assigned ID. Custom devices are persisted to disk and appear in the Device Simulator UI.

Errors if any required field is missing or out of range.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | Dictionary |  | A dictionary describing the new device. Required fields: `Name` (string, 1-200 characters, cannot be `"default"`), `Width` (int, 1-7680 pixels), `Height` (int, 1-4320 pixels), `PixelDensity` (int, 72-10000 DPI). Optional fields: `DeviceForm` ([[30 Official Roblox Docs/API Reference/Enums/DeviceForm\|Enum.DeviceForm]], default Phone), `ResolutionScale` (float, default 1.0, max 10.0), `PortraitKeyboardHeight` (int, default 0), `LandscapeKeyboardHeight` (int, default 0). |

**Returns**

| Type | Description |
| --- | --- |
| string | string |

*Code samples for this member (`StudioDeviceSimulatorService-CreateDeviceAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetDeviceAsync

```lua
StudioDeviceSimulatorService:GetDeviceAsync(): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the ID of the currently active device, or `"default"` if no device is active.

**Returns**

| Type | Description |
| --- | --- |
| string | string |

### GetDeviceInfoAsync

```lua
StudioDeviceSimulatorService:GetDeviceInfoAsync(deviceId: string): Dictionary
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns a `DeviceConfiguration` for the specified device without activating it. Useful for inspecting presets before choosing one to switch to.

The returned dictionary contains the following fields:

| Field | Type | Create/Update | Description |
| --- | --- | --- | --- |
| `DeviceId` | string | Read-only | Unique identifier assigned by the service. |
| `Name` | string | Required | Display name. 1 to 200 characters. Cannot be `"default"`. |
| `Width` | number | Required | Screen width in pixels. Range: 1 to 7680. |
| `Height` | number | Required | Screen height in pixels. Range: 1 to 4320. |
| `PixelDensity` | number | Required | Pixel density in DPI. Range: 72 to 10000. |
| `DeviceForm` | [[30 Official Roblox Docs/API Reference/Enums/DeviceForm\|Enum.DeviceForm]] | Optional (default: Phone) | One of Phone, Tablet, Desktop, Console, VR. |
| `IsCustom` | boolean | Read-only | `true` if the device was user-created. |
| `ResolutionScale` | number | Optional (default: 1.0) | Resolution scaling factor. Must be greater than 0, max 10.0. |
| `PortraitKeyboardHeight` | number | Optional (default: 0) | Virtual keyboard height in portrait mode. |
| `LandscapeKeyboardHeight` | number | Optional (default: 0) | Virtual keyboard height in landscape mode. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deviceId` | string |  | The unique identifier of the device to query. Must be a valid ID from `GetDeviceListAsync()`; cannot be `"default"`. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the device configuration and passed to `CreateDeviceAsync` and `UpdateDeviceAsync`. |

### GetDeviceListAsync

```lua
StudioDeviceSimulatorService:GetDeviceListAsync(): Array
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns an array of device IDs for all available presets, including built-in and custom devices.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of device IDs. |

*Code samples for this member (`StudioDeviceSimulatorService-GetDeviceListAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetOrientationAsync

```lua
StudioDeviceSimulatorService:GetOrientationAsync(): ScreenOrientation
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the current simulated orientation.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] | ScreenOrientation |

### GetPixelDensityAsync

```lua
StudioDeviceSimulatorService:GetPixelDensityAsync(): float
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the current simulated pixel density.

**Returns**

| Type | Description |
| --- | --- |
| float | number |

### GetResolutionAsync

```lua
StudioDeviceSimulatorService:GetResolutionAsync(): Vector2
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the current simulated resolution.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Vector2 |

### GetScalingModeAsync

```lua
StudioDeviceSimulatorService:GetScalingModeAsync(): DeviceSimulatorScalingMode
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the current [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode|Enum.DeviceSimulatorScalingMode]] for how the simulated resolution maps to the Studio viewport. See [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetScalingModeAsync|SetScalingModeAsync()]] for the available modes.

Requires an active device; errors when `GetDeviceAsync()` returns `"default"`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|DeviceSimulatorScalingMode]] | The current [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|Enum.DeviceSimulatorScalingMode]]. |

### RemoveDeviceAsync

```lua
StudioDeviceSimulatorService:RemoveDeviceAsync(deviceId: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Removes a custom device.

Errors if the target is a built-in preset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deviceId` | string |  | The unique identifier of the custom device to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetDeviceAsync

```lua
StudioDeviceSimulatorService:SetDeviceAsync(deviceId: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Activates the specified device. Passing `"default"` stops simulation and is equivalent to calling `StopSimulationAsync`.

Errors in PlayServer mode. Errors if the device ID does not exist.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deviceId` | string |  | The unique identifier of the device to activate, or `"default"` to stop simulation. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetOrientationAsync

```lua
StudioDeviceSimulatorService:SetOrientationAsync(orientation: ScreenOrientation): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Sets or gets the simulated screen orientation. Accepts Portrait, LandscapeLeft, or LandscapeRight. Other values will error.

Errors in PlayServer mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `orientation` | [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|ScreenOrientation]] |  | The target screen orientation. Accepted values are [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|Enum.ScreenOrientation.Portrait]], [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|Enum.ScreenOrientation.LandscapeLeft]], or [[30 Official Roblox Docs/API Reference/Enums/ScreenOrientation\|Enum.ScreenOrientation.LandscapeRight]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPixelDensityAsync

```lua
StudioDeviceSimulatorService:SetPixelDensityAsync(density: float): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Overrides or returns the simulated pixel density in DPI. Session-level; cleared on device switch.

This method requires an active device. `SetPixelDensityAsync` also errors in PlayServer mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `density` | float |  | The pixel density override in DPI. Must be between 72 and 10000. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetResolutionAsync

```lua
StudioDeviceSimulatorService:SetResolutionAsync(width: int, height: int): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Overrides the simulated viewport resolution or returns the current resolution as a Vector2. Overrides are session-level and cleared when you switch devices.

Coordinates are in landscape space: the first parameter maps to the horizontal axis in landscape, the second to the vertical axis. In portrait, axes are swapped automatically.

Both methods require an active device. They error if `GetDeviceAsync()` returns `"default"`. `SetResolutionAsync` also errors in PlayServer mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | int |  | The viewport width in pixels (horizontal axis in landscape orientation). Range: 1 to 7680. |
| `height` | int |  | The viewport height in pixels (vertical axis in landscape orientation). Range: 1 to 4320. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetScalingModeAsync

```lua
StudioDeviceSimulatorService:SetScalingModeAsync(mode: DeviceSimulatorScalingMode): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Controls how the simulated resolution maps to the Studio viewport.

- `ScaleToPhysicalSize` scales the viewport to approximate physical device size.
- `ActualResolution` renders at exact pixel resolution.
- `FitToWindow` scales to fill the viewport.

Both methods require an active device. `SetScalingModeAsync` also errors in PlayServer mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|DeviceSimulatorScalingMode]] |  | The scaling mode to apply. One of [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|Enum.DeviceSimulatorScalingMode.ScaleToPhysicalSize]], [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|Enum.DeviceSimulatorScalingMode.ActualResolution]], or [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode\|Enum.DeviceSimulatorScalingMode.FitToWindow]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### StopSimulationAsync

```lua
StudioDeviceSimulatorService:StopSimulationAsync(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Stops the active simulation. Prefer this over `SetDeviceAsync("default")` for clarity.

Errors in PlayServer mode.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UpdateDeviceAsync

```lua
StudioDeviceSimulatorService:UpdateDeviceAsync(deviceId: string, config: Dictionary): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Updates a custom device's configuration.

Errors if the target is a built-in preset.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deviceId` | string |  | The unique identifier of the custom device to update. |
| `config` | Dictionary |  | A dictionary of device fields to apply. Uses patch semantics: omitted optional fields retain their current values. Same schema as `CreateDeviceAsync()`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StudioDeviceSimulatorService-UpdateDeviceAsync`) are published on the source page; their code is not part of the open-source repo.*

## Events

### ConfigurationChanged

```lua
StudioDeviceSimulatorService.ConfigurationChanged()
```

**Security:** PluginSecurity

Fires when the active simulation state changes: device switch, orientation, resolution, pixel density, scaling mode, or user interaction with the Device Simulator UI. Does not fire for catalog-only operations such as `CreateDeviceAsync`, `UpdateDeviceAsync` on a non-active device, `RemoveDeviceAsync` on a non-active device, or `GetDeviceInfoAsync`.

Getter calls inside the handler are async and will yield.

*Code samples for this member (`StudioDeviceSimulatorService-ConfigurationChanged`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [StudioDeviceSimulatorService](https://create.roblox.com/docs/reference/engine/classes/StudioDeviceSimulatorService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
