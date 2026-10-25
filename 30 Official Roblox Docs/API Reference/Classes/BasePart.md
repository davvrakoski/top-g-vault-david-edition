---
title: "BasePart"
description: "The abstract base class for in-world objects that physically interact."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BasePart"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The abstract base class for in-world objects that physically interact.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CornerWedgePart|CornerWedgePart]], [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]], [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]], [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is an abstract base class for in-world objects that render and are physically simulated while in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. There are several implementations of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the most common being [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. Others include [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]], [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]], and the singleton [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object. Generally, when documentation refers to a "part," most [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] implementations will work and not just [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

For information on how [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are grouped into simulated rigid bodies, see [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]].

There are many different objects that interact with [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (other than [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]]), including:

- Several [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] may be grouped within a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and moved at the same time using [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]]. See [[30 Official Roblox Docs/Parts/Models|Models]].
- A [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] applies a stretched image texture to the faces of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], while a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] applies a tiled image texture to the faces. See [[30 Official Roblox Docs/Parts/Textures and decals|Textures and Decals]].
- A [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] renders [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] on the face of a part. See [[30 Official Roblox Docs/UI/In-game UI containers|In-Experience UI Containers]].
- [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] can be added to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to specify [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] relative to the part. These are often used by physical [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] objects as outlined in [[30 Official Roblox Docs/Physics/Mechanical constraints|Mechanical Constraints]] and [[30 Official Roblox Docs/Physics/Mover constraints|Mover Constraints]].
- [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] objects emit particles uniformly in the volume of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to which they are parented. See [[30 Official Roblox Docs/Effects/Particle emitters|Particle Emitters]].
- Light objects like [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] emit light from the center of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] as illustrated in [[30 Official Roblox Docs/Effects/Light sources|Light Sources]].
- If parented to a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] and given the name **Handle**, a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] can be held by characters. See [[30 Official Roblox Docs/Players/In-game tools|In-Experience Tools]].

*Code samples for this API (`SmoothDamp-CFrame`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/BasePart); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|Anchored]] | boolean | Determines whether a part is immovable by physics. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity\|AssemblyAngularVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The angular velocity of the part's assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass\|AssemblyCenterOfMass]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The center of mass of the part's assembly in world space. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity\|AssemblyLinearVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The linear velocity of the part's assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass\|AssemblyMass]] | float | The total mass of the part's assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart\|AssemblyRootPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A reference to the root part of the assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AudioCanCollide\|AudioCanCollide]] | boolean | Determines whether the part will physically interact with audio simulation, similar to [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow\|CastShadow]] for lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackParamA\|BackParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Back face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackParamB\|BackParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Back face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurface\|BackSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the back face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurfaceInput\|BackSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Back face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomParamA\|BottomParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Bottom face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomParamB\|BottomParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Bottom face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurface\|BottomSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the bottom face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurfaceInput\|BottomSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Bottom face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BrickColor\|BrickColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Determines the color of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#brickColor\|brickColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide\|CanCollide]] | boolean | Determines whether a part may collide with other parts. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery\|CanQuery]] | boolean | Determines whether the part is considered during spatial query operations. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch\|CanTouch]] | boolean | Determines if [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched\|Touched]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded\|TouchEnded]] events fire on the part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow\|CastShadow]] | boolean | Determines whether or not a part casts a shadow. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CenterOfMass\|CenterOfMass]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Describes the local position of a part's center of mass, relative to its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Determines the position and orientation of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroup\|CollisionGroup]] | string | Describes the name of a part's collision group. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroupId\|CollisionGroupId]] | int | **Deprecated.** Describes the automatically set ID number of a part's collision group. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CurrentPhysicalProperties\|CurrentPhysicalProperties]] | [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] | Indicates the current physical properties of the part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties\|CustomPhysicalProperties]] | [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties\|PhysicalProperties]] | Determines several physical properties of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Elasticity\|Elasticity]] | float | **Deprecated.** Used to control the Elasticity of the part, but it no longer does anything. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#EnableFluidForces\|EnableFluidForces]] | boolean | Used to enable or disable aerodynamic forces on parts and assemblies. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ExtentsCFrame\|ExtentsCFrame]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the physical extents of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ExtentsSize\|ExtentsSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The actual physical size of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] as regarded by the physics engine. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Friction\|Friction]] | float | **Deprecated.** Used to control the Friction of the part, but now it no longer does anything. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontParamA\|FrontParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Front face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontParamB\|FrontParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Front face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurface\|FrontSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the front face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurfaceInput\|FrontSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Front face of a part (-Z direction). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftParamA\|LeftParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Left face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftParamB\|LeftParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Left face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurface\|LeftSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the left face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurfaceInput\|LeftSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Left face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | Determines a multiplier for [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|BasePart.Transparency]] that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Locked\|Locked]] | boolean | Determines whether a part is selectable in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass\|Mass]] | float | Describes the mass of the part, the product of its density and volume. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Massless\|Massless]] | boolean | Determines whether the part contributes to the total mass or inertia of its rigid body. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material\|Material]] | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] | Determines the texture and default physical properties of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant\|MaterialVariant]] | string | The name of [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation\|Orientation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Describes the rotation of the part in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset\|PivotOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Specifies the offset of the part's pivot from its [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Describes the position of the part in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ReceiveAge\|ReceiveAge]] | float | Time since last recorded physics update. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance\|Reflectance]] | float | Determines how much a part reflects the skybox. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ResizeableFaces\|ResizeableFaces]] | [[30 Official Roblox Docs/API Reference/Datatypes/Faces\|Faces]] | Describes the faces on which a part may be resized. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ResizeIncrement\|ResizeIncrement]] | int | Describes the smallest change in size allowable by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Resize\|Resize()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightParamA\|RightParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Right face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightParamB\|RightParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Right face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurface\|RightSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the right face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurfaceInput\|RightSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Right face of a part (-X direction). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RootPriority\|RootPriority]] | int | The main rule in determining the root part of an assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Rotation\|Rotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The rotation of the part in degrees for the three axes. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#RotVelocity\|RotVelocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Determines a part's change in orientation over time. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the dimensions of a part (length, height, width). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#SpecificGravity\|SpecificGravity]] | float | **Deprecated.** The ratio of the part's density to the density of water determined by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material\|BasePart.Material]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopParamA\|TopParamA]] | float | **Deprecated.** Determines the first parameter for the SurfaceType on the Top face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopParamB\|TopParamB]] | float | **Deprecated.** Determines the second parameter for the SurfaceType on the Top face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurface\|TopSurface]] | [[30 Official Roblox Docs/API Reference/Enums/SurfaceType\|SurfaceType]] | Determines the type of surface for the top face of a part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurfaceInput\|TopSurfaceInput]] | [[30 Official Roblox Docs/API Reference/Enums/InputType\|InputType]] | **Deprecated.** Determines the kind of input for the Top face of a part (+Y direction). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|Transparency]] | float | Determines how much a part can be seen through (the inverse of part opacity). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity\|Velocity]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | **Deprecated.** Determines a part's change in position over time. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#AngularAccelerationToTorque\|AngularAccelerationToTorque()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the torque needed to achieve a given angular acceleration on this part's assembly, optionally accounting for gyroscopic effects. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyAngularImpulse\|ApplyAngularImpulse()]] | () | Apply an angular impulse to the assembly. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse\|ApplyImpulse()]] | () | Apply an impulse to the assembly at the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass\|center of mass]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulseAtPosition\|ApplyImpulseAtPosition()]] | () | Apply an impulse to the assembly at specified position. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BindToCollisionSummaries\|BindToCollisionSummaries()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Subscribes to detailed per-frame contact data for the collisions this part is involved in. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#BreakJoints\|BreakJoints()]] | () | **Deprecated.** Breaks any surface connection with any adjacent part, including [[30 Official Roblox Docs/API Reference/Classes/Weld\|Weld]] and other [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|JointInstance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#breakJoints\|breakJoints()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollideWith\|CanCollideWith()]] | boolean | Returns whether the parts can collide with each other. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanSetNetworkOwnership\|CanSetNetworkOwnership()]] | Tuple | Checks whether you can set a part's network ownership. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetClosestPointOnSurface\|GetClosestPointOnSurface()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the closest point on the part's surface to the given point. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetConnectedParts\|GetConnectedParts()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | Returns a table of parts connected to the object by any kind of rigid joint. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetJoints\|GetJoints()]] | Instances | Returns all Joints or Constraints connected to this part that are active in the simulation. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetMass\|GetMass()]] | float | Returns the value of the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass\|Mass]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#getMass\|getMass()]] | float | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetNetworkOwner\|GetNetworkOwner()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the current player who is the network owner of this part, or `nil` in case of the server. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetNetworkOwnershipAuto\|GetNetworkOwnershipAuto()]] | boolean | Returns true if the game engine automatically decides the network owner for this part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetNoCollisionConstraints\|GetNoCollisionConstraints()]] | Instances | Returns the enabled [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint\|NoCollisionConstraint]] objects currently registered for this part in its physics world. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRenderCFrame\|GetRenderCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | **Deprecated.** OBSOLETE. Returns a CFrame describing where the part is being rendered at. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetRootPart\|GetRootPart()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Returns the base part of an assembly of parts. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetTouchingParts\|GetTouchingParts()]] | Instances | Returns a table of all [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide\|BasePart.CanCollide]] true parts that intersect with this part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetVelocityAtPosition\|GetVelocityAtPosition()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the linear velocity of the part's assembly at the given position relative to this part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#IntersectAsync\|IntersectAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation\|IntersectOperation]] from the overlapping geometry of the part and the other parts in the given array. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#IsGrounded\|IsGrounded()]] | boolean | Returns true if the object is connected to a part that will hold it in place (eg an [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored\|Anchored]] part), otherwise returns false. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#MakeJoints\|MakeJoints()]] | () | **Deprecated.** Creates a joint on any side of the object that has a surface ID that can make a joint. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#makeJoints\|makeJoints()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Resize\|Resize()]] | boolean | Changes the size of an object just like using the Studio resize tool. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Resize\|resize()]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner\|SetNetworkOwner()]] | () | Sets the given player as network owner for this and all connected parts. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwnershipAuto\|SetNetworkOwnershipAuto()]] | () | Lets the game engine dynamically decide who will handle the part's physics (one of the clients or the server). |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#SubtractAsync\|SubtractAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] from the part, minus the geometry occupied by the parts in the given array. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TorqueToAngularAcceleration\|TorqueToAngularAcceleration()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the angular acceleration that would result from applying a given torque to this part's assembly, optionally accounting for gyroscopic effects. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#UnionAsync\|UnionAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] from the part, plus the geometry occupied by the parts in the given array. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalSimulationTouched\|LocalSimulationTouched]] | `part` | **Deprecated.** Fires on the local client when another part comes in contact with this part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#OutfitChanged\|OutfitChanged]] |  | **Deprecated.** Fires when the part's appearance changes due to a [[30 Official Roblox Docs/API Reference/Classes/Shirt\|Shirt]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#StoppedTouching\|StoppedTouching]] | `otherPart` | **Deprecated.** Fires on the local client when a part stops touching another part. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched\|Touched]] | `otherPart` | Fires when a part touches another part as a result of physical movement. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded\|TouchEnded]] | `otherPart` | Fires when a part stops touching another part as a result of physical movement. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Anchored

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/true

