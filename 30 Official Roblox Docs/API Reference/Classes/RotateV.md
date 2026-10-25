---
title: "RotateV"
description: "Joins two parts and allows rotation driven by angular velocity from the Motor surface type."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RotateV"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Joins two parts and allows rotation driven by angular velocity from the Motor surface type.*

> [!warning] Deprecated
> This class works alongside the deprecated `Enum.SurfaceType` and should not be
> used for future work; use `Class.HingeConstraint` instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/DynamicRotate|DynamicRotate]] → [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

A **RotateV** object joins two parts together and allows rotation about a set axis. This object is most commonly created by the [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|Enum.SurfaceType.Motor]] on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If created through a script, behavior is still governed by the surface input of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]].

The three inputs of note are as follows:

- `NoInput` — The joint will not rotate under its own power. It can still be rotated by external forces (such as from a character pushing one of the parts).

- `Constant` — The joint will rotate based on the ParamB property of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]]. This rotation is measured in radians per physics frame (which is approximately 1/60th of a second).

- `Sin` — The joint will rotate based on the `ParamA` and `ParamB` properties of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]].

---
*Source: [RotateV](https://create.roblox.com/docs/reference/engine/classes/RotateV) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
