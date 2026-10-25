---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - On-Screen Keyboards and Text Input on Phones, Consoles and VR"
tags: [roblox, community-knowledge, ui, platform, textbox, mobile, console, keyboard]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TextBox
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/ui/text-input
  - https://create.roblox.com/docs/chat/quick-words
  - https://create.roblox.com/docs/production/publishing/console-guidelines
---
# Platform - On-Screen Keyboards and Text Input on Phones, Consoles and VR

Typing is easy on a PC and painful everywhere else. On a phone the on-screen keyboard covers half the screen, often right over your text box. On a console or VR headset, typing means a slow virtual keyboard driven by a stick or laser. Any flow that **requires** typing (naming a pet, searching a catalog, entering a code) is a drop-off point on most devices. This note covers the APIs that help and the design rules that avoid the problem.

## APIs for on-screen keyboards

| API | Use |
|---|---|
| `UserInputService.OnScreenKeyboardVisible` | true while a soft keyboard is up |
| `UserInputService.OnScreenKeyboardSize` / `OnScreenKeyboardPosition` | keyboard rect in pixels (`Vector2.new(0, 0)` when hidden) |
| `TextBox.ReturnPressedFromOnScreenKeyboard` | fires on mobile and console when the soft keyboard's return/enter is pressed |
| `TextBox.FocusLost(enterPressed, input)` | commit or cancel when focus leaves |
| `TextBox:CaptureFocus()` / `ReleaseFocus()` / `IsFocused()` | open/close the keyboard from code |
| `TextBox.ShowNativeInput` | use the platform's native input instead of Roblox's built-in keyboard |
| `TextBox.ClearTextOnFocus` | set false for edit fields so the old text stays |
| `UserInputService.TextBoxFocused` / `TextBoxFocusReleased`, `GetFocusedTextBox()` | global hooks, for example to pause gameplay input |

## Recipe: keep the text box above the keyboard

```lua
-- LocalScript: lift a dialog when the soft keyboard would cover it
local UserInputService = game:GetService("UserInputService")
local dialog: Frame = script.Parent.NameDialog
local restPosition = dialog.Position

local function adjust()
	if not UserInputService.OnScreenKeyboardVisible then
		dialog.Position = restPosition
		return
	end
	local kbTop = UserInputService.OnScreenKeyboardPosition.Y
	local bottom = dialog.AbsolutePosition.Y + dialog.AbsoluteSize.Y
	local overlap = bottom - kbTop + 12 -- 12 px breathing room
	if overlap > 0 then
		dialog.Position = restPosition - UDim2.fromOffset(0, overlap)
	end
end

UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(adjust)
UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(adjust)
```
Check in a device test whether the reported keyboard position and your GUI positions use the same inset origin on your target phones; adjust the offset if the lift is off by the top-bar height.

## Recipe: submit on mobile and console

```lua
local box: TextBox = script.Parent.NameBox
local function submit()
	local text = box.Text
	if #text > 0 then
		requestName(text) -- your RemoteFunction; the server must filter it
	end
end
box.ReturnPressedFromOnScreenKeyboard:Connect(submit)
box.FocusLost:Connect(function(enterPressed)
	if enterPressed then submit() end
end)
```
Both are hooked because desktop Enter arrives through `FocusLost(true)`, while soft keyboards also fire the dedicated event. Guard against double submits (a simple `busy` flag) if both fire on some devices. Any text other players can see must go through Roblox text filtering on the server.

## Gameplay input while typing
While a TextBox is focused, keys like WASD must not move the character or fire abilities. Core chat handles its own box; for yours, enable a high-priority sinking input context or disable gameplay contexts on `TextBoxFocused` and restore on `TextBoxFocusReleased` (see [[Platform - Input Action System Contexts - Priority, Sink and Mode Switching]]).

## Design rules: type less
1. **Defaults first:** pre-fill names ("Pet #1"), let players accept with one button.
2. **Random/name picker:** a "shuffle" button with safe pre-made names is faster than any keyboard.
3. **Search with filters:** category chips and sort buttons before free-text search.
4. **Codes:** keep them short, case-insensitive, no ambiguous characters (0/O, 1/l).
5. **Chat on console:** the console guidelines say to disable the chat window. For coordination, Roblox's **Quick Words** preset system lets you add up to three categories of three to ten short phrases (under 25 characters, English, auto-translated) through Creator Hub > Configure > Chat > Quick Words; phrases are policy-reviewed before going live.
6. **VR:** same as console; text entry via laser pointer is slow, so keep it optional.

## Checklist
- [ ] No required text entry in the core loop.
- [ ] Text boxes stay visible above the soft keyboard on a small phone.
- [ ] Submit works via soft-keyboard return, desktop Enter and a visible button.
- [ ] Gameplay input is blocked while typing.
- [ ] Server-side filtering for any shown text.

## Related
[[UI UX - Hub]] · [[Platform - Console Release Checklist - Xbox and PlayStation]] · [[Text Chat, Moderation and Player Safety]] · [[Platform - Touch Target Sizes and Mobile-First HUD Layout]]
