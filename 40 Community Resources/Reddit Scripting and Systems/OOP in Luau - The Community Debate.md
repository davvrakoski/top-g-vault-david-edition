---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/oop-in-luau-community-debate"
title: "OOP in Luau - The Community Debate"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/is-oop-in-luau-actually-a-bad-practice/4186060
  - https://devforum.roblox.com/t/how-can-i-improve-my-coding-skills/4899309
  - https://luau.org/performance
cssclasses: [tg-a40]
---

# OOP in Luau - The Community Debate

"Is metatable OOP bad practice?" (DevForum, Dec 2025, ~4k views) is the canonical version of an argument that shows up weekly. Here is what holds up.

## The claims, fact-checked

| Claim heard in threads | Reality |
|---|---|
| "Metatables cause lag" | Overhead exists but is small when done right. @averlst quotes the Luau performance guide: keep `__index` pointing **directly at a table**, avoid `__index` *functions* and deep inheritance chains. |
| "OOP wastes memory" | The opposite for many objects: methods live once on the class table instead of being copied per instance. |
| "OOP is hard to debug" | True when everything is a deep class hierarchy (@2112Jay). Flat classes are fine. |
| "Never use OOP, use ECS" | A minority view. @Spa_rkk's reply: ignore both the ECS and OOP purists; mix them by use case. |

## When it fits / when it doesn't

- **Fits:** things with identity and behavior that live a while: a car, a door, a projectile, a round, a UI component.
- **Overkill:** one-off logic, pure functions, config data, anything you would make "a class with one method."
- One commenter (@real_ryanx) suggests plain tables with functions when you don't need shared methods.
- @Cure_Carbon (Sep 2026) adds that OOP pays off once you catch yourself repeating code; it is fine not to use it otherwise.

## The flat, fast class shape (own code)

```lua
--!strict
local Door = {}
Door.__index = Door -- points directly to a table: the fast path

export type Door = typeof(setmetatable({} :: {
	model: Model,
	isOpen: boolean,
}, Door))

function Door.new(model: Model): Door
	local self = setmetatable({
		model = model,
		isOpen = false,
	}, Door)
	return self
end

function Door.toggle(self: Door)
	self.isOpen = not self.isOpen
	self.model:SetAttribute("Open", self.isOpen)
end

function Door.destroy(self: Door)
	self.model:SetAttribute("Open", nil)
	table.clear(self :: any)
end

return Door
```

Avoid:
- Three-level inheritance (`Weapon -> Gun -> Pistol -> GoldPistol`). Prefer composition: a Gun *has* an Ammo component.
- `__index = function(...)` on hot objects.
- Forgetting cleanup: objects holding connections must disconnect them in `destroy` (see [[Signals, Connections and Leak-Proof Cleanup]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Practical Luau Pattern Library]] · [[Luau Strict Mode and Type Checking in Practice]] · [[ECS on Roblox - When It Fits]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]]

<!-- TDOD_GRAPH_END -->
