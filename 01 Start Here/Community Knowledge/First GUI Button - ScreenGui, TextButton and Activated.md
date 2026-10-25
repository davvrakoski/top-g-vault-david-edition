---
area: "01 Start Here"
cluster: "Start Here"
title: "First GUI Button - ScreenGui, TextButton and Activated"
tags: [roblox, community-knowledge, start-here, ui, gui, button]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/interactive-ui
  - https://create.roblox.com/docs/reference/engine/classes/GuiButton
  - https://create.roblox.com/docs/reference/engine/classes/LayerCollector
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
---
# First GUI Button - ScreenGui, TextButton and Activated

Almost every game needs on-screen buttons: Shop, Settings, Play, Sprint. A first button teaches the whole UI pipeline: where UI lives (StarterGui copies into each player's PlayerGui), why UI code is a LocalScript, how to size things so they work on phones, and how a button asks the server to do something. This note builds a toggle menu with an Open button that works on PC, phone and console.

## 1. The objects

In Explorer:

```
StarterGui
└─ MainGui          (ScreenGui)
   ├─ OpenButton    (TextButton)
   │  └─ LocalScript
   └─ Menu          (Frame, Visible = false)
      └─ CloseButton (TextButton)
```

- **ScreenGui** = a layer drawn on the player's screen. Everything 2D goes inside one.
- **StarterGui** is a template: on spawn, Roblox copies it into `Player.PlayerGui`. Your LocalScript runs from that copy.
- Set `MainGui.ResetOnSpawn = false` if the menu should not reset (and close) every time the character dies.

## 2. Size it for every screen

UI sizes use **UDim2** with Scale (fraction of the screen) and Offset (pixels): `{ScaleX, OffsetX}, {ScaleY, OffsetY}`.

| Setting | Value | Why |
| --- | --- | --- |
| OpenButton `Size` | `{0.15, 0}, {0.08, 0}` | Scales with the screen |
| OpenButton `Position` | `{0.02, 0}, {0.45, 0}` | Left edge, middle height |
| Add `UIAspectRatioConstraint` | e.g. AspectRatio 2.5 | Keeps the shape on tall phones |
| `TextScaled` | true | Text fits the button |
| Add `UICorner` | CornerRadius `{0.2, 0}` | Rounded look |

Pure Offset sizes look fine on your monitor and tiny or giant on a phone. Use Scale, then constrain. More: [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]].

## 3. The script (LocalScript in OpenButton)

```lua
local button = script.Parent
local gui = button.Parent
local menu = gui:WaitForChild("Menu")
local closeButton = menu:WaitForChild("CloseButton")

button.Activated:Connect(function()
	menu.Visible = not menu.Visible
end)

closeButton.Activated:Connect(function()
	menu.Visible = false
end)
```

Use **`Activated`**, not `MouseButton1Click`: `Activated` fires for mouse clicks, touch taps and gamepad presses, so one line covers every device.

## 4. Make it ask the server for something

UI runs on the client, so a button **cannot** give coins by itself. It asks the server through a RemoteEvent, and the server decides. See [[First RemoteEvent - Button on the Client, Reward on the Server]].

```lua
local remote = game:GetService("ReplicatedStorage"):WaitForChild("RequestHeal")
healButton.Activated:Connect(function()
	remote:FireServer()
end)
```

## 5. Feel and polish (5 minutes)

- Hover/press feedback: `AutoButtonColor = true` (default) darkens on press.
- A click sound: `SoundService:PlayLocalSound(clickSound)` (see [[First Sound - Background Music and a Click Sound]]).
- A small pop with `TweenService` on `Size` when the menu opens.
- Keep important buttons out of the top corners on phones (Roblox menu and notches); `ScreenGui.ScreenInsets` defaults keep you inside the safe area.

## 6. Test on devices

Use **Device Simulator** (phone and tablet) and the **Controller Emulator**. On gamepad, make sure the button can be selected (`Selectable = true`, the default for buttons).

## Pitfalls

- Editing `StarterGui` from a script at runtime: players already spawned do not see it. Change `player.PlayerGui` instead.
- `ResetOnSpawn = true` (default) recreates the GUI on respawn, which resets your script's state. See [[UI Scripting Gotchas - ResetOnSpawn and PlayerGui]].
- A Server Script inside a ScreenGui: it does not handle input. UI scripts are LocalScripts.
- Invisible frames still blocking clicks: set `Visible = false`, not just `BackgroundTransparency = 1`.

## Related
[[00 START HERE - Top G Vault]] · [[UI Scripting Gotchas - ResetOnSpawn and PlayerGui]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/UI/Create interactive UI|Create interactive UI (official)]]
