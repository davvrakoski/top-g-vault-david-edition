---
title: "Test character bodies"
description: "Verify the important aspects of your character model in Blender and in Studio."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/character-bodies/test"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Verify the important aspects of your character model in Blender and in Studio.*

To ensure your character bodies for avatars can move, interact with objects in the 3D space, and wear cosmetics, clothing, and accessories, it's important to periodically test their components in both your third-party modeling tool and in Studio as you iterate on their design. By testing often, you can save yourself a lot of time in having to rework time-intensive processes like rigging, skinning, and caging.

Whether you are using a [[30 Official Roblox Docs/Avatar/Resources#Templates|template character]] or [[30 Official Roblox Docs/Avatar/Resources#Project files|project file]] as a basis for your character body, reference the following tables for common tests and resources you can use throughout the creation process to comprehensively quality check each component of your character models.

### Blender Tests

  > [!info]
  > You can apply the following workflows with any 3D modeling software, though certain interfaces and instructions may differ between platforms. For more information, see [[30 Official Roblox Docs/Avatar/Character Bodies/Blender tests for character bodies|Test character bodies in Blender]].

| Component | Testing recommendations |
| --- | --- |
| *(image in the full Top G Vault)* <br>**Body Parts** | When modeling, confirm that your character's geometry follows Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Geometry\|geometry specifications]]. |
| *(image in the full Top G Vault)* <br>**Textures** | When texturing, confirm that your character's textures follow Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Textures\|texture specifications]]. |
| *(image in the full Top G Vault)* <br>**Rigging** | Use Blender's [[30 Official Roblox Docs/Avatar/Character Bodies/Blender tests for character bodies#Skinning data\|posing tools]] to check the rigging and skinning quality of your character's body. |
| *(image in the full Top G Vault)* <br>**Face Animation** | Confirm that your character's [[30 Official Roblox Docs/Avatar/Character Bodies/Blender tests for character bodies#Facial animation data\|FACS data]] is present and correctly configured. |
| *(image in the full Top G Vault)* <br>**Cage Mesh** | Manually verify that your cage meshes completely and tightly cover your character model and follow Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Outer cages\|outer cage specifications]]. |
| *(image in the full Top G Vault)* <br>**Attachments** | Manually verify that your attachment points are correctly positioned and follow Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Attachments\|attachment specifications]]. |

### Studio Tests

  > [!info]
  > Roblox provides an uncopylocked testing place file that includes quick access to various environments and testing features. For more information, see [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies|Test character bodies in Studio]].

| Component | Testing recommendations |
| --- | --- |
| *(image in the full Top G Vault)* <br>**Body Parts** | Test how your character's body parts [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Movement and animation\|move and animate]] in the 3D space. |
| *(image in the full Top G Vault)* <br>**Textures** | Test how your character looks in [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Lighting and color\|various lighting environments and skin tone colors]]. |
| *(image in the full Top G Vault)* <br>**Rigging** | Use [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Movement and animation\|animations and testing environments]] to verify your character's rigging, skinning, and movement quality. |
| *(image in the full Top G Vault)* <br>**Face Animation** | [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Movement and animation\|Cycle through various facial animations]] to ensure your character can perform common expressions. |
| *(image in the full Top G Vault)* <br>**Cage Mesh** | [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Clothing and accessories\|Equip various clothing items]] to check for fit and for any unexpected cosmetic issues. |
| *(image in the full Top G Vault)* <br>**Attachments** | [[30 Official Roblox Docs/Avatar/Character Bodies/Studio tests for character bodies#Clothing and accessories\|Equip various accessory items]] to verify rigid accessory placement and orientation. |

---
*Source: [Test character bodies](https://create.roblox.com/docs/avatar/character-bodies/test) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
