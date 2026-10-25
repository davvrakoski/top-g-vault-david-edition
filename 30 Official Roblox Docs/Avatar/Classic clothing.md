---
title: "Classic clothing"
description: "Classic clothing are decals you can apply to a classic character model's surface. You can create classic clothing items on Roblox and upload them to the Marketplace."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/classic-clothing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Classic clothing are decals you can apply to a classic character model's surface. You can create classic clothing items on Roblox and upload them to the Marketplace.*

> [!warning]
> Many user-generated avatars on the Marketplace do not support 2D classic clothing. For information on creating modern 3D cosmetics, including rigid accessories and clothing items, see [[30 Official Roblox Docs/Avatar/Avatar, a system of expression|Get started]].

![](https://www.youtube.com/watch?v=r_unfGZT5Ps)

Create and sell your first 2D classic clothing item.

![](https://www.youtube.com/watch?v=EUDSIUmLjxA)

A high-level overview of avatar items on Roblox.

**Classic clothing** are 2D assets that wrap around specific areas of the avatar's body, such as their front torso for t-shirts or their torso and legs for pants. This is the most basic type of avatar item to create and sell on the [Marketplace](https://www.roblox.com/catalog) as you just need an image editor and web browser for the creation process.

To create classic clothing items:

1. Decide on the [[30 Official Roblox Docs/Avatar/Classic clothing#Types of classic clothing|type of classic clothing]] you'd like to create.
1. [[30 Official Roblox Docs/Avatar/Classic clothing#Create classic clothing|Create]] an image for your asset using an image editor of your choice.
1. [[30 Official Roblox Docs/Avatar/Classic clothing#Test classic clothing|Test]] your creation in Studio to ensure it looks as intended.
1. [[30 Official Roblox Docs/Avatar/Classic clothing#Upload classic clothing|Upload]] the image file to the Marketplace through a web browser.

## Types of classic clothing

There are three types of classic clothing: **T-shirts**, **Shirts**, and **Pants**. Each type of classic clothing has different design and format requirements.

*(image in the full Top G Vault)*

*T-shirts*

*(image in the full Top G Vault)*

*Shirts*

*(image in the full Top G Vault)*

*Pants*

### T-shirts

T-shirts are a square image, such as 512x512 pixels. When properly configured, classic t-shirts display on the front torso of a blocky character.

### Shirts and pants

Classic shirts and pants are image assets that wrap around an avatar's body. Because classic shirts and pants have specific size requirements, download and modify the provided template files to begin creating these assets.

*(image in the full Top G Vault)*

*[Shirt (torso and arms)](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/classic-clothing/Classic-Clothing-Templates.zip)*

*(image in the full Top G Vault)*

*[Pants (torso and legs)](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/classic-clothing/Classic-Clothing-Templates.zip)*

| Shape | Pixel size (width x height) | Clothing parts |
| --- | --- | --- |
| Large square | 128 × 128 | **FRONT** and **BACK** |
| Tall rectangle | 64 × 128 | Sides of torso (**R**, **L**) <br> Sides of arms and legs (**L**, **B**, **R**, **F**) |
| Wide rectangle | 128 × 64 | **UP** and **DOWN** |
| Small square | 64 × 64 | Top and bottom of arms and legs (**U**, **D**) |

## Create classic clothing

To begin creating classic clothing:

1. If you are creating a classic shirt or pants, [download and unzip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/classic-clothing/Classic-Clothing-Templates.zip) the following clothing templates to use as a canvas for your art.
1. Modify the image in an image editor of your choice.
1. Export the image as a `.png` or `.jpg` before testing and uploading it in Studio.

When applying clothing to avatars in Roblox, some limits exist with the templates and may require some testing to get right, as shown in the following examples:

*(image in the full Top G Vault)*

*The shoe designs in this example are near the bottom of the leg regions (L, B, R, F) but don't extend too far up. This provides a distinct separation between the shoes and the bottom of the jeans.*

*(image in the full Top G Vault)*

*The shoe designs in this example extend too far up the leg regions (L, B, R, F) which make them appear as if they're part of the pants. The same issue may occur near other joints on the avatar's body.*

## Test classic clothing

To ensure the best quality results, it's recommended to test your classic clothing in Studio before uploading or selling your asset on the Marketplace. The testing process does not require any fees.

To test your classic clothing:

1. From the toolbar's **Avatar** tab, click **Character**.
1. Choose a **Block Avatar** rig type from the popup menu. An avatar mannequin named **Rig** appears in the 3D workspace.

   *(image in the full Top G Vault)*

1. In the **Explorer** window, hover over the **Rig** object, click the **⊕** button and insert either a **ShirtGraphic** (T‑shirt), **Shirt**, or **Pants** object according to the clothing you want to test.

1. Locate and select the new **Shirt Graphic** or **Clothing** object parented under **Rig**.

   *(image in the full Top G Vault)*

   *Shirt Graphic (T-shirt)*

   *(image in the full Top G Vault)*

   *Clothing object (Shirt/Pants)*

1. In the **Properties** window, locate the associated property as follows:

	 | Clothing Type | Parent Class | Property |
	 | --- | --- | --- |
	 | **T-Shirt** | [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic\|ShirtGraphic]] | [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic#Graphic\|Graphic]] |
	 | **Shirt** | [[30 Official Roblox Docs/API Reference/Classes/Shirt\|Shirt]] | [[30 Official Roblox Docs/API Reference/Classes/Shirt#ShirtTemplate\|ShirtTemplate]] |
	 | **Pants** | [[30 Official Roblox Docs/API Reference/Classes/Pants\|Pants]] | [[30 Official Roblox Docs/API Reference/Classes/Pants#PantsTemplate\|PantsTemplate]] |

1. Click inside the property's row and select the image you uploaded to Roblox. This applies the clothing texture to the **Rig** character.

   *(image in the full Top G Vault)*

## Upload classic clothing

After creating and testing your classic clothing design, as long as you meet the [[30 Official Roblox Docs/Marketplace/Marketplace policy#Creator requirements|creator requirements]], you can upload and sell your clothing item on the Marketplace for an [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Upload fees|upload fee]] of **80 Robux** per submission.

To upload a custom clothing item:

1. Navigate to your [Creator Dashboard](https://create.roblox.com/dashboard/creations).
1. Navigate to **Avatar Items**, then select the **Classics** tab.
1. Drag and drop your image file into the upload box. Alternatively, you can click **Upload Asset** and upload your file on the next page.
1. On the **Upload Asset** page, set the **Asset Type** dropdown to **T-Shirt**, **Shirt**, or **Pants**.
1. Complete the **Name** and **Description** fields. These fields help users find your assets and allow you to organize your creations.
1. Click the **Upload** button at the bottom of the page.

## Manage classic clothing

To see your moderation status, place your item on sale, or modify your item settings:

1. Navigate to your [Creator Dashboard](https://create.roblox.com/dashboard/creations).
1. Navigate to **Avatar Items**, then select the **Classics** tab.
1. Use the **Classic Type** dropdown to filter by the type of classic clothing creation.
1. Click on the asset to navigate to the asset's **Configure** page.
1. Modify the following fields:
   1. **Item Name** — The public-facing name of the asset.
   1. **Item Description** — The public-facing description of the asset.
   1. **On Sale** — When enabled, users can view and purchase this item on the Marketplace.
   1. **Set a price** — The value of Robux that the creation sells for on the Marketplace.

---
*Source: [Classic clothing](https://create.roblox.com/docs/avatar/classic-clothing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
