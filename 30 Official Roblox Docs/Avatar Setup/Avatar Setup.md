---
title: "Avatar Setup"
description: "The Avatar Setup tool helps accelerate the avatar item creation process by automatically processing custom models into avatar assets."
area: "30 Official Roblox Docs"
cluster: "Avatar Setup"
source: "https://create.roblox.com/docs/avatar-setup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Avatar Setup tool helps accelerate the avatar item creation process by automatically processing custom models into avatar assets.*

**Avatar Setup** helps accelerate the avatar character body, rigid accessory, and layered accessory creation process by automatically processing custom models into avatar assets. If your characters and rigid/layered accessories don't have all essential components for publishing to the [Marketplace](https://www.roblox.com/catalog), Avatar Setup can perform the following for your 3D models:

- **Rigging** — Adds a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rigging armature]] to your body model to enable movement and animation.
- **Skinning** — Adds weights and influences to various surfaces of your mesh, ensuring an organic and natural flexibility during movement.
- **Facial animation** — Generates the FACS poses, facial rigging, skinning, and animation data required for facial animation and avatar chat.
- **Caging** — Adds the required cages to your asset, enabling it to support layered accessories.
- **Partitioning** — Separates the body mesh into the appropriate 15 body parts necessary for an avatar character body.
- **Creating attachments** — Adds the appropriate attachment points enabling the character to wear rigid accessories.

*(image in the full Top G Vault)*

