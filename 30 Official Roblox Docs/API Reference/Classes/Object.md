---
title: "Object"
description: "`Object` is the base class for all classes in the Roblox class hierarchy."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Object"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`Object` is the base class for all classes in the Roblox class hierarchy.*

- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]], [[30 Official Roblox Docs/API Reference/Classes/ConfigSnapshot|ConfigSnapshot]], [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Logger|Logger]], [[30 Official Roblox Docs/API Reference/Classes/MLSession|MLSession]], [[30 Official Roblox Docs/API Reference/Classes/PluginConnection|PluginConnection]], [[30 Official Roblox Docs/API Reference/Classes/VideoSampler|VideoSampler]], [[30 Official Roblox Docs/API Reference/Classes/VirtualInput|VirtualInput]], [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient|WebStreamClient]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

`Object` is the base class for all classes in the Roblox class hierarchy. Every other class that the Roblox Engine defines inherits all of the members of `Object`. It is not possible to directly create an `Object`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|ClassName]] | string | A read-only string representing the class this [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/Object#className\|className]] | string | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal\|GetPropertyChangedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Get an event that fires when a given property of the object changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Object#IsA\|IsA()]] | boolean | Returns true if an object's class matches or inherits from a given class. |
| [[30 Official Roblox Docs/API Reference/Classes/Object#isA\|isA()]] | boolean | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Object#Changed\|Changed]] | `property` | Fires immediately after a property of the object changes, with some limitations. |

## Properties

### ClassName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A read-only string representing the class this [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] belongs to.

This property can be used with various other functions that are used to identify objects by type, such as [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildOfClass|Instance:FindFirstChildOfClass()]].

Note this property is read only and cannot be altered by scripts. Developers wishing to change an object's class will instead have to create a new [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].

Unlike [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]], ClassName can be used to check if an object belongs to a specific class ignoring class inheritance. For example:

*Code samples for this member (`Object-ClassName`) are published on the source page; their code is not part of the open-source repo.*

### className

> [!warning] Deprecated
> This deprecated property is a variant of `Class.Object.ClassName` which
> should be used instead.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

## Methods

### GetPropertyChangedSignal

```lua
Object:GetPropertyChangedSignal(property: string): RBXScriptSignal
```

**Thread safety:** Unsafe

This method returns an event that behaves exactly like the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event, except that it only fires when the given property changes. It's generally a good idea to use this method instead of a connection to [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] with a function that checks the property name. Subsequent calls to this method on the same object with the same property name return the same event.

[[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, such as [[30 Official Roblox Docs/API Reference/Classes/IntValue|IntValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], use a modified [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event that fires with the contents of their `Value` property. As such, this method provides a way to detect changes in other properties of those objects.

Note that this event will not pass any arguments to a connected function, so the value of the changed property must be read directly within a script.

#### Limitations

The event returned by this method does **not** fire for physics-related changes, such as when the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|Orientation]] properties of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] change due to gravity. To detect changes in these properties, consider using a physics-based event like [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]].

Additionally, the returned event may not fire on every modification of properties that change very frequently, and/or it may not fire for such properties at all. It's recommended that you carefully test for property changes that impact game logic.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | The property to connect to. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | A signal that fires whenever the property changes. |

*Code samples for this member (`Changed-Old-to-New`, `Changed-and-GetPropertyChangedSignal`) are published on the source page; their code is not part of the open-source repo.*

### IsA

```lua
Object:IsA(className: string): boolean
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

IsA returns true if the object's class is **equivalent to** or a **subclass** of a given class. This function is similar to the **instanceof** operators in other languages, and is a form of [type introspection](https://en.wikipedia.org/wiki/Type_introspection). To ignore class inheritance, test the [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName|ClassName]] property directly instead. For checking native Luau data types (number, string, etc) use the functions `type` and `typeof`.

Most commonly, this function is used to test if an object is some kind of part, such as [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]], which inherits from [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (an abstract class). For example, if your goal is to change all of a character's limbs to the same color, you might use [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|GetChildren]] to iterate over the children, then use IsA to filter non-[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] objects which lack the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] property:

```lua
local Players = game:GetService("Players")

local function paintFigure(character, color)
	-- Iterate over the child objects of the character
	for _, child in character:GetChildren() do
		-- Filter out non-part objects, such as Shirt, Pants and Humanoid
		-- R15 use MeshPart and R6 use Part, so we use BasePart here to detect both:
		if child:IsA("BasePart") then
			child.BrickColor = color
		end
	end
end
paintFigure(Players.Player.Character, BrickColor.new("Bright blue"))
```

Since all classes inherit from [[30 Official Roblox Docs/API Reference/Classes/Object|Object]], calling `object:IsA("Object")` will always return true.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The class against which the Object's class will be checked. Case-sensitive. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Describes whether the Object's class matched or is a subclass of the given class. |

*Code samples for this member (`Instance-IsA1`) are published on the source page; their code is not part of the open-source repo.*

### isA

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Object:IsA()` which should
> be used instead.

```lua
Object:isA(className: string): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`, `CustomLuaState`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

## Events

### Changed

```lua
Object.Changed(property: string)
```

This event fires immediately after an object property is changed, with some exceptions (see below). The new value of a changed property is **not** passed as a parameter. Instead, you can access it using `object[property]`:

```
object.Changed:Connect(function(property)
	print("The new property's value is", object[property])
end)
```

- If you are only interested in listening for changes to one specific property, consider using the [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]] method instead.
- To listen for changes in attributes, see [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|Instance:GetAttributeChangedSignal()]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#AttributeChanged|Instance.AttributeChanged]].
- To detect when children are added or removed, see [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|Instance.ChildRemoved]].

For [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects such as [[30 Official Roblox Docs/API Reference/Classes/IntValue|IntValue]] and [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]], this event only fires when the object's `Value` property changes. To detect other changes in [[30 Official Roblox Docs/API Reference/Classes/ValueBase|ValueBase]] objects, use [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]].

#### Limitations

This event does **not** fire for physics-related changes, such as when the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|Orientation]] properties of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] change due to gravity. To detect changes in these properties, consider using a physics-based event like [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]]. Similarly, the `Changed` event does not fire when [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass|AssemblyMass]] updates due to a change in material, size, or density for a welded part (but the event does fire for [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass|Mass]] if you modify a part's size).

For properties that change frequently, the `Changed` event might not fire for every modification, or it might not fire at all. **If a property change impacts your game logic, test carefully** to ensure the event is firing as you expect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | The name of the property that changed. |

*Code samples for this member (`Changed-Event`, `Change-Detector`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Object](https://create.roblox.com/docs/reference/engine/classes/Object) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
