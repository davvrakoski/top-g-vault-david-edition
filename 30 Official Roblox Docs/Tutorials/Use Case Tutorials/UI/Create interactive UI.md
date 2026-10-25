---
title: "Create interactive UI"
description: "Learn how to build interactive UI and connect stateful scripts to power it."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/interactive-ui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to build interactive UI and connect stateful scripts to power it.*

A **HUD** (**Heads-Up Display**) in your game commonly displays non‑interactive UI elements such as the health meter demonstrated in [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters|Create HUD meters]]. Atop this, almost every game requires **interactive** UI such as buttons that respond to player activation, animate when activated, tween in/out menus with other interactive controls, etc.

*(image in the full Top G Vault)*

Using [UI Fundamentals - HUD Meter](https://www.roblox.com/games/104506915856758/UI-Fundamentals-HUD-Meter) as a starting place and [UI Fundamentals - Interactivity](https://www.roblox.com/games/138499606610292/UI-Fundamentals-Interactivity) as a finished reference place, this tutorial demonstrates:

- How to position a settings button along the top screen edge.
- Design of a settings menu containing interactive draggable sliders.
- Usage of a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] to form "controller" modules for extensible control of UI objects with stateful declarations.
- How to connect buttons to player activation to toggle in/out the settings menu.
- How to connect draggable UI sliders to adjust the volume of sound effects and background ambience separately.

## Enable the Device Emulator

As noted in [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters|Create HUD meters]], phones and tablets have the least amount of screen space, so it's important that your UI elements fit on smaller screens and that they're clearly visible to players. If you haven't done so already, enable the [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]] in Studio:

1. Open the [UI Fundamentals - HUD Meter](https://www.roblox.com/games/104506915856758/UI-Fundamentals-HUD-Meter) template in Studio.

   [Open the place on Roblox](https://www.roblox.com/games/104506915856758)

2. From Studio's **Test** menu, toggle on **Device Emulator**.
3. From the bar directly above the main viewport, select a phone emulation such as **iPhone X** or **Samsung Galaxy A51**. Then, set the view size to **Fit to Window** to utilize the maximum space in Studio.

   *(image in the full Top G Vault)*

## Create the settings button

[[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButtons]] are interactive user interface elements with built‑in functionality such as the multi‑platform [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated|Activated]] event which fires when the button is clicked or tapped. The [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] class extends to two variations, [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] and [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], and this tutorial uses a "gear" shaped [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] to toggle the settings menu open or closed.

*(image in the full Top G Vault)*

To construct the settings button:

1. In the **Explorer** window, locate **HUDContainer** inside [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].

   *(image in the full Top G Vault)*

2. Insert an [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] into **HUDContainer** and rename it to **SettingsButton**.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

3. With the new button selected, set the following in the **Properties** window:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0.5, 0.25` (horizontal center and vertical upper quarter)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `1` (fully transparent)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0.5, 0, 0, 0` (top-center positioning)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `0.1, 0, 0.1, 0` (10% of screen height once aspect ratio is constrained)
   - [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] = `rbxassetid://104919049969988` (asset ID of "gear" symbol)

4. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] into the button with default properties (1:1 width to height).

   *(image in the full Top G Vault)*

5. To limit the button's maximum pixel height, insert a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] and set its [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] to

`inf, 44`

.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Create the settings menu

The new [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the settings button|settings button]] will be scripted to toggle a settings menu open and closed, giving players on‑demand access to settings or other information. In this tutorial, the menu will contain interactive sliders to adjust the volume levels of background audio and sound effects independently.

*(image in the full Top G Vault)*

### Create the parent frame

As noted in [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters|Create HUD meters]], a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] serves as a container for other UI objects. The entire settings menu will be constructed with a single parent frame, making it simple to manage as a stateful object that reacts to input differently depending on the current state.

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into **HUDContainer** and rename it **SettingsMenu**.

   *(image in the full Top G Vault)*

