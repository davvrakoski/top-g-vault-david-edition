---
title: "Controller"
description: "The base class for controller objects, such as the `HumanoidController` object."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Controller"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for controller objects, such as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidController|HumanoidController]] object.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/HumanoidController|HumanoidController]], [[30 Official Roblox Docs/API Reference/Classes/SkateboardController|SkateboardController]], [[30 Official Roblox Docs/API Reference/Classes/VehicleController|VehicleController]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The base class for controller objects, such as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidController|HumanoidController]] object.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#BindButton\|BindButton()]] | () | Activates an overriding bind on the specified button. |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#bindButton\|bindButton()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#GetButton\|GetButton()]] | boolean | Returns whether or not Button is being pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#getButton\|getButton()]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#UnbindButton\|UnbindButton()]] | () | Removes the bind on button. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Controller#ButtonChanged\|ButtonChanged]] | `button` | Fired when the pressed state of a bound button is changed. This event can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Controller#GetButton\|Controller:GetButton()]] to see whether a bound button is being pressed down or not. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BindButton

```lua
Controller:BindButton(button: Button, caption: string): ()
```

**Thread safety:** Unsafe

Activates an overriding bind on the specified button.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Button\|Enum.Button]] to bind. |
| `caption` | string |  | The text to display for the bound button. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Controller-BindButton1`) are published on the source page; their code is not part of the open-source repo.*

### bindButton

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Controller:BindButton()`
> which should be used instead.

```lua
Controller:bindButton(button: Button, caption: string): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  |  |
| `caption` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetButton

```lua
Controller:GetButton(button: Button): boolean
```

**Thread safety:** Unsafe

Returns whether or not Button is being pressed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Button\|Enum.Button]] whose pressed state to check. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified button is currently pressed. |

### getButton

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Controller:GetButton()`
> which should be used instead.

```lua
Controller:getButton(button: Button): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### UnbindButton

```lua
Controller:UnbindButton(button: Button): ()
```

**Thread safety:** Unsafe

Removes the bind on button.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Button\|Enum.Button]] to unbind. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### ButtonChanged

```lua
Controller.ButtonChanged(button: Button)
```

Fired when the pressed state of a bound button is changed. This event can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Controller#GetButton|Controller:GetButton()]] to see whether a bound button is being pressed down or not.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `button` | [[30 Official Roblox Docs/API Reference/Enums/Button\|Button]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Button\|Enum.Button]] whose pressed state changed. |

---
*Source: [Controller](https://create.roblox.com/docs/reference/engine/classes/Controller) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
