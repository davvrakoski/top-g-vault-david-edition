---
title: "Weld"
description: "WeldConstraint attaches two BaseParts together and ensures they stay in the same relative position and orientation to each other."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/constraints/weld"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*WeldConstraint attaches two BaseParts together and ensures they stay in the same relative position and orientation to each other.*

A [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] connects two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and ensures they stay in the same relative position and orientation to each other. Even if the two parts are not touching, you can weld them together.

> [!info]
> To attach two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bones]], versus two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], see [[30 Official Roblox Docs/Physics/Constraints/Rigid|RigidConstraint]].

Unique to [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] are slight behavioral differences in how Studio handles creation and repositioning of welded parts.

### Weld Creation

When creating a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] using Studio's [[30 Official Roblox Docs/Physics/Mechanical constraints#Create constraints|Constraint]] button, the tool behaves differently depending on how many [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected when the tool is activated:

- If no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected, the next two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] clicked will be connected by a new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]]. If the same [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is clicked twice, no constraint will be created.
- If one [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is already selected, the next [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] clicked will be connected to the selected one with a new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]].
- If multiple [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are selected, those which are touching or overlapping will be automatically welded together by new [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]].

### Repositioning Welded Parts

Roblox handles moving a welded part differently depending on whether the part
was moved through its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] or through its
[[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

- If a welded part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] is updated, that part
  will move but none of the connected parts will move with it. The weld will
  recalculate the offset from the other parts based on the moved part's new
  position.

- If a welded part's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] is updated, that part will move **and**
  all of the connected parts will also move, ensuring they maintain the same
  offset as when the weld was created.

---
*Source: [Weld](https://create.roblox.com/docs/physics/constraints/weld) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
