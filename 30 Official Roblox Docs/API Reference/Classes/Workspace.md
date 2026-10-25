---
title: "Workspace"
description: "`Workspace` houses 3D objects which are rendered to the 3D world. Objects not descending from it will not be rendered or physically interact with the world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Workspace"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`Workspace` houses 3D objects which are rendered to the 3D world. Objects not descending from it will not be rendered or physically interact with the world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] → [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`, `Service`

## Description

The core job of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] is to hold objects that exist in the 3D world, effectively [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]]. While such objects are descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], they will be active. For [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], this means they will be rendered, and physically interact with other parts and the world. For [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], this means that objects adorned to them, such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitters]], [[30 Official Roblox Docs/API Reference/Classes/Beam|Beams]], and [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGuis]], will render.

Understanding this behavior is important, as it means objects can be removed from [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] when they are not needed. For example, map [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] can be removed when a different map is being played on. Objects that are not immediately needed in the 3D world are generally stored in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] or [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].

In its role as the holder of active 3D objects, [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] includes a number of useful functions related to parts, their positions, and joints between them.

#### Accessing the Workspace

[[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] can be accessed several ways, all of which are valid.

- `workspace`
- `game:GetService("Workspace")`
- `game.Workspace`

#### Notes

- Objects that require adornment, such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitters]] and [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGuis]], will be at the

  `(0, 0, 0)`

 position when parented to
  [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] without an adornee otherwise being set.
- The [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints|Model:MakeJoints()]] and [[30 Official Roblox Docs/API Reference/Classes/Model#BreakJoints|Model:BreakJoints()]] methods inherited from the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] class are overridden by [[30 Official Roblox Docs/API Reference/Classes/Workspace#MakeJoints|Workspace:MakeJoints()]] and [[30 Official Roblox Docs/API Reference/Classes/Workspace#BreakJoints|Workspace:BreakJoints()]] which can only be used in plugins.
- It is impossible to delete [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].
- [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] automatically cleans up [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that fall beneath [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight|FallenPartsDestroyHeight]].
- A client's current [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object can be accessed using the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] property.
- The [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object can be accessed using the [[30 Official Roblox Docs/API Reference/Classes/Workspace#Terrain|Workspace.Terrain]] property.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#AirDensity\|AirDensity]] | float | The air density at ground level, used in the aerodynamic force model. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#AirTurbulenceIntensity\|AirTurbulenceIntensity]] | float | Controls the strength of turbulence present in the wind velocity field, affecting the aerodynamic force model. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#AllowThirdPartySales\|AllowThirdPartySales]] | boolean | Determines whether assets created by other users can be sold in the game. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode\|AuthorityMode]] | [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode\|AuthorityMode]] | Sets the server authority mode. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#AvatarUnificationMode\|AvatarUnificationMode]] | [[30 Official Roblox Docs/API Reference/Enums/AvatarUnificationMode\|AvatarUnificationMode]] | Enables the R6 to R15 adapter, allowing R15 avatars to join R6 experiences. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ClientAnimatorThrottling\|ClientAnimatorThrottling]] | [[30 Official Roblox Docs/API Reference/Enums/ClientAnimatorThrottlingMode\|ClientAnimatorThrottlingMode]] | Specifies the animation throttling mode for the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|CurrentCamera]] | [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] | The [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] object being used by the local player. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime\|DistributedGameTime]] | double | The amount of time, in seconds, that the game has been running. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars\|EnableSLIMAvatars]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether SLIM rendering is used for avatars in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight\|FallenPartsDestroyHeight]] | float | Determines the height at which falling [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] and their ancestor [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] are removed from [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallHeightEnabled\|FallHeightEnabled]] | boolean | Controls whether parts that fall below [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight\|Workspace.FallenPartsDestroyHeight]] are automatically destroyed. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#FilteringEnabled\|FilteringEnabled]] | boolean | **Deprecated.** Determines whether changes made from the client will replicate to the server or not. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#FluidForces\|FluidForces]] | [[30 Official Roblox Docs/API Reference/Enums/FluidForces\|FluidForces]] | Determines whether the physics engine computes aerodynamic forces on [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] whose [[30 Official Roblox Docs/API Reference/Classes/BasePart#EnableFluidForces\|EnableFluidForces]] property is true. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind\|GlobalWind]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Specifies the global wind vector for animated terrain grass, dynamic clouds, and particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#Gravity\|Gravity]] | float | Determines the acceleration due to gravity applied to falling [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#IKControlConstraintSupport\|IKControlConstraintSupport]] | [[30 Official Roblox Docs/API Reference/Enums/IKControlConstraintSupport\|IKControlConstraintSupport]] | Enables support for constraints for IKControls. If disabled, IKControls ignore physics constraints. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ImprovedAnimationConstraint\|ImprovedAnimationConstraint]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether improved behavior is enabled for [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint\|AnimationConstraints]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ImprovedPhysicsReplication\|ImprovedPhysicsReplication]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether the experience uses the improved physics replication path between the server and clients. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#InsertPoint\|InsertPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The world position at which new objects are placed when inserted from the toolbox. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#InterpolationThrottling\|InterpolationThrottling]] | [[30 Official Roblox Docs/API Reference/Enums/InterpolationThrottlingMode\|InterpolationThrottlingMode]] | **Deprecated.** Deprecated setting that configured the interpolation throttling mode; it no longer takes effect. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#LayeredClothingCacheOptimizations\|LayeredClothingCacheOptimizations]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether layered clothing cache optimizations are enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#LuauTypeCheckMode\|LuauTypeCheckMode]] | [[30 Official Roblox Docs/API Reference/Enums/LuauTypeCheckMode\|LuauTypeCheckMode]] | Sets the Luau type checking mode for scripts in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories\|MeshPartHeadsAndAccessories]] | [[30 Official Roblox Docs/API Reference/Enums/MeshPartHeadsAndAccessories\|MeshPartHeadsAndAccessories]] | Sets whether character Heads and Accessories should be downloaded as MeshParts. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshStreamingAndImprovedLods\|MeshStreamingAndImprovedLods]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether the experience uses the new mesh streaming and improved LOD system. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior\|ModelStreamingBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior\|ModelStreamingBehavior]] | Controls how [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] are replicated in experiences when instance streaming is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#NextGenerationReplication\|NextGenerationReplication]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | When `true`, enables an alternate replication system that alters and improves how properties are replicated under the hood. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#NextGenerationReplicationAlias\|NextGenerationReplicationAlias]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PathfindingUseImprovedSearch\|PathfindingUseImprovedSearch]] | [[30 Official Roblox Docs/API Reference/Enums/PathfindingUseImprovedSearch\|PathfindingUseImprovedSearch]] | Controls whether an improved search algorithm is used by [[30 Official Roblox Docs/API Reference/Classes/PathfindingService\|PathfindingService]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PhysicsSteppingMethod\|PhysicsSteppingMethod]] | [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod\|PhysicsSteppingMethod]] | Sets how the solver will advance the physics simulation forward in time. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerCharacterDestroyBehavior\|PlayerCharacterDestroyBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/PlayerCharacterDestroyBehavior\|PlayerCharacterDestroyBehavior]] | Controls whether the engine automatically calls `Destroy()` on a player's character when it is replaced and on the `Player` object when the player leaves. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystem\|PlayerScriptsUseInputActionSystem]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether the built-in player scripts are updated to use the Input Action System. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystemAlias\|PlayerScriptsUseInputActionSystemAlias]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode\|PredictiveStreamingMode]] | [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode\|PredictiveStreamingMode]] | Controls whether the engine can make predictive streaming decisions. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PrimalPhysicsSolver\|PrimalPhysicsSolver]] | [[30 Official Roblox Docs/API Reference/Enums/PrimalPhysicsSolver\|PrimalPhysicsSolver]] | Controls whether the experimental Primal Physics Solver is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#RejectCharacterDeletions\|RejectCharacterDeletions]] | [[30 Official Roblox Docs/API Reference/Enums/RejectCharacterDeletions\|RejectCharacterDeletions]] | Controls whether the server rejects attempts by clients to delete player characters from the workspace. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#RenderingCacheOptimizations\|RenderingCacheOptimizations]] | [[30 Official Roblox Docs/API Reference/Enums/RenderingCacheOptimizationMode\|RenderingCacheOptimizationMode]] | Controls whether rendering cache optimizations are enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ReplicateInstanceDestroySetting\|ReplicateInstanceDestroySetting]] | [[30 Official Roblox Docs/API Reference/Enums/ReplicateInstanceDestroySetting\|ReplicateInstanceDestroySetting]] | Controls how `Instance:Destroy()` calls are replicated from the server to clients. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#Retargeting\|Retargeting]] | [[30 Official Roblox Docs/API Reference/Enums/AnimatorRetargetingMode\|AnimatorRetargetingMode]] | Controls whether animation retargeting is enabled for character animations. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#SandboxedInstanceMode\|SandboxedInstanceMode]] | [[30 Official Roblox Docs/API Reference/Enums/SandboxedInstanceMode\|SandboxedInstanceMode]] | Controls whether sandboxed instance mode (script capabilities) is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#SignalBehavior\|SignalBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior\|SignalBehavior]] | Configures when the engine resumes event handlers. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#SignalBehaviorAlias\|SignalBehaviorAlias]] | [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior\|SignalBehavior]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled\|StreamingEnabled]] | boolean | Whether content streaming is enabled for the place. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabledAlias\|StreamingEnabledAlias]] | boolean |  |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode\|StreamingIntegrityMode]] | [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode\|StreamingIntegrityMode]] | Determines whether streaming integrity mode is active. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius\|StreamingMinRadius]] | int | Minimum distance that content will be streamed to players with high priority. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] | int | Maximum distance that content will be streamed to players. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamOutBehavior\|StreamOutBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|StreamOutBehavior]] | Configures how the engine decides when to stream content away from players. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#Terrain\|Terrain]] | [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] object parented to the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#TouchesUseCollisionGroups\|TouchesUseCollisionGroups]] | boolean | Determines whether [[30 Official Roblox Docs/API Reference/Classes/BasePart\|parts]] in different groups set to not collide will ignore collisions and touch events. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#UseFixedSimulation\|UseFixedSimulation]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | When `true`, enables [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation\|RunService:BindToSimulation()]] which calls a function at a fixed frequency, updates physics stepping logic, and makes the [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#time\|time()]] function return the fixed stepped frame time. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#UseFixedSimulationAlias\|UseFixedSimulationAlias]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#UseNewLuauTypeSolver\|UseNewLuauTypeSolver]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether the new Luau type solver is used for type inference. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ApplyRecommendedStreamingSettings\|ApplyRecommendedStreamingSettings()]] | boolean | Applies Roblox's recommended instance streaming settings to the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#BreakJoints\|BreakJoints()]] | () | **Deprecated.** Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] given, breaking any joints connected to these parts. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#GetNumAwakeParts\|GetNumAwakeParts()]] | int | Returns the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] that are deemed physically active, due to being recently under the influence of physics. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#GetPhysicsThrottling\|GetPhysicsThrottling()]] | int | Returns an integer, between 0 and 100, representing the percentage of real time that physics simulation is currently being throttled to. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#GetRealPhysicsFPS\|GetRealPhysicsFPS()]] | double | Returns the number of frames per second that physics is currently being simulated at. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#GetServerTimeNow\|GetServerTimeNow()]] | double | Returns the server's Unix time in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#JoinToOutsiders\|JoinToOutsiders()]] | () | Creates joints between the specified [[30 Official Roblox Docs/API Reference/Classes/BasePart\|Parts]] and any touching parts depending on the parts' surfaces and the specified joint creation mode. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#MakeJoints\|MakeJoints()]] | () | **Deprecated.** Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] given. If any part's side has a [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|Enum.SurfaceType]] that can make a joint it will create a joint with any adjacent parts. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PGSIsEnabled\|PGSIsEnabled()]] | boolean | Returns `true` if the game has the PGS Physics solver enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#UnjoinFromOutsiders\|UnjoinFromOutsiders()]] | () | Breaks all joints between the specified [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] and other [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ZoomToExtents\|ZoomToExtents()]] | () | Positions and zooms the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|Workspace.CurrentCamera]] to show the extent of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] currently in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PersistentLoaded\|PersistentLoaded]] | `player` | Fires when persistent models have been sent to the specified player. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AirDensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** AirProperties · **Loaded/Saved:** true/true · **Capabilities:** Physics, Environment

The ground level (**Y** of 0) air density in RMU/stud³ units (see [[30 Official Roblox Docs/Physics/Roblox units|Roblox Units]]), used to calculate the aerodynamic force if [[30 Official Roblox Docs/API Reference/Classes/Workspace#FluidForces|Workspace.FluidForces]] is [[30 Official Roblox Docs/API Reference/Enums/FluidForces|Experimental]]. The default corresponds to realistic sea level air density at standard temperature and pressure. Air density decays as the **Y** altitude increases, reaching 5% of its ground level value at 100,000 studs. Below **Y** of 0, the air density is fixed at the input value.

### AirTurbulenceIntensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** AirProperties · **Loaded/Saved:** true/true · **Capabilities:** Physics, Environment

Controls the intensity of turbulence by determining the magnitude of fluctuations in wind velocities. Ranges from `0` to `1`, with a value of `0` disabling turbulence and a value of `1` providing the most intense turbulence. The values of `AirTurbulenceIntensity` roughly correspond to the following levels:

- `(0, 0.4]`: Low intensity turbulence
- `(0.4, 0.7]`: Moderate intensity turbulence
- `(0.7, 1]`: High intensity turbulence

The magnitude of the fluctuations at a fixed intensity scale linearly with the magnitude of the global wind, except in the case that the global wind is zero. When the global wind is zero, the magnitude of the fluctuations scale exponentially with `AirTurbulenceIntensity`, allowing low and high intensity turbulence to exist with wind velocities that still average out to zero.

### AllowThirdPartySales

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Monetization · **Tags:** `NotReplicated`

This [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] property determines whether assets created by other uses can be sold in the game.

### AuthorityMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|AuthorityMode]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** true/true

Sets the server authority mode. See [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode]] for options.

### AvatarUnificationMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AvatarUnificationMode|AvatarUnificationMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When [[30 Official Roblox Docs/API Reference/Enums/AvatarUnificationMode|Enum.AvatarUnificationMode.Enabled]], R15 avatars can join R6 experiences via the R6 to R15 adapter. R15 characters receive invisible adapter parts with R6-compatible names welded to their corresponding R15 parts, preserving R6-like scale and movement while enabling R15 features such as layered clothing and animatable heads. Only relevant when the experience's avatar type is set to R6.

### ClientAnimatorThrottling

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ClientAnimatorThrottlingMode|ClientAnimatorThrottlingMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

Specifies the [[30 Official Roblox Docs/API Reference/Enums/ClientAnimatorThrottlingMode|Enum.ClientAnimatorThrottlingMode]] to use for the local client.

When enabled, animations on remotely-simulated [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instances will begin to throttle. The throttler calculates throttling intensity using:

- Visibility of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] in relation to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]
- In-game FPS
- Number of active animations

### CurrentCamera

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object being used by the local player.

#### How to use CurrentCamera

When looking for a client's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object, use this property rather than looking for a child of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] named "Camera".

When you set this property, all other `Camera` objects in the `Workspace` are destroyed, including the previous `CurrentCamera`. If you set this property to `nil` or to a camera that is not a descendant of the Workspace (or the `CurrentCamera` is otherwise destroyed), a new `Camera` will be created and assigned. Avoid these scenarios, as destroying the camera can have unintended consequences.

For more information, see [[30 Official Roblox Docs/Workspace/Camera/Customize the camera#Script the camera|Script the camera]].

### DistributedGameTime

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `NotReplicated`

The amount of time, in seconds, that the game has been running.

Despite the title, this value is currently not 'Distributed' across the client and the server. Instead, on the server it represents how long the server has been running. On the client, it represents how long the client has been connected to the server.

Developers should not rely on the above behavior, and it is possible this property will be synchronized across clients and the server in the future.

Those looking for the time since the program started running should use the 'time' function instead. See below for a comparison between DistributedGameTime and its alternatives.

*Code samples for this member (`Workspace-DistributedGameTime`) are published on the source page; their code is not part of the open-source repo.*

### EnableSLIMAvatars

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `NotScriptable`

This [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState]] property controls whether a [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] model is generated for avatar characters in the experience. When enabled and instance streaming is active, avatars render using SLIM in the same way that setting [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|Model.LevelOfDetail]] to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] works for other models.

When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]], avatars use SLIM rendering. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Disabled]], avatars use the traditional rendering approach. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the current engine-wide rollout state.

This property cannot be set through developer-facing Luau and must be set in Studio through the Properties window, Command Bar, or a plugin.

### FallenPartsDestroyHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the height at which the engine automatically removes falling [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and their ancestor [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] from [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] by parenting them to `nil`. This is to prevent parts that have fallen off the map from continuing to fall forever.

If a part removed due to this behavior is the last part in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], that model will also be removed. This applies to all model ancestors of the part.

This property is clamped between -50,000 and 50,000 because [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] do not simulate or render properly at a great distance from the origin due to floating point inaccuracies.

This property can be read by scripts, but can only be set by plugins, the command bar, or the properties window in Studio.

### FallHeightEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic

When `false`, the kill plane defined by [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight|Workspace.FallenPartsDestroyHeight]] is disabled and falling parts are not automatically removed. Defaults to `true`.

This property can be read by scripts but can only be set by plugins, the command bar, or the properties window in Studio.

### FilteringEnabled

> [!warning] Deprecated
> This property is discontinued.

**Type:** boolean

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

This property is discontinued and no longer takes effect.

### FluidForces

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FluidForces|FluidForces]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

With this property enabled, the physics engine computes aerodynamic forces on [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] whose [[30 Official Roblox Docs/API Reference/Classes/BasePart#EnableFluidForces|EnableFluidForces]] property is true. The default, [[30 Official Roblox Docs/API Reference/Enums/FluidForces|Default]], disables aerodynamic forces. Note that this property cannot be set through developer-facing Luau and instead must be toggled in Studio.

### GlobalWind

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** AirProperties · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property specifies the direction and strength that wind blows through the experience, affecting terrain grass, dynamic clouds, and particles. See the [[30 Official Roblox Docs/Environment/Global wind|Global Wind]] article for details.

### Gravity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the acceleration due to gravity applied to falling [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]]. This value is measured in studs per second squared and by default is set to 196.2 studs/second<sup>2</sup>. By changing this value, developers can simulate the effects of lower or higher gravity in game.

*Code samples for this member (`Low-Gravity-Button`) are published on the source page; their code is not part of the open-source repo.*

### IKControlConstraintSupport

**Type:** [[30 Official Roblox Docs/API Reference/Enums/IKControlConstraintSupport|IKControlConstraintSupport]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

Enables support for constraints for IKControls. The `Default` value is the same as `Enabled`. If disabled, IKControls ignore physics constraints. See [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] for additional details.

### ImprovedAnimationConstraint

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When enabled, [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraints]] use separate strength and damping settings for linear and angular motion. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the default for this feature.

### ImprovedPhysicsReplication

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When enabled, the experience uses the improved physics replication path. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the default for this feature.

### InsertPoint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Stores the world-space position used when inserting new objects into the workspace via the Studio IDE.

### InterpolationThrottling

> [!warning] Deprecated
> This property should not be used for new work.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InterpolationThrottlingMode|InterpolationThrottlingMode]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Physics · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

This property has `Physics` read security and `Plugin` write security. It is hidden in the Studio Properties window. Do not use it for new work.

### LayeredClothingCacheOptimizations

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance · **Tags:** `NotScriptable`

Controls whether the engine caches layered clothing rendering data to improve performance for experiences with many characters wearing layered clothing. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the current engine-wide rollout state.

### LuauTypeCheckMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/LuauTypeCheckMode|LuauTypeCheckMode]]

**Thread safety:** ReadSafe · **Category:** Scripting · **Loaded/Saved:** true/true · **Capabilities:** PluginOrOpenCloud

Controls the Luau type checking mode applied to scripts in the experience. See [[30 Official Roblox Docs/API Reference/Enums/LuauTypeCheckMode|Enum.LuauTypeCheckMode]] for the available modes.

### MeshPartHeadsAndAccessories

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MeshPartHeadsAndAccessories|MeshPartHeadsAndAccessories]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

Sets whether character Heads and Accessories should be downloaded as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. The `Default` value is the same as `Enabled`. If this feature is enabled, built-in avatars will use [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] for the character's head and accessories.

### MeshStreamingAndImprovedLods

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState]] property determines whether the experience uses the new mesh streaming and Wild Mesh Simplifier LOD system. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]], mesh requests fetch the lowest quality LOD first and stream in higher detail over time. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Disabled]], the legacy mesh loading behavior is used. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the current engine-wide rollout state.

### ModelStreamingBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|ModelStreamingBehavior]]

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Enum.ModelStreamingBehavior]] property controls how [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] are replicated in experiences when instance streaming is enabled.

### NextGenerationReplication

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When `true`, enables an alternate replication system that alters and improves how properties are replicated under the hood; note that when `true`, you should not rely on the ordering of property replication and remote events.

### NextGenerationReplicationAlias

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

### PathfindingUseImprovedSearch

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PathfindingUseImprovedSearch|PathfindingUseImprovedSearch]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When [[30 Official Roblox Docs/API Reference/Enums/PathfindingUseImprovedSearch|Enabled]], [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] uses an improved pathfinding algorithm. [[30 Official Roblox Docs/API Reference/Enums/PathfindingUseImprovedSearch|Default]] follows the current engine-wide rollout state.

### PhysicsSteppingMethod

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PhysicsSteppingMethod|PhysicsSteppingMethod]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

Sets how the solver will advance the physics simulation forward in time. This option cannot be set through developer-facing Luau and must be set from the **PhysicsSteppingMethod** property of **Workspace** within Studio. See [[30 Official Roblox Docs/Physics/Adaptive timestepping|Adaptive Timestepping]] for details.

Note that when assemblies of different simulation rates become connected via [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] or collisions, the combined mechanism will default to the highest simulation rate for stability.

### PlayerCharacterDestroyBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PlayerCharacterDestroyBehavior|PlayerCharacterDestroyBehavior]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When enabled, the engine automatically calls `Destroy()` on a player's old character when it is replaced (for example, on respawn) and on the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object itself when the player leaves the server.

### PlayerScriptsUseInputActionSystem

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

Controls whether the built-in player scripts are updated to use the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]]. When enabled, the player scripts live under [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] (controlled by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CreateDefaultPlayerModule|StarterPlayer.CreateDefaultPlayerModule]]) and the server is able to process player inputs.

### PlayerScriptsUseInputActionSystemAlias

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

### PredictiveStreamingMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|PredictiveStreamingMode]]

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When enabled, the engine can prepare content for anticipated changes to a player's replication focus. This includes movement along likely paths, predicted spawn locations, and large changes in focus position. [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Default]] currently behaves like [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Disabled]].

### PrimalPhysicsSolver

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PrimalPhysicsSolver|PrimalPhysicsSolver]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

The Primal Physics Solver is an experimental constraint solver that can improve accuracy in complex setup. Setting this property to [[30 Official Roblox Docs/API Reference/Enums/PrimalPhysicsSolver|Experimental]] enables it.

### RejectCharacterDeletions

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RejectCharacterDeletions|RejectCharacterDeletions]]

**Thread safety:** ReadSafe · **Category:** Networking · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When enabled, the server ignores client requests to delete player [[30 Official Roblox Docs/API Reference/Classes/Model|character]] objects from the workspace, preventing exploits that attempt to abuse this replication path. [[30 Official Roblox Docs/API Reference/Enums/RejectCharacterDeletions|Default]] is currently equivalent to `Enabled`.

### RenderingCacheOptimizations

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RenderingCacheOptimizationMode|RenderingCacheOptimizationMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Physics · **Tags:** `NotScriptable`

Controls whether the engine caches rendering state data to reduce redundant per-frame work. When enabled, the renderer can skip recomputing state for static objects, improving frame rates in scenes with many parts.

### ReplicateInstanceDestroySetting

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ReplicateInstanceDestroySetting|ReplicateInstanceDestroySetting]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

Determines the replication behavior when `Instance:Destroy()` is called on the server. When [[30 Official Roblox Docs/API Reference/Enums/ReplicateInstanceDestroySetting|Enabled]], the engine uses improved replication semantics for instance destruction.

### Retargeting

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AnimatorRetargetingMode|AnimatorRetargetingMode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

Sets the animation retargeting mode. Retargeting adapts animations to character rigs of different proportions, allowing a single animation to play correctly on characters of varying sizes and shapes.

### SandboxedInstanceMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SandboxedInstanceMode|SandboxedInstanceMode]]

**Thread safety:** ReadSafe · **Category:** Permissions · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When set to [[30 Official Roblox Docs/API Reference/Enums/SandboxedInstanceMode|Experimental]], the engine enables sandboxed instance mode, which lets you use script capabilities.

### SignalBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior|SignalBehavior]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Tags:** `NotScriptable`

This property determines whether event handlers will be resumed immediately when the event fires, or deferred and then resumed at a later resumption point. Resumption points currently include:

- Input processing (resumes once per input to be processed, see [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]])
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|RunService.PreRender]]
- Legacy waiting script resumption such as `wait()`, `spawn()`, and `delay()`
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|RunService.PreAnimation]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|RunService.PostSimulation]]
- Waiting script resumption such as [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]], [[30 Official Roblox Docs/API Reference/Libraries/task#spawn|task.spawn()]], and [[30 Official Roblox Docs/API Reference/Libraries/task#delay|task.delay()]]
- [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]]
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose|DataModel.BindToClose]]

For more information, see [[30 Official Roblox Docs/Scripting/Events/Deferred engine events|Deferred Events]].

### SignalBehaviorAlias

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior|SignalBehavior]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

### StreamingEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true

This property determines whether in-experience content streaming is enabled for the place. This property is not scriptable and therefore must be set on the `Workspace` object in Studio.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|Workspace.StreamingMinRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|Workspace.StreamingTargetRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]]

### StreamingEnabledAlias

**Type:** boolean

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

### StreamingIntegrityMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode|StreamingIntegrityMode]]

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

If instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] is enabled, an experience may behave in unintended ways if a player's character moves into a region of the world that has not been streamed to their client. The streaming integrity feature offers a way to avoid those potentially problematic situations.

### StreamingMinRadius

**Type:** int

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This property indicates the radius around the player's character or the current [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|ReplicationFocus]] in which content will be streamed in at the highest priority. Defaults to 64 studs.

Care should be taken when increasing the default minimum radius since doing so will require more memory and more server bandwidth at the expense of other components.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] which controls whether content streaming is enabled
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|Workspace.StreamingTargetRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]]

### StreamingTargetRadius

**Type:** int

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This property controls the maximum distance away from the player's character or the current [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|ReplicationFocus]] in which content will be streamed in. Defaults to 1024 studs.

Note that the engine is allowed to retain previously loaded content beyond the target radius, memory permitting.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] which controls whether content streaming is enabled
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|Workspace.StreamingMinRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]]

### StreamOutBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior|StreamOutBehavior]]

**Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This property controls where content will be unloaded from the [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|ReplicationFocus]] based on device memory conditions, or based on the streaming radius.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] which controls whether content streaming is enabled
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|Workspace.StreamingMinRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|Workspace.StreamingTargetRadius]]
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]]

### Terrain

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a reference to the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object parented to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

*(image in the full Top G Vault)*

See [[30 Official Roblox Docs/Parts/Environmental terrain|Environmental Terrain]] for more information.

### TouchesUseCollisionGroups

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This property determines whether [[30 Official Roblox Docs/API Reference/Classes/BasePart|parts]] in different groups set to not collide will ignore collisions and touch events. By default, the value of this property is set to `false`.

When this property is enabled, parts in different groups set to not collide will also ignore the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch|CanTouch]] property, similar to how [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] is ignored. For more information on the behavior of CanTouch, please visit its property page.

### UseFixedSimulation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

When `true`, enables [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] which calls a function at a fixed frequency. Also updates physics stepping logic such that character controller updates and joint transforms are performed at a fixed frequency rather than once per frame, as well as makes the [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#time|time()]] function return the fixed stepped frame time.

### UseFixedSimulationAlias

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Server Authority · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`, `NotScriptable`

### UseNewLuauTypeSolver

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Thread safety:** ReadSafe · **Category:** Scripting · **Loaded/Saved:** true/true · **Tags:** `NotScriptable`

This [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState]] property controls whether the new Luau type solver is used for type inference and type checking in scripts. The new type solver provides improved accuracy and performance for type analysis. Note that [[30 Official Roblox Docs/API Reference/Classes/Workspace#LuauTypeCheckMode|Workspace.LuauTypeCheckMode]] controls the mode (strict, nonstrict, etc.) while this property controls which solver implementation is active. [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Default]] follows the current engine-wide rollout state.

## Methods

### ApplyRecommendedStreamingSettings

```lua
Workspace:ApplyRecommendedStreamingSettings(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Applies the current recommended instance streaming settings to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. Only settings that differ from their recommended values are changed.

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if one or more streaming properties were changed; `false` if every value already matched its recommended setting. |

### BreakJoints

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
Workspace:BreakJoints(objects: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`

Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] given, breaking any joints connected to these parts. This function will break any of the following types of joints:

- [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstances]] such as [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]]
- [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]]

