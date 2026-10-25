---
title: "Text input fields"
description: "Text input fields allow users to input text from their physical or on-screen keyboard."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/text-input"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Text input fields allow users to input text from their physical or on-screen keyboard.*

A [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] is a rectangle that allows a user to provide text input while it's in focus. When you [[30 Official Roblox Docs/UI/Text input fields#Script text inputs|script]] a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], you can use it as a search bar or an input field on a form. To help users know what type of text they should input, you can also provide a prompt through the [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderText|PlaceholderText]] property.

*(image in the full Top G Vault)*

Because these objects are [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], you can customize
properties such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]],
[[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderMode|BorderMode]],
[[30 Official Roblox Docs/API Reference/Classes/GuiObject#Transparency|Transparency]], and
[[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] to fit the aesthetics of your game.

## Create text inputs on the screen

A [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] on a screen is useful for
things like an input field for a form.

To add a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] to a screen:

1. In the **Explorer** window, select **StarterGui** and add a **ScreenGui**.

   1. Hover over StarterGui and click the ⊕ button. A contextual menu displays.

   1. Insert a **ScreenGui**.

2. Select the new **ScreenGui** and add a **TextBox**.

   1. Hover over **ScreenGui** and click the ⊕ button. A contextual menu displays.

   1. Insert a **TextBox**.

## Create text inputs on part faces

To add a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] to the face of a part:

1. In the **Explorer** window, select **StarterGui** and add a **SurfaceGui**.

   1. Hover over StarterGui and click the ⊕ button. A contextual menu displays.

   1. Insert a **ScreenGui**.

2. Select the new **SurfaceGui** and add a **TextBox**.

   1. Hover over **SurfaceGui** and click the ⊕ button. A contextual menu displays.

   1. Insert a **TextBox**.

3. Adorn the **SurfaceGui** to the **part** on which you want to display the **TextBox**.

   1. In the **Properties** window, select the **Adornee** property. Your cursor changes.

   1. In the **Explorer** window, select the part.

> [!warning]
> If you don't see the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], try [[30 Official Roblox Docs/Parts/Textures and decals|choosing a different face]] in the **Face** property of the **SurfaceGui**.

## Script text inputs

Like [[30 Official Roblox Docs/UI/Text & image buttons|buttons]], you can script any action for a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] object when a user interacts with it. For example, the following script connects the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|FocusLost]] event which fires when the user presses the <kbd>Enter</kbd> button or clicks outside the box. If `enterPressed` is `true`, meaning the user submitted the input instead of merely clicking outside the box, the script prints the contents of the entry to the [[30 Official Roblox Docs/Studio/Output|Output]] window.

```lua title="Basic Text Input Handling"
local textBox = script.Parent

local function onFocusLost(enterPressed, inputObject)
	if enterPressed then
		print(textBox.Text)
	end
end

textBox.FocusLost:Connect(onFocusLost)
```

As another example, you might want to allow only numbers in a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. The following code uses the [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|TextBox.GetPropertyChangedSignal]] event to detect when the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|TextBox.Text]] changes, such as when a user starts typing, then it uses the [[30 Official Roblox Docs/API Reference/Libraries/string#gsub|string.gsub()]] function to disallow non‑numbers.

```lua title="Restricting Text Input to Numbers"
local textBox = script.Parent

local function allowOnlyNumbers()
	textBox.Text = string.gsub(textBox.Text, "%D", "")
end

textBox:GetPropertyChangedSignal("Text"):Connect(allowOnlyNumbers)
```

## Text filtering

Applied to various sources and inputs, [[30 Official Roblox Docs/UI/Text filtering|text filtering]] prevents users from seeing inappropriate language and personally identifiable information such as phone numbers. Roblox automatically filters common text outputs such as messages that have passed through [[30 Official Roblox Docs/Chat/Text chat overview|in-game text chat]], but **you are responsible for filtering any displayed text that you don't have explicit control over**, including .

> [!danger]
> Because filtering is crucial for a safe environment, Roblox actively moderates the content of games to make sure they meet [community standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards). If Roblox receives reports or automatically detects that your game doesn't apply text filtering, then the system removes the game until you add filtering.

---
*Source: [Text input fields](https://create.roblox.com/docs/ui/text-input) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
