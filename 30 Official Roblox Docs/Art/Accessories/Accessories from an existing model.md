---
title: "Accessories from an existing model"
description: "This tutorial covers the basic steps required to publish a custom asset on the Marketplace."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/from-existing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*This tutorial covers the basic steps required to publish a custom asset on the Marketplace.*

In many cases, you may want to convert a premade model from your modeling
software into an accessory on Roblox. If you are looking to create your
accessory from scratch, see [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Create your first rigid accessory|Create accessories]].

Using a provided 3D reference file, this tutorial covers each step in the workflow to properly configure and export a 3D model with PBR textures from Blender and generate your own **rigid accessory** in Studio. After you create the accessory, you can upload it to the Marketplace, save it to your toolbox, and use it in your own games.

> [!info]
> This tutorial only covers rigid accessories, and does not cover the process of converting more advanced clothing or character body models.

*(image in the full Top G Vault)*

*Mask asset as an untextured mesh object in Blender*

*(image in the full Top G Vault)*

*Mask asset equipped as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] in Studio*

Using a provided reference 3D asset, this tutorial covers the following rigid accessory workflow:

1. Modeling overview and requirements in Blender.
2. Texturing setup using PBR textures in Blender.
3. Exporting your asset as a `.fbx` from Blender.
4. Importing the asset into Studio.
5. Fitting and converting the imported model to an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.
6. Publishing and validating the accessory for Marketplace upload.

> [!info]
> While this content covers the Blender workflow with a provided reference example, you can apply the same concepts to other third-party modeling applications and custom assets.

## Setup model

Whether you are using an existing shape or creating your own 3D object, it's important to consider [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|technical requirements]], such as keeping your geometry within a polycount budget, and [[30 Official Roblox Docs/Marketplace/Marketplace policy|policy requirements]], such as ensuring your design does not infringe on other creator's IP both within and outside of the Roblox ecosystem.

Correctly setting up your asset in Blender helps reduce importing and rendering issues later in Studio. When importing Roblox-related `.fbx` files, such as the provided [mask asset](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Model-Only.fbx), you might discover that your asset imports at a 1/100 scale due to the `.fbx` conversion. In your Blender project, you can quickly reset the scale to make the asset easier to work with in the Blender environment.

