---
title: "Position and size UI objects"
description: "Explains the process of positioning, sizing, and ordering UI objects on a player's screen."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/position-and-size"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process of positioning, sizing, and ordering UI objects on a player's screen.*

Unless UI objects are under control of a [[30 Official Roblox Docs/UI/Position and size UI objects#Layout structures|layout structure]] or a [[30 Official Roblox Docs/UI/Size modifiers and constraints|size modifier/constraint]], you have complete control over their [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]]. You can also set the Z‑index [[30 Official Roblox Docs/UI/Position and size UI objects#ZIndex|layering]] order in which objects overlap.

## Core properties

All [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] share a core set of properties to [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]], [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]], [[30 Official Roblox Docs/UI/Position and size UI objects#AnchorPoint|anchor]], and [[30 Official Roblox Docs/UI/Position and size UI objects#ZIndex|layer]] them within an on‑screen or in-game container.

### Position

The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] property is a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set that positions the object along the **X** and **Y** axes. A [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] is represented by both [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values for each axis:

- [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values represent a **percentage** of the container's size along the corresponding axis, additive of any [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values.
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values represent how many **pixels** to shift the object on the corresponding axis, additive of any [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values.

*(image in the full Top G Vault)*

To edit the position of a selected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], click the **Position** field in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and enter a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!success]
> Brackets and spaces are **optional** when entering a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] in Studio — you can simply enter the four values separated by commas, for instance `0.25,40,0.1,20`, and Studio will infer the intended value set.
>
> Studio also infers the intended value set when a single number is entered. For example, entering simply `0.5` will be converted to
>
> `{0.5, 0},{0.5, 0}`
>
>  since `0.5` is likely a **Scale** value of 50%. Conversely, entering `20` will be converted to
>
> `{0, 20},{0, 20}`
>
>  since `20` is likely an **Offset** value of 20 pixels and not a scale of 2000%.

### Size

The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] property is a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set that sizes the object along the **X** and **Y** axes. A [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] is represented by both [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values for each axis:

- **Scale** — Values that represent a **percentage** of the container's size along the corresponding axis, additive to any **Offset** values.
- **Offset** — Values that represent the object's **pixel** size along the corresponding axis, additive to any **Scale** values.

To edit the size of a selected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], click the **Size** field in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and enter a new [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!success]
> Brackets and spaces are **optional** when entering a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] in Studio — you can simply enter the four values separated by commas, for instance `0.75,0,0.25,0`, and Studio will infer the intended value set.
>
> Studio also infers the intended value set when a single number is entered. For example, entering simply `0.5` will be converted to
>
> `{0.5, 0},{0.5, 0}`
>
>  since `0.5` is likely a **Scale** value of 50%. Conversely, entering `20` will be converted to
>
> `{0, 20},{0, 20}`
>
>  since `20` is likely an **Offset** value of 20 pixels and not a scale of 2000%.

### AnchorPoint

The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] property defines the **origin point** from where the object changes [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]]. The default [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] values are

`(0, 0)`

 which places the anchor in the top‑left corner of the object.

[[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] values are a **fraction** from `0` to `1`, relative to the [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]] of the object, meaning an object with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] values of

`(0.5, 0.5)`

 places the anchor point halfway (50%) through the object both horizontally and vertically, and any changes to its [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]] or [[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]] both move and scale outward from this point.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

To view and edit the anchor point of a selected [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]:

1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, click inside the **AnchorPoint** field.

   *(image in the full Top G Vault)*

2. Enter a new [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] coordinate and press <kbd>Enter</kbd>.

    > [!success]
    > Studio infers the intended value pair when a single number is entered. For example, entering simply `0.5` will be converted to
    >
    > `0.5, 0.5`
    >
    >  for a center anchor point.

### ZIndex

The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] property defines the layer order in which [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] render and overlap each other. If you want to create new rendering layers, you must set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] property to different positive or negative integer values for each object.

For UI containers like [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], the default [[30 Official Roblox Docs/API Reference/Classes/LayerCollector#ZIndexBehavior|ZIndexBehavior]] always renders children above their parents, and each child's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] is used to decide the order in which it renders over others.

To edit an object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]], locate **ZIndex** in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and enter a new integer value.

*(image in the full Top G Vault)*

## Layout structures