The `Anchored` property determines whether the part will be immovable by physics. When enabled, a part will never change position due to gravity, other part collisions, overlapping other parts, or any other physics-related causes. As a result, two anchored parts will never fire the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] event on each other.

An anchored part may still be moved by changing its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], and it still may have a nonzero [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]].

Finally, if an unanchored part is joined with an anchored part through an object like a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]], it too will act anchored. If such a joint breaks, the part may be affected by physics again. See [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]] for more details.

Network ownership cannot be set on anchored parts. If a part's anchored status changes on the server, the network ownership of that part will be affected.

*Code samples for this member (`Part-Anchored-Toggle`) are published on the source page; their code is not part of the open-source repo.*

### AssemblyAngularVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Assembly · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The angular velocity vector of this part's assembly. It's the rate of change of orientation in radians per second.

Angular velocity is the same at every point of the assembly.

Setting the velocity directly may lead to unrealistic motion. Using [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] or [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity|AngularVelocity]] constraint is preferred, or use [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyAngularImpulse|ApplyAngularImpulse()]] if you want instantaneous change in velocity.

If the part is [[30 Official Roblox Docs/Physics/Network ownership|owned]] by the server, this property must be changed from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (not from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]). If the part is owned by a client through **automatic** ownership, this property can be changed from either a client script **or** a server script; changing it from a client script for a server-owned part will have no effect.

### AssemblyCenterOfMass

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Assembly · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A position calculated via the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass|Mass]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]] of all the parts in the assembly.

If the assembly has an anchored part, that part's center of mass will be the assembly's center of mass, and the assembly will have infinite mass.

Knowing the center of mass can help the assembly maintain stability. A force applied to the center of mass will not cause angular acceleration, only linear. An assembly with a low center of mass will have a better time staying upright under the effect of gravity.

### AssemblyLinearVelocity

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Assembly · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The linear velocity vector of this part's assembly. It's the rate of change in position of [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass|AssemblyCenterOfMass]] in studs per second.

If you want to know the velocity at a point other than the assembly's center of mass, use [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetVelocityAtPosition|GetVelocityAtPosition()]].

Setting the velocity directly may lead to unrealistic motion. Using a [[30 Official Roblox Docs/API Reference/Classes/VectorForce|VectorForce]] constraint is preferred, or use [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|ApplyImpulse()]] if you want instantaneous change in velocity.

If the part is [[30 Official Roblox Docs/Physics/Network ownership|owned]] by the server, this property must be changed from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (not from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]). If the part is owned by a client through **automatic** ownership, this property can be changed from either a client script **or** a server script; changing it from a client script for a server-owned part will have no effect.

### AssemblyMass

**Type:** float

**Thread safety:** ReadSafe · **Category:** Assembly · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The sum of the mass of all the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in this part's assembly. Parts that are [[30 Official Roblox Docs/API Reference/Classes/BasePart#Massless|Massless]] and are not the assembly's root part will not contribute to the `AssemblyMass`.

If the assembly has an anchored part, the assembly's mass is considered infinite. Constraints and other physical interactions between unanchored assemblies with a large difference in mass may cause instabilities.

### AssemblyRootPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Assembly · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] automatically chosen to represent the assembly's root part. If the part is not parented to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], this property will be `nil`.

The root part can be changed by changing the [[30 Official Roblox Docs/API Reference/Classes/BasePart#RootPriority|RootPriority]] of the parts in the assembly.

Parts that all share the same `AssemblyRootPart` are in the same assembly.

For more information on root parts, see [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]].

### AudioCanCollide

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true

`AudioCanCollide` determines whether the part will physically interact with audio simulation, similar to [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow|CastShadow]] for lighting.

When disabled, audio passes through the part; it is not occluded or reflected.

### BackParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BackParamA` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurface|BasePart.BackSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurfaceInput|BasePart.BackSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BackParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BackParamB` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurface|BasePart.BackSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurfaceInput|BasePart.BackSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BackSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `BackSurface` property determines the type of surface used for the positive **Z** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### BackSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BackSurfaceInput` property determines the kind of input provided to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurface|BasePart.BackSurface]]. This is only relevant for Motor or SteppingMotor SurfaceTypes. This property determines how [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackParamA|BasePart.BackParamA]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackParamB|BasePart.BackParamB]] are used. For brevity, these properties will be referred to as ParamA and ParamB, respectively.

- By default, this is set to NoInput. This stops the motor altogether.
- For Constant, the motor rotates at a constant velocity equal to `ParamB`.
- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BottomParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BottomParamA` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurface|BasePart.BottomSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurfaceInput|BasePart.BottomSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BottomParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BottomParamB` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurface|BasePart.BottomSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurfaceInput|BasePart.BottomSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BottomSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `BottomSurface` property determines the type of surface used for the negative **Y** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### BottomSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `BottomSurfaceInput` property determines the kind of input provided to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurface|BasePart.BottomSurface]]. This is only relevant for Motor or SteppingMotor SurfaceTypes. This property determines how [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomParamA|BasePart.BottomParamA]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomParamB|BasePart.BottomParamB]] are used. For brevity, these properties will be referred to as ParamA and ParamB, respectively.

- By default, this is set to NoInput. This stops the motor altogether.
- For Constant, the motor rotates at a constant velocity equal to `ParamB`.
- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### BrickColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

This property determines the color of a part. If the part has a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]], this also determines the color used when rendering the material texture. For more control over the color, the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property can be used and this property will use the closest `BrickColor`.

Other visual properties of a part are determined by [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]].

### brickColor

