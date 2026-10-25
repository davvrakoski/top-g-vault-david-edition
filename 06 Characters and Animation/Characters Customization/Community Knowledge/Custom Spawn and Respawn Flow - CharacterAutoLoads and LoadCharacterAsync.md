---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync"
tags: [roblox, community-knowledge, characters, spawning, respawn, rounds]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
---
# Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync

The default flow (join, spawn at a SpawnLocation, die, wait 5 seconds, respawn) suits obbies and hangouts. Round-based games, class selection screens, death cams and "spectate until next round" all need you to take control of when characters appear. The switch is `Players.CharacterAutoLoads`; after that, your server code decides when to call `Player:LoadCharacterAsync()` and with what appearance.

## The knobs

| API | What it does |
| --- | --- |
| `Players.RespawnTime` | Seconds before auto-respawn (default 5.0). Only matters while `CharacterAutoLoads` is true. |
| `Players.CharacterAutoLoads` | Default true. When false, nobody spawns, not even on join, until you load them. |
| `Player:LoadCharacterAsync()` | Spawns (or respawns) a character now, with the player's avatar. Replaces the older `LoadCharacter`. |
| `Player:LoadCharacterWithHumanoidDescriptionAsync(desc)` | Spawns with a given look (class outfits, disguises). |
| `Player.CharacterAdded` / `CharacterAppearanceLoaded` | Fire when the model exists / when the avatar finished loading. |
| `Humanoid.Died` | Start your death flow here. |

## A round-based skeleton

```lua
local Players = game:GetService("Players")
Players.CharacterAutoLoads = false

local function spawnPlayer(player: Player, loadout)
	if loadout and loadout.description then
		player:LoadCharacterWithHumanoidDescriptionAsync(loadout.description)
	else
		player:LoadCharacterAsync()
	end
end

Players.PlayerAdded:Connect(function(player)
	-- show the menu first; spawn when they press Play (RemoteEvent)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.Died:Connect(function()
			task.wait(3) -- death cam time
			if RoundIsActive() and PlayerHasLives(player) then
				spawnPlayer(player, GetLoadout(player))
			end -- otherwise they spectate until the next round
		end)
	end)
end)
```

`RoundIsActive`, `PlayerHasLives` and `GetLoadout` stand for your own game logic.

## Choosing where they spawn

- Place `SpawnLocation`s per team (`TeamColor` + `Neutral = false`), and the engine picks one for that team.
- For full control, spawn normally, then `character:PivotTo(chosenCFrame)` immediately in `CharacterAdded` (after the root part exists). Add a small Y offset so feet do not clip into the floor.
- Spawn protection: give a short `ForceField` (a `SpawnLocation` has `Duration`) or your own invulnerable attribute.

## Death cam and spectate

- On `Died`, set the client's `Camera.CameraSubject` to the killer's humanoid or the ragdoll, via a RemoteEvent.
- While waiting, keep the player without a character; the camera stays where it was, so move it to a lobby view or a spectate target.
- Show a countdown that matches your server wait; do not let the client decide the timer.

## Things that break on custom respawn

- **Scripts in StarterCharacterScripts** only run when a character exists; menu code must live in `StarterPlayerScripts` or `StarterGui` (with `ResetOnSpawn` considered).
- **Leaderstats and tools**: Backpack contents reset each spawn; re-grant loadout tools in `CharacterAdded`.
- **Joining mid-round**: with auto-load off, late joiners sit in the menu until you spawn them; make sure your round code handles them.
- **Studio Play Solo** starts the same way; if nothing spawns in testing, you forgot the menu's Play button path.

## Checklist

- [ ] `CharacterAutoLoads` off, every spawn path calls `LoadCharacterAsync`
- [ ] Death flow on `Humanoid.Died`, timer owned by the server
- [ ] Spawn position chosen on the server, with protection
- [ ] Loadout and appearance re-applied every spawn
- [ ] Late-join and leave-mid-round tested

## Related
[[Characters Customization - Hub]] · [[Loading and Spawn Pipeline Blueprint]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] · [[Ragdoll Death with BallSocketConstraints]]