2. With **SettingsMenu** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0.5` (center anchor)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] = `30, 30, 60` (navy blue)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `0.25` (75% opaque)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0.5, 0, 0.5, 0` (center of screen)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `0.75, 0, 0.75, 0` (75% width/height of the inset screen area)

   *(image in the full Top G Vault)*

3. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] into **SettingsMenu** and set its [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] property to `2.5`. (2.5:1 width to height).

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

4. Insert a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] modifier into **SettingsMenu** and set its [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] to

`0.1, 0`

.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

5. To constrain the pixel width and height of **SettingsMenu**, insert a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]]. Set its [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] to

`800, inf`

 and its [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] to

`350, 0`

.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Construct a slider

To allow players to adjust volume levels, the settings menu will contain two draggable **slider widgets** powered by [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]], a convenient object that facilitates interaction with 2D user interface elements.

[Video: Sliders-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/interactive-ui/Sliders-Demo.mp4)

<br>

To create a parent container for the first slider:

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the **SettingsMenu** container and rename it **EffectsVolumeSlider**.

   *(image in the full Top G Vault)*

2. With the **EffectsVolumeSlider** frame selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0.5` (center anchor)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `1` (fully transparent)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0.5, 0, 0.35, 0` (horizontal center and 35% from container's top)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `0.8, 0, 0.1, 0` (80% of container's width and 10% of its height)

	 *(image in the full Top G Vault)*

3. Insert a new [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] into **EffectsVolumeSlider**. This layout modifier is a powerful way to auto‑arrange sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] into horizontal rows or vertical columns within their parent container, including the ability to apply [[30 Official Roblox Docs/UI/List and flex layouts|flex]] concepts.

   *(image in the full Top G Vault)*

4. Set the following properties for the new [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]]:

   - [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Padding|Padding]] = `0.06, 0` (6% padding between list elements)
   - [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection|FillDirection]] = [[30 Official Roblox Docs/API Reference/Enums/FillDirection|Horizontal]] (left-to-right arrangement of elements)
   - [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex|HorizontalFlex]] = [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment|Fill]] (resize elements horizontally to fill the entire parent container, overriding their defined width)
   - [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|VerticalAlignment]] = [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Center]] (align elements along their vertical center)

#### Slider icon

A simple icon including an audio note and "burst" symbol helps players identify the slider's purpose when they open the settings menu.

*(image in the full Top G Vault)*

1. Insert an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] into the **EffectsVolumeSlider** frame and rename it to **Icon**. This icon will help players understand what game aspect the slider controls.

   *(image in the full Top G Vault)*

	 > [!warning]
	 > Importantly, note that the label must be a **sibling** of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], not a child of it.

2. With **Icon** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `1` (fully transparent)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `2.5, 0, 2.5, 0` (250% height of parent frame once aspect ratio is constrained)
   - [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|Image]] = `rbxassetid://90019827067389` (asset ID of audio note and "burst" symbol)

3. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] into **Icon** and leave its properties as the defaults (1:1 width to height).

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

#### Range frame

Directly to the right of the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Slider icon|icon]], the interactive portion of the slider should be contained within another [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]].

*(image in the full Top G Vault)*

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the **EffectsVolumeSlider** frame and rename it **SliderFrame**. Note that it must be a direct **sibling** of the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] layout modifier.

   *(image in the full Top G Vault)*

2. With **SliderFrame** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] = `0` (black)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `0.75` (25% opaque)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] = `1`
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `1, 0, 1, 0` (100% width/height of parent frame)

   > [!info]
   > Note that it's not necessary to assign **positional** changes such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]], as the [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] controls the positioning of its siblings, in this case ordering them horizontally from left to right and keeping them vertically centered with each other.

	 > [!warning]
	 > The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] property is important when working with layout modifiers such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], as it determines the sequence in which siblings are placed respective to each other. Changing it to `1` for **SliderFrame** ensures it's placed to the right of **Icon** which has a default [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder|LayoutOrder]] of `0`.

