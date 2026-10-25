---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Physics Object Budget - Assemblies, Loose Debris, Ragdolls and Constraint Counts"
tags: [roblox, community-knowledge, optimization, physics, constraints, assemblies, budget]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/physics/sleep-system
  - https://create.roblox.com/docs/physics/assemblies
  - https://create.roblox.com/docs/physics/adaptive-timestepping
---
# Speed - Physics Object Budget - Assemblies, Loose Debris, Ragdolls and Constraint Counts

Physics cost is not "number of parts". It is the number of **awake assemblies**, the **constraints and contacts** between them, and the **collision shapes** they test against. A map of 50,000 anchored parts can cost almost nothing to simulate, while 300 loose bricks from an explosion can eat the frame. This note gives a way to count what matters and a budget sheet for games that are not vehicle games (for those see [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]).

## What actually costs

From the Creator Hub physics guidance:

- **Simulated assemblies**: each awake assembly is a rigid body the solver updates. Anchored assemblies are not simulated.
- **Mechanism complexity**: more constraints and joints in one mechanism means more solver work. Self-collision inside a mechanism (ragdoll limbs hitting each other) adds contacts.
- **Collision fidelity**: `PreciseConvexDecomposition` meshes cost the most CPU and memory; Box is cheapest.
- **Timestep**: adaptive stepping runs mechanisms at 60, 120 or 240 Hz as needed; forcing fixed 240 Hz makes everything step four times per frame.
- **Sleep**: an assembly below about 0.33 studs/s linear velocity (and the matching rotation and acceleration thresholds) falls asleep and is skipped. Anything that keeps nudging an assembly keeps it awake.

## Count it (command bar, server view during play)

```lua
local assemblies, unanchored, constraints, precise = 0, 0, 0, 0
for _, d in workspace:GetDescendants() do
	if d:IsA("BasePart") then
		if not d.Anchored then
			unanchored += 1
			if d.AssemblyRootPart == d then assemblies += 1 end
		end
		if d:IsA("MeshPart") and d.CollisionFidelity == Enum.CollisionFidelity.PreciseConvexDecomposition then
			precise += 1
		end
	elseif d:IsA("Constraint") then
		constraints += 1
	end
end
print(("assemblies %d | unanchored parts %d | constraints %d | precise meshes %d")
	:format(assemblies, unanchored, constraints, precise))
```

Run it at the quietest and the busiest moment of a session. To see which ones are awake, enable the Studio physics visualisation for awake parts (Studio Settings > Physics; option names vary by version) and watch the MicroProfiler `physicsStepped` and `worldStep` scopes.

## A starting budget sheet

Fill in with your own measurements on your baseline device; the example numbers are a template, not Roblox limits.

| Item | Example budget | How it is enforced |
|---|---|---|
| Awake loose debris assemblies | 100 | pool + cap, oldest anchored or removed first |
| Active ragdolls | 6 | ragdoll for N seconds, then anchor or remove |
| Constraints per ragdoll | ~15 (R15 joints) | no extra ropes or welds |
| Physics-driven doors/props | 30 | anchored until touched or opened |
| Precise-fidelity meshes | only large walkable hero pieces | audit with the Explorer filter `CollisionFidelity=PreciseConvexDecomposition` |
| Unanchored parts hidden in Workspace | 0 | keep spares in ServerStorage |

## Techniques by payoff

1. **Anchor by default.** Static props, NPCs that do not need to move, decoration. The docs list this first.
2. **Settle then freeze.** Debris and ragdolls: after they stop (or after a few seconds), set `Anchored = true` or delete. They look identical and cost nothing.
3. **Cap and recycle.** Explosion debris and loot drops go through a pool with a hard limit.
4. **No-collide inside mechanisms.** `NoCollisionConstraint` or collision groups between ragdoll limbs and between debris pieces.
5. **Simplify collisions.** Box for small anchored parts, Hull for medium props, invisible primitive colliders for large complex meshes. Disable `CanCollide`, `CanTouch` and `CanQuery` on parts that need none of them (collision geometry is still stored, so choose Box too).
6. **Do not fight sleep.** Scripts that set velocity or CFrame on resting parts every frame keep them awake; only write when something changes.
7. **Keep adaptive timestepping.** Use fixed 240 Hz only for a measured accuracy problem.

## Pitfalls

- `Massless` does not make a part cheaper to simulate; it only changes mass.
- Welding many parts into one assembly reduces assemblies but a giant welded assembly still has every part's collision shape.
- Moving anchored parts with CFrame every frame is not physics but still replicates; for many parts use [[BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame]].

## Related
[[Optimization - Hub]] · [[Physics Throttling, Sleep and Adaptive Timestepping]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]] · [[Instance Count and Part Budgets]]
