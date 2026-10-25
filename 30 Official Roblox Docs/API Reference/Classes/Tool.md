---
title: "Tool"
description: "An object, such as a weapon, that can be equipped by a `Humanoid`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object, such as a weapon, that can be equipped by a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]] → [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Flag|Flag]]
- **Memory category:** BaseParts

## Description

A `Tool` is an object that a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object can equip. For players, they are stored in a [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] object parented to a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object. In-experience, players may have multiple tools which appear as icons at the bottom of the screen. Equipping a tool moves it from the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and into a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] model in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. By default, tools are held in the right hand and have a handle in them, which is a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] named `Handle` inside (although one isn't required if [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|Tool.RequiresHandle]] is `false`). Tools that are to be provided to (re)spawning players should be stored in the [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]].

*Code samples for this API (`Explode-Tool-Example`, `Sword-Tool-Example`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Tool); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#CanBeDropped\|CanBeDropped]] | boolean | Controls whether the player can drop the tool. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Enabled\|Enabled]] | boolean | Relates to whether or not the tool can be used. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip\|Grip]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Stores the tool's "grip" properties as one [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#GripForward\|GripForward]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Represents the `R02`, `R12`, and `R22` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] rotation matrix. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#GripPos\|GripPos]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The positional offset of the tool's weld matrix. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#GripRight\|GripRight]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Represents the `R00`, `R10`, and `R20` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] rotation matrix. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#GripUp\|GripUp]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Represents the `R01`, `R11`, and `R21` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] rotation matrix. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#ManualActivationOnly\|ManualActivationOnly]] | boolean | Controls whether the [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] can be activated without executing [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate\|Tool:Activate()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle\|RequiresHandle]] | boolean | Determines whether a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] functions without a handle. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#ToolTip\|ToolTip]] | string | Controls the message displayed when the player's mouse hovers over the tool in their backpack. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate\|Activate()]] | () | Simulates activation of the [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivate\|Deactivate()]] | () | Simulates deactivation of the [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated\|Activated]] |  | Fires when the player clicks while the tool is equipped. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivated\|Deactivated]] |  | Fires when the player releases their click while the tool is equipped and activated. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped\|Equipped]] | `mouse` | Fires when the tool is equipped. |
| [[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped\|Unequipped]] |  | Fires when the tool is unequipped. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BackpackItem|BackpackItem]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CanBeDropped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

The CanBeDropped property controls whether the player can drop the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

If true, when the backspace button is pressed, the tool will be parented to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and removed from the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]. If false, nothing will happen when backspace is pressed, and the tool will remain equipped.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Input

The **Enabled** property relates to whether or not the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] can be used. This is useful if you want to prevent a player from using a tool, but don't want to remove it from their [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]].

When set to `true`, the player can use the tool. When set to `false`, the tool is disabled and the player cannot use it; this prevents the tool from being activated or deactivated by the [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate|Tool:Activate()]] and [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivate|Tool:Deactivate()]] methods, and it prevents the [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Tool.Activated]] and [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivated|Tool.Deactivated]] events from firing.

*Code samples for this member (`superjump-tool`) are published on the source page; their code is not part of the open-source repo.*

### Grip

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/true · **Capabilities:** Input

The `Grip` property stores the tool's "grip" properties as a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. These properties position how the player holds the tool and include [[30 Official Roblox Docs/API Reference/Classes/Tool#GripUp|GripUp]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripRight|GripRight]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripForward|GripForward]], and [[30 Official Roblox Docs/API Reference/Classes/Tool#GripPos|GripPos]].

*Code samples for this member (`grip-stick`) are published on the source page; their code is not part of the open-source repo.*

### GripForward

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Hidden`, `NotReplicated`

One of the properties that specifies a tool's orientation in a character's hand. This represents the `R02`, `R12`, and `R22` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] rotation matrix.

Other tool properties that control how a character holds a tool include [[30 Official Roblox Docs/API Reference/Classes/Tool#GripUp|Tool.GripUp]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripRight|Tool.GripRight]], and [[30 Official Roblox Docs/API Reference/Classes/Tool#GripPos|Tool.GripPos]]. All of these properties are stored in a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Tool.Grip]] property.

*Code samples for this member (`grip-stick`) are published on the source page; their code is not part of the open-source repo.*

### GripPos

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Hidden`, `NotReplicated`

This property controls the positional offset of the tool's weld matrix. It is one of several properties used to position how the player character holds the tool.

