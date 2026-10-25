---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "UIDragDetector Sliders and Drag-and-Drop Inventory"
tags: [roblox, community-knowledge, ui, uidragdetector, inventory, sliders]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/ui-drag-detectors
  - https://create.roblox.com/docs/reference/engine/classes/UIDragDetector
  - https://create.roblox.com/docs/reference/engine/classes/BasePlayerGui
---
# UIDragDetector Sliders and Drag-and-Drop Inventory

Volume sliders, sensitivity bars, colour pickers and drag-to-equip inventories used to need hand-written mouse and touch code (InputBegan, InputChanged, touch IDs, screen inset maths). A `UIDragDetector` placed under any `GuiObject` makes it draggable with mouse, touch and gamepad selection, and fires events your scripts can use. This note covers the two jobs people build most: a settings slider and an inventory drag that drops onto a slot.

## Key properties

| Property | What it controls |
|---|---|
| `DragStyle` | `TranslatePlane` (free 2D), `TranslateLine` (along `DragAxis`), `Rotate`, `Scriptable` |
| `DragAxis` | Direction for `TranslateLine`, e.g. `Vector2.new(1, 0)` for horizontal |
| `ResponseStyle` | `Offset` (default) or `Scale` move the parent's `Position`; `CustomOffset`/`CustomScale` move nothing but still update `DragUDim2` and fire events |
| `BoundingUI` + `BoundingBehavior` | Keep the drag inside a container; `EntireObject` keeps the whole element inside, `HitPoint` only the grab point |
| `DragRelativity` | Relative or absolute drag deltas |
| `ReferenceUIInstance` | Optional reference space and origin for `DragUDim2`/`DragRotation` |
| `MinDragTranslation` / `MaxDragTranslation` | Hard limits |
| `SelectionModeDragSpeed` | How fast gamepad selection moves the handle |

Events: `DragStart(inputPosition)`, `DragContinue(inputPosition)`, `DragEnd(inputPosition)`. Method `AddConstraintFunction(priority, fn)` lets you snap or clamp the proposed motion (the docs use it for a grid snap); several functions run from lowest to highest priority.

The docs note detectors don't respond in Studio while the Select/Move/Scale/Rotate tools or the UI editor are active. Test in Play mode.

## Recipe 1: settings slider (0 to 1)

Hierarchy: `Track (Frame)` > `Handle (Frame)` > `UIDragDetector`.

```lua
local detector = handle.UIDragDetector
detector.DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine
detector.DragAxis = Vector2.new(1, 0)
detector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
detector.BoundingUI = track

local function valueFromHandle(): number
	-- Handle uses AnchorPoint (0.5, 0.5); Position.X.Scale runs 0..1 along the track
	return math.clamp(handle.Position.X.Scale, 0, 1)
end

detector.DragContinue:Connect(function()
	setVolume(valueFromHandle()) -- update preview live
end)
detector.DragEnd:Connect(function()
	saveSetting("MusicVolume", valueFromHandle()) -- persist only on release
end)
```

Add a click-to-jump on the track (`track.InputBegan`) and keyboard/gamepad left-right steps of 0.05 for accessibility. Save on `DragEnd`, not every frame.

## Recipe 2: inventory drag-and-drop

The trick is to **not** drag the slot itself (it is controlled by a `UIGridLayout`). Use `CustomOffset` so nothing moves, and drive a floating "ghost" icon yourself.

```lua
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer.PlayerGui

detector.ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset

detector.DragStart:Connect(function(pos: Vector2)
	ghost.Image = slot.Icon.Image
	ghost.Position = UDim2.fromOffset(pos.X, pos.Y)
	ghost.Visible = true
end)

detector.DragContinue:Connect(function(pos: Vector2)
	ghost.Position = UDim2.fromOffset(pos.X, pos.Y)
end)

detector.DragEnd:Connect(function(pos: Vector2)
	ghost.Visible = false
	for _, obj in playerGui:GetGuiObjectsAtPosition(pos.X, pos.Y) do
		local targetIndex = obj:GetAttribute("SlotIndex")
		if targetIndex and obj ~= slot then
			requestMove:FireServer(slot:GetAttribute("SlotIndex"), targetIndex)
			break
		end
	end
end)
```

Notes:

- The ghost lives in a top-level `ScreenGui` with a high `DisplayOrder` and `Active = false` so it never blocks hit-testing.
- `GetGuiObjectsAtPosition` expects coordinates **after** the GUI inset. If your ScreenGui uses `IgnoreGuiInset = true`, subtract `GuiService:GetGuiInset()` before calling it, or the drop lands one top-bar height off (check this in your own setup).
- The server must validate the move (does the player own both slots, is the item tradeable). The UI only sends a request.

## Gamepad and mobile

- Touch works without extra code. Make handles at least 44 px so thumbs can grab them.
- On gamepad, a selectable element with a detector can be dragged in selection mode; tune `SelectionModeDragSpeed`. For inventories, a "press A to pick up, move selection, press A to drop" flow is often easier than analog dragging; offer both.

## Pitfalls

- Using `Offset` response on an element inside a layout: the layout snaps it back next frame.
- Firing a RemoteEvent on every `DragContinue`. Send once on `DragEnd`.
- Forgetting `BoundingUI`, so a slider handle can be pulled off the track on fast flicks.

## Related
[[UI UX - Hub]] · [[Custom Inventory and Hotbar - Community Approaches]] · [[Player Settings, Persistence and Device Profiles]] · [[Safe Areas, Thumb Zones and Console UI Navigation]]
