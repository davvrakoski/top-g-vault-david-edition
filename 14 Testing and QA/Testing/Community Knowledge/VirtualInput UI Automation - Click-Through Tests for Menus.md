---
area: "14 Testing and QA"
cluster: "Testing"
title: "VirtualInput UI Automation - Click-Through Tests for Menus"
tags: [roblox, community-knowledge, testing, ui, automation, virtualinput]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VirtualInput
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/reference/engine/classes/StudioTestService
---
# VirtualInput UI Automation - Click-Through Tests for Menus

UI breaks quietly: a button gets covered by a new frame, a menu stops closing, a text box rejects input after a refactor. Clicking through every menu by hand before each release is slow and gets skipped. `VirtualInput` lets a test script send real mouse, keyboard and text events that the engine processes like hardware input, so you can automate "open shop, buy, close" and assert on the result.

## Getting a VirtualInput
`UserInputService:CreateVirtualInput()` returns a `VirtualInput` for testing and automation, or `nil` if the feature is not available, so always check:

```lua
local UIS = game:GetService("UserInputService")
local vi = UIS:CreateVirtualInput()
if not vi then
	warn("[UITest] VirtualInput unavailable here; skipping")
	return
end
```
It works on the experience's own UI only. Every method **throws** if the input would touch Roblox's built-in UI (CoreGui: top bar, chat, escape menu), which keeps tests from opening system menus by accident.

## Methods
| Method | Use |
|---|---|
| `SendMousePosition(pos)` | Move cursor to absolute screen pixels (hover states) |
| `SendMouseButton(pos, Enum.UserInputType.MouseButton1, isDown, repeatCount?)` | Press / release; errors if the button is already in that state |
| `SendMouseDelta(delta)` | Relative motion, only while the cursor is locked (first person) |
| `SendKey(isPressed, keyCode, isRepeatedKey?)` | Key down / up; `isRepeatedKey` only for text-editing keys' auto-repeat |
| `SendTextInput(text)` | Types a string into the focused TextBox |
| `SendPointerAction(pos, {Wheel = n, Pan = v2, Pinch = n})` | Scroll, trackpad pan, pinch |

## Clicking a GuiButton by reference
Click at the centre of the element. Account for the top-bar inset if your ScreenGui does not ignore it:
```lua
local GuiService = game:GetService("GuiService")

local function centerOf(gui: GuiObject): Vector2
	local p, s = gui.AbsolutePosition, gui.AbsoluteSize
	local inset = GuiService:GetGuiInset() -- verify against your ScreenGui's ScreenInsets setting
	return p + s / 2 + inset
end

local function click(gui: GuiObject)
	local pos = centerOf(gui)
	vi:SendMousePosition(pos)
	vi:SendMouseButton(pos, Enum.UserInputType.MouseButton1, true)
	task.wait()
	vi:SendMouseButton(pos, Enum.UserInputType.MouseButton1, false)
end
```
Check the inset maths once by clicking a known button and logging `Activated`; screen-space offsets are the most common cause of "the click missed".

## A click-through test
```lua
local gui = player.PlayerGui:WaitForChild("Main")
click(gui.HUD.ShopButton)
assert(waitFor(function() return gui.Shop.Visible end, 3), "shop did not open")

click(gui.Shop.Items.Sword.Buy)
assert(waitFor(function() return gui.Shop.Items.Sword.Owned.Visible end, 5), "buy did not complete")

click(gui.Shop.Close)
assert(waitFor(function() return not gui.Shop.Visible end, 3), "shop did not close")
print("[UITest] shop flow PASS")
```
(`waitFor` is a bounded poll; see [[Flaky Tests in Roblox Suites - Causes and Fixes]].)

Text fields:
```lua
click(gui.Settings.NameBox)
vi:SendTextInput("Tester 01")
vi:SendKey(true, Enum.KeyCode.Return); vi:SendKey(false, Enum.KeyCode.Return)
```

## Running it across devices and players
- Combine with `StudioDeviceSimulatorService` to repeat the same flow on several device profiles (the testing-modes docs list this as a scripted-testing use case: orientation and cross-device regression).
- Combine with `StudioTestService:ExecuteMultiplayerTestAsync` from a plugin to run UI flows on several clients at once (trading, party invites).
- Keep tests in a folder that only runs when a test flag is set; never ship them active.

## What to automate first
1. Onboarding / first-time flow (highest player impact).
2. Shop open, buy, close.
3. Settings toggles persist after reopening.
4. Every menu can be closed (no dead ends).

## Related
[[Testing - Hub]] · [[Multi-Client Integration Recipes with StudioTestService]] · [[Device, Network and Controller Simulation Test Pass]] · [[UI Scripting Gotchas - ResetOnSpawn and PlayerGui]]
