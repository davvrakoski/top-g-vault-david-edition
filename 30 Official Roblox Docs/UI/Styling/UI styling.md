---
title: "UI styling"
description: "Explore how stylesheets let you declare and globally apply overrides to UI instance properties."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/styling"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore how stylesheets let you declare and globally apply overrides to UI instance properties.*

UI styling is a Roblox solution to stylesheets, [[30 Official Roblox Docs/UI/Styling/CSS Comparisons|similar to CSS]], that lets you declare and globally apply overrides to UI instance properties. This engine‑level support is the foundation for the [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]] and the end‑to‑end token pipeline.

## Concepts

Style **rules** (part of a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]]) apply to every instance that matches the rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] definition to match characteristics such as class name, instance name, and hierarchy relationships. See the [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] documentation for details.

Style **tokens**, defined through [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] of a token [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]], represent UI property variables that can be used across styles and components, for example a common color for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|Frame.BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextColor3|TextLabel.TextColor3]], and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|UIStroke.Color]]. Tokens are comparable to CSS [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Variables|variables]].

Style **themes**, configured through [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] of a theme [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]], consist of sets of specific tokens that can be swapped, for example color tokens that define a "light" and "dark" theme. Related themes must have the same set of tokens to work correctly.

Style **queries** allow you to apply styles conditionally based on the UI's context or environment. These are comparable to CSS [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Queries|container queries and media queries]], enabling UI to adapt to screen size, input types, or user accessibility settings.

*(image in the full Top G Vault)*

## Rule propagation

A [[30 Official Roblox Docs/API Reference/Classes/StyleLink|StyleLink]] instance links a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] and its associated rules to a parent [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and all of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] within it. Only one [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] can apply to a given tree.

*(image in the full Top G Vault)*

## Selector definitions

At a high level, instance matching and modification via a rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] definition operates through:

- Roblox **class** selectors which target all instances of a given [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] class, for example [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], etc.
- Instance [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tags]] applied to specific UI objects through [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]].
- Instance **name** selection according to the value of the UI object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]].
- Instance **modifiers**, similar to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Pseudo-instances|CSS pseudo-elements]], applied through phantom [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponents]] such as [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] or [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]].
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] **state** selectors, similar to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Pseudo-classes|CSS pseudo-class]] selectors, which correspond to one of the four [[30 Official Roblox Docs/API Reference/Enums/GuiState|GuiState]] enum values such as [[30 Official Roblox Docs/API Reference/Enums/GuiState|Hover]].
- Roblox **query** selectors, similar to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Queries|CSS container and media queries]], which use the `@` prefix to apply styles only while a [[30 Official Roblox Docs/API Reference/Classes/StyleQuery|StyleQuery]] instance or pseudo‑instance with the same name is active.

### Class Selector

The following setup shows how size and color tokens, a theme, and a class selector of `"Frame"` produce a magenta [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] of size 200×200 pixels.

*(image in the full Top G Vault)*

> [!note]- **Code Equivalent**
> ```lua title="UI Class Selector"
> local CollectionService = game:GetService("CollectionService")
> local ReplicatedStorage = game:GetService("ReplicatedStorage")
>
> local screenGui = script.Parent
>
> -- Tokens
> local tokens = Instance.new("StyleSheet")
> tokens.Name = "Tokens"
> tokens.Parent = ReplicatedStorage
> tokens:SetAttribute("SquareS", UDim2.fromOffset(50, 50))
> tokens:SetAttribute("SquareM", UDim2.fromOffset(100, 100))
> tokens:SetAttribute("SquareL", UDim2.fromOffset(200, 200))
> tokens:SetAttribute("Fit", UDim2.fromScale(1, 1))
> tokens:SetAttribute("Magenta", Color3.fromHex("FF0099"))
> tokens:SetAttribute("Gold", Color3.fromHex("FFCC00"))
> tokens:SetAttribute("Aqua", Color3.fromHex("0093F0"))
>
> -- ThemeA
> local themeA = Instance.new("StyleSheet")
> themeA.Name = "ThemeA"
> themeA.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeA
> themeA:SetAttribute("FrameSize", "$SquareM")
> themeA:SetAttribute("FrameColor", "$Aqua")
>
> -- ThemeB
> local themeB = Instance.new("StyleSheet")
> themeB.Name = "ThemeB"
> themeB.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeB
> themeB:SetAttribute("FrameSize", "$SquareL")
> themeB:SetAttribute("FrameColor", "$Magenta")
>
> -- DesignSheet
> local designSheet = Instance.new("StyleSheet")
> designSheet.Name = "DesignSheet"
> designSheet.Parent = ReplicatedStorage
> local themeDerive = Instance.new("StyleDerive")
> themeDerive.StyleSheet = themeB  -- Derive from ThemeB
> themeDerive.Parent = designSheet
>
> -- Link DesignSheet to ScreenGui
> local styleLink = Instance.new("StyleLink")
> styleLink.StyleSheet = designSheet
> styleLink.Parent = screenGui
>
> -- Configure rule
> local rule = Instance.new("StyleRule")
> rule.Selector = "Frame"  -- Class selector
> rule.Parent = designSheet
>
> -- Set rule properties
> rule:SetProperties({
> 	["BackgroundColor3"] = "$FrameColor",
> 	["Size"] = "$FrameSize",
> 	["BorderSizePixel"] = 0
> })
>
> local frame = Instance.new("Frame")
> frame.Parent = screenGui
> ```

