---
title: "VRService"
description: "Service responsible for handling interactions between Roblox and Virtual Reality (VR)."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VRService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service responsible for handling interactions between Roblox and Virtual Reality (VR).*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

**VRService** is responsible for handling interactions between Roblox and Virtual Reality (VR). Its methods, properties, and events help you provide the best experience for end users seeking to experience Roblox on VR devices.

See [[30 Official Roblox Docs/Production/Publishing/VR guidelines|VR Guidelines]] for more information on publishing an experience for VR devices.

*Code samples for this API (`VRService`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/VRService); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#AutomaticScaling\|AutomaticScaling]] | [[30 Official Roblox Docs/API Reference/Enums/VRScaling\|VRScaling]] | Automatically adjusts scaling in VR to align the player with their avatar. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#AvatarGestures\|AvatarGestures]] | boolean | When true, a VR player will be able to animate their hands and head using their controllers and headset. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#ControllerModels\|ControllerModels]] | [[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode\|VRControllerModelMode]] | Controls whether and how the player's VR hand controllers are rendered in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#FadeOutViewOnCollision\|FadeOutViewOnCollision]] | boolean | When true, a VR player's view will fade to black when their head collides with an object. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#GuiInputUserCFrame\|GuiInputUserCFrame]] | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] | Describes what [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] is responsible for input in VR. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#LaserPointer\|LaserPointer]] | [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode\|VRLaserPointerMode]] | Controls whether and how the VR laser pointer used to interact with the user interface is displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#ThirdPersonFollowCamEnabled\|ThirdPersonFollowCamEnabled]] | boolean | Indicates whether the third-person follow camera is enabled for the VR user. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#VREnabled\|VREnabled]] | boolean | Describes whether the user is using a virtual reality device. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#GetTouchpadMode\|GetTouchpadMode()]] | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|VRTouchpadMode]] | Returns the VRTouchpadMode indicating the mode of a specified VRTouchpad. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#GetUserCFrame\|GetUserCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns a CFrame describing the position &amp; orientation of a specified virtual reality device as an offset from a point in real world space. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#GetUserCFrameEnabled\|GetUserCFrameEnabled()]] | boolean | Returns true if the specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] is available to be listened to. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#RecenterUserHeadCFrame\|RecenterUserHeadCFrame()]] | () | Re-centers the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] to the current location of the VR headset being worn by the user. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#RequestNavigation\|RequestNavigation()]] | () | Requests navigation to the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] using the specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] as the origin for the visualizer parabola. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#SetTouchpadMode\|SetTouchpadMode()]] | () | Sets the mode of the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|Enum.VRTouchpad]] to the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|Enum.VRTouchpadMode]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#NavigationRequested\|NavigationRequested]] | `cframe`, `inputUserCFrame` | Fired when navigation is requested from [[30 Official Roblox Docs/API Reference/Classes/VRService\|VRService]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#TouchpadModeChanged\|TouchpadModeChanged]] | `pad`, `mode` | Fires if the [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|Enum.VRTouchpadMode]] of a [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|Enum.VRTouchpad]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#UserCFrameChanged\|UserCFrameChanged]] | `type`, `value` | Fires when a [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/VRService#UserCFrameEnabled\|UserCFrameEnabled]] | `type`, `enabled` | Fires when a [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|Enum.UserCFrame]] is enabled or disabled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutomaticScaling

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VRScaling|VRScaling]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

When set to [[30 Official Roblox Docs/API Reference/Enums/VRScaling|Enum.VRScaling.World]], [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadScale|Camera.HeadScale]] adjusts so that the scale of the world is seen from the avatar's perspective. A player with a small avatar will perceive the objects around them as larger than a player with a large avatar will.

### AvatarGestures

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

When set to true, a VR player will be able to animate their hands and head using their controllers and headset. Set this to `false` for experiences where VR hand and head tracking conflicts with custom game mechanics, such as bespoke avatar rigs or weapon systems incompatible with IK-driven gestures.

This property must be set on the server.

### ControllerModels

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode|VRControllerModelMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Controls how the models representing the player's VR hand controllers are displayed ([[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode|Enum.VRControllerModelMode]]). When set to [[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode|Transparent]], the controller models are shown with transparency; when set to [[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode|Disabled]], the controller models are not rendered.

Defaults to [[30 Official Roblox Docs/API Reference/Enums/VRControllerModelMode|Transparent]].

### FadeOutViewOnCollision

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

When true, a VR player's view fades to black when their head collides with an object. This property prevents players from being able to see through walls while in VR. The default value is true.

### GuiInputUserCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|UserCFrame]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `NotReplicated`

This property describes what [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] is responsible for input in VR. For instance, if a VR headset is responsible, the value of this property will be [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame.Head]].

To check if Roblox detects any VR devices, which would be responsible for input in VR, you can check the [[30 Official Roblox Docs/API Reference/Classes/VRService#VREnabled|VREnabled]] property.

*Code samples for this member (`VRService-GuiInputUserCFrame`) are published on the source page; their code is not part of the open-source repo.*

### LaserPointer

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|VRLaserPointerMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

Controls the mode of the laser pointer that a VR player uses to point at and interact with the user interface ([[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|Enum.VRLaserPointerMode]]). Set it to [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|Disabled]] to hide the laser pointer, [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|Pointer]] to show a single pointer, or [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|DualPointer]] to show a pointer for each hand.

Defaults to [[30 Official Roblox Docs/API Reference/Enums/VRLaserPointerMode|Pointer]].

### ThirdPersonFollowCamEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

Read-only. Indicates whether the third-person follow camera is enabled for the VR user. Its value mirrors the user's VR comfort setting and updates automatically whenever the user changes that setting, firing a changed signal so that scripts can respond. It cannot be set from a script.

### VREnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the user is using a virtual reality (VR) device.

If a VR device is enabled, you can interact with its location and movement through methods such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetUserCFrame|UserInputService:GetUserCFrame()]]. You can also react to VR device movement using the [[30 Official Roblox Docs/API Reference/Classes/UserInputService#UserCFrameChanged|UserInputService.UserCFrameChanged]] event.

```lua
local UserInputService = game:GetService("UserInputService")

local isUsingVR = UserInputService.VREnabled
if isUsingVR then
	print("User is using a VR headset!")
else
	print("User is not using a VR headset!")
end
```

This property can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Camera#HeadLocked|Camera.HeadLocked]]
- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetUserCFrame|UserInputService:GetUserCFrame()]]
- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#UserCFrameChanged|UserInputService.UserCFrameChanged]]

*Code samples for this member (`UserInputService-UserCFrameChanged`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### GetTouchpadMode

```lua
VRService:GetTouchpadMode(pad: VRTouchpad): VRTouchpadMode
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns the [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode|Enum.VRTouchpadMode]] indicating the mode of a specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad|Enum.VRTouchpad]]. The returned mode indicates how the user interacts with their touchpad to play the game.

This can also be used alongside the several [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] VR methods and events.

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pad` | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|VRTouchpadMode]] | The mode of the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]]. |

*Code samples for this member (`VRService-GetTouchpadMode`) are published on the source page; their code is not part of the open-source repo.*

### GetUserCFrame

```lua
VRService:GetUserCFrame(type: UserCFrame): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] describing the position and orientation of a specified virtual reality (VR) device as an offset from a point in real world space. This method should be used when implementing VR compatibility into a game to obtain and track the movement of a connected VR device.

By using the method, developers can implement features such as re-positioning the user's in-game character corresponding to the location of a connected VR device. This can be done by changing the _CFrame_ of the user's in-game character to match the _CFrame_ of the specified VR device using the UserCFrame enum and _CFrame_ value arguments passed by the event.

[[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]] also provides a [[30 Official Roblox Docs/API Reference/Classes/VRService#UserCFrameChanged|UserCFrameChanged]] event that automatically fires when the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of connected VR device changes, so long it is used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | A [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] describing the position and orientation of the specified VR device as an offset from a point in real-world space. |

*Code samples for this member (`VRService-GetUserCFrame`) are published on the source page; their code is not part of the open-source repo.*

### GetUserCFrameEnabled

```lua
VRService:GetUserCFrameEnabled(type: UserCFrame): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method returns true if the specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] virtual reality device (VR) is available to be listened to. It can be used to determine whether a specified VR device, such as [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame.Head]], is connected to the user's game.

This can also be used alongside the several [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] VR methods and events.

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The specified type of VR device. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the specified VR device is enabled (`true`) or disabled (`false`). |

*Code samples for this member (`VRService-GetUserCFrameEnabled`) are published on the source page; their code is not part of the open-source repo.*

### RecenterUserHeadCFrame

