---
area: "01 Start Here"
cluster: "Start Here"
title: "First SurfaceGui Sign - Text on Parts and Clickable Screens"
tags: [roblox, community-knowledge, start-here, ui, surfacegui, signs]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceGui
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceGuiBase
  - https://create.roblox.com/docs/reference/engine/enums/SurfaceGuiSizingMode
---
# First SurfaceGui Sign - Text on Parts and Clickable Screens

A **SurfaceGui** puts normal 2D UI (text, images, buttons) onto the face of a part. It is how you make shop signs, a "Stage 12" marker, a round timer on a wall, a top-players board in the lobby, or a computer screen players can click. It uses the same TextLabels and Frames you already know from [[First GUI Button - ScreenGui, TextButton and Activated]], so the only new things are **which face**, **how sharp**, **how bright**, and the one rule for **clickable** screens.

## Step by step: a lobby sign

1. Insert a Part, size it like a board (for example 12 x 6 x 0.5), anchored. Name it `Sign`.
2. Insert a **SurfaceGui** into the part.
3. Set **Face** to the side players look at. If the text does not show, you picked the wrong face; try `Front`, then `Back`.
4. Insert a **TextLabel** into the SurfaceGui. Set:
   - `Size` = `{1, 0},{1, 0}` (fill the whole face)
   - `BackgroundTransparency` = 1
   - `TextScaled` = true (text grows to fit)
   - `Text` = "Welcome to the Obby!"
5. For a glowing screen look, set the SurfaceGui's **LightInfluence** to 0 so world lighting does not darken it, and raise **Brightness** above 1 if it sits in a dark room.

## Sharpness: SizingMode and PixelsPerStud

- **SizingMode = PixelsPerStud** (the default): the canvas size comes from the part's size times `PixelsPerStud`. Bigger number = more pixels = sharper text but more memory. Choose it by how close players stand.
- **SizingMode = FixedSize**: you set `CanvasSize` yourself (for example 800 x 400). Easier when you design a layout once and reuse it on parts of different sizes.
- If you use **Scale** sizes and `TextScaled`, the layout survives both modes.
- Large faces with high density cost memory. A lobby full of huge, ultra-sharp boards is a real mobile cost; see [[Perf - SurfaceGui Cost - PixelsPerStud, Signs and In-World Screens]].

## Other useful properties

| Property | What it does | Typical use |
| --- | --- | --- |
| `AlwaysOnTop` | Draws over 3D objects (default off) | Floating markers; leave off for wall signs |
| `MaxDistance` | Stops rendering beyond this distance (default 1000; 0 = no limit) | Lower it for small signs to save cost |
| `ClipsDescendants` | Cuts off UI outside the canvas (default on) | Keep on |
| `Adornee` | Which part the GUI draws on, if not its parent | Required for clickable screens (below) |

## Changing the text from a script

A SurfaceGui inside a Workspace part is part of the world, so a **server Script** can update it and every player sees the same thing:

```lua
local label = workspace.Sign.SurfaceGui.TextLabel
local roundStatus = workspace:GetAttribute("Status") or "Waiting"

workspace:GetAttributeChangedSignal("Status"):Connect(function()
	label.Text = workspace:GetAttribute("Status")
end)
label.Text = roundStatus
```

## Clickable screens: the one rule

Buttons on a SurfaceGui only receive input when the **SurfaceGui is in the player's PlayerGui**. The usual setup:

1. Put the SurfaceGui (with its buttons) in **StarterGui**, not inside the part. StarterGui copies it into each player's PlayerGui.
2. Set its **Adornee** to the part in Workspace (in a LocalScript: `gui.Adornee = workspace:WaitForChild("Terminal")`).
3. Make sure the part's **CanQuery** is on.
4. Handle `button.Activated` in a LocalScript, and send real actions to the server with a RemoteEvent.

Because each player has their own copy, each player can see a different page on the same screen, which is exactly what you want for a shop terminal.

## Pitfalls

- **Text mirrored or upside down:** wrong `Face`, or the part is rotated. Fix the face rather than rotating the GUI.
- **Text blurry:** raise `PixelsPerStud` a little, or use `FixedSize` with a bigger `CanvasSize`.
- **Text dark at night:** `LightInfluence` = 0.
- **Buttons do nothing:** the SurfaceGui is still inside the part instead of PlayerGui, Adornee is not set, or `CanQuery` is off.
- **Player names or messages on a sign** must go through text filtering before you show them to others; see [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]].

## Related
[[00 START HERE - Top G Vault]] · [[First GUI Button - ScreenGui, TextButton and Activated]] · [[Perf - SurfaceGui Cost - PixelsPerStud, Signs and In-World Screens]] · [[Create a custom leaderboard with ordered data stores]] · [[Char - Nametags and Overhead UI with BillboardGui]]
