---
title: "UI animation/tweens"
description: "Explains how to animate GuiObjects using the process of tweening."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/animation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to animate GuiObjects using the process of tweening.*

In animation, **tweening** is the process of generating intermediate frames between two key points in a sequence. When designing a user interface, you can use tweening to transition a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] smoothly from one state to another, such as:

- Smoothly increasing the size of a button when a user selects it.
- Sliding UI menus in and out from the screen edges.
- Gradually animating a health bar between two widths when a user receives a health boost.

## Single-property tweens

### Position

To tween the **position** of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]:

1. Set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] for the object.
1. Determine [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinates for the object's target position, using the **scale** parameters of [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] instead of exact pixel values so that the object tweens to the exact center of the screen.
1. Pass a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] and the target position to [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]].
1. Play the tween with [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|Tween:Play()]].

The following code snippet moves an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] within a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] to the exact center of the screen:

```lua title="UI Tween - Position" highlight="8,10,12,13,15"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local targetPosition = UDim2.new(0.5, 0, 0.5, 0)

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {Position = targetPosition})

tween:Play()
```

### Size

To tween the **size** of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]:

1. Determine [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] coordinates for the object's target size, using the **scale** parameters of [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] instead of exact pixel values so that the object tweens to a relative percentage of the screen size.
1. Attach a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] to the object to maintain its designed aspect ratio when tweening.
1. Pass a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] and the target size to [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]].
1. Play the tween with [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|Tween:Play()]].

The following code snippet scales an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] within a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] to 40% of the screen width or height (whichever is smaller) from the object's center anchor point:

```lua title="UI Tween - Size" highlight="8,10,11,13,16,18"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local aspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
aspectRatioConstraint.Parent = object

local targetSize = UDim2.new(0.4, 0, 0.4, 0)

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {Size = targetSize})

tween:Play()
```

### Rotation

To tween the **rotation** of a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]:

1. Set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] for the object to rotate around.
1. Determine the target [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] for the object.
1. Pass a [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] and the target rotation to [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]].
1. Play the tween with [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|Tween:Play()]].

```lua title="UI Tween - Size" highlight="8,10,13,15"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local targetRotation = 45

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {Rotation = targetRotation})

tween:Play()
```

### Transparency

Multiple properties control UI transparency, depending on the object type. You can tween each of these properties individually or combined through a [[30 Official Roblox Docs/UI/UI animation-tweens#Multi-property tweens|multi-property tween]]. Alternatively, you can tween an object's overall transparency by placing it inside a [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup|CanvasGroup]] and tweening the group's [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupTransparency|GroupTransparency]].

| UI Object | Properties |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency\|TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeTransparency\|TextStrokeTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency\|TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency\|TextStrokeTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency\|ImageTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|BackgroundTransparency]], [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageTransparency\|ImageTransparency]] |

> [!info]
> As a modern alternative to [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeTransparency|TextLabel.TextStrokeTransparency]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency|TextButton.TextStrokeTransparency]], you can tween stroke transparency on a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] object as outlined in [[30 Official Roblox Docs/UI/UI animation-tweens#Stroke|Stroke]].

```lua title="UI Tween - Image Transparency" highlight="8,11,13"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

local targetTransparency = 0.8

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {ImageTransparency = targetTransparency})

tween:Play()
```

```lua title="UI Tween - Canvas Group Transparency" highlight="8,11,13"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local canvasGroup = ScreenGui:WaitForChild("CanvasGroup")

local targetTransparency = 0.8

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(canvasGroup, tweenInfo, {GroupTransparency = targetTransparency})

tween:Play()
```

### Color

Multiple properties control UI color, depending on the object type. You can tween each of these properties individually or combined through a [[30 Official Roblox Docs/UI/UI animation-tweens#Multi-property tweens|multi-property tween]]. Alternatively, you can tween an object's overall color by placing it inside a [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup|CanvasGroup]] and tweening the group's [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupColor3|GroupColor3]].

| UI Object | Properties |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextColor3\|TextColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeColor3\|TextStrokeColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3\|TextColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3\|TextStrokeColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3\|ImageColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3\|ImageColor3]] |

> [!info]
> As a modern alternative to [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3|GuiObject.BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeColor3|TextLabel.TextStrokeColor3]], and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3|TextButton.TextStrokeColor3]], you can tween stroke color on a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] object as outlined in [[30 Official Roblox Docs/UI/UI animation-tweens#Stroke|Stroke]].

```lua title="UI Tween - Image Color" highlight="8,11,13"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

local targetColor = Color3.fromRGB(255, 0, 0)

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {ImageColor3 = targetColor})

tween:Play()
```

```lua title="UI Tween - Canvas Group Color" highlight="8,11,13"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local canvasGroup = ScreenGui:WaitForChild("CanvasGroup")

local targetColor = Color3.fromRGB(255, 0, 0)

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(canvasGroup, tweenInfo, {GroupColor3 = targetColor})

tween:Play()
```

### Stroke

Multiple properties control UI borders, depending on the object type.

| UI object | Properties |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeColor3\|TextStrokeColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeTransparency\|TextStrokeTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3\|TextStrokeColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency\|TextStrokeTransparency]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|BorderSizePixel]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|BorderColor3]] |

