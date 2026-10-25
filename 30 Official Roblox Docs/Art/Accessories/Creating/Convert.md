---
title: "Convert"
description: "Use the Accessory Fitting Tool to convert a Model object to an Accessory."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/converting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Accessory Fitting Tool to convert a Model object to an Accessory.*

With the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] in your project, the last step in the process of clothing creation requires you to convert this object to a standard [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] that avatars can equip. Using the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT), convert the model object to a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] that you can then use in your game or publish to the Marketplace.

To generate the accessory object:

1. In the **Avatar** tab, click **Accessory** to open the AFT. The **Accessory Fitting Tool** panel displays.
1. In the panel:

   1. Select the **Part** field, then in the **Explorer** window, select the layered accessory [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object.
   1. Back in the panel, click the **Next** button. The **Asset Type** page displays.

1. In the **Asset Type** page:

   1. Set asset type to **Clothing**, then use the dropdown menu to select the clothing type. This tutorial sets it to **Shirt**.
   1. Click the **Next** button. A preview panel displays with a default character wearing your layered accessory.

1. Test out various sample characters, clothing, and animations. If necessary, make minor cage adjustments using the editing features, or larger cage changes back in your third-party modeling software. For more information on this process, see [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool#Test accessories|Accessory Fitting Tool - Test accessories]].
1. After previewing your asset, click the **Generate MeshPart Accessory** button. Your 3D model populates in your project as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.

*(image in the full Top G Vault)*

*Clothing accessory in viewport*

*(image in the full Top G Vault)*

*Clothing accessory in Explorer*

> [!success]
> Congratulations, you've completed the layered accessory tutorial. With your new [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], you can perform any of the following:
>
> - [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Upload and publish|Upload the accessory]] to the Marketplace.
> - Use the accessory in your current game by equipping it to character models with a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]], or by dragging and dropping the accessory under the appropriate character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
> - Save the accessory to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to share or use within any of your games.

---
*Source: [Convert](https://create.roblox.com/docs/art/accessories/creating/converting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
