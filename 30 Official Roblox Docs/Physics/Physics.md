---
title: "Physics"
description: "Overview of Roblox's rigid body physics engine, assemblies, and constraints."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Overview of Roblox's rigid body physics engine, assemblies, and constraints.*

Roblox uses a rigid body physics engine. [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are subject to physical forces as long as they are not [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]]. You can create physical [[30 Official Roblox Docs/Physics/Physics#Assemblies|assemblies]] using attachments and constraints, and you can detect and control [[30 Official Roblox Docs/Physics/Physics#Collisions|collisions]] between objects using events and collision filtering.

## Assemblies

An [[30 Official Roblox Docs/Physics/Assemblies|assembly]] is one or more [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] connected by rigid constraints or motors (animated rigid joints). Assemblies can be set to an initial linear or angular velocity, or their behavior can be affected through [[30 Official Roblox Docs/Physics/Physics#Constraints|constraints]].

*(image in the full Top G Vault)*

*1 assembly; 1 part*

*(image in the full Top G Vault)*

*1 assembly; 18 parts*

*(image in the full Top G Vault)*

*1 assembly; 179 parts*

## Constraints

Non-anchored assemblies react to force from gravity and collisions, but physical force can also be applied and simulated through [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] or [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]].

### Mechanical

Mechanical constraints include familiar objects like [[30 Official Roblox Docs/Physics/Constraints/Hinge|hinges]], [[30 Official Roblox Docs/Physics/Constraints/Spring|springs]], and [[30 Official Roblox Docs/Physics/Constraints/Rope|ropes]] which can be used to build mechanisms. Each is summarized in the [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] guide.

[Video: Spring-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Spring-Demo.mp4)

### Mover

Mover constraints apply velocity, force, or torque to assemblies, align assemblies by position or orientation, and more. Each is summarized in the [[30 Official Roblox Docs/Physics/Mover constraints|mover constraints]] guide.

[Video: Torque-RelativeTo-Attachment0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/constraints/Torque-RelativeTo-Attachment0.mp4)

## Collisions

Collision events automatically occur when two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] touch or stop touching in the 3D world. You can [[30 Official Roblox Docs/Workspace/Collisions|detect]] these collisions through the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|TouchEnded]] events which occur regardless of either part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]] property value.

Through [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision filtering]] techniques such as collision groups or part‑to‑part filtering, you can control which physical assemblies collide with others.

See the [[30 Official Roblox Docs/Workspace/Collisions|collisions]] guide for more details on detecting and filtering collisions.

## Network ownership

In order to support complex physical mechanisms while also aiming for a smooth and responsive experience for players, the Roblox physics engine utilizes a **distributed physics** system in which computations are distributed between the server and all connected clients. Within this system, the engine assigns **network ownership** of physically simulated [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] to either a client or server to divide the work of calculating physics. See the [[30 Official Roblox Docs/Physics/Network ownership|network ownership]] guide for further details.

## Adaptive timestepping

The engine emphasizes best performance by automatically assigning assemblies to one of three simulation rates. For scenarios featuring complex mechanisms like tanks, you can improve stability by setting a fixed timestep. See the [[30 Official Roblox Docs/Physics/Adaptive timestepping|adaptive timestepping]] guide for more information.

## Sleep system

When an assembly is not moving or accelerating, the Roblox physics engine improves performance by automatically stops simulating the assembly. See the [[30 Official Roblox Docs/Physics/Sleep system|sleep system]] guide for details.

---
*Source: [Physics](https://create.roblox.com/docs/physics) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
