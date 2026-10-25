---
title: "UserGameSettings"
description: "`UserGameSettings` is a singleton class found inside of the `UserSettings` singleton. It holds various persistent settings relating to how the user wants to control their camera, and their character."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UserGameSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`UserGameSettings` is a singleton class found inside of the [[30 Official Roblox Docs/API Reference/Classes/UserSettings|UserSettings]] singleton. It holds various persistent settings relating to how the user wants to control their camera, and their character.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`UserGameSettings` is a singleton class found inside of the [[30 Official Roblox Docs/API Reference/Classes/UserSettings|UserSettings]] singleton. It holds various persistent settings relating to how the user wants to control their camera, and their character.

The properties on this class reflect both the user-facing options exposed in the in-game settings menu (such as graphics quality, master volume, camera and control modes) as well as other contextual user-configurable state that is not surfaced in the menu itself (such as internal onboarding progress, VR comfort options, window layout, and debug or profiling configuration). As a result, some properties listed here may not correspond to anything visible in the settings UI, and many are restricted to internal Roblox scripts.

You can access this object from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] via:

```lua
UserSettings():GetService("UserGameSettings")
```

This object is intended to be used on the client only, as it serves no purpose on the server. It will also reflect your own settings when testing in Roblox Studio.

*Code samples for this API (`UserGameSettings-Listener`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/UserGameSettings); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#AllTutorialsDisabled\|AllTutorialsDisabled]] | boolean | Indicates whether all in-game tutorials have been disabled by the user. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#BadgeVisible\|BadgeVisible]] | boolean | Indicates whether badge notifications are visible to the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#CameraMode\|CameraMode]] | [[30 Official Roblox Docs/API Reference/Enums/CustomCameraMode\|CustomCameraMode]] | The custom camera mode currently in-use by the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#ChatVisible\|ChatVisible]] | boolean | Indicates whether the in-game chat is visible to the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#ComputerCameraMovementMode\|ComputerCameraMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode\|ComputerCameraMovementMode]] | The camera movement mode currently in-use by the client on desktop. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#ComputerMovementMode\|ComputerMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode\|ComputerMovementMode]] | The type of controls being used by the client on desktop. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#ControlMode\|ControlMode]] | [[30 Official Roblox Docs/API Reference/Enums/ControlMode\|ControlMode]] | **Deprecated.** Toggles whether or not the client can use the Mouse Lock Switch mode. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#Fullscreen\|Fullscreen]] | boolean | Indicates whether the client's window is currently in full screen mode. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GamepadCameraSensitivity\|GamepadCameraSensitivity]] | float | Describes how sensitive the camera is when using a gamepad. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GraphicsOptimizationMode\|GraphicsOptimizationMode]] | [[30 Official Roblox Docs/API Reference/Enums/GraphicsOptimizationMode\|GraphicsOptimizationMode]] | The graphics optimization mode used by the client to balance visual quality and performance. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GraphicsQualityLevel\|GraphicsQualityLevel]] | int | The current graphics quality level being used by the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#HasEverUsedVR\|HasEverUsedVR]] | boolean | Indicates whether the user has ever launched the client in VR mode. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#MasterVolume\|MasterVolume]] | float | A float between 0 and 1 representing the volume of the game's client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#MasterVolumeStudio\|MasterVolumeStudio]] | float | A float between 0 and 1 representing the master volume used in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#MaxQualityEnabled\|MaxQualityEnabled]] | boolean | Indicates whether the client's graphics quality is set to the maximum available level. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#MouseSensitivity\|MouseSensitivity]] | float | A float between 0 and 4 representing the sensitivity of the client's camera sensitivity. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#OnboardingsCompleted\|OnboardingsCompleted]] | string | A comma-separated list of onboarding IDs that the user has completed. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#PartyVoiceVolume\|PartyVoiceVolume]] | float | A float between 0 and 1 representing the volume of party voice chat. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#PeoplePageLayout\|PeoplePageLayout]] | [[30 Official Roblox Docs/API Reference/Enums/PeoplePageLayout\|PeoplePageLayout]] | The layout style used to display the people page in the in-game menu. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#PlayerListVisible\|PlayerListVisible]] | boolean | Indicates whether the in-game player list is visible to the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#PlayerNamesEnabled\|PlayerNamesEnabled]] | boolean | Indicates whether player names are displayed above characters in the game. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#RCCProfilerRecordFrameRate\|RCCProfilerRecordFrameRate]] | int | Internal MicroProfiler setting specifying the frame rate used when capturing server-side RCC profiler data. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#RCCProfilerRecordTimeFrame\|RCCProfilerRecordTimeFrame]] | int | Internal MicroProfiler setting specifying the duration over which server-side RCC profiler data is captured. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#RotationType\|RotationType]] | [[30 Official Roblox Docs/API Reference/Enums/RotationType\|RotationType]] | Controls how the client's character is rotated. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#SavedQualityLevel\|SavedQualityLevel]] | [[30 Official Roblox Docs/API Reference/Enums/SavedQualitySetting\|SavedQualitySetting]] | The graphics quality level set by the client. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#StartMaximized\|StartMaximized]] | boolean | Indicates whether Roblox Studio should launch in a maximized window. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#StartScreenPosition\|StartScreenPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The screen position of the client's window when the application launches. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#StartScreenSize\|StartScreenSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of the client's window when the application launches. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#TouchCameraMovementMode\|TouchCameraMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode\|TouchCameraMovementMode]] | The camera type in-use by the client while on a mobile device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#TouchMovementMode\|TouchMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode\|TouchMovementMode]] | The type of controls being used by the client on a mobile device. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#UsedCoreGuiIsVisibleToggle\|UsedCoreGuiIsVisibleToggle]] | boolean | Indicates whether the user has toggled the visibility of core GUI elements. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#UsedCustomGuiIsVisibleToggle\|UsedCustomGuiIsVisibleToggle]] | boolean | Indicates whether the user has toggled the visibility of custom GUI elements. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#UsedHideHudShortcut\|UsedHideHudShortcut]] | boolean | Indicates whether the user has used the keyboard shortcut for hiding the HUD. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VignetteEnabled\|VignetteEnabled]] | boolean | Indicates whether the VR vignette comfort effect is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VoiceChatVolume\|VoiceChatVolume]] | float | A float between `0` and `2` representing the volume of in-game voice chat. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VREnabled\|VREnabled]] | boolean | Indicates whether the client is currently running in VR mode. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VRRotationIntensity\|VRRotationIntensity]] | int | The intensity of camera rotation when turning in VR. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#VRSmoothRotationEnabled\|VRSmoothRotationEnabled]] | boolean | Indicates whether smooth rotation is used instead of snap rotation in VR. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GetCameraYInvertValue\|GetCameraYInvertValue()]] | int | Returns the camera's Y-invert value. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GetOnboardingCompleted\|GetOnboardingCompleted()]] | boolean | Checks if onboarding has been completed. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#InFullScreen\|InFullScreen()]] | boolean | Returns true if the user's Roblox window is in full screen mode. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#InStudioMode\|InStudioMode()]] | boolean | Returns true if the client's game session is in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#SetCameraYInvertVisible\|SetCameraYInvertVisible()]] | () | If called, Roblox toggles the menu option to invert the user's camera y axis. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#SetGamepadCameraSensitivityVisible\|SetGamepadCameraSensitivityVisible()]] | () | If called, Roblox toggles the menu option to control the camera sensitivity with gamepads. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#SetOnboardingCompleted\|SetOnboardingCompleted()]] | () | Sets onboarding as completed. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#FullscreenChanged\|FullscreenChanged]] | `isFullscreen` | Fires if the user's full screen mode is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#StudioModeChanged\|StudioModeChanged]] | `isStudioMode` | Fired when the user's client switches between Studio mode and in-game mode. This gets fired periodically in Roblox Studio when a session starts. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllTutorialsDisabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether all in-game tutorials have been disabled by the user.

