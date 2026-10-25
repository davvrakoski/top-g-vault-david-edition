---
title: "UI 9-slice design"
description: "UI 9-slice design lets you create UI elements of varying sizes without distorting the borders or corners."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/9-slice"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*UI 9-slice design lets you create UI elements of varying sizes without distorting the borders or corners.*

When creating UI with custom borders and corners, you'll often need to render elements at different aspect ratios and visually surround [[30 Official Roblox Docs/Production/Localization/Localization|localized text]] or other contents of unknown dimensions.
This lets you create UI elements of varying sizes without distorting the borders or corners.

*(image in the full Top G Vault)*

*Without 9-Slice*

*(image in the full Top G Vault)*

*With 9-Slice*

Under the **9-slice** approach, one image (a single Roblox image asset) is
internally divided into nine sub-images, each with different scaling rules.
*(image in the full Top G Vault)*

| Sub-image | Scaling |
| --- | --- |
| **1** **3** **7** **9** (corners) | none |
| **2** **8** (top/bottom edges) | horizontal |
| **4** **6** (left/right edges) | vertical |
| **5** (center) | horizontal + vertical |

## Studio editor

Slice configuration is possible by directly setting the [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType]] and slice properties on an image label or button, but Studio's built-in **9-Slice Editor** is more intuitive.

### Opening the editor

To open the visual **9-Slice Editor** in Studio:

1. Select an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] with a valid asset ID entered into its **Image** field.

  *(image in the full Top G Vault)*

1. Set the **ScaleType** property to **Slice**.

  *(image in the full Top G Vault)*

1. Click on the **SliceCenter** property that appears, then click on the **…** within the row.

  *(image in the full Top G Vault)*

1. In the window that opens, 4 red lines overlay the image, representing the edges of the slices. The source image size is also displayed.

  *(image in the full Top G Vault)*

### Set offsets

In Studio, drag the red lines to set the **offsets** from the left, right, top,
and bottom edges of the image.

> [!info]
> If you need better precision, enter offset values
> in the fields on the right side of the editor window.

*(image in the full Top G Vault)*

As you reposition the dragger lines, the UI element automatically updates to show the result.

*(image in the full Top G Vault)*

*Slice setup*

*(image in the full Top G Vault)*

*Result on 500×200 ImageLabel*

*(image in the full Top G Vault)*

*Slice setup*

*(image in the full Top G Vault)*

*Result on 500×200 ImageLabel*

> [!warning]
> The offset values are different from the UI object's **SliceCenter** property values and represent the number of pixels between an edge of the source image and the dragger associated with that side.

---
*Source: [UI 9-slice design](https://create.roblox.com/docs/ui/9-slice) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
