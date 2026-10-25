---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Instance Count and Part Budgets"
tags: [deep-dive, roblox, instances, parts, budgets, draw-calls, optimization]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Instance Count and Part Budgets

**Why this matters:** most slow joins, phone crashes and physics lag in big Roblox maps come from sheer object count, not from any single expensive script, and nobody notices until the map has 120,000 instances.
This note explains what each instance actually costs, how to measure your counts with a command-bar audit, a starting budget table you can adapt, and the reduction techniques ranked by impact.

Roblox does **not** publish hard instance limits; the budget numbers below are **team starting points** to measure against on your target devices, not engine rules. Texture and triangle budgets are covered in [[Texture Memory and Triangle Budgets for Roblox Scenes]].

---

## 1. What an instance costs

Every instance has some cost in several systems at once:

| System | Cost driver | Where you see it |
| --- | --- | --- |
| **Memory** | Every instance, its properties, attributes, tags | Dev Console `PlaceMemory > Instances` |
| **Join time / replication** | Everything in `ReplicatedStorage`, `ReplicatedFirst` and non-streamed `Workspace` is sent on join | Load time; `Replicator/ProcessPackets` in the MicroProfiler |
| **Physics** | Unanchored parts, collisions, touch events, precise collision geometry | `PhysicsParts`, `PhysicsCollision`; `Simulation/...` labels |
| **Rendering** | Visible parts/meshes become draw calls unless instanced | `Stats.SceneDrawcallCount`; Render Stats (`Shift+F2`) |
| **Scripts** | Loops over `GetDescendants()`, per-part scripts, connections per part | Script labels, `Signals`, `LuaHeap` |
| **Spatial queries** | More parts in raycast/overlap regions | Raycast and `GetPartBoundsInBox` cost |

An anchored, non-collidable, non-touchable, non-queryable part costs much less than an unanchored, colliding one with a script inside it. **Configuration matters as much as count.**

---

## 2. Measure first: the audit script

Paste into the Studio **Command Bar** (edit mode). It only reads.

```luau
-- Instance audit: counts by class, physics flags, unique meshes.
local roots = {
	workspace,
	game:GetService("ReplicatedStorage"),
	game:GetService("ReplicatedFirst"),
	game:GetService("StarterGui"),
}

for _, root in roots do
	local counts, total = {}, 0
	local unanchored, collidable, touchable, queryable, precise = 0, 0, 0, 0, 0
	local meshIds = {}
	for _, d in root:GetDescendants() do
		total += 1
		counts[d.ClassName] = (counts[d.ClassName] or 0) + 1
		if d:IsA("BasePart") then
			if not d.Anchored then unanchored += 1 end
			if d.CanCollide then collidable += 1 end
			if d.CanTouch then touchable += 1 end
			if d.CanQuery then queryable += 1 end
		end
		if d:IsA("MeshPart") then
			meshIds[d.MeshId] = (meshIds[d.MeshId] or 0) + 1
			if d.CollisionFidelity == Enum.CollisionFidelity.PreciseConvexDecomposition then
				precise += 1
			end
		end
	end

	local sorted = {}
	for class, n in counts do
		table.insert(sorted, { class = class, n = n })
	end
	table.sort(sorted, function(a, b) return a.n > b.n end)

	local uniqueMeshes = 0
	for _ in meshIds do uniqueMeshes += 1 end

	print(("== %s: %d instances"):format(root:GetFullName(), total))
	for i = 1, math.min(12, #sorted) do
		print(("   %-22s %d"):format(sorted[i].class, sorted[i].n))
	end
	print(("   unanchored=%d canCollide=%d canTouch=%d canQuery=%d preciseMeshes=%d uniqueMeshIds=%d"):format(
		unanchored, collidable, touchable, queryable, precise, uniqueMeshes))
end
```

Then measure at runtime on the client (with streaming on, the client only has part of the world):

```luau
local Stats = game:GetService("Stats")
print("instances", Stats.InstanceCount,
	"primitives", Stats.PrimitivesCount,
	"moving", Stats.MovingPrimitivesCount,
	"drawcalls", Stats.SceneDrawcallCount,
	"triangles", Stats.SceneTriangleCount)
```

Record these per area of the map in your budget sheet ([[Performance Budget Template]]).

---

## 3. A starting budget table

Adapt these after measuring on your **lowest supported device**. They are deliberately conservative for a mobile-first game with instance streaming on.

| Metric | Comfortable | Investigate | Danger |
| --- | --- | --- | --- |
| Client `Stats.InstanceCount` at the busiest spot | < 40k | 40-80k | > 80k |
| Instances in `ReplicatedStorage` (sent to everyone on join) | < 10k | 10-30k | > 30k |
| Moving (unanchored, awake) parts on the server | < 500 | 500-2,000 | > 2,000 |
| Parts with `CanTouch` and a `Touched` listener | < 200 | 200-1,000 | > 1,000 |
| MeshParts with precise collision | < 100 | 100-500 | > 500 |
| `Stats.SceneDrawcallCount` on low-end mobile | < 1,000 | 1,000-2,000 | > 2,000 |
| UI instances alive in `PlayerGui` | < 2,000 | 2-5k | > 5k |
| Humanoid NPCs active on server | < 50 | 50-150 | > 150 |

