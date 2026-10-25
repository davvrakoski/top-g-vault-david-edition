---
title: "Create HUD meters"
description: "Learn how to build a custom HUD meter to replace the default character health meter."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/create-hud-meters"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to build a custom HUD meter to replace the default character health meter.*

A **HUD** or **Heads-Up Display** is a set of UI elements that are always visible or accessible during gameplay, such as score displays, health meters, and menu buttons. Including a HUD is essential for most games because it displays information that helps players to be successful in their gameplay objectives.

A common HUD element is a health meter with an icon on the left which can be adapted into a timer bar, progress bar, or similar.

*(image in the full Top G Vault)*

Using [Hazardous Space Station](https://www.roblox.com/games/99416825187098/Hazardous-Space-Station) as a starting place and [UI Fundamentals - HUD Meter](https://www.roblox.com/games/104506915856758/UI-Fundamentals-HUD-Meter) as a finished reference place, this tutorial demonstrates:

- Setup and use of the **Device Emulator** to test your design on multiple emulated screens.
- Usage of [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] as both a design and storage container.
- How to position/size UI elements around built‑in Roblox controls and device notches/islands, such as the camera notch on modern phones.
- How to replace the default Roblox health meter with your own meter and hook it up to the character's health level.
- How to animate the center portion of the health meter and set its color between five color gradient keypoints (red, orange, yellow, lime, green).

## Enable the Device Emulator

Roblox is inherently [[30 Official Roblox Docs/Projects/Cross-platform development|cross‑platform]], as players can discover and join games on their phone or tablet, then later continue where they left off on their PC or console. Mobile devices (phones and tablets) have the least amount of screen space, so it's important that your UI elements fit on smaller screens and that they're clearly visible to players.

The best way to test UI designs across platforms is Studio's [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]]. This tool provides a preset selection of devices and allows you to add your own custom presets.

1. Open the [Hazardous Space Station](https://www.roblox.com/games/99416825187098/Hazardous-Space-Station) template in Studio.

   [Open the place on Roblox](https://www.roblox.com/games/99416825187098)

2. From Studio's **Test** menu, toggle on **Device Emulator**.
3. From the bar directly above the main viewport, select a phone emulation such as **iPhone X** or **Samsung Galaxy A51**. Then, set the view size to **Fit to Window** to utilize the maximum space in Studio.

   *(image in the full Top G Vault)*

## Create a screen container

A [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] container holds UI objects ([[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]) to display on a player's screen (in this tutorial, the entirety of the health meter). To display a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and its child objects to every player who joins the game, place it inside the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] container. When a player joins and their character first spawns, the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and its contents clone into the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] container for that player, located within the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] container.

*(image in the full Top G Vault)*

To insert an empty [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]]:

1. In the **Explorer** window, locate the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] container.

   *(image in the full Top G Vault)*

2. Hover over the container, click the ⊕ button, and insert a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

   *(image in the full Top G Vault)*

3. Rename the new container **HUDContainer** to reflect its purpose.

   *(image in the full Top G Vault)*

### Utilize safe areas

Modern phones take advantage of the entire screen but typically include notches, cutouts, and other elements that occupy screen space. Every Roblox game also includes the **top bar controls** for quick access to the main menu, [[30 Official Roblox Docs/Chat/Text chat overview|chat]], [[30 Official Roblox Docs/Players/Leaderboards|leaderboard]], and more.

*(image in the full Top G Vault)*

To ensure players can see and access all UI without obstruction, Roblox provides the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] property which controls the **safe area** insets for the contents of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]]. Every UI object that you position inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is relative to the inset bounds.

*(image in the full Top G Vault)*

While the default of [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] ensures all UI objects remain clear of Roblox UI and device cutouts, [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]] can be a better option to utilize limited screen space, as illustrated below.

#### CoreUISafeInsets

> [!danger]
> [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] keeps the meter clear of all obstructions, but it adds a large gap between the meter and the physical top edge of the screen.

*(image in the full Top G Vault)*

#### DeviceSafeInsets

> [!success]
> [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]] tucks the meter against the physical top edge of the screen, and the meter's right alignment keeps it clear of the Roblox UI.

*(image in the full Top G Vault)*

