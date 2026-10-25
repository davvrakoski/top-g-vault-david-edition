---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Race HUD - Minimap, Position, Lap and Split Times"
tags: [roblox, community-knowledge, vehicles, racing, ui, hud, minimap]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ViewportFrame
  - https://create.roblox.com/docs/reference/engine/classes/GuiObject
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
---
# Racing - Race HUD - Minimap, Position, Lap and Split Times

A race HUD has to be readable in a quarter-second glance while the player's eyes are on the road. The speedometer is covered in [[Speedometer and Vehicle HUD - Studs to km-h and mph]]; this note is the race layer: position, laps, timers, splits, minimap and event banners, all driven from server attributes so it never disagrees with the real result.

## 1. Layout (corners, big numbers)

| Corner | Element |
|---|---|
| Top-left | Position "3/8" (huge "3", small "/8"), lap "LAP 2/3" |
| Top-right | Current lap time, best lap, last lap |
| Bottom-left | Minimap |
| Bottom-right | Speed, gear, nitro meter |
| Centre (temporary) | Countdown, "FINAL LAP", "WRONG WAY", split delta |

Respect the safe area: on phones the bottom corners sit under thumbs and touch controls. Move the minimap to top-right on touch devices (`UserInputService.TouchEnabled` plus no keyboard) and read `GuiService:GetGuiInset()`.

## 2. Data flow: attributes, not remotes

The server already writes `RacePosition`, `Lap`, `RaceProgress` and gate times (see [[Racing - Track Progress, Wrong-Way Detection and Live Positions]]). The HUD listens:

```lua
local player = game:GetService("Players").LocalPlayer
local function refreshPosition()
	local pos = player:GetAttribute("RacePosition") or 0
	local total = workspace:GetAttribute("RacerCount") or 0
	PositionLabel.Text = tostring(pos)
	TotalLabel.Text = "/" .. total
end
player:GetAttributeChangedSignal("RacePosition"):Connect(refreshPosition)
workspace:GetAttributeChangedSignal("RacerCount"):Connect(refreshPosition)
```

Animate position changes: scale the number 1.3x for 0.15 s, green when gaining, red when losing. That tiny animation makes overtakes feel big.

## 3. Timers that agree with the server

- The lap timer is `workspace:GetServerTimeNow() - lapStartServerTime` (lap start sent by the server at each crossing), formatted `m:ss.mmm`. Do not count with `task.wait` accumulators; they drift.
- After a lap, flash the official lap time from the server event, not the local timer.
- Best lap in purple, personal best in green (motorsport convention players already know).

## 4. Split deltas

At each gate, compare the current lap's gate time with the PB lap's time at the same gate: show "-0.42" (green) or "+0.31" (red) for 2 s in the centre. Against a ghost, compare continuous progress at equal time (see [[Racing - Ghost Cars - Recording and Replaying CFrame Laps]]).

## 5. Minimap: 2D projection (cheap) or ViewportFrame

**2D projection** (recommended): bake the track outline into one image (top-down screenshot or exported spline), record the world bounds, and place dots with scale coordinates:

```lua
-- minX/minZ/sizeX/sizeZ: world rectangle the image covers
local function toMap(p: Vector3): UDim2
	local u = (p.X - minX) / sizeX
	local v = (p.Z - minZ) / sizeZ
	return UDim2.fromScale(math.clamp(u, 0, 1), math.clamp(v, 0, 1))
end
```

Update dots at 10-15 Hz. Rotate the whole map frame by the camera yaw for a "heading up" map, or keep it north-up (simpler, easier to read on fixed tracks).

**ViewportFrame**: clone a simplified track mesh into it with a top-down `Camera`. Looks 3D but costs rendering; keep the clone very low-poly and update only car markers.

Mark the player bigger and in a unique colour; rivals as small dots coloured by position; finish line as a chequered tick.

## 6. Banners and flow

- Countdown 3-2-1-GO: big, centred, with a beep each step (pre-load sounds).
- "FINAL LAP" once; "WRONG WAY" with hysteresis; "DNF in 0:20" after the first finisher (see [[Racing - Race Lifecycle, Grid Placement and DNF Timer]]).
- Results: position, total time, best lap, rewards; then "Next race in 10".

## 7. Performance

Do not rebuild UI each frame; set `Text` only when the value changes. Use one `RenderStepped` for the lap timer label and minimap dots, nothing else.

## Related
[[Vehicles - Hub]] · [[Speedometer and Vehicle HUD - Studs to km-h and mph]] · [[Racing - Track Progress, Wrong-Way Detection and Live Positions]] · [[Safe Areas, Thumb Zones and Console UI Navigation]]
