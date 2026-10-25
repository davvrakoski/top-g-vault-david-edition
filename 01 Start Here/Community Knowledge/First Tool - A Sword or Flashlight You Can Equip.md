---
area: "01 Start Here"
cluster: "Start Here"
title: "First Tool - A Sword or Flashlight You Can Equip"
tags: [roblox, community-knowledge, start-here, tools, weapons, backpack]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/tools
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/scripting/intermediate-scripting/create-player-tools
  - https://create.roblox.com/docs/reference/engine/classes/Tool
---
# First Tool - A Sword or Flashlight You Can Equip

A **Tool** is anything a player holds from the hotbar: swords, flashlights, keys, wands, guns. Roblox handles the backpack, hotbar slots, equipping and the holding animation for you; you supply a model with a `Handle` and scripts that react to `Activated`. This note builds a flashlight (client-safe) and a simple sword (server damage), the two shapes nearly every tool follows.

## Anatomy of a tool

```
StarterPack
└─ Flashlight      (Tool)
   ├─ Handle       (Part or MeshPart, NOT anchored)
   │  └─ SpotLight
   └─ Script
```

| Property | Meaning |
| --- | --- |
| `Handle` (child name) | The part the hand grips (RightHand on R15, Right Arm on R6). Exactly **one** part named Handle |
| `RequiresHandle` | Turn off for "spell" tools with no model |
| `Grip` | CFrame offset of the tool in the hand; tweak until it looks right |
| `TextureId` / `ToolTip` | Hotbar icon / hover text |
| `CanBeDropped` | Whether Backspace drops it |

Rules from the docs:
- **No part may be Anchored**, or the player gets stuck when equipping.
- Multi-part tools: weld every piece to the Handle with `WeldConstraint`s.
- Two parts named `Handle` = Roblox picks one at random.

## Where to put it

| Location | Result |
| --- | --- |
| `StarterPack` | Every player gets it on every spawn |
| `Workspace` | A pickup: walking into its Handle equips it |
| `ServerStorage` | Give it later from a server script (shop, reward) |

Giving a tool from the server: `tool:Clone().Parent = player.Backpack`. To keep it after death, also clone into `player.StarterGear`.

## Flashlight (toggle on click)

Script inside the Tool:

```lua
local tool = script.Parent
local light = tool:WaitForChild("Handle"):WaitForChild("SpotLight")
light.Enabled = false

tool.Activated:Connect(function()
	light.Enabled = not light.Enabled
end)

tool.Unequipped:Connect(function()
	light.Enabled = false
end)
```

A server Script is fine here because the light should be visible to everyone. `Activated` fires when the holder clicks or taps while the tool is equipped.

## Simple sword (server-side damage)

Script inside the Tool; the blade is the Handle:

```lua
local tool = script.Parent
local handle = tool:WaitForChild("Handle")
local Players = game:GetService("Players")

local DAMAGE = 20
local COOLDOWN = 0.6
local swinging = false
local hitThisSwing = {}

tool.Activated:Connect(function()
	if swinging then return end
	swinging = true
	table.clear(hitThisSwing)
	-- play a swing animation here (see Related)
	task.wait(COOLDOWN)
	swinging = false
end)

handle.Touched:Connect(function(hit)
	if not swinging then return end
	local character = hit.Parent
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local owner = tool.Parent -- the character holding it
	if not humanoid or character == owner or hitThisSwing[humanoid] then return end
	hitThisSwing[humanoid] = true
	humanoid:TakeDamage(DAMAGE)
end)
```

Why it is shaped this way:
- Damage happens in a **server** Script, so exploiters cannot set their own damage numbers.
- `hitThisSwing` stops one swing hitting the same target five times (Touched fires repeatedly).
- `character == owner` stops you hitting yourself.
- `TakeDamage` respects ForceFields (spawn protection); setting `Health` directly does not.

`Touched` swords are fine for a first game but feel inconsistent with lag. When you are ready, move to raycast or shapecast hitboxes: [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]].

## Input that needs the client

Aiming at the mouse, custom keybinds or camera effects need a LocalScript in the tool that reads input and sends a RemoteEvent to the server, which validates and applies the effect. Pattern: [[First RemoteEvent - Button on the Client, Reward on the Server]].

## Pitfalls

- Tool falls through the floor at spawn: the pickup copy in Workspace is unanchored with nothing under it. Place it on a surface, or anchor it and unanchor in a script when picked up (the docs describe this).
- Held at a weird angle: adjust `Grip` (position and orientation) in small steps.
- Tool order in the hotbar follows the order tools were added to StarterPack.

## Related
[[00 START HERE - Top G Vault]] · [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]] · [[Server Melee Validation]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]] · [[30 Official Roblox Docs/Players/In-game tools|In-game tools (official)]]