1. In the **Explorer** window, select **HUDContainer**.

   *(image in the full Top G Vault)*

2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] property to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]].

   *(image in the full Top G Vault)*

### Set edge padding

With [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] set to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]], content can now extend directly up to the physical top edge of the screen. However, a small amount of **padding** can help push the health meter (and other objects inside the container) slightly away from the screen edges for a cleaner appearance and to prevent them from being clipped.

*(image in the full Top G Vault)*

One way to apply padding to a UI container is through the insertion of a [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] modifier:

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] modifier into **HUDContainer**.

   *(image in the full Top G Vault)*

2. With the new [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] object selected, enter a value of

`0, 16`

 for all edges of the container ([[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom|PaddingBottom]], [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingLeft|PaddingLeft]], [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingRight|PaddingRight]], [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingTop|PaddingTop]]). This applies padding of 16 pixels all around the container, regardless of the screen's resolution.

*(image in the full Top G Vault)*

## Construct the health meter

With the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Create a screen container|screen container configured]], you can begin constructing the health meter using Roblox UI objects such as [[30 Official Roblox Docs/UI/Frames|frames]] and an [[30 Official Roblox Docs/UI/Text & image labels|image label]].

*(image in the full Top G Vault)*

### Create the parent frame

Similar to design applications like Figma and Photoshop, a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] in Roblox serves as a container for other UI objects. For this tutorial, the entire health meter will be contained in a single parent frame, making it simple to reposition across various HUD layouts.

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into **HUDContainer**. The new frame appears in the upper-left corner as an empty white square.

   *(image in the full Top G Vault)*

   > [!warning]
   > If the new frame doesn't appear in the viewport, make sure you've toggled on **GUI overlay** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

2. Rename the new frame instance to **MeterBar**.

   *(image in the full Top G Vault)*

### Position the frame

In Roblox, the position of a UI object is represented by a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set containing [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values for both the **X** and **Y** axes:

- [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values represent a **percentage** of the container's size along the corresponding axis, additive of any [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values.
- [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values represent how many **pixels** to shift the object on the corresponding axis, additive of any [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] values.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

To position a UI object in the upper-right corner of the screen container, [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] is the best approach because an **X** value of `1` (100%) represents the right edge of the container, regardless of the screen's physical pixel size. Similarly, a **Y** scale value of `0` (0%) represents the top edge of the container.

*(image in the full Top G Vault)*

Additionally, you'll need to set an upper-right [[30 Official Roblox Docs/UI/Position and size UI objects#AnchorPoint|anchor point]] for the parent frame to define its origin point. Acceptable values are between `0` and `1`, relative to the size of the object, so an anchor value of

`1, 0`

 puts the frame's anchor point in its upper‑right corner.

*(image in the full Top G Vault)*

1. In the **Explorer** window, select the **MeterBar** frame that you inserted previously.

   *(image in the full Top G Vault)*

2. In the **Properties** window, enter

`1, 0, 0, 0`

 for [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] and press <kbd>Enter</kbd>. Studio will automatically add the brackets to form the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] of

`{1, 0},{0, 0}`

.

3. Enter

`1, 0`

 for the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] property. The frame should now be positioned in the upper‑right corner of the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Utilize safe areas|device safe area]], slightly indented from the edge as a result of the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Set edge padding|padding]].

*(image in the full Top G Vault)*

### Resize the frame

Like position, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of a UI object is represented by a [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinate set containing [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] and [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] values for both the **X** and **Y** axes.

By default, the new frame's size is

`{0, 100},{0, 100}`

, meaning 100 **pixels** in both width (**X**) and height (**Y**). While a strict pixel value is useful in certain cases, many UI elements scale more responsively across multiple screens when set to a **percentage** of the overall screen container size.

1. With the **MeterBar** frame selected, access the **Properties** window and navigate to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] property.

2. Enter a value of `0.35, 0, 0.05, 0` to set a percentage size of 35% wide and 5% tall with no added pixel offsets.

   *(image in the full Top G Vault)*

### Style the frame

By default, [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] are filled in solid white. The final health meter should have a darker and slightly opaque fill, as well as a dark outline, so that it stands out better on both light and dark backgrounds.

*(image in the full Top G Vault)*

