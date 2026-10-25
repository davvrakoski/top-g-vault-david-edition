---
area: "12 UI Audio and Camera"
cluster: "Accessibility Localization"
tags: [deep-dive, roblox, ui, mobile, console, safe-area, gamepad, accessibility]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Safe Areas, Thumb Zones and Console UI Navigation

## Why this matters
A button hidden under a camera notch, a shop you can't reach with a thumb, or a menu a gamepad can't navigate is a broken game for that device, and each device class is a large share of Roblox players.
Roblox provides the hooks you need (ScreenInsets, the jump button position, gamepad selection, input-type detection, device-appropriate glyphs and accessibility preferences). This note turns them into one cross-device pattern.

---

## 1. Safe areas: ScreenGui settings that decide what is visible

`ScreenGui.ScreenInsets` (Enum `ScreenInsets`) controls the safe-area inset of everything in that ScreenGui:

| Value | Keeps UI clear of | Use for |
|---|---|---|
| `CoreUISafeInsets` (default) | Device cutouts **and** Roblox's top-bar buttons | Any ScreenGui with interactive UI |
| `DeviceSafeInsets` | Device cutouts (notch) only, not the top bar | Full-width banners where you handle the top bar yourself |
| `TopbarSafeInsets` | Holds content between the top-bar controls and the right edge of the device safe area; flexes horizontally with top-bar content | A custom top-bar strip (currency, timer) |
| `None` | Nothing | **Only** non-interactive backgrounds (vignette, full-screen art) |

Related properties:
- `IgnoreGuiInset`: legacy switch. Setting it to `true` while ScreenInsets is `CoreUISafeInsets` changes it to `DeviceSafeInsets`. Prefer setting `ScreenInsets` directly.
- `ClipToDeviceSafeArea` (default `true`): clips descendants to the safe area. That suits slide-in menus parked off-screen; set it to `false` only for decorative overflow.
- `SafeAreaCompatibility` (default `FullscreenExtension`): automatically extends "fullscreen" frames authored for old devices. Leave it on unless you control full-bleed art yourself.
- `GuiService.TopbarInset` (a Rect) gives the area the top bar occupies, which helps align a custom bar next to Roblox's buttons.

**Pattern:** use two ScreenGuis per screen. `HUD_Background` uses `None` (art only) and `HUD_Interactive` uses `CoreUISafeInsets` (buttons, text).

---

## 2. Mobile: reserved zones and thumb zones

From Creator Docs › Position and size (cross-platform factors):
- Default touch controls occupy the **bottom-left** (thumbstick) and **bottom-right** (jump) corners. Don't put information or custom buttons there.
- Comfortable reach depends on device size. The docs' example: a button **40% below the top edge** is reachable on a phone but almost unreachable on a tablet.
- The reliable approach is to place custom action buttons **relative to the default jump button**.

```lua
-- StarterPlayerScripts: place an action button just left of the jump button (touch devices)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

if UserInputService.TouchEnabled then
	local jump
	repeat
		jump = playerGui:FindFirstChild("JumpButton", true)
		task.wait()
	until jump and jump.IsLoaded

	local action = Instance.new("ImageButton")
	action.Name = "SprintButton"
	action.AnchorPoint = Vector2.new(1, 1)
	action.Size = UDim2.fromOffset(jump.Size.X.Offset * 0.8, jump.Size.Y.Offset * 0.8)
	action.Position = jump.Position + UDim2.fromOffset(-20, jump.Size.Y.Offset)
	action.Parent = jump.Parent
end
```

(Adapted from the official example; `JumpButton` is a core touch-control object, so treat its name and structure as something to re-test after Roblox app updates.)

### Context-based UI
Screen space is scarce on phones, so show actions **only when relevant**. Use `ProximityPrompt` for doors, chests and NPCs instead of permanent buttons. It also handles keyboard (`KeyboardKeyCode`), gamepad (`GamepadKeyCode`) and touch (`ClickablePrompt`) automatically.

### Touch target sizing
Roblox doesn't publish a minimum touch-target size. Common platform guidance is around 44–48 device-independent points. Enforce a pixel minimum with `UISizeConstraint.MinSize` and verify it with Device Simulator **Display scaling › Physical size** after calibrating your monitor.

---

## 3. Console and gamepad: the 10-foot UI

From Creator Docs › Console development guidelines:
- Players sit **8–10 feet** from the screen. Use relative sizes, design for lower resolution first, and scale up using `GuiService.ViewportDisplaySize` (`Large` ≈ most TVs).
- Keep important UI inside **TV-safe areas**; some TVs crop the edges.
- Every interactive element must be reachable with **four directions + select + back**.
- Key actions should take **only a few button presses**; add shortcuts for essential actions.
- **Disable the chat window** for console games.
- Show **matching button glyphs** per device.
- Use **haptics** (`HapticEffect`) sparingly; constant vibration annoys players.
- Use **progressive disclosure**: go in and out of screens rather than packing one screen.
- Console games must provide **content maturity information**.

### Gamepad selection in practice

