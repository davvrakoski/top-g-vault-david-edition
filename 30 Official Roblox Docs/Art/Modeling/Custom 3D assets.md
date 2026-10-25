---
title: "Custom 3D assets"
description: "External modeling is the use of a third-party modeling software to create custom 3D assets."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*External modeling is the use of a third-party modeling software to create custom 3D assets.*

Meshes are **custom 3D assets** that let you personalize and stylize your game's environment and characters. Unlike parts, which you can directly create in Studio, you need to use a third-party modeling application like [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview) to design and model meshes, then import them into Studio. Studio represents imported meshes as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects, descendants of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] class.

> [!info]
> Many 3D assets are made up of several meshes that are parented to a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.

Meshes typically fall into one of three types of application in games:

- Meshes for **decorating your game's environment**, such as plants, buildings, and vehicles.
- Meshes for **individual body parts** for avatars or non-player characters (NPCs).
- Meshes for **cosmetic accessories** that characters can equip and wear, such as clothing, props, and weapons.

Each mesh type must meet specifications according to how you are going to use the mesh on the platform. For example, while all meshes must meet general mesh specifications, meshes for characters must also meet character specifications that account for rigging and skinning data. For a full list of specifications for different types of meshes, see [[30 Official Roblox Docs/Art/Modeling/Custom 3D assets#Resources|Resources]].

In addition, if you meet certain account requirements, you can publish and sell collections of meshes that are parented to a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object. For example, you can publish avatar-ready models on the Marketplace and earn a commission for each sale, or you can sell models on the Creator Store and earn 100% of net proceeds on each transaction.

> [!info]
> For more information on monetizing meshes, see [Monetize avatar items](https://create.roblox.com/docs/monetize-avatar) and [[30 Official Roblox Docs/Production/Creator Store#Distribute and sell assets|Creator Store - Distribute and sell assets]].

*(image in the full Top G Vault)*

*Use custom meshes and models to give your environments ambiance and depth*

*(image in the full Top G Vault)*

*Design a custom character unique to your game*

*(image in the full Top G Vault)*

*Create custom accessories, clothing, and characters that anyone can wear and use*

## Supported 3D assets

Roblox supports many types of custom 3D assets, as long as they adhere to the [[30 Official Roblox Docs/Art/Modeling/General specifications|general mesh specifications]]. A basic custom 3D asset consists of at least one [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object and one texture:

*(image in the full Top G Vault)*

*A [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object sets the shape and geometry of the 3D asset*

*(image in the full Top G Vault)*

*A texture image map applies a surface appearance and color*

*(image in the full Top G Vault)*

*The mesh and texture combine to make a unique custom 3D asset*

Studio also supports custom 3D assets that include [[30 Official Roblox Docs/Art/Modeling/Custom 3D assets#Rigging and skinning|rigging and skinning]] data, [[30 Official Roblox Docs/Art/Modeling/Custom 3D assets#PBR textures|PBR textures]], and other [[30 Official Roblox Docs/Art/Modeling/Custom 3D assets#Studio-related objects|Studio-related objects]] like cage meshes and attachments. Many of these various components are required if you are creating avatar character models or accessories.

### Rigging and skinning

A **rigged mesh** is a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object with an internal poseable skeleton rig and bone structure. Rigged meshes allow mesh surfaces to rotate and move where internal bone joints are placed within a model, such as a character's knee or elbow. Skinning a rigged mesh allows the mesh to bend organically, imitating the natural way joints would move in real life.

[Video: Head-Rigid-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Rigid-Example.mp4)

*Without skinning, the entire head mesh rotates on a single axis*

[Video: Head-Skinned-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Head-Skinned-Example.mp4)

*With skinning, the head mesh bends naturally at the neck, and the bottom of the neck stays connected to the torso*

For more information on rigging and skinning, see [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning|Rigging and skinning]].

### PBR textures

**Physically-Based rendering** (PBR) textures allow you to represent realistic shading and lighting by using multiple types of texture images, or **maps**, on a single 3D asset. Combining multiple texture maps can more accurately simulate color, roughness, and reflectivity in any lighting environment, and can enhance the visual elements of your assets and environment.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

For more information on PBR textures, see [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]].

### Studio-related objects

Studio automatically converts certain types of objects found in 3D modeling files as specific workspace objects in the game. These are typically used when creating a character or accessory, and configuring these in your modeling software can sometimes be the primary way of correctly setting up these Studio objects.

The following objects are automatically created in Studio if they are detected by the 3D Importer:

- [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] - Created when Studio detects mesh objects that include `_Att` at the end of their name.
- [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] - Created when Studio detects mesh objects that include `_OuterCage` at the end of their name.
- [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] - Created when Studio detects a mesh object with `_InnerCage` and similarly named mesh object with `_OuterCage` at the end of their names.
- [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] - Created when Studio detects an avatar character head and the appropriate facial animation data in the model.

For more information on how the [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] objects reshape and layer meshes, see [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Cage meshes|Cage meshes]].

## Resources

There are a variety of resources available for creators of all backgrounds to get started with custom 3D assets.

If you are interested in specific avatar creation topics, use the following table to find guides and resources that best match your needs:

| Topic | Resources |
| --- | --- |
| Reference files | [[30 Official Roblox Docs/Art/Modeling/Modeling project files and references\|Example models, project kits, and templates]] |
| Technical specs | [[30 Official Roblox Docs/Art/Modeling/Export settings\|.FBX export settings]]<br><br>[[30 Official Roblox Docs/Art/Modeling/General specifications\|General mesh specifications]]<br><br> [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications\|Avatar specifications]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]] |
| Bodies and clothing creation | [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Accessories overview]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies\|Bodies overview]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Face accessory creation]]<br><br>[[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace requirements]] |
| Texturing | [[30 Official Roblox Docs/Art/Modeling/Texture specifications\|Texture specifications]]<br><br>[[30 Official Roblox Docs/Art/Modeling/PBR textures\|PBR textures]] |
| Rigging and skinning | [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|Rigging and skinning overview]]<br><br>[[30 Official Roblox Docs/Art/Modeling/Rig a simple mesh\|Basic mesh rigging]] <br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Rig and skin the head\|Facial bone rigging]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints\|Facial bone skinning]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging\|Avatar rigging requirements]]<br><br>[[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Automatic skinning transfer]] |
| Facial animation and live heads | [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads\|Basic head creation]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Face accessory creation]]<br><br>[[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference\|FACS pose references]] |
| Testing and validation | [[30 Official Roblox Docs/Art/Modeling/Calisthenics Tool\|Calisthenics Tool]]<br><br>[[30 Official Roblox Docs/Art/Accessories/Layered Accessory Validation Tool\|Clothing Validation Tool]] |
| Publishing and Marketplace | [[30 Official Roblox Docs/Marketplace/Publish to Marketplace\|Upload to Marketplace]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions\|Fees and commissions]] |

---
*Source: [Custom 3D assets](https://create.roblox.com/docs/art/modeling) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