1. With the **MeterBar** frame selected, enter `0` for the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] property. Studio will automatically convert it to the RGB value of

`[0, 0, 0]`

.

2. Enter `0.75` for the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] property. In Roblox, transparency ranges from `0` for fully opaque to `1` for fully transparent, so `0.75` equals 25% opacity in other applications such as Figma or Photoshop.

   *(image in the full Top G Vault)*

3. Insert a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] object, a powerful UI modifier that adds a [[30 Official Roblox Docs/UI/UI appearance modifiers#Stroke|customizable stroke]] to the frame.

   *(image in the full Top G Vault)*

4. With the new [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] = `3`
   - [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|Transparency]] = `0.25` (75% opaque)

   *(image in the full Top G Vault)*

To finalize the meter frame's styling, you can round the corners to form a "pill" shape instead of a sharp rectangle.

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] instance into the **MeterBar** frame.

   *(image in the full Top G Vault)*

2. With the new [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] selected, set the [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] to

`0.5, 0`

. Using a **scale** value of `0.5` (50%) instead of a pixel value is especially convenient for the meter bar because it ensures a fully rounded curve no matter how tall or wide the container becomes.

*(image in the full Top G Vault)*

### Create the inner fill

Now that the health meter's containing frame is complete, you can add an **inner fill** portion to represent the character's variable health. Since it only needs to be a solid‑filled region, a sub‑child [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] inside the parent frame is suitable.

*(image in the full Top G Vault)*

1. Insert a child [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the **MeterBar** frame.

2. Rename the new frame instance to **InnerFill**.

   *(image in the full Top G Vault)*

3. With **InnerFill** selected, set the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0, 0.5` (left edge and vertical center)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0, 0, 0.5, 0`
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `1, 0, 1, 0`

   Since children of frames are positioned and sized relative to their parent, use of scale makes the inner frame fill the parent's full width and height, starting from the parent's left edge.

   *(image in the full Top G Vault)*

4. To match the "pill" shape of the parent frame, insert an additional [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] into **InnerFill**.

   *(image in the full Top G Vault)*

5. With the new [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] modifier selected, set its [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property to

`0.5, 0`

 to match the "pill" shape of the parent **MeterBar** frame.

*(image in the full Top G Vault)*

6. To better represent that a full meter indicates good health, select **InnerFill** and set its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] property to

`[0, 225, 50]`

 (in a later task, you'll [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Listen for health changes|script]] this color to change based on actual health).

*(image in the full Top G Vault)*

### Add the icon

To more clearly indicate the purpose of the meter, you can add an [[30 Official Roblox Docs/UI/Text & image labels|image label]] to the left side, in this case a red heart which commonly symbolizes health or life.

*(image in the full Top G Vault)*

1. Insert an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] into the **MeterBar** frame. This object lets you apply a 2D image asset that has been uploaded as a decal to Roblox.

2. Rename the new label instance to **Icon**.

   *(image in the full Top G Vault)*

3. With **Icon** selected, set its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|ZIndex]] property to `2`. While newly inserted UI objects always layer in front of objects inserted previously, this change ensures the icon always displays in front of the meter's frame elements.

   *(image in the full Top G Vault)*

4. Locate the icon's [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|Image]] property and enter `rbxassetid://91715286435585`, the reference to a pre‑uploaded heart image (if desired, you can [import](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) your own image and use its asset ID).

   *(image in the full Top G Vault)*

5. To ensure the icon [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] always stays at a 1:1 aspect ratio, insert a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]]. Although this [[30 Official Roblox Docs/UI/Size modifiers and constraints#Constraints|constraint]] has customizable properties to control the aspect ratio, you can leave its default values intact.

   *(image in the full Top G Vault)*

6. With **Icon** selected, finalize the appearance and position by changing the following properties:

   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] = `0.5, 0.5` (center anchor)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] = `1` (100% transparent)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] = `0, 0, 0.5, 0` (left side of meter and vertical center)
   - [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] = `2, 0, 2, 0` (200% the overall size of the **MeterBar** frame, constrained to 1:1 by the [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]])

   *(image in the full Top G Vault)*

### Constrain the size

