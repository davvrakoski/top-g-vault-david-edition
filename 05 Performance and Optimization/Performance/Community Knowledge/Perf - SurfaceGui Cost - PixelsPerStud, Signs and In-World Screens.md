---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "SurfaceGui Cost - PixelsPerStud, Signs and In-World Screens"
tags: [roblox, community-knowledge, performance, ui, surfacegui, rendering]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceGui
  - https://create.roblox.com/docs/reference/engine/enums/SurfaceGuiSizingMode
  - https://create.roblox.com/docs/ui/in-experience-containers
---
# SurfaceGui Cost - PixelsPerStud, Signs and In-World Screens

SurfaceGuis put 2D UI on the face of a part: shop signs, scoreboards, computer screens, door labels, tycoon buttons. One is harmless. A mall map with 300 signs, each a SurfaceGui full of TextLabels, is a real client cost: every one is a UI tree that has to be laid out and drawn in 3D, whether the player is looking at it or not. The BillboardGui note covers floating UI over heads; this one covers UI glued to surfaces and how to keep it cheap.

## The properties that matter

| Property | What it does | Performance angle |
|---|---|---|
| `SizingMode` | `PixelsPerStud` (default) or `FixedSize` | Decides how big the UI canvas is |
| `PixelsPerStud` | Pixel density per stud of surface (used in PixelsPerStud mode) | Higher = sharper but a bigger canvas to render |
| `CanvasSize` | Fixed canvas size (used in FixedSize mode) | Keep it as small as the design allows |
| `MaxDistance` | Stops rendering beyond this distance | The single biggest saving for many signs |
| `LightInfluence` / `Brightness` | How scene lighting affects the GUI | No major cost difference; set for look |
| `AlwaysOnTop` | Draws over 3D objects | Use only for markers that must be seen through walls |
| `Enabled` | Turns the GUI off | Cheap way to hide whole groups |

## Rules of thumb

1. **Set `MaxDistance` on every SurfaceGui.** A shop sign does not need to render from 500 studs away. 60-150 studs is enough for most signs; the default of 0 means no limit.
2. **Do not crank `PixelsPerStud`.** The API reference itself warns that a large pixel density can hurt performance on big faces. A 20x6 stud sign at 50 pixels per stud (the usual default, unverified) is already a 1000x300 canvas. Doubling the value quadruples the pixel area. Raise it only on close-up screens the player reads, and lower it on large billboards seen from far away.
3. **Static text? Bake it.** A sign that never changes looks the same as a Decal or texture with the text painted on, and a decal is a much simpler draw than a UI tree. Keep SurfaceGuis for text that changes (prices, scores, names) or needs input.
4. **Toggle by zone.** If you already have zone-based culling, set `Enabled = false` for every SurfaceGui outside the player's current zone (see [[Manual Client Culling - Zone Visibility and Distance Culling]]).
5. **Update rarely.** A scoreboard that rewrites its labels every Heartbeat forces relayout every frame. Update on change only, and coalesce bursts with a dirty flag.
6. **Keep the tree shallow.** Each nested frame with UICorner, UIStroke and UIGradient adds work; a sign usually needs one background and one TextLabel.

## Interactive surfaces

Per the UI containers guide, buttons inside a SurfaceGui only receive input when the SurfaceGui is under the player's `PlayerGui`; the documented pattern is to keep it in StarterGui/PlayerGui and set its `Adornee` to the part. This is also handy for performance: a client script can create the interactive panels only for the player's own plot (tycoons) instead of every plot in the server.

```lua
-- Client: show interactive panel only for my plot
local plot = workspace.Plots:WaitForChild(tostring(player.UserId))
local panel = ReplicatedStorage.UI.PlotPanel:Clone()
panel.Adornee = plot.PanelPart
panel.MaxDistance = 80
panel.Parent = player.PlayerGui   -- parent last
```

## Audit script (command bar)

```lua
local n, unlimited = 0, 0
for _, d in workspace:GetDescendants() do
    if d:IsA("SurfaceGui") then
        n += 1
        if d.MaxDistance == 0 then unlimited += 1 end
    end
end
print(n, "SurfaceGuis,", unlimited, "with no MaxDistance")
```

## Related
[[Performance - Hub]] - [[BillboardGui Cost - Nametags, Health Bars and MaxDistance]] - [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] - [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]]
