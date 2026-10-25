---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Case Study - Fixing a Laggy Obby"
tags: [roblox, community-knowledge, optimization, case-study, obby, profiling]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/performance-optimization/design
  - https://devforum.roblox.com/t/lag-free-obby-how-do-i-do-this/1083695
  - https://devforum.roblox.com/t/my-script-is-well-done/859952
  - https://devforum.roblox.com/t/killbrick-lags-the-game-a-lot/4091390
---
# Speed - Case Study - Fixing a Laggy Obby

Obbies look simple, so their lag is usually self-inflicted: hundreds of copy-pasted kill-brick scripts, spinning parts driven from the server, a 600-stage map that fully replicates on join, and free-model decorations. This walkthrough is a typical "my obby lags on phones" fix, in the order you should measure and fix. The symptoms and causes come from DevForum threads; the fixes follow the Creator Hub performance guides.

## Symptoms players report

- Long join on mobile, then stutter for the first minute.
- Moving platforms that jitter or "teleport" for the player standing on them.
- Kill bricks that fire late, or a server that slowly gets worse over a long session.

## Step 1: measure before touching anything

| What | Where | Note it down |
|---|---|---|
| Join time | stopwatch on your baseline phone, Play to control | seconds |
| Instance count | F9 > Memory > InstanceCount (client) | number |
| Client memory | F9 > Memory, on the phone, not Studio | MB |
| Server heartbeat | F9 > Server Jobs > Heartbeat > Steps Per Sec | should be ~60 |
| Script cost | Script Profiler (server and client) | top 5 functions |
| Join payload | Studio Settings > Network > **Print Join Size Breakdown** | top 20 instances |

## Step 2: the usual culprits, in order of payoff

**1. One script per kill brick.** Big obbies often have 500+ identical `Script`s, each with its own `Touched` connection and sometimes a `while true do` loop. Replace them with one server script that tags parts with CollectionService and connects once per tag (a DevForum reply suggests exactly this). One module is also one place to add a debounce.

```lua
-- ServerScriptService/KillBricks.server.lua
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local function hook(part: BasePart)
	part.Touched:Connect(function(hit)
		local humanoid = hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid")
		if humanoid and Players:GetPlayerFromCharacter(hit.Parent) and humanoid.Health > 0 then
			humanoid.Health = 0
		end
	end)
end

for _, p in CollectionService:GetTagged("KillBrick") do hook(p) end
CollectionService:GetInstanceAddedSignal("KillBrick"):Connect(hook)
```

Set `CanTouch = false` on every decorative part so only tagged parts generate touch events.

**2. Server-driven spinners and movers.** A part rotated with a server `while` loop or server `TweenService` replicates a new CFrame every step to every client. Prefer physics constraints (`HingeConstraint` with `ActuatorType = Motor`, `PrismaticConstraint`) on the server, which players can stand on, or purely cosmetic movement animated on each client.

**3. The whole map replicates on join.** Without instance streaming, all of Workspace must arrive before the player can play. Turn on `StreamingEnabled` (default for new places) and make sure checkpoint and teleport code waits for parts with `WaitForChild` or streaming requests. Stages far from spawn then never load on a phone that never reaches them.

**4. Part count and physics.** Anchor every static part. A DevForum thread lists unanchored decoration and "many many parts" as the main obby lag. Merge repeated detail into reused MeshParts and keep `CollisionFidelity = Box` on small anchored decoration.

**5. Leftover free models.** The Creator Hub warns that some free models carry scripts that create thousands of extra instances. If join size is far larger than the map looks, search for unknown scripts.

**6. Accidental instances.** One DevForum case: a kill brick that created a new Humanoid in Workspace on every touch. Any `Instance.new` inside a Touched handler needs a hard look.

## Step 3: re-measure and record

Write the before/after numbers next to each change. A fix that does not move a number is not a fix. Typical order of impact for obbies: streaming (join time, memory), then script consolidation (server CPU), then part and collision cleanup (memory).

## Pitfalls

- "Anti-lag" scripts that delete parts on the client: the forum consensus is that no script removes lag; build and code choices do.
- Testing only in Studio: Studio runs server and client together and hides phone memory limits.
- Unioning everything: unions are not automatically cheaper; see [[Unions vs MeshParts - When CSG Costs More Than It Saves]].

## Related
[[Optimization - Hub]] · [[First Obby in 30 Minutes]] · [[Instance Count and Part Budgets]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]] · [[Server-Side Tweens and Property Churn - Hidden Replication Cost]]