While a [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Resize the frame|scale height]] of `0.05` (5%) looks good on modern phone screens and gaming monitors which are 16:9 aspect ratio or wider, the meter may look slightly too tall on tablet screens and older phones. You can check this by emulating a tablet like **iPad 7th Generation** from the **Device Emulator**.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

To keep the meter bar's height more consistent with wider screens, you can apply a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] to limit the maximum pixel height.

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] into the **MeterBar** frame.

   *(image in the full Top G Vault)*

2. With the new constraint selected, set its [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] property to

`inf, 20`

 to restrict its height to 20 pixels while enforcing no width restriction.

*(image in the full Top G Vault)*

Now, the meter bar maintains a more consistent height between wider and taller screens.

#### Phone

*(image in the full Top G Vault)*

#### Tablet

*(image in the full Top G Vault)*

## Replace the default health meter

Roblox games include a default health meter which becomes visible when characters take damage. If you keep the default meter visible, it will duplicate and potentially overlap the custom meter.

*(image in the full Top G Vault)*

### Disable the default meter

To disable the default health meter, you'll use a **client script** ([[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]) within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] that calls [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]].

1. In the **Explorer** window, expand the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] container and locate the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] container within it.

   *(image in the full Top G Vault)*

2. Insert a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] into the container and rename it to **HideDefaultHealthMeter** to describe its purpose. Scripts within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] automatically run when the local player joins a game, making it an ideal container to run a script that permanently hides the default meter.

   *(image in the full Top G Vault)*

3. When you insert a new script, it automatically opens in a new script editor tab (if it doesn't, double‑click the script in the **Explorer** window).

   Paste the following code inside the **HideDefaultHealthMeter** script:

		```lua title="HideDefaultHealthMeter"
		local StarterGui = game:GetService("StarterGui")

		-- Hide default health meter
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
		```

   > [!note]- **Code Explanation**
   > | Line | Purpose |
   > | --- | --- |
   > | `1` | Gets a reference to a core [[30 Official Roblox Docs/Scripting/Services\|service]], [[30 Official Roblox Docs/API Reference/Classes/StarterGui\|StarterGui]], which represents the same container where you created the custom health meter and whose contents clone into the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]] container for each player that joins the game. |
   > | `4` | Calls the service's [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled\|SetCoreGuiEnabled()]] method and instructs the default health meter to be disabled (`false`). |

If you playtest the game now and take damage, you'll notice that the default meter is disabled and hidden (you'll script the custom meter to [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Listen for health changes|reflect health changes]] in the next section).

*(image in the full Top G Vault)*

### Listen for health changes

All default Roblox character models contain a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] class which provides special behaviors and functionality to the character, such as setting its walk/run speed and managing its health. [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] changes on the server [[30 Official Roblox Docs/Projects/Client-server runtime#Replication|replicate]] to each player's client and you can detect these changes to update both the size and color of the custom health meter.

1. In the **Explorer** window, locate the [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] container within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]].

   *(image in the full Top G Vault)*

2. Insert a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] into the container and rename it to **UpdateCustomMeter** to describe its purpose. Scripts within [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] automatically run each time the player's character spawns, making it an ideal container to run a script that fully resets the health meter on each respawn.

   *(image in the full Top G Vault)*