### Tag Selector

This setup shows how size/color/font tokens, a theme, and a tag selector of `".ButtonPrimary"` produces a gold button using the [[30 Official Roblox Docs/API Reference/Enums/Font|Oswald]] font at `32` pixels.

*(image in the full Top G Vault)*

> [!note]- **Code Equivalent**
> ```lua title="UI Tag Selector"
> local CollectionService = game:GetService("CollectionService")
> local ReplicatedStorage = game:GetService("ReplicatedStorage")
>
> local screenGui = script.Parent
>
> -- Tokens
> local tokens = Instance.new("StyleSheet")
> tokens.Name = "Tokens"
> tokens.Parent = ReplicatedStorage
> tokens:SetAttribute("Text24", 24)
> tokens:SetAttribute("Text32", 32)
> tokens:SetAttribute("Magenta", Color3.fromHex("FF0099"))
> tokens:SetAttribute("Gold", Color3.fromHex("FFCC00"))
> tokens:SetAttribute("Aqua", Color3.fromHex("0093F0"))
> tokens:SetAttribute("DenkOne", Enum.Font.DenkOne)
> tokens:SetAttribute("Oswald", Enum.Font.Oswald)
>
> -- ThemeA
> local themeA = Instance.new("StyleSheet")
> themeA.Name = "ThemeA"
> themeA.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeA
> themeA:SetAttribute("BackColor", "$Gold")
> themeA:SetAttribute("TextSize", "$Text32")
> themeA:SetAttribute("ButtonFont", "$Oswald")
>
> -- ThemeB
> local themeB = Instance.new("StyleSheet")
> themeB.Name = "ThemeB"
> themeB.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeB
> themeB:SetAttribute("BackColor", "$Aqua")
> themeB:SetAttribute("TextSize", "$Text24")
> themeB:SetAttribute("ButtonFont", "$DenkOne")
>
> -- DesignSheet
> local designSheet = Instance.new("StyleSheet")
> designSheet.Name = "DesignSheet"
> designSheet.Parent = ReplicatedStorage
> local themeDerive = Instance.new("StyleDerive")
> themeDerive.StyleSheet = themeA  -- Derive from ThemeA
> themeDerive.Parent = designSheet
>
> -- Link DesignSheet to ScreenGui
> local styleLink = Instance.new("StyleLink")
> styleLink.StyleSheet = designSheet
> styleLink.Parent = screenGui
>
> -- Configure rule
> local rule = Instance.new("StyleRule")
> rule.Selector = ".ButtonPrimary"  -- Tag selector
> rule.Parent = designSheet
>
> -- Set rule properties
> rule:SetProperties({
> 	["BackgroundColor3"] = "$BackColor",
> 	["TextSize"] = "$TextSize",
> 	["Font"] = "$ButtonFont",
> 	["BorderSizePixel"] = 0
> })
>
> local menuButton = Instance.new("TextButton")
> menuButton.Size = UDim2.fromOffset(200, 44)
> menuButton.Text = "Menu"
> menuButton.Parent = screenGui
> CollectionService:AddTag(menuButton, "ButtonPrimary")  -- Apply tag to button
> ```

