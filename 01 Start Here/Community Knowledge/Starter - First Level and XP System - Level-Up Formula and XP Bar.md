---
area: "01 Start Here"
cluster: "Start Here"
title: "First Level and XP System - Level-Up Formula and XP Bar"
tags: [roblox, community-knowledge, start-here, progression, xp, leaderstats, ui]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/leaderboards
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
---
# First Level and XP System - Level-Up Formula and XP Bar

Levels are the simplest **progression engine**: do things, earn XP, fill a bar, level up, repeat. Roblox's core-loop guide calls progression the part that stops a game from feeling repetitive, and a level number next to a player's name is also something they show off. This note builds a server-side XP system on top of [[First Leaderboard with leaderstats]], a level-up formula you can tune, and a client XP bar.

## Design first: how fast should levels come?

Pick a formula for "XP needed to go from level L to L+1". Three common shapes:

| Formula | Level 1 | Level 10 | Level 50 | Feel |
| --- | --- | --- | --- | --- |
| `100` (flat) | 100 | 100 | 100 | Same pace forever, gets boring |
| `100 + 50 * L` (linear) | 150 | 600 | 2,600 | Steady slowdown, easy to reason about |
| `math.floor(100 * L ^ 1.5)` (curve) | 100 | 3,162 | 35,355 | Fast early, slow late |

For a first game, **linear** is the safest choice. Decide how much XP an average action gives (for example 10 XP per coin, 50 per round win) and check: "how many minutes does level 2 take?" Aim for the first level-up inside the first **2-3 minutes** of play so new players feel it in their first session.

## The server module

Put a ModuleScript `Levels` in `ServerScriptService`:

```lua
local Levels = {}

function Levels.xpToNext(level: number): number
	return 100 + 50 * level
end

function Levels.addXP(player: Player, amount: number)
	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end
	local level = stats.Level
	local xp = player:GetAttribute("XP") or 0

	xp += amount
	-- a big reward can give several levels at once
	while xp >= Levels.xpToNext(level.Value) do
		xp -= Levels.xpToNext(level.Value)
		level.Value += 1
		print(player.Name, "reached level", level.Value)
	end
	player:SetAttribute("XP", xp)
	player:SetAttribute("XPNext", Levels.xpToNext(level.Value))
end

return Levels
```

And in your join Script, create the stat:

```lua
local level = Instance.new("IntValue")
level.Name = "Level"
level.Value = 1
level.Parent = leaderstats
player:SetAttribute("XP", 0)
player:SetAttribute("XPNext", 150)
```

Award XP from any **server** script: `Levels.addXP(player, 10)`. Never from a LocalScript, never from a RemoteEvent that says "give me 500 XP". The client may ask "I collected coin #12"; the server checks and decides the amount.

## Why `while` and not `if`

If a player gets 2,000 XP from a boss at level 2, an `if` would raise them one level and leave 1,800 XP sitting above the bar. The `while` loop spends XP level by level until what is left fits.

## The XP bar (client)

1. In `StarterGui` add a ScreenGui `XPGui`, a Frame `Back` (dark, size `{0.3,0},{0,14}`, anchored bottom-centre), and inside it a Frame `Fill` (bright, size `{0,0},{1,0}`), plus a TextLabel `Label` covering the bar.
2. LocalScript inside `XPGui`:

```lua
local TweenService = game:GetService("TweenService")
local player = game:GetService("Players").LocalPlayer
local fill = script.Parent.Back.Fill
local label = script.Parent.Back.Label

local function refresh()
	local xp = player:GetAttribute("XP") or 0
	local need = player:GetAttribute("XPNext") or 1
	local level = player:WaitForChild("leaderstats"):WaitForChild("Level").Value
	TweenService:Create(fill, TweenInfo.new(0.25), {
		Size = UDim2.fromScale(math.clamp(xp / need, 0, 1), 1),
	}):Play()
	label.Text = string.format("Level %d   XP: %d / %d", level, xp, need)
end

player:GetAttributeChangedSignal("XP"):Connect(refresh)
refresh()
```

Attributes set on the Player by the server replicate to that client, so the bar updates by itself.

## Saving

Level and XP must survive leaving. Save both in the same DataStore entry as coins (one table per player), as shown in [[First DataStore Save - Load, Save, Leave and Shutdown]]. Save **total** values, never "XP earned this session".

## Make level-ups feel good

- A short sound and a "LEVEL UP!" popup (tween a TextLabel's size up, then fade).
- A reward at milestones (every 5 levels: a badge, a title, a new area). Levels that unlock nothing stop mattering by level 10.
- Show the level on the leaderboard (leaderstats does this for free) and above the head with a BillboardGui.

## Pitfalls

- **XP stored in a client-side value:** exploiters edit it. Server only.
- **Formula changes after launch:** players' levels stay, but their bar position jumps. Decide the curve before release.
- **Levels with no meaning:** tie at least one unlock to every few levels.

## Related
[[00 START HERE - Top G Vault]] · [[First Leaderboard with leaderstats]] · [[Progression, XP, and Skill Tree Blueprint]] · [[First DataStore Save - Load, Save, Leave and Shutdown]] · [[Number Abbreviation for Simulator UIs]]