3. Insert the following modifiers into **SliderFrame**:

   - [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] with its [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property set to

`0.5, 0`

 ("pill" shape)
   - [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] with its [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] property set to

`inf, 30`

 (maximum 30 pixels in height)
   - [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] with its [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|Color]] set to `0`, [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] to `3`, and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|Transparency]] to `0.25` (75% opaque black outline)

   *(image in the full Top G Vault)*

#### Interactive handle

With the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Range frame|slider container]] constructed, you can now create a **draggable handle** for players to interact with during gameplay.

*(image in the full Top G Vault)*

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the **SliderFrame** container and rename it to **Handle**.

   *(image in the full Top G Vault)*

2. With **Handle** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0.5` (center anchor)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0.5, 0, 0.5, 0` (horizontal and vertical center of parent frame)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `1.2, 0, 1.2, 0` (120% height of parent frame once aspect ratio is constrained)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] = `3` (layer handle visually in front of other slider elements)

3. Insert the following modifiers into **Handle**:

   - [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] with its default properties (1:1 width to height)
   - [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] with its [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property set to

`0.5, 0`

 (circular shape)
   - [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] with its [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|Color]] set to

`[0, 150, 255]`

 and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] to `8` (thick blue outline)

4. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]] object into **Handle**. This convenient object facilitates and encourages interaction with 2D user interface elements.

   *(image in the full Top G Vault)*

5. Set the following properties for the new [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]]:

   - [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragStyle|DragStyle]] = [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorDragStyle|TranslateLine]] (1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragAxis|DragAxis]].)
   - [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#ResponseStyle|ResponseStyle]] = [[30 Official Roblox Docs/API Reference/Enums/UIDragDetectorResponseStyle|Scale]] (move by scale values of the detector's parent's position)

6. To ensure the handle's linear drag range is limited to its container, link its [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] property to the **SliderFrame** container:

   1. Select the [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector|UIDragDetector]].
   2. Click its [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] property in the **Properties** window.
   3. Back in the **Explorer** window, click the handle's parent **SliderFrame**.

   *(image in the full Top G Vault)*

	 The [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#BoundingUI|BoundingUI]] property link now reflects the **SliderFrame** container:

	 *(image in the full Top G Vault)*

If you playtest the game now, you'll be able to drag the handle left and right within its parent container:

[Video: Handle-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/interactive-ui/Handle-Demo.mp4)

#### Inner fill

To more clearly indicate that the slider controls a 0% to 100% range, you can add an **inner fill** to the left side of the container which will sync with the handle's variable position.

*(image in the full Top G Vault)*

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the **SliderFrame** container and rename it to **InnerFill**.

   *(image in the full Top G Vault)*

2. Set the following properties for the **InnerFill** frame:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0, 0.5` (left edge and vertical center)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] = `[0, 150, 255]` (blue matching the slider's handle)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `0.35` (65% opaque)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0, 0, 0.5, 0`
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `0.5, 0, 1, 0` (50% width and 100% height of parent frame)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] = `2` (layer visually in front of parent frame's fill/outline)

3. To match the "pill" shape of the parent **SliderFrame** container, insert a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] modifier and set its [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property to

`0.5, 0`

.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Duplicate the slider

With the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Construct a slider|first slider]] constructed, you can easily duplicate it and modify some visual aspects to indicate another purpose, in this case the volume level of background audio symbolized by an icon of musical notes.

*(image in the full Top G Vault)*

1. Select the completed **EffectsVolumeSlider** object.

   *(image in the full Top G Vault)*

2. Duplicate it (<kbd>Ctrl</kbd><kbd>D</kbd> or <kbd>⌘</kbd><kbd>D</kbd>) and then rename the duplicate to **BackgroundVolumeSlider**.

   *(image in the full Top G Vault)*

3. Change the duplicate's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] to

`0.5, 0, 0.7, 0`

 to move it below the first slider.

*(image in the full Top G Vault)*

