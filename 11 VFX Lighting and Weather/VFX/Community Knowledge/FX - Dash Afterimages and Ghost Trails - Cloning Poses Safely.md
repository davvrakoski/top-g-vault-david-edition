---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Dash Afterimages and Ghost Trails - Cloning Poses Safely"
tags: [roblox, community-knowledge, vfx, anime, dash, afterimage]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/reference/engine/classes/Debris
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://devforum.roblox.com/t/dash-effect-causing-the-player-to-anchor/3554121
  - https://devforum.roblox.com/t/runservice-afterimage-effect/1665269
  - https://devforum.roblox.com/t/dying-causes-the-afterframes-to-no-longer-appear-on-the-player-alongside-not-letting-them-dash-at-all/3554906
---
# Dash Afterimages and Ghost Trails - Cloning Poses Safely

Afterimages (fading copies of the character left along a dash path) make a dodge or teleport-dash readable and feel fast. The DevForum threads in the sources show the usual first attempts and their bugs: cloning body parts that still carry welds anchors the real player, afterimages stop after death because the script held the old character, and server-made clones look wrong for the dasher while client-made ones are invisible to others. This note is the clean version.

## Rule 1: build afterimages on every client, never the server

The server (or the dasher's client) fires a "dash started" signal with the player and duration. Each client then samples that character locally and spawns its own afterimages. Nothing is replicated per frame, and everyone sees it smooth.

## Rule 2: snapshot parts, not the character

Do not `Clone()` the live character model. Player characters are not `Archivable` by default, and per the Instance docs `Clone()` returns `nil` for a non-Archivable instance. Cloning the whole model also copies scripts, Humanoid, sounds and joints.

Instead, keep a pool of plain ghost parts and copy only the pose:

```lua
local GHOST_COLOR = Color3.fromRGB(120, 200, 255)

local function snapshot(character: Model, folder: Folder)
	for _, src in character:GetDescendants() do
		if src:IsA("BasePart") and src.Transparency < 1 and src.Name ~= "HumanoidRootPart" then
			local g = getPooledPart() -- your pool; plain Part or MeshPart copy
			g.Anchored, g.CanCollide, g.CanQuery, g.CanTouch = true, false, false, false
			g.Size, g.CFrame = src.Size, src.CFrame
			g.Material = Enum.Material.Neon
			g.Color, g.Transparency = GHOST_COLOR, 0.5
			g.Parent = folder
			fadeAndReturn(g, 0.25) -- tween Transparency to 1, then back to the pool
		end
	end
end
```

For R15 MeshPart bodies a plain block looks crude, so pre-build a ghost rig once per character: clone each body MeshPart on its own (set `Archivable = true` on that part first if needed), remove any joints and children from the copy, and keep those copies in the pool. Each snapshot then only sets `CFrame`, colour and transparency, which is cheap.

Anchored ghosts with no welds or Motor6Ds cannot affect the real character, which removes the anchoring bug from the first thread.

## Rule 3: sample on a timer, not every frame

At 60 FPS, a 0.3 s dash makes 18 snapshots of 15 parts each: 270 parts. Snapshot every 0.04-0.06 s instead (5-7 ghosts per dash), and fade each over 0.2-0.3 s. That is enough for the eye.

## Rule 4: reconnect on respawn

Look up the character each dash (`player.Character`) or listen to `CharacterAdded`; never cache the first character forever. That is the bug in the "dying causes the afterframes to no longer appear" thread.

## Variations

| Style | Change |
|---|---|
| Anime speed ghost | Neon, team colour, 3-4 ghosts, fade 0.2 s |
| Glitch / teleport | Alternate two colours, offset each ghost 0.2 studs sideways at random |
| Shadow step | Black `SmoothPlastic`, `Transparency` 0.3, shrink each ghost 10% as it fades |
| Hologram | `ForceField` material, cyan, slower fade 0.5 s |

Add a short `Trail` from the root attachment (lifetime 0.15 s) for a continuous streak between ghosts.

## Gameplay honesty

Afterimages show the path, not the hitbox. If dashes grant i-frames, the server owns that timing; the visual is only a hint. Fade ghosts quickly in PvP so they do not look like extra targets.

## Related
[[VFX - Hub]] · [[Replicating VFX - Server Signals, Client Renders]] · [[Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines]] · [[Beams, Trails and Attachments - Production Setups]] · [[ForceField Material and Neon Glow Tricks]]
