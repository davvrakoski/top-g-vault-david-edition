---
title: "Accessibility guidelines"
description: "Explains the practice of designing products and services to be usable by people with disabilities."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/publishing/accessibility"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the practice of designing products and services to be usable by people with disabilities.*

**Accessibility** is the practice of designing products and services to be usable by people with disabilities. Recent stats cite that over 26% of people have some type of disability, so making your Roblox game accessible can help you reach a wider audience.

## Text size

Players may find it difficult to read small text. Compare the following in-game shop menu with a blur applied, simulating what it might look like to somebody with impaired vision.

### Sighted

*(image in the full Top G Vault)*

### Low Vision

*(image in the full Top G Vault)*

If you increase the size of the smaller font labels, it will be clearer to most players.

### Sighted

*(image in the full Top G Vault)*

### Low Vision

*(image in the full Top G Vault)*

## Color contrast

Players might find it difficult to read light text on a light background, or dark text on a dark background. To improve accessibility, it's recommended that you pick text and background colors with sufficient color contrast.

*(image in the full Top G Vault)*

*High contrast*

*(image in the full Top G Vault)*

*Low contrast*

## Color non-reliance

Over 5% of people in the world have some form of color blindness. Although it's rare for someone to see **only** in black and white, imagine viewing a game in grayscale:

### No Color Blindness

*(image in the full Top G Vault)*

### Color Blindness

*(image in the full Top G Vault)*

<br>
By modifying the image to use different **symbols** alongside colors, more players can tell the difference in gameplay and in other contexts:

### No Color Blindness

*(image in the full Top G Vault)*

### Color Blindness

*(image in the full Top G Vault)*

## Sound non-reliance

Sound is an excellent addition for immersive games, but hearing-impaired players or anyone who turns their volume off will be confused by in-game events that are **only** conveyed with sound.

Consider the following scene where a ringing phone is signalled only by sound, and then signalled with both sound **and** visual aids.

[Video: Sound-Reliance.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/publishing/accessibility/Sound-Reliance.mp4)

## Player preferences

Various visual settings are available to players from the Roblox and in-game **Settings** menus, including [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Preferred transparency|preferred transparency]], [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Preferred text size|preferred text size]], and [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Reduced motion|reduced motion]]. For optimal accessibility, your [[30 Official Roblox Docs/UI/User interface|user interface]] should accommodate each.

### Preferred transparency

The **Background Transparency** setting maps to the [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] property. A value of `1` indicates the player prefers the default background transparency, while a value of `0` indicates the player prefers fully opaque (non‑transparent) background transparency for improved readability and contrast.

Multiplying a UI element's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] with [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|PreferredTransparency]] is the recommended way to use this setting; backgrounds will become more opaque as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|PreferredTransparency]] approaches `0`.

1. Using the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tagging]] system, apply a tag of `TransparentBack` to all UI items with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] such as [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] or [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]].

   *(image in the full Top G Vault)*

   *Four [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] elements with varying [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] levels*

2. Paste the following code into a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]].

		```lua title="Dynamic Adjustment for Preferred Transparency"
		local GuiService = game:GetService("GuiService")
		local CollectionService = game:GetService("CollectionService")

		local TAG = "TransparentBack"

		local transparentBackObjects = {}

		local function onInstanceAdded(object)
			if object.BackgroundTransparency then
				local defaultTransparency = object.BackgroundTransparency
				transparentBackObjects[object] = defaultTransparency
				object.BackgroundTransparency = defaultTransparency * GuiService.PreferredTransparency
			end
		end

		local function onInstanceRemoved(object)
			transparentBackObjects[object] = nil
		end

		-- Store initial tagged instances
		for _, object in CollectionService:GetTagged(TAG) do
			onInstanceAdded(object)
		end

		-- Detect when tagged instance is added or removed
		CollectionService:GetInstanceAddedSignal(TAG):Connect(onInstanceAdded)
		CollectionService:GetInstanceRemovedSignal(TAG):Connect(onInstanceRemoved)

		-- When in-game setting is changed, adjust tagged instances
		GuiService:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			for object, defaultTransparency in transparentBackObjects do
				object.BackgroundTransparency = defaultTransparency * GuiService.PreferredTransparency
			end
		end)
		```

