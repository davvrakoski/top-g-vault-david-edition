---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/ui-gotchas-resetonspawn-playergui"
title: "UI Scripting Gotchas - ResetOnSpawn and PlayerGui"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/resetonspawn-set-to-false-is-not-being-honored/4776068
  - https://devforum.roblox.com/t/layercollectorresetonspawn-not-respected-when-layercollecters-immediate-parent-is-not-startergui/256565
  - https://devforum.roblox.com/t/gui-replication-order-and-local-script-mystery/4926172
cssclasses: [tg-a40]
---

# UI Scripting Gotchas - ResetOnSpawn and PlayerGui

The UI bugs that eat beginners' evenings, with the fixes the community settled on.

## 1. Editing StarterGui instead of PlayerGui

`StarterGui` is a template. At spawn, its contents are **copied** into each player's `PlayerGui`. Changing `game.StarterGui.Shop.Visible` from a script changes the template, not what the player sees (until their next respawn copy). Always script `player.PlayerGui`.

## 2. UI resets (and buttons die) on respawn

- `ScreenGui.ResetOnSpawn = true` (the default) **destroys and re-clones** that GUI every respawn. Any references your scripts held now point at destroyed objects, so buttons "stop working".
- **Folders break it.** Since at least 2019 (@JohnnyMorganz's report), a ScreenGui that is **not a direct child of StarterGui** (for example inside a Folder) ignores `ResetOnSpawn = false` and resets anyway. It resurfaced in an Aug 2026 thread (@AcecoolTV); the fix was moving ScreenGuis out of the folder (he nested ScreenGuis inside a parent ScreenGui instead).
- Alternative from @Android7User: keep the ScreenGui in ReplicatedStorage and parent it to PlayerGui yourself from a LocalScript; you then fully control its lifetime.
- `StarterGui.ResetPlayerGuiOnSpawn` exists too; set it in Studio's Properties, not at runtime from a LocalScript (in 2019 @Onett traced duplicated Bee Swarm Simulator menus to setting it from a LocalScript; setting it in Studio fixed it).

## 3. "Do I need WaitForChild for my own GUI?"

From an Oct 2026 thread (@happya_x, @ChiDj123): on the client, use `WaitForChild` for anything replicated, because it might not exist yet; on the server, things you placed in Studio already exist. Containers like StarterGui and StarterPack are visible to clients; ServerScriptService and ServerStorage contents never reach clients.

## Own pattern: UI controller that survives respawns

```lua
-- LocalScript in StarterPlayerScripts (runs once, NOT reset on respawn)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Template stored in ReplicatedStorage so StarterGui never re-clones it
local template = ReplicatedStorage:WaitForChild("UI"):WaitForChild("HUD") :: ScreenGui
local hud = template:Clone()
hud.ResetOnSpawn = false
hud.Parent = playerGui

local coinsLabel = hud:WaitForChild("Coins") :: TextLabel
local function render()
	coinsLabel.Text = ("Coins: %d"):format(player:GetAttribute("Coins") or 0)
end
player:GetAttributeChangedSignal("Coins"):Connect(render)
render()
```

Scripts in `StarterPlayerScripts` run once per session, so the connections above never need re-wiring after a death.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[PlayerGui]] · [[ScreenGui]] · [[UI breaks on phone - gamepad]] · [[Infinite Yield Possible - Causes and Fixes]]

<!-- TDOD_GRAPH_END -->
