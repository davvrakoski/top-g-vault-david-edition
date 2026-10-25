---
title: "Explosion"
description: "Applies force to `BaseParts` within the explosion's `Explosion.BlastRadius`. Breaks `JointInstances` and `WeldConstraints` between parts and kills `Humanoid` characters not protected by a `ForceField`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Explosion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Applies force to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the explosion's [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]]. Breaks [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstances]] and [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] between parts and kills [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] characters not protected by a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An Explosion applies force to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the explosion's [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|BlastRadius]]. This force breaks [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstances]] and [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] between parts and kills [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] characters not protected by a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]]. [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] will not be broken by an explosion.

If an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] is parented anywhere in the data model while the experience is running, it immediately sets off and, within a few seconds, it becomes unparented. It is not destroyed with [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] in this case, so connections do not get disconnected and the parent is not locked. As with all instances, keeping a strong reference an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] will prevent it from being garbage collected.

Note that an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] must be a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] for the explosion visuals to play and the physical/damaging effects to have an impact.

#### Explosion Effects

[[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] are killed by explosions, as the explosion breaks the character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] neck joint. Parenting a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] to a model will protect all of its children from the explosion kill effect.

If you do not want joints between [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] to be broken, or you want to implement your own formula for damaging [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]], it's recommended that you set [[30 Official Roblox Docs/API Reference/Classes/Explosion#DestroyJointRadiusPercent|DestroyJointRadiusPercent]] to 0 and use the [[30 Official Roblox Docs/API Reference/Classes/Explosion#Hit|Hit]] event to handle the result of the explosion.