Alternatively, you can apply a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] child and tween its thickness, color, and/or transparency.

| UI Object | Properties |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke\|UIStroke]] | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color\|Color]], [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness\|Thickness]], [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency\|Transparency]] |

```lua title="UI Tween - UIStroke Color & Thickness" highlight="8-11,13,14,17,19"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("TextLabel")

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 5
stroke.Parent = object

local targetColor = Color3.fromRGB(255, 0, 0)
local targetThickness = 10

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(stroke, tweenInfo, {Color = targetColor, Thickness = targetThickness})

tween:Play()
```

## Multi-property tweens

You can combine any of the [[30 Official Roblox Docs/UI/UI animation-tweens#Single-property tweens|single-property tweens]] into more complex tweens by passing multiple target properties to [[30 Official Roblox Docs/API Reference/Classes/TweenService#Create|TweenService:Create()]], for example **position + rotation** or **size + transparency**.

```lua title="UI Tween - Position & Rotation" highlight="8,10,11,14,16"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local targetPosition = UDim2.new(0.5, 0, 0.5, 0)
local targetRotation = 45

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {Position = targetPosition, Rotation = targetRotation})

tween:Play()
```

```lua title="UI Tween - Size & Transparency" highlight="13,14,17,19"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local aspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
aspectRatioConstraint.Parent = object

local targetSize = UDim2.new(0.4, 0, 0.4, 0)
local targetTransparency = 0.8

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(object, tweenInfo, {Size = targetSize, ImageTransparency = targetTransparency})

tween:Play()
```

## Tween sequences

You can chain UI animations to occur one after another by playing subsequent tweens upon the previous tween's [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Completed|Completed]] event. For example, the following script moves an object to the center of the screen, then rotates it by 45°.

```lua title="UI Tween Sequence" highlight="10,11,14,15,18,21-23"
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local object = ScreenGui:WaitForChild("ImageLabel")

object.AnchorPoint = Vector2.new(0.5, 0.5)

local targetPosition = UDim2.new(0.5, 0, 0.5, 0)
local targetRotation = 45

local tweenInfo = TweenInfo.new(2)
local positionTween = TweenService:Create(object, tweenInfo, {Position = targetPosition})
local rotationTween = TweenService:Create(object, tweenInfo, {Rotation = targetRotation})

-- Initially play position tween
positionTween:Play()

-- Play rotation tween upon completion of position tween
positionTween.Completed:Connect(function()
	rotationTween:Play()
end)
```

## Style transitions

UI objects can also be animated through **style transitions**, comparable to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Transitions|CSS transitions]], where one or more UI properties are tweened through [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]] definitions. See the [[30 Official Roblox Docs/UI/Styling/Style Editor#Style transitions|Style Editor]] guide for details.

*(image in the full Top G Vault)*

## Easing options

Using the easing options of [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]], you can control the easing **style** and **direction** of UI animations.

### Style

[[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle]] sets the rate of interpolation from start to end. By default, easing style is set to [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Enum.EasingStyle.Quad]].

| Style | Description |
| --- | --- |
| **Linear** | Moves at a constant speed. |
| **Sine** | Speed is determined by a sine wave for a gentle easing motion. |
| **Quad** | Similar to **Sine** but with a slightly sharper curve based on quadratic interpolation. |
| **Cubic** | Similar to **Quad** but with a slightly sharper curve based on cubic interpolation. |
| **Quart** | Similar to **Cubic** but with an even sharper curve based on quartic interpolation. |
| **Quint** | Similar to **Quart** but with an even sharper curve based on quintic interpolation. |
| **Exponential** | The sharpest curve based on exponential interpolation. |
| **Circular** | Follows a circular arc, such that acceleration is more sudden and deceleration more gradual versus **Quint** or **Exponential**. |
| **Back** | Slightly overshoots the target, then backs into place. |
| **Bounce** | Bounces backwards multiple times after reaching the target, before eventually settling. |
| **Elastic** | Moves as if attached to a rubber band, overshooting the target several times. |