3. In the editor window for the **UpdateCustomMeter** script, paste the following code:

		```lua title="UpdateCustomMeter"
		local Players = game:GetService("Players")

		-- Reference to local player, character, and humanoid
		local player = Players.LocalPlayer
		local character = player.Character
		local humanoid = character:WaitForChild("Humanoid")

		-- Reference to meter bar inner frame
		local playerGui = player:WaitForChild("PlayerGui")
		local meterBarInner = playerGui.HUDContainer.MeterBar.InnerFill

		-- Gradient sequence colors (red, orange, yellow, lime, green)
		local gradient = {
			Color3.fromRGB(225, 50, 0),
			Color3.fromRGB(255, 100, 0),
			Color3.fromRGB(255, 200, 0),
			Color3.fromRGB(150, 225, 0),
			Color3.fromRGB(0, 225, 50)
		}

		-- Function to get color in gradient sequence from fractional point
		local function getColorFromSequence(fraction: number): Color3
			-- Each color in gradient defines the beginning and/or end of a section
			local numSections = #gradient - 1

			-- Each section represents a portion of 1
			local sectionSize = 1 / numSections

			-- Determine which section the requested fraction falls into
			local sectionStartIndex = 1 + math.clamp(fraction, 0, 1) // sectionSize

			-- Get the colors at the start and end of the section
			local sectionColorStart = gradient[sectionStartIndex]
			local sectionColorEnd = gradient[sectionStartIndex + 1] or sectionColorStart

			-- Normalize fraction to be a number from 0 to 1 within the section
			local fractionOfSection = math.clamp(fraction, 0, 1) % sectionSize / sectionSize

			-- Lerp between beginning and end based on the normalized fraction
			return sectionColorStart:Lerp(sectionColorEnd, fractionOfSection)
		end

		local function onHealthChanged()
			-- Calculate new health as percentage of max
			local healthFraction = math.max(0, humanoid.Health / humanoid.MaxHealth)

			-- Set the bar to new size/color targets
			meterBarInner.Size = UDim2.new(healthFraction, 0, 1, 0)
			meterBarInner.BackgroundColor3 = getColorFromSequence(healthFraction)
		end

		-- Listen for changes to humanoid health
		humanoid.HealthChanged:Connect(onHealthChanged)

		-- Initially set (or reset) bar size/color to current health
		onHealthChanged()
		```

   > [!note]- **Code Explanation**
   > | Lines | Purpose |
   > | --- | --- |
   > | `4`‑`6` | Gets references to the local [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]], their [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]] model, and the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] class within it. |
   > | `9`‑`10` | Gets a reference to the meter's **InnerFill** object which must be resized and recolored as the character's health changes. |
   > | `13`‑`19` | Declares an array of five colors (red, orange, yellow, lime, green) to recolor the meter at various points; for example, green for 100% health, yellow for 50%, red for 0%, or a blend at any fraction between the keypoints. |
   > | `22`‑`41` | Helper function which returns the color blend between any of the gradient color keypoints. |
   > | `43`‑`50` | Function which handles any changes to health. Here, it calculates the new health as a percentage of the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth\|MaxHealth]], resizes **InnerFill** to that scale percentage, and recolors it to the color returned from the `getColorFromSequence()` function. |
   > | `53` | The main [[30 Official Roblox Docs/Scripting/Events/Events\|event]] connection which detects [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Health]] changes replicated from the server and calls the `onHealthChanged()` function. |
   > | `56` | Initially (upon character spawn or respawn) calls the `onHealthChanged()` function to size and color **InnerFill** to the correct percentage. Typically this will be the full width and green. |

If you playtest the game now, you'll notice that the custom meter correctly updates both size and color as the character takes damage:

[Video: Meter-Change-Static.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-hud-meters/Meter-Change-Static.mp4)

> [!warning]
> By default, the Roblox health metering system includes a gradual healing effect which allows characters to slowly regenerate health. If you wish to disable this effect, insert an empty [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] named **Health** into the [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] container. This will prevent the default internal script from loading for each player character, effectively removing the regeneration effect.

### Animate the meter bar

To add an extra level of polish to the custom meter, you can animate health changes through **tweening**, gradually changing the meter bar's size and color over ½ second.

1. Access the script editor tab for the **UpdateCustomMeter** script that you edited previously.