### UI Modifier Selector

This setup shows how tokens, a theme, a class selector of `"Frame"`, and a nested UI modifier selector of `"::UICorner"` produce a 300×160 orange [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] with a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] modifier of `20` pixels.

*(image in the full Top G Vault)*

> [!note]- **Code Equivalent**
> ```lua title="UI Modifier Selector"
> local CollectionService = game:GetService("CollectionService")
> local ReplicatedStorage = game:GetService("ReplicatedStorage")
>
> local screenGui = script.Parent
>
> -- Tokens
> local tokens = Instance.new("StyleSheet")
> tokens.Name = "Tokens"
> tokens.Parent = ReplicatedStorage
> tokens:SetAttribute("RectS", UDim2.fromOffset(75, 40))
> tokens:SetAttribute("RectM", UDim2.fromOffset(150, 80))
> tokens:SetAttribute("RectL", UDim2.fromOffset(300, 160))
> tokens:SetAttribute("Magenta", Color3.fromHex("FF0099"))
> tokens:SetAttribute("Orange", Color3.fromHex("DD6030"))
> tokens:SetAttribute("Radius20", UDim.new(0, 20))
> tokens:SetAttribute("RadiusPill", UDim.new(0.5, 0))
>
> -- ThemeA
> local themeA = Instance.new("StyleSheet")
> themeA.Name = "ThemeA"
> themeA.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeA
> themeA:SetAttribute("FrameSize", "$RectM")
> themeA:SetAttribute("FrameColor", "$Magenta")
> themeA:SetAttribute("CornerRad", "$Radius20")
>
> -- ThemeB
> local themeB = Instance.new("StyleSheet")
> themeB.Name = "ThemeB"
> themeB.Parent = ReplicatedStorage
> local tokensDerive = Instance.new("StyleDerive")
> tokensDerive.StyleSheet = tokens  -- Derive global tokens
> tokensDerive.Parent = themeB
> themeB:SetAttribute("FrameSize", "$RectL")
> themeB:SetAttribute("FrameColor", "$Orange")
> themeB:SetAttribute("CornerRad", "$Radius20")
>
> -- DesignSheet
> local designSheet = Instance.new("StyleSheet")
> designSheet.Name = "DesignSheet"
> designSheet.Parent = ReplicatedStorage
> local themeDerive = Instance.new("StyleDerive")
> themeDerive.StyleSheet = themeB  -- Derive from ThemeB
> themeDerive.Parent = designSheet
>
> -- Link DesignSheet to ScreenGui
> local styleLink = Instance.new("StyleLink")
> styleLink.StyleSheet = designSheet
> styleLink.Parent = screenGui
>
> -- Configure rules
> local frameRule = Instance.new("StyleRule")
> frameRule.Selector = "Frame"  -- Class selector
> frameRule.Parent = designSheet
> local modifierRule = Instance.new("StyleRule")
> modifierRule.Selector = "::UICorner"  -- UI modifier selector
> modifierRule.Parent = frameRule
>
> -- Set rule properties
> frameRule:SetProperties({
> 	["BackgroundColor3"] = "$FrameColor",
> 	["Size"] = "$FrameSize",
> 	["BorderSizePixel"] = 0
> })
> modifierRule:SetProperty("CornerRadius", "$CornerRad")
>
> local frame = Instance.new("Frame")
> frame.Parent = screenGui
> ```

## Modified properties

Instance properties affected by styling are flagged with a **⚠** in the **Properties** window, and hovering over an affected property shows which style is influencing it. For example, if a style rule tells a tagged [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] to use an [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] of

`0.5, 0.5`

, that object property will show the **default** value of

`0, 0`

 but its actual [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] will use the rule's **styled** value.

*(image in the full Top G Vault)*

When a default or styled property value is further modified for a specific UI object, it becomes **bold** to indicate an overridden value. For example — assuming a default [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] of

`0, 0`

 — setting that property to

`1, 1`

 for a specific instance reveals an override in bold:

### Default Property Value

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Overridden Property Value

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

For any overridden property value, you can right-click it in the **Properties** window and select **Reset to Default** to revert it to the styled value, or to the default property value if it hasn't been styled.

---
*Source: [UI styling](https://create.roblox.com/docs/ui/styling) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