Unlike [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints|Model:MakeJoints()]], this function requires an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] as a parameter. This array is given as follows:

```lua
local Workspace = game:GetService("Workspace")

Workspace:BreakJoints({part1, part2, part3})
```

Note, this function cannot be used in developer-facing Luau and will only function in plugins.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] for whom joints are to be broken. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetNumAwakeParts

```lua
Workspace:GetNumAwakeParts(): int
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that are deemed physically active, due to being recently under the influence of physics.

This function provides a measure of how many [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are being influenced by, or recently under the influence of, physical forces.

```
local Workspace = game:GetService("Workspace")

print(Workspace:GetNumAwakeParts())
```

In order to ensure good performance, the engine sets [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in which physics are not being applied to a "sleeping" state. [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|BasePart.Anchored]] set to `true`, for example, will always be sleeping as physics doesn't apply to them. When a force is applied to a non‑anchored [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], an "awake" state will be applied. Whilst a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is awake, the physics engine will perform continuous calculations to ensure physical forces interact correctly with the part. Once the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is no longer subject to physical forces, it will revert to a "sleeping" state.

**Returns**

| Type | Description |
| --- | --- |
| int | The number of awake parts. |

### GetPhysicsThrottling

```lua
Workspace:GetPhysicsThrottling(): int
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns an integer, between `0` and `100`, representing the percentage of real time that physics simulation is currently being throttled to. Physics throttling occurs when the physics engine detects it cannot keep up with the game in real time. When physics is being throttled, it will update less frequently causing [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] to appear to move slower.