![](https://www.youtube.com/watch?v=Hp9pr2FpZa8)

## Import a 3D asset

The [[30 Official Roblox Docs/Studio/Importer|Importer]] tool allows you to import custom 3D assets that you made in third-party modeling tools like Blender or Maya directly into Studio. If your custom 3D assets don't include all essential avatar components for the Marketplace, Avatar Setup will add any missing components as it processes the assets.

To import a custom 3D asset using the Importer tool:

1. Navigate to the **Home** tab, then select **Import**. A file browser displays.
1. Select the `.fbx`, `.obj`, or `.gltf` model you want to import. After a few moments, the **Import Preview** window opens with a preview of your asset.
1. In the **File General** section, disable the **Upload To Roblox** option. This setting stops the asset from immediately saving to your Toolbox, preventing unwanted copies of similar assets.
1. **OPTIONAL** To create an import preset for this workflow,
   1. In the top-right of the **Import Preview** window, click the ⋯ dropdown.
   1. In the contextual menu, click **Save as New**.
1. Verify the preview and any [[30 Official Roblox Docs/Studio/Importer#Warnings and errors|warnings or errors]] in your model. Certain warnings and errors may require readjusting the model in the third-party software you used to create the asset.
1. Click the **Import** button to add the model into your workspace. After a moment, it displays as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object in the **Explorer** window.

> [!warning]
> When you import a new model into Studio, the system adds the model to the moderation queue. If your model is moderated, you will receive a moderation email with a link to appeal. This appeal can take up to 10 minutes to resolve.

## Run Avatar Setup

When your project has the appropriate [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object in your workspace, you can run Avatar Setup to see if your 3D asset requires any additional avatar components before you can publish it to the Marketplace as a character body, rigid accessory, or layered accessory. Avatar Setup supports the conversion of the following 3D asset types from a base [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]:

| Asset type | Input object | Output object |
| --- | --- | --- |
| Avatar character body | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing one or more [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] objects that meet Avatar Setup's supported [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Character bodies\|body inputs]]. | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] parenting associated 15 [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] objects and other expected [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Character body components\|avatar components]]. |
| Rigid accessory | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing one or more [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] objects that meet Avatar Setup's supported [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Rigid accessories\|rigid accessory inputs]]. <br> <br>Must [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Bundle multiple assets\|bundle]] with an avatar body [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] for Avatar Setup. | [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] that includes all expected [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Rigid accessory components\|rigid accessory components]]. |
| Layered accessory | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing one or more [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] objects that meet Avatar Setup's supported [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications\|accessory inputs]]. <br> <br>Can optionally [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Bundle multiple assets\|bundle]] with an avatar body [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] for Avatar Setup. | [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] that includes all expected [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories#Layered accessory components\|layered accessory components]]. |
| Multiple accessories with single body | `Folder` [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Bundle multiple assets\|bundle]] containing one or more [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] that meet supported inputs for rigid accessories, layered accessories, or avatar bodies. <br> <br>Must [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications#Bundle multiple assets\|bundle]] with an avatar character body [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] for Avatar Setup. | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] character body and any [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] equippable items. <br> <br>All generated assets include expected avatar item components. |

> [!info]
> For more in-depth information on supported input configurations, see the individual asset specifications on [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications|Avatar Setup requirements]].

To run Avatar Setup:

1. In the **Explorer** window, select the model or specific meshes of the model. If you want to select multiple meshes at once, expand the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object, then hold shift and click on the individual mesh objects you want to process as avatar assets.

   > [!note]- **Reference models**
   > For an asset that meets all of these model requirements, download one of the following Avatar Setup templates for your own reference and testing:
   >
   > Nature Girl
   >
   >
   > *(image in the full Top G Vault)*
   >
   >
   > A comprehensive `.zip` folder of an Avatar Setup ready character model, including rigid and layered accessory assets and PBR textures.
   > <br>
   > This template is not compatible with the traditional avatar creation workflow.
   >
   >
   > [Download](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/NatureArcherGirl-AutoSetup.zip)
   >
   >
   >
   > Stylish Male
   >
   >
   > *(image in the full Top G Vault)*
   >
   >
   > A comprehensive `.zip` folder of an Avatar Setup ready character model, including the base body and associated PBR textures.
   > <br><br>
   > This template is not compatible with the traditional avatar creation workflow.
   >
   >
   > [Download](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/StylizedMale-AutoSetup.zip)

1. With the model or meshes selected, navigate to the **Avatar** tab, then select **Avatar Setup**.
1. In the **Configure Models** section,
   1. Set **Preset** to the appropriate category.
      1. If you want to publish your assets to the Marketplace for users to purchase and use across Roblox, select **Platform Avatar**. This option generates a more restrictive setup that's necessary to pass validation and moderation.
      1. If you want to upload your assets to your inventory for non-player characters (NPCs) or starter player characters for your games, select **Development Avatar**. This option generates a less restrictive setup.

      *(image in the full Top G Vault)*

   1. Set **Type** for each asset to the correct asset type so that it moves and animates correctly in the 3D space.
      1. For character body geometry, select **Body**.
      1. For layered accessory assets, select **Layered**.
      1. For rigid accessory assets, select **Rigid**.
      1. For eyebrow and eyelash assets, select **Eye Layered**.

      *(image in the full Top G Vault)*

1. **OPTIONAL** Near the bottom-left corner, click on the gear icon to configure specialty settings for your character model.
   1. If your character has a decal for its face and you want to enable the conversion of the texture into a [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|dynamic head]], enable **Handle face as 2D decal**. This process allows you to preserve your creative intent while complying with Marketplace policy that requires all avatars to have dynamic heads.

      > [!note]- **Converting a decal into a dynamic head?**
      > The process of converting a decal into a dynamic head infers eye and mouth regions from your existing texture, generates cages and FACS data, then maps the result onto a dynamic head template. For best results, review the following guidance:
      >
      > **Run Avatar Setup with the character's body and head**
      >
      >    - If you only run Avatar Setup with the character's head, this speciality setting will fail.
      >
      > **Verify avatar face is front-facing**
      >
      >    - Before you run Avatar Setup, verify that your character's face is facing the front and visible in the preview. Whenever you manually position your character's face, make sure you enable **Manually align front** in the Avatar Setup window's speciality settings.
      >
      > **Delete the [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object**
      >
      >    - Avatar Setup retains your current face setup whenever it detects a [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object under your character's [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Head]] model. If one exists in your character, delete it from  before running Avatar Setup.
      >
      > **Use [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instead of [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]]**
      >
      >    - When you have only [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] or both [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] objects defined for your avatar, remove or replace the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|TextureID]] objects with [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] objects for significant texture quality improvements when rendering.

   1. If your character includes an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced R15 rig]] with additional joints, enable **Create R15 with optional joints**.
   1. If you want to manually align the front direction of your character with the negative Z-axis in world space, enable **Manually Align Front**. While auto-setup does this automatically for you, it can sometimes fail to properly determine the front of your character.
   1. If you want to add a post-processing step to significantly improve the alignment of your character's head cage with the head model and its facial features, enable **Improve facial caging**. This is particularly important if you plan on using [[30 Official Roblox Docs/Avatar/Makeup/Makeup|makeup]] with your character.
   1. If you are importing a development avatar and want to skip the auto-decimation of input meshes with resolution above the triangle budgets required for the Marketplace, disable **Reduce triangle count**.

      *(image in the full Top G Vault)*

