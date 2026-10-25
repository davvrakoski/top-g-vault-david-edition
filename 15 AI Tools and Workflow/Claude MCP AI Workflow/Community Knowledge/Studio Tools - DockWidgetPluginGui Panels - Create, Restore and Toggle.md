---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle"
tags: [roblox, community-knowledge, studio, plugins, plugin-ui, dockwidget]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/DockWidgetPluginGui
  - https://create.roblox.com/docs/reference/engine/datatypes/DockWidgetPluginGuiInfo
  - https://create.roblox.com/docs/reference/engine/classes/PluginGui
  - https://create.roblox.com/docs/reference/engine/classes/Plugin
---
# Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle

A toolbar button is enough for one-shot actions. Anything with options (a prop palette, a batch renamer, a spawn-point checker) needs a **panel**: a window the user can dock next to the Explorer, float, or close, and that comes back in the same place next session. In Studio that panel is a **DockWidgetPluginGui**, the same kind of window that hosts the Animation Editor and Terrain tools.

## Create it (current API)

`Plugin:CreateDockWidgetPluginGui()` is **deprecated**. Use `CreateDockWidgetPluginGuiAsync(pluginGuiId, info)`. It **yields**, so call it at plugin start-up, before you build the UI.

```lua
local info = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Right, -- where it first appears
	false,  -- InitialEnabled: closed on first ever run
	false,  -- InitialEnabledShouldOverrideRestore
	320, 420, -- FloatingXSize, FloatingYSize
	240, 200  -- MinWidth, MinHeight
)

local widget = plugin:CreateDockWidgetPluginGuiAsync("TopG_PropPalette", info)
widget.Title = "Prop Palette"
widget.Name = "TopG_PropPalette"
```

### What each argument really controls

| Argument | Meaning |
| --- | --- |
| `pluginGuiId` | Unique, **never change it**. Studio saves the dock position, size and open/closed state under this ID |
| `InitialDockState` | `Right`, `Left`, `Top`, `Bottom` or `Float`, used only when no saved state exists |
| `InitialEnabled` | Open or closed the first time |
| `InitialEnabledShouldOverrideRestore` | `true` forces `InitialEnabled` every session and ignores what the user last did. Usually leave it `false` |
| `FloatingXSize/YSize` | Starting size when floating |
| `MinWidth/MinHeight` | Smallest size the user can drag it to. Platforms have their own minimum (about 80 px wide on Mac for the title-bar buttons) |

`widget.HostWidgetWasRestored` tells you whether a saved state was used. That is handy if you want to show a one-time welcome screen.

## Toggle it from a toolbar button

```lua
local button = toolbar:CreateButton("PropPalette", "Open the prop palette", "", "Palette")
button.ClickableWhenViewportHidden = true

local function sync()
	button:SetActive(widget.Enabled)
end

button.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)
widget:GetPropertyChangedSignal("Enabled"):Connect(sync)
sync() -- restored state may already be open
```

Hooking `Enabled` (not just the click) keeps the button highlight right when the user closes the panel with its own X.

## Useful PluginGui members

- `Title`: the text in the tab or title bar.
- `BindToClose(fn)`: runs when the user clicks the close button. The reference says the widget **still closes** and `Enabled` still becomes `false`, so you **cannot cancel the close**. Use it to auto-save the panel's state (for example with `plugin:SetSetting`), not for "are you sure?" dialogs.
- `GetRelativeMousePosition()`: the mouse position inside the panel, for custom drag handles.
- `WindowFocused` / `WindowFocusReleased`: pause expensive live previews while the panel is not in use.
- `PluginDragEntered/Moved/Dropped/Left`: drop targets for drags you start with `plugin:StartDrag()` (see [[Studio Tools - Drag and Drop Between Plugin Panels with StartDrag]]).

## Building the contents

A DockWidgetPluginGui is a LayerCollector, so you parent normal GUI objects (`Frame`, `TextButton`, `UIListLayout`, `ScrollingFrame`) to it. Tips:

- Size the root frame with `UDim2.fromScale(1, 1)`. Dock widgets are resized constantly.
- Use a `UIListLayout` with `AutomaticCanvasSize = Y` on a `ScrollingFrame`. Users will dock you into a narrow column.
- Use Studio's colours, not your own. See [[Studio Tools - Theme-Aware Plugin UI with StudioTheme Colors]].
- For bigger tools, use a UI library made for Studio, such as [[Studio Tools - React-lua Plugin UI with StudioComponents (MIT)]].

## Pitfalls

- Two plugins that use the same `pluginGuiId` share saved state. Prefix it with your plugin name.
- Building UI before the async create returns leaves you with `nil`. Make the create the first yield.
- The widget is cleaned up when the plugin unloads, but **connections to services** (Selection, ChangeHistoryService) are not. Disconnect them in `plugin.Unloading` ([[Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety]]).

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]] · [[Free UI Plugins and UI Storybooks]] · [[UI Libraries - Fusion, React-lua, Vide and Iris]]
