---
title: "Rigging and skinning"
description: "Rigging and skinning is a modeling process that connects an armature to a mesh, allowing it to be animated or posed in Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/rigging"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Rigging and skinning is a modeling process that connects an armature to a mesh, allowing it to be animated or posed in Studio.*

**Rigging** is the process of connecting a mesh with an internal poseable skeleton rig and bone structure. Rigged meshes allow mesh surfaces to rotate and move where internal bones are placed within the model during the modeling process. Rigging is often performed in conjunction with **skinning**, creating a natural looking stretch and bend when models are animated or repositioned. You can create rigged meshes with third-party software such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview).

[Video: Transform-Demo-Default.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Transform-Demo-Default.mp4)

*A normal model can only rotate on its pivot point.*

[Video: Transform-Demo-Skinned.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Transform-Demo-Skinned.mp4)

*A rigged model (or mesh) can rotate with any bone of its associated rig.*

[Video: Head-Rigid-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Rigid-Example.mp4)

*A rigged model with no skinning data.*

[Video: Head-Skinned-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Skinned-Example.mp4)

*A skinned model that bends organically with the bone rotation.*

See the following resources to learn the basics and intermediate steps required to skin models in Blender:

- [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh|Rig a simple mesh]]
- [[30 Official Roblox Docs/Art/Modeling/Skin a simple mesh|Skin a simple mesh]]
- [[30 Official Roblox Docs/Art/Modeling/Rig a humanoid model|Rig a humanoid model]]
- [[30 Official Roblox Docs/Art/Modeling/Skin a humanoid model|Skin a humanoid model]]

## Rigs and bones

The **rig**, or bone structure, within a rigged mesh creates additional poseable points for the 3D model in Studio. By rotating or moving the bones of a mesh, the parts of the mesh assigned to those bones can move independently from the rest of the mesh. The assignment of influence between meshes and bones, such as a **LowerLeftArm** bone driving the movement of the **LowerLeftArm** geometry, is set in a third-party application like Blender or Maya. When imported into Studio, Roblox saves this influence assignment data to the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] asset data.

Once you successfully [[30 Official Roblox Docs/Parts/Meshes#Import meshes|import]] a rigged mesh model into Studio, Studio represents this rig structure with [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] instances that you can then pose and animate. You can view bones in Studio by enabling **Show Constraint Details** from the **View** menu, or when you are using the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]].

> [!info]
> When [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] objects are used in animation, they affect the appearance of the parts but don't change the physical shape in cases such as [[30 Official Roblox Docs/Workspace/Collisions|collision detection]].

*(image in the full Top G Vault)*

*Constraint Details enabled*

*(image in the full Top G Vault)*

*When using the Animation Editor*

## Types of rigs

Rigged models use a naming convention starting with "R" and ending with the number of individual meshes that make up the model. This is used to quickly identify the type and number of meshes that a model has. Although R6 and R15 models are common, a model can be of varying subjects, sizes and can have any number of individual meshes, such as a R5, R20, or R200.

- **R1** refers to a single mesh that is rigged, or associated with an internal skeleton structure. Many models, such as a tree or accessory item, are good candidates to be made into an R1 model. Even NPC humanoid characters can be created as R1 models, but they will not be able to take full advantage of the animation and humanoid options available for R15 characters.

  See [[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh|Rig a simple mesh]] for instructions on turning a basic mesh into an R1 model in Blender.

- **R15** typically refers to humanoid models used as player or avatar characters. An R15 model is made up of 15 specific meshes that are parented to a single [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rig]]. An R15 character model often includes skinning data to allow the model to bend and pose naturally. Roblox uses the R15 standard for all avatars, and requires the [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|technical specifications]] to ensure universal behavior and quality.

  See [[30 Official Roblox Docs/Art/Modeling/Rig a humanoid model|Rig a humanoid model]] for instructions on turning a character model into an R15 humanoid model in Blender.

---
*Source: [Rigging and skinning](https://create.roblox.com/docs/art/modeling/rigging) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
