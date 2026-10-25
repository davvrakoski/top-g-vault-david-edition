---
title: "Assemblies"
description: "Explains physical assemblies and how they behave in Roblox's rigid body physics engine."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/assemblies"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains physical assemblies and how they behave in Roblox's rigid body physics engine.*

An **assembly** is one or more [[30 Official Roblox Docs/Parts/Parts|parts]] welded by a rigid [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] or connected through movable joints, like [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]]. You can group an assembly of parts in a [[30 Official Roblox Docs/Parts/Models|model]] container to quickly organize the parts and related objects as a single asset.

*(image in the full Top G Vault)*

*1 assembly; 1 part*

*(image in the full Top G Vault)*

*1 assembly; 18 parts*

*(image in the full Top G Vault)*

*1 assembly; 179 parts*

<br>

From a physics perspective, an assembly is considered a single **rigid body**, meaning no force can push or pull the connected parts from each other, and they will move as a single unit. All forces applied to a specific [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] are applied to its assembly — for instance, [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|BasePart:ApplyImpulse()]] applies impulse to the assembly at [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass|BasePart.AssemblyCenterOfMass]].

> [!info]
> The joints that combine multiple parts into assemblies are only active in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or another [[30 Official Roblox Docs/API Reference/Classes/WorldModel|WorldModel]] instance. If the parts are stored elsewhere, all of the welds/connections that combine parts into assemblies will be non-functional.

> [!success]
> To view colored outlines around parts in order to visualize single rigid body assemblies, toggle on **Assemblies** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

## Assembly properties

The following [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] properties show data regarding its assembly. Their values will be the same for any part in the same assembly, so it doesn't matter which part you use.

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity\|BasePart.AssemblyLinearVelocity]] | The linear velocity vector of the part's assembly. Setting the velocity directly may lead to unrealistic motion, so usage of a [[30 Official Roblox Docs/API Reference/Classes/VectorForce\|VectorForce]] or [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity\|LinearVelocity]] constraint is preferred, or [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse\|BasePart:ApplyImpulse()]] for an instantaneous change in linear velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity\|BasePart.AssemblyAngularVelocity]] | The angular velocity vector of the part's assembly. Setting the velocity directly may lead to unrealistic motion, so usage of a [[30 Official Roblox Docs/API Reference/Classes/Torque\|Torque]] or [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity\|AngularVelocity]] constraint is preferred, or [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyAngularImpulse\|BasePart:ApplyAngularImpulse()]] for an instantaneous change in angular velocity. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass\|BasePart.AssemblyCenterOfMass]] | A read-only position calculated via the mass and position of all the parts in the assembly. A force applied to the center of mass will not cause angular acceleration, only linear. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass\|BasePart.AssemblyMass]] | The sum of the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass\|BasePart.Mass]] of all parts in the assembly. If the assembly has an anchored part, the assembly's mass is considered infinite. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart\|BasePart.AssemblyRootPart]] | The part automatically chosen to represent the assembly's [[30 Official Roblox Docs/Physics/Assemblies#Assembly root part\|root part]]. |

## Assembly root part

Every assembly has a **root part** indicated by its [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart|AssemblyRootPart]] property. This is the part that doesn't move when [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] transforms are updated, as well as the part used to keep consistent physics replication and network ownership.

You cannot explicitly set the root part, but the following factors affect probability from highest to lowest:

*(image in the full Top G Vault)*

An [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] part will always be assigned as the root part.

*(image in the full Top G Vault)*

Parts with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Massless|Massless]] set to **false** (default) take precedence.

*(image in the full Top G Vault)*

Higher [[30 Official Roblox Docs/API Reference/Classes/BasePart#RootPriority|RootPriority]] values take precedence.

*(image in the full Top G Vault)*

Precedence based on the part's size (largest face area), with multipliers for specific part types. [[30 Official Roblox Docs/API Reference/Classes/Seat|Seats]] and [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeats]] receive the highest multiplier, followed by parts named **HumanoidRootPart**, then parts named **Torso**.

## Anchoring behavior

When one of an assembly's parts is anchored, that part becomes the root part and all of the other parts become implicitly anchored with it. The following sequence illustrates this behavior.

1. Below, four parts are welded together with [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] (green bars) to form a single assembly, as indicated by the matching colored outlines.

   *(image in the full Top G Vault)*

   *Four parts welded to become a single assembly*

2. If just **one** part in the assembly is anchored, the assembly will not change, other than the root part potentially changing (the anchored part always has the highest [[30 Official Roblox Docs/Physics/Assemblies#Assembly root part|priority]] for becoming the root part).

   *(image in the full Top G Vault)*

   *Anchored part (as indicated with an anchor icon) becomes the new root part*

3. If more than one part is anchored, the assembly will **split**. Below, both the left and top parts are anchored, so the original assembly splits into two assemblies as shown by the colored outlines. Also, the [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] between the two assemblies deactivates, since you cannot have an active weld between two anchored assemblies.

   *(image in the full Top G Vault)*

   *Two assemblies with anchored parts as their respective root parts*

   > [!warning]
   > If you want to anchor all parts in an assembly, you only need to anchor the assembly's root part. Anchoring all parts is actually less performant, as it creates more assemblies.

---
*Source: [Assemblies](https://create.roblox.com/docs/physics/assemblies) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