2. Select all lines (<kbd>Ctrl</kbd><kbd>A</kbd> or <kbd>⌘</kbd><kbd>A</kbd>) and then paste over them (<kbd>Ctrl</kbd><kbd>V</kbd> or <kbd>⌘</kbd><kbd>V</kbd>) with the following code:

		```lua title="UpdateCustomMeter"
		local Players = game:GetService("Players")
		local TweenService = game:GetService("TweenService")

		-- Reference to local player, character, and humanoid
		local player = Players.LocalPlayer
		local character = player.Character
		local humanoid = character:WaitForChild("Humanoid")

		-- Tween properties
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

		-- Reference to meter bar inner frame
		local playerGui = player:WaitForChild("PlayerGui")
		local meterBarInner = playerGui.HUDContainer.MeterBar.InnerFill

		-- Gradient sequence colors (red, orange, yellow, lime, green)
		local gradient = {
			Color3.fromRGB(225, 50, 0),
			Color3.fromRGB(255, 100, 0),
			Color3.fromRGB(255, 200, 0),
			Color3.fromRGB(150, 225, 0),
			Color3.fromRGB(0, 225, 50)
		}

		-- Function to get color in gradient sequence from fractional point
		local function getColorFromSequence(fraction: number): Color3
			-- Each color in gradient defines the beginning and/or end of a section
			local numSections = #gradient - 1

			-- Each section represents a portion of 1
			local sectionSize = 1 / numSections

			-- Determine which section the requested fraction falls into
			local sectionStartIndex = 1 + math.clamp(fraction, 0, 1) // sectionSize

			-- Get the colors at the start and end of the section
			local sectionColorStart = gradient[sectionStartIndex]
			local sectionColorEnd = gradient[sectionStartIndex + 1] or sectionColorStart

			-- Normalize fraction to be a number from 0 to 1 within the section
			local fractionOfSection = math.clamp(fraction, 0, 1) % sectionSize / sectionSize

			-- Lerp between beginning and end based on the normalized fraction
			return sectionColorStart:Lerp(sectionColorEnd, fractionOfSection)
		end

		local function onHealthChanged()
			-- Calculate new health as percentage of max
			local healthFraction = math.max(0, humanoid.Health / humanoid.MaxHealth)

			-- Tween the bar to new size/color targets
			local tweenGoal = {
				Size = UDim2.new(healthFraction, 0, 1, 0),
				BackgroundColor3 = getColorFromSequence(healthFraction)
			}
			local meterBarTween = TweenService:Create(meterBarInner, tweenInfo, tweenGoal)
			meterBarTween:Play()
		end

		-- Listen for changes to humanoid health
		humanoid.HealthChanged:Connect(onHealthChanged)

		-- Initially set (or reset) bar size/color to current health
		onHealthChanged()
		```

   > [!note]- **Key Additions/Changes**
   > | Lines | Purpose |
   > | --- | --- |
   > | `2` | Gets a reference to [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]] to implement tweening functionality within the script. |
   > | `10` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] constructor which defines the intended tween's duration, [[30 Official Roblox Docs/UI/UI animation-tweens#Style\|easing style]], and [[30 Official Roblox Docs/UI/UI animation-tweens#Direction\|easing direction]]. |
   > | `52`‑`57` | Instead of simply setting the bar's size and color as in the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Listen for health changes\|previous version]], declares a `tweenGoal` table with the target size/color, creates a new tween using the `tweenInfo` and `tweenGoal` parameters, and plays the new tween. |

If you playtest the game now, you'll notice that the custom meter tweens between each change in health:

[Video: Meter-Change-Tweened.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-hud-meters/Meter-Change-Tweened.mp4)

### Add a damage effect

