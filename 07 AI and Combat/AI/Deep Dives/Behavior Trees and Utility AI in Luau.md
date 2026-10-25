---
area: "07 AI and Combat"
cluster: "AI"
tags: [deep-dive, roblox, ai, behavior-tree, utility-ai, luau]
cssclasses: [tg-a07]
---

# Behavior Trees and Utility AI in Luau

> **Why this matters:** A finite state machine is perfect for 4 states and painful at 15. Bosses and smart enemies need priorities ("flee beats attack beats patrol"), reusable pieces and decisions that weigh several factors at once.
> A tiny behavior tree for structure plus utility scoring for choices covers almost every Roblox enemy, in under 200 lines of Luau.

---

## 1. Which tool when

| Approach | Best for | Breaks down when |
|---|---|---|
| **FSM** | Doors, simple zombies, turrets, anything with < 6 states | Every new behavior needs transitions from every state |
| **Behavior tree (BT)** | Ordered priorities, reusable sequences ("approach, wind up, strike, back off") | Choices depend on many numbers at once |
| **Utility AI** | Picking the best of many options by score (attack vs heal vs reposition vs call allies) | You need strict sequencing |
| **BT + utility** | Bosses, squad enemies, companions | Rarely |

Existing FSM foundations are in [[Finite State Machine]] and [[Production NPC State Machine]]. This note adds BT and utility on top.

## 2. Behavior tree in 80 lines

A BT is a tree of nodes. Each tick returns `SUCCESS`, `FAILURE` or `RUNNING`.

- **Selector** (fallback): tries children in order, returns the first that does not fail. Encodes priority.
- **Sequence**: runs children in order, fails on the first failure. Encodes "do A then B then C".
- **Condition**: a check, success or failure, never running.
- **Action**: does work; may return running across ticks.
- **Decorators**: wrap one child (cooldown, invert, time limit).

```lua
--!strict
-- ReplicatedStorage/Shared/BT.lua  (server-side use; ReplicatedStorage only for sharing)
local BT = {}

export type Status = "SUCCESS" | "FAILURE" | "RUNNING"
export type Blackboard = { [string]: any }
export type Node = { tick: (self: Node, bb: Blackboard, dt: number) -> Status, reset: ((self: Node) -> ())? }

local function resetAll(children: { Node })
	for _, c in children do
		if c.reset then c:reset() end
	end
end

function BT.Selector(children: { Node }): Node
	local node = { running = 0 }
	function node:tick(bb, dt)
		for i, child in children do
			local s = child:tick(bb, dt)
			if s ~= "FAILURE" then
				-- a higher-priority child took over: reset whatever was running below it
				if self.running ~= 0 and self.running ~= i then
					local prev = children[self.running]
					if prev.reset then prev:reset() end
				end
				self.running = if s == "RUNNING" then i else 0
				return s
			end
		end
		self.running = 0
		return "FAILURE"
	end
	function node:reset() self.running = 0; resetAll(children) end
	return node :: any
end

function BT.Sequence(children: { Node }): Node
	local node = { index = 1 }
	function node:tick(bb, dt)
		while self.index <= #children do
			local s = children[self.index]:tick(bb, dt)
			if s == "RUNNING" then return "RUNNING" end
			if s == "FAILURE" then self.index = 1; return "FAILURE" end
			self.index += 1
		end
		self.index = 1
		return "SUCCESS"
	end
	function node:reset() self.index = 1; resetAll(children) end
	return node :: any
end

function BT.Condition(fn: (bb: Blackboard) -> boolean): Node
	return { tick = function(_, bb) return if fn(bb) then "SUCCESS" else "FAILURE" end } :: any
end

function BT.Action(fn: (bb: Blackboard, dt: number) -> Status, onReset: (() -> ())?): Node
	return { tick = function(_, bb, dt) return fn(bb, dt) end, reset = if onReset then function() onReset() end else nil } :: any
end

function BT.Cooldown(seconds: number, child: Node): Node
	local node = { readyAt = 0 }
	function node:tick(bb, dt)
		if os.clock() < self.readyAt then return "FAILURE" end
		local s = child:tick(bb, dt)
		if s == "SUCCESS" then self.readyAt = os.clock() + seconds end
		return s
	end
	function node:reset() if child.reset then child:reset() end end
	return node :: any
end

return BT
```

The `reset` calls matter. When "flee" interrupts "attack", the attack sequence must restart from its first step next time, not resume halfway through a wind-up.

