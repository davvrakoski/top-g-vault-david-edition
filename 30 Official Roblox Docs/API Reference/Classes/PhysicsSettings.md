---
title: "PhysicsSettings"
description: "Lets you view debugging features in Roblox's physics engine, found under the Physics tab in Studio's settings menu."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Lets you view debugging features in Roblox's physics engine, found under the Physics tab in Studio's settings menu.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The PhysicsSettings is a singleton class, which lets you view debugging features in Roblox's physics engine. You can find it under the Physics tab in Studio's settings menu.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AllowSleep\|AllowSleep]] | boolean | When set to true, physically simulated objects will stop being simulated if they have little to no motion for a set period of time. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreAnchorsShown\|AreAnchorsShown]] | boolean | When set to true, parts that are [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|BasePart.Anchored]] will show a gray surface outline on the surface of the part's bounding box that is currently facing the ground. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreAssembliesShown\|AreAssembliesShown]] | boolean | When set to true, each physics assembly is assigned a unique color and the [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] associated with the assembly are outlined with the color. Parts that are attached together by [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|JointInstance]] will share the same color. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreAssemblyCentersOfMassShown\|AreAssemblyCentersOfMassShown]] | boolean | When set to true, shows the center of mass for each physics assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreAwakePartsHighlighted\|AreAwakePartsHighlighted]] | boolean | When set to true, parts that are actively being physically simulated will have a red outline. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreBodyTypesShown\|AreBodyTypesShown]] | boolean | When set to true, [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] will be outlined with a specific color, depending on the state of its root simulation body. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreCollisionCostsShown\|AreCollisionCostsShown]] | boolean | When set to true, displays collision cost annotations for parts. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreConstraintForcesShownForSelectedOrHoveredInstances\|AreConstraintForcesShownForSelectedOrHoveredInstances]] | boolean | When set to true, draws force vectors for constraints on selected or hovered instances. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreConstraintTorquesShownForSelectedOrHoveredInstances\|AreConstraintTorquesShownForSelectedOrHoveredInstances]] | boolean | When set to true, draws torque vectors for constraints on selected or hovered instances. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreContactForcesShownForSelectedOrHoveredAssemblies\|AreContactForcesShownForSelectedOrHoveredAssemblies]] | boolean | When set to true, draws contact force vectors for selected or hovered assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreContactIslandsShown\|AreContactIslandsShown]] | boolean | When set to true, each contact island will render [[30 Official Roblox Docs/API Reference/Classes/SelectionBox\|SelectionBox]] adorns on the parts in contact islands, where each contact island is assigned a random color. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreContactPointsShown\|AreContactPointsShown]] | boolean | When set to true, sphere adorns will be drawn at the contact points of each part where physics interactions are occurring. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreGravityForcesShownForSelectedOrHoveredAssemblies\|AreGravityForcesShownForSelectedOrHoveredAssemblies]] | boolean | When set to true, draws gravity force vectors for selected or hovered assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreJointCoordinatesShown\|AreJointCoordinatesShown]] | boolean | When set to true, XYZ axes are rendered at the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|BasePart.CFrame]] of every part. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreMagnitudesShownForDrawnForcesAndTorques\|AreMagnitudesShownForDrawnForcesAndTorques]] | boolean | When set to true, displays magnitude labels alongside drawn force and torque vectors. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreMechanismsShown\|AreMechanismsShown]] | boolean | When set to true, every individual mechanism of parts is given a unique color. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreModelCoordsShown\|AreModelCoordsShown]] | boolean | An ancient property that hasn't work correctly since late 2007. It's supposed to render an XYZ axis on the root part of a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]], but the axis rendering component doesn't work correctly. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreNonAnchorsShown\|AreNonAnchorsShown]] | boolean | When set to true, parts that are not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|BasePart.Anchored]] will be highlighted. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreOwnersShown\|AreOwnersShown]] | boolean | When set to true, each player's character is outlined with a unique color, and each part that the player has network ownership over is outlined with the same color. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ArePartCoordsShown\|ArePartCoordsShown]] | boolean | An ancient property that hasn't worked correctly since late 2007. It's supposed to render a large XYZ axis in the center of each [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]], but the axis rendering component doesn't work correctly. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreRegionsShown\|AreRegionsShown]] | boolean | When set to true, a cylinder is drawn around each player's character, representing their [[30 Official Roblox Docs/API Reference/Classes/Player\|Player.SimulationRadius]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreSolverIslandsShown\|AreSolverIslandsShown]] | boolean | When set to true, each solver island is highlighted with a unique color. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreTerrainReplicationRegionsShown\|AreTerrainReplicationRegionsShown]] | boolean | When set to true, shows terrain replication streaming regions. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreTimestepsShown\|AreTimestepsShown]] | boolean | When set to true, shows physics timestep information for assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreUnalignedPartsShown\|AreUnalignedPartsShown]] | boolean | When set to true, parts that aren't aligned on the 1x1x1 grid will be outlined yellow. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#AreWorldCoordsShown\|AreWorldCoordsShown]] | boolean | An ancient property that hasn't worked correctly since late 2007. It's supposed to render a large XYZ axis in the center of the world, but the axis rendering component doesn't work correctly. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#DisableCSGv2\|DisableCSGv2]] | boolean | When set to true, Roblox will fall back to using its legacy CSG solver when performing solid model operations. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#DisableCSGv3ForPlugins\|DisableCSGv3ForPlugins]] | boolean | When set to true, disables CSGv3 for plugin solid modeling operations. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#DrawConstraintsNetForce\|DrawConstraintsNetForce]] | boolean | When set to true, draws the net force from all constraints on selected or hovered assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#DrawContactsNetForce\|DrawContactsNetForce]] | boolean | When set to true, draws the net force from all contacts on selected or hovered assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#DrawTotalNetForce\|DrawTotalNetForce]] | boolean | When set to true, draws the total net force on selected or hovered assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#EnableForceVisualizationSmoothing\|EnableForceVisualizationSmoothing]] | boolean | When set to true, enables temporal smoothing for force and torque visualizations. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#FluidForceDrawScale\|FluidForceDrawScale]] | float | Sets the scale of arrows drawn for aerodynamic force visualization. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ForceCSGv2\|ForceCSGv2]] | boolean | When set to true, forces the use of CSGv2 for solid modeling operations. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ForceDrawScale\|ForceDrawScale]] | float | Sets the scale of arrows drawn for force visualization. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ForceVisualizationSmoothingSteps\|ForceVisualizationSmoothingSteps]] | int | Controls the number of frames used for force visualization smoothing. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#IsInterpolationThrottleShown\|IsInterpolationThrottleShown]] | boolean | When set to true, shows physics interpolation throttle information. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#IsReceiveAgeShown\|IsReceiveAgeShown]] | boolean | This property is supposed to show the [[30 Official Roblox Docs/API Reference/Classes/BasePart#ReceiveAge\|BasePart.ReceiveAge]] of a part, but it does not work correctly. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#IsTreeShown\|IsTreeShown]] | boolean | When set to true, the joint connections of each part, and the states of their underlying primitive components are visualized as a spanning tree. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#PhysicsEnvironmentalThrottle\|PhysicsEnvironmentalThrottle]] | [[30 Official Roblox Docs/API Reference/Enums/EnviromentalPhysicsThrottle\|EnviromentalPhysicsThrottle]] | Controls the throttle rate of Roblox's physics engine. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ShowDecompositionGeometry\|ShowDecompositionGeometry]] | boolean | When set to true, the underlying collision geometry for [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] is rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ShowFluidForcesForSelectedOrHoveredMechanisms\|ShowFluidForcesForSelectedOrHoveredMechanisms]] | boolean | When set to true, enables aerodynamic visualization for selected or hovered mechanisms in Studio's play and run modes. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ShowInstanceNamesForDrawnForcesAndTorques\|ShowInstanceNamesForDrawnForcesAndTorques]] | boolean | When set to true, displays instance names alongside drawn force and torque vectors. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#SolverConvergenceMetricType\|SolverConvergenceMetricType]] | [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceMetricType\|SolverConvergenceMetricType]] | Controls which metric is used for solver convergence visualization. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#SolverConvergenceVisualizationMode\|SolverConvergenceVisualizationMode]] | [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceVisualizationMode\|SolverConvergenceVisualizationMode]] | Controls the visualization mode for solver convergence. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#ThrottleAdjustTime\|ThrottleAdjustTime]] | double | If the [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#PhysicsEnvironmentalThrottle\|PhysicsSettings.PhysicsEnvironmentalThrottle]] is set to `DefaultAuto`, this specifies the maximum time that the physics environmental throttle has to wait before it is allowed to automatically change. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#TorqueDrawScale\|TorqueDrawScale]] | float | Sets the scale of arrows drawn for torque visualization. |
| [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#UseCSGv2\|UseCSGv2]] | boolean | If set to true, version 2 of Roblox's CSG solver will be used instead of version 1. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllowSleep

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

When set to true, physically simulated objects will stop being simulated if they have little to no motion for a set period of time.

### AreAnchorsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, parts that are [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|BasePart.Anchored]] will show a gray surface outline on the surface of the part's bounding box that is currently facing the ground.

### AreAssembliesShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, each physics assembly is assigned a unique color and the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] associated with the assembly are outlined with the color. Parts that are attached together by [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]] will share the same color.

### AreAssemblyCentersOfMassShown

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, shows the center of mass for each physics assembly. This property must be set in the Physics tab of Studio's settings menu.

### AreAwakePartsHighlighted

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, parts that are actively being physically simulated will have a red outline.

### AreBodyTypesShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] will be outlined with a specific color, depending on the state of its root simulation body.

#### Body Types

| Color | Body Type | Description |
| --- | --- | --- |
|  | Real-Time Body | Physics Body that is always simulated in real time, and is never throttled. Used for Humanoids. |
|  | Free-Fall Body | Physics Body that is freely moving with no physical contact. |
|  | Joint Body | Physics Body that is being influenced by a physically simulated joint, such as a Motor or a Hinge. |
|  | Contact Body | Physics Body that is in contact with another physics body. |
|  | Symmetric Contact Body | Physics Body that is experiencing a torquing force, while in contact with another body. |
|  | Vertical Contact Body | Physics Body that is moving very little along the Y plane, while in contact with another body. |

### AreCollisionCostsShown

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, displays collision cost annotations for parts. This property is not scriptable.

### AreConstraintForcesShownForSelectedOrHoveredInstances

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws force vectors for constraints on selected or hovered instances. This property must be set in the Physics tab of Studio's settings menu.

### AreConstraintTorquesShownForSelectedOrHoveredInstances

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws torque vectors for constraints on selected or hovered instances. This property must be set in the Physics tab of Studio's settings menu.

### AreContactForcesShownForSelectedOrHoveredAssemblies

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws contact force vectors for selected or hovered assemblies. This property must be set in the Physics tab of Studio's settings menu.

### AreContactIslandsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, each contact island will render [[30 Official Roblox Docs/API Reference/Classes/SelectionBox|SelectionBox]] adorns on the parts in contact islands, where each contact island is assigned a random color.

### AreContactPointsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, sphere adorns will be drawn at the contact points of each part where physics interactions are occurring. Each sphere also has an arrow drawn in 3D, facing the surface that the contact point is detecting.

#### Solver Variations

The behavior of this property varies depending on whether Roblox's physics engine is using the `PGS Physics Solver`, or the `Spring Physics Solver`.

This is controlled by the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.PGSPhysicsSolverEnabled]] property.

