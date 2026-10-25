---
title: "Sleep system"
description: "Explore how the sleep system automatically prevents unnecessary simulation of non-moving parts."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/sleep-system"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore how the sleep system automatically prevents unnecessary simulation of non-moving parts.*

Each [[30 Official Roblox Docs/Physics/Assemblies|assembly]] in the Roblox Engine corresponds to a single **rigid body**. The position and velocity of each rigid body describe where it's located and how fast it's moving, and one of the primary engine tasks is to update the positions and velocities of each assembly.

Assemblies can be connected together with [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] and [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]] to form mechanisms such as cars or airplanes. As the number of assemblies and constraints in a mechanism increases, the time required to simulate the mechanism also increases. Fortunately, this increase is offset when the **sleep system** determines that the engine can skip simulation of non‑moving assemblies.

## Sleep states

Each assembly can be in one of three states: [[30 Official Roblox Docs/Physics/Sleep system#Awake|awake]], [[30 Official Roblox Docs/Physics/Sleep system#Sleeping|sleeping]], or [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking|sleep‑checking]].

### Awake

An **awake** assembly is moving or accelerating, and is therefore simulated. Assemblies enter this state from situations outlined in [[30 Official Roblox Docs/Physics/Sleep system#Sleeping|sleeping]] and [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking|sleep‑checking]], as well as [[30 Official Roblox Docs/Physics/Sleep system#Additional wake situations|additional wake situations]].

### Sleeping

A **sleeping** assembly is neither moving nor accelerating, and is therefore not simulated.

An assembly is determined to be non-moving by checking its **linear velocity** and **rotational velocity**. If its linear velocity is less than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Linear Velocity]] threshold and its rotational velocity is less than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Rotational Velocity]] threshold, the assembly is considered to be non-moving.

In some cases, simply checking for non-movement would cause an assembly to incorrectly enter the sleeping state. For example, if a ball is thrown straight up, its velocity approaches zero as it reaches its maximum height, making it a candidate to sleep and never fall back down. To handle such cases, the engine considers an assembly to be accelerating if its **linear acceleration** or **rotational acceleration** are greater than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Linear Acceleration]] and [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Rotational Acceleration]] thresholds, respectively, and will prevent the assembly from falling asleep.

> [!info]
> If an assembly falls asleep when you expect it to remain awake, it's commonly because the assembly is moving too slowly. In addition to automatic checks outlined in [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking|sleep‑checking]] and [[30 Official Roblox Docs/Physics/Sleep system#Sleeping|sleeping]], you can forcibly wake up an assembly through the conditions outlined in [[30 Official Roblox Docs/Physics/Sleep system#Additional wake situations|additional wake situations]].

### Sleep-checking

A non-moving assembly that shares a constraint with at least one [[30 Official Roblox Docs/Physics/Sleep system#Awake|awake]] neighboring assembly is put into the **sleep-checking** state and is not simulated. On each worldstep, a sleep-checking assembly checks whether:

- Its **linear acceleration** is greater than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Wake Linear Acceleration]] threshold.
- Its **rotational acceleration** is greater than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Wake Rotational Acceleration]] threshold.
- A neighboring assembly's **linear velocity** is greater than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Neighbor Linear Velocity]] threshold.
- A neighboring assembly's **rotational velocity** is greater than the [[30 Official Roblox Docs/Physics/Sleep system#Threshold reference|Neighbor Rotational Velocity]] threshold.

