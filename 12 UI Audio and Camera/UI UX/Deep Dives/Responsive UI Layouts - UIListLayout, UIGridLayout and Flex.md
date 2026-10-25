---
area: "12 UI Audio and Camera"
cluster: "UI UX"
tags: [deep-dive, roblox, ui, layout, uilistlayout, uigridlayout, flex]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Responsive UI Layouts - UIListLayout, UIGridLayout and Flex

## Why this matters
The same Roblox UI renders on a 6-inch phone, a 27-inch monitor and a TV viewed from 10 feet away. UIs built with absolute pixel positions break on at least two of those, and mobile is where many Roblox players are.
Roblox gives you a complete responsive toolkit: Scale/Offset, AnchorPoint, constraints, list/grid/table/page layouts, flex and automatic sizing. This note explains which tool solves which problem and the rules about which one wins when they conflict.

---

## 1. The four primitives

| Primitive | What it is | Use it for |
|---|---|---|
| **Scale** (UDim2 `X.Scale`, `Y.Scale`) | Fraction of the parent's size | Anything that should grow and shrink with the screen |
| **Offset** (UDim2 `X.Offset`, `Y.Offset`) | Pixels, added to Scale | Fixed spacing, icon sizes, minimum touch-target padding |
| **AnchorPoint** (Vector2 0–1) | Origin point the object positions and resizes from | Centering (`0.5, 0.5`), bottom-right HUD (`1, 1`) |
| **ZIndex / DisplayOrder** | Layering inside a ScreenGui / between ScreenGuis | Modals above HUD |

Studio shortcut from the docs: typing `0.5` in Position or Size becomes `{0.5,0},{0.5,0}` (scale), and typing `20` becomes `{0,20},{0,20}` (offset).

### The rule of thumb
- **Containers:** Scale (they follow the screen).
- **Content inside containers:** layouts + constraints (they follow the container).
- **Offset:** for padding, strokes and minimum sizes only.

A pure-Scale button gets too small on phones and huge on TVs. A pure-Offset button doesn't adapt. Combine them: `UDim2.new(0.2, 0, 0.08, 0)` plus a `UISizeConstraint` with `MinSize = Vector2.new(120, 44)`.

---

## 2. Constraints and modifiers

| Object (child of the GuiObject) | Effect | Notes from the docs |
|---|---|---|
| `UIAspectRatioConstraint` | Locks width:height (`AspectRatio`, `AspectType`, `DominantAxis`) | Use `1` for square icons and avatar thumbnails |
| `UISizeConstraint` | `MinSize` / `MaxSize` in pixels | **Overrides** a parent layout's sizing |
| `UITextSizeConstraint` | `MinTextSize` / `MaxTextSize` | Docs: don't use `MinTextSize` below **9** |
| `UIScale` | Multiplies the whole subtree, including UIStroke and UICorner | Great for hover tweens and one global "UI scale" setting |
| `UIPadding` | Inner padding | `UIListLayout.Padding` is space *between* items only |
| `AutomaticSize` (property) | Grows the object to fit its children or text | `Size` becomes the **minimum**; for ScrollingFrame use `AutomaticCanvasSize` |

> [!warning] Who wins
> When an object is controlled by a layout **and** has a `UISizeConstraint` or `UIAspectRatioConstraint`, **the constraint wins** and controls the size. That is by design (documented), and it is the cause of most "my list items ignore the layout" bugs.

---

## 3. UIListLayout and flex

`UIListLayout` positions its **sibling** GuiObjects in a row or column and overrides or influences their Position, Size and Rotation.

| Property | What it controls |
|---|---|
| `FillDirection` | Horizontal or Vertical |
| `SortOrder` | `LayoutOrder` (numeric) or `Name` |
| `HorizontalAlignment` / `VerticalAlignment` | Alignment of items **and** of the whole list inside the container |
| `Padding` | UDim space between items (scale or offset) |
| `Wraps` | Wrap to a new line when items don't fit |
| `HorizontalFlex` / `VerticalFlex` | How extra space is distributed along the fill direction |
| `ItemLineAlignment` | Cross-axis alignment within a line (`Start`, `Center`, `End`, `Stretch`, `Automatic`) |