##### Spring Physics Solver

When [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.PGSPhysicsSolverEnabled]] is set to false, the contact points are color coded as listed below. The length of the arrow extruding from the sphere depends on how much force the contact point is exerting, and what the contact type is.

| Color | Contact Type | Description |
| --- | --- | --- |
|  | Normal Contact | Contact point with no special conditions. |
|  | Resting Contact | Contact point that has been active for at least 4 frames. |
|  | Second Pass Contact | Contact point that was made by a kernel joint going through a second pass. Rarely seen. |
|  | Real-Time Contact | Contact point that was made with a real-time physics body. This applies to tripped [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
|  | Joint Contact | Contact point that was made under the context of a physically simulated joint. This applies to Motors and Hinges. |

**PGS Physics Solver**

When [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.PGSPhysicsSolverEnabled]] is set to true, the contact points are always colored **RED**, and the length of the arrow will always be 1 stud. There are no special conditions tracked, because the PGS solver does not keep specific lookup tables for the states listed in the Spring Solver.

| Color | Contact Type | Description |
| --- | --- | --- |
|  | Normal Contact | Contact point with no special conditions. |

### AreGravityForcesShownForSelectedOrHoveredAssemblies

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws gravity force vectors for selected or hovered assemblies. This property must be set in the Physics tab of Studio's settings menu.

### AreJointCoordinatesShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, XYZ axes are rendered at the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]] of every part.

### AreMagnitudesShownForDrawnForcesAndTorques

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, displays magnitude labels alongside drawn force and torque vectors. This property must be set in the Physics tab of Studio's settings menu.

### AreMechanismsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, every individual mechanism of parts is given a unique color.

### AreModelCoordsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

An ancient property that hasn't work correctly since late 2007. It's supposed to render an XYZ axis on the root part of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], but the axis rendering component doesn't work correctly.

### AreNonAnchorsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, parts that are not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|BasePart.Anchored]] will be highlighted. This property must be set in the Physics tab of Studio's settings menu.

### AreOwnersShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, each player's character is outlined with a unique color, and each part that the player has network ownership over is outlined with the same color.

### ArePartCoordsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

An ancient property that hasn't worked correctly since late 2007. It's supposed to render a large XYZ axis in the center of each [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], but the axis rendering component doesn't work correctly.

### AreRegionsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, a cylinder is drawn around each player's character, representing their [[30 Official Roblox Docs/API Reference/Classes/Player|Player.SimulationRadius]]. Each physically simulated object will check to see which player is closest to that object, and if they are within the player's simulation radius. If both conditions are met, that player will becomes the network owner of that object.

### AreSolverIslandsShown

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, each solver island is highlighted with a unique color. This property must be set in the Physics tab of Studio's settings menu.

### AreTerrainReplicationRegionsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, shows terrain replication streaming regions. This property is not scriptable.

### AreTimestepsShown

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, shows physics timestep information for assemblies. This property is not scriptable.

### AreUnalignedPartsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, parts that aren't aligned on the 1x1x1 grid will be outlined yellow.

### AreWorldCoordsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

An ancient property that hasn't worked correctly since late 2007. It's supposed to render a large XYZ axis in the center of the world, but the axis rendering component doesn't work correctly.

### DisableCSGv2

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, Roblox will fall back to using its legacy CSG solver when performing solid model operations.

### DisableCSGv3ForPlugins

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, disables CSGv3 for plugin solid modeling operations. This property must be set in the Physics tab of Studio's settings menu.

### DrawConstraintsNetForce

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws the net force from all constraints on selected or hovered assemblies. This property must be set in the Physics tab of Studio's settings menu.

### DrawContactsNetForce

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws the net force from all contacts on selected or hovered assemblies. This property must be set in the Physics tab of Studio's settings menu.

### DrawTotalNetForce

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, draws the total net force on selected or hovered assemblies. This property must be set in the Physics tab of Studio's settings menu.

### EnableForceVisualizationSmoothing

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, enables temporal smoothing for force and torque visualizations. This property must be set in the Physics tab of Studio's settings menu.