> [!warning] Deprecated
> This deprecated property is an old Camel Case variant of the Pascal Case
> `Class.BasePart.BrickColor`, which should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`, `Deprecated`

### CanCollide

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true

`CanCollide` determines whether a part will physically interact with other parts. When disabled, other parts can pass through the part uninterrupted. Parts used for **decoration** usually have `CanCollide` disabled, as they need not be considered by the physics engine.

If a part is not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] and has `CanCollide` disabled, it may fall out of the world to be eventually destroyed by [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight|Workspace.FallenPartsDestroyHeight]].

When `CanCollide` is disabled, parts may still fire the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] event (as well the other parts touching them). You can disable this with [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch|CanTouch]].

For more information on collisions, see [[30 Official Roblox Docs/Workspace/Collisions|Collisions]].

*Code samples for this member (`Fade-Door`) are published on the source page; their code is not part of the open-source repo.*

### CanQuery

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true

This property determines whether the part is considered during spatial query operations, such as [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox|GetPartBoundsInBox]] or [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|Raycast]]. Note that [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]] must be disabled for `CanQuery` to take effect, and spatial query functions will never include parts with `CanQuery` of `false`.

Beyond this property, it is also possible to exclude parts which are descendants of a given list of parts using an [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] or [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object when calling the spatial query functions.

### CanTouch

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true

This property determines if [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|TouchEnded]] events fire on the part. If `true`, other touching parts must also have `CanTouch` set to `true` for touch events to fire. If `false`, touch events cannot be set up for the part and attempting to do so will throw an error. Similarly, if the property is set to `false` after a touch event is connected, the event will be disconnected and the [[30 Official Roblox Docs/API Reference/Classes/TouchTransmitter|TouchTransmitter]] removed.

Note that this collision logic can be set to respect [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision groups]] through the [[30 Official Roblox Docs/API Reference/Classes/Workspace#TouchesUseCollisionGroups|Workspace.TouchesUseCollisionGroups]] property. If `true`, parts in non-colliding groups will ignore both collisions **and** touch events, thereby making this property irrelevant.

#### Performance

There is a small performance gain on parts that have both `CanTouch` and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]] set to `false`, as these parts will never need to compute any kind of part to part collisions. However, they can still be hit by [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|Raycasts]] and [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] queries.

### CastShadow

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

Determines whether or not a part casts a shadow. Disabling this property for a given part can cause visual artifacts on the shadows cast upon that part.

This property is not designed for performance enhancement, but in complex scenes, strategically disabling it on certain parts can improve performance. Due to the possibility of visual artifacts, we recommend leaving it enabled on all parts in most situations.

### CenterOfMass

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The `CenterOfMass` property describes the **local** position of a part's center of mass. If this is a single part assembly, this is the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass|AssemblyCenterOfMass]] converted from world space to local. On simple [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]], the center of mass is always `(0, 0, 0)`, but it can vary for [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

### CFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/true

The `CFrame` property determines both the position and orientation of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in the world. It acts as an arbitrary reference location on the geometry, but [[30 Official Roblox Docs/API Reference/Classes/BasePart#ExtentsCFrame|ExtentsCFrame]] represents the actual [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of its physical center.

When setting `CFrame` on a part, other joined parts are also moved relative to the part, but it is recommended that you use [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] to move an entire model, such as when teleporting a player's character.

Unlike setting [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]], setting `CFrame` will always move the part to the exact given [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]; in other words: **no overlap checking is done** and the physics solver will attempt to resolve any overlap unless both parts are [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]].

For keeping track of positions relative to a part's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] may be useful.

*Code samples for this member (`Setting-Part-CFrame`) are published on the source page; their code is not part of the open-source repo.*

### CollisionGroup

**Type:** string

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`

The `CollisionGroup` property describes the name of the part's collision group (maximum of 100 characters). Parts start off in the default group whose name is `"Default"`. This value cannot be empty.

Although this property itself is non-replicated, the engine internally replicates the value through another private property to solve backward compatibility issues.

*Code samples for this member (`WorldRoot-RegisterCollisionGroup`) are published on the source page; their code is not part of the open-source repo.*

### CollisionGroupId

