---
title: "Toolbox"
description: "The Toolbox contains a selection of assets made by Roblox or Roblox community members."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/assets/toolbox"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Toolbox contains a selection of assets made by Roblox or Roblox community members.*

The **Toolbox**, accessible from Studio's **Window** menu or **Home** tab toolbar, contains a selection of [[30 Official Roblox Docs/Parts/Models|models]], [[30 Official Roblox Docs/Parts/Textures and decals|images]], [[30 Official Roblox Docs/Parts/Meshes|meshes]], [[30 Official Roblox Docs/Audio/Audio assets|audio]], [[30 Official Roblox Docs/Studio/Studio plugins|plugins]], [[30 Official Roblox Docs/UI/Video frames|videos]], and fonts made by Roblox or Roblox community members. It also includes all of the creations that you've personally published or those which were published by [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you belong to.

*(image in the full Top G Vault)*

The toolbox contains four distinct sections:

### Creator Store

*(image in the full Top G Vault)*

The **Creator Store** section contains models, decals, meshes, audio, plugins, videos, and fonts made by Roblox or Roblox community members. See [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] for more information.

### Inventory

*(image in the full Top G Vault)*

The **Inventory** section contains models, decals, meshes, audio, packages, videos, plugins, animations, and fonts that you've personally published, those which were published by [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you belong to, or those taken from the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]].

### Recent

*(image in the full Top G Vault)*

The **Recent** tab is similar to **Inventory** except that filters your recently used models, decals, meshes, audio, videos, and animations.

### Creations

*(image in the full Top G Vault)*

The **Creations** tab is similar to **Inventory**, with the important distinction that it filters models, decals, meshes, audio, plugins, and animations that you've personally published or those which were published by [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you belong to. You can [[30 Official Roblox Docs/Projects/Assets/Toolbox#Asset configuration|configure]] all assets in this section directly within Studio.

## Find and use assets

With millions of assets available, it's helpful to narrow the search results to find exactly what you are looking for. To browse and use assets:

1. In the top-left corner, click the category selector dropdown and choose an asset category. Optionally click the **advanced filter** button to filter results by [[30 Official Roblox Docs/Production/Publishing/Account verification|verified creator]] status, a specific creator, the sale price for [[30 Official Roblox Docs/Studio/Studio plugins|plugins]], and file length for [[30 Official Roblox Docs/Audio/Audio assets|audio assets]].

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

2. In the search field, type what you want to find and press <kbd>Enter</kbd>. The view curates a selection of assets according to your query.

	 *(image in the full Top G Vault)*

3. **OPTIONAL** Hover over an asset thumbnail and click the magnifying glass icon to closely inspect the asset's community rating, description, and more.

   *(image in the full Top G Vault)*

4. To add an asset to a game:

   - If the asset is a [[30 Official Roblox Docs/Parts/Models|model]], [[30 Official Roblox Docs/Parts/Meshes|mesh]], [[30 Official Roblox Docs/Parts/Textures and decals|decal]], [[30 Official Roblox Docs/UI/Video frames|video]], or [[30 Official Roblox Docs/Audio/Audio assets|audio]] asset, click it or drag‑and‑drop it into the 3D viewport. It then inserts into the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, and assets with 3D content display in the viewport.
   - If the asset is a [[30 Official Roblox Docs/Studio/Studio plugins|plugin]], click it and use the **Install** button to add it to the mezzanine's **Plugins** tab.
   - If the asset is a font, click it and use the **Install** button to add it to your font library. It then becomes available for user interface elements such as [[30 Official Roblox Docs/UI/Text & image labels|text labels]] or [[30 Official Roblox Docs/UI/Text & image buttons|buttons]].

   > [!info]
   > Some assets include scripts that perform specific actions, such as animating at runtime or triggering a sound. If you want to use an asset without allowing any of its scripts to run, right‑click the object in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window and select **Disable Scripts** from the context menu.

## Asset configuration

Right-clicking an asset and selecting **Edit Asset** opens the **Asset Configuration** window. In this window, you can edit the asset's details or restore it to a previous version.

> [!info]
> Asset configuration is only possible for assets you've personally published or those which were published by [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you belong to. The **Creations** tab is particularly useful for filtering assets in this way.

## Troubleshooting

The toolbox runs through a web view. If you're experiencing any of the following issues, run the associated troubleshooting steps.

> [!note]- **General Issues**
> > [!warning]
> > Make sure there are no active instances of Roblox Studio running before running these steps.
>
>
> | Windows |
> | --- |
> | 1. [Reinstall](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) your Windows WebView2 installation. 2. Delete the WebView2 data folder found at `%LOCALAPPDATA%\Roblox\RobloxStudio\WebView2`. Studio will automatically recreate this folder when it opens. |
> | **Mac** |
> | Delete the WebKit data folders found at `~/Library/WebKit/com.Roblox.RobloxStudio` and `~/Library/Caches/com.Roblox.RobloxStudio/WebKit`. Studio will automatically recreate these folders when it opens. |

> [!note]- **Audio Not Working**
> | Windows |
> | --- |
> | 1. Right click the speaker icon in the taskbar. 2. Click **Open Volume Mixer**. 3. Make sure that **Microsoft Edge WebView2** is not muted. |

---
*Source: [Toolbox](https://create.roblox.com/docs/projects/assets/toolbox) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
