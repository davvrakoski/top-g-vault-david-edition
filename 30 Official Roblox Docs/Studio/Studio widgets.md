---
title: "Studio widgets"
description: "Building custom widgets in Studio allows you to customize workflows and views."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/build-studio-widgets"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Building custom widgets in Studio allows you to customize workflows and views.*

Studio gives you the power to create custom **widgets** and use them as tools and extensions. These widgets behave as custom windows/panels in Studio, and you can dock them inside of your interface or have them float as separate windows.

## Create widget UIs

All Studio widgets begin as [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]] objects which you can fill with [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], such as text labels and buttons. To create an empty widget GUI, call the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGui|CreateDockWidgetPluginGui()]] function, passing in an ID and a [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo|DockWidgetPluginGuiInfo]] object.

Note the [[30 Official Roblox Docs/API Reference/Datatypes/DockWidgetPluginGuiInfo#new|DockWidgetPluginGuiInfo.new()]] constructor expects its parameters in a **specific order** as follows:

| # | Property | Type | Description |
| --- | --- | --- | --- |
| 1 | [[30 Official Roblox Docs/API Reference/Enums/InitialDockState\|Enum.InitialDockState]] | Enum | One of the [[30 Official Roblox Docs/API Reference/Enums/InitialDockState\|Enum.InitialDockState]] enumerations. |
| 2 | `InitialEnabled` | Boolean | The initial enabled (visible) state of the widget GUI. |
| 3 | `InitialEnabledShouldOverrideRestore` | Boolean | If true, the value of **InitialEnabled** overrides the previously saved enabled state. |
| 4 | `FloatingXSize` | Integer | The initial width of the GUI when **InitialDockState** is set to [[30 Official Roblox Docs/API Reference/Enums/InitialDockState\|Enum.InitialDockState.Float]]. |
| 5 | `FloatingYSize` | Integer | The initial height of the GUI when **InitialDockState** is set to [[30 Official Roblox Docs/API Reference/Enums/InitialDockState\|Enum.InitialDockState.Float]]. |
| 6 | `MinWidth` | Integer | The minimum width of the GUI, with some platform-specific variations. |
| 7 | `MinHeight` | Integer | The minimum height of the GUI, with some platform-specific variations. |

```lua
-- Create new "DockWidgetPluginGuiInfo" object
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	200,    -- Default width of the floating window
	300,    -- Default height of the floating window
	150,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)

-- Create new widget GUI
local testWidget = plugin:CreateDockWidgetPluginGui("TestWidget", widgetInfo)
testWidget.Title = "Test Widget"  -- Optional widget title
```

> [!warning]
> You cannot use the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGui|CreateDockWidgetPluginGui()]] function in scripts. You can only call it from the command bar or a [[30 Official Roblox Docs/Studio/Studio plugins|plugin]] script.

### Customize widget UI

Once you create a widget, you can customize its user interface with [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] such as informative [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] or interactive [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]]. For example, the following code adds a basic [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] to the GUI window:

```lua
-- Create new widget GUI
local testWidget = plugin:CreateDockWidgetPluginGui("TestWidget", widgetInfo)
testWidget.Title = "Test Widget"  -- Optional widget title

local testButton = Instance.new("TextButton")
testButton.BorderSizePixel = 0
testButton.TextSize = 20
testButton.TextColor3 = Color3.new(1,0.2,0.4)
testButton.AnchorPoint = Vector2.new(0.5,0.5)
testButton.Size = UDim2.new(1,0,1,0)
testButton.Position = UDim2.new(0.5,0,0.5,0)
testButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
testButton.Text = "Click Me"
testButton.Parent = testWidget
```