> [!warning] Deprecated
> This member is deprecated.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`, `Deprecated`

The [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroupId|BasePart.CollisionGroupId]] property describes the ID number of the part's collision group. Parts start off in the `"Default"` group whose ID is 0. If a part is unregistered, the value becomes -1. This value cannot be less than -1 and it cannot exceed [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetMaxCollisionGroups|WorldRoot:GetMaxCollisionGroups()]]. Invalid IDs are clamped.

Although this property can be directly changed, it's recommended that you specify the collision group by setting [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroup|BasePart.CollisionGroup]] to the collision group's **name**.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The `Color` property determines the color of a part. If the part has a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]], this also determines the color used when rendering the material texture.

If this property is set, [[30 Official Roblox Docs/API Reference/Classes/BasePart#BrickColor|BrickColor]] will use the closest match to this `Color` value.

Other visual properties of a part are determined by [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]].

*Code samples for this member (`Character-Health-Body-Color`) are published on the source page; their code is not part of the open-source repo.*

### CurrentPhysicalProperties

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]]

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

`CurrentPhysicalProperties` indicates the current physical properties of the part. You can set custom values for the physical properties per part, [[30 Official Roblox Docs/Parts/Materials|custom material]], and material override. The Roblox engine prioritizes more granular definitions when determining the effective physical properties of a part. The values in the following list are in order from highest to lowest priority:

- Custom physical properties of the part
- Custom physical properties of the part's custom material
- Custom physical properties of the material override of the part's material
- Default physical properties of the part's material

### CustomPhysicalProperties

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]]

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/true

`CustomPhysicalProperties` lets you customize various physical aspects of a part, such as its density, friction, and elasticity.

If enabled, this property let's you configure these physical properties. If disabled, these physical properties are determined by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] of the part.

*Code samples for this member (`Set-CustomPhysicalProperties`) are published on the source page; their code is not part of the open-source repo.*

### Elasticity

> [!warning] Deprecated
> This is only one of multiple physics-related properties. It has been
> deprecated in favor of `Class.BasePart.CustomPhysicalProperties`, which
> combines these properties into one.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

The Elasticity of a part is now determined by either its [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] or its `CustomPhysicalProperties`.

### EnableFluidForces

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

When `true`, and when [[30 Official Roblox Docs/API Reference/Classes/Workspace#FluidForces|Workspace.FluidForces]] is enabled, causes the physics engine to compute aerodynamic forces on this [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

### ExtentsCFrame

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the physical extents of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], representing its physical center.

### ExtentsSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The actual physical size of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] as regarded by the physics engine, for example in [[30 Official Roblox Docs/Workspace/Collisions|collision detection]].

### Friction

> [!warning] Deprecated
> This is only one of multiple physics-related properties. It has been
> deprecated in favor of `Class.BasePart.CustomPhysicalProperties`, which
> combines these properties into one.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

Used to control the Friction of the part, but now it no longer does anything. The Friction of a part is now determined by either its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] or its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|CustomPhysicalProperties]].

### FrontParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `FrontParamA` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurface|BasePart.FrontSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurfaceInput|BasePart.FrontSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### FrontParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `FrontParamB` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurface|BasePart.FrontSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurfaceInput|BasePart.FrontSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### FrontSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `FrontSurface` property determines the type of surface used for the negative **Z** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### FrontSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `FrontSurfaceInput` property determines the kind of input provided to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurface|BasePart.FrontSurface]]. This is only relevant for Motor or SteppingMotor SurfaceTypes. This property determines how [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontParamA|BasePart.FrontParamA]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontParamB|BasePart.FrontParamB]] are used. For brevity, these properties will be referred to as ParamA and ParamB, respectively.

- By default, this is set to NoInput. This stops the motor altogether.
- For Constant, the motor rotates at a constant velocity equal to `ParamB`.
- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### LeftParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `LeftParamA` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurface|BasePart.LeftSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurfaceInput|BasePart.LeftSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### LeftParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The LeftParamB property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurface|BasePart.LeftSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurfaceInput|BasePart.LeftSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### LeftSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `LeftSurface` property determines the type of surface used for the negative **X** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### LeftSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `LeftSurfaceInput` property determines the kind of input provided to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurface|BasePart.LeftSurface]]. This is only relevant for Motor or SteppingMotor SurfaceTypes. This property determines how [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftParamA|BasePart.LeftParamA]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftParamB|BasePart.LeftParamB]] are used. For brevity, these properties will be referred to as ParamA and ParamB, respectively.

- By default, this is set to NoInput. This stops the motor altogether.
- For Constant, the motor rotates at a constant velocity equal to `ParamB`.
- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `Hidden`, `NotReplicated`

The `LocalTransparencyModifier` property is a multiplier to [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] that is only visible to the local client. It does not replicate from client to server and is useful for when a part should not render for a specific client, such as how the player does not see their character's body parts when they zoom into first person mode.

This property modifies the local part's transparency through the following formula, with resulting values clamped between `0` and `1`.

`1` - ((`1` - [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]]) × (`1` - `LocalTransparencyModifier`))

| [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency\|Transparency]] | `LocalTransparencyModifier` | Server-Side | Client-Side |
| --- | --- | --- | --- |
| `0.5` | `0` | `0.5` | `0.5` |
| `0.5` | `0.25` | `0.5` | `0.625` |
| `0.5` | `0.5` | `0.5` | `0.75` |
| `0.5` | `0.75` | `0.5` | `0.875` |
| `0.5` | `1` | `0.5` | `1` |

### Locked

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The `Locked` property determines whether a part (or a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] it is contained within) may be selected in Studio by clicking on it. This property is most often enabled on parts within environment models that aren't being edited at the moment.

*Code samples for this member (`Recursive-Unlock`) are published on the source page; their code is not part of the open-source repo.*

### Mass

**Type:** float

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

`Mass` is a read-only property that describes the product of a part's volume and density. It is returned by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetMass|GetMass()]] function.

- The volume of a part is determined by its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]] and its [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Shape]], which varies depending on the kind of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] used, such as [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]].
- The density of a part is determined by its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|CustomPhysicalProperties]], if specified.

### Massless

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/true

If this property is enabled, the part will not contribute to the total mass or inertia of its assembly as long as it is welded to another part that has mass.

If the part is its own root part according to [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart|AssemblyRootPart]], this will be ignored for that part, and it will still contribute mass and inertia to its assembly like a normal part. Parts that are massless should never become an assembly root part unless all other parts in the assembly are also massless.

This might be useful for things like optional accessories on vehicles that you don't want to affect the handling of the car or a massless render mesh welded to a simpler collision mesh.

See also [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]], an article documenting what root parts are and how to use them.

### Material

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Material|Material]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

The `Material` property allows you to set a part's texture and default physical properties (in the case that [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|CustomPhysicalProperties]] is unset). The default [[30 Official Roblox Docs/API Reference/Enums/Material|Plastic]] material has a very light texture, while the [[30 Official Roblox Docs/API Reference/Enums/Material|SmoothPlastic]] material has no texture at all. Some material textures like [[30 Official Roblox Docs/API Reference/Enums/Material|DiamondPlate]] and [[30 Official Roblox Docs/API Reference/Enums/Material|Granite]] have very visible textures. Each material's texture reflects sunlight differently, especially [[30 Official Roblox Docs/API Reference/Enums/Material|Foil]].

Setting this property then enabling [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|CustomPhysicalProperties]] will use the default physical properties of a material. For instance, [[30 Official Roblox Docs/API Reference/Enums/Material|DiamondPlate]] is a very dense material while [[30 Official Roblox Docs/API Reference/Enums/Material|Wood]] is very light. A part's density determines whether it will float in terrain water.

The [[30 Official Roblox Docs/API Reference/Enums/Material|Glass]] material changes rendering behavior on moderate graphics settings by applying a bit of reflectiveness (similar to [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]]) and perspective distortion. The effect is especially pronounced on sphere-shaped parts. Semi‑transparent parts behind [[30 Official Roblox Docs/API Reference/Enums/Material|Glass]] parts are not visible.

### MaterialVariant

**Type:** string

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

The system searches the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instance with the specified `MaterialVariant` name and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] type. If it successfully finds a matching [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instance, it uses that instance to replace the default material. The default material can be the built-in material or an override [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] specified in [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]].

### Orientation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Tags:** `Hidden`, `NotReplicated`

The `Orientation` property describes the part's rotation in degrees around the **X**, **Y**, and **Z** axes using a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. The rotations are applied in **Y** ⟩ **X** ⟩ **Z** order. This differs from proper [Euler](https://en.wikipedia.org/wiki/Euler_angles) angles and is instead [Tait-Bryan][2] angles which describe **yaw**, **pitch**, and **roll**.

It is also worth noting how this property differs from the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#Angles|CFrame.Angles()]] constructor which applies rotations in a different order (**Z** ⟩ **Y** ⟩ **X**). For better control over the rotation of a part, it's recommended that [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] is set instead.

When setting this property, any [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]] or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] connected to this part will have the matching [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] property updated to allow the part to move relative to any other parts it is joined to. [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] will also be temporarily disabled and re-enabled during the move.

*Code samples for this member (`Part-Spinner`) are published on the source page; their code is not part of the open-source repo.*

### PivotOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Pivot · **Loaded/Saved:** true/true

This property specifies the offset of the part's pivot from its [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], that is [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot|BasePart:GetPivot()]] is the same as [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|BasePart.CFrame]] multiplied by [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset|BasePart.PivotOffset]].

This is convenient for setting the pivot to a location in **local** space, but setting a part's pivot to a location in **world** space can be done as follows:

*Code samples for this member (`reset-pivot`, `clock-hands`, `BasePart-PivotOffset`) are published on the source page; their code is not part of the open-source repo.*

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** false/false · **Tags:** `Hidden`, `NotReplicated`

The `Position` property describes the coordinates of a part using a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. It reflects the position of the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]], however it can also be set.

When setting this property, any [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]] or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] connected to this part will have the matching [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] property updated to allow the part to move relative to any other parts it is joined to. [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] will also be temporarily disabled and re-enabled during the move.

### ReceiveAge

**Type:** float

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** false/false · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

Indicates the time in seconds since the part's physics were last updated on the local client or the server. This value will be `0` when the part has no physics ([[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] is `true`).

### Reflectance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

The `Reflectance` property determines how much a part reflects the sky. A value of `0` indicates the part is not reflective at all, and a value of `1` indicates the part should fully reflect.

Reflectance is not affected by [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] unless the part is fully transparent, in which case reflectance will not render at all. Reflectance may or may not be ignored depending on the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] of the part.

### ResizeableFaces

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The `ResizeableFaces` property uses a [[30 Official Roblox Docs/API Reference/Datatypes/Faces|Faces]] object to describe the different faces on which a part may be resized. For most implementations of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], such as [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]], this property includes all faces. However, [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]] will set its `ResizeableFaces` set to only two faces since those kinds of parts must have two [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]] dimensions of length `2`.

This property is most commonly used with tools for building and manipulating parts and has little use outside of that context. The [[30 Official Roblox Docs/API Reference/Classes/Handles|Handles]] class, which has the [[30 Official Roblox Docs/API Reference/Classes/Handles#Faces|Handles.Faces]] property, can be used in conjunction with this property to display only the handles on faces that can be resized on a part.

*Code samples for this member (`Resize-Handles`) are published on the source page; their code is not part of the open-source repo.*

### ResizeIncrement

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The `ResizeIncrement` property is a read-only property that describes the smallest change in size allowable by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Resize|Resize()]] method. It differs between implementations of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] abstract class; for instance, [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] has this set to `1` while [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]] has this set to `2` since individual truss sections are 2×2×2 in size.

### RightParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `RightParamA` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurface|BasePart.RightSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurfaceInput|BasePart.RightSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### RightParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `RightParamB` property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurface|BasePart.RightSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurfaceInput|BasePart.RightSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### RightSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `RightSurface` property determines the type of surface used for the positive **X** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### RightSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The RightSurfaceInput property determines the kind of input provided to a

- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### RootPriority

**Type:** int

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/true

This property is an integer between `-127` and `127` that takes precedence over all other rules for root part sort. When considering multiple parts that are not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] and which share the same [[30 Official Roblox Docs/API Reference/Classes/BasePart#Massless|Massless]] value, a part with a higher `RootPriority` will take priority over those with lower `RootPriority`.

You can use this property to control which part of an assembly is the root part and keep the root part stable if size changes.

See also [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]], an article documenting what root parts are and how to use them.

### Rotation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The rotation of the part in degrees for the three axes.

When setting this property, any [[30 Official Roblox Docs/API Reference/Classes/Weld|Welds]] or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] connected to this part will have the matching [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C0|C0]] or [[30 Official Roblox Docs/API Reference/Classes/JointInstance#C1|C1]] property updated to allow the part to move relative to any other parts it is joined to. [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] will also be temporarily disabled and re-enabled during the move.

### RotVelocity

> [!warning] Deprecated
> This property is deprecated. Use `AssemblyAngularVelocity` instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `RotVelocity` of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|part]] describes how its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|BasePart.Orientation]] is presently changing. In other words, this property describes how the fast part is rotating. The part only rotates if it is not anchored.

The unit of this property is **radians per second**.

Using this in conjunction with [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation|AlignOrientation]] allows for aligned parts to have matching RotVelocity and Orientation values.

*Code samples for this member (`rotating-a-part-with-rotvelocity`) are published on the source page; their code is not part of the open-source repo.*

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

A part's `Size` property determines its **visual** dimensions, while [[30 Official Roblox Docs/API Reference/Classes/BasePart#ExtentsSize|ExtentsSize]] represents the actual size used by the physics engine, such as in [[30 Official Roblox Docs/Workspace/Collisions|collision detection]]. The individual dimensions (length, height, width) can be as low as `0.001` and as high as `2048`. Size dimensions below `0.05` will be **physically** simulated as if the part's dimensions are `0.05`, while visual rendering preserves the actual size.

A part's `Size` is used in a variety of additional ways:

- To influence its mass as given by [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetMass|GetMass()]].
- By [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] to determine the area from which particles are spawned.
- By [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]] to partially determine the rendered rectangular prism.
- By [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] for certain [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|MeshTypes]] to determine the size of the rendered mesh.
- By [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] to determine the space to illuminate.

*Code samples for this member (`Pyramid-Builder`) are published on the source page; their code is not part of the open-source repo.*

### SpecificGravity

> [!warning] Deprecated
> This item is deprecated. See `Class.BasePart.CustomPhysicalProperties` to
> see how to configure the physical properties of BaseParts. Do not use it
> for new work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

The ratio of the part's density to the density of water determined by the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|BasePart.Material]]. Effects the part's behavior when in a water terrain cell. Essentially, SpecificGravity refers to how many times more dense a part is than water.

| Material | SpecificGravity |
| --- | --- |
| **Plastic** | **0.7** |
| **Wood** | **0.35** |
| **Slate** | **2.7** |
| **Concrete** | **2.4** |
| **CorrodedMetal** | **7.85** |
| **DiamondMetal** | **7.85** |
| **Foil** | **7.6** |
| **Grass** | **0.9** |
| **Ice** | **0.91** |
| **Marble** | **2.56** |
| **Granite** | **2.7** |
| **Brick** | **1.92** |
| **Pebble** | **2.4** |
| **Sand** | **1.6** |
| **Fabric** | **0.7** |
| **SmoothPlastic** | **0.7** |
| **Metal** | **7.85** |
| **WoodPlanks** | **0.35** |
| **Cobblestone** | **2.7** |

### TopParamA

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The TopParamA property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurface|BasePart.TopSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurfaceInput|BasePart.TopSurfaceInput]] is set to Sin. It determines the **amplitude** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### TopParamB

> [!warning] Deprecated
> This member is deprecated.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The TopParamB property is relevant when a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurface|BasePart.TopSurface]] is set to Motor or SteppingMotor and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurfaceInput|BasePart.TopSurfaceInput]] is set to Constant or Sin. For Constant, it determines the constant rotational velocity of the motor. For Sin, it determines the **frequency** of the motor's rotational velocity.

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### TopSurface

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|SurfaceType]]

**Thread safety:** ReadSafe · **Category:** Surface · **Loaded/Saved:** true/true

The `TopSurface` property determines the type of surface used for the positive **Y** direction of a part. When two parts' faces are placed next to each other, they may create a joint between them.

### TopSurfaceInput

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/InputType|InputType]]

**Thread safety:** ReadSafe · **Category:** Surface Inputs · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The `TopSurfaceInput` property determines the kind of input provided to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurface|BasePart.TopSurface]]. This is only relevant for Motor or SteppingMotor SurfaceTypes. This property determines how [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopParamA|BasePart.TopParamA]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopParamB|BasePart.TopParamB]] are used. For brevity, these properties will be referred to as ParamA and ParamB, respectively.

- By default, this is set to NoInput. This stops the motor altogether,
- For Constant, the motor rotates at a constant velocity equal to `ParamB`.
- For Sin, the motor rotates at a velocity equal to `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`. See [[30 Official Roblox Docs/API Reference/Classes/Workspace#DistributedGameTime|Workspace.DistributedGameTime]].

*Code samples for this member (`Motor-Control`) are published on the source page; their code is not part of the open-source repo.*

### Transparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true

The `Transparency` property controls the visibility of a part on a scale of `0` to `1` where `0` is completely visible (opaque) and `1` is completely invisible (not rendered at all).

While fully transparent parts are not rendered at all, partially transparent objects have some significant rendering costs. Having many translucent parts may impact performance.

When transparent parts overlap, render order may act unpredictably, so you should avoid semi-transparent parts from overlapping.

See also [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalTransparencyModifier|LocalTransparencyModifier]] as a multiplier to `Transparency` that's only visible to the local client.

*Code samples for this member (`Fade-Door`) are published on the source page; their code is not part of the open-source repo.*

### Velocity

> [!warning] Deprecated
> This property is deprecated. Use `AssemblyLinearVelocity` instead.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `Hidden`, `Deprecated`

The Velocity of a part describes how its [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] is presently changing. The unit of this property is **studs per second**. For reference, the default Roblox character moves at 16 studs per second via [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|Humanoid.WalkSpeed]]. The acceleration due to gravity is found in [[30 Official Roblox Docs/API Reference/Classes/Workspace#Gravity|Workspace.Gravity]] (by default, -196.2 studs per second per second).

Setting the Velocity of a part that is [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|BasePart.Anchored]] will cause it to act like a conveyor belt. Any object that touches the part will begin to move in accordance with the Velocity.

Some [[30 Official Roblox Docs/API Reference/Classes/BodyMover|BodyMover]] objects will apply forces and thus change the Velocity of a part over time. The simplest of these is a [[30 Official Roblox Docs/API Reference/Classes/BodyForce|BodyForce]] which can be used to counteract the acceleration due to gravity on a single part (set the +Y axis of the [[30 Official Roblox Docs/API Reference/Classes/BodyForce#Force|BodyForce.Force]] to the product of the mass ([[30 Official Roblox Docs/API Reference/Classes/BasePart#GetMass|BasePart:GetMass()]]) and the gravity constant).

*Code samples for this member (`Projectile-Firing`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### AngularAccelerationToTorque

```lua
BasePart:AngularAccelerationToTorque(angAcceleration: Vector3, angVelocity: Vector3 = 0, 0, 0): Vector3
```

**Thread safety:** Unsafe

Returns the world-space torque vector that must be applied to the part's assembly to achieve the specified angular acceleration. This result can be used to determine the torque that should be applied via a [[30 Official Roblox Docs/API Reference/Classes/Torque|Torque]] instance or [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyAngularImpulse|BasePart:ApplyAngularImpulse()]].

The calculation uses Euler's rotation equation where _I_ is the assembly's world-space inertia tensor, _α_ is the desired angular acceleration, and _ω_ is the angular velocity.

_τ = I · α + ω × (I · ω)_

If the part is not a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], this method returns a vector of infinity. If the assembly is anchored, it similarly returns a vector of infinity.

#### Gyroscopic Effects

When a spinning assembly has an asymmetric inertia tensor, the torque required to achieve a specified angular acceerlation is augmented due to the changing orientation of the body. The optional `angVelocity` parameter accounts for these gyroscopic effects. If omitted, these gyroscopic effects are omitted from the calculation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `angAcceleration` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The desired angular acceleration vector in world space. |
| `angVelocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | `0, 0, 0` | The current angular velocity of the assembly in world space. Defaults to `(0, 0, 0)`. Supply the assembly's angular velocity to account for gyroscopic effects. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the world-space torque required to produce the specified angular acceleration. |