```lua
VRService:RecenterUserHeadCFrame(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method re-centers the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the user's head to the current location of the VR headset being worn by the user. It can be used to ensure that the user's in-game head is positioned according to the location of the user's VR headset.

This behaves identically to [[30 Official Roblox Docs/API Reference/Classes/UserInputService#RecenterUserHeadCFrame|UserInputService:RecenterUserHeadCFrame()]].

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`VRService-RecenterUserHeadCFrame`) are published on the source page; their code is not part of the open-source repo.*

### RequestNavigation

```lua
VRService:RequestNavigation(cframe: CFrame, inputUserCFrame: UserCFrame): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method requests navigation to the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] using the specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] as the origin for the visualizer parabola. It can be used to incorporate virtual reality (VR) into your game by providing a means to visualize a navigation path from the user's VR device to a destination.

[[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]] has a similar event, [[30 Official Roblox Docs/API Reference/Classes/VRService#NavigationRequested|NavigationRequested]], used to detect such requests. This can also be used alongside the several [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] VR methods and events.

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] coordinates. |
| `inputUserCFrame` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The VR device for which the navigation is requested. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`VRService-RequestNavigation`) are published on the source page; their code is not part of the open-source repo.*

### SetTouchpadMode

```lua
VRService:SetTouchpadMode(pad: VRTouchpad, mode: VRTouchpadMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This method sets the mode of the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad|Enum.VRTouchpad]] to the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode|Enum.VRTouchpadMode]]. It can be used to change the user's virtual reality (VR) touchpad mode so that the user interacts with the game differently using the touchpad.

This can also be used alongside the several [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] VR methods and events.

This method will only work when used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pad` | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]] |  | The specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]] you want to set the mode of. |
| `mode` | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|VRTouchpadMode]] |  | The mode you want to set the specified [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`VRService-SetTouchpadMode`) are published on the source page; their code is not part of the open-source repo.*

## Events

### NavigationRequested

```lua
VRService.NavigationRequested(cframe: CFrame, inputUserCFrame: UserCFrame)
```

**Capabilities:** Input

This event fires when navigation is requested from [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]] for a specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] VR device. It fires with a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] coordinate and the specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] indicating the device requesting the navigation.

This event can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] service events and methods.

Since this event fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The requested [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] coordinates. |
| `inputUserCFrame` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | Indicates the VR device for which navigation is requested. |

*Code samples for this member (`VRService-NavigationRequested`) are published on the source page; their code is not part of the open-source repo.*

### TouchpadModeChanged

```lua
VRService.TouchpadModeChanged(pad: VRTouchpad, mode: VRTouchpadMode)
```

**Capabilities:** Input

This event fires if the [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode|Enum.VRTouchpadMode]] of a [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad|Enum.VRTouchpad]] is changed. You can use this event to track the states of VR touchpads connected via the user's client.

This event can be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] service events and methods.

Since this event fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pad` | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpad\|VRTouchpad]] |  | The touchpad that changed mode. |
| `mode` | [[30 Official Roblox Docs/API Reference/Enums/VRTouchpadMode\|VRTouchpadMode]] |  | The new mode. |

*Code samples for this member (`VRService-TouchpadModeChanged`) are published on the source page; their code is not part of the open-source repo.*

### UserCFrameChanged

```lua
VRService.UserCFrameChanged(type: UserCFrame, value: CFrame)
```

**Capabilities:** Input

This event fires when a [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] is changed, for instance when the user moves a connected VR device. It can be used alongside [[30 Official Roblox Docs/API Reference/Classes/VRService#GetUserCFrame|GetUserCFrame()]] to track the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] coordinates of a VR device, and when it changes/moves. It can also be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] service events and methods.

Since this event fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The type of VR device that changed. |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The updated [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] coordinates of the VR device after the change. |

*Code samples for this member (`VRService-UserCFrameChanged`) are published on the source page; their code is not part of the open-source repo.*

### UserCFrameEnabled

```lua
VRService.UserCFrameEnabled(type: UserCFrame, enabled: boolean)
```

**Capabilities:** Input

This event fires when a [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|Enum.UserCFrame]] is enabled or disabled. It can be used alongside [[30 Official Roblox Docs/API Reference/Classes/VRService#GetUserCFrameEnabled|GetUserCFrameEnabled()]] to track whether a specified [[30 Official Roblox Docs/API Reference/Enums/UserCFrame|UserCFrame]] is enabled, and when its state changes. It can also be used alongside [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] service events and methods.

Since this event fires locally, it can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] |  | The [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] getting enabled or disabled. |
| `enabled` | boolean |  | A boolean indicating whether the [[30 Official Roblox Docs/API Reference/Enums/UserCFrame\|UserCFrame]] is enabled (`true`) or disabled (`false`). |

*Code samples for this member (`VRService-UserCFrameEnabled`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [VRService](https://create.roblox.com/docs/reference/engine/classes/VRService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