Objects associated with [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] are exempt from physics throttling.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace:SetPhysicsThrottleEnabled()]].

**Returns**

| Type | Description |
| --- | --- |
| int | The percentage of real time that physics simulation is currently being throttled to. |

### GetRealPhysicsFPS

```lua
Workspace:GetRealPhysicsFPS(): double
```

**Thread safety:** Safe · **Capabilities:** Basic

Returns the number of frames per second that physics is currently being simulated at.

#### Using GetRealPhysicsFPS to combat exploiters

A common use of this function is to detect if exploiters are increasing their local physics frame rate to move faster. This is generally done by comparing the result returned by a client's GetRealPhysicsFPS to a maximum that will not be breached in normal circumstances (usually 65 or 70). If this limit is breached, developers can use the [[30 Official Roblox Docs/API Reference/Classes/Player#Kick|Player:Kick()]] function to remove that [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] from the game. It is important to remember that, although this practice may be effective sometimes, client-side anti-exploiter measures are never 100% reliable.

**Returns**

| Type | Description |
| --- | --- |
| double | Returns the number of frames per second that physics is currently being simulated at. |

*Code samples for this member (`Workspace-GetRealPhysicsFPS1`) are published on the source page; their code is not part of the open-source repo.*

### GetServerTimeNow