*Code samples for this member (`BasePart-AngularAccelerationToTorque`) are published on the source page; their code is not part of the open-source repo.*

### ApplyAngularImpulse

```lua
BasePart:ApplyAngularImpulse(impulse: Vector3): ()
```

**Thread safety:** Unsafe

Applies an instant angular force impulse to this part's assembly, causing the assembly to spin.

The resulting angular velocity from the impulse relies on the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass|mass]]. So a higher impulse is required to move more massive assemblies. Impulses are useful for cases where you want a force applied instantly, such as an explosion or collision.

If the part is [[30 Official Roblox Docs/Physics/Network ownership|owned]] by the server, this function must be called from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (not from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]). If the part is owned by a client through **automatic** ownership, this function can be called from either a client script **or** a server script; calling it from a client script for a server-owned part will have no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `impulse` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | An angular impulse vector to be applied to the assembly. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApplyImpulse

```lua
BasePart:ApplyImpulse(impulse: Vector3): ()
```

**Thread safety:** Unsafe

This function applies an instant force impulse to this part's assembly.

The force is applied at the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass|center of mass]], so the resulting movement will only be linear.

The resulting velocity from the impulse relies on the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass|mass]]. So a higher impulse is required to move more massive assemblies. Impulses are useful for cases where you want a force applied instantly, such as an explosion or collision.

