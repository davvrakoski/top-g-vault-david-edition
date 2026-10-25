---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Escape Room Weekend - Five Puzzles, Gates and a Timer"
tags: [roblox, community-knowledge, start-here, weekend-build, story, puzzle, escape-room]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceGui
  - https://create.roblox.com/docs/reference/engine/classes/TextBox
  - https://create.roblox.com/docs/scripting/events/remote
---
# Build - Escape Room Weekend - Five Puzzles, Gates and a Timer

A story escape room is a chain of locks: each puzzle opens a door or a box that holds the clue for the next one, and the last door means you win. There is no monster and no combat, so the whole weekend goes into puzzle design and clear feedback. The beginner mistakes are puzzles that only the author understands and answers that never change, so players just look them up. This plan fixes both: a dependency chart before building, hints on a timer, and a keypad code that is random per server. Pair it with [[Story - Puzzle Dependency Charts - Keys, Locks and Gates]] and [[Story - Puzzle Hint Systems - Tiered Nudges, Timers and Diegetic Clues]]. For the monster version, see [[Build - Horror Escape Weekend - One Monster, Three Rooms, One Exit]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 2 rooms, 5 puzzles, 1 exit | Chapters, multiple places |
| Gates that open when puzzles are solved | Inventory with combining items |
| Random keypad code per server | Fully random puzzle sets |
| 15-minute timer, 3 timed hints | Leaderboard for fastest escape |
| Short intro text and an ending | Cutscenes, voice lines, multiple endings |

## Day 1 - chart and greybox (about 5 hours)

1. **Dependency chart (1 h).** On paper: Exit needs Lever puzzle + Keypad. Keypad needs the code note, which sits in the locked desk. The desk needs the brass key, which is under a loose floor tile. Colour order puzzle opens room 2. Five puzzles, two parallel paths, so a group of 3 can split up.
2. **Greybox both rooms (2 h).** Put the solution clue for each puzzle in a different place from the puzzle itself. Make every interactive object glow faintly or carry a prompt so players stop clicking walls: [[Guiding Players with Light, Color and Affordance]].
3. **Prompts (2 h).** Every pickup and switch is a ProximityPrompt whose server handler calls `solve("Name")` from the core script. Patterns: [[First Interaction with ProximityPrompt]], [[Recipe - Keycard Door with ProximityPrompt]].

## Day 2 - logic, timer, hints, ending (about 5 hours)

1. **Core script (1.5 h).** Below: solved set, gates that check requirements, a keypad with a random code.
2. **Keypad UI (1 h).** A ScreenGui with a TextBox (4 digits) and an Enter button that fires the remote. Clear the box after a wrong guess and shake it.
3. **Timer (1 h).** 15 minutes, server-owned, shown on every client: [[Recipe - Countdown Timer UI Synced to Server Time]]. When it runs out: "Time's up", reset the room.
4. **Hints (1 h).** At 5, 9 and 12 minutes, if the next puzzle is still unsolved, show a nudge on a wall screen. Make the first hint vague and the third almost the answer.
5. **Ending (30 min).** Touching the exit shows the time and a "Play again" button; award a badge. Replay ideas: [[Story - Endings and Replayability - Multiple Endings, Badges and Post-Game Hooks]].

## The core script: solved set, gates and a keypad

```lua
-- ServerScriptService/EscapeRoom
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")

local solved = {}
local CODE = string.format("%04d", math.random(0, 9999))
-- the clue note shows the code; the note itself is locked in the desk
workspace.Room1.Desk.Note.SurfaceGui.TextLabel.Text = "Safe code: " .. CODE

local function tryOpenGates()
	for _, gate in CollectionService:GetTagged("Gate") do
		if gate:GetAttribute("Open") then continue end
		local ready = true
		for need in string.gmatch(gate:GetAttribute("Requires") or "", "[^,]+") do
			if not solved[need] then ready = false end
		end
		if ready then
			gate:SetAttribute("Open", true)
			gate.CanCollide = false
			TweenService:Create(gate, TweenInfo.new(1.2),
				{CFrame = gate.CFrame + Vector3.yAxis * gate.Size.Y}):Play()
		end
	end
end

local function solve(name) -- every puzzle handler ends with this
	if solved[name] then return end
	solved[name] = true
	workspace:SetAttribute("Solved_" .. name, true) -- clients play a chime
	tryOpenGates()
end

local keypad = Instance.new("RemoteEvent")
keypad.Name = "Keypad"
keypad.Parent = RS
local lastTry = {}
keypad.OnServerEvent:Connect(function(player, guess)
	if type(guess) ~= "string" or #guess ~= 4 then return end
	if os.clock() - (lastTry[player] or 0) < 1 then return end -- 1 guess per second
	lastTry[player] = os.clock()
	if guess == CODE then solve("Keypad") end
end)

-- example puzzle: the brass key under the floor tile
workspace.Room1.FloorTile.ProximityPrompt.Triggered:Connect(function()
	solve("BrassKey")
end)
```

Each gate is an anchored part tagged `Gate` with an attribute such as `Requires = "BrassKey"` or `Requires = "Keypad,Levers"`. Because the gates read the solved set, you can reorder puzzles by editing attributes, never code. The one-guess-per-second limit (per player) turns a brute force of all 10,000 codes into almost three hours for one player, which is far longer than the timer.

## What to cut when you run late

- Room 2: put all five puzzles in one room; the chart still works.
- Random code: fine to fix it for the first playtest, randomise before publishing.
- The third hint: two hints is enough for a short room.

## How to test

- [ ] Hand the game to someone who has never seen it, say nothing, and time them. Note where they stand still for over a minute; that puzzle needs a better clue.
- [ ] Two servers show two different codes.
- [ ] Guess wrong 5 times fast: only one guess per second is checked.
- [ ] Solve puzzles out of the intended order where the chart allows it: gates still open correctly.
- [ ] Timer runs out: the solved set clears and gates close. If you want a new code each round, move the `CODE` line into your reset function and rewrite the note text there.

## Related
[[00 START HERE - Top G Vault]] - [[Story - Puzzle Dependency Charts - Keys, Locks and Gates]] - [[Quest System Blueprint]] - [[Story - Chapter-Based Games - Places, Teleports and Chapter Select]]