### FluidForceDrawScale

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Sets the scale of arrows drawn for aerodynamic force visualization. The default value is 1.0; smaller values draw smaller arrows and vice versa. The default value is a good starting point for a wide range of aerodynamic mechanisms.

### ForceCSGv2

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `NotReplicated`

When set to true, forces the use of CSGv2 for solid modeling operations. This property must be set in the Physics tab of Studio's settings menu.

### ForceDrawScale

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Sets the scale of arrows drawn for force visualization. This property is not scriptable.

### ForceVisualizationSmoothingSteps

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Controls the number of frames used for force visualization smoothing. This property must be set in the Physics tab of Studio's settings menu.

### IsInterpolationThrottleShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, shows physics interpolation throttle information. This property is not scriptable.

### IsReceiveAgeShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

This property is supposed to show the [[30 Official Roblox Docs/API Reference/Classes/BasePart#ReceiveAge|BasePart.ReceiveAge]] of a part, but it does not work correctly.

### IsTreeShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, the joint connections of each part, and the states of their underlying primitive components are visualized as a spanning tree.

##### Spanning Tree Table

There are several visualizations made available when this property is set to true:

| Color | Adorn Type | Description |
| --- | --- | --- |
|  | Box | Root Primitive of a Mechanism that is currently anchored, or connected to an anchored primitive. See [[30 Official Roblox Docs/API Reference/Classes/BasePart#IsGrounded\|BasePart:IsGrounded()]]. |
|  | Box | Root Primitive of a Mechanism that is free to be physically simulated. |
|  | Box | Root Primitive of a Mechanism that has moving components. |
|  | Sphere | Root Primitive of an Assembly. |
|  | Line | Connection between two Primitives that share the same Assembly. |
|  | Line | Connection between two Primitives. |

### PhysicsEnvironmentalThrottle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/EnviromentalPhysicsThrottle|EnviromentalPhysicsThrottle]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

Controls the throttle rate of Roblox's physics engine. By default, the physics engine will adjust the physics environment throttle depending on how much work the physics engine is doing, and the current framerate. See the enum page for [[30 Official Roblox Docs/API Reference/Enums/EnviromentalPhysicsThrottle|Enum.EnviromentalPhysicsThrottle]] for more information.

### ShowDecompositionGeometry

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, the underlying collision geometry for [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is rendered.

### ShowFluidForcesForSelectedOrHoveredMechanisms

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, enables aerodynamic visualization for selected or hovered mechanisms in Studio's play and run modes. This visualization shows aerodynamic force, torque, and center of pressure for the hovered or selected mechanisms.

### ShowInstanceNamesForDrawnForcesAndTorques

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

When set to true, displays instance names alongside drawn force and torque vectors. This property must be set in the Physics tab of Studio's settings menu.

### SolverConvergenceMetricType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceMetricType|SolverConvergenceMetricType]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Controls which metric is used for solver convergence visualization. This property is not scriptable.

### SolverConvergenceVisualizationMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceVisualizationMode|SolverConvergenceVisualizationMode]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Controls the visualization mode for solver convergence. This property is not scriptable.

### ThrottleAdjustTime

**Type:** double

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** true/true

If the [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#PhysicsEnvironmentalThrottle|PhysicsSettings.PhysicsEnvironmentalThrottle]] is set to `DefaultAuto`, this specifies the maximum time that the physics environmental throttle has to wait before it is allowed to automatically change.

### TorqueDrawScale

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

Sets the scale of arrows drawn for torque visualization. This property is not scriptable.

### UseCSGv2

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Display · **Loaded/Saved:** true/true

If set to true, version 2 of Roblox's CSG solver will be used instead of version 1.

---
*Source: [PhysicsSettings](https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
