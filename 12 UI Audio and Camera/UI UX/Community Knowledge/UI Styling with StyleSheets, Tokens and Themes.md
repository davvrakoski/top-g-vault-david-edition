---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "UI Styling with StyleSheets, Tokens and Themes"
tags: [roblox, community-knowledge, ui, stylesheet, design-tokens, themes]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/styling
  - https://create.roblox.com/docs/ui/styling/editor
  - https://create.roblox.com/docs/reference/engine/classes/StyleSheet
  - https://create.roblox.com/docs/reference/engine/classes/StyleRule
  - https://create.roblox.com/docs/reference/engine/classes/StyleQuery
---
# UI Styling with StyleSheets, Tokens and Themes

Most Roblox projects style UI by copy-pasting frames, so changing the main button colour means editing 200 instances. Roblox now has engine-level styling that works like CSS: rules match UI instances and override their properties, tokens are named variables, and themes are swappable token sets. The Studio **Style Editor** is built on the same instances. This turns the existing "UI Design System and Tokens" idea from a convention into something the engine enforces.

## The five instances

| Instance | Role |
|---|---|
| `StyleSheet` | Holds rules; its **attributes** are tokens (e.g. `Gold = Color3`) |
| `StyleRule` | `Selector` string + property overrides via `SetProperty`/`SetProperties`; `Priority` breaks ties |
| `StyleDerive` | Makes one StyleSheet inherit another's tokens/rules (tokens -> theme -> design sheet) |
| `StyleLink` | Parented to a `ScreenGui`; points at the StyleSheet that styles that tree |
| `StyleQuery` | Conditions such as `MaxSize` or `PreferredInput`; turns `@Name` rules on and off |

Only one StyleSheet applies to a given tree (via its StyleLink).

## Selector syntax (from the docs)

- **Class:** `"Frame"`, `"TextButton"`
- **Tag:** `".ButtonPrimary"` (a CollectionService tag on the instance)
- **Name:** `"#CloseButton"` matches `Instance.Name`
- **Modifier:** `"::UICorner"` creates a phantom UICorner (or UIStroke, UIListLayout...) under matches, so you don't need a real UICorner in every button
- **State:** `":Hover"`, e.g. `"TextButton:Hover"` (GuiState values)
- **Hierarchy:** `".MenuContainer > TextButton"` (direct children) and `".MenuContainer >> TextButton"` (any descendant)
- **Lists:** `"ImageLabel, TextLabel"`
- **Query:** `"@WideContainer Frame > TextButton"` applies only while the StyleQuery named `WideContainer` is active; the docs also show a `"@ReducedMotionEnabledTrue Frame"` example for reduced-motion styling

Property values can reference tokens with a `$` prefix, for example `"$PrimaryColor"`.

## A small working setup

```lua
local RS = game:GetService("ReplicatedStorage")

-- 1. Tokens
local tokens = Instance.new("StyleSheet")
tokens.Name = "Tokens"
tokens:SetAttribute("Accent", Color3.fromHex("FFC94A"))
tokens:SetAttribute("Surface", Color3.fromHex("1E2230"))
tokens:SetAttribute("TextMain", Color3.fromHex("F2F2F2"))
tokens:SetAttribute("Radius", UDim.new(0, 10))
tokens.Parent = RS

-- 2. Design sheet that derives the tokens
local sheet = Instance.new("StyleSheet")
sheet.Name = "Design"
local derive = Instance.new("StyleDerive")
derive.StyleSheet = tokens
derive.Parent = sheet
sheet.Parent = RS

-- 3. Rules
local button = Instance.new("StyleRule")
button.Selector = ".Primary"
button:SetProperties({ BackgroundColor3 = "$Accent", TextColor3 = "$Surface", BorderSizePixel = 0 })
button.Parent = sheet

local corner = Instance.new("StyleRule")
corner.Selector = "::UICorner"
corner:SetProperty("CornerRadius", "$Radius")
corner.Parent = button -- nested: every .Primary gets a rounded corner

-- 4. Link to a ScreenGui
local link = Instance.new("StyleLink")
link.StyleSheet = sheet
link.Parent = playerGui:WaitForChild("MainHUD")
```

Tag your buttons `Primary` with CollectionService and they pick up the style; change `Accent` once and every button updates.

## Themes

A theme is a StyleSheet whose attributes map semantic names to tokens (`ButtonColor = "$Accent"`). Make `ThemeDark` and `ThemeLight` with **the same attribute names** (the docs say related themes must share the same token set), and switch which one the design sheet derives from. Typical uses: colourblind-safe theme, high-contrast theme, seasonal event skin.

## Queries for device and accessibility

`StyleQuery` instances hold conditions like `MaxSize` (container size) and `PreferredInput`. Rules with an `@QueryName` selector only apply while the query is true. Use them for:

- Bigger touch targets when `PreferredInput` is touch
- A compact layout under a size threshold
- Larger text tokens for players who choose large text (combine with `GuiService.PreferredTextSize`)

## Migration tips

- Start with colours and corner radius only. They give the biggest win with the least risk.
- Remove hard-coded properties from instances you style; the docs show overridden values in the Properties window, which helps you audit.
- Typos fail silently: the StyleRule reference says invalid property names such as `"BkColor"` are ignored without an error. Check every new rule in Play mode.
- Keep the token sheet in ReplicatedStorage so client UI scripts can read and swap it.
- Read the "UI styling compatibility" doc page before relying on a selector type in production; styling is newer than the rest of the UI stack.

## Related
[[UI UX - Hub]] · [[UI Design System and Tokens]] · [[UI Design System]] · [[Colorblind-Safe Palettes for Game UI]]
