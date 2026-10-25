---
title: "List and flex layouts"
description: "How to use list layouts and flex settings for highly responsive user interfaces."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/list-flex-layouts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How to use list layouts and flex settings for highly responsive user interfaces.*

The [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] into horizontal rows or vertical columns within their parent container. Whenever you add or remove a sibling object, the layout adjusts accordingly.

*(image in the full Top G Vault)*

> [!warning]
> Once you insert a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], it either overrides or influences the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]], and/or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of all sibling UI objects, so changes to those properties within the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window or within a script will not have the normal effect.

## Fill direction

The [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] property determines the direction in which the list layout's siblings will render.

*(image in the full Top G Vault)*

Ordering is determined by the layout's [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder|SortOrder]] property which can be either **ascending numeric**, based on each item's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] integer value, or **alphanumeric** based on the item's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]].

*(image in the full Top G Vault)*

> [!info]
> To reverse elements, such as right-to-left ordering in a horizontal list, you'll need to reverse the sorting. For example, if four items are ordered by [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] of `0`, `1`, `2`, `3` respectively, negate each value to form an order of `0`, `-1`, `-2`, `-3`.

## Alignment

The [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment|HorizontalAlignment]] and [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|VerticalAlignment]] properties determine the respective **X** and **Y** alignment of both the list's siblings in relation to each other and the list's overall bounds within its container. For example, a horizontally-filled list with [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|VerticalAlignment]] of [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Center]] centrally aligns the list's siblings with each other **and** centers the list vertically in its container.

*(image in the full Top G Vault)*

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment|HorizontalAlignment]] and [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|VerticalAlignment]] differ slightly from [[30 Official Roblox Docs/UI/List and flex layouts#Item line alignment|item line alignment]] in a [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex]] layout, with which you can align items in the same line without applying the same alignment to the list's overall bounds in its container.

## Wrapping

The [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Wraps|Wraps]] boolean controls whether siblings within the parent container wrap to another line when their default size exceeds the width/height of the container's bounds.

*(image in the full Top G Vault)*

## Padding

The [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Padding|Padding]] property determines the amount of empty space **between** each list item, set to either a scale (percentage of the container's size in the current direction) or an offset (static spacing value similar to pixel size).

> [!info]
> This property does not apply padding **around** the list's overall bounds; see [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] to apply top, bottom, left, and/or right padding to the contents of the parent.

## Flex layouts

Integrating **flex** into a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] is a powerful way to [[30 Official Roblox Docs/UI/List and flex layouts#Equal fill or distribution|equally fill/distribute]] or [[30 Official Roblox Docs/UI/List and flex layouts#Item line alignment|align/stretch]] list items across their line, or [[30 Official Roblox Docs/UI/List and flex layouts#Flex individual items|flex specific items]] across a variable space.

> [!warning]
> While flex is a powerful tool, you should not apply it to a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] without purpose, as it adds a slight performance cost above non‑flex, especially when resizing the layout or dynamically adding/removing flex items.
>
> Additionally, a [[30 Official Roblox Docs/UI/Grid and table layouts#Grid layout|grid layout]] may be preferable when items should strictly align to a grid in both the **X** and **Y** directions, since grid layouts enforce a consistent cell size while flex layouts may use a variable number of items per line.

### Equal fill or distribution

When the list layout's [[30 Official Roblox Docs/UI/List and flex layouts#Fill direction|fill direction]] is set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Horizontal]], the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] property specifies how to distribute extra horizontal space in the parent container. Similarly, when the fill direction is set to [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Vertical]], the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex|VerticalFlex]] property specifies how to distribute extra vertical space.

#### HorizontalFlex

*(image in the full Top G Vault)*

#### VerticalFlex

*(image in the full Top G Vault)*

One practical use of [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] is a **tabbed window** interface where flex fills the tab bar equally, regardless of the number of tabs. No approach is easier than flex in this case, because it automatically calculates the width of each tab without developer‑defined width settings, and it automatically adjusts if the number of tabs changes.

#### 3 Tabs

*(image in the full Top G Vault)*

#### 6 Tabs

*(image in the full Top G Vault)*

### Item line alignment

The [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|ItemLineAlignment]] property defines the **cross‑directional** alignment of siblings within a line, letting you align objects of different widths/heights or make objects of lesser width/height fill their entire line.

*(image in the full Top G Vault)*

One practical use case for [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment|ItemLineAlignment]] is to stretch a series of inconsistently sized tiles to fill their entire row ([[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment|Stretch]]), making the layout more cohesive.

#### Uneven Layout

*(image in the full Top G Vault)*

*Tiles with varying content heights result in an uneven and staggered layout*

#### Filled Lines

*(image in the full Top G Vault)*

*Tiles stretched to fill their line result in a more even and consistent layout*

### Flex individual items

While flexing an entire layout is a powerful utility, certain layouts are more suited to **individual item flexing**. In such layouts, some elements in the list maintain their core size while other items flex to fill variable spaces. One practical usage is a slider bar widget with uniform [[30 Official Roblox Docs/UI/Text & image labels|labels]] on both ends and a flexible slider bar that fills the entire width between.

*(image in the full Top G Vault)*

To set one specific list item as flexible, insert a [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem|UIFlexItem]] as a child of the flexible item, then set its [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode|FlexMode]] property to [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Fill]], [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Grow]], [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Shrink]], or [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode|Custom]].

*(image in the full Top G Vault)*

---
*Source: [List and flex layouts](https://create.roblox.com/docs/ui/list-flex-layouts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
