---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/collections-query-api-caveats"
title: "Collections Query API - Community Caveats"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/collections-how-to-group-instances-with-query-patterns/4809143
cssclasses: [tg-a40]
---

# Collections Query API - Community Caveats

August 2026: Roblox (@HamiltonZlox) announced **Collections**, an extension of CollectionService where membership is defined by a **query** instead of a single tag. [[CollectionService Tag-Driven Architecture]] already covers the basics; this note adds the syntax and what the community flagged.

## The selling points

- A collection auto-includes any instance matching the query, only while it matches (and only if streamed in).
- Callbacks are bound by **event name with an `On` prefix** (`OnTouched`, `OnAdded`, `OnRemoved`), and connections are managed for you, so no per-instance maids.
- Fewer `FindFirstChild`/`WaitForChild` chains: the search runs in-engine.
- Same selector syntax as `Instance:QueryDescendants` and the UI Style Engine.

## Query syntax cheat sheet (from the announcement)

| Query | Matches |
|---|---|
| `"Part#Wall"` | Parts **named** Wall (`#` = name) |
| `"Model > .SwordPart"` | Children of any Model with tag SwordPart (`.` = tag, `>` = child) |
| `"MeshPart >> [$OnFire = true]"` | Descendants of MeshParts with attribute OnFire true (`>>` = descendant) |
| `"MeshPart:has(> :not(SurfaceAppearance, Texture))"` | MeshParts lacking those children |
| `".NPC.Enemy[$health = 1]"` | Instances with both tags and attribute health = 1 |

`CreateCollection(query, root?)` searches under `workspace` by default. `Collection:ForEach(fn)` and `Collection:Destroy()` round out the API. A callback can only be assigned once.

## Caveats raised in replies

- **Performance under churn.** @Ukendio (author of the jecs ECS) argued membership tests and invalidations on property, attribute, tag and hierarchy changes add real overhead, especially with streaming, and that results allocation makes querying every frame impractical for now.
- **Syntax surprise.** @RoyallyFlushed asked why tags use `.` and names use `#`, the reverse of what CSS users expect. Write it down for your team.
- `OnAdded` also fires for instances **already** in the collection when you assign it; don't double-initialize.

## Own example

```lua
local CollectionService = game:GetService("CollectionService")

-- Every BasePart tagged Lava inside the map, damaging on touch
local lava = CollectionService:CreateCollection("BasePart.Lava", workspace:WaitForChild("Map"))

function lava.OnAdded(part: BasePart)
	part.Material = Enum.Material.Neon
end

function lava.OnTouched(part: BasePart, other: BasePart)
	local humanoid = other.Parent and other.Parent:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid:TakeDamage(10)
	end
end
```

Add a per-humanoid cooldown in real code ([[Touched Events - Network Delay and Reliability]]). Check the current docs for release status before shipping.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[CollectionService Tag-Driven Architecture]] · [[CollectionService]] · [[ECS on Roblox - When It Fits]] · [[Signals, Connections and Leak-Proof Cleanup]]

<!-- TDOD_GRAPH_END -->
