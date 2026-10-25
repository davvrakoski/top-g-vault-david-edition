---
title: "Custom thumbnails"
description: "Explains how to create your own custom thumbnail for marketplace items."
area: "30 Official Roblox Docs"
cluster: "Marketplace"
source: "https://create.roblox.com/docs/marketplace/custom-thumbnails"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to create your own custom thumbnail for marketplace items.*

Thumbnail images provide a preview of the 3D asset in the [Marketplace](https://www.roblox.com/catalog), user inventories, and avatar editors. Before [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|uploading an asset to the Marketplace]], you can create your own thumbnails to customize the exact look and feel of your item preview thumbnails. This step is optional, but can help ensure that the thumbnail accurately portrays your item.

*(image in the full Top G Vault)*

*The default thumbnail may not correctly represent your item.*

*(image in the full Top G Vault)*

*A custom thumbnail can create a more accurate preview.*

### Create thumbnails

You must create thumbnails before [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|publishing your asset on the Marketplace]]. You can quickly create these thumbnail configuration instances with the [Custom Thumbnail Tool](https://www.roblox.com/library/11628621048/UGC-Custom-Thumbnail-Tool). Roblox stores custom thumbnail information in a child `ThumbnailConfiguration` object that parents a `CameraTarget` and `CameraValue`.

*(image in the full Top G Vault)*

To use the Custom Thumbnail Tool:

1. Install the [Custom Thumbnail Tool plugin](https://www.roblox.com/library/11628621048/UGC-Custom-Thumbnail-Tool). This may require restarting Studio.
2. In the **Explorer** window, select the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] you intend to create a thumbnail for.
3. With the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] highlighted in the **Explorer** window, navigate to the **Plugins** tab and click the **UGC Thumbnail Tool**. The viewport display updates and centers on the selected accessory in the workspace.
4. Adjust the viewport to center on your accessory. Use the following controls to help navigate the camera:

   - <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> to pan the camera.
   - Hold **right-click** to rotate the camera.
   - Hold **middle-click** to pan the camera.
   - Hold <kbd>Shift</kbd> for fine adjustment.

5. When complete, click **Accept** to generate the thumbnail configuration objects.
6. You can preview the thumbnail by right-clicking the accessory in the **Explorer** window and selecting **Save To Roblox…**. The **Asset Configuration** window appears and displays the current thumbnail.

If your thumbnail does not look correct, **repeat steps 2-5** to overwrite the existing thumbnail data.

> [!warning]
> Once you upload an asset, you can't modify or change an asset's thumbnail.

### Troubleshooting thumbnails

If your thumbnails don't look the way you expect, you might need to manually resolve these issues or attempt to use the Custom Thumbnail tool again. See the following for common issues and fixes:

| Issue | Description |
| --- | --- |
| Incorrect Thumbnail Zoom | The scale of the thumbnail depends on the `Handle` size of the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]]. For the best thumbnail, make sure your `Handle` covers the entire item. <br><br>When changing the size of the `Handle` object, adjust the `Size` property instead of using the resize tool. The resize tool can cause other unintended changes to the item.<br><br> You can resolve this issue by using the [Custom Thumbnail Tool](https://www.roblox.com/library/11628621048/UGC-Custom-Thumbnail-Tool). |
| Backward Thumbnails | When importing meshes, Studio may change the orientation of the custom model by 180°. To resolve this, you can rotate your mesh 180° in your third party modeling tool, such as Blender or Maya, and then re-import the 3D model into Studio. <br><br>Regardless of import orientation, Studio equips the [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] on a character with the same fit and attachment. |

---
*Source: [Custom thumbnails](https://create.roblox.com/docs/marketplace/custom-thumbnails) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
