---
title: "Character bodies"
description: "All Roblox users are represented by an avatar character which can be customized with body parts, accessories, and clothes from the Marketplace or within games."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/character-bodies"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*All Roblox users are represented by an avatar character which can be customized with body parts, accessories, and clothes from the Marketplace or within games.*

![](https://www.youtube.com/watch?v=2My8jE47clI)

**Character bodies** for avatars are models with technical components that work together to create a character that can interact with objects in the 3D space and wear cosmetics, clothing, and accessories. There are four main layers of the avatar body that structure how the character looks and moves on the platform:

- **Body parts & textures** that make up the character's visual appearance.
- **Rigging armature** that determines how the character moves.
- **Facial animation data** in the character's head that expresses the character's personality and emotions.
- **Cage meshes & attachments** that determine how the character attaches accessories and wears clothing.

While you can create each of these layers manually in third-party modeling tools like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), some have strict configuration requirements to meet Roblox's technical [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character specifications]] that guarantee your avatar behaves consistently from game to game. Before you create your first custom character body, it's recommended to:

1. Understand the [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Character body components|essential components]] of an avatar's character body and how they work together on the platform.
1. Review all [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Resources|resources]] that Roblox provides to standardize and expedite the [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Creation process|creation process]], such as Blender and Maya project files, Studio tooling, and step-by-step guides.
1. Follow the [[30 Official Roblox Docs/Art/Characters/Creating/Create with templates|basic character creation tutorial]] that uses Roblox templates in collaboration with common Blender modeling and texturing tools.

Once you have a custom character body model, you can import it into Studio and use the Avatar Setup tool to process your creation into an avatar asset that's ready to be sold on the [[30 Official Roblox Docs/Marketplace/Marketplace overview|Marketplace]].

## Character body components

All character bodies for avatars are made up of several fundamental components that provide users the functionality and flexibility to interact with their world. Many of these components are never made visible to the user, but they enable powerful avatar features that enhance social and environmental interactions. When creating avatar characters, all of these components are typically created first in your modeling software and then converted to their appropriate Roblox Studio instance on import.

Each avatar character is made up of the following rendered and non-rendered components:

### Rendered

*(image in the full Top G Vault)*

*15 separate body part meshes make up the shape and contours of the character.*

*(image in the full Top G Vault)*

*Texture image maps apply a surface color and appearance to the character's skin.*

### Non-Rendered

*(image in the full Top G Vault)*

*A rigging armature allows the body parts to properly connect with each other, driving movement, expressions, and animations.*

*(image in the full Top G Vault)*

*Facial animation data allows avatars to express virtually all types of facial expressions for chatting and socializing.*

*(image in the full Top G Vault)*

*Cage meshes define the surface where layered accessories can wrap and stretch over.*

*(image in the full Top G Vault)*

*Attachment points define where rigid accessories attach to a character.*

### Body parts

*(image in the full Top G Vault)*

*Each avatar character is made up of 15 separate mesh objects*

*(image in the full Top G Vault)*

*These meshes must follow a standard naming convention*

An avatar's physical body geometry is made up of 15 separate mesh body parts that define the shape and contours of the character:

- Head
- Upper and lower torso
- Left upper arm, lower arm, and hand
- Right upper arm, lower arm, and hand
- Left upper leg, lower leg, and foot
- Right upper leg, lower leg, and foot

In Studio, these geometries are represented as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects and are nested under a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

### Textures

*(image in the full Top G Vault)*

*Textures apply color and surface details to your character model.*

*(image in the full Top G Vault)*

*A texture image map's opacity can combine with the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] to apply custom skin tones to characters.*

Textures are image files that define the surface appearance of your character. You can create textures using a texture painting program or 3D modeling software. In Studio, you must import textures as image files and set them to [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects by a child [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object or the mesh's [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] property.

> [!warning]
> When texturing parts of your character model's body, ensure that your character model includes a modesty layer over sensitive regions. See [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410#safety) for more information on Roblox's policies.

### Rigging armature

*(image in the full Top G Vault)*

*The rigging armature includes at least 16 bones, 1 for each body part and a root bone. Higher-fidelity rigs can include up to 37 additional bones.*

*(image in the full Top G Vault)*

*Bones must follow a specific hierarchy and naming convention*

Inside of the avatar's physical body is a non-rendered rigging armature that allows the character to articulate its limbs. Often referred to as joints or bones, a rigging armature includes skinning data that allows connections between limbs to bend organically, such as the character's knees and elbows.

[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|Standard avatar rigs]] (R15) require 15 poseable joints to articulate the character's 15 body parts. However, if you want to create higher-fidelity characters with a greater level of realism, there are up to 37 additional optional joints for [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced R15 rigs]] that you can create for articulated hands, shoulders, and spine movements.

In Studio, each joint of the rigging armature is represented by [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] objects that connect the character's body part [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects together. [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] objects must follow a specific hierarchy and naming convention for the avatar to function properly in Studio and on the Marketplace. For more information, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|Rigging]].

### Face animation data

 *(image in the full Top G Vault)*

 *Each avatar character face is rigged and skinned to create various expressions*

*(image in the full Top G Vault)*

*Each pose is mapped to a pose name within the Custom Properties (Extra Attributes in Maya) of the Head_Geo object*

*(image in the full Top G Vault)*

*Each required face pose is saved as a keyframe in the animation timeline.*

Facial animation data from either the character's rigging armature or facial joints allow avatars to express emotions with their eyes, mouth, and teeth. Each character includes facial joints, skinning data, animation timeline data, and mapped pose data that allows these expressions. In Studio, these facial animation elements are represented by a [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] instance.

### Cage meshes

*(image in the full Top G Vault)*

*Head and Upper Torso cage mesh objects (wireframe)*

*(image in the full Top G Vault)*

*Cage objects must exist for each of the 15 body parts*

Cage meshes set the invisible outer boundary for layered accessories to stretch and fit over body parts, allowing clothes to fit over models of different shapes and sizes without you having to remodel the clothing item each time. In Studio, outer cage mesh objects are represented by a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] instance.

