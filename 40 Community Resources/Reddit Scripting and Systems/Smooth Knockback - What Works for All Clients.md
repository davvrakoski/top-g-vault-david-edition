---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/smooth-knockback"
title: "Smooth Knockback - What Works for All Clients"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/help-with-creating-a-very-smooth-knockback/3161286
  - https://devforum.roblox.com/t/how-to-make-smooth-knockback-projectile-motions-for-playerscharacters/4702069
  - https://devforum.roblox.com/t/server-authority-how-to-make-enemies-deal-smooth-knockback-on-the-player/4815257
cssclasses: [tg-a40]
---

# Smooth Knockback - What Works for All Clients

Battlegrounds-style games live or die on knockback feel, and "my knockback is delayed or jittery" is asked every few weeks.

## Why it's hard

- **The victim's client owns their character's physics.** A force applied on the server to a player character has to travel to that client, get simulated there, and travel back to everyone else. That round trip is the delay people see.
- **The attacker sees it last.** In @AlexiSanchezReal's 2024 thread, the player who *caused* the knockback saw the most lag.
- **Legacy `BodyVelocity`** still "works" and some posters say it feels better, but it is deprecated; the modern replacements are `LinearVelocity` (mover constraint) or `ApplyImpulse`.

## Patterns that work

1. **Apply on the owner's machine.** Server validates the hit, then tells the **victim's client** to apply the knockback locally (`LinearVelocity` for a short burst, or `ApplyImpulse`). Movement then replicates normally from the owner. This is the most common answer (@Godzilla_RealLife, 2026: do it client-side with LinearVelocity).
2. **Fake it for the attacker.** Play the victim's knockback visually on the attacker's screen immediately, then let real replication take over.
3. **NPC victims are server-owned**: apply the force on the server (after `SetNetworkOwner(nil)`).
4. **Under Server Authority** (2026), server-applied impulses rubber-band because the client can't predict them (@Dfzoz). No clean fix yet; the thread suggests driving knockback from things the client can also simulate.

## Own example: server-validated, client-applied knockback

```lua
-- Server (after your hit validation)
local knockbackRemote = game.ReplicatedStorage:WaitForChild("Knockback") :: RemoteEvent

local function knockback(victim: Player, fromPos: Vector3, strength: number)
	knockbackRemote:FireClient(victim, fromPos, math.clamp(strength, 0, 120))
end
```

```lua
-- Client (StarterCharacterScripts)
local character = script.Parent
local root = character:WaitForChild("HumanoidRootPart") :: BasePart
local remote = game.ReplicatedStorage:WaitForChild("Knockback") :: RemoteEvent

remote.OnClientEvent:Connect(function(fromPos: Vector3, strength: number)
	local away = root.Position - fromPos
	away = Vector3.new(away.X, 0, away.Z)
	if away.Magnitude < 0.01 then return end
	local velocity = away.Unit * strength + Vector3.new(0, strength * 0.4, 0)

	local attachment = Instance.new("Attachment")
	local mover = Instance.new("LinearVelocity")
	mover.Attachment0 = attachment
	mover.MaxForce = math.huge
	mover.RelativeTo = Enum.ActuatorRelativeTo.World
	mover.VectorVelocity = velocity
	attachment.Parent = root
	mover.Parent = root

	task.delay(0.15, function()
		mover:Destroy()
		attachment:Destroy()
	end)
end)
```

Tune duration and strength per attack. Trade-off: an exploiter can ignore client-applied knockback, so keep competitive outcomes (damage, ring-outs) decided on the server.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Network Ownership and Physics Replication]] · [[Mover constraints]] · [[Server-Authoritative Melee Pattern]]

<!-- TDOD_GRAPH_END -->
