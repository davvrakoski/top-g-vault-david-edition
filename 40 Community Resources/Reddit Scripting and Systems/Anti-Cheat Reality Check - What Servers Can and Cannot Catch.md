---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/anti-cheat-reality-check"
title: "Anti-Cheat Reality Check - What Servers Can and Cannot Catch"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/how-do-others-make-good-anti-cheats/4812618
  - https://devforum.roblox.com/t/how-are-you-mitigating-new-executor-threats-decompilers-save-instance-game-explorer/4733793
cssclasses: [tg-a40]
---

# Anti-Cheat Reality Check - What Servers Can and Cannot Catch

Two busy 2026 threads ("How do others make good anti-cheats", 1.2k views; "How are you mitigating new executor threats?", 1.1k views) give a realistic picture.

## 1. Design so there is nothing to cheat

@UQGoose's framing: assume everything in a LocalScript can be read and changed. The client should send **intents** ("I want to claim the daily reward"), never **results** ("give me 100 coins"). The server checks and decides.

## 2. What server checks catch well

Movement cheats are detectable because the server sees positions (@cherrypathy, @EmilyBendsSpace):
- Distance moved per tick vs allowed speed (teleport, speed hacks).
- Horizontal velocity vs WalkSpeed; upward velocity vs JumpPower/JumpHeight (fly, super-jump).
- Limb distances (careful with ragdolls and custom rigs).
- Response: teleport back to the last valid position rather than instantly banning; allow for latency.

Also make abilities server-driven: if your game has a double jump, apply the second jump's force from the server instead of trusting a client "jumped" state.

## 3. What server checks can't catch

- **ESP / wallhacks:** default replication sends every avatar's position to every client, so the cheater already has the data. Fixing it means writing your own replication (hide what a player shouldn't know).
- **Aimbots:** hardest of all; only statistical detection (impossible snap rates, inhuman accuracy) helps.
- **Reading your client code:** executors can decompile LocalScripts and ModuleScripts and save the client-side place (maps, UI). @me7474: this has been possible since around 2018; obfuscation doesn't help because decompilers rebuild logic from bytecode anyway.

## 4. Where people disagree

- Strict camp: anything client-side is bypassable, so don't bother.
- Practical camp (@Arkston): with 50+ CCU, light client-side detection still raises the cost for casual cheaters, for example against ESP, where the server can't see anything. Treat it as a speed bump, never as security.

## Minimal server speed check (own code)

```lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local TOLERANCE = 1.5 -- allow for latency and physics jitter
local lastPos: {[Player]: Vector3} = {}

RunService.Heartbeat:Connect(function(dt)
	for _, player in Players:GetPlayers() do
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart") :: BasePart?
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if root and humanoid then
			local prev = lastPos[player]
			local flat = Vector3.new(root.Position.X, 0, root.Position.Z)
			if prev then
				local maxStep = humanoid.WalkSpeed * dt * TOLERANCE + 0.5
				if (flat - prev).Magnitude > maxStep then
					-- flag and correct; log before you ever auto-ban
					root.CFrame = CFrame.new(Vector3.new(prev.X, root.Position.Y, prev.Z))
					flat = prev
				end
			end
			lastPos[player] = flat
		end
	end
end)

Players.PlayerRemoving:Connect(function(player)
	lastPos[player] = nil
end)
```

Whitelist your own teleports, vehicles, knockback and conveyors before turning on any correction, or you'll punish honest players.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Server-Side Movement Validation and Anti-Exploit Checks]] · [[Security and Anti-exploit Design]] · [[Security and cheat mitigation tactics]] · [[Server Authority 2026 - What the Community Learned]]

<!-- TDOD_GRAPH_END -->
