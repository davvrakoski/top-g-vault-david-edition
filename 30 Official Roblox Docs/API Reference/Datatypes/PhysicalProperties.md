---
title: "PhysicalProperties"
description: "Describes properties that affect the physical behavior of a `BasePart`."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Describes properties that affect the physical behavior of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] data type describes several physical properties of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]: [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Density|Density]], [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity|Elasticity]], and [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction|Friction]]. It is used in the similarly-named [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|BasePart.CustomPhysicalProperties]] property.

#### Weighting Behavior

[[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] also provides weightings properties, [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#ElasticityWeight|ElasticityWeight]] and [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#FrictionWeight|FrictionWeight]]. When two parts interact, the friction and elasticity between them are determined in the same way by the following pairwise weighted average function:

```lua
local function getActualFriction(partA, partB)
	return (partA.Friction * partA.FrictionWeight + partB.Friction * partB.FrictionWeight) / (partA.FrictionWeight + partB.FrictionWeight)
end
```

Although the formula above refers to the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction|Friction]] and [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#FrictionWeight|FrictionWeight]] of two parts, **A** and **B**, the formula is used in the same manner when determining [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity|Elasticity]]. Generally, when the weight of **A** is much greater than that of **B**, the actual value will be closer to **A**. If the weights are similar, the actual value will be close to the midpoint between their individual values.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#new\|new()]] | `material` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] with the default properties for the given material. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#new\|new()]] | `density`, `friction`, `elasticity` | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] with the specified density, friction, and elasticity. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#new\|new()]] | `density`, `friction`, `elasticity`, `frictionWeight`, `elasticityWeight` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] container with the specified density, friction, elasticity, weight of friction, and weight of elasticity. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#new\|new()]] | `density`, `friction`, `elasticity`, `frictionWeight`, `elasticityWeight`, `acousticAbsorption` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] container with the specified density, friction, elasticity, weight of friction, weight of elasticity, and acoustic absorption. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#AcousticAbsorption\|AcousticAbsorption]] | number | A value between `0` and `1` denoting how absorbent the material is to [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitters]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Density\|Density]] | number | The mass per unit volume of the part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction\|Friction]] | number | The deceleration of the part when rubbing against another part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity\|Elasticity]] | number | The amount of energy retained when colliding with another part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#FrictionWeight\|FrictionWeight]] | number | The importance of the part's [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction\|Friction]] property when calculating the friction with the colliding part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#ElasticityWeight\|ElasticityWeight]] | number | The importance of the part's [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity\|Elasticity]] property when calculating the elasticity with the colliding part. |

## Constructors

### new

```lua
PhysicalProperties.new(material: Material): PhysicalProperties
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] container, with the density, friction, and elasticity specified for this material.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] for which to retrieve default physical properties. |

### new

```lua
PhysicalProperties.new(density: number, friction: number, elasticity: number): PhysicalProperties
```

Returns a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] container, with the specified density, friction, and elasticity.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `density` | number |  | The mass per unit volume of the part, clamped to the range [0.0001, 100]. |
| `friction` | number |  | The coefficient of friction opposing sliding motion, clamped to [0, 2]. |
| `elasticity` | number |  | The coefficient of restitution (bounciness) applied on collision, clamped to [0, 1]. |

### new

```lua
PhysicalProperties.new(density: number, friction: number, elasticity: number, frictionWeight: number, elasticityWeight: number): PhysicalProperties
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] container with the specified density, friction, elasticity, weight of friction, and weight of elasticity.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `density` | number |  | The mass per unit volume of the part, clamped to the range [0.0001, 100]. |
| `friction` | number |  | The coefficient of friction opposing sliding motion, clamped to [0, 2]. |
| `elasticity` | number |  | The coefficient of restitution (bounciness) applied on collision, clamped to [0, 1]. |
| `frictionWeight` | number |  | The weight of this part's friction in the pairwise weighted average, clamped to [0, 100]. |
| `elasticityWeight` | number |  | The weight of this part's elasticity in the pairwise weighted average, clamped to [0, 100]. |

### new

```lua
PhysicalProperties.new(density: number, friction: number, elasticity: number, frictionWeight: number, elasticityWeight: number, acousticAbsorption: number): PhysicalProperties
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] container with the specified density, friction, elasticity, weight of friction, weight of elasticity, and acoustic absorption.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `density` | number |  | The mass per unit volume of the part, clamped to the range [0.0001, 100]. |
| `friction` | number |  | The coefficient of friction opposing sliding motion, clamped to [0, 2]. |
| `elasticity` | number |  | The coefficient of restitution (bounciness) applied on collision, clamped to [0, 1]. |
| `frictionWeight` | number |  | The weight of this part's friction in the pairwise weighted average, clamped to [0, 100]. |
| `elasticityWeight` | number |  | The weight of this part's elasticity in the pairwise weighted average, clamped to [0, 100]. |
| `acousticAbsorption` | number |  | How much sound energy the surface absorbs during acoustic simulation, clamped to [0, 1]. |

## Properties

### AcousticAbsorption

**Type:** number

A value between `0` and `1` denoting how absorbent the material is to [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]]. When using acoustic simulation, surfaces with higher absorption will result in less reverb than surfaces with lower absorption.

Note that this does not affect the degree to which audio transmits **through** surfaces; for that, see [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Density|Density]].

### Density

**Type:** number

Density is defined as the amount of mass per unit volume. The more dense a part is, the more force it takes to accelerate it. Acceptable range is `0.0001` to `100.0` and values outside this range will be clamped.

When using acoustic simulation, parts with higher density will muffle occluded [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitters]] more.

### Friction

**Type:** number

Friction is defined as the force that opposes the relative lateral motion of two solid surfaces in contact. The greater the friction on a part, the quicker it will decelerate when it rubs against another part with friction. Acceptable range is `0.0` to `2.0` and values outside this range will be clamped.

### Elasticity

**Type:** number

Elasticity refers to a part's tendency to retain energy when colliding with another part. An [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity|Elasticity]] of 1 indicates that the part bounces with the same energy it had before a collision. Acceptable range is `0.0` to `1.0` and values outside this range will be clamped.

### FrictionWeight

**Type:** number

The friction weight of two parts rubbing together creates a ratio used to calculate the actual friction between the two parts. The higher a part's [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#FrictionWeight|FrictionWeight]], the more its [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Friction|Friction]] is used. Acceptable range is `0.0` to `100.0` and values outside this range will be clamped.

### ElasticityWeight

**Type:** number

The elasticity weight of two parts colliding creates a ratio used to calculate the actual elasticity between the two parts. The higher a part's [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#ElasticityWeight|ElasticityWeight]], the more its [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties#Elasticity|Elasticity]] is used. Acceptable range is `0.0` to `100.0` and values outside this range will be clamped.

---
*Source: [PhysicalProperties](https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