If any of these conditions is true, or under any of the [[30 Official Roblox Docs/Physics/Sleep system#Additional wake situations|additional wake situations]], the sleep-checking assembly enters the [[30 Official Roblox Docs/Physics/Sleep system#Awake|awake]] state.

## Threshold reference

The following table provides the various velocity and acceleration thresholds used to determine if an assembly is moving or accelerating.

| Threshold | Value | State change |
| --- | --- | --- |
| Linear Velocity | 0.33 studs/s | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |
| Rotational Velocity | 0.42 studs/s | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |
| Linear Acceleration | 0.24 studs/s² | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |
| Rotational Acceleration | 0.24 studs/s² | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |
| Neighbor Linear Velocity | 0.48 studs/s | [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking\|sleep-checking]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] |
| Neighbor Rotational Velocity | 0.59 studs/s | [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking\|sleep-checking]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] |
| Wake Linear Acceleration | 16.9 studs/s² | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |
| Wake Rotational Acceleration | 16.9 studs/s² | [[30 Official Roblox Docs/Physics/Sleep system#Awake\|awake]] ⟩ [[30 Official Roblox Docs/Physics/Sleep system#Sleeping\|sleeping]] |

Rotational velocity and acceleration thresholds reflect the velocity and acceleration of a point located on the assembly bounding sphere (a sphere that contains all of the parts in an assembly) that moves rigidly with the assembly.

> [!info]
> For a given angular velocity, the rotational velocity of an assembly is proportional to the assembly bounding sphere radius. This means that larger assemblies can rotate at a lower angular velocity without falling asleep.

## Actuated joints

Sometimes developers want to move parts very slowly using an **actuated joint**, a constraint that applies force or motion to drive connected parts, such as a [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint|HingeConstraint]] using a [[30 Official Roblox Docs/API Reference/Enums/ActuatorType|Motor]]. To support these scenarios, assemblies connected to actuated joints use a stricter sleep velocity threshold. This delays when those assemblies fall asleep, allowing slow, controlled motion without the physics system prematurely putting them to sleep.

The following are considered actuated joints:

| Constraint | Configuration | Required nonzero properties |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation\|AlignOrientation]] | [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#RigidityEnabled\|RigidityEnabled]] = `false` | • [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxAngularVelocity\|MaxAngularVelocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#MaxTorque\|MaxTorque]]<br>• [[30 Official Roblox Docs/API Reference/Classes/AlignOrientation#Responsiveness\|Responsiveness]] |
| [[30 Official Roblox Docs/API Reference/Classes/AlignPosition\|AlignPosition]] | [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#RigidityEnabled\|RigidityEnabled]] = `false` | • [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#MaxVelocity\|MaxVelocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/AlignPosition#Responsiveness\|Responsiveness]] |
| [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity\|AngularVelocity]] | — | • [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#AngularVelocity\|AngularVelocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/AngularVelocity#MaxTorque\|MaxTorque]] |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint\|AnimationConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic\|IsKinematic]] = `false` | • [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce\|MaxForce]]<br>• [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque\|MaxTorque]] |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint\|CylindricalConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] | • [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity\|Velocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxAcceleration\|MotorMaxAcceleration]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxForce\|MotorMaxForce]] |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] | • [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Speed\|Speed]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ServoMaxForce\|ServoMaxForce]]<br>• [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint\|Responsiveness]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint\|CylindricalConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType\|AngularActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] | • [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularVelocity\|AngularVelocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxAngularAcceleration\|MotorMaxAngularAcceleration]]<br>• [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#MotorMaxTorque\|MotorMaxTorque]] |
| [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularActuatorType\|AngularActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] | • [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#AngularSpeed\|AngularSpeed]]<br>• [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint#ServoMaxTorque\|ServoMaxTorque]]<br>• [[30 Official Roblox Docs/API Reference/Classes/CylindricalConstraint\|Responsiveness]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] | • [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularVelocity\|AngularVelocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxAcceleration\|MotorMaxAcceleration]]<br>• [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#MotorMaxTorque\|MotorMaxTorque]] |
| [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] | • [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#AngularSpeed\|AngularSpeed]]<br>• [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint#ServoMaxTorque\|ServoMaxTorque]]<br>• [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|Responsiveness]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity\|LinearVelocity]] | [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] = [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Line]] | • [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#LineVelocity\|LineVelocity]]<br>• If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]], also [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxForce\|MaxForce]] |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] = [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Plane]] | • [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#PlaneVelocity\|PlaneVelocity]]<br>• If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]]: • [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|Magnitude]]: [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxForce\|MaxForce]]<br>• [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|PerAxis]]: [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxPlanarAxesForce\|MaxPlanarAxesForce]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VelocityConstraintMode\|VelocityConstraintMode]] = [[30 Official Roblox Docs/API Reference/Enums/VelocityConstraintMode\|Vector]] | • [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#VectorVelocity\|VectorVelocity]]<br>• If [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#ForceLimitsEnabled\|ForceLimitsEnabled]]: • [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|Magnitude]]: [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxForce\|MaxForce]]<br>• [[30 Official Roblox Docs/API Reference/Enums/ForceLimitMode\|PerAxis]]: [[30 Official Roblox Docs/API Reference/Classes/LinearVelocity#MaxAxesForce\|MaxAxesForce]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint\|PrismaticConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Motor]] | • [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Velocity\|Velocity]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxAcceleration\|MotorMaxAcceleration]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#MotorMaxForce\|MotorMaxForce]] |
| [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ActuatorType\|ActuatorType]] = [[30 Official Roblox Docs/API Reference/Enums/ActuatorType\|Servo]] | • [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#Speed\|Speed]]<br>• [[30 Official Roblox Docs/API Reference/Classes/SlidingBallConstraint#ServoMaxForce\|ServoMaxForce]]<br>• [[30 Official Roblox Docs/API Reference/Classes/PrismaticConstraint\|Responsiveness]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint\|RopeConstraint]] | [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchEnabled\|WinchEnabled]] = `true` | • [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchForce\|WinchForce]]<br>• [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint#WinchSpeed\|WinchSpeed]] |

## Additional wake situations

In addition to situations outlined in [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking|sleep‑checking]] and [[30 Official Roblox Docs/Physics/Sleep system#Sleeping|sleeping]], an assembly enters the [[30 Official Roblox Docs/Physics/Sleep system#Awake|awake]] state when:

- It collides with another assembly moving faster than 1 studs/s.
- Any physics-related property of any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the assembly changes, including:

  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyLinearVelocity|AssemblyLinearVelocity]]/[[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyAngularVelocity|AssemblyAngularVelocity]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]]/[[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch|CanTouch]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#CustomPhysicalProperties|CustomPhysicalProperties]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#EnableFluidForces|EnableFluidForces]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#Massless|Massless]]
  - [[30 Official Roblox Docs/API Reference/Classes/BasePart#RootPriority|RootPriority]]

- A non-zero impulse is applied to any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the assembly via [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulse|ApplyImpulse()]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyImpulseAtPosition|ApplyImpulseAtPosition()]], or [[30 Official Roblox Docs/API Reference/Classes/BasePart#ApplyAngularImpulse|ApplyAngularImpulse()]].

- Any physics-related property changes on the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] that would affect the assembly, including:

  - [[30 Official Roblox Docs/API Reference/Classes/Workspace#Gravity|Gravity]]
  - [[30 Official Roblox Docs/API Reference/Classes/Workspace#FluidForces|FluidForces]]
  - [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|GlobalWind]]
  - [[30 Official Roblox Docs/API Reference/Classes/Workspace#AirDensity|AirDensity]]

- A new [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] is created with an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the assembly.

- Any property changes for a [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] with an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the assembly.

- The [[30 Official Roblox Docs/API Reference/Classes/Motor#CurrentAngle|CurrentAngle]] property changes for a [[30 Official Roblox Docs/API Reference/Classes/Motor|Motor]] that is connected to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the assembly.

- The assembly contains a [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] with a seated player character.

- The assembly is within the [[30 Official Roblox Docs/API Reference/Classes/Explosion#BlastRadius|BlastRadius]] of an [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosion]].

## Debug visualization

During playtesting, you can visualize assembly sleep states by toggling on **Awake parts** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

*(image in the full Top G Vault)*

Once enabled, simulated parts will be outlined by their current sleep state, with [[30 Official Roblox Docs/Physics/Sleep system#Awake|awake]] parts outlined in red, [[30 Official Roblox Docs/Physics/Sleep system#Sleep-checking|sleep‑checking]] parts outlined in orange, and [[30 Official Roblox Docs/Physics/Sleep system#Sleeping|sleeping]] parts un‑outlined.

[Video: Sleep-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/assemblies/Sleep-Demo.mp4)

*Simulated parts outlined by the color representing their current sleep state*

---
*Source: [Sleep system](https://create.roblox.com/docs/physics/sleep-system) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
