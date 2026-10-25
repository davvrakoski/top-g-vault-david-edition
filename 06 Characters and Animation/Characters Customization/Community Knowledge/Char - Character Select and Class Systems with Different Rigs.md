---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Char - Character Select and Class Systems with Different Rigs"
tags: [roblox, community-knowledge, characters, class-system, character-select, spawning]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
---
# Char - Character Select and Class Systems with Different Rigs

Hero shooters, asymmetric horror (survivors vs killer) and class RPGs all start with a select screen, then spawn the player as a rig that may not even be their avatar: a different size, different animations, different abilities. The mistakes are predictable: the client decides the class (exploitable), the player spawns once as their avatar and then "pops" into the class rig, or animations break because the class rig has no `Animate` script.

## Flow that holds up

1. `Players.CharacterAutoLoads = false`, so nobody spawns before choosing.
2. Client shows the select screen with 3D previews (one `ViewportFrame` per class, see [[Character Preview in a ViewportFrame - WorldModel Pattern]]).
3. Client fires `RemoteEvent:FireServer(classId)` - just an id, nothing else.
4. Server validates: class exists, player owns/unlocked it, team limits ("max 1 killer"), not on cooldown.
5. Server builds the character, sets `player.Character`, and stores `player:SetAttribute("Class", classId)` for every other system to read.
6. On death, server respawns the **same class** (or reopens selection) instead of the default avatar.

## Two kinds of class

| Type | How to spawn | Keeps the player's avatar? |
|---|---|---|
| **Avatar-based class** (same R15 body, different gear/stats) | `player:LoadCharacterWithHumanoidDescription(desc)` with class clothing/accessories layered on a copy of the player's description | Yes, partly |
| **Fixed-rig class** (monster, robot, small creature) | Clone a prepared model from `ServerStorage.Classes`, name it `player.Name`, position it, then set `player.Character = model` and parent to `workspace` | No |

```lua
-- Server: fixed-rig class spawn (sketch)
local function spawnAsClass(player, classId, spawnCFrame)
	local template = ServerStorage.Classes:FindFirstChild(classId)
	if not template then return end
	local rig = template:Clone()
	rig.Name = player.Name
	rig:PivotTo(spawnCFrame)
	player.Character = rig
	rig.Parent = workspace
	player:SetAttribute("Class", classId)
end
```

The fixed-rig template must contain: `Humanoid` (with an `Animator`), `HumanoidRootPart` as `PrimaryPart`, working `Motor6D`s, and its own `Animate` LocalScript with that class's animation IDs. Without `Animate`, the rig slides around frozen. `StarterCharacterScripts` contents are copied into characters spawned this way only if you copy them yourself (check in your game; behaviour differs from `LoadCharacter`, unverified for every case), so keep class scripts inside the template.

## Class data in one place

Keep a `ModuleScript` table per class: `WalkSpeed`, `MaxHealth`, `JumpPower`, ability ids, camera offset, footstep set, animation ids. Server applies stats; client reads the same module for UI. Never trust stats sent by the client.

## UX details

- Show locked classes greyed with the unlock reason; do not hide them.
- Preview plays the class idle and one signature move in the viewport.
- Add a 10-15 s timer that auto-picks so one indecisive player cannot stall a round.
- Camera: different-sized rigs need a per-class `Humanoid.CameraOffset` and possibly a different `CameraMaxZoomDistance`.

## Pitfalls

- Setting `StarterPlayer.StarterCharacter` at runtime changes it for **everyone**; do not use it for per-player classes.
- Hit boxes: a giant monster rig with a tiny `HumanoidRootPart` gets odd collisions; size the root to the body.
- Tools: `StarterPack` items still land in the backpack; filter by class.

## Related
[[Characters Customization - Hub]] · [[Morphs and Character Swaps at Runtime]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]
