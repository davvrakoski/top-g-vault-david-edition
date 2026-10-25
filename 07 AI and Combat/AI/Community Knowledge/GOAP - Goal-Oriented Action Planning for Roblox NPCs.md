---
area: "07 AI and Combat"
cluster: "AI"
title: "GOAP - Goal-Oriented Action Planning for Roblox NPCs"
tags: [roblox, community-knowledge, ai, goap, planning, npc]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://pages.cs.wisc.edu/~dyer/cs540/handouts/gdc2006_orkin_jeff_fear.pdf
  - https://gdcvault.com/play/1013282/Three-States-and-a-Plan
  - https://www.lancaster.ac.uk/stor-i-student-sites/tamas-papp/2020/04/23/fear-shortest-path-for-challenging-ai/
---
# GOAP - Goal-Oriented Action Planning for Roblox NPCs

State machines and behavior trees hard-code **how** an NPC reaches a goal. Goal-oriented action planning (GOAP) lets the NPC **work it out**: you give it goals, a list of actions with preconditions and effects, and a planner finds a sequence of actions that makes the goal true. Jeff Orkin's GDC 2006 paper on F.E.A.R. ("Three States and a Plan") made it famous: the soldiers' state machine had only three states (Goto, Animate, UseSmartObject), and A* searched over actions to produce behavior that looked like flanking and taking cover. GOAP is overkill for a zombie that walks at you, and excellent for survivors, guards or squad enemies with many options.

## The pieces

- **World state:** a small table of booleans or numbers the NPC believes: `hasWeapon`, `weaponLoaded`, `targetVisible`, `inCover`, `targetDead`.
- **Goals:** desired world states with a priority that changes with circumstances: `KillTarget {targetDead = true}`, `StaySafe {inCover = true}`, `Heal {lowHealth = false}`.
- **Actions:** `cost`, `preconditions`, `effects`, and a runtime `perform` function.

```lua
local Actions = {
	{ name = "PickUpGun", cost = 2, pre = { hasWeapon = false }, eff = { hasWeapon = true } },
	{ name = "Reload",    cost = 1, pre = { hasWeapon = true, weaponLoaded = false }, eff = { weaponLoaded = true } },
	{ name = "Shoot",     cost = 1, pre = { weaponLoaded = true, targetVisible = true }, eff = { targetDead = true } },
	{ name = "Melee",     cost = 4, pre = { targetInRange = true }, eff = { targetDead = true } },
	{ name = "MoveToLOS", cost = 2, pre = {}, eff = { targetVisible = true } },
}
```

## The planner

Search backward from the goal or forward from the current state; forward breadth-first is easiest to write and fine for under ~15 actions:

```lua
local function satisfies(state, conds)
	for k, v in conds do if state[k] ~= v then return false end end
	return true
end

local function apply(state, eff)
	local s = table.clone(state)
	for k, v in eff do s[k] = v end
	return s
end

local function plan(start, goal, actions, maxDepth)
	local best, bestCost = nil, math.huge
	local function search(state, path, cost, depth)
		if cost >= bestCost then return end
		if satisfies(state, goal) then best, bestCost = table.clone(path), cost return end
		if depth == 0 then return end
		for _, a in actions do
			if satisfies(state, a.pre) then
				table.insert(path, a)
				search(apply(state, a.eff), path, cost + a.cost, depth - 1)
				table.remove(path)
			end
		end
	end
	search(start, {}, 0, maxDepth or 5)
	return best
end
```

Orkin used A* with action costs as edge weights; this depth-limited search with pruning is the simplest equivalent for small action sets. From `{hasWeapon = false, weaponLoaded = false, targetVisible = false}` with goal `targetDead`, it finds `PickUpGun > Reload > MoveToLOS > Shoot` (cost 6) unless `Melee` is cheaper because the target is in range.

## Running plans in Roblox

1. **Plan rarely.** Re-plan when the goal changes or an action fails, not every tick. Cap planning to a few NPCs per frame through your NPC scheduler.
2. **Execute with a tiny state machine.** Each action's `perform` is a Goto (pathfind somewhere), an Animate (play attack, wait for the animation marker) or a use-object action, exactly as in F.E.A.R.
3. **Validate before each step.** If a precondition is no longer true (the gun was taken), abort and re-plan.
4. **Costs are your design knobs.** Make cover cheaper for cowardly NPCs and melee cheaper for berserkers. Same action list, different personalities.
5. **Squad feel comes from shared facts.** Orkin's paper stresses that squad behaviors like suppression and advancing cover came from coordinating goals across planners, not from scripting. A squad manager can assign goals ("you suppress, you flank").

## When not to use it

- Fewer than ~5 actions: a utility scorer or behavior tree is simpler to debug.
- Hundreds of agents: planning cost adds up; use flow fields plus simple states.
- Designers need exact scripted sequences (boss phases): GOAP will find surprising plans.

## Related
[[AI - Hub]] - [[Behavior Trees and Utility AI in Luau]] - [[Production NPC State Machine]] - [[NPC Tick Budgeter]]
