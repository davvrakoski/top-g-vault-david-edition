---
title: "Text & image labels"
description: "Explore how labels display customizable text and images in user interfaces."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/labels"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore how labels display customizable text and images in user interfaces.*

**Labels** are [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that let you display customizable text and images [[30 Official Roblox Docs/UI/On-screen UI containers|on‑screen]] or [[30 Official Roblox Docs/UI/In-game UI containers|in-game]]. There are two types of labels:

- A [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] is a rectangle with text that you can style through customizable properties. This is the primary way to display text in a game.

- An [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] is a rectangle with an image [asset](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) that you can style through customizable properties. Alongside [[30 Official Roblox Docs/Parts/Textures and decals|textures and decals]], this lets you display images in a game.

## Create labels on the screen

Labels on a screen are useful for things like displaying images of characters
with dialog.

To add a label to a screen:

1. In the **Explorer** window, select **StarterGui** and add a **ScreenGui**.

   1. Hover over StarterGui and click the ⊕ button. A contextual menu displays.

   1. From the menu, insert a **ScreenGui**.

2. Select the new **ScreenGui** and add a label.

   1. Hover over **ScreenGui** and click the ⊕ button. A contextual menu displays.

   1. From the menu, insert a **TextLabel** or **ImageLabel**.

   *(image in the full Top G Vault)*

## Create labels on part faces

Labels on a part are useful for things like creating billboards, posters, and
wallpaper.

To add a label to the face of a part:

1. In the **Explorer** window, insert a **SurfaceGui** onto the part.

   1. Hover over the part instance and click the ⊕ button. A contextual menu displays.

   1. From the menu, insert a **SurfaceGui**.

2. Select the new **SurfaceGui** and add a label.

   1. Hover over the **SurfaceGui** and click the ⊕ button. A contextual menu displays.

   1. From the menu, insert a **TextLabel** or **ImageLabel**.

   *(image in the full Top G Vault)*

   > [!warning]
   > If you don't see the button, try [[30 Official Roblox Docs/Parts/Textures and decals|choosing a different face]] in the **Face** property of the **SurfaceGui**.

## Adjust ImageLabel properties

All images within an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] must be assets that have been [imported](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) to Studio. While the image automatically scales to fit the area of the rectangle, the image looks best when it displays at its native resolution.

You can customize the visual appearance of an image with the following
properties:

- [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3|ImageColor3]]

- [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency|ImageTransparency]]

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]]

For example, to display only the image and hide the rectangle, set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] property to `1`.

---
*Source: [Text & image labels](https://create.roblox.com/docs/ui/labels) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