If you are over in one row, that row is your next optimisation task; do not spread effort across all rows.

---

## 4. Reduction techniques, by impact

### 4.1 Stop sending what nobody needs

- **Move server-only assets to `ServerStorage`** (enemy templates, loot models, map variants). `ReplicatedStorage` is downloaded by every client on join.
- **Clone on demand**: keep one template, clone when needed, destroy when done.
- **Enable instance streaming** for large worlds; it is Roblox's highest-impact recommendation for asset memory ([[Instance Streaming Deep Dive]], [[StreamingEnabled Gotchas and Streaming-Safe Client Code]]).

### 4.2 Make static things cheap

For decoration that players never stand on, touch or raycast against:

```luau
-- Command bar: make every part under Map/Decor cheap. Review the folder first.
for _, d in workspace.Map.Decor:GetDescendants() do
	if d:IsA("BasePart") then
		d.Anchored = true
		d.CanCollide = false
		d.CanTouch = false
		d.CanQuery = false
		if d:IsA("MeshPart") then
			d.CollisionFidelity = Enum.CollisionFidelity.Box
		end
	end
end
```

- **Anchor** everything that does not move; unanchored parts cost physics even when resting.
- **`CanTouch = false`** removes them from touch processing; **`CanQuery = false`** removes them from raycasts and overlap queries (also makes your gameplay raycasts faster).
- **Collision fidelity**: Roblox's docs note that Default and Precise fidelity use significantly more memory than Box/Hull; small anchored parts are generally safe as `Box`.

### 4.3 Fewer, better objects

- **Merge decorative clusters** (railings, window frames, clutter) into a single mesh in your 3D tool instead of 30 parts.
- **Reuse the same mesh asset** for repeated props. Roblox instances (batches) identical meshes with the same mesh content and matching SurfaceAppearance/texture (or material when neither exists) into one draw call. A common mistake is importing a whole scene at once so every copy gets a different mesh ID, breaking instancing.
- **Replace unions with meshes** where unions are heavy (`GraphicsSolidModels`).
- **Attributes instead of ValueObjects** for configuration: no extra instance per value ([[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]]).

### 4.4 One script per system, not per part

300 doors with a script each means 300 scripts and often 300+ connections. A tag-driven component system runs one script ([[CollectionService Tag-Driven Architecture]]).

### 4.5 Bounded runtime spawning

- Every spawner has a **cap** (max live NPCs, max projectiles, max debris).
- Debris and VFX are **destroyed or returned to a pool** on a timer ([[Object Pooling Without Making a Mess]]).
- Fallen parts below the kill plane are destroyed (`Simulation/handleFallenParts` cost otherwise).
- UI lists **virtualise**: render only visible rows for a 500-item inventory.

### 4.6 Humanoids are expensive

Each `Humanoid` steps every frame (`stepHumanoid`). For crowds: disable unneeded states (`Humanoid:SetStateEnabled`), use simpler controllers or AnimationController-based rigs for ambient NPCs, and despawn or sleep NPCs far from players. See the vault's AI and combat notes for crowd budgets.

---

## 5. Folder, Model or nothing?

| Container | Use for | Notes |
| --- | --- | --- |
| `Folder` | Organisation only | Lightest container; no pivot or streaming behaviour |
| `Model` | Things that move/pivot together, or need streaming control | `ModelStreamingMode` (Atomic, Persistent...) and `LevelOfDetail` live here |
| Deep nesting | Avoid | Every level is an instance and makes `GetDescendants` scans longer |

---

## 6. Keep budgets enforced

- Put the audit script in your repo and run it before each release; paste results into the performance log ([[Performance Log Template]]).
- Add a **server-side guard** in development builds that warns when `Stats.InstanceCount` or moving part counts exceed budget during play tests.
- Review instance-heavy pull requests the same way you review code: "this adds 4,000 parts to ReplicatedStorage" is a review comment.
- Re-measure after every map expansion. Budgets drift one harmless-looking prop pack at a time.

---

## Common mistakes

- Keeping every map variant and enemy model in `ReplicatedStorage` "for convenience".
- Leaving decoration unanchored or with collision, touch and query enabled.
- Precise collision fidelity on hundreds of small props.
- Importing an entire scene so identical props get unique mesh IDs and lose instancing.
- A script inside every interactive part.
- Unbounded spawners and debris with no cleanup.
- Measuring in Studio edit mode only; runtime spawning and UI are where counts explode.
- Treating budgets as Roblox limits rather than numbers you set and verify on devices.

## Checklist

- [ ] Audit script run; results recorded per map area.
- [ ] Budget table adapted to your lowest supported device.
- [ ] Server-only content in ServerStorage; templates cloned on demand.
- [ ] Static decoration anchored with collision/touch/query off and Box fidelity.
- [ ] Repeated props share mesh assets.
- [ ] One script per system; tags instead of per-part scripts.
- [ ] Every runtime spawner capped and cleaned up.
- [ ] Budgets re-checked before each release.

**Related:** [[Optimization - Hub]] · [[Performance Budget Template]] · [[Instance Streaming Deep Dive]] · [[Object Pooling Without Making a Mess]] · [[Visual Scalability and Quality Tiers]]
