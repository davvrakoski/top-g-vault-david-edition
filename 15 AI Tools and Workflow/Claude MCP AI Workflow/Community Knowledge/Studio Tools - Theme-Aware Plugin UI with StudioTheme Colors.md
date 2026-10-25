---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Theme-Aware Plugin UI with StudioTheme Colors"
tags: [roblox, community-knowledge, studio, plugins, plugin-ui, theming]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StudioTheme
  - https://create.roblox.com/docs/reference/engine/enums/StudioStyleGuideColor
  - https://create.roblox.com/docs/reference/engine/enums/StudioStyleGuideModifier
  - https://create.roblox.com/docs/reference/engine/classes/Studio
  - https://create.roblox.com/docs/reference/engine/classes/StudioService
---
# Studio Tools - Theme-Aware Plugin UI with StudioTheme Colors

Plugins with hard-coded white panels look broken to the many developers who use Studio's dark theme, and dark panels look broken in light mode. The fix is cheap: ask Studio for its own colours and redraw when the theme changes. Your panel then looks like part of Studio, and users trust it more.

## The API in one line

```lua
local theme = settings().Studio.Theme
local bg = theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
```

`StudioTheme:GetColor(styleguideitem, modifier?)` returns a `Color3`. `modifier` is an `Enum.StudioStyleGuideModifier`: `Default`, `Selected`, `Pressed`, `Disabled` or `Hover`.

`settings().Studio.ThemeChanged` fires when the user switches theme. `settings().Studio:GetAvailableThemes()` lists the themes.

## The colours you will actually use

| Element | `StudioStyleGuideColor` |
| --- | --- |
| Panel background | `MainBackground` |
| List rows / cards | `Item` (use the `Hover` / `Selected` modifiers) |
| Body text | `MainText` |
| Secondary text | `SubText`, `DimmedText` |
| Buttons | `Button` + `ButtonText` (modifier for the state) |
| Primary (call-to-action) button | `MainButton` |
| Text boxes | `InputFieldBackground`, `InputFieldBorder` |
| Lines between sections | `Border`, `Separator` |
| Links | `LinkText` |
| Warnings / errors | `WarningText`, `ErrorText` |
| Modal buttons | `DialogButton`, `DialogMainButton` |

## A tiny theming helper

```lua
local Studio = settings().Studio
local C = Enum.StudioStyleGuideColor
local themed = {} -- { {inst, prop, color, modifier?} }

local function bind(inst, prop, color, modifier)
	table.insert(themed, {inst, prop, color, modifier})
	inst[prop] = Studio.Theme:GetColor(color, modifier)
end

local function repaint()
	for _, t in themed do
		t[1][t[2]] = Studio.Theme:GetColor(t[3], t[4])
	end
end

local themeConn = Studio.ThemeChanged:Connect(repaint)
plugin.Unloading:Connect(function() themeConn:Disconnect() end)

-- usage
bind(rootFrame, "BackgroundColor3", C.MainBackground)
bind(titleLabel, "TextColor3", C.MainText)
bind(applyButton, "BackgroundColor3", C.MainButton)
```

For hover states, call `GetColor(C.Button, Enum.StudioStyleGuideModifier.Hover)` in `MouseEnter` and go back to `Default` in `MouseLeave`.

## Icons that match the Explorer

`StudioService:GetClassIcon(className)` returns a dictionary describing the Explorer icon for a class. Use it in lists of instances, so a Part row shows the Part icon. The returned table contains image fields; check its keys in the Output first, because the exact keys are not listed in our docs copy (unverified).

## Text and sizing

- `StudioService.StudioLocaleId` gives the Studio locale (for example `en_US`) if you translate your plugin.
- Use `Enum.Font.SourceSans` or the `Font` / `FontFace` you prefer, at 14-15 px for body text. That is close to Studio's own panels (a community convention, unverified as an official spec).
- Don't use `TextScaled` in plugin UI. Docked panels change size all the time, and scaled text jumps around.

## Pitfalls

- `Studio.Theme` is only usable from plugin code (`GetColor` needs PluginSecurity), so it will not work in a normal game script.
- `UI Theme` on the Studio settings object is **deprecated**; read `Theme` instead.
- Remember to disconnect `ThemeChanged` on unload, or reloads pile up handlers.
- React-lua users: the StudioComponents library has its own theme hook, so you don't need this helper there ([[Studio Tools - React-lua Plugin UI with StudioComponents (MIT)]]).

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle]] · [[Free UI Plugins and UI Storybooks]] · [[UI Libraries - Fusion, React-lua, Vide and Iris]]