4. Expand the top-level branch of **BackgroundVolumeSlider**, select the **Icon** image label, and change its [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|Image]] property to `rbxassetid://101125859760167` (asset ID of symbol with musical notes).

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

5. Expand the **SliderFrame** ⟩ **Handle** branch, select the [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] modifier within, and set its [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|Color]] property to

`[255, 0, 125]`

 (magenta).

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

6. Select the **InnerFill** frame within **SliderFrame** and change its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] property to the same magenta color

(`[255, 0, 125]`)

.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Create the close button

The final element of the settings menu is a **close button** which provides players an additional input to close the menu (the **SettingsButton** in the top‑center will serve the same purpose).

*(image in the full Top G Vault)*

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] into the **SettingsMenu** container and rename it **CloseButton**.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

2. With **CloseButton** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `1, 0` (top-right corner)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `1` (fully transparent)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `1, -10, 0, 10` (10 pixel inset from top-right corner)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `0.15, 0, 0.15, 0` (15% of frame height once aspect ratio is constrained)
   - [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image|Image]] = `rbxassetid://5577404210` (asset ID of close button symbol)
   - [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageTransparency|ImageTransparency]] = `0.25` (75% opaque)

3. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] into the button with default properties (1:1 width to height).

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

## Create the control modules

An extensible **control module** setup makes interactive UI management more streamlined than individual scripts placed within each object. [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] facilitate this extensible functionality by letting you reuse code between scripts on different sides of the client‑server boundary or the same side of the boundary.

### Stateful object controller

The following stateful object controller module lets you attach behavior to UI objects such as **SettingsButton** and **SettingsMenu**, and easily toggle/tween between various states. To create the module:

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] into the [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] container and rename it to **StatefulObjectController**.

	 *(image in the full Top G Vault)*

2. Paste the following code inside the module:

		```lua title="StatefulObjectController"
		local TweenService = game:GetService("TweenService")

		local StatefulObjectController = {}
		StatefulObjectController.__index = StatefulObjectController

		export type StateName = string
		export type State = {
			transition: TweenInfo,
			properties: { [string]: any },
		}

		function StatefulObjectController.hydrate(props: {
				object: Instance,
				states: { [StateName]: State },
				initialStateName: StateName
			})
			local object, states, initialStateName = props.object, props.states, props.initialStateName

			local self = setmetatable({
				states = states,
				currentStateName = initialStateName,
				tweens = {},
			}, StatefulObjectController)

			-- Create tweens for reuse to avoid making new tweens every time state is changed
			for stateName, state in states do
				self.tweens[stateName] = TweenService:Create(object, state.transition, state.properties)
			end

			self:setState(self.currentStateName)

			return self
		end

		function StatefulObjectController:setState(stateName: StateName)
			local stateTween: Tween = self.tweens[stateName]
			if not stateTween then
				warn(string.format("Attempted to set %s to unknown state '%s'", self.object:GetFullName(), stateName))
				return
			end

			self.currentStateName = stateName

			-- Make sure other tweens aren't conflicting
			for _, tween in self.tweens do
				tween:Cancel()
			end

			stateTween:Play()
		end

		return StatefulObjectController
		```

   > [!note]- **Code Explanation**
   > | Lines | Purpose |
   > | --- | --- |
   > | `6`‑`10` | Defines and exports the Luau types to improve autocomplete and linting when using this module. |
   > | `12`‑`33` | Function used to initialize and attach behavior to a stateful UI object, accepting a [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] as `object`, a table of states and their respective [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] data, and an initial state name. Inside this function, lines `26`‑`28` construct [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tweens]] for each state, and line `30` calls the module's `setState()` function to set the object to the initial state. |
   > | `35`‑`50` | Function used to set/change the state of a stateful object. Line `42` sets the object's `currentStateName` to the state being set, lines `45`‑`47` cancel any running tweens to prevent conflicts, and line `49` executes the state's tween(s). |

### Slider controller

