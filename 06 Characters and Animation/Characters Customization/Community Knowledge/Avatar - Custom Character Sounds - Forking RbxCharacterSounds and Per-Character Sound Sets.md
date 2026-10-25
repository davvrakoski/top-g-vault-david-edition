---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - Custom Character Sounds - Forking RbxCharacterSounds and Per-Character Sound Sets"
tags: [roblox, community-knowledge, avatar, audio, character-sounds, morphs]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StarterCharacterScripts
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://devforum.roblox.com/t/custom-character-death-sound/740743
  - https://devforum.roblox.com/t/how-do-i-remove-the-oof-sound/574922
  - https://devforum.roblox.com/t/replacing-footstep-sounds/1636576
  - https://devforum.roblox.com/t/is-it-possible-to-create-unique-player-morphs-sounds-using-the-rbxcharactersounds/3982710
---
# Avatar - Custom Character Sounds - Forking RbxCharacterSounds and Per-Character Sound Sets

Every Roblox character makes the same jump, land, run, swim and death sounds out of the box. A robot class that lands with a metal clank, a monster morph that growls when it dies, or a horror game where the default cartoony jump sound is gone: these all need you to take over the character sound script. There are two supported hooks and one common community fork.

## The three ways in

| Way | What it does | Use when |
|---|---|---|
| A `LocalScript` named `Sound` in `StarterCharacterScripts` | The official reference says a script with this name replaces the default character sound script | You want to write your own sound logic from scratch |
| Fork `RbxCharacterSounds` | Copy the default script (in `StarterPlayerScripts` during a play session) into `StarterPlayerScripts`, keep the name, edit its sound table | You only want new IDs or volumes |
| Blank `RbxCharacterSounds` | An empty LocalScript with that name in `StarterPlayerScripts` | You want silence and will play everything yourself |

The forking steps that DevForum users describe: press Play, find `RbxCharacterSounds` under your `PlayerScripts` (copied from `StarterPlayerScripts`), copy it, stop, paste into `StarterPlayerScripts`, then edit. The script holds a table with one entry per action (for example `Died`, with `SoundId` and `Volume` fields); check your own copy for the full list of entries, which follows the Humanoid states.

## Muting one sound properly

To silence a single sound (the classic death "oof"), set that entry's `Volume = 0` instead of blanking the `SoundId`. A DevForum answer notes an empty or zero ID logs warnings in the output.

## Per-character sound sets (morphs and classes)

A plain fork gives every character the same sounds. For classes and morphs, make the fork read a sound set from the character:

1. The server tags the character: `character:SetAttribute("SoundSet", "Robot")`.
2. A `SoundSets` ModuleScript in `ReplicatedStorage` maps set names to IDs per action.
3. In your forked script, where it builds the sounds for a character, look up `character:GetAttribute("SoundSet")` and use that set's IDs, falling back to defaults.
4. Listen for `GetAttributeChangedSignal("SoundSet")` if a player can morph without respawning, and rebuild that character's sounds.

```lua
-- ReplicatedStorage.SoundSets
-- Keys must match the entry names in YOUR forked script's sound table.
return {
	Default = {},                                   -- empty = keep built-in IDs
	Robot = {
		Jumping = { SoundId = "rbxassetid://ROBOT_JUMP", Volume = 0.6 },
		Landing = { SoundId = "rbxassetid://ROBOT_CLANK", Volume = 0.7 },
		Died    = { SoundId = "rbxassetid://ROBOT_SHUTDOWN", Volume = 0.8 },
	},
}
```

Because the script runs on each client for every character, everyone hears the right set without the server playing anything.

## Footsteps by material

The default running sound is one loop for all floors. For per-material footsteps, mute or remove the running entry and drive footsteps from walk-clip markers plus `Humanoid.FloorMaterial` (see the material-based footsteps note). That also fixes footsteps that keep playing while sliding.

## Keep after engine updates

A forked script no longer receives Roblox's fixes to the default. Re-copy the latest default every few months, re-apply your changes (keep them small and in one place, like the `SoundSets` module), and retest jump, land, swim, climb and death.

## Pitfalls

- Name typo (`RBXCharacterSounds`): the default still loads and you hear both.
- Loud custom death or impact sounds: normalise volume; sudden loud sounds are a common player complaint.
- Sounds parented to the character are destroyed with it; long death sounds can cut off on respawn. Play long ones from a part that outlives the character.

## Related
[[Characters Customization - Hub]] · [[Material-Based Footsteps - FloorMaterial and Animation Markers]] · [[Morphs and Character Swaps at Runtime]] · [[Footsteps and Surface Audio]]