> [!info]
> If you are creating your own rigid accessory from scratch, it's important to understand Roblox's [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#Body scale|standard avatar sizes]], especially for rigid accessories that contour around a body part, such as a hat or bangle.

Using the [Sci Fi Mask](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Model-Only.fbx) reference as an example, use the following instructions to import and set up your rigid accessory model in Blender:

1. Open a new Blender project.
2. Press <kbd>A</kbd> to highlight all and <kbd>X</kbd> to delete the default starting cube and cameras.
3. Navigate to **File** > **Import** > **FBX** and select the downloaded reference model.
4. If the object imports at a small scale, **select** the object and navigate to the **Properties** panel > **Object Properties** > **Transform** and adjust the **X**, **Y**, **Z** to `1.000`.

   *(image in the full Top G Vault)*

   [Video: Scaling-FBX-Import.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Scaling-FBX-Import.mp4)

5. If you are sculpting your asset from scratch, orient the object in your workspace. If you are importing, you may not need to make any adjustment.
   1. Make sure your asset is facing **-Y forward**.
   2. Ideally your accessory should be moved to `0`,`0`,`0` in the world to ensure it imports at the center of the camera in Studio.

> [!success]
> You've completed the modeling section of this tutorial. If desired, download a [reference version](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Texturing-Completed.blend) of this stage of the project for comparison.
>
> There are many tools and workflows to create your own unique asset. For additional suggestions, try creating different asset types, such as shoulder pads or belts, or importing a reference model into Blender as a mannequin to sculpt and shape your cosmetics from scratch.

## Apply texture

**Texturing** is the process of applying a surface appearance to a 3D object. Blender provides various tools and features to create and connect your own texture maps to your asset, allowing you to preview your model's final appearance and link the texture images to your exported file.

The mask example asset uses [[30 Official Roblox Docs/Art/Modeling/PBR textures|physically-based rendering (PBR) textures]], which are advanced textures that create realistic surfaces under different lighting environments. PBR textures use multiple image files, or **maps**, to represent the various surface properties of your 3D object.

*(image in the full Top G Vault)*

*Color (Albedo) Map*

*(image in the full Top G Vault)*

*Normal Map*

*(image in the full Top G Vault)*

*Roughness Map*

*(image in the full Top G Vault)*

*Metalness Map*

This tutorial doesn't cover the PBR texture creation process, which typically involves using third-party software such as ZBrush or Substance 3D Painter. Instead, this section goes over the process of bringing premade PBR image files into Blender and properly associating them to your asset on export.

> [!warning]
> While PBR textures are not required for accessories, adding PBR textures can add extra visual flair and realism to elevate your creations. For an example on using Blender to create a basic, non-PBR texture, see [[30 Official Roblox Docs/Art/Accessories/Creating/Create seams and unwrap|Texture basic clothing]].

To configure and link your PBR textures to your model:

1. Download [Rigid_Mask_Textures.zip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Textures.zip) and unzip the textures images locally in the same directory as your Blender project.
2. In Blender, navigate to the **Shading** tab. Ensure that your object is selected.

   1. If you don't see the **PrincipledBSDF node**, select the **+New** button to create a new material.

      *(image in the full Top G Vault)*

      *(image in the full Top G Vault)*

3. From your file browser, drag and drop your texture `.png` files into the node section. A new image node appears with each file.
4. In the newly created node, click and drag the following image nodes to their appropriate connection on the Principled BSDF main node:

   1. **\_ALB texture**: Connect the **Color** node to **Principled BSDF** > **Base Color**.
      *(image in the full Top G Vault)*
   2. **\_MTL texture**: Connect the **Color** node to **Principled BSDF** > **Metallic**.
      *(image in the full Top G Vault)*
   3. **\_RGH texture**: Connect the **Color** node to **Principled BSDF** > **Roughness**.
      *(image in the full Top G Vault)*
   4. **\_NOR texture**:
      1. Click **Add** > **Vector** > **Normal Map** to generate a NormalMap node. This node is required to convert Normal PBR image maps.
      2. Connect the \_NOR node's **Color** to the NormalMap node's **Color** connection.
      3. Connect the NormalMap's **Normal** to the **Principled BSDF** > **Normal**.
         *(image in the full Top G Vault)*

5. Test your textures by changing the viewport viewing mode to **Viewport Shading > Material Preview Mode**.

   [Video: Adding-PBR.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Adding-PBR.mp4)

> [!success]
> You've completed the texturing section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Texturing-Completed.blend) of this stage of the project for comparison.
>
> If you are creating your own PBR textures, check out [[30 Official Roblox Docs/Art/Modeling/Material references|Material references]] for various PBR material examples you can apply to your next accessory.

## Clean up

After modeling and texturing your asset, you can begin the process of **exporting** your Blender project as a `.fbx`. The start of this process includes cleaning up your project, which can involve deleting or removing any extra objects, such as lights, cameras, or mannequin meshes, to ensure you only export the accessory mesh, and applying any modifiers to your mesh object.

An often forgotten cleanup step involves **applying your transformations**, also known as **freezing your transforms**, by setting your orientation, rotation, and scale deltas to zero. Failure to apply any transformations can result in unexpected behavior and orientation when importing the mesh in Studio.

To freeze your transforms:

1. In Object mode, select your mesh object.
2. Navigate to **Object** > **Apply** > **All Transforms**.

   *(image in the full Top G Vault)*

## Export from modeling tool

After modeling and texturing your asset, you can begin the process of **exporting** your Blender project as a `.fbx`. The start of this process includes cleaning up your project, which can involve deleting or removing any extra objects, such as lights, cameras, or mannequins, to ensure you only export the accessory mesh, and applying any modifiers to your mesh object.

For the latest export settings for Blender, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|rigid accessory export settings]].

> [!success]
> You've completed the exporting section of this tutorial. If desired, download a [reference sample](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Rigid_Mask_Export.fbx) of this exported file for comparison. You can use this reference in the next importing step.

## Import to Studio

Studio's Importer provides a quick and easy way to import third-party 3D assets into your projects. The importer provides object previews and error-checking to ensure that your asset meets Studio's general 3D requirements.

To import your asset, check out the latest information on [[30 Official Roblox Docs/Avatar/Rigid Accessories/Import rigid accessories|importing rigid accessories]].

## Convert

After importing your asset into Studio, you can begin **fitting** your imported object to a mannequin and **converting** the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object into a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]]. When fitting and converting your accessory it's important to use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) to correctly preview the placement and apply the correct configurations to your accessory.

To convert your asset into a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], check out the latest information on [[30 Official Roblox Docs/Avatar/Rigid Accessories/Import rigid accessories#Convert rigid accessories|converting rigid accessories]].

## Upload and publish

After generating your [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] item, you can now begin the process of **publishing** the asset to the Marketplace. This step is optional and only applicable for creators who intend to sell their asset.

For additional information and instructions on this process, see [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|uploading and publishing instructions]].

![](https://www.youtube.com/watch?v=swQW2VS9ZMA)

You now have your accessory added to the Marketplace catalog! Use the item's Marketplace link to view your listing at any time, or to send to your friends and followers for additional engagement.

*(image in the full Top G Vault)*

> [!info]
> See the following resources for additional Marketplace policy and related information:
>
> - [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policy]]
> - [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions|Fees and commissions]]
> - [[30 Official Roblox Docs/Marketplace/Intellectual property for avatar items|Intellectual property]]
> - [[30 Official Roblox Docs/Marketplace/Moderation|Moderation]]

---
*Source: [Accessories from an existing model](https://create.roblox.com/docs/art/accessories/from-existing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