| API | Purpose |
|---|---|
| `GuiObject.Selectable` | Whether gamepad selection can land on it |
| `GuiService.SelectedObject` | The currently selected object; set it when a menu opens |
| `GuiObject.NextSelectionUp/Down/Left/Right` | Explicit neighbours when automatic navigation guesses wrong |
| `GuiBase2d.SelectionGroup` + `SelectionBehavior*` | Keep selection trapped inside a panel (modal) or let it escape |
| `GuiObject.SelectionOrder` | Tie-breaking order for automatic navigation |
| `GuiService.GuiNavigationEnabled` / `AutoSelectGuiEnabled` | Global navigation behaviour |

```lua
-- LocalScript: open a menu and give gamepad users a starting selection
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

local menu = script.Parent :: Frame -- the panel
local firstButton = menu:WaitForChild("PlayButton") :: GuiButton

menu.SelectionGroup = true -- selection stays inside this panel while it is open

local function openMenu()
	menu.Visible = true
	if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then
		GuiService.SelectedObject = firstButton
	end
end

local function closeMenu()
	menu.Visible = false
	if GuiService.SelectedObject and GuiService.SelectedObject:IsDescendantOf(menu) then
		GuiService.SelectedObject = nil
	end
end

return { open = openMenu, close = closeMenu }
```

Always clear `SelectedObject` when hiding a menu. A selection stuck on an invisible button is a classic "controller stopped working" bug.

---

## 4. One input-aware UI: PreferredInput and glyphs

`UserInputService.PreferredInput` (`KeyboardAndMouse`, `Gamepad`, `Touch`, `MicroGamepad`) tells you which input scheme to show. React to changes so a player who picks up a controller mid-session sees controller prompts:

```lua
local UserInputService = game:GetService("UserInputService")

local function applyInputScheme()
	local mode = UserInputService.PreferredInput
	-- your HUD module: show/hide touch buttons, swap glyphs, resize hit areas
	HUD.setMode(mode)
end

UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(applyInputScheme)
applyInputScheme()
```

Glyphs:
- With the **Input Action System** (`InputContext`, `InputAction`, `InputBinding`), use `InputActionLabel`; it keeps button icons in sync per device with no code.
- Otherwise use `UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)` for Roblox's default Xbox/PlayStation icons, or `GetStringForKeyCode` for your own art.

---

## 5. Accessibility preferences you should honour

`GuiService` exposes player preferences:
- `PreferredTextSize`: scale text up for players who request larger text.
- `PreferredTransparency`: players who want more opaque backgrounds for readability.
- `ReducedMotionEnabled`: disable camera shake, screen flashes and large UI motion.

Read them at startup and on change (`GetPropertyChangedSignal`), and store your own overrides in player settings (see [[Player Settings, Persistence and Device Profiles]]).

---

## 6. Test matrix for this note

| Device profile (Device Simulator) | Check |
|---|---|
| Phone with notch, landscape | Nothing interactive under the notch or top bar; thumbs reach actions |
| Tablet | Buttons not stranded mid-screen; text not oversized |
| Entry-level phone | Readable at low pixel density |
| Console (with Controller Emulator) | Every screen reachable with D-pad + A/B; chat window hidden; glyphs correct |
| Android TV remote | Navigation works with directional pad, centre and back |
| Desktop 4K and 1366×768 | Constraints keep sizes sane |

See [[Device, Network and Controller Simulation Test Pass]] for running these quickly.

---

## Common mistakes
- Setting `ScreenInsets = None` on a ScreenGui that contains buttons.
- Toggling `IgnoreGuiInset` and then being surprised that ScreenInsets changed.
- Placing custom buttons in the default thumbstick or jump zones.
- Hard-coded "40% from top" positions that work on phones and fail on tablets.
- Menus with no starting `SelectedObject` for gamepad users, or selection left on hidden UI.
- Showing keyboard glyphs ("Press E") to controller and touch players.
- Leaving the chat window visible on console builds.
- Ignoring `ReducedMotionEnabled` and shaking the camera anyway.

## Checklist
- [ ] Interactive ScreenGuis use `CoreUISafeInsets`; only art uses `None`
- [ ] Custom mobile buttons positioned relative to the jump button and outside reserved zones
- [ ] Context actions use ProximityPrompt instead of permanent buttons
- [ ] Every menu sets and clears `GuiService.SelectedObject`; modals use `SelectionGroup`
- [ ] `PreferredInput` drives HUD mode and glyphs
- [ ] UI scales up for `ViewportDisplaySize = Large`; TV-safe margins respected
- [ ] Chat window disabled for console
- [ ] PreferredTextSize, PreferredTransparency and ReducedMotionEnabled honoured
- [ ] Device matrix above passed

---

**Sources checked (2026-10-25):** Creator Docs: UI › On-screen containers (Screen insets); UI › Position and size (Cross-platform factors); Publishing › Console development guidelines; Engine API: ScreenGui (ScreenInsets, IgnoreGuiInset, ClipToDeviceSafeArea, SafeAreaCompatibility), GuiService, GuiBase2d, GuiObject, UserInputService.PreferredInput, InputActionLabel, HapticEffect, ProximityPrompt.

**Related:** [[Accessibility Localization - Hub]] · [[Gamepad and Console Design]] · [[Cross-Platform UI Lab]] · [[UI breaks on phone - gamepad]] · [[Settings and Accessibility Blueprint]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]]