## 3. A melee enemy tree

```lua
local BT = require(game:GetService("ReplicatedStorage").Shared.BT)

-- bb fields (set by perception each tick): target, distToTarget, health, maxHealth, canSeeTarget,
-- plus controllers: bb.chase (ChaseController), bb.combat (attack API), bb.home (Vector3)

local tree = BT.Selector({
	-- 1. flee when low health and allies are far
	BT.Sequence({
		BT.Condition(function(bb) return bb.health / bb.maxHealth < 0.25 and not bb.alliesNear end),
		BT.Action(function(bb) bb.chase:FleeFrom(bb.target); return "RUNNING" end),
	}),
	-- 2. attack when in range
	BT.Sequence({
		BT.Condition(function(bb) return bb.target ~= nil and bb.distToTarget <= 6 end),
		BT.Cooldown(1.2, BT.Action(function(bb)
			return bb.combat:RunAttack("Swipe") -- returns RUNNING while the attack plays, SUCCESS at the end
		end, function() end)),
	}),
	-- 3. chase when we have a target
	BT.Sequence({
		BT.Condition(function(bb) return bb.target ~= nil end),
		BT.Action(function(bb) bb.chase:Tick(bb.target); return "RUNNING" end),
	}),
	-- 4. otherwise go home / patrol
	BT.Action(function(bb) bb.chase:ReturnHome(bb.home); return "RUNNING" end),
})

-- in the scheduler, at 5 to 10 Hz:
-- tree:tick(bb, dt)
```

Reading the tree top to bottom tells you the enemy's priorities. Designers can reorder branches without touching state-transition code. The `bb.chase:Tick()` call plugs in the controller from [[Enemy AI Pathing Loop with PathfindingService]].

## 4. Utility AI: choosing by score

Utility AI scores every candidate action from 0 to 1 using **considerations** (curves over inputs), multiplies them, and picks the highest. It shines when the choice depends on several factors.

```lua
--!strict
-- ServerScriptService/AI/Utility.lua
local Utility = {}

-- Response curves: input already normalized to 0..1
function Utility.linear(x: number) return math.clamp(x, 0, 1) end
function Utility.inverse(x: number) return 1 - math.clamp(x, 0, 1) end
function Utility.quadratic(x: number) local c = math.clamp(x, 0, 1); return c * c end
function Utility.logistic(x: number, k: number?, mid: number?)
	local kk, m = k or 10, mid or 0.5
	return 1 / (1 + math.exp(-kk * (math.clamp(x, 0, 1) - m)))
end

export type Option = {
	name: string,
	considerations: { (bb: any) -> number },
	weight: number?,
	run: (bb: any) -> (),
}

-- Multiplies considerations with compensation so options with many factors are not unfairly punished.
local function score(option: Option, bb: any): number
	local n = #option.considerations
	if n == 0 then return 0 end
	local s = 1
	for _, c in option.considerations do
		s *= math.clamp(c(bb), 0, 1)
		if s == 0 then return 0 end
	end
	-- compensation factor (a common utility-AI technique)
	local modFactor = 1 - 1 / n
	local makeUp = (1 - s) * modFactor
	s = s + makeUp * s
	return s * (option.weight or 1)
end

function Utility.choose(options: { Option }, bb: any, current: string?, stickiness: number?): Option?
	local best, bestScore = nil, 0
	for _, o in options do
		local sc = score(o, bb)
		if o.name == current then
			sc *= 1 + (stickiness or 0.15) -- hysteresis: keep doing what we're doing unless clearly worse
		end
		if sc > bestScore then
			best, bestScore = o, sc
		end
	end
	return best
end

return Utility
```

A boss decision table:

```lua
local U = require(script.Parent.Utility)

local options = {
	{
		name = "Slam",
		considerations = {
			function(bb) return U.inverse(bb.distToTarget / 12) end,       -- close is better
			function(bb) return if bb.cooldowns.Slam <= 0 then 1 else 0 end,
			function(bb) return U.linear(bb.playersNear / 3) end,          -- more players nearby, better AoE
		},
		run = function(bb) bb.combat:RunAttack("Slam") end,
	},
	{
		name = "Charge",
		considerations = {
			function(bb) return U.logistic(bb.distToTarget / 40, 12, 0.4) end, -- mid/long range
			function(bb) return if bb.cooldowns.Charge <= 0 then 1 else 0 end,
			function(bb) return if bb.canSeeTarget then 1 else 0 end,
		},
		run = function(bb) bb.combat:RunAttack("Charge") end,
	},
	{
		name = "Summon",
		considerations = {
			function(bb) return U.inverse(bb.health / bb.maxHealth) end,   -- more likely when hurt
			function(bb) return U.inverse(bb.minionCount / 6) end,
			function(bb) return if bb.cooldowns.Summon <= 0 then 1 else 0 end,
		},
		weight = 0.9,
		run = function(bb) bb.combat:RunAbility("Summon") end,
	},
	{
		name = "Reposition",
		considerations = { function() return 0.2 end },  -- baseline fallback
		run = function(bb) bb.chase:Strafe(bb.target) end,
	},
}
```

