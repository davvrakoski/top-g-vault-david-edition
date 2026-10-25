---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Arena Shooter Weekend - Server-Checked Blaster, Respawns and Kills"
tags: [roblox, community-knowledge, start-here, weekend-build, pvp, shooter]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/implement-blasters
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/detect-hits
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/spawn-respawn
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/resources/templates
---
# Build - Arena Shooter Weekend - Server-Checked Blaster, Respawns and Kills

A free-for-all arena shooter is a strong weekend build because the loop is instantly understood: spawn, shoot, die, respawn, climb the kill board. The part that teaches the most is also the part beginners get wrong: **who decides a hit**. If the client tells the server "I hit Bob for 20", any exploiter can kill the whole server. Here the client only sends where it is aiming, and the server casts the ray itself, the simplest safe version. Roblox's own Laser Tag curriculum (gameplay scripting) and the Laser Tag / FPS System templates show a fuller, client-reported-and-server-checked design; read them after you have built the small one. Background: [[Round PvP Starter Architecture]], [[FPS TPS Starter Architecture]], [[Hitscan and Projectile Weapon Blueprint]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 arena, 6 spawn points | Map vote, map rotation |
| 1 hitscan blaster, headshot bonus | Weapon classes, reloads, attachments |
| Spawn protection (3 s) | Killstreaks, abilities |
| Kills / Deaths leaderstats, kill feed | Saved stats, ranks |
| 5-minute match, top 3 shown | Teams, matchmaking |

## Day 1 - arena and blaster (about 5 hours)

1. **Arena (1.5 h).** A symmetrical layout with cover every 10-15 studs and no spawn in direct sight of another. Pick a shape from [[Arena Map Typologies - Bowl, Figure 8, Hub and Three Lane]]. Fall-off zones: [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]].
2. **Spawns (30 min).** Six SpawnLocations with `Duration = 3`. The spawn ForceField blocks `Humanoid:TakeDamage`, so this is free spawn protection.
3. **Blaster tool (1 h).** A Tool with a Handle. A LocalScript on `Activated` reads the camera aim (`workspace.CurrentCamera` and the mouse or screen centre), fires a `Fire` remote with only a direction, and draws a local tracer right away so it feels instant. [[First Tool - A Sword or Flashlight You Can Equip]].
4. **Server check (2 h).** The core script below.

## Day 2 - match, feedback, feel (about 5 hours)

1. **Kill credit (1 h).** On each character's `Humanoid.Died`, read the `LastHitBy` attribute and give that player a kill. [[Kill Credit, Assists and Damage Attribution]], [[Recipe - Kill Feed]].
2. **Match timer (1 h).** 5 minutes, then show the top 3 for 10 seconds, reset stats, respawn everyone. [[Recipe - Round System with Intermission]].
3. **Hit feedback (1.5 h).** Hit marker on the shooter, red flash and a sound on the victim, a short tracer on all clients (the server tells others with `FireAllClients`). Muzzle flash: [[Muzzle Flash Recipe - Flash, Light, Smoke and Shell]].
4. **Spread (1 h).** Optional: a little random spread while moving. [[Recoil, Spread and Bloom for Roblox Guns]].
5. **Readable maps (30 min).** Name 3-5 areas so players can call them: [[Map - Callouts and Area Names - Naming Zones Players Can Shout]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: the server casts the ray

```lua
-- ServerScriptService/Blaster
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local fire = Instance.new("RemoteEvent")
fire.Name = "Fire"
fire.Parent = RS
local tracer = Instance.new("RemoteEvent")
tracer.Name = "Tracer"
tracer.Parent = RS

local FIRE_GAP, RANGE, DAMAGE, HEAD_MULT = 0.15, 300, 20, 1.5
local lastShot = {}
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

fire.OnServerEvent:Connect(function(player, direction)
	if typeof(direction) ~= "Vector3" or direction.Magnitude < 0.5 then return end
	local char = player.Character
	local head = char and char:FindFirstChild("Head")
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not head or not hum or hum.Health <= 0 then return end
	if not char:FindFirstChildOfClass("Tool") then return end -- must hold the blaster

	local now = os.clock()
	if now - (lastShot[player] or 0) < FIRE_GAP * 0.8 then return end -- slack for jitter
	lastShot[player] = now

	params.FilterDescendantsInstances = {char}
	local result = workspace:Raycast(head.Position, direction.Unit * RANGE, params)
	local hitPos = if result then result.Position else head.Position + direction.Unit * RANGE
	tracer:FireAllClients(player, head.Position, hitPos)
	if not result then return end

	local model = result.Instance:FindFirstAncestorOfClass("Model")
	local victim = model and model:FindFirstChildOfClass("Humanoid")
	if victim and victim.Health > 0 then
		local damage = if result.Instance.Name == "Head" then DAMAGE * HEAD_MULT else DAMAGE
		model:SetAttribute("LastHitBy", player.UserId)
		victim:TakeDamage(damage) -- ForceField blocks this during spawn protection
	end
end)

Players.PlayerRemoving:Connect(function(p) lastShot[p] = nil end)
```

What this does and does not protect: rate of fire, range, and "can only hit what is actually in front of my head" are all enforced by the server. It does not compensate for lag; the server sees targets slightly behind where the shooter saw them, so fast strafing players may get "missed" shots on high ping. That is acceptable for a first build. The shooter aims from the camera but the real ray starts at the head, so very close cover can block a shot that looked clear. Roblox's Laser Tag curriculum takes the other route: the client reports what it hit (aimed from the camera) and the server sanity-checks it with an angle tolerance, a distance tolerance and an obstruction raycast. That feels better on high ping but is more code; move to it once this version works. Next steps: [[Headshots and Hit Zones - Damage Multipliers and Accessory Hits]] and [[Remote Payload Validation]].

## What to cut when you run late

- Tracers for other players: show only your own.
- Match timer: let it be an endless FFA with a live leaderboard.
- Custom gun model: a box with a cylinder barrel reads fine at FFA distances.

## How to test

- [ ] Two clients in **Server and Clients**: shots hit, damage is 20, headshots 30, a kill gives a point.
- [ ] Hold fire with an auto-clicker: hits land at most about every 0.12 s.
- [ ] Shoot someone who just spawned: no damage for 3 seconds.
- [ ] Shoot through a wall by aiming at a player behind it: the wall blocks it.
- [ ] Unequip the blaster and fire the remote from the client: ignored.
- [ ] 8 players for 5 minutes: no errors, kill feed matches the leaderboard.

## Related
[[00 START HERE - Top G Vault]] - [[Hitscan and Projectile Weapon Blueprint]] - [[Case Study - Arsenal]] - [[Roblox Weapons Kit and NPC Kit - Official Prefabs (Limited Use License)]]
