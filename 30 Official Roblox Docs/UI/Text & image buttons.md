---
title: "Text & image buttons"
description: "Buttons allow players to prompt an action."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/buttons"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Buttons allow players to prompt an action.*

[[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButtons]] are [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] that allow players to perform an action. You can customize these buttons to provide context and feedback, such as changing the visual appearance or [[30 Official Roblox Docs/UI/Text & image buttons#Script buttons|scripting]] audible feedback when a player interacts with a button.

There are two types of buttons which you can place [[30 Official Roblox Docs/UI/On-screen UI containers|on‑screen]] or [[30 Official Roblox Docs/UI/In-game UI containers|in‑game]]:

- A [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] is a rectangle with text that triggers the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] and/or [[30 Official Roblox Docs/API Reference/Classes/GuiButton#SecondaryActivated|SecondaryActivated]] event on click/tap.

- An [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] is a rectangle with an image that triggers the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] and/or [[30 Official Roblox Docs/API Reference/Classes/GuiButton#SecondaryActivated|SecondaryActivated]] event on click/tap. It features additional states for swapping the image on player hover or press.

## Buttons on the screen

Buttons [[30 Official Roblox Docs/UI/On-screen UI containers|on the screen]] are useful to quickly guide players to various menus or pages. To add this type of button:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], click the ⊕ button, and insert a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
2. Hover over the new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], click the ⊕ button, and insert either a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]].

   *(image in the full Top G Vault)*

## Buttons on part faces

Buttons on a part are useful for allowing players to interact with parts. For
example, you can let players step on a button to complete an action.

To add a button to the face of a part:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the **part**, click the ⊕ button, and insert a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].
2. Hover over the new [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], click the ⊕ button, and insert either a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]].

   *(image in the full Top G Vault)*

   > [!warning]
   > If you don't see the button, try choosing a different face ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Top]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Bottom]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Front]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Back]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Left]], or [[30 Official Roblox Docs/API Reference/Enums/NormalId|Right]]) for the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase#Face|Face]] property of the [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].

## Button appearance

Both [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] and [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] inherit from [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] which contains properties like [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]], and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]]. Buttons also accept the [[30 Official Roblox Docs/UI/UI appearance modifiers|appearance modifiers]] common to most UI objects.

Unique to [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] are various properties to change its visual appearance:

- [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace|FontFace]] — The font used to render text.
- [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text|Text]] — The text string rendered on the button.
- [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]] — The line height of text in offsets.
- [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3|TextColor3]] — Color of the rendered text.

An [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] has several properties to change its visual appearance, including hover and pressed image variants to indicate a player's interaction with the button:

- [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] — The image that displays when a player is not interacting with the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]].
- [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImage|HoverImage]] — The image that displays when a player is hovering their cursor over the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]].
- [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImage|PressedImage]] — The image that displays when a player clicks/taps the [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]].

*(image in the full Top G Vault)*

*Normal*

*(image in the full Top G Vault)*

*Hover*

*(image in the full Top G Vault)*

*Pressed*

## Script buttons

You can script an action when a player presses a button by connecting the button to the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|GuiButton.Activated]] event, or to [[30 Official Roblox Docs/API Reference/Classes/GuiButton#SecondaryActivated|GuiButton.SecondaryActivated]] for cross‑platform secondary input like right‑click on desktop and long press on mobile. For example, when you parent the following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to a button, the button changes to a random color every time a player clicks/taps it.

```lua
local button = script.Parent
local RNG = Random.new()

local function onButtonActivated()
	-- Randomize the button color
	button.BackgroundColor3 = Color3.fromHSV(RNG:NextNumber(), 1, 1)
end

button.Activated:Connect(onButtonActivated)
```

---
*Source: [Text & image buttons](https://create.roblox.com/docs/ui/buttons) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
