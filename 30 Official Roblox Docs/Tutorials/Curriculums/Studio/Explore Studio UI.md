---
title: "Explore Studio UI"
description: "Explains how to navigate Studio's fundamental UI."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/studio/explore-ui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to navigate Studio's fundamental UI.*

Welcome to your first session in Roblox Studio! Before you jump in and begin building games, let's take a moment to walk through Studio's essential UI. While this overview provides a solid foundation to get started, there are many additional windows and tools that you can discover and customize in the [[30 Official Roblox Docs/Studio/Studio interface|Studio interface]].

> [!info] Coming to Studio from another game engine?
> Check out one of the following guides that explains the key differences between Studio and Unity or Unreal: [[30 Official Roblox Docs/General/Roblox for Unity developers|Roblox for Unity developers]] or [[30 Official Roblox Docs/General/Roblox for Unreal developers|Roblox for Unreal developers]].

## Mezzanine

*(image in the full Top G Vault)*

The **mezzanine** is the top-most section of Studio and it includes:

- [[30 Official Roblox Docs/Studio/Studio testing modes|Playtest options]] that allow you to simulate what players see on their devices.
- Tabs like **Model**, **Avatar**, and **Script** that filter the [[30 Official Roblox Docs/Tutorials/Curriculums/Studio/Explore Studio UI#Toolbar|toolbar]] tools for their respective tasks.
- [[30 Official Roblox Docs/Projects/Collaboration|Collaborator]] information for games that you work on with others.
- The [[30 Official Roblox Docs/Assistant/Assistant for Studio|Assistant]] tool that you can use as an aid to supplement your skills and assist with development tasks.

## Toolbar

*(image in the full Top G Vault)*

The **toolbar** is the section right below the mezzanine that displays all tools and insertable objects that relate to your active tab:

- **Home** contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, [[30 Official Roblox Docs/Parts/Parts#Insert parts|part inserter]], the [[30 Official Roblox Docs/Parts/Parts#Color|color]] and [[30 Official Roblox Docs/Parts/Parts#Material|material]] widgets, the [[30 Official Roblox Docs/Parts/Parts#Group|group]] and [[30 Official Roblox Docs/Parts/Parts#Lock|lock]] tools, and [[30 Official Roblox Docs/Parts/Parts#Anchor|anchor]] toggle. Also contains the [[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]].

- **Model** contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, the [[30 Official Roblox Docs/Studio/Pivot tools|pivot]] and [[30 Official Roblox Docs/Studio/Align tool|align]] tools, insertion widgets for [[30 Official Roblox Docs/Effects/Effects|effects]] and [[30 Official Roblox Docs/Physics/Physics#Constraints|constraints]], and [[30 Official Roblox Docs/Parts/Solid modeling|solid‑modeling]] tools.

- **Avatar** contains the core [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools, as well as specialized tools for building default rigs, configuring [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|avatars]], working with [[30 Official Roblox Docs/Animation/Animation in Roblox|animations]], and [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|creating/fitting accessories]].

- **UI** contains insertion widgets for [[30 Official Roblox Docs/UI/User interface#UI objects|UI objects]] and lets you access the [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]], a comprehensive tool that allows you to create, manage, and apply UI styles.

- **Script** contains tools for writing and testing scripts, including [[30 Official Roblox Docs/Studio/Debugging|debugging]] tools.

- **Plugins** contains [[30 Official Roblox Docs/Studio/Studio plugins|plugins]] created by the community or plugins you've created yourself to use across your games.

When you are more comfortable with Studio, you can also create [[30 Official Roblox Docs/Studio/Studio interface#Custom tabs|custom tabs]] for your own development needs.

## 3D viewport

*(image in the full Top G Vault)*

The **3D viewport** is the largest window in Studio that provides you a view into the 3D space. After you click in the 3D viewport, you can move the camera, edit objects with your mouse, and playtest the game from your players' point-of-view.

For common camera controls, see the following table.

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

> [!info]
> It's **strongly** recommended to use a 2-button mouse with a scroll wheel to make navigating the 3D space easier.

## Toolbox

*(image in the full Top G Vault)*

The [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) contains a selection of models, images, meshes, audio, plugins, videos, and fonts from either Roblox or fellow creators on the platform. It offers four tabs:

- **Creator Store** is a marketplace of both free and for sale assets to use within your games.
- **Inventory** contains assets that you or your groups have uploaded, or those that you found on the Creator Store.
- **Recent** contains your most recently used assets.
- **Creations** is similar to **Inventory**, but it excludes assets from the Creator Store.

## Explorer

*(image in the full Top G Vault)*

The [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window displays a hierarchical list of every object and service that runs out-of-the-box gameplay logic for the active **place** of your game. You can think of places like levels inside of a game.

> [!info]
> Places are comparable to scenes in Unity or maps in Unreal Engine.

Games can have one or multiple places that each contain all components for that portion of the game, including its specific environment, 3D objects, and scripts; these components collectively are called the **data model**. When you switch to a different place, the **Explorer** window updates accordingly to show that place's data model.

For more information on how the **Explorer** window organizes objects in the data model, see [[30 Official Roblox Docs/Projects/Data model|Data model]].

## Properties

*(image in the full Top G Vault)*

The [[30 Official Roblox Docs/Studio/Properties window|Properties]] window displays a selection of properties for a selected object that you can customize to change how the object looks and behaves in the 3D environment. Every time you select a different object in the 3D viewport or **Explorer** window, the **Properties** window updates accordingly to show that object's properties.

Now that you're familiar with Studio's core UI and what they're responsible for, you can continue learning about how to create with Studio.

---
*Source: [Explore Studio UI](https://create.roblox.com/docs/tutorials/curriculums/studio/explore-ui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