Layout structures let you quickly organize and display [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], for example into a horizontal or vertical [[30 Official Roblox Docs/UI/List and flex layouts|list]], a [[30 Official Roblox Docs/UI/Grid and table layouts#Grid layout|grid]] of equally‑sized tiles, a [[30 Official Roblox Docs/UI/Page layouts|page sequence]], and more. Layouts typically override or influence the [[30 Official Roblox Docs/UI/Position and size UI objects#Position|position]]/[[30 Official Roblox Docs/UI/Position and size UI objects#Size|size]] of objects under their control.

| Layout | Description |
| --- | --- |
| [[30 Official Roblox Docs/UI/Grid and table layouts#Grid layout\|List]] | [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] into horizontal rows or vertical columns within their parent container. |
| [[30 Official Roblox Docs/UI/Grid and table layouts#Grid layout\|Grid]] | [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout\|UIGridLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] in a grid of uniform cells of the same size within their parent container. |
| [[30 Official Roblox Docs/UI/Grid and table layouts#Table layout\|Table]] | [[30 Official Roblox Docs/API Reference/Classes/UITableLayout\|UITableLayout]] positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] and their children into table format. |
| [[30 Official Roblox Docs/UI/Page layouts\|Page]] | [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout\|UIPageLayout]] organizes its sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] into unique pages that you can transition to through scripting. |

## Cross-platform factors

Roblox is inherently [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]], as players can discover and join games on their phone or tablet, then later continue where they left off on their PC or console. You should design your Roblox games to be accessible and enjoyable on **all** platforms that you choose to support, instead of optimizing for one platform and neglecting others.

### Reserved zones

On mobile devices, the default controls occupy a portion of the bottom-left and bottom-right corners of the screen. When you design a game's UI, avoid placing important info or virtual buttons in these zones.

*(image in the full Top G Vault)*

### Thumb zones

Most mobile players use two thumbs — one on the virtual thumbstick and one on the jump button. Depending on the physical size of the device and the player's hands, reaching too far from the bottom corners becomes uncomfortable or impossible, so you should avoid placing frequently‑used buttons outside of easy‑to‑reach zones.

*(image in the full Top G Vault)*

> [!success]
> Button comfortably within reach of player's right thumb

*(image in the full Top G Vault)*

> [!warning]
> Button difficult to reach unless player stretches hand or thumb

<br>

Remember that comfortable thumb zones differ between phones and tablets because tablets have a larger screen. A button placed 40% below the screen's top edge is reachable on a phone but almost unreachable on a tablet.

*(image in the full Top G Vault)*

> [!success]
> Button 40% from top edge of phone, within reach of player's thumb

*(image in the full Top G Vault)*

> [!warning]
> Button 40% from top edge of tablet, difficult to reach without stretching

A reliable approach on both phones and tablets is **relative** positioning of custom buttons near frequently‑used controls like the default jump button, placing them within easy reach.

*(image in the full Top G Vault)*

The following code, placed in a client-side script within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], fetches the position of the jump button and creates a placeholder [[30 Official Roblox Docs/UI/Text & image buttons|button]] 20 pixels to its left.

```lua title="Client Script - Custom Button Near Jump Button"
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if UserInputService.TouchEnabled then
	-- Wait for jump button to be fully loaded
	while not (playerGui:FindFirstChild("JumpButton", true) and playerGui:FindFirstChild("JumpButton", true).IsLoaded) do
		task.wait()
	end
	local jumpButton = playerGui:FindFirstChild("JumpButton", true)

	-- Place new custom button to left of jump button
	local customButton = Instance.new("ImageButton")
	customButton.AnchorPoint = Vector2.new(1, 1)
	customButton.Size = UDim2.fromOffset(jumpButton.Size.X.Offset * 0.8, jumpButton.Size.Y.Offset * 0.8)
	customButton.Position = jumpButton.Position + UDim2.fromOffset(-20, jumpButton.Size.Y.Offset)
	customButton.Parent = jumpButton.Parent
else
	warn("Device is not touch-enabled or Studio is not emulating a touch-enabled device!")
end
```

### Context-based UI

Screen space is limited on mobile devices, so you should show only the most vital information during active gameplay. For example, if your game includes a special input action to open doors and treasure chests, it doesn't make sense to constantly show an "open" button on the screen. Instead, use a [[30 Official Roblox Docs/UI/Proximity prompts|proximity prompt]] or similar method to accept input only when the character approaches a door or chest.

*(image in the full Top G Vault)*

*Custom button that you display only when character is near a door or chest*

---
*Source: [Position and size UI objects](https://create.roblox.com/docs/ui/position-and-size) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
