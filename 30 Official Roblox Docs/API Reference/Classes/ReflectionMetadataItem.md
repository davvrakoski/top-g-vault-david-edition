---
title: "ReflectionMetadataItem"
description: "Acts as abstract properties for generic information about Classes, Members, Enums, and EnumItems."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReflectionMetadataItem"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Acts as abstract properties for generic information about Classes, Members, Enums, and EnumItems.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass|ReflectionMetadataClass]], [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataEnum|ReflectionMetadataEnum]], [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataEnumItem|ReflectionMetadataEnumItem]], [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataMember|ReflectionMetadataMember]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Acts as abstract properties for generic information about Classes, Members, Enums, and EnumItems.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#Browsable\|Browsable]] | boolean | Whether or not this can be seen in studio. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#ClassCategory\|ClassCategory]] | string | Describes the category of this class. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#ClientOnly\|ClientOnly]] | boolean | Whether this item is only meaningful on the client. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#Constraint\|Constraint]] | string | Describes a constraint for a single-argument function whose argument type is a [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#Deprecated\|Deprecated]] | boolean | Whether or not this item is deprecated. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#EditingDisabled\|EditingDisabled]] | boolean | Toggles whether this property can be edited from the Properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#EditorType\|EditorType]] | string | Names the editor used for this property in the Properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#FFlag\|FFlag]] | string | Names a setting that controls whether this item is browsable. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#IsBackend\|IsBackend]] | boolean | Vague value for showing if this depends on backend stuff. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#PropertyOrder\|PropertyOrder]] | int | The sort position of this property within its category in the Properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#ScriptContext\|ScriptContext]] | string | Describes the context where this member can be used. If set to "Server", this member will not be available to auto fill when editing a [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]]. If set to "Client", this member will not be available to auto fill when editing a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#ServerOnly\|ServerOnly]] | boolean | Whether this item is only meaningful on the server. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#SliderScaling\|SliderScaling]] | string | The scaling mode for this property's slider bar in the Properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum\|UIMaximum]] | double | The maximum value of this property. Used with [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum\|ReflectionMetadataItem.UIMinimum]] to control the slider bar of this property in the `Properties` window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum\|UIMinimum]] | double | The minimum value of this property. Used with [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum\|ReflectionMetadataItem.UIMaximum]] to control the slider bar of this property in the `Properties` window. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UINumTicks\|UINumTicks]] | double | The number of potential values the property's slider bar can be set to, [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum\|ReflectionMetadataItem.UIMinimum]] and [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum\|ReflectionMetadataItem.UIMaximum]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Browsable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

When this value is true, it means that this property/class can be seen in Studio, e.g. in the explorer.

### ClassCategory

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

The category name used to group this class in Studio's Insert Object window. When set, the class is listed under a heading matching this category; when left at its default empty string, the class is grouped under "Uncategorized". This applies to class-level reflection metadata and has no effect on individual members.

### ClientOnly

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

When this value is true, this reflection item is only meaningful on the client and shouldn't be read or set on the server. Defaults to false.

### Constraint

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Describes a constraint for a single-argument function whose argument type is a [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName|Object.ClassName]]. Currently there are two constraints available:

| Constraint | Description |
| --- | --- |
| isScriptCreatable | The specified class must be creatable with Instance.new |
| isService | The specified class must be a service. |

### Deprecated

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

When an object is deprecated, it should not be used anymore for new scripts.

### EditingDisabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

When this value is true, the property is shown as read-only in Studio's Properties window: its value is still displayed but cannot be edited there. Defaults to false, in which case the property can be edited normally.

### EditorType

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Identifies the specialized editor used to display and edit this property in Studio's Properties window. Defaults to an empty string, in which case the default editor for the property's value type is used.

### FFlag

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Names a Studio setting whose state controls whether this item is browsable. When set, the item is hidden unless that setting is on; prefixing the name with `!` inverts this. Defaults to an empty string, in which case visibility is governed only by [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#Browsable|ReflectionMetadataItem.Browsable]].

### IsBackend

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

This should determine if a method needs to use stuff on the Roblox main servers. This property isn't applied where it should be, though.

### PropertyOrder

**Type:** int

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Controls where this property appears relative to others in its category in the Properties window; lower values appear higher. Defaults to 5000, which leaves room to order properties before or after those that have no explicit order.

### ScriptContext

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Describes the context where this member can be used. If set to
[[30 Official Roblox Docs/Luau/Strings|"Server"]], this member will not be
available to auto fill when editing a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. If set to
[[30 Official Roblox Docs/Luau/Strings|"Client"]], this member will not be
available to auto fill when editing a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

### ServerOnly

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

When this value is true, this reflection item is only meaningful on game servers and shouldn't be read or set on the client. Defaults to false.

### SliderScaling

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Determines how the Properties-window slider maps tick positions to values between [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum|ReflectionMetadataItem.UIMinimum]] and [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum|ReflectionMetadataItem.UIMaximum]]. When set to "Square", the slider uses a quadratic mapping so that ticks near the minimum give finer control; any other value, including the default empty string, uses a linear mapping. The slider only takes effect when its range is configured through [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum|ReflectionMetadataItem.UIMinimum]], [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum|ReflectionMetadataItem.UIMaximum]], and [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UINumTicks|ReflectionMetadataItem.UINumTicks]], which all default to 0.

### UIMaximum

**Type:** double

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

The upper bound of the slider shown for this numeric property in Studio's Properties window, used together with [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum|ReflectionMetadataItem.UIMinimum]]. Both default to 0, and Studio only shows a slider when the minimum and maximum differ; with the default values the property is edited through a plain input field with no slider.

### UIMinimum

**Type:** double

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

The lower bound of the slider shown for this numeric property in Studio's Properties window, used together with [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum|ReflectionMetadataItem.UIMaximum]]. Both default to 0, and Studio only shows a slider when the minimum and maximum differ; with the default values the property is edited through a plain input field with no slider.

### UINumTicks

**Type:** double

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

The number of discrete tick positions on this property's Properties-window slider, mapping each tick to a value between [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum|ReflectionMetadataItem.UIMinimum]] and [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum|ReflectionMetadataItem.UIMaximum]]. Defaults to 0, in which case Studio substitutes a built-in default number of intervals. It only takes effect when the slider is active, which requires [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMinimum|ReflectionMetadataItem.UIMinimum]] and [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem#UIMaximum|ReflectionMetadataItem.UIMaximum]] to be set to different values.

---
*Source: [ReflectionMetadataItem](https://create.roblox.com/docs/reference/engine/classes/ReflectionMetadataItem) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
