---
title: "Dynamic heads"
description: "Facial animations enable avatars to create dynamic facial expressions."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/dynamic-heads"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Facial animations enable avatars to create dynamic facial expressions.*

[Video: Blocky_And_Goblin_Dynamic_Heads.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/Blocky_And_Goblin_Dynamic_Heads.mp4)

**Dynamic heads** are rigged avatar character heads that support facial animations and custom expressions. When users purchase dynamic heads on the [Marketplace](https://www.roblox.com/catalog), they can trigger emotes that combine both facial and body animations.

There are four main layers of a dynamic head that structure how the head looks and works on the platform:

- **Mesh & textures** that make up the head's visual appearance.
- **Facial animation data** that determine how the character's face moves and expresses the character's personality and emotions.
- **Cage meshes** that determine how the character's head equips facial accessories that deform with facial expressions, such as facial hair that moves accordingly when the character changes facial expressions.
- **Attachments** that determine how the character's head attaches accessories like hair and hats.

While you can create each of these layers manually in third-party modeling tools like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), some have strict configuration requirements to meet Roblox's technical [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications|dynamic head specifications]] that guarantee your dynamic head animates consistently from game to game. Before you create your first custom dynamic head, it's recommended to:

1. Understand the [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads#Dynamic head components|essential components]] of a dynamic head and how they work together.
1. Review all [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads#Resources|resources]] that Roblox provides to standardize and expedite the [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads#Creation process|creation process]], such as Blender and Maya project files, Studio tooling, and step-by-step guides.
1. Follow the [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|basic dynamic head creation tutorial]] that covers how to add facial joints, apply skinning data, pose joints into expressions, and map poses on a head model in Blender.

Once you have a custom dynamic head, you can import it with a character body into Studio and use the Avatar Setup tool to process your creation into an avatar asset that's ready to be sold on the [[30 Official Roblox Docs/Marketplace/Marketplace overview|Marketplace]].

## Dynamic head components

All dynamic heads are made up of the same fundamental components that allow users to equip facial accessories that stretch, fit, and layer over a target character's head with consistent behavior.

### Mesh part

*(image in the full Top G Vault)*

*Masculine dynamic head mesh object.*

*(image in the full Top G Vault)*

*Feminine dynamic head mesh object.*

All dynamic heads require a single mesh object that represents the head's geometry. In Studio, this mesh object is represented as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object nested under a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

### Textures

*(image in the full Top G Vault)*

*Textures apply color and surface details to your character model.*

*(image in the full Top G Vault)*

*A texture image map's opacity can combine with the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|MeshPart.Color]] to apply custom skin tones to characters.*

Textures are image files that define the surface appearance of your character's head. You can create textures using a texture painting program or 3D modeling software. In Studio, you must import textures as image files and set them to [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects by a child [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object or the mesh's [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] property.

### Face animation data

 *(image in the full Top G Vault)*

 *Each avatar character face is rigged and skinned to create various expressions*

*(image in the full Top G Vault)*

*Each pose is mapped to a pose name within the Custom Properties (Extra Attributes in Maya) of the Head_Geo object*

*(image in the full Top G Vault)*

*Each required face pose is saved as a keyframe in the animation timeline.*

Facial animation data from the character's facial joints allow avatars to express emotions with their eyes, mouth, and teeth. Each character includes facial joints, skinning data, animation timeline data, and mapped pose data that allows these expressions. In Studio, these facial animation elements are represented by a [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] instance.

### Cage meshes

*(image in the full Top G Vault)*

*Head geometry and cage mesh objects (wireframe)*

*(image in the full Top G Vault)*

*Cage objects must exist for each of the 15 body parts, including the dynamic head*

Cage meshes set the invisible outer boundary for facial accessories to stretch and fit over the character's head, allowing facial accessories to deform as the head animates and emotes. In Studio, outer cage mesh objects are represented by a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] instance.

If you are caging your own non-template character model, it's important to use one of Roblox's body cage [[30 Official Roblox Docs/Avatar/Resources#Mannequin models|project files]] to ensure you are using a Roblox standard cage mesh. Removing or adding vertices from this standard mesh can cause issues with how facial accessories deform and import.

### Attachments

*(image in the full Top G Vault)*

*Each character has common attachment points for equipping rigid cosmetics*

*(image in the full Top G Vault)*

*Each avatar character must include their associated 19 attachment points, including those on the dynamic head*

Attachment points set the specific points where rigid accessories and in-game equippable objects attach to the character's head. These are not rendered on the platform, but they are represented visually as spheres in 3D modeling software when you use Roblox's **R15 Rig and Attachments** [[30 Official Roblox Docs/Avatar/Resources#Project files|project file]].

When you import a rig with these visual representations, the spheres are created as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects using standardized names.

> [!info]
> When users wear a layered accessory, the layered accessory isn't attached directly to the attachment, but it does reference the associated attachment point during ragdoll and dismemberment animations.

## Creation process

When designing a dynamic head in [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), you must export all of the avatar components in a single `.fbx` or `.gltf` for import into Studio. Since 3D creation isn't a linear process and always requires reiteration and testing, the process of creating a dynamic head can differ between individuals and various creation workflows. Some choose to modify a rigged character model to meet Roblox's [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications|dynamic head specifications]], while others prefer to create one from scratch.

In general, the creation process follows the following workflow:

*Dynamic Head Workflow*

*(image in the full Top G Vault)*

> [!warning]
> Ensure that all assets you create follow Roblox's [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards) and any applicable [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].

## Resources

There are a variety of resources available for creators of all backgrounds to get started with dynamic head creation. Review the following table for specific topics and resources:

| Topic | Resources |
| --- | --- |
| Tutorials | [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads\|Basic dynamic head creation tutorial]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Basic facial accessory creation tutorial]] |
| Reference files | [[30 Official Roblox Docs/Avatar/Character Bodies/Character body reference files\|Avatar references and project files]]<br><br>[[30 Official Roblox Docs/Art/Modeling/Modeling project files and references\|Example mesh/model objects]]<br><br>[[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head caging best practices\|Dynamic head caging best practices]]<br><br>[[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference\|FACS pose references]] |
| Technical specs | [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications\|Dynamic head specifications]]<br><br>[[30 Official Roblox Docs/Art/Modeling/General specifications\|General mesh specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]] |
| Cosmetic creation | [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories\|Accessories overview]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories\|Creating face accessories]]<br><br>[[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]]<br><br>[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications\|Accessory specifications]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace requirements]] |
| Texturing | [[30 Official Roblox Docs/Art/Modeling/PBR textures\|PBR textures]] |
| Rigging and skinning | [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|Rigging and skinning overview]]<br><br>[[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging\|Humanoid rig requirements]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Rig and skin the head\|Rigging facial bones]]<br><br>[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Skin joints\|Skinning facial bones]]<br><br>[[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Automatic Skinning Transfer]] |
| Animation | [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads\|Animate dynamic heads]] |
| Testing and validation | [[30 Official Roblox Docs/Avatar/Dynamic Heads/Test dynamic heads in Studio\|Test dynamic heads]]<br><br>[[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation\|Validation process]] |
| Publishing and Marketplace | [[30 Official Roblox Docs/Marketplace/Publish to Marketplace\|Uploading to Marketplace]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace policy\|Marketplace policy]]<br><br>[[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions\|Fees and commissions]] |

---
*Source: [Dynamic heads](https://create.roblox.com/docs/avatar/dynamic-heads) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