Other properties that control how a character holds a tool include [[30 Official Roblox Docs/API Reference/Classes/Tool#GripUp|Tool.GripUp]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripRight|Tool.GripRight]], and [[30 Official Roblox Docs/API Reference/Classes/Tool#GripForward|Tool.GripForward]]. All of these properties are stored in a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Tool.Grip]] property.

*Code samples for this member (`grip-stick`) are published on the source page; their code is not part of the open-source repo.*

### GripRight

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Hidden`, `NotReplicated`

One of the properties that specifies a tool's orientation in a character's hand. This represents the `R00`, `R10`, and `R20` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] rotation matrix.

Other tool properties that control how a character holds a tool include [[30 Official Roblox Docs/API Reference/Classes/Tool#GripUp|Tool.GripUp]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripForward|Tool.GripForward]], and [[30 Official Roblox Docs/API Reference/Classes/Tool#GripPos|Tool.GripPos]]. All of these properties are stored in a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Tool.Grip]] property.

*Code samples for this member (`grip-stick`) are published on the source page; their code is not part of the open-source repo.*

### GripUp

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Capabilities:** Input · **Tags:** `Hidden`, `NotReplicated`

One of the properties that specifies a tool's orientation in a character's hand. This represents the `R01`, `R11`, and `R21` values of the grip [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] rotation matrix.

Other tool properties that control how a character holds a tool include [[30 Official Roblox Docs/API Reference/Classes/Tool#GripRight|Tool.GripRight]], [[30 Official Roblox Docs/API Reference/Classes/Tool#GripForward|Tool.GripForward]], and [[30 Official Roblox Docs/API Reference/Classes/Tool#GripPos|Tool.GripPos]]. All of these properties are stored in a single [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Tool.Grip]] property.

*Code samples for this member (`grip-stick`) are published on the source page; their code is not part of the open-source repo.*

### ManualActivationOnly

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

This property controls whether the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] can be activated without explicitly executing [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate|Tool:Activate()]] in a script.

When set to `true`, the tool will only fire [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Tool.Activated]] when [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate|Tool:Activate()]] is called. This also suppresses the [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindActivate|ContextActionService:BindActivate()]] function.

When set to `false`, mouse clicks (when the tool is equipped) will also fire [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Tool.Activated]].

*Code samples for this member (`sprint-tool`) are published on the source page; their code is not part of the open-source repo.*

### RequiresHandle

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines whether a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] functions without a handle.

A tool has a handle when it contains a child part named **Handle**. Tools with handles typically require the player equipping them to hold an object to use them, for instance weapons. Tools without handles typically don't require the player equipping them to hold anything to use them, for instance "fly" or "summon" tools.

When set to `true`, the tool will function only with a handle. When set to `false`, the tool will function even without a handle.

### ToolTip

**Type:** string

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Input

The ToolTip property controls the message that will be displayed when the player's [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] hovers over the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] in their [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]].

Generally, the value of this property should describe the what the tool is or its use. For instance, for a shovel tool, you may choose to set the ToolTip to:

```lua
tool.ToolTip = "Shovel"
```

or

```lua
tool.ToolTip = "Use to dig"
```

or

```lua
tool.ToolTip = "Shovel - Use to dig"
```

## Methods

### Activate

```lua
Tool:Activate(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This function simulates activation of the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]. The tool must be equipped for this function to work.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`invisibility-tool`) are published on the source page; their code is not part of the open-source repo.*

### Deactivate

```lua
Tool:Deactivate(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Input

This function simulates deactivation of the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]. The tool must be equipped for this function to work.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`invisibility-tool`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Activated

```lua
Tool.Activated()
```

**Capabilities:** Input

This event fires when the player clicks while the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is equipped. It is **not** fired if the <kbd>Ctrl</kbd> key is pressed during the click.

This event is typically used to perform an action when the player uses the tool, for instance to launch a rocket from a rocket launcher weapon tool.

The below code, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], creates a tool in the local player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and prints "Tool activated" when the player clicks while the created tool is equipped.

*Code samples for this member (`Tool-Activated`) are published on the source page; their code is not part of the open-source repo.*

### Deactivated

```lua
Tool.Deactivated()
```

**Capabilities:** Input

This event fires when the player releases their click while the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is equipped and activated. It is typically used to perform an action when the player stops using a tool.

The below code, when placed in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], creates a tool in the local player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and prints "Tool deactivated" when the player releases their click while the tool is equipped and activated.

*Code samples for this member (`Tool-Deactivated`) are published on the source page; their code is not part of the open-source repo.*

### Equipped

```lua
Tool.Equipped(mouse: Mouse)
```

**Capabilities:** Input

This event fires when a player equips the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] (takes it out of their [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]).

The opposite of this event, [[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped|Tool.Unequipped]], can be used to determine when the player unequips the tool by putting it in their backpack.

Note that this event does **not** fire when [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|Tool.RequiresHandle]] is enabled and no handle is present.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mouse` | [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] |  | The player's mouse. |

*Code samples for this member (`Tool-Equipped1`) are published on the source page; their code is not part of the open-source repo.*

### Unequipped

```lua
Tool.Unequipped()
```

**Capabilities:** Input

This event fires when a player unequips the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] (puts it in their [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]).

The opposite of this event, [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Tool.Equipped]], can be used to determine when the player equips the tool by taking it out of their backpack.

Note that this event does **not** fire when [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|Tool.RequiresHandle]] is enabled and no handle is present.

---
*Source: [Tool](https://create.roblox.com/docs/reference/engine/classes/Tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