If the part is [[30 Official Roblox Docs/Physics/Network ownership|owned]] by the server, this function must be called from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (not from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]). If the part is owned by a client through **automatic** ownership, this function can be called from either a client script **or** a server script; calling it from a client script for a server-owned part will have no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `impulse` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | A linear impulse vector to be applied to the assembly. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApplyImpulseAtPosition

```lua
BasePart:ApplyImpulseAtPosition(impulse: Vector3, position: Vector3): ()
```

**Thread safety:** Unsafe

This function applies an instant force impulse to this part's assembly, at the specified position in world space.

If the position is not at the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyCenterOfMass|center of mass]], the impulse will cause a positional and rotational movement.

The resulting velocity from the impulse relies on the assembly's [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyMass|mass]]. So a higher impulse is required to move more massive assemblies. Impulses are useful for cases where developers want a force applied instantly, such as an explosion or collision.

If the part is [[30 Official Roblox Docs/Physics/Network ownership|owned]] by the server, this function must be called from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] (not from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]). If the part is owned by a client through **automatic** ownership, this function can be called from either a client script **or** a server script; calling it from a client script for a server-owned part will have no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `impulse` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | An impulse vector to be applied to the assembly. |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The position, in world space, to apply the impulse. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BindToCollisionSummaries

```lua
BasePart:BindToCollisionSummaries(callback: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Subscribes `callback` to the contact data that the physics engine generates for this part while detecting collisions. Once per frame, after the simulation has stepped, `callback` receives an array of summaries describing every contact patch this part was involved in during that frame. Each summary reports where the contact occurred, which direction it faced, and how fast the two parts were moving relative to each other at that point.

This method is a separate mechanism from [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]].

Throws an error if `callback` is `nil`, or if the part is not a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

#### Summary Fields

Each entry in the array passed to `callback` is a table with the following keys:

| Key | Type | Summary |
| --- | --- | --- |
| `Time` | `number` | Simulation time, in seconds, of the physics substep that produced this summary. |
| `Part0` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The subscribed part. |
| `Part1` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The other part in the pair, which may be [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]]. |
| `Point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Contact point in world space, averaged across the points in the patch. |
| `Normal` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Unit contact normal for the patch, oriented relative to the subscribed part. |
| `RelativeVelocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Velocity of `Part1` relative to `Part0` at the contact point. |
| `Area` | `number` | Estimated area of the contact patch, in square studs. `0` for a patch of fewer than three points, such as an edge or corner contact. |

`Normal` is oriented relative to the subscribed part rather than to whichever part the engine happened to list first, so if both parts of a pair are subscribed, each subscription receives its own summary with itself as `Part0` and the normal flipped to match.

`RelativeVelocity` is the velocity of `Part1` relative to `Part0`, so the magnitude of its projection onto `Normal` is the speed at which the two parts are approaching or separating head-on, and the component tangential to `Normal` describes sliding and glancing contact.

#### Reporting Behavior

- Contact recording is enabled only while at least one subscription exists anywhere in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], and the cost of it scales with the number of subscribed parts rather than with the total number of collisions in the scene.
- Contacts between multiple sleeping parts do not produce summaries.
- Contacts from Parts with [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] set to `false` do not produce summaries.
- Physics may run several substeps per frame, so a pair that stays in contact across several of them produces up to one summary per patch per substep, all delivered in the same invocation of `callback`. Use `Time` to order them.
- Non-convex collision geometry produces one summary per pair of touching convex hulls, and contact with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] is split further by contact normal, so either can yield several summaries for the same pair within one substep.
- Nothing is replicated. Each client generates summaries for the collisions it owns. See [[30 Official Roblox Docs/Physics/Network ownership|network ownership]].
- Destroying the part disconnects its subscriptions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | Function |  | Invoked with an array of summary tables, at most once per frame, if the part was involved in a collision. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that ends the subscription when disconnected. |

### BreakJoints

> [!warning] Deprecated
> This method is deprecated. To break specific joints, iterate over the
> part's connections using `Class.BasePart:GetJoints()` and call
> `Class.Instance:Destroy()` on the joints you want to remove.

```lua
BasePart:BreakJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Breaks any surface connection with any adjacent part, including [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] and other [[30 Official Roblox Docs/API Reference/Classes/JointInstance|JointInstance]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### breakJoints

> [!warning] Deprecated
> This deprecated function is a variant of `Class.BasePart:BreakJoints()`
> which should be used instead.

```lua
BasePart:breakJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CanCollideWith

```lua
BasePart:CanCollideWith(part: BasePart): boolean
```

**Thread safety:** Safe

Returns whether the parts can collide with each other or not. This function takes into account the collision groups of the two parts. This function will error if the specified part is not a BasePart.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The specified part being checked for collidability. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the parts can collide with each other. |

### CanSetNetworkOwnership

```lua
BasePart:CanSetNetworkOwnership(): Tuple
```

**Thread safety:** Unsafe

The CanSetNetworkOwnership function checks whether you can set a part's network ownership.

The function's return value verifies whether or not you can call [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner|BasePart:SetNetworkOwner()]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwnershipAuto|BasePart:SetNetworkOwnershipAuto()]] without encountering an error. It returns true if you can modify/read the network ownership, or returns false and the reason you can't, as a string.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Whether you can modify or read the network ownership and the reason. |

*Code samples for this member (`BasePart-CanSetNetworkOwnership1`) are published on the source page; their code is not part of the open-source repo.*

### GetClosestPointOnSurface

```lua
BasePart:GetClosestPointOnSurface(position: Vector3): Vector3
```

**Thread safety:** Unsafe

Returns the closest point on the part's surface to the given world-space position. If the provided position is inside the part, it is returned as-is.

For [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances, this method respects the part's [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity|Enum.CollisionFidelity]] value. Return values can differ based on whether the mesh is being treated as a box, a hull, or a more complex shape.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space point to find the closest surface point to. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The closest point on the part's surface in world space. |

### GetConnectedParts

```lua
BasePart:GetConnectedParts(recursive: boolean = False): List<BasePart>
```

**Thread safety:** Safe

Returns a table of parts connected to the object by any kind of rigid joint.

If `recursive` is true this function will return all of the parts in the assembly rigidly connected to the BasePart.

#### Rigid Joints

When a joint connects two parts together `(Part0 → Part1)`, a joint is **rigid** if the physics of `Part1` are completely locked down by `Part0`. This only applies to the following joint types:

- [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]]
- [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]]
- [[30 Official Roblox Docs/API Reference/Classes/ManualWeld|ManualWeld]]
- [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]]
- [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]]
- [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `recursive` | boolean | `False` | A table of parts connected to the object by any kind of [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|joint]]. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] connected to this part by rigid joints. If `recursive` is true, includes all parts in the assembly. |

### GetJoints

```lua
BasePart:GetJoints(): Instances
```

**Thread safety:** Safe

Returns an array of all [[30 Official Roblox Docs/API Reference/Classes/JointInstance|Joints]] and [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] connected to this part that are active in the simulation.

A joint or constraint only becomes active once both of the parts it connects are inside the **same** simulated container, such as [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or a [[30 Official Roblox Docs/API Reference/Classes/WorldModel|WorldModel]]. If one of the connected parts is outside that container — for example, parented to [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]], or in a different [[30 Official Roblox Docs/API Reference/Classes/WorldModel|WorldModel]] — the joint is not activated. **GetJoints()** does not include that joint on either part, even though the joint instance still exists in the data model.

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of all [[30 Official Roblox Docs/API Reference/Classes/JointInstance\|Joints]] and [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]] connected to the part that are active in the simulation. |

### GetMass

```lua
BasePart:GetMass(): float
```

**Thread safety:** Safe

**GetMass** returns the value of the read-only [[30 Official Roblox Docs/API Reference/Classes/BasePart#Mass|Mass]] property.

This function predates the Mass property. It remains supported for backward-compatibility; you should use the Mass property directly.

**Returns**

| Type | Description |
| --- | --- |
| float | The part's mass. |

*Code samples for this member (`BasePart-GetMass1`) are published on the source page; their code is not part of the open-source repo.*

### getMass

> [!warning] Deprecated
> This Camel Case property has been deprecated in favor of its Pascal Case
> variant, `Class.BasePart:GetMass()`.

```lua
BasePart:getMass(): float
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| float |  |

### GetNetworkOwner

```lua
BasePart:GetNetworkOwner(): Instance
```

**Thread safety:** Safe

Returns the current player who is the network owner of this part, or `nil` in case of the server.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The current player who is the network owner of this part, or `nil` in case of the server. |

### GetNetworkOwnershipAuto

```lua
BasePart:GetNetworkOwnershipAuto(): boolean
```

**Thread safety:** Safe

Returns true if the game engine automatically decides the network owner for this part.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the game engine automatically decides the network owner for this part. |

### GetNoCollisionConstraints

```lua
BasePart:GetNoCollisionConstraints(): Instances
```

**Thread safety:** Unsafe

Returns the enabled [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint|NoCollisionConstraint]] objects currently registered for this part in its physics world. A [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint|NoCollisionConstraint]] disables collisions between the two specific parts it references, while each of those parts may still collide with the rest of the world.

