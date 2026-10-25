---
title: "User interface"
description: "Explore the wide variety of user interface elements that players can interact with."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore the wide variety of user interface elements that players can interact with.*

You can quickly create high-quality graphical user interfaces with minimal scripting requirements using built-in [[30 Official Roblox Docs/UI/User interface#UI objects|UI objects]]. Depending on where you create it, UI renders either [[30 Official Roblox Docs/UI/User interface#On-screen UI|on-screen]] or [[30 Official Roblox Docs/UI/User interface#In-game UI|within a game's 3D world]].

## On-screen UI

[[30 Official Roblox Docs/UI/On-screen UI containers|On-screen containers]] hold UI objects that you want to display on a player's screen, including [[30 Official Roblox Docs/UI/Frames|frames]], [[30 Official Roblox Docs/UI/Text & image labels|labels]], [[30 Official Roblox Docs/UI/Text & image buttons|buttons]], and more. All on-screen UI objects and code are stored and changed on the client.

*(image in the full Top G Vault)*

## In-game UI

[[30 Official Roblox Docs/UI/In-game UI containers|In-game containers]] such as [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGuis]] and [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGuis]] hold UI objects that you want to display within your game's 3D world.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/in-experience/Showcase.mp4)

## UI objects

Most UI elements are [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], 2D graphical user interface objects that you can parent to containers. The four most common are [[30 Official Roblox Docs/UI/Frames|frames]], [[30 Official Roblox Docs/UI/Text & image labels|labels]], [[30 Official Roblox Docs/UI/Text & image buttons|buttons]], and [[30 Official Roblox Docs/UI/Text input fields|text input]] objects.

*(image in the full Top G Vault)*

| Object | Description |
| --- | --- |
| [[30 Official Roblox Docs/UI/Frames\|Frame]] | [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frames]] act as containers for other UI objects. When you manipulate frames, you also manipulate the objects they contain. |
| [[30 Official Roblox Docs/UI/Text & image labels\|Label]] | [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]] objects allow you to display customizable text and images. |
| [[30 Official Roblox Docs/UI/Text & image buttons\|Button]] | [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] and [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] objects allow users to prompt an action. |
| [[30 Official Roblox Docs/UI/Text input fields\|Text Input]] | [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] objects allow users to input text. |

Using the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] properties, you have complete control on how to [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]], [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]], and [[30 Official Roblox Docs/UI/Position and size UI objects#ZIndex|layer]] [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. You can also use [[30 Official Roblox Docs/UI/UI animation-tweens|tweening]] to transition a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] smoothly from one state to another and provide dynamic visual feedback.

## Layout and design

Beyond basic properties for adjusting position and size, Roblox also provides layout structures like [[30 Official Roblox Docs/UI/List and flex layouts|list/flex]] and [[30 Official Roblox Docs/UI/Grid and table layouts|grid]], as well as [[30 Official Roblox Docs/UI/Size modifiers and constraints|size modifiers]] and [[30 Official Roblox Docs/UI/UI appearance modifiers|appearance modifiers]].

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] for horizontal or vertical item sequences*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] on [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] with [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]]*

## Universal styling

[[30 Official Roblox Docs/UI/Styling/UI styling|Universal styling]] is a Roblox solution to stylesheets, similar to CSS, that lets you declare and globally apply overrides to UI instance properties. This engine‑level support is the foundation for the [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]] and the end‑to‑end token pipeline.

## Interactive frameworks

In addition to the core [[30 Official Roblox Docs/UI/User interface#UI objects|user interface objects]], the following frameworks provide built‑in and customizable interactivity for your games.

### Proximity prompts

[[30 Official Roblox Docs/UI/Proximity prompts|Proximity prompts]] are unique built-in UI objects which prompt user interaction to trigger an action when they approach in-game objects such as doors, light switches, and buttons.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/proximity-prompt/Showcase.mp4)

### UI drag detectors

[[30 Official Roblox Docs/UI/UI drag detectors|UI drag detectors]] facilitate and encourage interaction with 2D user interface elements such as sliders, spinners, and more.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-drag-detectors/Showcase.mp4)

### 3D drag detectors

[[30 Official Roblox Docs/UI/3D drag detectors|3D drag detectors]] encourage physical interaction with 3D objects in a game, such as opening doors and drawers, sliding a part around, grabbing and tossing a bowling ball, pulling back and firing a slingshot, and much more.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/3D-drag-detectors/Showcase.mp4)

---
*Source: [User interface](https://create.roblox.com/docs/ui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
