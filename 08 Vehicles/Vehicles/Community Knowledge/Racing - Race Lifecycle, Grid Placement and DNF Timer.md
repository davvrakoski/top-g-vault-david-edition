---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Race Lifecycle, Grid Placement and DNF Timer"
tags: [roblox, community-knowledge, vehicles, racing, game-loop, state-machine]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance
  - https://devforum.roblox.com/t/what-is-the-best-way-for-me-to-make-racing-a-thing-in-my-driving-game/638353
  - https://devforum.roblox.com/t/how-to-make-this-laps-checkpoints-and-rewarding-system-more-reliable/1123316
---
# Racing - Race Lifecycle, Grid Placement and DNF Timer

Most broken Roblox racers are not broken in the driving; they are broken in the *flow*: a player leaves mid-countdown and the race never starts, the last car is stuck on a wall so nobody can leave the results screen, or late joiners spawn on the grid during a race. A small explicit state machine on the server fixes all of these. The synced countdown itself is covered in [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]]; this note is everything around it.

## The states

```
Intermission -> Voting -> Gridding -> Countdown -> Racing -> Finishing -> Results -> Intermission
```

| State | Ends when | Typical length |
|---|---|---|
| Intermission | Enough players ready (e.g. 2+) | 10-20 s |
| Voting | Timer runs out | 10 s |
| Gridding | All cars placed and settled | 1-2 s |
| Countdown | `raceStart` server time reached | 3-4 s |
| Racing | First finisher crosses the line | Track-dependent |
| Finishing (DNF timer) | All finished, or timer expires | 20-30 s |
| Results | Timer | 8-10 s |

Keep the state in one `StringValue` or a `Workspace` attribute (`RaceState`) plus a `StateEndsAt` server time, so every client UI can show the right screen and a timer without extra remotes.

```lua
local function setState(name: string, duration: number?)
	workspace:SetAttribute("RaceState", name)
	workspace:SetAttribute("StateEndsAt", duration and (workspace:GetServerTimeNow() + duration) or 0)
end
```

## Grid placement

Author one `GridSlots` folder of anchored, invisible parts (slot 1 = pole) whose `CFrame` faces down the track. Generating slots in code is also easy: two columns, 12-16 studs between rows, columns offset by half a row (staggered grid) so cars do not block each other's launch.

Grid order options, pick one per mode:

- **Join order or random**: casual servers. Shuffle with `Random.new()` so it is not always the same player on pole.
- **Reverse finishing order of last race**: keeps a series lively; the winner starts at the back.
- **Qualifying / time trial**: sort by best lap from a short warm-up lap or the player's saved PB.
- **Skill rating**: slower players in front for casual modes.

Place cars with `Model:PivotTo(slot.CFrame * CFrame.new(0, height, 0))` and zero both `AssemblyLinearVelocity` and `AssemblyAngularVelocity`. Give the physics 0.5-1 s to settle (wheels land) before the countdown starts, otherwise the first frame of the race begins with a bounce.

## Edge cases the state machine must handle

- **Player leaves during Gridding/Countdown**: remove their slot, keep going if at least one racer remains.
- **Everyone leaves during Racing**: jump straight to Intermission.
- **Late joiners**: never place them on the grid; make them spectators with a camera on the leader, or let them free-roam the lobby.
- **Car destroyed / player resets character**: respawn the car at the last gate rather than removing them from the race.
- **Results with DNFs**: show finishers by time, then DNFs sorted by progress (laps + gates).

## The DNF timer

When the first car finishes, start a 20-30 s "Finishing" timer and show it on every HUD. Anyone not finished when it ends is DNF. Without this, one AFK player holds the whole server hostage. Scale it: `timer = clamp(winnerTime * 0.25, 15, 45)` keeps short tracks short.

Also run an **AFK check** during Racing: no progress gained for 30 s means the player is moved to spectate and counted DNF.

## Rewards

Pay out on entering Results, from server data only (finish position, time, clean-race bonus). Pay a small participation reward to DNFs so leaving early is never better than finishing last.

## Checklist

- [ ] One server-owned state with an end time attribute.
- [ ] Grid slots face down the track, staggered, cars settled before countdown.
- [ ] Clear rule for grid order per mode.
- [ ] Leavers, late joiners and AFK handled.
- [ ] DNF timer starts at first finish.

## Related
[[Vehicles - Hub]] · [[Lobby and Round System Blueprint]] · [[Racing Starter Architecture]] · [[Racing - Track Progress, Wrong-Way Detection and Live Positions]]
