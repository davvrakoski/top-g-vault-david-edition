---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes"
tags: [roblox, community-knowledge, story, co-op, checkpoints, respawn, horror]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://cdn.fastly.steamstatic.com/apps/valve/2009/ai_systems_of_l4d_mike_booth.pdf
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
---
# Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes

Single-player checkpoint rules break in co-op. If a dead player respawns at the start, they are out of the story for ten minutes. If they respawn next to the party instantly, death means nothing and horror stops being scary. If the party wipes, do they restart the chapter, the room, or the run? Roblox makes this sharper because players join and leave mid-run. This note gives a small rule set for **respawn, catch-up and wipes** in co-op story and horror games.

## Pick a death model (one per mode)

| Model | On death | Fits | Example feel |
|---|---|---|---|
| **Out until checkpoint** | Spectate; respawn when the party reaches the next safe room | Tense horror | "Get to the next room and I'm back" |
| **Rescue** | Respawn in a spot teammates must open (a cage, a closet) | Co-op adventure | Left 4 Dead's **rescue closets** (named in Booth's L4D AI talk) |
| **Timed respawn** | Respawn after N seconds at the party's last checkpoint | Casual, younger audiences | Low stress |
| **One life** | Out for the run | Hardcore mode only | DOORS-style roguelite runs |

Show the rule on screen when a player dies ("You'll return at the next safe room"). Uncertainty is what makes spectating feel like punishment.

## Checkpoints are per party, not per player

Track the **furthest safe room the party has reached** on the server. Every respawn uses it.

```lua
-- Server: party checkpoint
local Players = game:GetService("Players")
local partyCheckpoint: SpawnLocation? = nil

local function reachCheckpoint(spawn: SpawnLocation)
	partyCheckpoint = spawn
	for _, p in Players:GetPlayers() do
		p.RespawnLocation = spawn
	end
end

Players.PlayerAdded:Connect(function(p)
	if partyCheckpoint then p.RespawnLocation = partyCheckpoint end -- late joiners
end)
```

`Player.RespawnLocation` must point at a `SpawnLocation` the player is allowed to use (`Neutral = true`, or matching team). For the "out until checkpoint" model, set `Players.CharacterAutoLoads = false` and call `player:LoadCharacter()` yourself when the party reaches the next safe room.

## Measuring "behind": flow distance

Left 4 Dead's director used **flow distance**: travel distance from the starting safe room to every area of the map, so the game can tell whether a spot is ahead of or behind the group. On Roblox, a cheap version is a numbered chain of **progress markers** (parts tagged `Progress` with an `Order` attribute). Each player's progress is the highest marker they have passed.

Uses:

- **Catch-up:** if a player is more than 2 markers behind the party (just joined, got lost), offer a teleport to the party's checkpoint, or have a companion NPC lead them.
- **Spawning threats** ahead of the group, never behind the stragglers.
- **Hints** go to the player furthest behind ([[Story - Puzzle Hint Systems - Tiered Nudges, Timers and Diegetic Clues]]).

## Doors that wait (and do not wait forever)

Story beats often need the group together. A **gather door** opens when everyone alive is inside its zone, but:

- start a 30-45 s countdown once the first player arrives; then it opens or closes anyway;
- teleport anyone left behind to the inside spawn when it closes, so nobody is softlocked outside;
- never count AFK players: if a player has not moved for 2 minutes, drop them from the "everyone" count.

## Party wipes

When every player is dead or out:

1. **Short fade** (1-2 s) and a clear message.
2. Restart at the **party checkpoint**, not the chapter start, unless the mode is one-life.
3. **Reset the threat state** (monster back to its spawn, director to Relax) and put used one-shot scares back, so the retry is fair. Keep puzzle progress already made before the checkpoint.
4. After 2-3 wipes in the same section, quietly ease off: slower monster, an extra battery. Tell no one; it reads as luck.

## Leaving and joining

- A leaving player's **key items drop** where they were, or return to their spawn ([[Story - Puzzle Dependency Charts - Keys, Locks and Gates]]).
- A joining player spawns at the party checkpoint with a **recap line** ("Find the fuse to restore power").
- If the host leaves a private run, pass host to the next player rather than ending the run.

## Pitfalls

- **Spawn camping:** the monster waits at the checkpoint. Give 3-5 s spawn protection and keep monster pathing out of safe rooms ([[Story - Safe Rooms - Relief, Save Points and Their Rules]]).
- **Respawning inside a cutscene.** Delay respawns until a group cutscene ends.
- **Checkpoint regression:** one player touching an older safe room should not move the party checkpoint backwards. Only advance it.

## Related
[[Story Quests Cinematics - Hub]] · [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] · [[Case Study - DOORS]] · [[Quest Objective Framework]]
