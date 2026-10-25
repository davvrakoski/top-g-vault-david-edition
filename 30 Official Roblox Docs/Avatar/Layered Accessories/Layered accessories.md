---
title: "Layered accessories"
description: "Layered accessories are 3D assets that stretch, fit, and layer over any character body type."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/layered-accessories"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Layered accessories are 3D assets that stretch, fit, and layer over any character body type.*

![](https://www.youtube.com/watch?v=gXXukd6yOSs)

A high-level overview of layered accessories on Roblox.

![](https://www.youtube.com/watch?v=C-DwGRBHvmE)

Create and sell your first basic layered accessory.

**Layered accessories**, often referred to as **layered clothing**, are 3D assets that stretch and fit on an avatar character's body according to their rigging armature and cage meshes. When users purchase layered accessories on the Marketplace, such as jackets, dresses, and cardigans, they expect it to move with the character's animations and layer appropriately on top of existing clothing the character is wearing.

There are three main layers of a layered accessory that structure how the accessory looks and works on the platform:

- **Mesh & textures** that make up the layered accessory's visual appearance.
- **Rigging armature** that determines how the character moves and animates with the layered accessory.
- **Cage meshes & attachments** that determine how the layered accessory stretches, fits, and layers over the character's body.

While you can create most of these layers manually in third-party modeling tools like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), cage meshes and attachments have strict configuration requirements to meet Roblox's technical [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] that guarantee your layered accessories behave consistently from game to game. Before you create your first custom layered accessory, it's recommended to:

1. Understand the [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories#Layered accessory components|essential components]] of a layered accessory and how they work together.
1. Review all [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories#Resources|resources]] that Roblox provides to standardize and expedite the [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories#Creation process|creation process]], such as Blender and Maya project files, Studio tooling, and step-by-step guides.
1. Follow the [[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory|basic layered accessory creation tutorial]] that covers how to create your own avatar-ready sweater from scratch in Blender.

Once you have a custom layered accessory, you can import it into Studio and use the Avatar Setup tool to process your creation into an avatar asset that's ready to be sold on the [[30 Official Roblox Docs/Marketplace/Marketplace overview|Marketplace]].

> [!info]
> Unlike layered accessories that stretch and wrap over a target until it fits over the character's body, rigid accessories don't deform and only attach to a specific point on the avatar. For more information, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|Rigid accessories]].

> [!warning]
> If you are a game developer and are looking for information on manually equipping or configuring layered accessories within a game, such as implementing layered accessories on a non-standard character model, see [[30 Official Roblox Docs/Characters/Character appearance|Character appearance]].

## Layered accessory components

All layered accessories are made up of the same fundamental components that allow users to equip 3D items that stretch, fit, and layer over a target character and existing clothing items with consistent behavior **regardless** of the character's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body scale|body type]].

### Mesh part

*(image in the full Top G Vault)*

*Jumpsuit layered accessory mesh object.*

*(image in the full Top G Vault)*

*Shoulder pads layered accessory mesh object.*

All layered accessories require a single mesh object that represents the accessory's geometry. In Studio, this mesh object is represented as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] nested under a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

### Textures

*(image in the full Top G Vault)*

*2D texture map for the jumpsuit layered accessory.*

*(image in the full Top G Vault)*

*2D texture map for the shoulder pads layered accessory.*

Textures are image files that define the surface appearance of your layered accessory. You can create textures within a texture painting program or 3D modeling software.

In Studio, you must import textures as image files and set them to [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects by a child [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object or the mesh's [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] property.

### Rigging armature

*(image in the full Top G Vault)*

*To ensure the layered accessory can deform with the character's body, it must be weighted to a rigging armature.*

*(image in the full Top G Vault)*

*When the rigging armature is properly set up, the layered accessory moves and bends as the character moves in the 3D space.*

Inside of the avatar's physical body is a non-rendered rigging armature that allows the character to articulate its limbs. Often referred to as joints or bones, a rigging armature includes skinning data that allows connections between limbs to bend organically, such as the character's knees and elbows. In Studio, this rigging and skinning data is saved to the mesh geometry.

The rigging armature also defines how layered accessories move and deform as the character moves in the 3D space. Using rigging and skinning techniques, you can configure areas of your layered accessories to move naturally with the character's joints, such as a shirt sleeve following the natural movement of the character's elbow and shoulder during a walk cycle.

### Cage meshes

*(image in the full Top G Vault)*

*The inner cage defines the inner surface of the clothing item where the clothes wrap over.*

*(image in the full Top G Vault)*

*The outer cage defines the outer surface of the clothing item where any additional clothes can wrap and layer over.*

Cage meshes set the inner and outer surfaces of a layered accessory. For example, the inner cage of a t-shirt defines how a layered accessory t-shirt stretches and fits over a character body, and the outer cage defines how other layered accessories can stretch and fit over the t-shirt itself.

In Studio, these cages are represented by [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] objects.

### Attachments

*(image in the full Top G Vault)*

*The jumpsuit layered accessory's attachment point.*

*(image in the full Top G Vault)*

*The shoulder pads layered accessory's attachment point.*

Attachment points for layered accessories set which body part the accessory is attached to when the character body ragdolls or dismembers in a game. In Studio, attachment points are represented by [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects.

> [!info]
> You can automatically generate attachment points for your layered accessories using the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]].

## Creation process

When designing a layered accessory in [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), you must export all of the avatar components in a single `.fbx` or `.gltf` for import into Studio. Since 3D creation isn't a linear process and always requires reiteration and testing, the process of creating a layered accessory can differ between individuals and various creation workflows.

In general, the creation process follows the following workflow:

*Layered Accessory Workflow*

*(image in the full Top G Vault)*

## Resources

There are a variety of resources available for creators of all backgrounds to get started with layered accessory creation. Review the following table for specific topics and resources:

| Topic | Resources |
| --- | --- |
| Tutorials | [[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory\|Create your first layered accessory]] |
| Reference files | [[30 Official Roblox Docs/Art/Modeling/Modeling project files and references\|Accessory and clothing reference files]] |
| Technical specs | [[30 Official Roblox Docs/Art/Modeling/Export settings\|.FBX export settings]]<br><br>[[30 Official Roblox Docs/Art/Modeling/General specifications\|General mesh specifications]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]] |
| Cosmetic creation | [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Accessories overview]]<br><br>[[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories\|Layered clothing overview]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Create face accessories]]<br><br>[[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace requirements]] |
| Texturing | [[30 Official Roblox Docs/Art/Modeling/Texture specifications\|Texturing requirements]]<br><br>[[30 Official Roblox Docs/Art/Modeling/PBR textures\|PBR textures]] |
| Rigging and skinning | [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|Rigging and skinning overview]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging\|Humanoid rigging requirements]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Rig and skin the head\|Rigging facial bones]]<br><br>[[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Auto skin transfer]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints\|Skin facial bones]] |
| Testing and validation | [[30 Official Roblox Docs/Art/Modeling/Calisthenics Tool\|Calisthenics tool]]<br><br>[[30 Official Roblox Docs/Art/Accessories/Layered Accessory Validation Tool\|Clothing validation tool]] |
| Publishing and Marketplace | [[30 Official Roblox Docs/Marketplace/Publish to Marketplace\|Upload to Marketplace]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions\|Fees and commissions]] |

---
*Source: [Layered accessories](https://create.roblox.com/docs/avatar/layered-accessories) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