**Reverse order:** negate `LayoutOrder` (0, −1, −2…). There is no "reverse" toggle.

### Per-item flex with UIFlexItem
Insert `UIFlexItem` under one list item and set `FlexMode`:
- `Fill`: take the remaining space (a slider bar between two labels).
- `Grow` / `Shrink`: grow or shrink relative to siblings, with `GrowRatio` / `ShrinkRatio` in `Custom` mode.
- `ItemLineAlignment` on the item overrides the list's cross-axis alignment.

**Cost:** the docs warn that flex adds "a slight performance cost above non-flex", especially when resizing or adding and removing flex items often. Use it where it removes work (tab bars, toolbars), not on every list.

### Pattern: equal-width tab bar that adapts to tab count

```lua
-- LocalScript: build a tab bar where tabs always share the width equally
local tabBar = script.Parent -- a Frame sized e.g. {1,0},{0,48}
local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = tabBar

for i, name in { "Shop", "Pets", "Quests", "Settings" } do
	local tab = Instance.new("TextButton")
	tab.Name = name
	tab.Text = name
	tab.LayoutOrder = i
	tab.Size = UDim2.new(0, 0, 1, 0) -- width comes from flex
	tab.Parent = tabBar
end
```

---

## 4. UIGridLayout, UITableLayout, UIPageLayout

| Layout | Best for | Key properties |
|---|---|---|
| `UIGridLayout` | Inventories and shop tiles of equal size | `CellSize` (UDim2), `CellPadding`, `FillDirectionMaxCells`, `StartCorner`, `SortOrder` |
| `UITableLayout` | Leaderboards and stat tables | Rows = siblings, columns = their children; `FillEmptySpaceColumns/Rows` |
| `UIPageLayout` | Swipeable pages, tutorials, carousels | `Circular`, `TweenTime`, `GamepadInputEnabled`, `TouchInputEnabled`, `ScrollWheelInputEnabled`, `:Next()`, `:JumpTo()` |

Grid layouts **respect constraints**: an item with a `UISizeConstraint.MinSize` larger than `CellSize` spans multiple cells.

### Pattern: a grid that keeps N columns of square cells at any width

`CellSize` in Scale is relative to the parent, so square cells need a computed height. Recompute when the container resizes:

```lua
-- LocalScript under the ScrollingFrame that holds inventory tiles
local frame = script.Parent :: ScrollingFrame
local grid = frame:WaitForChild("UIGridLayout") :: UIGridLayout

local COLUMNS_PHONE, COLUMNS_WIDE = 4, 6
local PAD = 8

local function relayout()
	local width = frame.AbsoluteWindowSize.X -- excludes the scrollbar
	local cols = if width < 600 then COLUMNS_PHONE else COLUMNS_WIDE
	local cell = math.floor((width - PAD * (cols + 1)) / cols)
	grid.CellPadding = UDim2.fromOffset(PAD, PAD)
	grid.CellSize = UDim2.fromOffset(cell, cell)
	grid.FillDirectionMaxCells = cols
end

frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
frame.CanvasSize = UDim2.new(0, 0, 0, 0)
frame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(relayout)
relayout()
```

Using Offset for the computed cell size is fine here because it is **derived from** the live container size, not hard-coded.

---

## 5. One global UI scale for 10-foot and accessibility

Roblox's console guidance: build with relative sizes and `UISizeConstraint`, design for lower resolutions first, and consider `GuiService.ViewportDisplaySize` (where `Large` represents most TVs). A simple, robust approach is a `UIScale` at the root of each ScreenGui:

```lua
-- LocalScript: scale UI for TV-sized displays and honour a player setting
local GuiService = game:GetService("GuiService")
local root = script.Parent:WaitForChild("Root") -- full-screen Frame
local uiScale = root:FindFirstChildOfClass("UIScale") or Instance.new("UIScale", root)

local playerScale = 1 -- read from your settings module (0.8–1.3)

local function update()
	local tv = GuiService.ViewportDisplaySize == Enum.DisplaySize.Large
	uiScale.Scale = (if tv then 1.25 else 1) * playerScale
end

GuiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(update)
update()
```

`GuiService.PreferredTextSize` and `GuiService.PreferredTransparency` expose player accessibility preferences. Read them in your settings module (see [[Safe Areas, Thumb Zones and Console UI Navigation]]).

---

## 6. Text that survives localization

- Use `AutomaticSize = Y` with `TextWrapped = true` for paragraphs. The label grows instead of clipping.
- Use `TextScaled` **with** a `UITextSizeConstraint` (Min ≥ 9) for buttons, or a fixed `TextSize` per breakpoint. `TextScaled` alone creates tiny text on phones.
- Test with Studio's **Player Emulator › Elongate**. The docs note Spanish averages about 30% longer than English and German is longer still. Pseudolocalize catches strings that bypass translation.

---

## 7. Debugging layouts quickly

| Symptom | Cause |
|---|---|
| Item ignores layout size | It has a `UISizeConstraint`/`UIAspectRatioConstraint` (they win) |
| Can't move an item in Properties | It is controlled by a sibling layout |
| List spills outside its frame | `Wraps` off, or no `ClipsDescendants`, or `AutomaticSize` on the parent |
| ScrollingFrame won't scroll | `CanvasSize` 0 and `AutomaticCanvasSize` not set |
| Items in the wrong order | `SortOrder = Name`, or duplicate `LayoutOrder` values |
| Tiny text on mobile | `TextScaled` with no minimum constraint |
| UI under the notch or top bar | `ScreenInsets` wrong (see the safe areas note) |

Use Device Simulator presets (phone, tablet, console) and **Display scaling › Physical size** to see real-world sizes (see [[Device, Network and Controller Simulation Test Pass]]).

---

## Common mistakes
- Positioning every element with Offset copied from one monitor.
- Using Scale for icons without an aspect constraint, so they stretch into ovals.
- Forgetting that constraints override layouts, then fighting the layout.
- Putting padding in `UIListLayout.Padding` and expecting it around the edges (use `UIPadding`).
- Flex on every list, including ones that update every frame.
- Hard-coded `CanvasSize` on ScrollingFrames that hold dynamic content.
- `TextScaled` without `UITextSizeConstraint`.
- Building only on desktop and "fixing mobile later".

## Checklist
- [ ] Containers use Scale; content uses layouts + constraints
- [ ] Touch targets have a pixel `MinSize` (44 px or more is a common guideline)
- [ ] Square icons have `UIAspectRatioConstraint`
- [ ] Text has min/max size constraints (min ≥ 9)
- [ ] Lists use `LayoutOrder`; reversed lists use negative orders
- [ ] Flex used only where it simplifies (tab bars, toolbars, sliders)
- [ ] Grids recompute cell size from `AbsoluteWindowSize`
- [ ] ScrollingFrames use `AutomaticCanvasSize`
- [ ] Root `UIScale` for TV and player preference
- [ ] Tested in Device Simulator on phone, tablet, desktop and console, plus Elongate

---

**Sources checked (2026-10-25):** Creator Docs: UI › Position and size; UI › List and flex layouts; UI › Grid and table layouts; UI › Size modifiers and constraints; Publishing › Console development guidelines; Studio › Testing modes (Player Emulator); Engine API: UIListLayout, UIFlexItem, UIGridLayout, UIPageLayout, ScrollingFrame, GuiService.

**Related:** [[UI UX - Hub]] · [[UI Design System]] · [[Cross-Platform UI System]] · [[UI breaks on phone - gamepad]] · [[UI Design System and Tokens]] · [[Localization Production Workflow]]