An additional module initializes and controls the two volume sliders. It also allows you to connect a callback function to each slider in order to detect player interaction with the slider and apply desired changes in the game.

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] into the [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] container and rename it to **SliderController**.

   *(image in the full Top G Vault)*

2. Paste the following code inside the module:

		```lua title="SliderController"
		local SliderController = {}
		SliderController.__index = SliderController

		export type Value = number
		export type OnChanged = (Value) -> ()

		function SliderController.hydrate(props: {
				object: Instance,
				onChanged: OnChanged,
				initialValue: Value?
			})
			local object, onChanged, initialValue = props.object, props.onChanged, props.initialValue

			local handle = object:FindFirstChild("Handle", true)
			if not handle then
				warn(string.format("Attempted to hydrate slider %s but couldn't find Handle", object:GetFullName()))
			end

			local innerFill = object:FindFirstChild("InnerFill", true)
			if not innerFill then
				warn(string.format("Attempted to hydrate slider %s but couldn't find InnerFill", object:GetFullName()))
			end

			local dragDetector = handle:FindFirstChildWhichIsA("UIDragDetector")
			if not dragDetector then
				warn(string.format("Attempted to hydrate slider %s but couldn't find UIDragDetector", object:GetFullName()))
			end

			local self = setmetatable({
				handle = handle,
				innerFill = innerFill,
				dragDetector = dragDetector,
				value = initialValue or 0.5,
				onChanged = onChanged,
			}, SliderController)

			-- Set initial value
			self:setValue(self.value)

			-- Connect detector to player manipulation
			self.dragConnection = dragDetector.DragContinue:Connect(function()
				self:setValue(handle.Position.X.Scale)
			end)

			return self
		end

		function SliderController:setValue(value: Value)
			local clampedValue = math.clamp(value, 0, 1)
			self.value = clampedValue

			-- Update the handle position and inner frame size to match
			self.handle.Position = UDim2.fromScale(clampedValue, 0.5)
			self.innerFill.Size = UDim2.fromScale(clampedValue, 1)

			-- Run the user's callback with the latest value
			local changeSuccess, changeResult = pcall(self.onChanged, clampedValue)
			if not changeSuccess then
				warn("Error in slider callback:", changeResult)
			end
		end

		return SliderController
		```

   > [!note]- **Code Explanation**
   > | Lines | Purpose |
   > | --- | --- |
   > | `7`‑`46` | Function used to initialize and attach behavior to a slider element, accepting the slider's parent [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] as `object`, an `onChanged` callback function to process slider changes, and an initial value for the slider's handle position. Inside the function, lines `14`‑`27` confirm that the slider's [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Interactive handle\|handle]], [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Inner fill\|inner fill]], and [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector\|UIDragDetector]] elements exist. Line `38` calls the module's `setValue()` function and lines `41`‑`43` connect the drag detector's [[30 Official Roblox Docs/API Reference/Classes/UIDragDetector#DragContinue\|DragContinue]] event to the module's `setValue()` function (see next row for details). |
   > | `48`‑`61` | Function used to set the value of the slider. Inside the function, lines `53`‑`54` ensure the handle's position and inner fill size are synced, and line `57` passes the changed value to the callback function so that you can utilize the value as needed. |

## Create the settings script

With the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the settings button|settings button]] and [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the settings menu|settings menu]] finalized, you can hook everything together with a single script that utilizes the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the control modules|control modules]].

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] into **HUDContainer** and rename it to **SettingsScript** to describe its purpose. Note that this script should be at the same level (sibling) as **SettingsMenu** and **SettingsButton**, the top‑level UI objects it will manage.

   *(image in the full Top G Vault)*

