---
title: "Packages"
description: "Packages allow you to reuse single assets or asset hierarchies across games."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/assets/packages"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Packages allow you to reuse single assets or asset hierarchies across games.*

To keep assets organized and reusable across your team or across multiple projects, you can group your instances and convert them into reusable **packages**. Packages make the overall process of building worlds faster and more ergonomic, but they also help with consistency, deduplication, collaboration, and versioning:

- Easily [[30 Official Roblox Docs/Projects/Assets/Packages#Mass updates|update all copies]] of a package to the latest version, or only [[30 Official Roblox Docs/Projects/Assets/Packages#Update outdated copies|update specific copies]].
- Set packages to [[30 Official Roblox Docs/Projects/Assets/Packages#Automatic updates|automatically update]] whenever there's a new version.
- Give collaborators **Edit** or **Use** permissions to the contents of a package.
- View the full version history for a package, compare versions, and restore old versions.

The most efficient workflow is to [[30 Official Roblox Docs/Projects/Assets/Packages#Create packages|create a package]], [[30 Official Roblox Docs/Projects/Assets/Packages#Share and access levels|share it]] with any collaborators, and [[30 Official Roblox Docs/Projects/Assets/Packages#Automatic updates|set it to auto-update]]. And you don't have to wait for a model to be "done" before using it in a package. Even if the package is a placeholder on top of a simple shape, you can use it to [[30 Official Roblox Docs/Tutorials/Curriculums/Environmental Art/Greybox your environment|greybox your environment]] and then have the placeholder copies automatically update as you publish more detailed versions.<br><br>

![](https://www.youtube.com/watch?v=AzKZy2BqIh8)

## Create packages

> [!warning]
> If you want to create a package with restricted assets that you don't have [explicit permission](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) to use, you can still create the package but those specific restricted assets will **not** be visible or audible at runtime unless the game itself has permission to use those assets.

You can create a package from any single object or any single parent and children branch of objects. If you want to create a package for a single object, add it to a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] grouping first so that you can add, remove, or scale child objects within the package later without breaking the package.

To create a package:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window or 3D viewport, right-click the object(s) you want to turn into a package and, in contextual menu, select **Convert to Package**.
1. In the new window, fill in the package details. In particular, if you're working in a [[30 Official Roblox Docs/Projects/Groups (teams)|group]], set **Ownership** to the appropriate group in which you have permission to create/edit group games.

   > [!warning]
   > Ownership transfers are **not** supported by the asset system, so carefully consider the owner when creating a package.

1. Click **Submit**.
1. After the conversion completes, the object receives a "chain link" symbol in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window to identify it as a package. Additionally, you can see a new [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] object parented to the object.

   *(image in the full Top G Vault)*

1. **OPTIONAL** Select the [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] object and enable [[30 Official Roblox Docs/API Reference/Classes/PackageLink#AutoUpdate|AutoUpdate]] in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window. Note how the icon changes to indicate that the package is set to automatically update.

> [!danger]
> Do not delete or move the [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] object! Doing so for any package copy converts the copy back into a normal object and loses package capabilities, such as ability to update itself when there's a new version.

## Insert packages

To insert a package that doesn't already exist in the current place, you must **initially** insert it from the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md):

- From **Inventory** ⟩ **My Packages** for packages that you've published to or obtained from the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]], as well as packages that a friend owns and has given you [[30 Official Roblox Docs/Projects/Assets/Packages#Share and access levels|permissions]] to use.
- From **Creations** ⟩ **Group Packages** for packages published by members of your [[30 Official Roblox Docs/Projects/Groups (teams)|group]] (including yourself).

*(image in the full Top G Vault)*

*Toolbox ⟩ Inventory ⟩ My Packages*

*(image in the full Top G Vault)*

*Toolbox ⟩ Creations ⟩ Group Packages*

Once you've inserted a package into a published place's data model, it appears in the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) and remains there even if you later delete all copies of it.

> [!warning]
> Be careful when inserting assets that you didn't create into your games, as they can contain malicious scripts. Save your game first and then investigate any scripts within unfamiliar assets so that you can easily revert back to the place version.

## Modify packages

You can edit packages and their children just like other objects. Modifying packages disables [[30 Official Roblox Docs/Projects/Assets/Packages#Automatic updates|auto‑update]] until you [[30 Official Roblox Docs/Projects/Assets/Packages#Publish package changes|publish]] or [[30 Official Roblox Docs/Projects/Assets/Packages#Revert package changes|revert]] the changes.

Most edits flag the package as modified, although the following changes are **not** considered package modifications:

- Changing the **name** of the root node.
- Changing the **position** or **rotation** of the root node of a package that is a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], or [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].
- Changing the [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#Enabled|Enabled]] property of a root node [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] such as a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]].
- Changing a part reference of a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]] inside the package that references an instance outside of the package.

Once modified, packages with unpublished changes get a modified icon in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window:

*(image in the full Top G Vault)*

### Add or update configurations

You can include [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|instance attributes]] at the root of a package to customize its behavior. When you publish a package, the current set of attributes/values will become the package's **default configurations**. On any given **copy** of a package, those attribute values can be changed on a per‑instance basis, and those changed are noted through **bold italics**. When package copies are [[30 Official Roblox Docs/Projects/Assets/Packages#Update outdated copies|updated]], modified configuration values will be preserved, while other attributes will be updated to the latest default value.

*(image in the full Top G Vault)*

> [!info]
> Currently the only way to handle configuration values is to add scripts in the package which read and apply behavior based on the configuration at runtime.

> [!info]
> If you simply want to update the default **values** for configurations, you can change those attribute values and republish the package (the package will **not** be flagged as modified in this case). If you want to publish other modifications but not change the default configuration values, you should publish on a package without any value changes, or revert the configurations to their defaults before you publish.

### Nested packages

You can nest packages inside of other packages to maintain and collaborate on complex hierarchies, such as a series of vehicle mechanics which can be modified independently of the vehicle's parent package.

If you modify a nested package, both the nested package **and** the parent package are considered as modified. You must [[30 Official Roblox Docs/Projects/Assets/Packages#Publish package changes|publish changes]] to any **nested** package before you're allowed to publish changes to its **parent** package, since publishing the parent would mark it as current/unmodified and conflict with the nested package's modifications.

### Package scripts

Each script within an **unmodified** package is read-only and shows a notification on the top with a hyperlink to unlock the script.

*(image in the full Top G Vault)*

Clicking the hyperlink:

- Flags the package as modified regardless of whether you edit the script.
- Removes the notification/hyperlink from **other** scripts within the package.

Once the package is published and moved to an **unmodified** state, the scripts under it become read‑only with a hyperlink to modify.

## Publish package changes

You can publish any change to a package as a new version, making your updates available to other package copies throughout the place and across all games. It's **not** required to publish a modified package before publishing a place because the modified version is saved along with the place for future iteration.

To publish changes to a package:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window or 3D viewport, right-click the modified copy and select **Publish to Package**.
1. If a package copy has [[30 Official Roblox Docs/Projects/Assets/Packages#Automatic updates|auto-update]] turned on, it immediately pulls in the updated version when you open the place that contains them. Other copies get a "download" symbol that indicates an update is available. You can [[30 Official Roblox Docs/Projects/Assets/Packages#Update outdated copies|individually update]] or [[30 Official Roblox Docs/Projects/Assets/Packages#Mass updates|mass-update]] all copies.

   *(image in the full Top G Vault)*

1. **OPTIONAL** Add a description of your changes:

   1. Right-click the package and select **Package Details**.
   1. In the **Asset Configuration** window, select **Versions**.
   1. Under your most-recent change, select **Add**.
   1. Describe your changes, then click the **Submit** button.

## Update outdated copies

You can update outdated package copies to the most recent version, or you can continue to use the older version.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, locate outdated copies by the "download" symbol. You can also select the outdated copy in the 3D viewport.

   *(image in the full Top G Vault)*

1. Right-click an outdated copy and select **Get Latest Package**. You can also select multiple packages, right-click, and **Get Latest For Selected Packages**.

### Mass updates

Extensive use of packages may result in many package copies across multiple places in a game. In addition to [[30 Official Roblox Docs/Projects/Assets/Packages#Update outdated copies|individual syncing]] and [[30 Official Roblox Docs/Projects/Assets/Packages#Automatic updates|automatic updates]], you can update all copies of a package through **mass updating**.

1. **RECOMMENDED** Close other Studio instances with any of the game's places open; this prevents another unsaved instance of a place from potentially overwriting your updates.
1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window or 3D viewport, right-click the desired package and select **Update All**.
1. Choose all places in the game or some subset of places and click **Update**.

> [!info]
> Mass updating packages automatically **saves** the selected places but does not **publish** them. Additionally, to prevent unintended overwrites, mass updating does not affect [[30 Official Roblox Docs/Projects/Assets/Packages#Modify packages|modified]] versions of a package; after the mass update completes, Studio displays a warning with the number of packages that it did **not** update, if any.

### Automatic updates

To make syncing easier, you can set a package copy to update automatically whenever a newer version is published. Auto-update of the package copies will take place when a place is opened in Studio.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, expand the package's hierarchy tree and select its [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] object.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, enable the [[30 Official Roblox Docs/API Reference/Classes/PackageLink#AutoUpdate|AutoUpdate]] property. If you have [[30 Official Roblox Docs/Projects/Assets/Packages#Nested packages|nested packages]], this property only applies to the highest-level parent package, meaning automatic updates only occur when the **parent** package is updated.

> [!warning]
> Automatic updating does not apply to [[30 Official Roblox Docs/Projects/Assets/Packages#Modify packages|modified]] package copies. Once you modify a package instance, its **AutoUpdate** property becomes disabled and is ignored.

## Share and access levels

You can grant permission to friends, games, groups, or specific group user roles so that they can freely use your packages in their creations. For more information on asset access, see [Asset privacy](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md).

> [!warning]
> If you share a package with restricted assets that you don't have [explicit permission](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) to use, you can still share the package but those specific restricted assets will **not** be visible or audible at runtime unless the friend, game, or group has permission to use those assets.

### To collaborators

To change package permissions for a collaborator, such as a friend or group:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md), or [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md), right-click the desired package and select **Package Options** ⟩ **Package Details**.
1. In the **Asset Configuration** window, select **Permissions**.
1. Using the search bar, input and select a collaborator that you want to grant permission to use your package, then choose a permission level.

   | Permission | Description |
   | --- | --- |
   | **Use & View** | The collaborator can use and view (but not edit) the current and previous package versions. Once you provide a collaborator with this ability, you cannot revoke access to a copy they already inserted into their game; revoking access prevents reinsertion or package updates, but package copies in their data model remain intact. |
   | **Edit** | The collaborator can use, view, and edit the current and previous package versions, including publishing changes to it. |

### To games

To grant package access to a game, the game must be editable to either you or a group that you belong to in which you have the **Manage Group Games** role permission.

To change package permissions for a game:

1. Navigate to the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
1. In the upper tab bar, select **Development Items**, then click **Models & Packages**.
1. Select the package you want your game to have permission to use. The package's **Configure** page displays.
1. In the package's left-hand navigation, select **Permissions**. The package's **Permissions** page displays.
1. From the **Experiences** tab, click the **Add experiences** button.
1. Type the game's universeID into the **Enter Universe IDs** input, then click the **Add** button. The game displays beneath the input with its access visible.

   > [!info]
   > If you want to give multiple games permission to use your restricted access at the same time, you can enter multiple universeIDs as long as you separate them with a comma.

1. Click the **Done** button to finalize your package asset access permissions.

## Revert package changes

Instead of undoing an entire series of package changes one by one, you can [[30 Official Roblox Docs/Projects/Assets/Packages#Revert unpublished changes|revert unpublished changes]] in one action, restore a package to a previous [[30 Official Roblox Docs/Projects/Assets/Packages#Restore to published version|version]], or revert changes to specific [[30 Official Roblox Docs/Projects/Assets/Packages#Revert configurations|configurations]].

### Revert unpublished changes

To undo an entire series of **unpublished** changes:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, locate modified copies by the dot on their package icons. You can also select modified copies in the 3D viewport.

   *(image in the full Top G Vault)*

1. Right-click a single modified copy and select **Undo Changes to Package**, or select multiple copies (at least one of them modified), right-click, and select **Undo Changes to Selected Packages**.

### Restore to published version

To restore a package to a **previously published** version:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md), or [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md), right-click the desired package and select **Package Options** ⟩ **Package Details**.
1. In the **Asset Configuration** window, select **Versions**. The window displays details for each published version, including the date and time of publication, along with any descriptions of the changes.
1. Click the checkmark next to the version you want to restore and click **Submit**.

> [!warning]
> Reverting changes to a package does not reset the configuration to the default. See [[30 Official Roblox Docs/Projects/Assets/Packages#Revert configurations|revert configurations]].

### Revert configurations

To revert any [[30 Official Roblox Docs/Projects/Assets/Packages#Add or update configurations|configuration]] attribute to its default, select **Reset** from its options menu in the **Attributes** section of the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*

## Compare package versions

When a package has multiple versions, you can compare changes between versions using the diff viewer. The tool has a package hierarchy menu that indicates all added, removed, or modified instances between versions using corresponding icons, including the following features:

- **Visual Overview** shows the visual differences of the 3D rendering under different camera positions. It's the default view for packages with a 3D object (models, parts) as the root object, and it's currently only available for the root object.

- **Properties** shows changes of properties and attributes. It's the default view for packages with a non-3D object (scripts, lights, 2D objects) as the root object, and it's available for all instances in a package.

- **Script** shows line-by-line script differences. It's available for packages containing scripts, regardless of whether the script is the root object or not.

To compare package versions:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] or 3D viewport, right‑click the target package and select **Package Options** ⟩ **Compare Package Versions**.
1. By default, the window compares changes between your local copy and the latest version. Use the two dropdown menus to compare different versions.

   *(image in the full Top G Vault)*

   > [!warning]
   > Some older versions might be incompatible with the package diff tool.

1. After selecting versions:

   1. To compare the visual renderings of the root model, if applicable, select the **Visual Overview** tab and adjust the camera control for your desired angle. Controls are synchronized across views:

      - Pan the camera using left mouse clicks.
      - Rotate the camera using right mouse clicks.
      - Zoom in and out the camera with the mouse wheel.
      - Recenter using the keyboard shortcut <kbd>F</kbd>.

   1. To compare properties and attributes of an instance, select the instance and the **Properties** tab.

   1. To compare script differences for a package that is a script or contains scripts, use the **Script** tab.

      > [!warning]
      > This tool only allows you to compare script changes between the current version and the latest published or local version, without indicating the collaborators who made the change.

			> [!info]
			> Alternatively, you can open the script diff tool directly by right‑clicking the target package in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window or 3D viewport and selecting **View Script Changes**.

---
*Source: [Packages](https://create.roblox.com/docs/projects/assets/packages) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
