---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Battlegrounds Weekend - Four-Hit M1 Combo and One Ability"
tags: [roblox, community-knowledge, start-here, weekend-build, combat, battlegrounds]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://devforum.roblox.com/t/types-of-hitboxes/1897975
  - https://devforum.roblox.com/t/combat-system-hitboxes/3312821
---
# Build - Battlegrounds Weekend - Four-Hit M1 Combo and One Ability

Battlegrounds games (free-for-all arenas where everyone punches everyone) live or die on how one button feels: the M1, a basic attack that chains into a short combo. Before characters, ultimates and awakenings, you need a 4-hit combo that stuns, a finisher that knocks back, and one special move on a cooldown. This weekend plan builds that, with the hit detection on the **server**, which is what DevForum threads keep warning beginners about: a client that sends "I hit these players" can be faked. Design depth: [[Melee Combo Blueprint]], [[Anime Action Starter Architecture]], [[Case Study - The Strongest Battlegrounds]].

## The weekend scope

| In | Cut (later) |
|---|---|
| M1 combo: 4 hits, last one knocks back | Air combos, uppercuts, downslams |
| Short stun on each hit | Block, parry, guard break |
| 1 ability on key E with an 8 s cooldown | 4-ability kits, ultimates |
| A kill counter, respawn on death | Characters, shop, saving |
| A practice dummy | Ranked, matchmaking |

## Day 1 - the M1 (about 5 hours)

1. **Arena and dummy (45 min).** A flat arena with low walls and a dummy rig (an R15 model with a Humanoid; leave its HumanoidRootPart unanchored so it can be knocked back). The dummy is your test partner all weekend.
2. **Input (45 min).** A LocalScript in `StarterPlayerScripts` fires an `M1` RemoteEvent on left click or tap and plays the next swing animation. The client only says "I pressed M1"; it never says who was hit. [[Starter - First Key Press - UserInputService, ContextActionService and Input Actions]].
3. **Server combo (2.5 h).** The core script below: combo counter, timing, a box in front of the attacker, damage, stun, finisher.
4. **Animations (1 h).** Four short punches (0.25-0.35 s each) made in the Animation Editor; priority `Action`. [[Anim - Animation Principles for Game Clips - Anticipation, Follow-Through and Holds]].

## Day 2 - ability, feel and a match (about 5 hours)

1. **One ability (2 h).** Pick one: a forward dash-punch or a ground slam. Same rules as M1: the client asks, the server checks a cooldown stored per player, then does its own hitbox. Dash: [[Recipe - Dash]]. Cooldowns: [[Recipe - Server-Side Cooldowns and Rate Limits]].
2. **Knockback on players (1 h).** A player's character is simulated by that player's own client, so a server impulse often does nothing on them. Use the approach in [[Smooth Knockback - What Works for All Clients]].
3. **Feel (1.5 h).** Hit sound, small camera shake for the attacker, a white flash on the victim, damage numbers. [[Damage Numbers and Overhead Bars with BillboardGui]], [[Hitstun, I-Frames, Poise and Super Armor]].
4. **Match (30 min).** A `Kills` leaderstat, credit to the last attacker within 10 s: [[Kill Credit, Assists and Damage Attribution]].

## The core script: server-side M1

```lua
-- ServerScriptService/M1
local Players = game:GetService("Players")
local remote = Instance.new("RemoteEvent")
remote.Name = "M1"
remote.Parent = game:GetService("ReplicatedStorage")

local HIT_GAP, RESET, END_LAG = 0.35, 1.2, 1.0
local DAMAGE = {5, 5, 5, 8}
local state = {} -- [player] = {step = n, last = time}
local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

local function stun(model, seconds)
	local token = os.clock()
	model:SetAttribute("Stunned", token)
	task.delay(seconds, function()
		if model:GetAttribute("Stunned") == token then model:SetAttribute("Stunned", nil) end
	end)
end

remote.OnServerEvent:Connect(function(player)
	local char = player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not root or not hum or hum.Health <= 0 or char:GetAttribute("Stunned") then return end

	local s = state[player] or {step = 0, last = 0}
	state[player] = s
	local now = os.clock()
	if now - s.last < (if s.step == 4 then END_LAG else HIT_GAP) then return end
	if s.step == 4 or now - s.last > RESET then s.step = 0 end
	s.step += 1
	s.last = now

	params.FilterDescendantsInstances = {char}
	local box = root.CFrame * CFrame.new(0, 0, -3.5) -- 3.5 studs in front
	local done = {}
	for _, part in workspace:GetPartBoundsInBox(box, Vector3.new(5, 5, 5), params) do
		local model = part:FindFirstAncestorOfClass("Model")
		local h = model and model:FindFirstChildOfClass("Humanoid")
		if h and h.Health > 0 and not done[model] then
			done[model] = true
			h:TakeDamage(DAMAGE[s.step])
			stun(model, if s.step == 4 then 0.8 else 0.4)
			if s.step == 4 and not Players:GetPlayerFromCharacter(model) then
				local r = model.HumanoidRootPart -- dummy: server owns it
				r:ApplyImpulse(root.CFrame.LookVector * r.AssemblyMass * 60)
			end
		end
	end
end)

Players.PlayerRemoving:Connect(function(p) state[p] = nil end)
```

A client LocalScript should read the `Stunned` attribute on its own character and set WalkSpeed low while it is set. The `done` table stops one punch from hitting the same rig once per body part. Why a box query instead of `Touched`: [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]]. If high-ping players complain that hits miss, read [[Combo Systems and Input Buffering]] before you move detection to the client.

## What to cut when you run late

- Custom animations: use one punch animation for all four hits and change only the sound.
- Damage numbers: a hit sound alone tells players they connected.
- Knockback on players: keep it on dummies only for this build.

## How to test

- [ ] Spam M1 with an auto-clicker on the dummy: hits never come faster than every 0.35 s.
- [ ] Stop for 2 seconds: the next hit is hit 1 again (combo reset).
- [ ] Hit 4 launches the dummy and then there is a 1 s pause.
- [ ] Two players in **Server and Clients**: both see the same health drop, and a stunned player cannot punch back.
- [ ] While testing, switch the command bar to the client view and fire the `M1` remote 100 times in a loop: the server still enforces the gap ([[RemoteEvent Fuzzing - Bad Input Tests Before Launch]]).

## Related
[[00 START HERE - Top G Vault]] - [[Melee Combo Blueprint]] - [[Ability and Status Framework]] - [[Starter - Scoping Your First Real Game - One Loop and a Cut List]]