2. Paste the following code inside the script:

		```lua title="SettingsScript"
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local SoundService = game:GetService("SoundService")

		local SliderController = require(ReplicatedStorage.SliderController)
		local StatefulObjectController = require(ReplicatedStorage.StatefulObjectController)

		local HUDContainer = script.Parent

		-- Initialize settings button
		local settingsButton = StatefulObjectController.hydrate({
			object = HUDContainer:FindFirstChild("SettingsButton"),
			states = {
				menuOpen = {
					transition = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
					properties = {
						Rotation = 45,
					},
				},
				menuClosed = {
					transition = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
					properties = {
						Rotation = 0,
					},
				},
			},
			initialStateName = "menuClosed"
		})

		-- Initialize settings menu frame
		local settingsMenu = StatefulObjectController.hydrate({
			object = HUDContainer:FindFirstChild("SettingsMenu"),
			states = {
				menuOpen = {
					transition = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
					properties = {
						Position = UDim2.fromScale(0.5, 0.5),
						Visible = true,
					},
				},
				menuClosed = {
					transition = TweenInfo.new(0),
					properties = {
						Position = UDim2.fromScale(0.5, 0.4),
						Visible = false,
					},
				},
			},
			initialStateName = "menuClosed"
		})

		-- Initialize effects volume slider
		local effectsAudio = SoundService:FindFirstChild("Effects")
		local effectsVolumeSlider = SliderController.hydrate({
			object = HUDContainer:FindFirstChild("EffectsVolumeSlider", true),
			initialValue = effectsAudio and effectsAudio.Volume or 0.5,
			onChanged = function(value: SliderController.Value)
				if effectsAudio then
					effectsAudio.Volume = value
				end
			end,
		})

		-- Initialize background volume slider
		local backgroundAudio = SoundService:FindFirstChild("Background")
		local backgroundVolumeSlider = SliderController.hydrate({
			object = HUDContainer:FindFirstChild("BackgroundVolumeSlider", true),
			initialValue = backgroundAudio and backgroundAudio.Volume or 0.5,
			onChanged = function(value: SliderController.Value)
				if backgroundAudio then
					backgroundAudio.Volume = value
				end
			end,
		})

		-- Connect buttons to player interaction
		HUDContainer:FindFirstChild("SettingsButton").Activated:Connect(function()
			local targetState = if settingsButton.currentStateName == "menuClosed"
				then "menuOpen"
				else "menuClosed"
			settingsButton:setState(targetState)
			settingsMenu:setState(targetState)
		end)
		HUDContainer:FindFirstChild("CloseButton", true).Activated:Connect(function()
			settingsButton:setState("menuClosed")
			settingsMenu:setState("menuClosed")
		end)
		```