If you are caging your own non-template character model, it's important to use one of Roblox's body cage [[30 Official Roblox Docs/Avatar/Resources#Mannequin models|project files]] to ensure you are using a Roblox standard cage mesh. Removing or adding vertices from this standard mesh can cause issues with clothing fit and import.

### Attachments

*(image in the full Top G Vault)*

*Each character has common attachment points for equipping rigid cosmetics*

*(image in the full Top G Vault)*

*Each avatar character must include their associated 19 attachment points*

Attachment points set the specific points where rigid accessories and in-game equippable objects attach to the character's body. These are not rendered on the platform, but they are represented visually as spheres in 3D modeling software when you use Roblox's **R15 Rig and Attachments** [[30 Official Roblox Docs/Avatar/Resources#Project files|project file]].

When you import a rig with these visual representations, the spheres are created as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects using standardized names.

> [!info]
> When users wear a layered accessory, the layered accessory isn't attached directly to the attachment, but it does reference the associated attachment point during ragdoll and dismemberment animations.

## Creation process

When designing a character body in [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), you must export all of the avatar components in a single `.fbx` or `.gltf` for import into Studio. Since 3D creation isn't a linear process and always requires reiteration and testing, the process of creating an avatar character model can differ between individuals and various creation workflows.

In general, the creation process follows these typical workflows:

**Basic Creation with Templates**

<br>Customize a [[30 Official Roblox Docs/Art/Characters/Creating/Create with templates|character body template]] that already includes all the necessary components.*(image in the full Top G Vault)*

**Advanced Creation from Scratch**

<br>Create characters from scratch, allowing full customization of the avatar character's components.*(image in the full Top G Vault)*

> [!warning]
> Ensure that all assets you create follow Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and any applicable [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].

## Resources

There are a variety of resources available for creators of all backgrounds to get started with character creation. Review the following table for specific topics and resources:

| Topic | Resources |
| --- | --- |
| Tutorials | [[30 Official Roblox Docs/Art/Characters/Creating/Create with templates\|Basic character creation tutorial]] |
| Reference files | [[30 Official Roblox Docs/Avatar/Character Bodies/Character body reference files\|Avatar references and project files]]<br><br>[[30 Official Roblox Docs/Art/Modeling/Modeling project files and references\|Example mesh/model objects]] |
| Technical specs | [[30 Official Roblox Docs/Avatar/Character Bodies/Export character bodies\|.FBX export settings]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications\|Avatar specifications]]<br><br>[[30 Official Roblox Docs/Art/Modeling/General specifications\|General mesh specifications]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]] |
| Cosmetic creation | [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Accessories overview]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Creating face accessories]]<br><br>[[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace requirements]] |
| Texturing | [[30 Official Roblox Docs/Art/Modeling/Texture specifications\|Texturing requirements]]<br><br>[[30 Official Roblox Docs/Art/Modeling/PBR textures\|PBR textures]] |
| Rigging and skinning | [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|Rigging and skinning overview]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging\|Humanoid rig requirements]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Rig and skin the head\|Rigging facial bones]]<br><br>[[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Automatic Skinning Transfer]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints\|Skinning facial bones]] |
| Facial animation and live heads | [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads\|Basic head creation]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Face accessory creation]]<br><br>[[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference\|FACS pose references]] |
| Testing and validation | [[30 Official Roblox Docs/Art/Modeling/Calisthenics Tool\|Calisthenics Tool]]<br><br>[[30 Official Roblox Docs/Art/Accessories/Layered Accessory Validation Tool\|Clothing Validation Tool]] |
| Publishing and Marketplace | [[30 Official Roblox Docs/Marketplace/Publish to Marketplace\|Uploading to Marketplace]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions\|Fees and commissions]] |

---
*Source: [Character bodies](https://create.roblox.com/docs/avatar/character-bodies) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