```lua
Workspace:GetServerTimeNow(): double
```

**Thread safety:** Safe · **Capabilities:** Basic

This method returns the client's best approximation of the current time on the server. It is useful for creating synchronized experiences, as every client will get roughly the same results regardless of their timezone or local clock.

This method returns a Unix timestamp, similar to [[30 Official Roblox Docs/API Reference/Libraries/os|os.time()]], that you can use with [[30 Official Roblox Docs/API Reference/Libraries/os|os.date()]] or [[30 Official Roblox Docs/API Reference/Datatypes/DateTime#fromUnixTimestamp|DateTime.fromUnixTimestamp()]]. The timestamp is smoothed so that:

- It is monotonic; its value will never decrease.
- It moves at the same rate as the local clock to within 0.6%.

This method is useful for making sure an event starts at the right real-world time and for periodic adjustments to keep a series of events in sync. For benchmarking or other use cases that require higher precision, consider [[30 Official Roblox Docs/API Reference/Libraries/os|os.clock()]].

This method relies on the server, so calling it from a client that isn't connected will throw an error. Also note that this method is not suitable for things like timed rewards, as it is not secure compared to tracking such timers on the server.

#### See also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|DistributedGameTime]], a game-time clock
- [[30 Official Roblox Docs/API Reference/Libraries/os|os.time()]]
- [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]]

**Returns**

| Type | Description |
| --- | --- |
| double | The estimated Unix timestamp on the server. |

### JoinToOutsiders

```lua
Workspace:JoinToOutsiders(objects: Instances, jointType: JointCreationMode): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

This function creates joints between the specified [[30 Official Roblox Docs/API Reference/Classes/BasePart|Parts]] and any touching parts depending on the parts' surfaces and the specified joint creation mode.

This function creates joints between the specified Parts and any planar touching surfaces, depending on the parts' surfaces and the specified joint creation mode.

- Glue, Studs, Inlets, Universal, Weld, and Smooth surfaces will all create Weld instances.
- Spheres will not surface-weld to anything. The rounded sides of cylinders will not surface-weld, but the flat end sides will.
- Hinge and Motor surfaces will still create [[30 Official Roblox Docs/API Reference/Classes/Rotate|Rotate]] and [[30 Official Roblox Docs/API Reference/Classes/RotateP|RotateP]] joint instances, regardless of part shape.

The first parameter is an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]]. Joints will only be created between the parts in the array and not in the array. Joints will not be created between the parts in the array.

The second parameter is a [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode|Enum.JointCreationMode]] that determines how joints will be created. Passing in either enum value, [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode|Enum.JointCreationMode.All]] or [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode|Enum.JointCreationMode.Surface]], has the same behavior which equates to Join Always

This function is used by the Roblox Studio **Move** tool when the user finishes moving a selection. In conjunction with [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetJoinMode|Plugin:GetJoinMode()]] and [[30 Official Roblox Docs/API Reference/Classes/Workspace#UnjoinFromOutsiders|Workspace:UnjoinFromOutsiders()]] it can be used to retain join functionality when developing custom studio build tools. See the snippets below for an example.

```lua
local Workspace = game:GetService("Workspace")

-- Finished moving a selection; make joints
local function finishedMovingParts(parts)
	local joinMode = Plugin:GetJoinMode()
	Workspace:JoinToOutsiders(parts, joinMode)
end
```

```lua
local Workspace = game:GetService("Workspace")

-- Started moving a selection; break joints
local function startMovingParts(parts)
	Workspace:UnjoinFromOutsiders(parts)
end
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] for whom joints are to be made. |
| `jointType` | [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|JointCreationMode]] |  | The [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|Enum.JointCreationMode]] to be used. Passing in [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|Enum.JointCreationMode.All]] or [[30 Official Roblox Docs/API Reference/Enums/JointCreationMode\|Enum.JointCreationMode.Surface]] has the same behavior which equates to Join Always. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### MakeJoints

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
Workspace:MakeJoints(objects: Instances): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Deprecated`

**Deprecated**

SurfaceType based joining is deprecated, do not use MakeJoints for new projects. [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] and [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraints]] should be used instead.

Goes through all [[30 Official Roblox Docs/API Reference/Classes/BasePart|Parts]] given. If any part's side has a [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|Enum.SurfaceType]] that can make a joint it will create a joint with any adjacent parts.

Joints will be created between the specified Parts and any planar touching surfaces, depending on the parts' surfaces.

- Smooth surfaces will not create joints
- Glue surfaces will create a [[30 Official Roblox Docs/API Reference/Classes/Glue|Glue]] joint
- Weld will create a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] joint with any surface except for Unjoinable
- Studs, Inlet, or Universal will each create a [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]] joint with either of other the other two surfaces (e.g. Studs with Inlet and Universal)
- Hinge and Motor surfaces create [[30 Official Roblox Docs/API Reference/Classes/Rotate|Rotate]] and [[30 Official Roblox Docs/API Reference/Classes/RotateV|RotateV]] joint instances

Unlike [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints|Model:MakeJoints()]], this function requires an array of parts as a parameter. This array is given as follows:

```
local Workspace = game:GetService("Workspace")