The returned array is empty if no such constraint is currently registered for this part. The order of the returned constraints is not guaranteed.

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of the enabled [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint\|NoCollisionConstraint]] objects currently registered for this part in its physics world. |

### GetRenderCFrame

> [!warning] Deprecated
> This item is been deprecated since interpolation is now applied to the
> `Datatype.CFrame` directly. Do not use it for new work.

```lua
BasePart:GetRenderCFrame(): CFrame
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function used to be relevant when Roblox's lag-compensating interpolation of parts online was internal. The interpolation is now applied to the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] directly.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] representing where the part is being rendered, which is now equivalent to the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]]. |

### GetRootPart

> [!warning] Deprecated
> This member is deprecated.

```lua
BasePart:GetRootPart(): Instance
```

**Thread safety:** Safe · **Tags:** `Deprecated`

Returns the base part of an assembly. When moving an assembly of parts using a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]. it is important to move this base part (this will move all other parts connected to it accordingly). More information is available in the [[30 Official Roblox Docs/Physics/Assemblies|Assemblies]] article.

This function predates the [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart|AssemblyRootPart]] property. It remains supported for backwards compatibility, but you should use [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart|AssemblyRootPart]] directly.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The base part of an assembly (a collection of parts connected together). |

### GetTouchingParts

```lua
BasePart:GetTouchingParts(): Instances
```

**Thread safety:** Unsafe

Returns a table of all parts that are physically interacting with this part. If the part itself has CanCollide set to false, then this function returns an empty table unless the part has a [[30 Official Roblox Docs/API Reference/Classes/TouchTransmitter|TouchInterest]] object parented to it (meaning something is connected to its Touched event). Parts that are adjacent but not intersecting are not considered touching. This function predates the [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]] function, which provides more flexibility and avoids the special [[30 Official Roblox Docs/API Reference/Classes/TouchTransmitter|TouchInterest]] rules described above. Use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]] instead.

**Returns**

| Type | Description |
| --- | --- |
| Instances | A table of all parts that intersect and can collide with this part. |

### GetVelocityAtPosition

```lua
BasePart:GetVelocityAtPosition(position: Vector3): Vector3
```

**Thread safety:** Safe

Returns the linear velocity of the part's assembly at the given position relative to this part. It can be used to identify the linear velocity of parts in an assembly other than the root part. If the assembly has no angular velocity, than the linear velocity will always be the same for every position.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space position at which to compute the assembly's linear velocity. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the linear velocity of the assembly at the specified world-space position. |

### IntersectAsync

```lua
BasePart:IntersectAsync(parts: Instances, collisionfidelity: CollisionFidelity = Default, renderFidelity: RenderFidelity = Automatic): Instance
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation|IntersectOperation]] from the intersecting geometry of the part and the other parts in the given array. Only [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] are supported, not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. Similar to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned object has no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]].

The following properties from the calling part are applied to the resulting [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation|IntersectOperation]]:

- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant|MaterialVariant]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]]
- [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]]
- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|Density]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Elasticity|Elasticity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|ElasticityWeight]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Friction|Friction]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|FrictionWeight]]

#### Migration

It is highly recommended to use the newer [[30 Official Roblox Docs/API Reference/Classes/GeometryService#IntersectAsync|GeometryService:IntersectAsync()]] instead of this method. As well as having better performance and more features, the new method differs as follows:

- The output is an array of instances rather than a single instance.
- The input parts do not need to be parented to the scene, allowing for background operations.
- When the `SplitApart` option is set to `true` (default), each distinct body will be returned in its own [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]].
- All the returned parts are in the coordinate space of the main part, so their [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Origin|PVInstance.Origin]] positions are the same as the main part's. This keeps the vertices of the mesh in the same position relative to the object as before the operation, but it does also mean the `(0, 0, 0)` of a returned part is not necessarily at the center of its body.

#### Notes

- The original parts remain intact following a successful intersect operation. In most cases, you should [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] all of the original parts and parent the returned [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation|IntersectOperation]] to the same place as the calling [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].
- By default, the face colors of the resulting intersection are borrowed from the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property of the original parts. To change the entire intersection to a specific color, set its [[30 Official Roblox Docs/API Reference/Classes/PartOperation#UsePartColor|UsePartColor]] property to `true`.
- If an intersect operation would result in a part with more than 20,000 triangles, it will be simplified to 20,000 triangles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `parts` | Instances |  | The objects taking part in the intersection. |
| `collisionfidelity` | [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|CollisionFidelity]] | `Default` | The [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|Enum.CollisionFidelity]] value for the resulting [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation\|IntersectOperation]]. |
| `renderFidelity` | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] | `Automatic` | The [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|Enum.RenderFidelity]] value of the resulting [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Resulting [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation\|IntersectOperation]] with default name **Intersect**. |

### IsGrounded

```lua
BasePart:IsGrounded(): boolean
```

**Thread safety:** Safe

Returns true if the object is connected to a part that will hold it in place (eg an [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] part), otherwise returns false. In an assembly that has an [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] part, every other part is grounded.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the object is connected to a part that will hold it in place. |

### MakeJoints

> [!warning] Deprecated
> SurfaceType based joining is deprecated, do not use MakeJoints for new
> projects. `Class.WeldConstraint|WeldConstraints` and
> `Class.HingeConstraint|HingeConstraints` should be used instead.

