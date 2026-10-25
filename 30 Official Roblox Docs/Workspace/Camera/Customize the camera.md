---
title: "Customize the camera"
description: "Explains how to configure a game's camera settings."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/camera"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to configure a game's camera settings.*

Roblox's built-in camera powers a default **third person** mode and an optional **first person** mode, so you don't need to build your own following camera. For more customized scenarios, you can adjust the default properties in [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] or replace it entirely like for over-the-shoulder, isometric, and weapon scoping views.

## Basic settings

You can configure common camera settings directly within Studio's [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] object. These settings include [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Zoom distance|zoom distance]] and various [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Camera mode|camera]], [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Occlusion mode|occlusion]], and [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Movement mode|movement]] modes.

1. In the **Explorer** window, select the **StarterPlayer** object.

   *(image in the full Top G Vault)*

1. In the **Properties** window, scroll down to locate the **Camera** section. You can configure the following properties directly or through a script.

   *(image in the full Top G Vault)*

### Zoom distance

Together, [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMaxZoomDistance|CameraMaxZoomDistance]] and [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMinZoomDistance|CameraMinZoomDistance]] set the range in which players can zoom the camera in respect to their player character. Setting a very high maximum such as 500 allows players to zoom the camera far out in space. If you want to lock the camera to a specific distance away from the character and prevent zooming, set both of these properties to the same value.

```lua title="LocalScript - Camera Zoom Range" highlight="5,6"
local Players = game:GetService("Players")

local player = Players.LocalPlayer

player.CameraMaxZoomDistance = 25
player.CameraMinZoomDistance = 50
```

### Camera mode

The [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMode|CameraMode]] property sets the overall behavior of the camera between two options:

| Setting | Description |
| --- | --- |
| **Classic** | The classic Roblox third-person camera which can be zoomed into first-person. Allows players to zoom in and out (unless zoom is locked) and rotate the camera around their character. |
| **LockFirstPerson** | Locks the camera to first-person mode. When in this mode, all parts/elements of the player's character are invisible to them, except for equipped [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tools]]. |

### Occlusion mode

The [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevCameraOcclusionMode|DevCameraOcclusionMode]] property controls camera behavior when the player cannot see their character, such as when it's obscured by a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

| Setting | Description |
| --- | --- |
| **Zoom** | If the player's character moves behind an object with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|Transparency]] lower than 0.25, the camera zooms in very close to the character so that it can be seen. Once the character moves back into a viewable position, the camera zooms back out. |
| **Invisicam** | If the player's character moves behind an object with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|Transparency]] lower than 0.75, the camera remains unmoved but the object becomes semi-transparent so that the character can be seen. Once the character moves back into a viewable position, the object returns to its normal opacity. |

[Video: Camera-Occlusion.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/camera/Camera-Occlusion.mp4)

***Zoom** and **Invisicam** occlusion modes*

### Movement mode

The [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerCameraMovementMode|DevComputerCameraMovementMode]] (computer) and [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevTouchCameraMovementMode|DevTouchCameraMovementMode]] (phone/tablet) determine how the player can move the camera around.

| Setting | Description |
| --- | --- |
| **UserChoice** | The camera will move based on the player's in-game camera settings. |
| **Classic** | The camera remains at its [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Zoom distance\|zoom distance]], tracking the player's character as it moves around the world. Players can also pitch the camera view up/down and orbit it around their character. |
| **Follow** | Similar to **Classic** but the camera may rotate slightly to face the player's character if they're moving in any direction that isn't parallel to the camera's facing direction. |
| **Orbital** | The camera remains at a fixed zoom distance and tracks the player's character as it moves around the world. Players can orbit the camera around their character but can't pitch the view up or down. |
| **CameraToggle** | Only functional on computers (not phones/tablets) through [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerCameraMovementMode\|DevComputerCameraMovementMode]]. When the player clicks the right mouse button, the camera toggles between **Classic** mode and a "free look" mode where moving the mouse looks around the world. |

## Script the camera

Each player [[30 Official Roblox Docs/Projects/Client-server runtime|client]] has its own [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object residing in the local [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], accessible through the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] property. You can override Roblox's default camera scripts by setting its [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType|CameraType]] to [[30 Official Roblox Docs/API Reference/Enums/CameraType|Scriptable]] and then, most commonly, control the camera through the following properties.

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|Camera.CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the camera. This is the most frequently used property for positioning and orienting a [[30 Official Roblox Docs/API Reference/Enums/CameraType\|Scriptable]] camera in a game. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView\|Camera.FieldOfView]] | The extent of the observable 3D space that can be seen on screen, measured between 1–120 degrees in the direction defined by [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfViewMode\|Camera.FieldOfViewMode]]. Default is 70. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType\|Camera.CameraType]] | Toggles between the various camera behaviors outlined in [[30 Official Roblox Docs/API Reference/Enums/CameraType\|Enum.CameraType]], some of which mimic the selectable [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Movement mode\|movement modes]]. Setting this to [[30 Official Roblox Docs/API Reference/Enums/CameraType\|Scriptable]] gives you full control of the camera. |
| [[30 Official Roblox Docs/API Reference/Classes/Camera#Focus\|Camera.Focus]] | The point in 3D space where the camera is looking. If you've set [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraType\|Camera.CameraType]] to [[30 Official Roblox Docs/API Reference/Enums/CameraType\|Scriptable]], you should update this property every frame because certain visuals are more detailed depending on how close they are to the focus point. |

---
*Source: [Customize the camera](https://create.roblox.com/docs/workspace/camera) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