Explosions can also be configured to damage [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], creating craters, as configured through the [[30 Official Roblox Docs/API Reference/Classes/Explosion#ExplosionType|ExplosionType]] property.

Note that the effect of an explosion is **not** disrupted by obstacles, meaning that parts/terrain shielded behind other parts/terrain will still be affected.

*Code samples for this API (`Explosion-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Explosion); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastPressure\|BlastPressure]] | float | Used to determine the amount of force applied to [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] caught in the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius\|Explosion.BlastRadius]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius\|BlastRadius]] | float | This property determines the radius of the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]], in studs. This radius determines the area of effect of the explosion, not the size of the explosion's visuals. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#DestroyJointRadiusPercent\|DestroyJointRadiusPercent]] | float | Used to set the proportion of the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius\|Explosion.BlastRadius]], between 0 and 1, within which all joints will be destroyed. Anything outside of this range will only have the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] force applied to it. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#ExplosionType\|ExplosionType]] | [[30 Official Roblox Docs/API Reference/Enums/ExplosionType\|ExplosionType]] | This property determines how the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] will interact with [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]]. Used to set if explosions will cause damage to the terrain or not. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | A multiplier for the transparency of the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] visual effect that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | This property is the position of the center of the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]]. It is defined in world-space and not influenced by the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#TimeScale\|TimeScale]] | float | Value between 0 and 1 that controls the speed of the particle effect. |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#Visible\|Visible]] | boolean | This property determines whether or not the visual effect of an [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] is shown or not. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Explosion#Hit\|Hit]] | `part`, `distance` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]] hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] within its [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius\|Explosion.BlastRadius]]. Returns the part hit along with the distance of the part from [[30 Official Roblox Docs/API Reference/Classes/Explosion#Position\|Explosion.Position]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BlastPressure

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Used to determine the amount of force applied to [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] caught in the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]].

Currently this level of force applied does not vary based on distance from [[30 Official Roblox Docs/API Reference/Classes/Explosion#Position|Explosion.Position]]. Unanchored `BaseParts` will accelerate equally away from the origin regardless of distance provided they are within the blast radius.

The blast pressure determines the acceleration of parts due to an explosion. It does not determine the degree to which joints are broken. When [[30 Official Roblox Docs/API Reference/Classes/Explosion#DestroyJointRadiusPercent|Explosion.DestroyJointRadiusPercent]] is equal to 1 all joints between parts in the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]] will be destroyed provided BlastPressure is greater than 0.

The BlastPressure also does not determine the amount of damage given to [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]. Provided BlastPressure is greater than 0 and [[30 Official Roblox Docs/API Reference/Classes/Explosion#ExplosionType|Explosion.ExplosionType]] isn't set to Enum.ExplosionType.NoCraters the size of the crater created is determined exclusively by the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]].

Setting BlastPressure to 0 eliminates the effect of the explosion and is useful when developers want to program their own custom behavior for explosions using the [[30 Official Roblox Docs/API Reference/Classes/Explosion#Hit|Explosion.Hit]] event.

*Code samples for this member (`Custom-Explosion`) are published on the source page; their code is not part of the open-source repo.*

### BlastRadius

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property determines the radius of the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]], in studs. This property accepts any value between 0 and 100.

This radius determines the area of effect of the Explosion, not the size of the Explosion's visuals. The size of the Explosion's visual effect is the same regardless of BlastRadius (even if BlastRadius is 0).

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the BlastRadius will be affected by the explosion. Meaning, if [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastPressure|Explosion.BlastPressure]] is greater than 0, force will be applied to parts. The degree to which joints are broken within the BlastRadius depends on [[30 Official Roblox Docs/API Reference/Classes/Explosion#DestroyJointRadiusPercent|Explosion.DestroyJointRadiusPercent]]. [[30 Official Roblox Docs/API Reference/Classes/Explosion#Hit|Explosion.Hit]] will fire for any every [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the radius.

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are considered within [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]] even if they are only partially in range.

*Code samples for this member (`Explosion-Instantiation`) are published on the source page; their code is not part of the open-source repo.*

### DestroyJointRadiusPercent

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Used to set the proportion of the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]], between 0 and 1, within which all joints will be destroyed. Anything outside of this range will only have the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] force applied to it.

For example, if [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]] is set to 100 and DestroyJointRadiusPercent is set to 0.5, any joints within a radius of 50 studs would be broken. Any joints between the ranges of 50 and 100 studs wouldn't be destroyed, but the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] force would still be applied to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]].

This property allows developers to make [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosions]] 'non-lethal' to [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] by setting DestroyJointRadiusPercent to 0. This means the neck joint will not be broken when characters come into contact with the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]].

*Code samples for this member (`Explosion-DestroyJointRadiusPercent`, `Custom-Explosion`) are published on the source page; their code is not part of the open-source repo.*

### ExplosionType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ExplosionType|ExplosionType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property determines how the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] will interact with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]. It is an Enum.ExplosionType value and can be set to one of three options.

- **NoCraters** - Explosions will not damage Terrain
- **Craters** - Explosions will create craters in Terrain
- **CratersAndDebris** - Redundant, behaves the same as Craters

If ExplosionType is set to create craters in [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], the radius of the crater will be roughly equal to the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]]. Craters are created in all [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] materials other than water. The size of the crater is not influenced by the material, although some materials create rougher edges than others.

*Code samples for this member (`Explosion-ExplosionType`) are published on the source page; their code is not part of the open-source repo.*

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior · **Tags:** `Hidden`, `NotReplicated`

A client-local multiplier for the transparency of the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] visual effect. It does not replicate from client to server and is useful when the explosion visual should appear differently for a specific client.

A value of `0`, the default, has no effect on the explosion's appearance, while a value of `1` makes the visual effect completely invisible to the local client. Values are clamped between `0` and `1`.

This property does not alter the explosion's physical or damaging effects. To hide the visual effect for all clients while retaining force and damage, set [[30 Official Roblox Docs/API Reference/Classes/Explosion#Visible|Visible]] to `false` instead.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property is the position of the center of the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]]. It is defined in world-space and not influenced by the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] parent.

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] will be influenced by the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] if they are within [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]] studs of the explosion's position.

The effect of an explosion is instantaneous. This means that although the position of an explosion can be changed after it has been set it cannot affect two different areas. Once an explosion has been 'detonated', shortly after parenting it to a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], it will not do so again. In some cases the visual effect of the explosion will move but it will have no effect.

For this reason a new Explosion should be created if the developer wants an explosion to appear at a different position.

*Code samples for this member (`Explosion-Instantiation`) are published on the source page; their code is not part of the open-source repo.*

### TimeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

A value between 0 and 1 that controls the speed of the particle effect. At 1 it runs at normal speed, at 0.5 it runs at half speed, and at 0 it freezes time.

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property determines whether or not the visual effect of an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] is shown or not.

When Visible is set to false, the explosion will still affect [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in its [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]], the only difference is it will not be seen.

One use for this property would be for a developer to make their own custom explosion effects using a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]], while retaining the default [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] functionality.

*Code samples for this member (`Explosion-Visible`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Hit

```lua
Explosion.Hit(part: BasePart, distance: float)
```

**Capabilities:** AvatarBehavior

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within its [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|Explosion.BlastRadius]]. Returns the part hit along with the distance of the part from [[30 Official Roblox Docs/API Reference/Classes/Explosion#Position|Explosion.Position]].

Note that the effect of an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]] is not disrupted by obstacles, this means parts shielded behind other parts will still be hit, even if the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] they are shielded behind is anchored.

This event will also fire when [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastPressure|Explosion.BlastPressure]] is equal to zero. This means developers can program their own custom behavior for explosions by eliminating the explosion's influence on [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

Note that this event will fire for every [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] hit. This means it can fire multiple times for the same player character (as the character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is made up of multiple parts). For this reason when dealing custom damage using the [[30 Official Roblox Docs/API Reference/Classes/Explosion#Hit|Explosion.Hit]] event it's recommended to implement a check to see if the character has already been hit by the [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] hit by the [[30 Official Roblox Docs/API Reference/Classes/Explosion\|Explosion]]. |
| `distance` | float |  | The distance of the hit from [[30 Official Roblox Docs/API Reference/Classes/Explosion#Position\|Explosion.Position]]. |

*Code samples for this member (`Custom-Explosion`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Explosion](https://create.roblox.com/docs/reference/engine/classes/Explosion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
