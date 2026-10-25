---
area: "01 Start Here"
cluster: "Start Here"
title: "Your First Luau Script - Step by Step"
tags: [roblox, community-knowledge, start-here, luau, scripting, beginner]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/fundamentals/coding-1/create-a-script
  - https://create.roblox.com/docs/tutorials/curriculums/coding
  - https://create.roblox.com/docs/scripting/events
  - https://devforum.roblox.com/t/starting-with-scripting/3660990
---
# Your First Luau Script - Step by Step

The fastest way past "I don't know how to code" is to write five tiny scripts that each do something visible. This note walks through them in order, all inside one Baseplate place, each one adding a single new idea: printing, changing a property, waiting, looping, and reacting to an event. A DevForum beginner thread gives the same advice: practise small unrelated systems in Studio rather than only reading.

## Setup

1. Open a **Baseplate** template.
2. Home tab > **Part**. Rename it `MagicPart` in Explorer. Tick **Anchored** in Properties so it does not fall.
3. Hover `MagicPart` in Explorer, click **(+)**, insert a **Script**. A server Script inside a Workspace part runs when the game starts.
4. Open **Window > Output** so you can see messages.

## Script 1: say hello

```lua
print("Hello from", script.Parent.Name)
```

Press **Test** (F5). Output shows `Hello from MagicPart`. `script` is the script itself; `script.Parent` is the object it sits in.

## Script 2: change a property

```lua
local part = script.Parent
part.BrickColor = BrickColor.new("Really red")
part.Material = Enum.Material.Neon
part.Transparency = 0.3
```

A **variable** (`local part`) gives a name to something. Properties are set with a dot. Names must match the Properties window exactly, including capitals.

## Script 3: wait

```lua
local part = script.Parent
task.wait(2)
part.BrickColor = BrickColor.new("Lime green")
```

`task.wait(seconds)` pauses this script only. (Use `task.wait`, not the older `wait`.)

## Script 4: loop forever

```lua
local part = script.Parent
while true do
	part.BrickColor = BrickColor.random()
	task.wait(0.5)
end
```

Every `while true` loop **must** wait inside, or the script freezes and Studio reports it exhausted its execution time. See [[Script Timeout - Exhausted Allowed Execution Time]].

## Script 5: react to a touch

```lua
local part = script.Parent

local function onTouched(otherPart)
	local humanoid = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		part.BrickColor = BrickColor.random()
	end
end

part.Touched:Connect(onTouched)
```

New ideas: a **function** (a named block of code), an **event** (`Touched`, fired by the engine), `:Connect` (run my function each time it fires), and an `if` check. `otherPart` is whatever body part bumped the brick, so its `Parent` is the character model, which holds a `Humanoid`.

Turn the colour change into `humanoid.Health = 0` and you have the classic kill brick.

## How to read what you wrote

- `.` reads or sets a property or child: `part.Size`, `workspace.MagicPart`.
- `:` calls a method on an object: `part:Destroy()`, `game:GetService("Players")`.
- `--` starts a comment that Luau ignores.
- Blocks open with `do`, `then` or `function` and close with `end`.

## When it does not work

1. Look at Output. Red text gives the script name and line number; click it.
2. Check the script type and location: a **LocalScript** inside a Workspace part does nothing.
3. Check spelling and capitals: `brickcolor` is not `BrickColor`.
4. Add `print("got here")` lines to see how far the code gets.

More: [[Debugging Basics - Output, print, warn and Breakpoints]].

## Next five exercises

- Make a part that fades out and back in with a `for` loop on `Transparency`.
- Make a button part that, when touched, unanchors a wall.
- Count touches in a variable and print the count.
- Spin a part with a loop changing its `CFrame` by a small angle.
- Rewrite Script 5 so it only fires once per second (a debounce).

## Related
[[00 START HERE - Top G Vault]] · [[Luau Basics Cheat Sheet - Variables, Tables, Loops, Functions]] · [[Learning Luau - Escaping Tutorial Hell]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]] · [[30 Official Roblox Docs/Tutorials/Fundamentals/Coding 1/Create a script|Create a script (official)]]
