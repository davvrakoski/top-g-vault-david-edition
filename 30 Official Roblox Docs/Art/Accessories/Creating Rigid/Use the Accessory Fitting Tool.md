---
title: "Use the Accessory Fitting Tool"
description: "Use the Accessory Fitting Tool to convert your model to a rigid accessory."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating-rigid/converting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Accessory Fitting Tool to convert your model to a rigid accessory.*

After importing your asset into Studio, you can begin **fitting** your imported object to a mannequin and **converting** the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object into a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]]. When fitting and converting your accessory, it's important to use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) to correctly preview the placement and apply the correct configurations to your accessory.

[Video: Converting.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Converting.mp4)

To fit and generate your accessory:

1. In the **Avatar** tab, click **Accessory** to open the AFT. The **Accessory Fitting Tool** panel displays.
1. In the panel:

   1. Select the **Part** field, then in the **Explorer** window, select the rigid accessory [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object.
   1. Back in the panel, click the **Next** button. The **Asset Type** page displays.

1. In the **Asset Type** page:

   1. Set asset type to **Accessory**, then use the dropdown menu to choose the location of where you want the rigid accessory to attach to a character's body. This tutorial sets it to **Back**.
   1. Click the **Next** button. A preview panel displays with a default character wearing your rigid accessory.

1. Using both the AFT preview window and the viewport, adjust the position, scale, and rotation of the rigid accessory.

   1. Use the AFT preview window and the default character as an accurate preview of how your asset fits on the character. The clothing mannequin in the viewport does not accurately portray how rigid accessories attach.
   1. In the viewport, use the **Move**, **Scale**, and **Rotate** tools to adjust the positioning of your rigid accessory.
   1. If you accidentally select something else, click back into the AFT panel to reselect the accessory and resume your adjustments using the transformation tools.

1. After previewing and fitting your asset, click the **Generate MeshPart Accessory** button. Your 3D model populates in your project as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.
1. Test your accessory by equipping it to a character and using the **Avatar Setup** tool.

   [Video: Testing.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Testing.mp4)

> [!success]
> After successful fitting and converting, your 3D model populates in your project as a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]]. With your new [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] you can perform any of the following:
>
> - [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Upload and publish|Upload the accessory]] to the Marketplace.
> - Use the accessory in your current game by equipping it to character models with a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]], or by dragging and dropping the accessory under the appropriate character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
> - Save the accessory to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to share or use within any of your games.

---
*Source: [Use the Accessory Fitting Tool](https://create.roblox.com/docs/art/accessories/creating-rigid/converting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
