---
title: "Properties window"
description: "The Properties window lets you adjust properties of a selected object to change how it looks and behaves."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/properties"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Properties window lets you adjust properties of a selected object to change how it looks and behaves.*

The **Properties** window, accessible from Studio's **Window** menu or **Home** tab toolbar, allows you to adjust certain properties of a selected object to change how the object looks and behaves. Additionally, you can manage [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tags]] and configure instance [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] at the bottom of the window.

*(image in the full Top G Vault)*

When you select an object, the window's header bar changes to reflect the object's class and name, and its properties are divided into sections. For example, a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] includes sections like **Appearance** and **Transform** which respectively allow you to change its appearance and transform its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]], and origin.

*(image in the full Top G Vault)*

> [!info]
> You can collapse or expand any section or subsection by clicking the small arrow to the left of its name. After you expand or collapse a section, it remains expanded or collapsed for other objects of the same class, as well as related objects that share the same property grouping.

Some properties are collapsed by default, but you can expand them by clicking the small arrow next to its name. For instance, [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] contain a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] property which represents an **X**, **Y**, **Z** coordinate in the 3D world. In Studio, these coordinates can be entered in two ways:

*(image in the full Top G Vault)*

*All three coordinates typed into the parent **Size** field, separated by commas*

*(image in the full Top G Vault)*

*Property expanded and an individual size vector typed into the **X**, **Y**, and **Z** fields*

> [!info]
> After you expand or collapse a property, it remains expanded or collapsed for other objects of the same class, as well as related objects that share the same property.

## Property filter

You can filter properties by typing a search query into the **Filter Properties** input near the top of the window. For example, filtering by the letters "velo" finds all properties containing them, such as **AssemblyLinear<u>Velo</u>city** and **AssemblyAngular<u>Velo</u>city**. Quickly access this input by pressing <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>P</kbd> (Windows) or <kbd>⌘</kbd><kbd>Shift</kbd><kbd>P</kbd> (Mac).

*(image in the full Top G Vault)*

## Instance tags

The **Tags** section allows you to apply specific tags for use with [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]]. Tags are sets of strings applied to instances that replicate from the server to the client. They are also serialized when places are saved.

To add tags to an instance through the **Properties** window:

1. Select the instance, scroll to the **Tags** section, and click the **+** button.

   *(image in the full Top G Vault)*

1. In the popup window, enter a new tag name **or** select a tag you've already created for any other instance from the list below the input field. The tag will appear within the **Tags** section.

   *(image in the full Top G Vault)*

1. If necessary, you can remove an existing tag by clicking the **×** icon.

   *(image in the full Top G Vault)*

## Instance attributes

**Attributes** allow you to customize instances with your own data. They are similar to built-in object properties, but you can create and modify your own attributes for any instance. Key features include:

- Attributes can be created, edited, and deleted directly within Studio or through scripting (see [[30 Official Roblox Docs/Scripting/Properties and attributes|properties and attributes]] for script commands to create, set, get, and delete attributes).
- Attributes and their values are saved with your place and assets.
- Value changes can be viewed in real time and are **replicated** so that clients can access them immediately.

You can store the following types/values in attributes:

- [[30 Official Roblox Docs/Luau/Strings|string]]
- [[30 Official Roblox Docs/Luau/Booleans|boolean]]
- [[30 Official Roblox Docs/Luau/Numbers|number]]
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]]

- [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]
- [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

- [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]
- [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]
- [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]
- [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]

- [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Rect|Rect]]
- [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

<br>

New attributes can be created and modified in Studio as follows:

1. Select the instance, scroll to the **Attributes** section, and click the **+** button.

   *(image in the full Top G Vault)*

1. In the popup window, enter the attribute **Name**, select its **Type**, and click **Save**.
1. The new attribute will appear with a default value that you can change just like any other property.

   *(image in the full Top G Vault)*

1. If necessary, you can rename or delete an attribute by clicking the gear icon.

   *(image in the full Top G Vault)*

## Configurable defaults

The **configurable defaults** feature allows you to save properties from a selected [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] as the new default for that type, reset them as needed, and share them from a local file if desired. Use cases include:

- A default [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instance where [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] is `true`, so that every new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] inserted into the 3D workspace is anchored.
- A set of default [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] with physical behaviors that match the type of mechanisms you're currently building, such as massive vehicles vs. smaller machines with less mass.
- A set of default [[30 Official Roblox Docs/Effects/Light sources|light]] sources ([[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]], [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]]), each with [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] that suits the environment you're designing.

To **set** a specific instance as the default:

1. Select the instance in the 3D viewport or [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy.
2. From Studio's main **Edit** menu, select **Save as Default [Instance]**. A toast notification will indicate that the default has been updated, and newly inserted instances of that type will match the default properties.

   *(image in the full Top G Vault)*

	 > [!info]
	 > Instance defaults are saved **locally** on each machine to a `DefaultInstances.rbxm` file, not to your Roblox or group account. The location of this directory can be changed in Studio's settings (<kbd>Alt</kbd><kbd>S</kbd> or <kbd>⌥</kbd><kbd>S</kbd>) under the **Studio** tab ⟩ **Instance Defaults Dir**.

To **reset** a configurable default instance:

1. Select any instance of that type in the 3D viewport or [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy.
2. From Studio's main **Edit** menu, select **Reset Default [Instance]**. Existing instances of that type will retain their properties, but newly inserted instances will use Studio's default properties.

> [!warning]
> Note the following exceptions and behavioral rules to default instances:
>
> - The **positional** instance properties [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Origin|PVInstance.Origin]], and [[30 Official Roblox Docs/API Reference/Classes/Model#WorldPivot|Model.WorldPivot]] are **not** affected by default properties, but rather are overridden by Studio insertion rules and workflows. However, [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|GuiObject.Position]] and positional properties for [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] ([[30 Official Roblox Docs/API Reference/Classes/Attachment#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldCFrame|WorldCFrame]], [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldPosition|WorldPosition]]) are stored/maintained in configured defaults of those instance types.
> - Studio's **Group as Model** (<kbd>Ctrl</kbd><kbd>G</kbd> or <kbd>⌘</kbd><kbd>G</kbd>) and **Group as Folder** (<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>G</kbd> or <kbd>⌘</kbd><kbd>⌥</kbd><kbd>G</kbd>) actions do **not** use the instance defaults for [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]], respectively.

---
*Source: [Properties window](https://create.roblox.com/docs/studio/properties) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