3. Reference the following sections to explore how the script utilizes the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the control modules|control modules]].

   > [!note]- **Settings Button**
   > Lines `10`-`27` initialize and attach behavior to the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the settings button|settings button]] as follows:
   >
   > | Lines | Purpose |
   > | --- | --- |
   > | `10`‑`11` | A local reference `settingsButton` is declared and hydrated with the `StatefulObjectController.hydrate()` function, and the **SettingsButton** button within **HUDContainer** is referenced as the object to hydrate. |
   > | `12`‑`25` | A `states` table is passed with two unique states, `menuOpen` and `menuClosed`. Each state contains a transition to declare (through a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]]) how the particular state will reach its target properties defined in the `properties` table. In this case, `menuOpen` declares a state change to 45° for the button's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] with an [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|Exponential]] tween of ½ second, while `menuClosed` effectively restores the button to its default rotation of `0`. |
   > | `26` | The button's **initial** state is set to `menuClosed` (this could be set to any state name within the `states` table). |
   >
   >
   >
   > Further down in the script (lines `76`-`86`), buttons are connected to player interaction to trigger UI state changes:
   >
   > | Lines | Purpose |
   > | --- | --- |
   > | `76`‑`82` | **SettingsButton** is connected to the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated\|Activated]] event of the [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] class to call an anonymous function. Inside the anonymous function, lines `77`‑`79` toggle a `targetState` variable between `menuOpen` and `menuClosed`. Line `80` then calls `setState()` to set the button's state to `targetState` and line `81` does the same to **SettingsMenu** so that it toggles open or closed with activation of **SettingsButton**. |
   > | `83`‑`86` | **CloseButton** is connected to the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Activated\|Activated]] event to call an anonymous function which sets the state of both **SettingsButton** and **SettingsMenu** to `menuClosed`. |

	 > [!note]- **Settings Menu**
	 > Lines `30`-`49` initialize and attach behavior to the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI#Create the settings menu|settings menu]] as follows:
	 >
	 > | Lines | Purpose |
	 > | --- | --- |
	 > | `30`‑`31` | A local reference `settingsMenu` is declared and hydrated with the `StatefulObjectController.hydrate()` function and the **SettingsMenu** frame within **HUDContainer** is referenced as the object to hydrate. |
	 > | `32`‑`46` | Similar to the settings button, a `states` table is passed with two unique states, `menuOpen` and `menuClosed`. Here, `menuOpen` declares a state change to `Datatype.UDim2.fromScale(0.5, 0.5)` for the frame's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|Position]] with a [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|Bounce]] tween of ½ second, as well as a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Visible\|Visible]] state of `true`. In contrast, `menuClosed` declares a positional state change to `Datatype.UDim2.fromScale(0.5, 0.4)` and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Visible\|Visible]] to `false`, but the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] with `0` duration on line `41` effectively makes the state change occur instantly. |
	 > | `48` | The frame's initial state is set to `menuClosed`. |
	 >
	 >
	 >
	 > Further down in the script (lines `76`-`86`), the settings menu is linked to player interaction:
	 >
	 > | Lines | Purpose |
	 > | --- | --- |
	 > | `81` | Sets the same `targetState` for **SettingsMenu** to sync with activation of **SettingsButton**. |
	 > | `85` | Sets the state of **SettingsMenu** to `menuClosed` when **CloseButton** is activated. |

	 > [!note]- **Volume Sliders**
	 > Lines `51`-`73` initialize and attach behavior to **EffectsVolumeSlider** and **BackgroundVolumeSlider** as follows:
	 >
	 > | Lines | Purpose |
	 > | --- | --- |
	 > | `52` | Sets a local reference to the **Effects** [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] within [[30 Official Roblox Docs/API Reference/Classes/SoundService\|SoundService]]. A [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]] lets you interrelate multiple [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]] and control the volume of every sound in the group through the group's [[30 Official Roblox Docs/API Reference/Classes/SoundGroup#Volume\|Volume]] property. |
	 > | `53`‑`54` | A local reference `effectsVolumeSlider` is declared and hydrated with the `SliderController.hydrate()` function and the **EffectsVolumeSlider** frame within **HUDContainer** ⟩ **SettingsMenu** is referenced as the object to hydrate. Note that the second parameter of `true` for [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild\|FindFirstChild()]] tells the method to look recursively down the **HUDContainer** branch to locate **EffectsVolumeSlider**. |
	 > | `55` | The slider's initial value is set to the current [[30 Official Roblox Docs/API Reference/Classes/SoundGroup#Volume\|Volume]] of the **Effects** sound group, or `0.5` as a fallback. |
	 > | `56`‑`60` | Establishes the callback function to apply slider value changes to the volume of the **Effects** sound group. |
	 > | `64`‑`73` | Essentially the same as lines `52`-`61`, except to hydrate the **BackgroundVolumeSlider** frame within **HUDContainer** ⟩ **SettingsMenu** and apply slider value changes to the volume of the **Background** sound group. |

With **SettingsScript** in place, the game now offers a fully operational interactive UI example that links a related set of UI objects to player interaction.

[Video: Interactive-UI-Final.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/interactive-ui/Interactive-UI-Final.mp4)

> [!success]
> If your interactive UI doesn't match the appearance or behavior displayed in this tutorial, remember that you can inspect [UI Fundamentals - Interactivity](https://www.roblox.com/games/138499606610292/UI-Fundamentals-Interactivity) as a completed reference template.

---
*Source: [Create interactive UI](https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/interactive-ui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
