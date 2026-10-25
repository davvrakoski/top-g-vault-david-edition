---
title: "Explorer window"
description: "The Explorer window shows a hierarchical list of every instance inside a game."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/explorer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Explorer window shows a hierarchical list of every instance inside a game.*

The **Explorer** window, accessible from Studio's **Window** menu or **Home** tab toolbar, shows a hierarchical list of every instance inside a game. At the highest level of the hierarchy are the services; [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], for example, is where visible 3D content such as [[30 Official Roblox Docs/Parts/Parts|parts]] are stored.

*(image in the full Top G Vault)*

## Parent-child hierarchy

All children of a parent object appear under its branch when expanded. Click the arrow next to a parent branch — or press the <kbd>→</kbd>/<kbd>←</kbd> arrow keys when a parent is selected — to expand/collapse only that branch.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!info]
> To expand or collapse **all** branches within a multi‑nested hierarchy, hold <kbd>Shift</kbd> when clicking the expand/collapse arrow.

To change the parent of one or more children (reparent), simply drag and drop them onto the new parent.

*(image in the full Top G Vault)*

## Object insertion

While primitive [[30 Official Roblox Docs/Parts/Parts|parts]] can be [[30 Official Roblox Docs/Parts/Parts#Insert parts|inserted]] from the **Home** or **Model** tab toolbars, you can select from a full array of objects by hovering over the intended parent and clicking the ⊕ button (shortcut of <kbd>Ctrl</kbd><kbd>I</kbd> on Windows or <kbd>⌘</kbd><kbd>I</kbd> on Mac).

*(image in the full Top G Vault)*

You can further customize insertion behavior by clicking the **⋯** button to the right of the search field:

*(image in the full Top G Vault)*

| Option | Description |
| --- | --- |
| **Increment names for new instances** | When enabled, inserted/pasted/duplicated instances of the same type will have numbered names for differentiation. |
| **Expand hierarchy when selecting** | When enabled, inserting/pasting an instance or selecting an object in the [[30 Official Roblox Docs/Studio/Studio interface#3D viewport\|3D viewport]] will expand the **Explorer** hierarchy to reveal that instance. When disabled, the top‑level parent within the hierarchy will be highlighted, but it won't expand to reveal the selected instance. |

> [!success]
> To keep the hierarchy cleaner, services such as [[30 Official Roblox Docs/API Reference/Classes/VoiceChatService|VoiceChatService]] are hidden by default. You can show hidden services by right‑clicking in the window and selecting **Show Services…** from the context menu. Similarly, you can hide a visible service by right‑clicking it and selecting **Hide Service in Explorer**.

## Duplicate and paste

Objects can be quickly duplicated into the same branch, while items copied to the clipboard can be pasted into the top‑level [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or directly into one or more existing parents.

| Action | Windows | Mac | Description |
| --- | --- | --- | --- |
| **Duplicate** | <kbd>Ctrl</kbd><kbd>D</kbd> | <kbd>⌘</kbd><kbd>D</kbd> | Duplicates the selected objects into the same branch. |
| **Paste** | <kbd>Ctrl</kbd><kbd>V</kbd> | <kbd>⌘</kbd><kbd>V</kbd> | Pastes the clipboard contents into the top‑level [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] branch. |
| **Paste Into** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>V</kbd> | <kbd>⌘</kbd><kbd>Shift</kbd><kbd>V</kbd> | Pastes the clipboard contents into the selected object(s). Using this action on multiple selected objects is a convenient way to paste the same clipboard items into multiple parents, such as a common [[30 Official Roblox Docs/API Reference/Classes/Texture\|Texture]] into several different [[30 Official Roblox Docs/API Reference/Classes/Part\|Parts]]. |

> [!info]
> When pasting 3D objects copied to the clipboard, you can maintain their original [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] position by right‑clicking the target parent instance in the hierarchy and selecting **Paste Options** ⟩ **Paste Into At Original Location**.

## Contextual options

Right-clicking on an instance opens the options menu, contextually adjusted for the object type. For example, right‑clicking a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] reveals standard options like **Copy** and **Duplicate**, and also options specific to [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] like **Ungroup**. In contrast, right‑clicking a service like [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] reveals a more concise menu of actions valid for services.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Folder organization

Like directories/folders on a computer, the [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] object is a useful way to organize objects. For instance, if you want to store all environmental audio assets in a logical place, you can create a folder and place multiple [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] objects within it.

*(image in the full Top G Vault)*

You can organize objects into folders as follows:

- Create a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] instance through a standard [[30 Official Roblox Docs/Studio/Explorer window#Object insertion|insertion]] method, then drag and drop existing objects into it.

- Select multiple objects, right-click them, and then select **Group As a Folder** from the context menu (shortcut of <kbd>Alt</kbd><kbd>Ctrl</kbd><kbd>G</kbd> on Windows or <kbd>⌥</kbd><kbd>⌘</kbd><kbd>G</kbd> on Mac).

## Search methods

Through the **search** input near the top of the window, you can find instances by [[30 Official Roblox Docs/Studio/Explorer window#Name search|name]], [[30 Official Roblox Docs/Studio/Explorer window#Property search|property]], class/subclass/tag [[30 Official Roblox Docs/Studio/Explorer window#Bespoke search|bespoke]] queries, and [[30 Official Roblox Docs/Studio/Explorer window#Ancestry search|ancestry]] queries. You can also [[30 Official Roblox Docs/Studio/Explorer window#Combined|combine parameters]] for advanced logical searches. Quickly access this input by pressing <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>X</kbd> (Windows) or <kbd>⌘</kbd><kbd>Shift</kbd><kbd>X</kbd> (Mac).

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Navigate up and down through search results

*(image in the full Top G Vault)*

Select all search results (<kbd>Ctrl</kbd><kbd>A</kbd> on Windows or <kbd>⌘</kbd><kbd>A</kbd> on Mac)

*(image in the full Top G Vault)*

Refresh search results

> [!success]
> A name is a sequence of characters that are alphanumeric, `_`, `-`, or `.`.
> In all of the following search methods, exercise caution when searching for instances whose names contain spaces, as the search logic may confuse spaces for a [[30 Official Roblox Docs/Studio/Explorer window#Combined|combined search]]. When searching for names with spaces, you should surround the full name with double quotes, for example
>
> `tag:"Light Source"`
>
>  to search by the full [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tag]] name of
>
> `Light Source`
>
> .

### Name search

Typing in a basic string yields **name** matched instances, case‑insensitive. For example, searching by the keyword `script` finds all instances containing it, such as `ServerScriptService` and `LocalScript`.

*(image in the full Top G Vault)*

### Property search

You can filter by property equality or value comparisons. Most properties are supported, it works with partial matches, ignores spacing, and is case‑insensitive.

#### Equality

Property **equality** is searched through the operators `=` or `==`.

| Example | Result |
| --- | --- |
| `ClassName = Decal` | All instances of class [[30 Official Roblox Docs/API Reference/Classes/Decal\|Decal]]. |
| `Locked = true` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Locked\|Locked]] set to `true`. |
| `Material == plas` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material\|Material]] of either [[30 Official Roblox Docs/API Reference/Enums/Material\|Plastic]] or [[30 Official Roblox Docs/API Reference/Enums/Material\|SmoothPlastic]]. |

#### Value Comparisons

Property **value comparisons** are searched through the operators `~=`, `>`, `<`, `<=`, or `>=`.

| Example | Result |
| --- | --- |
| `Health > 50` | Every [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Health]] more than `50`. |
| `Transparency ~= 0.5` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|Transparency]] **not** equal to `0.5`. |

#### Individual Fields

Property types such as [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] and [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] support searching by **individual fields**. This works either for exact equality or for value comparisons.

| Example | Result |
| --- | --- |
| `Position.X = 1` | Objects with an `X` position of exactly `1`. |
| `Color.R > 120` | Objects with a red (`R`) color channel value greater than `120`. |

#### Complete Units

Property types such as [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] and [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] support searching as a **complete unit**, with the unit surrounded by quotes. This works either for exact equality, or with comparison operators in which every value is compared against the comparator.

| Example | Result |
| --- | --- |
| `Size > "20, 5, 20"` | Objects with an `X`, `Y`, and `Z` size greater than `20`, `5`, `20`, respectively. |
| `Color = "255, 0, 0"` | Objects with an RGB color value of exactly `[255, 0, 0]`. |

### Bespoke search

Classes, and subclasses, and tags are searched through various **bespoke** queries, including:

- `is:[Class]` finds everything that is of **class** `[Class]`. For example, `is:Part` finds everything that is a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].
- `is:[SubClass]` finds everything that is a **subclass** of `[SubClass]`. For example, `is:BasePart` finds everything that is a subclass of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], such as [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
- `tag:[TagName]` finds everything with a [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tag of `[TagName]`. For example, `tag:LightSource` finds everything that is tagged `LightSource`. You can add tags using the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of an instance's properties and tag names will autocomplete.

### Ancestry search

You can search within a specific scope using the `.` operator, chain operators together for highly specific searches, or use `*` as a wildcard.

- `[Parent].[Child]` finds named children inside a named parent. For example, `workspace.Model` finds instances named `Model` inside instances named `workspace`, similar to scripting.
- Chaining `.` operators adds specificity. For instance, `Animals.Dog.Tail` finds objects named `Tail` inside `Dog` inside `Animals`.
- `*` acts as a wildcard, for instance:

   | Example | Result |
   | --- | --- |
   | `Cart.*` | All children of an object named `Cart`. |
   | `Cart.Barrier.*` | All children of `Barrier`, itself a child of `Cart`. |
   | `Cart.*.*` | All grandchildren of `Cart`, excluding direct children of `Cart`. |
   | `Cart.*.Trim` | All grandchildren of `Cart` that are named `Trim`. |

- `[Parent].**` finds all descendants of a parent. For example, `CarModel.**` finds all descendants of `CarModel`.

### Combined

For advanced logical searches, you can combine queries through unions and grouping.

- Multiple queries separated by spaces or `and` operate on **all** of the conditions.

   | Example | Result |
   | --- | --- |
   | `Anchored=true CanCollide=true` | Every [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that is anchored and can collide. |
   | `Cart.*.* Transparency < 1` | All grandchildren of `Cart` that are not fully transparent. |
   | `Anchored=false and CanCollide=false` | Every [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that isn't anchored and can't collide. |

- The `or` conjunction operates just like the `or` operator in code. Groups within parentheses, conjoined by `or`, find everything within multiple combined queries.

   | Example | Result |
   | --- | --- |
   | `Cat or Dog` | Everything that has `Cat` or `Dog` in its name. |
   | `(Anchored=true CanCollide=true) or (Anchored=false CanCollide=false)` | Every [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that either is anchored and can collide, **or** isn't anchored and can't collide. |

## Selection methods

Within a [[30 Official Roblox Docs/Studio/Explorer window#Search methods|searched]] hierarchy, certain key shortcuts and mouse operations behave differently than they do within a non‑searched hierarchy.

### Select all

Within a non‑searched hierarchy, pressing <kbd>Ctrl</kbd><kbd>A</kbd> on Windows or <kbd>⌘</kbd><kbd>A</kbd> on Mac selects all instances. Within a [[30 Official Roblox Docs/Studio/Explorer window#Search methods|searched]] hierarchy, the same shortcut or the **select all** button selects only the query‑matching objects, for example all objects matching **Board** in a hierarchy searched for `board`.

*(image in the full Top G Vault)*

### Shift-select

Clicking an object and <kbd>Shift</kbd>-clicking another object behaves differently within a non‑searched hierarchy versus a [[30 Official Roblox Docs/Studio/Explorer window#Search methods|searched]] hierarchy.

#### Non-Searched Hierarchy

Within a non-searched hierarchy, <kbd>Shift</kbd>-clicking two objects at the same hierarchy level selects both of them and every object between which is also at the same hierarchy level, as shown in image **🅰** where **LeftFoot** is initially clicked, **LeftLowerArm** is <kbd>Shift</kbd>‑clicked, and **LeftHand** at same hierarchy level is also selected. Duplicating, copying, or pasting the selected objects will result in a deep copy of those objects **and** all children.

If the first <kbd>Shift</kbd>-clicked object and the second <kbd>Shift</kbd>-clicked object are at **different** hierarchy levels, all objects in between them will be selected, as shown in image **🅱** where **LeftFoot** is initially clicked, **LeftHand** is <kbd>Shift</kbd>‑clicked, and everything between is also selected.

*(image in the full Top G Vault)*

*<kbd>Shift</kbd>-click at same hierarchy level*

*(image in the full Top G Vault)*

*<kbd>Shift</kbd>-click at different hierarchy level*

#### Searched Hierarchy

Within a searched hierarchy, if both the initially‑clicked object and the <kbd>Shift</kbd>‑clicked object match the query, only query‑matching objects between are selected. For example, in the following image with a hierarchy searched for `anim`, **FallAnim** is initially clicked, **RunAnim** is <kbd>Shift</kbd>‑clicked, and every object matching `anim` between is also selected.

*(image in the full Top G Vault)*

### Drag select

Clicking and dragging from an empty region of the window initiates a selection box. Within a non‑searched hierarchy, everything inside the box is selected. Within a [[30 Official Roblox Docs/Studio/Explorer window#Search methods|searched]] hierarchy, only query‑matching objects inside the box are selected.

*(image in the full Top G Vault)*

## Key shortcuts

| Shortcut | Description |
| --- | --- |
| <kbd>→</kbd> | With a collapsed branch selected, expands that branch. When pressed again, selects the **first child** immediately under the parent node. |
| <kbd>←</kbd> | With any child of a branch selected, moves selection back to the parent node. When pressed again, collapses the entire branch. |
| <kbd>Home</kbd> | Selects the topmost object in the hierarchy ([[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]). |
| <kbd>End</kbd> | Selects the bottommost object in the hierarchy. |
| <kbd>PageUp</kbd> | Selects the object in the hierarchy that's above the topmost **visible** hierarchy item. |
| <kbd>PageDown</kbd> | Selects the object in the hierarchy that's below the bottommost **visible** hierarchy item. |
| <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>X</kbd><br><kbd>⌘</kbd><kbd>Shift</kbd><kbd>X</kbd> | Jump to the [[30 Official Roblox Docs/Studio/Explorer window#Search methods\|search input]] near the top of the window. |

---
*Source: [Explorer window](https://create.roblox.com/docs/studio/explorer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