1. Near the bottom-right corner, click the **Set Up** button.
   1. If your model requires auto-setup for missing avatar components, the tool begins processing your model. This can take several minutes. Once auto-setup is complete, the tool populates your avatar asset in the Avatar Setup window.
   1. If your model doesn't require auto-setup, the tool populates your avatar asset in the Avatar Setup window.

## Testing tools

After you successfully load your character into the Avatar Setup window, you can access various testing tools in the window's side navigation to ensure your character moves, animates, and equips rigid and layered accessories properly.

*(image in the full Top G Vault)*

In each of these interfaces, you can see which items are currently equipped to your character on the right side of the Avatar Setup window. From here, you can:

- **Unequip items** by right-clicking on an equipped item, then selecting **Unequip Item** from the contextual menu.
- **Set the worn order** by dragging and ordering the various equipped accessories.

If you discover any issues that can't be resolved with Avatar Setup testing tools, you may need to update your character model using the third-party modeling software you used to create the asset, then retry the auto-setup process.

### Check Body

The **Check Body** interface contains various tabs for checking how your character model animates, emotes, wears rigid and layered accessories, and changes skin tone. To learn more about what you can do with this interface, click through the following tabs.

*(image in the full Top G Vault)*

#### Animations

The **Animations** tab lets you test how your character animates and emotes using each [[30 Official Roblox Docs/Animation/Use animations#Default character animations|default animation]] that Roblox provides for every avatar, such as the walk, jump, and swim animation.

If you notice any issues with your character's body as it animates, you can either use Avatar Setup's editing tools or your favorite third-party 3D modeling application to adjust your character's rig until the animations play properly.

#### Clothing

The **Clothing** tab lets you try on various layered accessories on your character to see if your character's cage works properly for different avatar layered accessory types, such as shirts, jackets, pants, and shoes.

If you notice any areas on your character's body that don't interact with layered accessories as expected, you can either use Avatar Setup's [[30 Official Roblox Docs/Avatar Setup/Avatar Setup#Cage Brush|Cage Brush]] or your favorite third-party 3D modeling application to adjust your character's cage until the layered accessory fits properly.

#### Accessories

The **Accessories** tab lets you try on various accessories on your character to see if your character's [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Attachments|attachment points]] work properly on different areas of the character's body, such as the front, back, or shoulder of the character.

If you notice any areas on your character's body that don't interact with accessories as expected, you can either use Avatar Setup's [[30 Official Roblox Docs/Avatar Setup/Avatar Setup#Attachment Tool|Attachment Tool]] to adjust your character's attachment points until accessories attach properly.

#### Body

The **Body** tab lets you change your character's skin tone and swap body parts to test how the character changes visual appearance.

### Check Face

The **Check Face** interface zooms closer to the character's face and allows you to test various facial poses and cosmetics. To learn more about what you can do with this interface, click through the following tabs.

*(image in the full Top G Vault)*

*Check the range of facial poses with multiple facial animation tests.*

*(image in the full Top G Vault)*

*Unexpected facial animation behavior, such as crashing or artifacts, may require minor adjustment to the base mesh and re-running the auto-setup process.*

#### Animations

The **Animations** tab lets you test your character's facial animations and range of motion for different parts of the face, such as the character's eyeballs, eyebrows, and mouth.

If you notice any issues with your character's facial expressions, you can either use Avatar Setup's editing tools or your favorite third-party 3D modeling application to adjust your character until the animations play properly.

#### Body

The **Body** tab lets you change your character's skin tone and swap heads to test how the character changes visual appearance.

#### Makeup

The **Makeup** tab lets you test [[30 Official Roblox Docs/Avatar/Makeup/Makeup|makeup]] on your character's face. You can either test entire makeup looks or individual makeup components in various combinations.

If you want to upload your makeup as an entire look, click on the [[30 Official Roblox Docs/Avatar Setup/Avatar Setup#Publish to the Marketplace|Save]] navigation, then select **Create Makeup Look**.

#### Accessories

The **Accessories** tab lets you try on accessories on your character to see if your character's [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories#Attachments|attachment points]] work properly for hair, head, and face avatar accessories.

If you notice any areas on your character's body that don't interact with accessories as expected, you can either use Avatar Setup's [[30 Official Roblox Docs/Avatar Setup/Avatar Setup#Attachment Tool|Attachment Tool]] to adjust your character's attachment points until accessories attach properly.

### Test in Experience

The **Test in Experience** tab starts playtesting the game with your character model. This button references your active [[30 Official Roblox Docs/Studio/Studio testing modes|playtesting mode]] and retains the changes you make in the Avatar Setup window.

### Add test items

In addition to the side navigation test tooling, you can add custom assets to the Avatar Setup's testing palette that are either active in your current project or by assetID. For more information on either method, review the tabs below.

#### From Project

To add a custom item that's active in your current project to the Avatar Setup testing palette:

1. In the **Explorer** window or viewport, select a valid accessory or body part asset.
1. In the **Avatar Setup** window, navigate to the **Check Body** or **Check Face** interface, then click the plus button at the bottom of the selection column along the left side of the window. The item appears in the appropriate section and subsection of the interface, such as Accessories → Hair.

   *(image in the full Top G Vault)*

#### By AssetID

To add a custom item by assetID to the Avatar Setup testing palette:

1. In the **Avatar Setup** window, navigate to the **Check Body** or **Check Face** interface, then click the down-facing arrow button.
1. From the contextual menu, select **AssetID**. The item appears in the appropriate section and subsection of the interface, such as Accessories → Hair.

   *(image in the full Top G Vault)*

## Editing tools

In addition to the Avatar Setup window, you can use Avatar Setup's Attachment Tool and Cage Brush in the viewport to make minor to moderate adjustments to the character's attachment points and cage.

*(image in the full Top G Vault)*

### Attachment Tool

The **Attachment Tool** displays all attachment points on the character's body. When you select an attachment point, the Move tool displays, allowing you to adjust the attachment point's position within the character's body.

*(image in the full Top G Vault)*

### Cage Brush

![](https://www.youtube.com/watch?v=fwbuhzq1D0k)

The Cage Brush lets you modify your character's body cage mesh and make adjustments to how layered accessories fit on your character. The following controls provide fine-grain control on your cage edits:

*(image in the full Top G Vault)*

- Symmetrical and mirror edits along X-axis.
- Brush with radius and falloff controls.
- Brush falloff visualization over the vertices.
- Ability to hide or display equipped layered accessories. Layered accessories will update in real time in the **Avatar Setup** tool's preview window.

> [!warning]
> Major cage edits may require returning to your third-party modeling tool, making your cage adjustments, and then re-exporting the asset.

## Publish to the Marketplace

The **Save** button opens the Asset Configuration dialog, allowing you to upload the avatar and any accessory items to your inventory or publish everything configured as platform avatar assets to the Marketplace.

*(image in the full Top G Vault)*

When publishing your assets to the Marketplace, you must pay an [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|upload fee]] and pass moderation in order to add your assets to the catalog. For additional resources on the publishing process and Marketplace, see the following:

- [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|Publish to the Marketplace]]
- [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions|Marketplace fees and commissions]]
- [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policy]]

---
*Source: [Avatar Setup](https://create.roblox.com/docs/avatar-setup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
