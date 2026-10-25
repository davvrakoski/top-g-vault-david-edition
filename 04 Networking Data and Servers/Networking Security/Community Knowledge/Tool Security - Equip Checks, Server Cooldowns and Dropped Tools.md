---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Tool Security - Equip Checks, Server Cooldowns and Dropped Tools"
tags: [roblox, community-knowledge, networking-security, tools, remotes, cooldowns]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://create.roblox.com/docs/players/tools
  - https://devforum.roblox.com/t/having-a-problem-with-exploiters/548302
  - https://devforum.roblox.com/t/2442869
  - https://devforum.roblox.com/t/2461834
---
# Tool Security - Equip Checks, Server Cooldowns and Dropped Tools

`Tool` objects are the fastest way to ship weapons and items, and the most common source of "exploiters one-shot everyone" reports. The usual bug: a LocalScript in the tool fires a RemoteEvent like `Swing:FireServer(target, damage)`, and the server trusts it. Exploiters can fire any remote with any arguments at any rate, so every tool remote needs the same server checks. This is the checklist the DevForum threads keep arriving at, in one place.

## What the client controls

- When `Activated` fires locally, and when it calls your remotes.
- Equipping and unequipping: the owning client moves tools between Backpack and character, and that replicates.
- Dropping the tool (Backspace) when `Tool.CanBeDropped` is true.
- Arguments: target, position, direction, "charge" amount, anything you send.

## What the server must own

| Value | Where it lives |
| --- | --- |
| Damage, range, fire rate, ammo | Server config module keyed by tool name, never in the remote payload |
| Cooldown timestamps | Server table keyed by player and tool |
| Whether the tool is equipped | Check `tool.Parent == player.Character` at call time |
| Ownership | Tool given by the server, tagged with an ID matching the player's inventory |

## A guarded handler

```lua
local Config = require(script.Parent.ToolConfig) -- {Sword = {damage = 20, range = 8, cooldown = 0.6}}
local lastUse: { [Player]: { [string]: number } } = {}

SwingRemote.OnServerEvent:Connect(function(player, tool, target)
	-- 1. types and identity
	if typeof(tool) ~= "Instance" or not tool:IsA("Tool") then return end
	local cfg = Config[tool.Name]
	local char = player.Character
	if not cfg or not char or tool.Parent ~= char then return end -- must be equipped
	-- 2. cooldown on the server
	local now = os.clock()
	local per = lastUse[player] or {}
	if now - (per[tool.Name] or 0) < cfg.cooldown then return end
	per[tool.Name] = now
	lastUse[player] = per
	-- 3. target sanity
	if typeof(target) ~= "Instance" then return end
	local hum = target.Parent and target.Parent:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if not hum or not root or not target:IsA("BasePart") then return end
	if (target.Position - root.Position).Magnitude > cfg.range + 4 then return end -- small latency slack
	-- 4. damage from config, never from the client
	hum:TakeDamage(cfg.damage)
end)

game:GetService("Players").PlayerRemoving:Connect(function(p) lastUse[p] = nil end)
```

Better still, have the server do the hit detection itself (see the hitbox notes) and let the client send only "I swung".

## Dropped and duplicated tools

- Set `CanBeDropped = false` on anything valuable; dropping drops it into Workspace where anyone can pick it up.
- Never treat "has a Tool named X in Backpack" as ownership for saving. Save from the server inventory table; rebuild tools from it on spawn. Otherwise a duplicated or picked-up tool gets saved as owned.
- When a player leaves, destroy their tools; when a tool is unequipped mid-attack, cancel any server-side attack state.

## Remote-per-tool vs one remote

One shared `ToolAction` remote with an action enum is easier to rate limit and log than dozens of per-tool remotes cloned into every tool. Remotes inside tools also replicate with the tool, so each equipped tool adds instances to replicate.

## Pitfalls

- Putting the cooldown only in the LocalScript (the threads' most common mistake).
- Reading damage from an attribute or NumberValue inside the tool: values on the server copy are safe from client edits, but only if the client never sends them.
- Trusting `Humanoid.Health <= 0` checks done on the client before awarding kills.
- Using `wait()` debounces per tool instance instead of per player: swapping between two copies of the same tool doubles the fire rate.

## Related
[[Networking Security - Hub]] - [[Remote Payload Validation]] - [[Rate Limiter]] - [[Server Melee Validation]]
