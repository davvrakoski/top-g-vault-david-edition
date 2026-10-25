---
area: "07 AI and Combat"
cluster: "AI"
title: "Designing Levels for NPC Navigation - Costs, Modifiers and Links"
tags: [roblox, community-knowledge, ai, pathfinding, navmesh, level-design, pathfindingmodifier, pathfindinglink]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/PathfindingModifier
  - https://create.roblox.com/docs/reference/engine/classes/PathfindingLink
  - https://create.roblox.com/docs/reference/engine/classes/PathfindingService#CreatePath
---
# Designing Levels for NPC Navigation - Costs, Modifiers and Links

Most NPC pathing bugs are level bugs: a doorway 0.2 studs too narrow for the agent radius, a decorative fence that splits the navmesh, a shortcut through lava because nothing told the agent it was bad. Roblox gives level designers three tools to shape where NPCs walk without touching AI code: **material costs**, **PathfindingModifier regions**, and **PathfindingLink** connections. This note is the level designer's checklist for using them together.

## Step 0: see the navmesh

In Studio's viewport Visualization Options, turn on **Navigation mesh**, **Pathfinding modifiers** and **Pathfinding links**. Coloured areas are walkable/swimmable; small arrows show places agents will try to reach by jumping; modifier labels appear as text. Walk the whole map with these on before blaming the AI.

## Step 1: agent sizes decide your geometry

`PathfindingService:CreatePath` takes agent parameters: `AgentRadius`, `AgentHeight` (default 5; gaps lower than this are non-traversable), `AgentCanJump` (default true), `AgentCanClimb` (TrussParts; waypoints get the label `Climb`), `WaypointSpacing` (default 4; `math.huge` for no intermediate waypoints) and `Costs`.

Level rules of thumb that follow (our own margins, not engine numbers):

- Doorways at least **2 x AgentRadius + 1 stud** wide for every agent size you use. Big enemies (radius 4) need a separate path object and wider doors, or they must be kept to open areas.
- Ceilings and vents at least `AgentHeight` + 0.5 if NPCs should pass.
- Keep a small library of agent "profiles" (Small, Human, Brute) and test each.

## Step 2: material costs for preferences

`Costs = { Water = 20, Mud = 5 }` makes agents prefer other ground but still cross if needed. The docs suggest a high but finite cost (100-1000) for "last resort" materials and `math.huge` for "never". Use costs to make NPCs stay on paths and sidewalks (cheap) instead of grass (slightly more expensive): crowds instantly look more natural.

## Step 3: modifiers for regions

A `PathfindingModifier` inside a part (often an invisible, non-colliding volume) labels the space. Then add the label to `Costs`:

| Label | Cost | Use |
| --- | --- | --- |
| `DangerZone` | `math.huge` | Fire, traps, kill bricks |
| `Exposed` | 8 | Open ground snipers can see; cover-aware NPCs avoid it |
| `Indoor` | 1 | Neutral, used by scripts to know where an NPC is |
| `Door` with `PassThrough = true` | 1 | Lets the path go through a closed door part; the NPC opens it on arrival |

`PassThrough` is the important one for doors and breakable barricades: the navmesh normally treats the collidable part as a wall; with `PassThrough` the path goes through, and your AI handles opening or breaking it when the next waypoint is beyond the door.

Different NPC types can use different costs for the same label: zombies give `Exposed` a cost of 1 (they do not care), soldiers give it 8.

## Step 4: links for special moves

A `PathfindingLink` joins two attachments (`Attachment0`, `Attachment1`) so the path can cross a gap the navmesh cannot: a jump across a chasm, a ladder, a zipline, a boat, a vent drop. `IsBidirectional` (default true) controls one-way links such as drop-downs. Set a `Label` (`UseLadder`) and give it a cost in `Costs`; when the agent's next waypoint carries that label, your movement code performs the custom action (climb animation and CFrame tween, or seat the NPC in the boat) and then continues the path.

## Step 5: keep the navmesh clean

- Watch decorative clutter (bins, plants, cables) in the navmesh view: each small collidable prop cuts a hole and adds detours. Merge clutter into fewer, simpler blockers, or use `PassThrough` modifiers where NPCs should ignore it (how non-collidable parts affect the navmesh in your setup: verify in the visualizer).
- Avoid tiny steps and gaps under 1 stud in walkways; they create jump arrows and odd waypoints.
- After moving geometry at runtime (opened gates, collapsed bridges), recompute paths for agents whose route crossed the area; the navmesh updates but existing waypoint lists do not.

## Test checklist

- [ ] Every agent profile reaches every objective (script a test that computes paths between named points and fails on `NoPath`)
- [ ] No path crosses a `DangerZone`
- [ ] Every link has a working custom action and animation
- [ ] Door `PassThrough` regions match every door that NPCs can open

## Related
[[AI - Hub]] - [[Pathfinding Engineering]] - [[Enemy AI Pathing Loop with PathfindingService]] - [[AI gets stuck or loops]]
