---
title: "ForceField"
description: "Protects a `Humanoid` from taking damage dealt through the `Humanoid:TakeDamage()` method and protects `BaseParts` from having their joints broken due to an `Explosion`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ForceField"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Protects a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] from taking damage dealt through the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|Humanoid:TakeDamage()]] method and protects [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] from having their joints broken due to an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **ForceField** protects a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] from taking damage dealt through the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|Humanoid:TakeDamage()]] method and protects [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] from having their joints broken due to an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]]. A new **ForceField** is created when a character spawns on a [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] and the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Duration|SpawnLocation.Duration]] property is greater than zero.

#### Damage and Joints

A **ForceField** influences the instance it's parented to. When parented to a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], it protects all of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] descending from that model. If parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the part's joints will only be protected if both the part and the part it's connected to also contain a **ForceField**.

**ForceField** only protects [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] from damage dealt by the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|Humanoid:TakeDamage()]] method. Humanoids can still be damaged by setting [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] directly. For this reason, it's advised that you use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|Humanoid:TakeDamage()]] to assign damage while accounting for force field protection.

#### Visualization

When [[30 Official Roblox Docs/API Reference/Classes/ForceField#Visible|ForceField.Visible]] is set to true, a particle effect is created. A number of rules determine where this effect will be emitted from:

- When parented to a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], if the model includes a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] named **Humanoid** with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RigType|Humanoid.RigType]] set to R15, the effect will be emitted from the part named **UpperTorso**. Otherwise, the effect will be emitted from the part named **Torso**.
- When parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the effect will be emitted from the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]].

*Code samples for this API (`ForceField-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ForceField); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ForceField#Visible\|Visible]] | boolean | Determines whether or not the [[30 Official Roblox Docs/API Reference/Classes/ForceField\|ForceField]] particle effect is visible. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Determines whether or not the [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] particle effect is visible. Setting this to `false` lets you replace the default particle effect with a custom effect as demonstrated in the following code sample.

*Code samples for this member (`Custom-ForceField`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ForceField](https://create.roblox.com/docs/reference/engine/classes/ForceField) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
