---
title: "Roblox units"
description: "Explore the physical units used in Roblox and how they convert to metric units."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/units"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore the physical units used in Roblox and how they convert to metric units.*

This article outlines Roblox physical units and how they convert to metric units. Understanding units is useful whenever you work with physics, as in the following examples:

- Tuning linear/angular velocities, forces, torques, stiffness, and damping of [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] and [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]].
- Adjusting the density of [[30 Official Roblox Docs/Parts/Materials#Custom materials|custom materials]].

## Unit conversions

### Primary Units

In general, you can use the conversions in the following table to relate Roblox's primary units for time, length, and mass to their metric counterparts.

| Unit | Roblox | Metric |
| --- | --- | --- |
| Time | \$\text\$ | \$\text\$ |
| Length | \$\text\$ | \$\text\$ |
| Mass | \$\text\$* | \$\text\$ |

*\* RMU = Roblox Mass Unit*

### Derived Units

The primary units are used to generate conversions for **derived** units such as water density and air pressure at standard conditions. The following physical properties are expressed in metric units and Roblox units, with primary unit equivalents provided in brackets. All conversions have been rounded to three significant figures.

| Unit | Metric | Roblox |
| --- | --- | --- |
| Water density | \$\text\$ | \$\text\$ |
| Air density (sea level) | \$\text\$ | \$\text\$ |
| 1 atmosphere | \$\text\$ | \$\text\$ |
| Spring stiffness | \$\text\$ | \$\text\$ |
| Spring damping | \$\text\$ | \$\text\$ |
| Velocity | \$\text\$ | \$\text\$ |
| Force | \$\text\$ | \$\text\$ |
| Torque | \$\text\$ | \$\text\$ |

### Gravity

The following table illustrates gravitational acceleration in Roblox units and metric units.

| Behavior | Roblox | Metric |
| --- | --- | --- |
| Roblox default | \$\text\$ | \$\text\$ |
| Realistic (real-world) | \$\text\$ | \$\text\$ |

### Physical Limits

Roblox places limits on certain physical properties, as outlined in the following table. Details on these properties is located in the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] documentation.

| Property | Minimum | Maximum |
| --- | --- | --- |
| Density (\$\text\$) | \$\text\$ | \$\text\$ |
| Friction | \$\text\$ | \$\text\$ |
| Friction weight | \$\text\$ | \$\text\$ |
| Elasticity | \$\text\$ | \$\text\$ |
| Elasticity weight | \$\text\$ | \$\text\$ |

## Unit consistency

Internally, the Roblox physics engine does not use unit conversions. You're free to define your own unit interpretations for studs (length) and RMUs (mass), but these should be used in a consistent manner throughout the game. For example, if you decide that one stud equals one foot (30.483 cm), the unit density of water implies an RMU is equal to 62.4 lbs (28.3 kg):

> \$\text × \text =\$<br>
> \$\text × \text =\$<br>
> \$\text =\$<br>
> \$\text\$

Overall, it's recommended that you use standard Roblox units because it makes a game work as expected in all scenarios, such as compatibility with VR controls.

---
*Source: [Roblox units](https://create.roblox.com/docs/physics/units) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
