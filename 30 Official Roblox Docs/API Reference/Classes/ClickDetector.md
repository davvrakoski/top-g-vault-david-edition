---
title: "ClickDetector"
description: "An object that provides user input on in-experience `BaseParts` and `Models`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ClickDetector"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that provides user input on in-experience [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and [[30 Official Roblox Docs/API Reference/Classes/Model|Models]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]
- **Memory category:** Instances

## Description

`ClickDetector` allows [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] to receive pointer input on 3D objects through their [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseClick|MouseClick]] event. They work when parented to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], or [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] objects. They detect basic mouse events: enter, leave, left click and right click. Touch input on [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] devices also fires click events.

The default control scripts bind [[30 Official Roblox Docs/API Reference/Enums/KeyCode|ButtonR2]] to interact with [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetectors]] using [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActivate|ContextActionService:BindActivate()]], which can also be used to override this. When using gamepads, the center dot triggers [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverEnter|MouseHoverEnter]] and [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverLeave|MouseHoverLeave]]. The bound activation button fires [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseClick|MouseClick]].

[[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MaxActivationDistance|MaxActivationDistance]] can be used to limit the distance a player may be from a click detector before it is no longer clickable.

[[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] events fire on both the client and the server. Since a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will only run if it descends from a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] or player [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]], it's usually not useful to put a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] inside a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]], since the script won't run or the object won't be clickable. If you need a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to detect [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] events, [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] may be a better place instead.

#### Input Priority

If multiple [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetectors]] may detect user input, only the deepest will fire events. If two [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetectors]] are siblings, the first will take priority.

If an action bound with [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]] uses the same input as a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]], the action bound with [[30 Official Roblox Docs/API Reference/Classes/ContextActionService|ContextActionService]] will take priority over the click detector's events.

[[30 Official Roblox Docs/API Reference/Classes/UserInputService#InputBegan|UserInputService.InputBegan]] will fire before [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] events.

*Code samples for this API (`ClickDetector-Example`, `Part-Anchored-Toggle`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ClickDetector); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#CursorIcon\|CursorIcon]] | ContentId | Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#CursorIconContent\|CursorIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. Only supports asset URIs. |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MaxActivationDistance\|MaxActivationDistance]] | float | Maximum distance between a character and the [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]] for the player to be able to interact with it. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseClick\|MouseClick]] | `playerWhoClicked` | Fires when a player interacts with the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#mouseClick\|mouseClick]] | `playerWhoClicked` | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverEnter\|MouseHoverEnter]] | `playerWhoHovered` | Fires when the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]] is hovered over by a player. |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverLeave\|MouseHoverLeave]] | `playerWhoHovered` | Fires when a player's cursor hovers off the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#RightMouseClick\|RightMouseClick]] | `playerWhoClicked` | Fires when a player right clicks their mouse cursor on a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CursorIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** Input

Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. If this property is left blank, the detector will use the default icon.

To change the cursor icon, set this property to the asset ID of the image you'd like to use.

### CursorIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Image · **Loaded/Saved:** true/true · **Capabilities:** Input

Sets the cursor icon to display when the mouse is hovered over the parent of this [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. If this property is left blank, the detector will use the default icon.

To change the cursor icon, set this property to the asset ID of the image you'd like to use. Only asset URIs are supported for this property.

### MaxActivationDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property controls the maximum distance, in studs, between a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] and the [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] for the player to be able to interact with it. For instance, a character within 10 studs of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] with a max activation distance of 5 would not be able to use the detector because they are out of range.

## Events

### MouseClick

```lua
ClickDetector.MouseClick(playerWhoClicked: Player)
```

**Capabilities:** Input

This event fires from either a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when a player interacts with a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] via the following inputs:

- On platforms with a mouse, when the player left mouse clicks.
- On [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] platforms, when the player taps.
- On [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GamepadEnabled|GamepadEnabled]] platforms, when the center dot is over the same model and the **A** button is pressed and released.

Note that the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] must be within the [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MaxActivationDistance|MaxActivationDistance]] of the detector.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoClicked` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who clicked on the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |

### mouseClick

> [!warning] Deprecated
> This deprecated event is a variant of `Class.ClickDetector.MouseClick`,
> which should be used instead.

```lua
ClickDetector.mouseClick(playerWhoClicked: Player)
```

**Capabilities:** Input · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoClicked` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  |  |

### MouseHoverEnter

```lua
ClickDetector.MouseHoverEnter(playerWhoHovered: Player)
```

**Capabilities:** Input

This event fires from either a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] is hovered over by a player. This does not entail explicit interaction with the detector, for which you can listen to either [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseClick|MouseClick]] and [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#RightMouseClick|RightMouseClick]] events.

Due to the nature of user input, you should not depend on all [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverEnter|MouseHoverEnter]] events firing a corresponding [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverLeave|MouseHoverLeave]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoHovered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who started hovering over the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |

*Code samples for this member (`ClickDetector-MouseHoverLeave1`) are published on the source page; their code is not part of the open-source repo.*

### MouseHoverLeave

```lua
ClickDetector.MouseHoverLeave(playerWhoHovered: Player)
```

**Capabilities:** Input

This event fires from either a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when a player's cursor hovers off the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. This does not entail explicit interaction with the detector, for which you can listen to either [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseClick|MouseClick]] and [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#RightMouseClick|RightMouseClick]] events.

Due to the nature of user input, you should not depend on all [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverLeave|MouseHoverLeave]] events firing after a corresponding [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MouseHoverEnter|MouseHoverEnter]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoHovered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose cursor hovered off the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |

*Code samples for this member (`ClickDetector-MouseHoverLeave1`) are published on the source page; their code is not part of the open-source repo.*

### RightMouseClick

```lua
ClickDetector.RightMouseClick(playerWhoClicked: Player)
```

**Capabilities:** Input

This event fires from either a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] when a player right clicks their mouse cursor on a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]]. Note that the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] must be within the [[30 Official Roblox Docs/API Reference/Classes/ClickDetector#MaxActivationDistance|MaxActivationDistance]] of the detector.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoClicked` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who right clicked their mouse cursor on the parent of a [[30 Official Roblox Docs/API Reference/Classes/ClickDetector\|ClickDetector]] or [[30 Official Roblox Docs/API Reference/Classes/DragDetector\|DragDetector]]. |

---
*Source: [ClickDetector](https://create.roblox.com/docs/reference/engine/classes/ClickDetector) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