The default health meter system includes a brief, subtle red tint on the screen edges when the character is damaged. By [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create HUD meters#Disable the default meter|disabling the default meter]], this effect is removed, but you can replace it with your own implementation.

1. Access the script editor tab for the **UpdateCustomMeter** script that you edited previously.

2. Select all lines and paste over them with the following code:

		```lua title="UpdateCustomMeter"
		local Workspace = game:GetService("Workspace")
		local Players = game:GetService("Players")
		local TweenService = game:GetService("TweenService")

		-- Reference to local player, character, and humanoid
		local player = Players.LocalPlayer
		local character = player.Character
		local humanoid = character:WaitForChild("Humanoid")

		-- Tween properties
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

		-- Variable to store/cache character health
		local cachedHealth = humanoid.Health / humanoid.MaxHealth

		-- Get (or create new) color correction effect inside player camera
		local colorCorrection = Workspace.CurrentCamera:FindFirstChildWhichIsA("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Workspace.CurrentCamera)
		colorCorrection.Name = "DamageColorEffect"

		-- Reference to meter bar inner frame
		local playerGui = player:WaitForChild("PlayerGui")
		local meterBarInner = playerGui.HUDContainer.MeterBar.InnerFill

		-- Gradient sequence colors (red, orange, yellow, lime, green)
		local gradient = {
			Color3.fromRGB(225, 50, 0),
			Color3.fromRGB(255, 100, 0),
			Color3.fromRGB(255, 200, 0),
			Color3.fromRGB(150, 225, 0),
			Color3.fromRGB(0, 225, 50)
		}

		-- Function to get color in gradient sequence from fractional point
		local function getColorFromSequence(fraction: number): Color3
			-- Each color in gradient defines the beginning and/or end of a section
			local numSections = #gradient - 1

			-- Each section represents a portion of 1
			local sectionSize = 1 / numSections

			-- Determine which section the requested fraction falls into
			local sectionStartIndex = 1 + math.clamp(fraction, 0, 1) // sectionSize

			-- Get the colors at the start and end of the section
			local sectionColorStart = gradient[sectionStartIndex]
			local sectionColorEnd = gradient[sectionStartIndex + 1] or sectionColorStart

			-- Normalize fraction to be a number from 0 to 1 within the section
			local fractionOfSection = math.clamp(fraction, 0, 1) % sectionSize / sectionSize

			-- Lerp between beginning and end based on the normalized fraction
			return sectionColorStart:Lerp(sectionColorEnd, fractionOfSection)
		end

		local function onHealthChanged()
			-- Calculate new health as percentage of max
			local healthFraction = math.max(0, humanoid.Health / humanoid.MaxHealth)

			-- Tween the bar to new size/color targets
			local tweenGoal = {
				Size = UDim2.new(healthFraction, 0, 1, 0),
				BackgroundColor3 = getColorFromSequence(healthFraction)
			}
			local meterBarTween = TweenService:Create(meterBarInner, tweenInfo, tweenGoal)
			meterBarTween:Play()

			-- Show damage effect if new health is lower than cached health
			if healthFraction < cachedHealth then
				-- Cache new health value
				cachedHealth = healthFraction

				-- Set color correction to red as the initial tint before tweening
				colorCorrection.TintColor = Color3.fromRGB(255, 25, 25)
				colorCorrection.Saturation = 2.5

				-- Tween the tint back to white (neutral and no tint change from normal)
				local colorCorrectionTweenGoal = {
					TintColor = Color3.fromRGB(255, 255, 255),
					Saturation = 0
				}
				local colorCorrectionTween = TweenService:Create(colorCorrection, tweenInfo, colorCorrectionTweenGoal)
				colorCorrectionTween:Play()
			end
		end

		-- Listen for changes to humanoid health
		humanoid.HealthChanged:Connect(onHealthChanged)

		-- Initially set (or reset) bar size/color to current health
		onHealthChanged()
		```

   > [!note]- **Key additions/changes**
   > | Lines | Purpose |
   > | --- | --- |
   > | `14` | Sets a placeholder reference (`cachedHealth`) to track the character's health amount between changes, so you can compare if a change is lower (damage). |
   > | `17`‑`18` | On the initial character spawn, creates a new [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect\|ColorCorrectionEffect]] inside the player's current [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]], or gets a reference to the same instance on later respawns. By parenting this [[30 Official Roblox Docs/Environment/Post-processing effects\|post‑processing effect]] to the player's camera, it only applies to their local screen, not to every player's screen on the server. |
   > | `68`‑`83` | First performs a conditional check to confirm that the health change is lower than the `cachedHealth` value, indicating damage; if so, it sets `cachedHealth` to the new value. Next, it sets the [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect\|ColorCorrectionEffect]] tint to `[255, 25, 25]` (red) with higher saturation, then tweens the tint back to the default of neutral white (`[255, 255, 255]`) with no saturation. |

If you playtest the game now, you'll notice that the screen briefly flashes red whenever the character takes damage:

[Video: Meter-Change-Damage-Effect.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-hud-meters/Meter-Change-Damage-Effect.mp4)

> [!info]
> If you decide to adapt the custom meter bar to another purpose, such as a mana meter or poison meter, you can change the [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#TintColor|TintColor]] on line `73` to something more suitable to the event, such as light blue
>
> (`[200, 225, 255]`)
>
>  or toxic green
>
> (`[0, 255, 75]`)
>
> .

> [!success]
> If your health meter doesn't match the appearance or behavior displayed in this tutorial, remember that you can inspect [UI Fundamentals - HUD Meter](https://www.roblox.com/games/104506915856758/UI-Fundamentals-HUD-Meter) as a completed reference template.

---
*Source: [Create HUD meters](https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/create-hud-meters) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