3. Playtest the game, open the **Settings** menu, and adjust **Background Transparency**. The tagged UI elements should update between their default [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] and fully opaque.

   #### Default

   *(image in the full Top G Vault)*

   #### 50% More Opaque

   *(image in the full Top G Vault)*

   #### Fully Opaque

   *(image in the full Top G Vault)*

### Preferred text size

The **Text Size** setting maps to the [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|GuiService.PreferredTextSize]] property which defaults to [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Medium]]. Players can choose to increase text size through the engine's font rendering pipeline to [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Large]], [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Larger]], or [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|Largest]].

When working with UI elements, note the following behaviors:

- Text that is constrained to a minimum and/or maximum size through a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] will **not** shrink below or expand above the set [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]]/[[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|MaxTextSize]], regardless of the player's text size setting.

- When [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] is enabled for a [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextButton]], the element's text will **not** be scaled by the [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] value.

- UI elements with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] enabled will shrink/grow as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] decreases/increases (element bounds will resize to fit the resized text).

- When [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextWrapped]] is enabled for a [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped|TextButton]], the element's text will wrap to additional lines as [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]] increases, within limits of the element's absolute size.

- The results returned by [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize|TextService:GetTextSize()]] and [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync|TextService:GetTextBoundsAsync()]] honor changes related to [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]].

### Reduced motion

The **Reduce Motion** toggle maps to the [[30 Official Roblox Docs/API Reference/Classes/GuiService#ReducedMotionEnabled|GuiService.ReducedMotionEnabled]] property. A value of `true` indicates the player wants motion effects through [[30 Official Roblox Docs/UI/UI animation-tweens|UI animations/tweens]] to be reduced or completely removed.

A basic approach to removing motion from UI tweens is to set the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#Time|Time]] parameter of a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] to `0` when [[30 Official Roblox Docs/API Reference/Classes/GuiService#ReducedMotionEnabled|ReducedMotionEnabled]] is `true`, effectively making the UI object snap to its target instantly.

```lua title="UI Tween Snap-to-Target for Reduced Motion"
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local menuUI = playerGui:WaitForChild("MenuUI")

-- Use tween time of 0.75 seconds unless reduced motion is enabled
local TWEEN_TIME = if GuiService.ReducedMotionEnabled then 0 else 0.75
local tweenInfo = TweenInfo.new(TWEEN_TIME, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

local tween = TweenService:Create(menuUI.SettingsFrame, tweenInfo, {Position = UDim2.fromScale(0.5, 0.5)})

tween:Play()
```

Alternatively to instant snapping, you can handle [[30 Official Roblox Docs/API Reference/Classes/GuiService#ReducedMotionEnabled|ReducedMotionEnabled]] with more distinct `true`/`false` logic. For example, the following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] uses motion tweening by default, but switches to fade‑in for players who enable reduced motion, resulting in a more elegant transition without positional movement.

```lua title="Fallback to Fade Tween for Reduced Motion"
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local menuUI = playerGui:WaitForChild("MenuUI")

-- Create a canvas group to tween all children uniformly
local canvasGroup = Instance.new("CanvasGroup")
canvasGroup.Size = UDim2.fromScale(1, 1)
canvasGroup.BackgroundTransparency = 1
canvasGroup.Parent = menuUI

-- Add children to canvas group
menuUI.SettingsFrame.Parent = canvasGroup

local tweenInfo = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local tween

-- Use fading tween for reduced motion, or a motion tween otherwise
if GuiService.ReducedMotionEnabled then
	-- Initially set canvas group to fully transparent (invisible)
	canvasGroup.GroupTransparency = 1
	-- Fade in canvas group
	tween = TweenService:Create(canvasGroup, tweenInfo, {GroupTransparency = 0})
else
	-- Initially set canvas group off screen
	canvasGroup.Position = UDim2.fromScale(0, -1)
	-- Move canvas group on screen
	tween = TweenService:Create(canvasGroup, tweenInfo, {Position = UDim2.fromScale(0, 0)})
end

tween:Play()
```

## Volume controls

Different sounds playing at the same time can be overwhelming, distracting, or difficult to distinguish. Providing users with volume controls for different "groups" of audio such as sound effects, music, and speech lets them customize their game and focus on what they need to.

Consider the following example of a very noisy game where the user is able to modify music and sound effect volumes separately.

[Video: Audio-Volume.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/publishing/accessibility/Audio-Volume.mp4)

---
*Source: [Accessibility guidelines](https://create.roblox.com/docs/production/publishing/accessibility) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
