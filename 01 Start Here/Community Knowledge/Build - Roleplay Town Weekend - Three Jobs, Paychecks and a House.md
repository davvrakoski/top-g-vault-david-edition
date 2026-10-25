---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Roleplay Town Weekend - Three Jobs, Paychecks and a House"
tags: [roblox, community-knowledge, start-here, weekend-build, roleplay]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/teams
  - https://create.roblox.com/docs/reference/engine/classes/Team
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/players/leaderboards
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/chat/guidelines
---
# Build - Roleplay Town Weekend - Three Jobs, Paychecks and a House

Roleplay towns look like they need a whole city, but what makes players stay is having a **role** (cook, cop, doctor), a small reason to act it out, and something to spend money on. Players write the stories themselves; your job is props and places that start conversations. This plan builds a 4-building town, three jobs with one simple task each, a paycheck that does not reward going AFK, and one house you can buy and lock. Background: [[Roleplay and Life Sim Genre Breakdown - Roles, Props and Homes]], [[Case Study - Brookhaven RP]], [[Case Study - Work at a Pizza Place]].

## The weekend scope

| In | Cut (later) |
|---|---|
| Town square, pizza shop, police station, clinic, 4 houses | Big city, interiors streaming |
| 3 jobs + Citizen, chosen from a menu | Job levels, uniforms shop |
| Paycheck every 60 s for active players | Bank, salary upgrades |
| One task per job | Crimes, arrests, medical minigames |
| Buy a house, lock the door | Furniture placement, saving homes |

## Day 1 - town and jobs (about 5 hours)

1. **Layout (2 h).** Buildings around a central square, one road loop, homes on the edge. Read [[Map - Roleplay Town Layout - Civic Core, Job Buildings, Homes and Road Loops]]. Interiors can be empty boxes with a counter and 2 props each.
2. **Teams as jobs (45 min).** In the `Teams` service create Citizen, Cook, Police, Doctor, each with its own `TeamColor`; set `AutoAssignable = true` only on Citizen. Put a SpawnLocation with matching `TeamColor` in each building. [[First Team Game - Teams and SpawnLocations]].
3. **Job menu (1 h).** A GUI with 4 buttons fires `ChooseJob("Cook")`. The server checks the name and sets `player.Team`. [[Recipe - Team Selection Menu]].
4. **Money and paycheck (1.5 h).** Core script below.

## Day 2 - tasks, a house and safety (about 5 hours)

1. **One task per job (2 h).**
   - Cook: a ProximityPrompt on the oven sets `player:SetAttribute("Delivering", houseName)` for a random house; the prompt at that house's door calls `didTask(player, 15)`.
   - Police: a prompt on a "patrol board" in 3 corners of town; visiting all 3 pays.
   - Doctor: a prompt on any player who is under 50 health heals them and pays.
   Each task calls `didTask`, which also marks the player as active.
2. **Buy a house (1.5 h).** A prompt on the house sign costs 200, sets `house:SetAttribute("Owner", player.UserId)`; the door's prompt only opens for the owner. Clear the owner when they leave. [[First Interaction with ProximityPrompt]].
3. **Chat and safety (1 h).** RP is chat-heavy: use TextChatService defaults, filter any player-typed sign or name text, and read [[Text Chat, Moderation and Player Safety]].
4. **Polish (30 min).** A sit on every bench and a radio in the square. [[Seat Entry with ProximityPrompt - No More Accidental Sits]].

## The core script: jobs, activity and paychecks

```lua
-- ModuleScript ServerScriptService/Jobs (a Script does require(script.Parent.Jobs) once)
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local RS = game:GetService("ReplicatedStorage")

local PAY = {Citizen = 5, Cook = 20, Police = 25, Doctor = 25}
local PAY_EVERY, ACTIVE_WINDOW = 60, 150
local lastTask = {}

Players.PlayerAdded:Connect(function(player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	stats.Parent = player
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 100
	money.Parent = stats
end)
Players.PlayerRemoving:Connect(function(p) lastTask[p] = nil end)

local choose = Instance.new("RemoteEvent")
choose.Name = "ChooseJob"
choose.Parent = RS
choose.OnServerEvent:Connect(function(player, jobName)
	local team = type(jobName) == "string" and PAY[jobName] and Teams:FindFirstChild(jobName)
	if team and player.Team ~= team then
		player.Team = team
		player:LoadCharacterAsync() -- respawn at the job's building
	end
end)

local function didTask(player, bonus)
	lastTask[player] = os.clock()
	player.leaderstats.Money.Value += bonus
end

task.spawn(function()
	while true do
		task.wait(PAY_EVERY)
		for _, player in Players:GetPlayers() do
			local jobName = player.Team and player.Team.Name
			local recent = lastTask[player] and os.clock() - lastTask[player] < ACTIVE_WINDOW
			if jobName == "Citizen" or (PAY[jobName] and recent) then
				player.leaderstats.Money.Value += PAY[jobName]
			end
		end
	end
end)

return {didTask = didTask} -- task scripts require this module and call didTask
```

Why the activity check: pay-for-standing-still turns every server into a field of AFK players, which hurts real roleplay and your session data. Citizens get a tiny basic income so new players are never stuck at 0. More options in [[Recipe - AFK Detection]]. Switching jobs respawns the player, which also stops someone carrying a pizza into the police station mid-task.

A ModuleScript runs once, the first time anything requires it, so the paycheck loop starts exactly once no matter how many task scripts use `didTask`. [[Starter - First ModuleScript and Code Organization]].

## What to cut when you run late

- Police and Doctor tasks: keep the jobs as roles with a paycheck only, and give Cook the one real task.
- House buying: make houses free and first-come, with a lock.
- Job menu GUI: use team-coloured spawn pads you step on.

## How to test

- [ ] Choose Cook, do nothing for 3 minutes: no paycheck after the first window.
- [ ] Deliver a pizza: +15 now and paychecks resume.
- [ ] Fire `ChooseJob("Admin")` from a client: ignored.
- [ ] Buy a house, let a friend try the door: it stays shut; leave, and the house becomes free.
- [ ] 8 players in **Server and Clients**: everyone spawns at their job building.

## Related
[[00 START HERE - Top G Vault]] - [[Roleplay and Life Sim Genre Breakdown - Roles, Props and Homes]] - [[World - Roleplay Schools and Hospitals]] - [[Ride - Roleplay Traffic Laws - Speed Zones, Parking Spots, Tickets and Impound]]