Workspace:MakeJoints({part1, part2, part3})
```

Joints are broken if enough force is applied to them due to an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]], unless a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] object is parented to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or ancestor [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. For this reason, they are often used to make simple destructible buildings and other models.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|parts]] for whom joints are to be made. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PGSIsEnabled

```lua
Workspace:PGSIsEnabled(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns `true` if the game has the PGS Physics solver enabled.

As [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.PGSPhysicsSolverEnabled]] cannot be accessed by scripts, the PGSIsEnabled function allows developers to tell which physics solver the game is using.

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the PGS solver is enabled. |

### UnjoinFromOutsiders

```lua
Workspace:UnjoinFromOutsiders(objects: Instances): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Breaks all joints between the specified [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and other [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]].

This function requires an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]]. Note, joints will not be broken between these [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] (each other), only between these [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and other [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] not in the array.

This function is used by the Roblox Studio **Move** tool when the user starts moving a selection. In conjunction with [[30 Official Roblox Docs/API Reference/Classes/Plugin#GetJoinMode|Plugin:GetJoinMode()]] and [[30 Official Roblox Docs/API Reference/Classes/Workspace#JoinToOutsiders|Workspace:JoinToOutsiders()]] it can be used to retain join functionality when developing custom Studio build tools. See the snippets below for an example.

```
local Workspace = game:GetService("Workspace")

-- Finished moving a selection; make joints
local function finishedMovingParts(parts)
	local joinMode = Plugin:GetJoinMode()
	Workspace:JoinToOutsiders(parts, joinMode)
end
```

```
local Workspace = game:GetService("Workspace")

-- Started moving a selection; break joints
local function startMovingParts(parts)
	Workspace:UnjoinFromOutsiders(parts)
end
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `objects` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] for whom joints are to be broken. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ZoomToExtents

```lua
Workspace:ZoomToExtents(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Positions and zooms the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]] to show the extent of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] currently in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. It exhibits similar behavior to the "focus" command but it shows the extents of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] rather than the currently selected object.

This function cannot be used in developer-facing Luau but will function in the Command Bar or plugins.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### PersistentLoaded

```lua
Workspace.PersistentLoaded(player: Player)
```

This event fires every time a player has been sent all current persistent models and part-less atomic models. The `player` parameter indicates which player has received all applicable instances.

Note that experience loading happens before persistent loading, and firing of the [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded|DataModel.Loaded]] event does not indicate that all persistent models are present.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who has received all current persistent models and part-less atomic models. |

---
*Source: [Workspace](https://create.roblox.com/docs/reference/engine/classes/Workspace) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
