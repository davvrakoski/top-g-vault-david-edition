---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Drag and Drop Between Plugin Panels with StartDrag"
tags: [roblox, community-knowledge, studio, plugins, plugin-ui, drag-and-drop]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#StartDrag
  - https://create.roblox.com/docs/reference/engine/classes/PluginGui
  - https://create.roblox.com/docs/reference/engine/classes/PluginDragEvent
---
# Studio Tools - Drag and Drop Between Plugin Panels with StartDrag

A prop palette where you **drag** a thumbnail feels far better than one where you click, then click again in the world. It is also the natural way to move items between two panels (for example from "kit library" to "this level's favourites"). Studio plugins get real OS-style drag and drop through `plugin:StartDrag()` and four events on every `PluginGui`. This note shows the data format and a palette-to-panel example, and is honest about the parts that don't work.

## Start a drag

```lua
local function beginDrag(propName: string, thumb: string)
	plugin:StartDrag({
		Sender = "TopG_Palette",      -- who started it
		MimeType = "text/plain",      -- format of Data
		Data = propName,              -- the payload (a string)
		DragIcon = thumb,             -- image shown under the cursor
		HotSpot = Vector2.new(16, 16) -- where the cursor "holds" the icon
	})
end

tile.MouseButton1Down:Connect(function()
	beginDrag(tile.Name, tile.Image)
end)
```

All fields are optional strings, except `HotSpot` (a `Vector2`) and the two icons (Content). Keep `Data` small: a key or ID that you look up, not a whole serialised model. Use JSON with `HttpService:JSONEncode` if you need several fields, and set `MimeType` to something like `application/json` so receivers can check it.

## Receive a drop in a PluginGui

Each `PluginGui` (including `DockWidgetPluginGui`) has:

| Event | When |
| --- | --- |
| `PluginDragEntered(dragData)` | The cursor enters your panel during a drag |
| `PluginDragMoved(dragData)` | It moves inside your panel |
| `PluginDragLeft(dragData)` | It leaves |
| `PluginDragDropped(dragData)` | The user releases over your panel |

`dragData` holds `Sender`, `MimeType`, `Data` and `Position` (relative to the widget), the same fields as a `PluginDragEvent`.

```lua
favouritesWidget.PluginDragDropped:Connect(function(d)
	if d.Sender ~= "TopG_Palette" or d.MimeType ~= "text/plain" then return end
	addFavourite(d.Data, d.Position)
end)
favouritesWidget.PluginDragEntered:Connect(function() highlight(true) end)
favouritesWidget.PluginDragLeft:Connect(function() highlight(false) end)
```

Always check `Sender` and `MimeType`. Other plugins may start drags too.

## Dropping into the 3D viewport

The four events belong to **PluginGuis**, so they tell you about drops on panels, not on the 3D viewport. For "drag a prop into the world", the usual pattern is:

1. On mouse-down on a palette tile, remember the chosen prop and **activate a placement tool** (`plugin:Activate(true)`, see [[Studio Tools - Viewport Tools with plugin GetMouse and Activate]]).
2. Show a ghost under the viewport mouse.
3. Place on the next `Button1Down` (or on release, if you track button-up in the viewport).

How a `StartDrag` behaves over the 3D view (whether Studio itself accepts it) is **not documented** in the references we checked (unverified). Don't rely on it.

## UX details that matter

- Use a **drag threshold**: start the drag only after the mouse moves 4-6 px with the button down, so a simple click still selects the tile.
- Show the drop target: change the panel's border colour on `PluginDragEntered` (use theme colours, see [[Studio Tools - Theme-Aware Plugin UI with StudioTheme Colors]]).
- Use `Position` to insert at the right spot in a list (index = `math.floor(pos.Y / rowHeight) + 1`).
- Wrap the resulting change in a ChangeHistoryService recording if the drop edits the DataModel.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - DockWidgetPluginGui Panels - Create, Restore and Toggle]] · [[Free UI Plugins and UI Storybooks]] · [[Modular Kits from the Kenney FBX Library]]
