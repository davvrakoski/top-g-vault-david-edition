---
title: "NoCollisionConstraint"
description: "An instance used to prevent collisions between two specific parts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NoCollisionConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An instance used to prevent collisions between two specific parts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The **NoCollisionConstraint** prevents collisions between two specific parts, but those parts may still register collisions with the rest of the world. Compared to [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision groups]], it provides a direct way to disable specific collisions, such as the wheel of a car scraping against the car's body.

The most common way to create this constraint is by selecting **No Collision** through Studio's **Create** menu in the toolbar's **Model** tab.

Unlike most constraints, [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint|NoCollisionConstraint]] does not utilize any [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. Note that the tool acts differently based on how many parts are selected when the tool is activated:

| Option | Tool Behavior |
| --- | --- |
| No parts selected | The next two parts that are clicked will be linked together. If the same part is clicked twice, no link will be created. |
| One part selected | The next part that is clicked will be linked to the selected part. |
| Two parts selected | Both selected parts will be linked together. |

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint#Enabled\|Enabled]] | boolean | Determines whether the two linked [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] will collide with each other. |
| [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint#Part0\|Part0]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The second [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that the constraint connects. |
| [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint#Part1\|Part1]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The first [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] that the constraint connects. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics

This property determines whether the two linked parts, [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint#Part0|Part0]] and [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint#Part1|Part1]], will collide with each other.

### Part0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Parts · **Loaded/Saved:** true/true · **Capabilities:** Physics

The second [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the constraint connects.

### Part1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Parts · **Loaded/Saved:** true/true · **Capabilities:** Physics

The first [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the constraint connects.

---
*Source: [NoCollisionConstraint](https://create.roblox.com/docs/reference/engine/classes/NoCollisionConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
