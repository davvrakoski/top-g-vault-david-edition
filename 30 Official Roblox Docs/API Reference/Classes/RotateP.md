---
title: "RotateP"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RotateP"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

> [!warning] Deprecated
> This class works alongside the deprecated `Enum.SurfaceType` and should not be
> used for future work; use `Class.HingeConstraint` instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/DynamicRotate|DynamicRotate]] → [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

A **RotateP** object joins two parts together and allows rotation about a set axis. The joint will attempt to rotate the two parts until a desired rotational position is reached. This object is most commonly created by the [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|Enum.SurfaceType.SteppingMotor]] on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. If created through a script, behavior is still governed by the surface input of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]].

The three inputs of note are as follows:

- `NoInput` — The joint will not rotate under its own power. It can still be rotated by external forces (such as from a character pushing one of the parts).

- `Constant` — The joint will rotate based on the `ParamB` property of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]]. This rotation is measured in radians per physics frame (which is approximately 1/60th of a second).

- `Sin` — The joint will rotate based on the `ParamA` and `ParamB` properties of [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part0|JointInstance.Part0]].

---
*Source: [RotateP](https://create.roblox.com/docs/reference/engine/classes/RotateP) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