> [!info]
> Note that **you must parent the button to the widget** in the same way that you must parent any in-game screen [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

> [!warning]
> To help you build consistent, effective Studio widgets, Roblox provides a [GitHub repo](https://github.com/Roblox/StudioWidgets) that contains GUI elements with a standard "Studio" look and feel. These include checkboxes, radio buttons, and input fields which have a Studio style, and they all support dark theme.

### Change Studio color themes

Effective Studio widgets ideally match the Studio **theme** setting and dynamically adjust when the theme changes. For instance, if a developer is using the dark theme, the widget's background color, images, and text labels should look nice alongside Studio's native theme colors.

The following code addition uses a `syncGuiColors()` function which is initially called along with a table of GUI objects to sync. Inside the function, a nested `setColors()` function loops through the objects and syncs specific aspects of them using [[30 Official Roblox Docs/API Reference/Classes/StudioTheme#GetColor|GetColor()]] with [[30 Official Roblox Docs/API Reference/Enums/StudioStyleGuideColor|Enum.StudioStyleGuideColor]] enums. This `setColors()` function is immediately run to sync the Studio theme, then it's connected to the [[30 Official Roblox Docs/API Reference/Classes/Studio#ThemeChanged|ThemeChanged]] event to detect future theme changes.

```lua
testButton.Parent = testWidget

local function syncGuiColors(objects)
	local function setColors()
		for _, guiObject in objects do
			-- Sync background color
			guiObject.BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
			-- Sync text color
			guiObject.TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainText)
		end
	end
	-- Run 'setColors()' function to initially sync colors
	setColors()
	-- Connect 'ThemeChanged' event to the 'setColors()' function
	settings().Studio.ThemeChanged:Connect(setColors)
end

-- Run 'syncGuiColors()' function to sync colors of provided objects
syncGuiColors({testButton})
```

### Customize mouse cursors

To improve the expected interaction with widget elements, you can set system-specific **mouse cursors** to GUI events, such as [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|MouseEnter]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|MouseLeave]]. The following code demonstrates how to connect a function to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseEnter|MouseEnter]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#MouseLeave|MouseLeave]] events of `testButton` to change the mouse cursor:

```lua
local function setCursor(cursorAsset)
	plugin:GetMouse().Icon = cursorAsset
end

testButton.MouseEnter:Connect(function()
	setCursor("rbxasset://SystemCursors/PointingHand")
end)
testButton.MouseLeave:Connect(function()
	setCursor("")
end)
```

Reference the following table for a list of mouse cursors and their potential use cases:

| Mouse Cursor Icon | Asset | Use Case |
| --- | --- | --- |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Arrow` | Default clicking and selection. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/PointingHand` | Hovering over an active link/button. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/OpenHand` | Hovering over a draggable item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/ClosedHand` | Dragging an item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/IBeam` | Hovering in a text field. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNS` | Hovering over a vertical resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeEW` | Hovering over a horizontal resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNESW` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeNWSE` | Hovering over a corner resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SizeAll` | Hovering over a multi-direction resize handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitNS` | Hovering over a vertical "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/SplitEW` | Hovering over a horizontal "split" handle. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Forbidden` | Hovering over a locked/forbidden item. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Wait` | Indicating an action is in progress. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Busy` | Indicating the system is busy. |
| *(image in the full Top G Vault)* | `rbxasset://SystemCursors/Cross` | Hovering over a pinpoint selection area. |

> [!warning]
> Note that these cursor looks are only an approximation — the actual cursors match your default operating system cursors.

## Gather user input

UI elements such as [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] work normally in Studio widgets, and you can build interfaces just like you normally would on Roblox. However, [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] doesn't work since these services expect the main game window to be in focus.

One workaround for generic input events is to create a transparent [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] and overlay it over the entire screen. The following code sample creates a frame, and when the user clicks on the frame, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#InputBegan|GuiObject.InputBegan]] event captures keyboard input on the frame until the user clicks away:

```lua
local frame = Instance.new("Frame")
frame.BackgroundTransparency = 1  -- Hide the frame
frame.Size = UDim2.new(1, 0, 1, 0)  -- Cover the screen
frame.Position = UDim2.new(0, 0, 0, 0)
frame.Parent = testWidget

local function onInputBegan(inputObject)
	-- Process the input object here, for example detect key presses
end
frame.InputBegan:Connect(onInputBegan)
```

## Drag-and-drop interaction

Using drag-and-drop interactions for your widgets is a simple way to improve the flow of data. To create this interaction, you must define the element to drag, initiate the drag, create a drop target, and process the drop action.

### Create drag source

You can start a drag action by calling
[[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] when the user
presses a mouse button on some UI element, typically a
[[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] or
[[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] within a widget. The following code sample creates a single
window widget with a text button inside it.

```lua
-- Create the widget first
local widgetInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, true, true, 300, 200)
local dragSourceWidget = plugin:CreateDockWidgetPluginGui("Drag Source", widgetInfo)
dragSourceWidget.Title = "Drag Source"

-- Create a TextButton that will initiate the drag
local dragButton = Instance.new("TextButton")
dragButton.Size = UDim2.new(1, 0, 1, 0)
dragButton.Text = "Drag me!"
dragButton.Parent = dragSourceWidget
```

### Initiate the drag

When the user clicks on the
[[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], you can initiate drag through the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#MouseButton1Down|MouseButton1Down()]] event which fires as soon as the user presses the mouse button.

Within the connected function, determine the data to drag. The data's **type** should be
reflected in the `MimeType` key, the **content** of the drag should be reflected
within the `Data` key, and the **sender** should describe itself in the `Sender`
key. See the [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] page for more details.

```lua
local function onButton1Down()
	local dragInfo = {
		Data = "Hello, world",      -- The data being dragged
		MimeType = "text/plain",    -- Describes the MIME type of the data
		Sender = "SomeDragSource",  -- Describes from where the data originated
		MouseIcon = "",             -- Image content to use for the cursor
		DragIcon = "",              -- Image content to render under the cursor during drag
		HotSpot = Vector2.zero      -- Where on the DragIcon to center the cursor
	}
	plugin:StartDrag(dragInfo)
end

dragButton.MouseButton1Down:Connect(onButton1Down)
```

### Create drop target

The [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]]
event fires when the user releases their mouse on a window during a drag. When
this occurs, you need to define a **drop target** such as a second widget with a
[[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] to detect drops.

```lua
local dragTargetWidget = plugin:CreateDockWidgetPluginGui("Drop Target", widgetInfo)
dragTargetWidget.Title = "Drop Target"

-- This TextLabel will display what was dropped
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = "Drop here..."
textLabel.Parent = dragTargetWidget
```

### Process the drop action

After creating a drop target, connect the [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]] event on the drop target widget:

```lua
local function onDragDrop(dragData)
	print("PluginDragDropped")
	if dragData.MimeType == "text/plain" then
		textLabel.Text = dragData.Data
	else
		textLabel.Text = dragData.MimeType
	end
end

dragTargetWidget.PluginDragDropped:Connect(onDragDrop)
```

While a drag is still in progress, these three events fire as the user moves their mouse over a widget:

- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginDragEntered]] – fires when the user hovers the mouse over a window
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginDragMoved]] –
  fires repeatedly as the user moves their mouse over a window. This is useful
  for showing a "Drop here!" message.
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginDragLeft]] – fires
  when the user's cursor leaves a window. This is useful for hiding a "Drop here!" message.

---
*Source: [Studio widgets](https://create.roblox.com/docs/studio/build-studio-widgets) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
