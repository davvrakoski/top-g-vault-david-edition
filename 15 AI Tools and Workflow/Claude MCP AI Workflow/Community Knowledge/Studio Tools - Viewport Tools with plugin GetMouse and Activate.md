---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Viewport Tools with plugin GetMouse and Activate"
tags: [roblox, community-knowledge, studio, plugins, viewport, placement, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#Activate
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#GetMouse
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#GridSize
  - https://create.roblox.com/docs/reference/engine/classes/Mouse
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
---
# Studio Tools - Viewport Tools with plugin GetMouse and Activate

Click-to-place tools (scatter a tree where you click, paint decals onto walls, drop spawn points onto the floor) are the most satisfying plugins to use. They need control of the 3D viewport mouse. In Studio that means **activating** your plugin, which takes the mouse from the Move/Scale/Rotate tools, and reading clicks from a **PluginMouse**. This note covers the activation life cycle, accurate hit-testing and snapping to the user's grid.

## Activation rules

- `plugin:Activate(exclusiveMouse)` makes your plugin **the** active one. Only **0 or 1** plugin is active at a time. Activating yours deactivates everyone else, and they receive `Deactivation`.
- With `exclusiveMouse = true` you can call `plugin:GetMouse()` and get mouse events from the viewport.
- `plugin:Deactivate()` releases it. `plugin.Deactivation` fires when you, Studio or another plugin end your active state, for example when the user picks the Move tool.
- `plugin:IsActivated()` / `IsActivatedWithExclusiveMouse()` tell you the current state.

Tie the toolbar button to this state, so the highlight is always correct:

```lua
local mouse = plugin:GetMouse()
local active = false

local function setActive(on)
	active = on
	button:SetActive(on)
	if on then plugin:Activate(true) end
end

button.Click:Connect(function()
	if active then plugin:Deactivate() else setActive(true) end
end)
plugin.Deactivation:Connect(function() setActive(false) end)
```

## Hit-testing: prefer a raycast over mouse.Hit

`Mouse.Hit`, `Mouse.Target` and `Mouse.TargetFilter` work, but a raycast gives you the **surface normal** and full filtering:

```lua
local function hitUnderMouse(ignore: {Instance})
	local cam = workspace.CurrentCamera
	local ray = cam:ViewportPointToRay(mouse.X, mouse.Y)
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = ignore
	return workspace:Raycast(ray.Origin, ray.Direction * 2000, params)
end
```

Exclude your own preview ("ghost") model, or the ray hits it and the ghost climbs towards the camera.

Whether `mouse.X/Y` should go into `ViewportPointToRay` or `ScreenPointToRay` depends on the GUI inset. In Studio's edit viewport they usually match, but test at the screen edges (unverified in all layouts). `Mouse.UnitRay` is an easier option that is already correct.

## Respect the user's snapping

The plugin can read Studio's toolbar settings:

| Property | Meaning |
| --- | --- |
| `plugin.GridSize` | Move/drag increment in studs. **May have float error** (for example `0.0099999997764826` for 0.01), so round it |
| `plugin.CollisionEnabled` | Whether the user has the **Collisions** toggle on |
| `StudioService.RotateIncrement` | Rotation step in degrees |
| `StudioService.UseLocalSpace` | Local vs world space for transforms |

```lua
local function snap(v: number, step: number)
	step = math.round(step * 1000) / 1000
	if step <= 0 then return v end
	return math.round(v / step) * step
end
```

Snap X and Z to the grid, and keep Y at the hit point (or the hit point plus half the object's height), so objects sit on sloped terrain.

## Place on click

Use `mouse.Button1Down` to place. Wrap each placement in a ChangeHistoryService recording ([[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]), so `Ctrl+Z` removes the last placed tree. Use `mouse.Move` to update the ghost preview, and set `mouse.Icon` to a crosshair so users know a tool is active.

## Pitfalls

- **Forgetting Deactivation**: if another tool takes over and you keep showing a ghost, users think Studio is broken. Hide the ghost in `Deactivation`.
- **Ghost parts saved in the place**: parent previews to `workspace.CurrentCamera` (not saved with the place, as far as we know: unverified) or delete them on `Deactivation` and `Unloading`.
- **Keyboard shortcuts**: `mouse.KeyDown` is deprecated. Use PluginActions ([[Studio Tools - PluginActions and PluginMenus - Shortcuts and Right-Click Menus]]) or `UserInputService` while the viewport has focus.
- **Running in playtests**: viewport tools should only work in Edit. Check `RunService:IsEdit()`.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged]] · [[Poisson Disk Scatter for Trees, Rocks and Props]] · [[Free Building Plugins - Stravant, F3X and Archimedes]]