#### EasingDirection = In

*(image in the full Top G Vault)*

#### EasingDirection = Out

*(image in the full Top G Vault)*

#### EasingDirection = InOut

*(image in the full Top G Vault)*

```lua title="Easing Style - Cubic" highlight="1"
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic)
local tween = TweenService:Create(object, tweenInfo, {Rotation = 45})
```

### Direction

[[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Enum.EasingDirection]] defines how the [[30 Official Roblox Docs/UI/UI animation-tweens#Style|easing style]] interpolation applies to an object, with a default of **Out**. Note that a tween with **Linear** easing style is not affected, as linear interpolation is constant from start to end.

| Direction | Description |
| --- | --- |
| **In** | The easing style applies in a forward direction. |
| **Out** | The easing style applies in a reverse direction. |
| **InOut** | The easing style applies forward for the first half and in reverse for the second half. |

```lua title="Easing direction - InOut" highlight="1"
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local tween = TweenService:Create(object, tweenInfo, {Rotation = 45})
```

## Typewriter effect on text

You can easily enhance text-based UI, such as cutscene banners, player instructions, and prompts, with animated effects. The "typewriter" effect is ideal for [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] that tell a story, output NPC conversations, etc.

[Video: Text-Typewriter.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-animation/Text-Typewriter.mp4)

1. Create a new [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] within **ReplicatedStorage**.
1. Rename the new script **AnimateUI**.

   *(image in the full Top G Vault)*

1. Paste the following code into the script:

   ```lua title="ModuleScript - AnimateUI"
   local LocalizationService = game:GetService("LocalizationService")
   local Players = game:GetService("Players")

   local SOURCE_LOCALE = "en"
   local translator = nil

   local AnimateUI = {}

   function AnimateUI.loadTranslator()
   	pcall(function()
   		translator = LocalizationService:GetTranslatorForPlayerAsync(Players.LocalPlayer)
   	end)
   	if not translator then
   		pcall(function()
   			translator = LocalizationService:GetTranslatorForLocaleAsync(SOURCE_LOCALE)
   		end)
   	end
   end

   function AnimateUI.typeWrite(guiObject, text, delayBetweenChars)
   	guiObject.Visible = true
   	guiObject.AutoLocalize = false
   	local displayText = text

   	-- Translate text if possible
   	if translator then
   		displayText = translator:Translate(guiObject, text)
   	end

   	-- Replace line break tags so grapheme loop will not miss those characters
   	displayText = displayText:gsub("<br%s*/>", "\n")
    	-- Remove RichText tags since char-by-char animation will break the tags
   	displayText = displayText:gsub("<[^<>]->", "")

   	-- Set translated/modified text on parent
   	guiObject.Text = displayText

   	local index = 0
   	for first, last in utf8.graphemes(displayText) do
   		index += 1
   		guiObject.MaxVisibleGraphemes = index
   		task.wait(delayBetweenChars)
   	end
   end

   return AnimateUI
   ```

   > [!info]
   > If your game's **source language** is not English (`"en"`), change the locale code for `SOURCE_LOCALE` to match the source language in [[30 Official Roblox Docs/Production/Localization/Localization#Localization settings|localization settings]].

1. Create a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] in a suitable location, such as within a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] parented to [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].
1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] as a direct child of the label and paste in the following code. Note that each message is output by calling `AnimateUI.typeWrite()` with parameters for the parent object, the string to output, and the delay between characters.

   ```lua title="LocalScript" highlight="3,5,10,11,15,16"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local AnimateUI = require(ReplicatedStorage:WaitForChild("AnimateUI"))

   local label = script.Parent

   -- Load translator if game is localized
   --AnimateUI.loadTranslator()

   local message1 = [[Beyond this door is the<br /><font size="46" color="rgb(255,50,25)">Great Zorgoth...</font> <font size="40">🗡</font>]]
   AnimateUI.typeWrite(label, message1, 0.05)

   task.wait(1)

   local message2 = [[...who rules this dungeon <font color="rgb(255,200,50)">unchallenged!</font> <font size="30">😈</font>]]
   AnimateUI.typeWrite(label, message2, 0.05)
   ```

---
*Source: [UI animation/tweens](https://create.roblox.com/docs/ui/animation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