```lua
BasePart:MakeJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Creates a joint on any side of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|Part]] that has a [[30 Official Roblox Docs/API Reference/Enums/SurfaceType|Enum.SurfaceType]] that can make a joint it will create a joint with any adjacent parts.

Joints will be created between the sides and any planar touching surfaces, depending on the sides' surfaces.

- Smooth surfaces will not create joints
- Glue surfaces will create a [[30 Official Roblox Docs/API Reference/Classes/Glue|Glue]] joint
- Weld will create a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] joint with any surface except for Unjoinable
- Studs, Inlet, or Universal will each create a [[30 Official Roblox Docs/API Reference/Classes/Snap|Snap]] joint with either of other the other two surfaces (e.g. Studs with Inlet and Universal)
- Hinge and Motor surfaces create [[30 Official Roblox Docs/API Reference/Classes/Rotate|Rotate]] and [[30 Official Roblox Docs/API Reference/Classes/RotateV|RotateV]] joint instances

Unlike [[30 Official Roblox Docs/API Reference/Classes/Model#MakeJoints|Model:MakeJoints()]], this function requires an array of parts as a parameter. This array is given as follows:

```
part:MakeJoints({part1, part2, part3})
```

Joints are broken if enough force is applied to them due to an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]], unless a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] object is parented to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or ancestor [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. For this reason, they are often used to make simple destructible buildings and other models.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### makeJoints

> [!warning] Deprecated
> This deprecated function is a variant of `Class.BasePart:MakeJoints()`
> which should be used instead.

```lua
BasePart:makeJoints(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Resize

```lua
BasePart:Resize(normalId: NormalId, deltaAmount: int): boolean
```

**Thread safety:** Unsafe

Changes the size of an object just like using the Studio resize tool.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  | The side to resize. |
| `deltaAmount` | int |  | How much to grow/shrink on the specified side. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the part is resized. |

### resize

> [!warning] Deprecated
> This deprecated function is a variant of `Class.BasePart:Resize()` which
> should be used instead.

```lua
BasePart:resize(normalId: NormalId, deltaAmount: int): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] |  |  |
| `deltaAmount` | int |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### SetNetworkOwner

```lua
BasePart:SetNetworkOwner(playerInstance: Player = nil): ()
```

**Thread safety:** Unsafe

Sets the given player as network owner for this and all connected parts. When playerInstance is `nil`, the server will be the owner instead of a player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInstance` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | `nil` | The player being given network ownership of the part. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetNetworkOwnershipAuto

```lua
BasePart:SetNetworkOwnershipAuto(): ()
```

**Thread safety:** Unsafe

Lets the game engine dynamically decide who will handle the part's physics (one of the clients or the server).

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SubtractAsync

```lua
BasePart:SubtractAsync(parts: Instances, collisionfidelity: CollisionFidelity = Default, renderFidelity: RenderFidelity = Automatic): Instance
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]] from the part, minus the geometry occupied by the parts in the given array. Only [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] are supported, not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. Similar to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned object has no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]].

Note that the resulting union cannot be empty due to subtractions. If the operation would result in completely empty geometry, it will fail.

#### Migration

It is highly recommended to use the newer [[30 Official Roblox Docs/API Reference/Classes/GeometryService#SubtractAsync|GeometryService:SubtractAsync()]] instead of this method. As well as having better performance and more features, the new method differs as follows:

- The output is an array of instances rather than a single instance.
- The input parts do not need to be parented to the scene, allowing for background operations.
- When the `SplitApart` option is set to `true` (default), each distinct body will be returned in its own [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]].
- All the returned parts are in the coordinate space of the main part, so their [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Origin|PVInstance.Origin]] positions are the same as the main part's. This keeps the vertices of the mesh in the same position relative to the object as before the operation, but it does also mean the `(0, 0, 0)` of a returned part is not necessarily at the center of its body.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `parts` | Instances |  | The objects taking part in the subtraction. |
| `collisionfidelity` | [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|CollisionFidelity]] | `Default` | The [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|Enum.CollisionFidelity]] value for the resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]]. |
| `renderFidelity` | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] | `Automatic` | The [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|Enum.RenderFidelity]] value of the resulting [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] with default name **Union**. |

### TorqueToAngularAcceleration

```lua
BasePart:TorqueToAngularAcceleration(torque: Vector3, angVelocity: Vector3 = 0, 0, 0): Vector3
```

**Thread safety:** Unsafe

Returns the world-space angular acceleration that would result from applying the specified torque to the part's assembly, optionally taking into account gyroscopic effects.

This is the inverse of [[30 Official Roblox Docs/API Reference/Classes/BasePart#AngularAccelerationToTorque|BasePart:AngularAccelerationToTorque()]]. It is useful for predicting how an assembly will respond to an applied torque.

The calculation uses:

**α = I⁻¹ · (τ − ω × (I · ω))**

where **I** is the assembly's world-space inertia tensor, **τ** is the applied torque, and **ω** is the angular velocity.

If the part is not a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], returns `(0, 0, 0)`. If the assembly is anchored, returns `(0, 0, 0)`.

#### Gyroscopic Effects

When a spinning assembly has an asymmetric inertia tensor, the acceleration resulting from an applied torque also depends on the current angular velocity. The `angVelocity` parameter accounts for these gyroscopic effects. If omitted (defaults to zero), the result neglects this contribution from the result.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `torque` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The torque vector applied to the assembly in world space. |
| `angVelocity` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | `0, 0, 0` | The current angular velocity of the assembly in world space. Defaults to `(0, 0, 0)`. Supply the assembly's angular velocity to account for gyroscopic effects. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the resulting angular acceleration in world space. |

*Code samples for this member (`BasePart-TorqueToAngularAcceleration`) are published on the source page; their code is not part of the open-source repo.*

### UnionAsync

```lua
BasePart:UnionAsync(parts: Instances, collisionfidelity: CollisionFidelity = Default, renderFidelity: RenderFidelity = Automatic): Instance
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates a new [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]] from the part, plus the geometry occupied by the parts in the given array. Only [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] are supported, not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. Similar to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned object has no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]].

The following properties from the calling part are applied to the resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]]:

- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant|MaterialVariant]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Reflectance|Reflectance]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]]
- [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]]
- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|Density]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Elasticity|Elasticity]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|ElasticityWeight]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Friction|Friction]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|FrictionWeight]]

#### Migration

It is highly recommended to use the newer [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync|GeometryService:UnionAsync()]] instead of this method. As well as having better performance and more features, the new method differs as follows:

- The output is an array of instances rather than a single instance.
- The input parts do not need to be parented to the scene, allowing for background operations.
- When the `SplitApart` option is set to `true` (default), each distinct body will be returned in its own [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]].
- All the returned parts are in the coordinate space of the main part, so their [[30 Official Roblox Docs/API Reference/Classes/PVInstance#Origin|PVInstance.Origin]] positions are the same as the main part's. This keeps the vertices of the mesh in the same position relative to the object as before the operation, but it does also mean the `(0, 0, 0)` of a returned part is not necessarily at the center of its body.

#### Notes

- The original parts remain intact following a successful union operation. In most cases, you should [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] all of the original parts and parent the returned [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]] to the same place as the calling [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].
- By default, the resulting union respects the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property of each of its parts. To change the entire union to a specific color, set its [[30 Official Roblox Docs/API Reference/Classes/PartOperation#UsePartColor|UsePartColor]] property to `true`.
- If a union operation would result in a part with more than 20,000 triangles, it will be simplified to 20,000 triangles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `parts` | Instances |  | The objects taking part in the union with the calling part. |
| `collisionfidelity` | [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|CollisionFidelity]] | `Default` | The [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|Enum.CollisionFidelity]] value for the resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]]. |
| `renderFidelity` | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] | `Automatic` | The [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|Enum.RenderFidelity]] value of the resulting [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Resulting [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] with default name **Union**. |

## Events

### LocalSimulationTouched

> [!warning] Deprecated
> This event is deprecated in favor of `Class.BasePart.Touched`.

```lua
BasePart.LocalSimulationTouched(part: BasePart)
```

**Tags:** `Deprecated`

Fired when another part comes in contact with another object. This event only sends data to the client notifying it that two parts have collided, whereas [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] sends data to the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The other part that came in contact with this part. |

*Code samples for this member (`BasePart-LocalSimulationTouched1`) are published on the source page; their code is not part of the open-source repo.*

### OutfitChanged

> [!warning] Deprecated
> This event is deprecated. Do not use it for new work.

```lua
BasePart.OutfitChanged()
```

**Tags:** `Deprecated`

Fired if the part's appearance is affected by the [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] class.

### StoppedTouching

> [!warning] Deprecated
> This event is deprecated in favor of `Class.BasePart.TouchEnded`, which
> should be used instead.

```lua
BasePart.StoppedTouching(otherPart: BasePart)
```

**Tags:** `Deprecated`

Deprecated. Fires on the local client when a part stops touching another part, under conditions similar to those of [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]]. This event is the client-only counterpart to [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]]: it only notifies the local client that the two parts have separated, whereas [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] also sends data to the server. Use [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `otherPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The other part that stopped touching the given part. |

### Touched

```lua
BasePart.Touched(otherPart: BasePart)
```

The **Touched** event fires when a part comes in contact with another part. For instance, if **PartA** bumps into **PartB**, then [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|PartA.Touched]] fires with **PartB**, and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|PartB.Touched]] fires with **PartA**.

This event only fires as a result of physical movement, so it will not fire if the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] property was changed such that the part overlaps another part. This also means that at least one of the parts involved must **not** be [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] at the time of the collision.

This event works in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Workspace#TouchesUseCollisionGroups|Workspace.TouchesUseCollisionGroups]] to specify whether [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision groups]] are acknowledged for detection.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `otherPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The other part that came in contact with the given part. |

*Code samples for this member (`Touching-Parts-Count`, `Model-Touched`) are published on the source page; their code is not part of the open-source repo.*

### TouchEnded

```lua
BasePart.TouchEnded(otherPart: BasePart)
```

Fires when a part stops touching another part under similar conditions to those of [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]].

This event works in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Workspace#TouchesUseCollisionGroups|Workspace.TouchesUseCollisionGroups]] to specify whether [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision groups]] are acknowledged for detection.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `otherPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The other part that stopped touching this part. |

*Code samples for this member (`Touching-Parts-Count`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [BasePart](https://create.roblox.com/docs/reference/engine/classes/BasePart) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
