---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Char - Team Outlines with Highlight"
tags: [roblox, community-knowledge, characters, highlight, outline, teams]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/highlighting
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
---
# Char - Team Outlines with Highlight

Outlines answer "where is my squad?" in shooters, co-op horror and hide-and-seek, and they mark the target, the carrier or the downed player. The `Highlight` instance draws an outline plus an interior fill around a `Model` or `BasePart`, optionally through walls. The trap is visibility: a server-created highlight is seen by everyone, including enemies, which turns a team aid into a wallhack.

## The instance in one table

| Property | Use |
|---|---|
| `Adornee` | The character model. If `nil`, it highlights its parent |
| `DepthMode` | `AlwaysOnTop` (through walls) or `Occluded` (only when visible) |
| `OutlineColor` / `OutlineTransparency` | Team colour, 0 = solid |
| `FillColor` / `FillTransparency` | Usually 0.8-1 for characters so skin and clothes stay readable |
| `Enabled` | Toggle without destroying |

Limits from the docs: the client shows at most **255** highlights at once; extras are silently ignored, and a disabled highlight still uses a slot. The **first** visible highlight costs most of the GPU price (up to about 1 ms on mobile); more add little. Adding/removing highlights can cause a geometry rebuild spike, so prefer toggling properties over creating and destroying every frame.

## Client-only team outlines (the safe pattern)

Create highlights in a `LocalScript`, only for teammates, so they exist only on that player's machine and never reach enemies:

```lua
-- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local me = Players.LocalPlayer
local folder = Instance.new("Folder")
folder.Name = "TeamHighlights"
folder.Parent = workspace.CurrentCamera -- client-only container

local function refresh(player)
	local old = folder:FindFirstChild(player.Name)
	if old then old:Destroy() end
	if player == me or not player.Character then return end
	if player.Team ~= me.Team then return end
	local h = Instance.new("Highlight")
	h.Name = player.Name
	h.Adornee = player.Character
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.FillTransparency = 1
	h.OutlineColor = player.TeamColor.Color
	h.Parent = folder
end
-- call refresh on CharacterAdded, Team changes and when *my* Team changes
```

Re-run for everyone when `me:GetPropertyChangedSignal("Team")` fires, and on each player's `CharacterAdded` (the old model is gone after respawn).

## Design rules

- **Teammates:** outline only, `AlwaysOnTop`, low opacity fill. Optionally fade with distance by raising `OutlineTransparency` past 150 studs.
- **Enemies:** never `AlwaysOnTop` unless a mechanic grants it (a scan ability for 3 s). Make that a server decision sent to the specific client.
- **Objectives / interactables:** `Occluded`, pulse `OutlineTransparency` with a tween.
- **Colourblind safety:** do not rely on red vs green alone; pair team outlines with nametag icons. See [[QA - Accessibility QA Checklist for Roblox Games]].
- **Nested highlights:** avoid putting a highlighted object inside another highlighted model; draw order can break.

## Related
[[Characters Customization - Hub]] · [[Char - Nametags and Overhead UI with BillboardGui]] · [[Team Uniforms and Skin Tones by Script - Shirt, Pants and BodyColors]] · [[Exploit QA - Testing Like an Exploiter Inside Studio]]
