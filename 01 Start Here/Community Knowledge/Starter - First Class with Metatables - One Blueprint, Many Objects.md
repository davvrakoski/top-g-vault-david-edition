---
area: "01 Start Here"
cluster: "Start Here"
title: "First Class with Metatables - One Blueprint, Many Objects"
tags: [roblox, community-knowledge, start-here, oop, metatables, luau]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/metatables
  - https://create.roblox.com/docs/scripting/module
  - https://luau.org/types/object-oriented-programs
---
# First Class with Metatables - One Blueprint, Many Objects

Sooner or later you want many copies of the "same thing" that each keep their own state: ten treasure chests that each know if they are open, five turrets with their own cooldowns, a timer per round. You can do that with loose tables and functions, but the common Luau pattern is a small **class**: a ModuleScript that describes the blueprint, and a `new()` function that stamps out objects. This note builds one, explains the one metatable trick it uses, and tells you when *not* to bother. For the wider argument about OOP on Roblox, see [[OOP in Luau - The Community Debate]].

## The only metatable idea you need

A metatable changes how a table behaves. The key field is `__index`: when you read `obj.something` and `obj` has no such key, Luau looks it up in the table stored in `__index` instead. So objects hold their **data**, and one shared class table holds their **functions**.

```
chestA = { Opened = false, Model = ... }  --(missing key? look in)--> Chest = { open = fn, reset = fn }
```

## Step by step: a Chest class

1. In `ServerScriptService`, add a Folder `Classes` and a ModuleScript `Chest` inside it.
2. Code:

```lua
-- ServerScriptService/Classes/Chest
local Chest = {}
Chest.__index = Chest

function Chest.new(model: Model, reward: number)
	local self = setmetatable({}, Chest)
	self.Model = model
	self.Reward = reward
	self.Opened = false
	return self
end

function Chest:open(player: Player)
	if self.Opened then return false end
	self.Opened = true
	local coins = player.leaderstats.Coins
	coins.Value += self.Reward
	self.Model.Lid.Transparency = 1
	return true
end

function Chest:reset()
	self.Opened = false
	self.Model.Lid.Transparency = 0
end

return Chest
```

3. Use it from a server Script, one object per chest model:

```lua
local Chest = require(script.Parent.Classes.Chest)

for _, model in workspace.Chests:GetChildren() do
	local chest = Chest.new(model, model:GetAttribute("Reward") or 25)
	model.PrimaryPart.ProximityPrompt.Triggered:Connect(function(player)
		if chest:open(player) then
			task.delay(30, function() chest:reset() end)
		end
	end)
end
```

## Colon vs dot (the classic beginner bug)

- `function Chest:open(player)` is shorthand for `function Chest.open(self, player)`.
- Call it with a colon: `chest:open(player)`. If you write `chest.open(player)`, `self` becomes the player and you get errors like "attempt to index nil with 'Reward'".
- `Chest.new` uses a **dot** because there is no object yet.

## Add a cleanup method

Objects that connect events should be able to undo them:

```lua
function Chest:destroy()
	if self._conn then self._conn:Disconnect() end
	self.Model:Destroy()
	setmetatable(self, nil)
end
```

Store connections on the object (`self._conn = ...`) so `destroy` can find them. Forgetting this is the most common source of slow memory leaks in class-heavy code.

## Optional: type it

Luau cannot work out the type of `self` across methods by itself. The Luau "object-oriented programs" guide recommends declaring the data shape and the class type, then annotating `self`:

```lua
type ChestData = { Model: Model, Reward: number, Opened: boolean }
export type Chest = typeof(setmetatable({} :: ChestData, Chest))

function Chest.open(self: Chest, player: Player) -- still call it as chest:open(player)
	-- autocomplete on self works here
end
```

Skip types until the class works; add them when the file grows.

## When not to use a class

- A thing that exists once (the round manager, the shop) is fine as a plain module table.
- Pure helpers (formatting, math) should stay plain functions.
- Do not build inheritance chains (`Animal > Dog > Puppy`) in a first game. Composition, meaning one object holding another, is easier to debug.

## Checklist

- [ ] `Class.__index = Class` set once at the top
- [ ] `new` uses `setmetatable({}, Class)` and returns it
- [ ] Methods defined with `:` and called with `:`
- [ ] Per-object state lives on `self`, never in module-level variables
- [ ] A `destroy` method disconnects what the object connected

## Related
[[00 START HERE - Top G Vault]] · [[OOP in Luau - The Community Debate]] · [[Metatables]] · [[Starter - First ModuleScript and Code Organization]] · [[Signals, Connections and Leak-Proof Cleanup]]
