---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - React-lua Plugin UI with StudioComponents (MIT)"
tags: [roblox, community-knowledge, studio, plugins, plugin-ui, react-lua, open-source]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/sircfenner/StudioComponents
  - https://sircfenner.github.io/StudioComponents/
  - https://create.roblox.com/docs/reference/engine/classes/StudioTheme
---
# Studio Tools - React-lua Plugin UI with StudioComponents (MIT)

Hand-building checkboxes, dropdowns and colour pickers for a plugin panel takes days, and they never quite match Studio. **StudioComponents** by sircfenner is a set of react-lua components that copy the look of Studio's own controls and follow the Studio theme for you. If your team already writes UI with React-lua (see [[UI Libraries - Fusion, React-lua, Vide and Iris]]), this is the fastest way to a plugin that looks native.

## Facts (checked 2026-10-25)

| Item | Value |
| --- | --- |
| Repo | https://github.com/sircfenner/StudioComponents |
| License | **MIT**, so it is **bundle-safe** (keep the LICENSE text with your plugin) |
| Latest release | v1.2.0 (2025-01-03); last push 2025-01-15 |
| Targets | react-lua (Roblox's Luau port of React 17) |
| Install | Wally `studiocomponents = "sircfenner/studiocomponents@<version>"` or npm `@sircfenner/studiocomponents` (then run `npmluau`) |
| Docs | https://sircfenner.github.io/StudioComponents/ |

The README's install example pins `@1.0.0`. Check the releases page and pin the newest version you have tested.

## What it exports

From the package's `init.luau`:

- **Inputs:** `Button`, `MainButton`, `Checkbox`, `RadioButton`, `TextInput`, `NumericInput`, `Slider`, `Dropdown`, `ColorPicker`, `DatePicker`, `NumberSequencePicker`
- **Layout:** `Background`, `ScrollFrame`, `Splitter`, `TabContainer`, `DropShadowFrame`, `Label`
- **Feedback:** `ProgressBar`, `LoadingDots`
- **Plumbing:** `PluginProvider`, `ThemeContext`, `Constants`
- **Hooks:** `useTheme`, `usePlugin`, `useMouseIcon`

`NumberSequencePicker` is unusual and very useful for VFX tools: it edits the same kind of curve as a ParticleEmitter's Transparency or Size.

## How to wire it up

1. Create your dock widget with `CreateDockWidgetPluginGuiAsync` ([[Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle]]).
2. Create a React root on the widget. Wrap your app in `PluginProvider` with a single `Plugin = plugin` prop. The source says you only *need* it for custom mouse icons (`useMouseIcon`; the built-in `Splitter` uses it). Theming works without it. Render only one provider, at the top of the tree.
3. Inside components, call `useTheme()` to get the current Studio theme. It updates when the user switches light/dark, so you don't need the manual repaint helper from [[Studio Tools - Theme-Aware Plugin UI with StudioTheme Colors]].
4. Unmount the root in `plugin.Unloading`.

Our sketch (check prop names against the API docs before copying):

```lua
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)
local SC = require(Packages.StudioComponents)

local function App()
	local snap, setSnap = React.useState(true)
	return React.createElement(SC.Background, {}, {
		Snap = React.createElement(SC.Checkbox, {
			Label = "Snap to grid",
			Value = snap,
			OnChanged = function() setSnap(not snap) end,
		}),
	})
end

local root = ReactRoblox.createRoot(widget)
root:render(React.createElement(SC.PluginProvider, { Plugin = plugin }, {
	App = React.createElement(App),
}))
plugin.Unloading:Connect(function() root:unmount() end)
```

`Checkbox` is a **controlled** component: you pass `Value` (true, false, or `nil` for an "indeterminate" box), plus `OnChanged`, which takes no arguments, and an optional `Label` (these props are confirmed in `Checkbox.luau`). Other components follow the same pattern. Check their API pages or the repo's `Stories` folder for the exact props.

## Good fits and poor fits

- **Good:** settings panels, batch tools with many options, editors (curves, colours, dates).
- **Overkill:** a single button plugin. Use a toolbar button and no UI at all.
- **Not React?** Fusion or Vide users can copy the look by reading the same `StudioStyleGuideColor` values.

## Risks

- Last push was January 2025. It is stable, but it is a small, single-maintainer project. Pin the version and vendor it with Wally.
- React-lua adds size and start-up time to your plugin. Measure the load time on a slow PC if you plan to publish.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Free UI Plugins and UI Storybooks]] · [[Wally Package Manager - Manifest, Realms and Commands]] · [[Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload]]