**Hysteresis** (`stickiness`) prevents dithering between two options that score nearly the same each tick. Without it, enemies twitch between "charge" and "reposition".

## 5. Combining them

The clean split: **BT for structure, utility for choice.** A BT leaf called `ChooseAttack` runs `Utility.choose` and then executes the winner as a running action until it finishes. The tree still guarantees "stunned beats everything" and "dead beats stunned".

```lua
local chooseAttack = BT.Action(function(bb)
	if bb.currentAction and bb.currentAction.running then
		return "RUNNING"
	end
	local pick = U.choose(options, bb, bb.lastChoice)
	if not pick then return "FAILURE" end
	bb.lastChoice = pick.name
	pick.run(bb)
	return "RUNNING"
end)

local bossTree = BT.Selector({
	BT.Sequence({ BT.Condition(function(bb) return bb.stunned end), BT.Action(function() return "RUNNING" end) }),
	BT.Sequence({ BT.Condition(function(bb) return bb.target ~= nil end), chooseAttack }),
	BT.Action(function(bb) bb.chase:ReturnHome(bb.home); return "RUNNING" end),
})
```

## 6. Blackboard and perception

The blackboard is a plain table per NPC. Perception writes it; the tree only reads it (except for its own bookkeeping). That separation lets you:

- update perception at a lower rate than the tree (perception every 0.3 s, tree every 0.1 s),
- debug by printing the blackboard,
- unit-test the tree with fake blackboards (no world needed), see [[Testing and QA Operating System]].

Keep the blackboard small and numeric. Do not store instances that may be destroyed without checking `Parent` before use.

## 7. Debugging that saves hours

- Every node gets a `name`; the tree records the path of nodes that returned `RUNNING` this tick. Show it in a `BillboardGui` above the NPC in Studio only.
- Log utility scores for the top 3 options when a choice changes. When designers say "the boss never summons", the log shows that `minionCount` was never reset.
- Run trees in a deterministic test harness with recorded blackboards to reproduce "it did something weird at 20% HP".

## 8. Performance

- Ticking a small BT is microseconds; the cost is in perception (raycasts) and pathfinding, not the tree.
- Tick at 5 to 10 Hz from a central scheduler. Distant NPCs tick at 1 to 2 Hz or sleep.
- Utility with 10 options × 3 considerations = 30 small function calls per decision. Fine. Do not do decisions every frame.
- For hundreds of NPCs, perception queries can move to Parallel Luau with `Actor`s, but measure first: [[Parallel Luau — When It Helps and When It Hurts]].

## Common mistakes

- A selector that does not reset the lower-priority branch it interrupted, so sequences resume mid-way.
- Running the tree every frame on every NPC.
- Utility options with no fallback, returning `nil` and freezing the NPC.
- No hysteresis, causing decision flicker.
- Perception code inside condition nodes (raycasts repeated many times per tick).
- Storing destroyed instances in the blackboard.
- Bosses whose cooldowns are not part of the considerations, so they spam one move.

## Checklist

- [ ] Decide FSM vs BT vs utility per enemy type.
- [ ] BT nodes: Selector, Sequence, Condition, Action, Cooldown, with reset.
- [ ] Perception writes blackboard at its own rate; tree reads it.
- [ ] Utility options normalized 0..1, compensation applied, fallback option present.
- [ ] Hysteresis on the current choice.
- [ ] Studio-only debug display of running path and top scores.
- [ ] Central scheduler ticks at 5 to 10 Hz with distance LOD.

---

**Related:** [[AI - Hub]] · [[Finite State Machine]] · [[Production NPC State Machine]] · [[Advanced NPC - AI Behavior]] · [[NPC Vision and Hearing Model]] · [[Encounter Director and Pacing]]
