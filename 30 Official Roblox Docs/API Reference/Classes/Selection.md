---
title: "Selection"
description: "The Selection service controls the `Instances` that are selected in Roblox Studio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Selection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The Selection service controls the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that are selected in Roblox Studio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The Selection service controls the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that are selected in Roblox Studio.

This service is particularly useful when developing [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]], as it allows the developer to access and manipulate the current selection.

Currently selected [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] can be obtained and set using the [[30 Official Roblox Docs/API Reference/Classes/Selection#Get|Selection:Get()]] and [[30 Official Roblox Docs/API Reference/Classes/Selection#Set|Selection:Set()]] functions. The [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged|Selection.SelectionChanged]] event fires whenever the current selection changes.

For more information on using [[30 Official Roblox Docs/API Reference/Classes/Selection|Selection]] and [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]], see [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]].

Selection is also often used in the command bar, to set hidden properties or run functions for selected [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]].

Note this class only applies to Roblox Studio and has no applicability to games.

*Code samples for this API (`Selection1`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Selection); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionThickness\|SelectionThickness]] | float | The thickness of the selection highlight outline drawn around selected [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] in Roblox Studio's viewport. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#Add\|Add()]] | () | Adds the given [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] to the current selection in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#Get\|Get()]] | Instances | Returns an array of currently selected [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#Remove\|Remove()]] | () | Removes the given [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] from the current selection in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#Set\|Set()]] | () | Sets the currently selected objects in Roblox Studio to [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] in the given array. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged\|SelectionChanged]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] selected in Roblox Studio changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### SelectionThickness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The thickness of the selection highlight outline drawn around selected [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in Roblox Studio's viewport.

This read-only property returns the current outline thickness as a float. The default value is `0.02`. The value is controlled by Roblox Studio and cannot be changed through the scripting API.

This property can be read in [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] to query the current selection visualization setting, such as when drawing custom overlays that need to match the built-in selection appearance.

## Methods

### Add

```lua
Selection:Add(instancesToAdd: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

Adds the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in the given array to the current selection. [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that are already selected remain selected.

Calling this function fires the [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged|Selection.SelectionChanged]] event if any new [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] are added to the selection.

Note this function can only be used in [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] or the command bar. For setting the selection to an entirely new set of instances, see [[30 Official Roblox Docs/API Reference/Classes/Selection#Set|Selection:Set()]]. For removing instances from the current selection, see [[30 Official Roblox Docs/API Reference/Classes/Selection#Remove|Selection:Remove()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instancesToAdd` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] to add to the current selection. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Get

```lua
Selection:Get(): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

Returns an array of currently selected [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in Roblox Studio.

If no [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] are selected, the array returned will be empty. This function can be used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged|Selection.SelectionChanged]] event to get the selection whenever it changes.

Note, this function can only be used in [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] or the command line.

For changing the current selection, please see [[30 Official Roblox Docs/API Reference/Classes/Selection#Set|Selection:Set()]].

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of currently selected [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]]. |

*Code samples for this member (`Selection1`, `Selection-SelectionChanged1`) are published on the source page; their code is not part of the open-source repo.*

### Remove

```lua
Selection:Remove(instancesToRemove: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

Removes the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in the given array from the current selection. [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that are not currently selected are ignored.

Calling this function fires the [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged|Selection.SelectionChanged]] event if any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] are removed from the selection.

Note this function can only be used in [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] or the command bar. For adding instances to the current selection, see [[30 Official Roblox Docs/API Reference/Classes/Selection#Add|Selection:Add()]]. For replacing the selection entirely, see [[30 Official Roblox Docs/API Reference/Classes/Selection#Set|Selection:Set()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instancesToRemove` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] to remove from the current selection. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Set

```lua
Selection:Set(selection: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Basic

Sets the currently selected objects in Roblox Studio to [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in the given array.

Calling this function will cause the [[30 Official Roblox Docs/API Reference/Classes/Selection#SelectionChanged|Selection.SelectionChanged]] event to fire, unless the new selection set is identical to the previous selection.

Note this function overwrites the existing selection. However, using [[30 Official Roblox Docs/API Reference/Classes/Selection#Get|Selection:Get()]] an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] can be added to the existing selection like so:

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selection` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] to set the current selection to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`SelectionSet1`, `Selection-Set`) are published on the source page; their code is not part of the open-source repo.*

## Events

### SelectionChanged

```lua
Selection.SelectionChanged()
```

**Capabilities:** Basic

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] selected in Roblox Studio changes.

Note this event does not give the new selection. Developers will need to use the [[30 Official Roblox Docs/API Reference/Classes/Selection#Get|Selection:Get()]] function to obtain the current selection.

Although this event can be used outside of plugins and the command bar, it only applies to the selection in Roblox Studio and therefore has no functionality outside of Studio.

To change the selection use the [[30 Official Roblox Docs/API Reference/Classes/Selection#Set|Selection:Set()]] function.

*Code samples for this member (`Selection-SelectionChanged1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Selection](https://create.roblox.com/docs/reference/engine/classes/Selection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
