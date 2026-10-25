---
title: "Studio interface"
description: "User interface overview for Roblox Studio, the essential building tool for Roblox games."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/overview"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*User interface overview for Roblox Studio, the essential building tool for Roblox games.*

## Toolbar and mezzanine

The **toolbar** and **mezzanine** reside at the top of Studio.

*(image in the full Top G Vault)*

The left side of the mezzanine contains easily-accessible [[30 Official Roblox Docs/Studio/Studio testing modes|testing controls]].

*(image in the full Top G Vault)*

The right side of the mezzanine contains buttons/menus for [[30 Official Roblox Docs/Projects/Collaboration|collaboration]], sharing, [[30 Official Roblox Docs/Assistant/Assistant for Studio|Assistant]], creator notifications, and account options.

*(image in the full Top G Vault)*

In the center of the mezzanine are the default tool tabs of **Home**, **Model**, **Avatar**, **UI**, **Script**, and **Plugins**. You can also add [[30 Official Roblox Docs/Studio/Studio interface#Custom tabs|custom tabs]] for your specific needs.

*(image in the full Top G Vault)*

### Home

The **Home** tab contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, [[30 Official Roblox Docs/Parts/Parts#Insert parts|part inserter]], the [[30 Official Roblox Docs/Parts/Parts#Color|color]] and [[30 Official Roblox Docs/Parts/Parts#Material|material]] widgets, the [[30 Official Roblox Docs/Parts/Parts#Group|group]] and [[30 Official Roblox Docs/Parts/Parts#Lock|lock]] tools, and [[30 Official Roblox Docs/Parts/Parts#Anchor|anchor]] toggle. Also contains the [[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]].

### Model

The **Model** tab contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, the [[30 Official Roblox Docs/Studio/Pivot tools|pivot]] and [[30 Official Roblox Docs/Studio/Align tool|align]] tools, insertion widgets for [[30 Official Roblox Docs/Effects/Effects|effects]] and [[30 Official Roblox Docs/Physics/Physics#Constraints|constraints]], and [[30 Official Roblox Docs/Parts/Solid modeling|solid‑modeling]] tools.

### Avatar

The **Avatar** tab contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, as well as specialized tools for building default rigs, configuring [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|avatars]], working with [[30 Official Roblox Docs/Animation/Animation in Roblox|animations]], and [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|creating/fitting accessories]].

### UI

The **UI** tab contains insertion widgets for [[30 Official Roblox Docs/UI/User interface#UI objects|UI objects]] and lets you access the [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]], a comprehensive tool that allows you to create, manage, and apply UI styles.

### Script

The **Script** tab contains tools for writing and testing scripts, including [[30 Official Roblox Docs/Studio/Debugging|debugging]] tools.

### Plugins

The **Plugins** tab contains [[30 Official Roblox Docs/Studio/Studio plugins|plugins]] created by the community or plugins you've created yourself to use across your games.

### Appearance

You can customize the appearance of the toolbar by right-clicking in an empty area within the mezzanine/toolbar and selecting from the following options:

- **Manage tabs** — Reveals a popup window with the following options:

  *(image in the full Top G Vault)*

  1. Show or hide the tab.
  2. With a tab selected, reorder it relative to the other tabs.
  3. Delete a selected [[30 Official Roblox Docs/Studio/Studio interface#Custom tabs|custom tab]].
  4. Choose between tabs **Center** alignment or **Left** alignment (next to the [[30 Official Roblox Docs/Studio/Studio testing modes|testing controls]]).

- **Collapse toolbar** — Maximizes space by hiding the toolbar while keeping the mezzanine visible. Hovering over a tab in the mezzanine temporarily reveals the toolbar.
- **Compact toolbar** — Makes the toolbar considerably more compact through smaller icons and labels, ideal for laptops or smaller monitors.
- **Show labels** — Toggles the text labels below tools on or off.

### Custom tabs

Beyond the default tool tabs, you can add **custom tabs** for your specific needs, either through Studio's interface or by editing local `.json` files.

#### Studio

The easiest way to create custom tabs is through Studio's workflow.

1. Click the <kbd>+</kbd> button to the right of the default tabs, then type in a name for the new tab and press <kbd>Enter</kbd>.

   *(image in the full Top G Vault)*

   > [!success]
   > Alternatively to creating a new, empty tab, you can duplicate any existing tab by right‑clicking it and selecting **Duplicate tab**. Unlike default tabs, tools within duplicated tabs can be freely modified.

2. Click the button or right‑click in an empty region of the toolbar and select **Add tools**.

   *(image in the full Top G Vault)*

3. In the popup window, search for a tool and toggle its checkbox to add. New tools appear to the right of other tools, but you can right‑click any tool and select **Move left** or **Move right** to reorder it relative to other tools. You can also insert a divider by right‑clicking in an empty region of the toolbar and selecting **Add divider**.

   *(image in the full Top G Vault)*

   > [!info]
   > If you need to remove a tool from a custom tab, right‑click it and select **Remove tool**.

#### JSON

Custom tab configurations are saved **locally** on each machine in `.json` format, allowing you to build customized tabs and share them with your team or the community.

1. **OPTIONAL** To modify `.json` from a default tab toolset, begin by right‑clicking an existing tab and selecting **Duplicate tab**.

2. Open the custom tabs folder which is stored in a location unaffected by Studio updates.

   - **Windows** — `%LOCALAPPDATA%\Roblox\<userID>\CustomRibbonTabs`
   - **Mac** — `~/Documents/Roblox/<userID>/CustomRibbonTabs`

3. In the `CustomRibbonTabs` directory are `.json` files which define the toolbar's structure:

   - The `RibbonLayout.json` file controls the overall ordering and visibility of tabs.

     ```json title="RibbonLayout.json"
     {
     	"TabLayout": [
     		{
     			"Identifier": {
     				"Type": "BuiltIn",
     				"Filename": "HomeTab"
     			},
     			"Visible": true
     		},
     {
     ```

   - Other `.json` files represent individual tabs and can be named whatever you prefer. Each file's `Name` represents the tab's name as it will appear in Studio.

     ```json title="CustomTab.json"
     {
       "Name": "Custom",
       "Controls": []
     }
     ```

4. In the `Controls` array for a tab file, insert various buttons, submenus, and more. Each control's `Id` value must be **unique** within the file.

   The following examples illustrate common elements in a custom tab:

    #### IconButton

     `IconButton` inserts a button with an optional text label.

    ```json title="CustomTab.json"
    {
      "Name": "Custom",
      "Controls": [
        {
          "Id": "Select",
          "Type": "IconButton",
          "Action": {
            "Category": "Actions",
            "DataModel": "Standalone",
            "ItemId": "Select",
            "PluginId": "BuilderTools"
          }
        }
      ]
    }
    ```

    #### Separator

     `Separator` inserts a non-interactable separation line. `Size` options are `Large`, `Medium`, or `Small`.

    ```json title="CustomTab.json"
    {
      "Name": "Custom",
      "Controls": [
        {
          "Type": "Separator",
          "Size": "Large"
        }
      ]
    }
    ```

    #### SplitButton

     `SplitButton` inserts a button which reveals a dropdown menu when the small triangle to the right of its icon is pressed.

    ```json title="CustomTab.json"
    {
      "Name": "Custom",
      "Controls": [
        {
          "Id": "SimpleSplit",
          "Type": "SplitButton",
          "Action": {
            "Category": "Actions",
            "DataModel": "Standalone",
            "ItemId": "Select",
            "PluginId": "BuilderTools"
          },
          "Children": [
            {
              "Type": "Column",
              "Children": [
                {
                  "Id": "Move",
                  "Type": "Option",
                  "Action": {
                    "Category": "Actions",
                    "DataModel": "Standalone",
                    "ItemId": "Move",
                    "PluginId": "BuilderTools"
                  }
                },
                {
                  "Id": "Scale",
                  "Type": "Option",
                  "Action": {
                    "Category": "Actions",
                    "DataModel": "Standalone",
                    "ItemId": "Scale",
                    "PluginId": "BuilderTools"
                  }
                },
                {
                  "Id": "Rotate",
                  "Type": "Option",
                  "Action": {
                    "Category": "Actions",
                    "DataModel": "Standalone",
                    "ItemId": "Rotate",
                    "PluginId": "BuilderTools"
                  }
                }
              ]
            }
          ]
        }
      ]
    }
    ```

    #### IconButton (Plugin)

     `IconButton` can be used to insert a button which links to a [[30 Official Roblox Docs/Studio/Studio plugins|plugin]] through its ID, assuming the plugin, such as [Tailor Swiftly](https://create.roblox.com/store/asset/130172194397869/Tailor-Swiftly), is installed in your version of Studio.

    ```json title="CustomTab.json"
    {
      "Name": "Custom",
      "Controls": [
        {
          "Id": "PrinceTybalt_Tailor Swiftly",
          "Type": "IconButton",
          "Action": {
            "Category": "Actions",
            "DataModel": "Edit",
            "ItemId": "PrinceTybalt_Tailor Swiftly",
            "PluginId": "130172194397869",
            "PluginType": "Cloud"
          }
        }
      ]
    }
    ```

    #### Text

     `Text` inserts a basic text label, useful to label groups of other controls in submenus.

    ```json title="CustomTab.json"
    {
      "Name": "Custom",
      "Controls": [
        {
          "Id": "CustomHeader",
          "Type": "Text",
          "Title": "Insert UI"
        }
      ]
    }
    ```

    > [!success]
    > Beyond the above examples, you can right-click any default tab and select **Duplicate tab**. This will create a new custom tab and corresponding `.json` file in your local `CustomRibbonTabs` directory which you can inspect to explore how various default tools and menus are constructed.

5. Save the `.json` file and then reload Studio's plugins:

   1. Right-click anywhere in the toolbar or mezzanine and select **Manage tabs**.
   2. Access the options menu from the popup's upper‑right corner and select **Reload custom tabs**.

      *(image in the full Top G Vault)*

## 3D viewport

The 3D viewport represents the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] of a place. From here, you can move the camera around the virtual world, manipulate objects with the mouse, and playtest a game without leaving Studio.

*(image in the full Top G Vault)*

*3D viewport in Roblox Studio*

### Camera controls

Inside the viewport, you can move the camera with the following controls.

| Keys/Shortcuts | Action |
| --- | --- |
| <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> | Moves the camera forward/left/back/right. |
| <kbd>Q</kbd> <kbd>E</kbd> | Moves the camera down/up. |
| <kbd>Shift</kbd> | In combination with any movement key, changes the camera speed. |
| <kbd>F</kbd> | Focuses the camera on a selected part. |
| **Right Mouse Button** | When pressed, dragging the mouse moves the camera view around. |
| **Mouse Scroll Wheel**<br><kbd>Ctrl</kbd><kbd>=</kbd> or <kbd>⌘</kbd><kbd>=</kbd><br><kbd>Ctrl</kbd><kbd>-</kbd> or <kbd>⌘</kbd><kbd>-</kbd> or <kbd>O</kbd> | Zooms the camera in or out.<br>Zooms the camera in.<br>Zooms the camera out. |
| <kbd>,</kbd> / <kbd>.</kbd> | Rotates the camera left/right. If a part/model is in focus via the <kbd>F</kbd> shortcut, rotates the camera counterclockwise/clockwise around that focused object. |
| **Middle Mouse Button** | When pressed, dragging the mouse pans the camera. |
| **Right Mouse Button** & **Mouse Scroll Wheel** | Pressing the right mouse button and scrolling the mouse wheel **up** increases the camera scroll speed. Conversely, pressing the right mouse button and scrolling the mouse wheel **down** reduces the camera scroll speed.> [!success] > **File** ⟩ **Beta Features** ⟩ **** |

### Object selection

As you hover over parts and models in the viewport, they are outlined to indicate their potential selection. You can select an outlined object by clicking it, or you can select multiple objects by holding <kbd>Shift</kbd>, <kbd>Ctrl</kbd>, or <kbd>⌘</kbd> as you hover over and click them.

*(image in the full Top G Vault)*

In more complex environments or when zoomed in, objects will commonly be hidden from your view by other objects in front. To select hidden objects without moving the camera around, hold <kbd>Alt</kbd> or <kbd>⌥</kbd> and click to perform **selection cycling** to the next further object behind the currently selected object.

[Video: Selection-Cycling.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/general/Selection-Cycling.mp4)

> [!info]
> When one or more objects or [[30 Official Roblox Docs/Parts/Models|models]] are selected in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, you can select all of their **children** by right-clicking and choosing **Hierarchy** ⟩ **Select Children** from the context menu. Similarly, choosing **Select Parent(s)** selects the **direct parents** of those objects.

To customize the appearance of selection lines and boxes around objects, set your desired options in the **Selection Visualization** section within the **Selection** panel of Studio's settings.

*(image in the full Top G Vault)*

### Visualization options

In the upper-right corner of the 3D viewport, you can quickly toggle or set common visualization options related to [[30 Official Roblox Docs/UI/On-screen UI containers|on‑screen UI]] overlays, [[30 Official Roblox Docs/Effects/Light sources|light sources]], physics simulation, character [[30 Official Roblox Docs/Characters/Pathfinding|pathfinding]], and more. The menu also contains a control for viewing/setting the camera scroll speed.

*(image in the full Top G Vault)*

## Frequently-used tools

Commonly used windows include the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]], the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md), [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md), and others.

### Explorer

The [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, visible by default and accessible from Studio's **Window** menu or **Home** tab, shows a hierarchical list of every object and service inside the place, collectively referred to as its **data model**. Frequently used services in the hierarchy include [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] which mirrors the [[30 Official Roblox Docs/Studio/Studio interface#3D viewport|3D viewport]], as well as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].

*(image in the full Top G Vault)*

### Properties

The [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, visible by default and accessible from Studio's **Window** menu or **Home** tab, lets you adjust properties of a selected object to change how it looks and behaves. Object properties are divided into sections; for example, a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] includes sections like **Appearance** which allows you to change its color, material, transparency, and more.

*(image in the full Top G Vault)*

At the bottom of the window, you can define custom [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] for an object, similar to its default properties. Attributes and their values are saved with your place/assets and they're an ideal way for team members to experiment with different values during runtime, even if they don't understand the underlying code.

*(image in the full Top G Vault)*

### Asset Manager

The [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md), accessible from Studio's **Window** menu or **Home** tab, lets you manage places, images, meshes, audio, and more. It also provides a mechanism to bulk import large groups of assets.

### Toolbox

The [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md), accessible from Studio's **Window** menu or **Home** tab, contains a selection of models, images, meshes, audio, plugins, videos, and fonts made by Roblox or Roblox community members. It also includes all of the creations that you've personally [[30 Official Roblox Docs/Production/Creator Store|distributed on the Creator Store]] or those which were distributed by [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you belong to.

*(image in the full Top G Vault)*

### Output

The [[30 Official Roblox Docs/Studio/Output|Output]] window, accessible from Studio's **Window** menu or **Script** tab, displays errors captured from running scripts, messages from Roblox Engine, messages from calls to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print|print()]], and errors from calls to [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#warn|warn()]].

### Command Bar

The **Command Bar**, accessible from Studio's **Script** tab toolbar or the **Window** ⟩ **Script** menu, lets you execute Luau code outside of scripts. To quickly jump to the command bar at any time, press <kbd>Ctrl</kbd><kbd>9</kbd> (Windows) or <kbd>⌘</kbd><kbd>9</kbd> (Mac).

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

*(image in the full Top G Vault)*

Features include:

- **Multiline editing** — Press <kbd>Enter</kbd> to insert new lines while typing. The bar starts with 2 lines, grows up to 10 lines as new lines are inserted, and shrinks as lines are deleted. When you're ready to run/execute the contents of the bar, click the **Run** button or use the shortcut <kbd>Ctrl</kbd><kbd>Enter</kbd> (<kbd>⌘</kbd><kbd>Enter</kbd>).

- **Command history** — The last 10 executed commands are visible by clicking the **History** button and navigating to the **Recent** tab. Clicking on a command in the list loads it into the bar, or you can navigate the list with <kbd>↑</kbd>/<kbd>↓</kbd> and insert the highlighted command with <kbd>Enter</kbd>. Alternatively, you can scrub through commands with

<kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>↑</kbd>/<kbd>↓</kbd>

 when the command bar is selected.

- **Saved commands** — You can explicitly save commands with the **Save** button or the default shortcut <kbd>Ctrl</kbd><kbd>B</kbd> (<kbd>⌘</kbd><kbd>B</kbd>). Saved commands can be accessed through the **Saved** tab in the popup list, and the mechanics of loading saved commands from the list are the same as those in the command history.

- **Script Editor integration** — The command bar is an embedded script editor and supports a wide subset of Studio's [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]] features, including [[30 Official Roblox Docs/Studio/Script Editor#Autocomplete features|autocomplete]], Luau [linting](https://luau.org/lint), [[30 Official Roblox Docs/Studio/Script Editor#Go to declaration|go to declaration]], [[30 Official Roblox Docs/Studio/Script Editor#Script function filter|function filter]], [[30 Official Roblox Docs/Studio/Script Editor#Code Assist|Code Assist]], and [[30 Official Roblox Docs/Studio/Script Editor#Multi-cursor|multi‑cursor]].

## Layout customization

Studio's drag-and-drop interface lets you easily customize window layout to best suit your workflows.

### Reposition windows

You can reposition any window by click-dragging its **header bar**. As you begin dragging the window, the interface reveals **empty docking area** regions. If you drag the mouse pointer into any empty region, a floating **position selector** appears in that region. Dragging the pointer over the "center" of the floating selector targets the empty region as the dragged window's destination, indicated by the region darkening and becoming outlined.

*(image in the full Top G Vault)*

*Mouse pointer hovering over the "center" icon of the position selector in an empty docking area*

If you drag the mouse pointer into a **populated** region such as the 3D viewport, a floating position selector appears with multiple options for the window's destination. For example, dragging the pointer over the "left" icon will position the window on the region's left side.

#### Viewport left

*(image in the full Top G Vault)*

#### Viewport right

*(image in the full Top G Vault)*

### Group windows

If you drag a window into a **populated** region and choose the "center" icon of the [[30 Official Roblox Docs/Studio/Studio interface#Reposition windows|position selector]], the dragged window will group into that region as a tab. This allows you to set up tab groups of commonly used windows.

*(image in the full Top G Vault)*

*Three windows grouped together as tabs*

### Pin windows

To maximize screen space for the 3D viewport, you can **pin** windows (or an entire [[30 Official Roblox Docs/Studio/Studio interface#Group windows|group]] of windows) to the edges of the overall Studio window. Once pinned, you can temporarily open any window by clicking its tab — this does not disturb other windows, and the expanded window will automatically collapse when you click in another window or click its tab again.

*(image in the full Top G Vault)*

*Three windows pinned to the right side of the Studio window*

To pin a window or an entire [[30 Official Roblox Docs/Studio/Studio interface#Group windows|group]] of windows, click the "collapse" button. Alternatively, to un‑pin a pinned window/group, open it by clicking its tab, then click the "expand" button.

*(image in the full Top G Vault)*

### Float windows

To float a window freely of other windows, simply drag‑and‑drop it without selecting any icon from the floating [[30 Official Roblox Docs/Studio/Studio interface#Reposition windows|position selector]].

---
*Source: [Studio interface](https://create.roblox.com/docs/studio/overview) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