### BadgeVisible

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether badge notifications are visible to the client.

### CameraMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CustomCameraMode|CustomCameraMode]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true

The custom camera mode currently in-use by the client.

### ChatVisible

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the in-game chat is visible to the client.

### ComputerCameraMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ComputerCameraMovementMode|ComputerCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Input

The camera movement mode currently in-use by the client on desktop.

### ComputerMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ComputerMovementMode|ComputerMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Input

The type of controls being used by the client on desktop.

### ControlMode

> [!warning] Deprecated
> This property has been deprecated. You can enable mouse-locked
> third-person control, or "Shift Lock Mode", through the
> `Enum.MouseBehavior` in
> `Class.PlayerScripts:RegisterTouchCameraMovementMode()` and
> `Class.PlayerScripts:RegisterComputerCameraMovementMode()`.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ControlMode|ControlMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Input

Toggles whether or not the client can use the Mouse Lock Switch mode.

### Fullscreen

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the client's window is currently in full screen mode.

### GamepadCameraSensitivity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

Describes how sensitive the camera is when using a gamepad.

### GraphicsOptimizationMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GraphicsOptimizationMode|GraphicsOptimizationMode]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

The graphics optimization mode used by the client to balance visual quality and performance.

### GraphicsQualityLevel

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

The current graphics quality level being used by the client.

### HasEverUsedVR

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the user has ever launched the client in VR mode.

### MasterVolume

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A [[30 Official Roblox Docs/Luau/Numbers|float]] between 0 and 1 representing the volume of the game's client.

### MasterVolumeStudio

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A float between 0 and 1 representing the master volume used in Roblox Studio.

### MaxQualityEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

Indicates whether the client's graphics quality is set to the maximum available level.

### MouseSensitivity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

A float between 0 and 4 representing the sensitivity of the client's camera sensitivity.

### OnboardingsCompleted

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false

A comma-separated list of onboarding IDs that the user has completed.

### PartyVoiceVolume

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A float between 0 and 1 representing the volume of party voice chat.

### PeoplePageLayout

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PeoplePageLayout|PeoplePageLayout]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The layout style used to display the people page in the in-game menu.

### PlayerListVisible

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the in-game player list is visible to the client.

### PlayerNamesEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether player names are displayed above characters in the game.

### RCCProfilerRecordFrameRate

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Internal MicroProfiler setting specifying the frame rate used when capturing server-side RCC profiler data.

### RCCProfilerRecordTimeFrame

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Internal MicroProfiler setting specifying the duration over which server-side RCC profiler data is captured.

### RotationType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RotationType|RotationType]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** Input

Controls how the client's character is rotated.

### SavedQualityLevel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SavedQualitySetting|SavedQualitySetting]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Players

The graphics quality level set by the client.

### StartMaximized

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`, `NotScriptable`

Indicates whether Roblox Studio should launch in a maximized window.

### StartScreenPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`, `NotScriptable`

The screen position of the client's window when the application launches.

### StartScreenSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`, `NotScriptable`

The size of the client's window when the application launches.

### TouchCameraMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TouchCameraMovementMode|TouchCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Input

The camera type in-use by the client while on a mobile device.

### TouchMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TouchMovementMode|TouchMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Input

The type of controls being used by the client on a mobile device.

### UsedCoreGuiIsVisibleToggle

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the user has toggled the visibility of core GUI elements.

### UsedCustomGuiIsVisibleToggle

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the user has toggled the visibility of custom GUI elements.

### UsedHideHudShortcut

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the user has used the keyboard shortcut for hiding the HUD.

### VignetteEnabled

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the VR vignette comfort effect is enabled.

### VoiceChatVolume

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A float between `0` and `2` representing the volume of in-game voice chat.

### VREnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether the client is currently running in VR mode.

### VRRotationIntensity

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The intensity of camera rotation when turning in VR.

### VRSmoothRotationEnabled

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Indicates whether smooth rotation is used instead of snap rotation in VR.

## Methods

### GetCameraYInvertValue

```lua
UserGameSettings:GetCameraYInvertValue(): int
```

**Thread safety:** Unsafe · **Capabilities:** Input

Returns the camera's Y-invert value.

**Returns**

| Type | Description |
| --- | --- |
| int | The camera's current Y-axis inversion multiplier. |

### GetOnboardingCompleted

```lua
UserGameSettings:GetOnboardingCompleted(onboardingId: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

Checks whether or not the given onboarding has been completed yet, which is useful for avoiding showing the onboarding animation again.

If onboardingId is not one of the accepted IDs, an error is thrown.

The onboarding process is one-way. This means that, as a developer, you can force the onboarding process to completion but cannot reset it.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#SetOnboardingCompleted|UserGameSettings:SetOnboardingCompleted()]], sets onboarding as completed

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `onboardingId` | string |  | The onboarding ID to inquire about. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether or not the onboarding in particular has been completed yet. |

### InFullScreen

```lua
UserGameSettings:InFullScreen(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

Returns true if the user's Roblox window is in full screen mode.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the user's Roblox window is in full screen mode. |

### InStudioMode

```lua
UserGameSettings:InStudioMode(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

Returns true if the client's game session is in Roblox Studio.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the current client session is running in Roblox Studio. |

### SetCameraYInvertVisible

```lua
UserGameSettings:SetCameraYInvertVisible(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

If called, Roblox toggles the menu option to invert the user's camera y axis.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetGamepadCameraSensitivityVisible

```lua
UserGameSettings:SetGamepadCameraSensitivityVisible(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

If called, Roblox toggles the menu option to control the camera sensitivity with gamepads.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetOnboardingCompleted

```lua
UserGameSettings:SetOnboardingCompleted(onboardingId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

Sets the given onboarding as completed, so it won't be shown again to the user the next time they play.

Currently, this function only accepts [[30 Official Roblox Docs/Luau/Strings|DynamicThumbstick]], and it is used to persistently track whether or not the player has finished the tutorial for the Dynamic Thumbstick control scheme. If onboardingId is not one of the accepted IDs, an error is thrown.

The onboarding process is one-way. This means that, as a developer, you can force the onboarding process to completion but cannot reset it.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings#GetOnboardingCompleted|UserGameSettings:GetOnboardingCompleted()]], checks if onboarding has been completed

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `onboardingId` | string |  | The onboarding ID to set as completed. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### FullscreenChanged

```lua
UserGameSettings.FullscreenChanged(isFullscreen: boolean)
```

Fires if the user's full screen mode is changed. The event will only fire on desktop devices that can toggle full screen mode. The game will always be in full screen on mobile devices and consoles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isFullscreen` | boolean |  | Whether the user's Roblox window is now in full screen mode. |

*Code samples for this member (`Full-Screen-Mode-Detection`) are published on the source page; their code is not part of the open-source repo.*

### StudioModeChanged

```lua
UserGameSettings.StudioModeChanged(isStudioMode: boolean)
```

Fired when the user's client switches between Studio mode and in-game mode. This gets fired periodically in Roblox Studio when a session starts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `isStudioMode` | boolean |  | Whether the client session is now running in Roblox Studio. |

---
*Source: [UserGameSettings](https://create.roblox.com/docs/reference/engine/classes/UserGameSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
