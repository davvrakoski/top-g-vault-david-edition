---
area: "01 Start Here"
cluster: "Start Here"
title: "Luau Basics Cheat Sheet - Variables, Tables, Loops, Functions"
tags: [roblox, community-knowledge, start-here, luau, cheat-sheet]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/variables
  - https://create.roblox.com/docs/luau/tables
  - https://create.roblox.com/docs/luau/control-structures
  - https://create.roblox.com/docs/luau/functions
  - https://create.roblox.com/docs/luau/strings
  - https://create.roblox.com/docs/luau/operators
  - https://www.lua.org/pil/
---
# Luau Basics Cheat Sheet - Variables, Tables, Loops, Functions

Luau is Roblox's language: Lua 5.1 plus extras like type annotations, compound operators, string interpolation and `continue`. You do not need all of it to make games. This one-page sheet covers the syntax used in 90% of beginner scripts, with the small differences from other languages that trip people up. Keep it open beside the Script Editor.

## Values and variables

```lua
local coins = 10            -- number (integers and decimals are both "number")
local name = "Sam"          -- string
local alive = true          -- boolean
local target = nil          -- nil = "nothing"
coins += 5                  -- compound ops: += -= *= /= //= %= ^= ..=
```

- Always write `local`. Without it you create a global that leaks across the script.
- `nil` and `false` are the only "falsy" values. `0` and `""` count as true.
- Not equal is `~=` (not `!=`). Joining strings is `..`.
- `10 // 4` is floor division (2). `%` is remainder.

## Strings

```lua
local msg = `Hi {name}, you have {coins} coins`  -- backtick interpolation
print(#name)                 -- length: 3
print(string.upper(name))    -- "SAM"
print(name:sub(1, 1))        -- "S" (strings count from 1)
print(tostring(5) .. "!")    -- convert number to string
print(tonumber("42") + 1)    -- convert string to number
```

## If statements

```lua
if coins >= 100 then
	print("rich")
elseif coins > 0 then
	print("ok")
else
	print("broke")
end
-- logic words: and, or, not
```

## Tables: arrays (lists)

```lua
local fruits = {"apple", "pear"}
print(fruits[1])                   -- "apple" (index starts at 1, not 0)
table.insert(fruits, "plum")       -- add to end
table.remove(fruits, 1)            -- remove first
print(#fruits)                     -- count: 2
print(table.find(fruits, "plum"))  -- index or nil
```

## Tables: dictionaries (key = value)

```lua
local stats = {Health = 100, Speed = 16}
stats.Armor = 5            -- add a key
stats["Speed"] = 20        -- same as stats.Speed
stats.Health = nil         -- delete a key
```

`#` does **not** count dictionary entries; count them in a loop.

## Loops

```lua
for i = 1, 10 do print(i) end          -- 1 to 10
for i = 10, 1, -1 do print(i) end      -- countdown
for index, value in fruits do print(index, value) end
for key, value in stats do print(key, value) end
while alive do task.wait(1) end
repeat coins -= 1 until coins <= 0
```

- Modern Luau iterates tables directly; `pairs()` / `ipairs()` still work and you will see them in older code.
- `break` leaves a loop; `continue` skips to the next pass.
- Any endless loop needs a `task.wait()` inside.

## Functions

```lua
local function add(a, b)
	return a + b
end
print(add(2, 3)) -- 5

local function minMax(list)
	return math.min(table.unpack(list)), math.max(table.unpack(list))
end
local lo, hi = minMax({4, 9, 1}) -- multiple returns
```

- Define a `local function` **above** the line that calls it.
- Missing arguments arrive as `nil`; extra ones are ignored.
- Functions are values: you can store them in tables or pass them to `:Connect()`.

## Roblox-specific must-knows

```lua
local Players = game:GetService("Players")       -- get services this way
local part = workspace:FindFirstChild("Door")     -- nil if missing, no error
local gui = player:WaitForChild("PlayerGui")      -- waits until it exists
local copy = part:Clone(); copy.Parent = workspace
part:Destroy()
task.wait(1); task.spawn(fn); task.delay(2, fn)
```

`.` is for properties and children, `:` is for methods (`part:Destroy()`, not `part.Destroy()`).

## Types (optional, but helpful)

```lua
--!strict
local function heal(h: Humanoid, amount: number): ()
	h.Health = math.min(h.Health + amount, h.MaxHealth)
end
```

Start without types; add them once scripts grow. See [[Luau Strict Mode and Type Checking in Practice]].

## Related
[[00 START HERE - Top G Vault]] · [[Your First Luau Script - Step by Step]] · [[Luau Programming]] · [[Practical Luau Pattern Library]] · [[30 Official Roblox Docs/Luau/Tables|Tables (official)]]
