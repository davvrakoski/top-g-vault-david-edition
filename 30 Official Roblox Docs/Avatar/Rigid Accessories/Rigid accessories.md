---
title: "Rigid accessories"
description: "Rigid accessories are 3D assets that attach to an avatar according to the attachment points around the character's body."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/rigid-accessories"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Rigid accessories are 3D assets that attach to an avatar according to the attachment points around the character's body.*

![](https://www.youtube.com/watch?v=tzPn6QvU8Bo)

A high-level overview of rigid accessories on Roblox.

![](https://www.youtube.com/watch?v=Eed29gV0hLA)

Create and sell your first basic rigid accessory.

**Rigid accessories** are 3D objects that attach to attachment points around an avatar character's body. When users purchase rigid accessories on the [Marketplace](https://www.roblox.com/catalog), such as props, weapons, and hats, they can adjust the position and rotation of the item away from the attachment point according to their avatar's body type.

There are two main layers of a rigid accessory that structure how the accessory looks and works on the platform:

- **Mesh & textures** that make up the rigid accessory's visual appearance.
- **Attachments** that determine how the accessory attaches to the character's body.

While you can create the first of these layers manually in third-party modeling tools like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), attachments have strict configuration requirements to meet Roblox's technical [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|rigid accessory specifications]] that guarantee your rigid accessories behave consistently from game to game. Before you create your first custom rigid accessory, it's recommended to:

1. Understand the [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Rigid accessory components|essential components]] of a rigid accessory and how they work together.
1. Review all [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Resources|resources]] that Roblox provides to standardize and expedite the [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Creation process|creation process]], such as Blender and Maya project files, Studio tooling, and step-by-step guides.
1. Follow the [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Create your first rigid accessory|basic rigid accessory creation tutorial]] that covers how to convert a simple 3D model into a rigid accessory.

Once you have a custom rigid accessory, you can import it into Studio and use the Avatar Setup tool to process your creation into an avatar asset that's ready to be sold on the [[30 Official Roblox Docs/Marketplace/Marketplace overview|Marketplace]].

> [!info]
> Unlike rigid accessories that don't deform when they attach to a specific point on the avatar, layered accessories stretch and wrap over a target until it fits over the character's body. For more information, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|Layered accessories]].

## Rigid accessory components

All rigid accessories are made up of the same fundamental components that allow users to equip 3D items with consistent behavior **according** to the character's [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#Body scale|body type]].

> [!warning]
> Layered accessories require [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|additional components]] to apply the layerable effect to the 3D item.

### Mesh part

*(image in the full Top G Vault)*

*Bow rigid accessory mesh object.*

*(image in the full Top G Vault)*

*Hair rigid accessory mesh object.*

All rigid accessories require a single mesh object that represents the accessory's geometry. In Studio, this mesh object is represented as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] nested under a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

### Textures

*(image in the full Top G Vault)*

*2D texture map for the bow rigid accessory.*

*(image in the full Top G Vault)*

*2D texture map for the hair rigid accessory.*

Textures are image files that define the surface appearance of your rigid accessory. You can create textures within a texture painting program or 3D modeling software.

In Studio, you must import textures as image files and set them to [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects by a child [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object or the mesh's [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] property.

### Attachments

*(image in the full Top G Vault)*

*The bow's attachment point enables the bow to connect to a character's back.*

*(image in the full Top G Vault)*

*The hair's attachment point enables the hair to connect to a character's head.*

Attachment points define where accessories attach to a character's body. In Studio, attachment points are represented by [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects.

> [!info]
> You can automatically generate attachment points for your rigid accessories using the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]].

## Creation process

When designing a rigid accessory in [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), you must export all of the avatar components in a single `.fbx` or `.gltf` for import into Studio. Since 3D creation isn't a linear process and always requires reiteration and testing, the process of creating a rigid accessory can differ between individuals and various creation workflows.

In general, the creation process follows the following workflow:

*Rigid Accessory Workflow*

*(image in the full Top G Vault)*

## Resources

There are a variety of resources available for creators of all backgrounds to get started with rigid accessory creation. Review the following table for specific topics and resources:

| Topic | Resources |
| --- | --- |
| Tutorials | [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Create your first rigid accessory\|Rigid accessory creation]] |
| Reference files | [[30 Official Roblox Docs/Art/Modeling/Modeling project files and references\|Accessory and clothing reference files]] |
| Technical specs | [[30 Official Roblox Docs/Art/Modeling/Export settings\|.FBX export settings]]<br><br>[[30 Official Roblox Docs/Art/Modeling/General specifications\|General mesh specifications]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Rigid accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]] |
| Cosmetic creation | [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Rigid accessories overview]]<br><br>[[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories\|Layered clothing overview]]<br><br><br>[[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Rigid accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace requirements]] |
| Texturing | [[30 Official Roblox Docs/Art/Modeling/Texture specifications\|Texturing requirements]]<br><br>[[30 Official Roblox Docs/Art/Modeling/PBR textures\|PBR textures]] |
| Rigging and skinning | [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|Rigging and skinning overview]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging\|Humanoid rig requirements]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Rig and skin the head\|Rig facial bones]]<br><br>[[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Automatic Skin Transfer]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints\|Skin facial bones]] |
| Publishing and Marketplace | [[30 Official Roblox Docs/Marketplace/Publish to Marketplace\|Uploading to Marketplace]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace Policy]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions\|Fees and commissions]] |

---
*Source: [Rigid accessories](https://create.roblox.com/docs/avatar/rigid-accessories) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
