---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Horror Audio - Silence, Room Reverb and Monster Cues"
tags: [roblox, community-knowledge, story, horror, audio, reverb, sound-design]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/resources/beyond-the-dark/sound-design
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://create.roblox.com/docs/reference/engine/classes/AudioReverb
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
  - https://www.gamedeveloper.com/design/the-time-and-place-for-jump-scares-according-to-horror-devs
---
# Horror Audio - Silence, Room Reverb and Monster Cues

In horror, sound does more of the scaring than visuals do. Players cannot see in the dark but they can always hear, and the brain fills unknown sounds with the worst option. On Roblox, sound also covers for limited graphics on phones. This note covers horror-specific use of three tools: **silence and contrast**, **room-shaped reverb**, and **monster cues players can learn**. General Roblox mixing, zones and attenuation curves are in [[Audio Zones, Occlusion and Mixing]] and [[Ambient Soundscapes - Loop Beds and Random One-Shots]].

## 1. Silence is a sound

- **Quiet before a scare.** Duck the ambient bed by 6-10 dB over 2-3 s before a startle. The drop is the warning that makes the hit land. Red Barrels' Philippe Morin (Outlast) said in a Game Developer roundup that the build-up matters more than the scream itself.
- **Silence as information.** When the monster is near, cut the insects, the hum, the clock. Players learn "the world went quiet = danger" without a UI.
- **Never total silence for long.** Keep a near-inaudible room tone so players do not think the game has broken or muted.
- **Safe room contrast.** A warm, musical bed in safe rooms makes the return to the dry, quiet corridor feel cold.

Roblox's *Beyond the Dark* sample used a 2D "omnipresent soundbed" plus 3D **spot ambiences** on objects to pull the ear around, and **sidechain compression**: local sounds duck the generic bed so each area feels fresh. The same structure works for horror: a low drone bed, then spot sounds (a dripping pipe, a buzzing light) that duck the bed as you approach.

## 2. Room-shaped reverb

Reverb tells players how big and how hard a space is, which changes how scared they feel. A tight bathroom reverb feels claustrophobic; a long cave tail feels exposed.

**Legacy Sound objects:** set `SoundService.AmbientReverb` to an `Enum.ReverbType` preset when the player enters a room: `Bathroom`, `StoneCorridor`, `Hallway`, `Cave`, `SewerPipe`, `Hangar`, `Padded`, `NoReverb`. These map to FMOD presets. For a single sound, add a `ReverbSoundEffect` (`DecayTime`, `Density`, `Diffusion`, `DryLevel`, `WetLevel`).

**Audio API:** wire an `AudioReverb` into your bus (properties include `DecayTime`, `Density`, `Diffusion`, `DryLevel`, `WetLevel`, `EarlyDelayTime`, `LateDelayTime`). Change its values per zone with a short tween.

| Space | Feel | Starting point |
|---|---|---|
| Small closet / locker | Breath feels loud | `Padded` or short decay (0.3 s), high wet |
| Tiled bathroom | Hard, sharp | `Bathroom` |
| Long corridor | Footsteps chase you | `StoneCorridor` / `Hallway` |
| Basement, mine | Huge, unknown | `Cave`, decay 3-5 s |

```lua
-- client: swap ambient reverb per room zone
local SoundService = game:GetService("SoundService")
local function onRoomEntered(room)
	local preset = room:GetAttribute("Reverb") -- e.g. "StoneCorridor"
	SoundService.AmbientReverb = Enum.ReverbType[preset] or Enum.ReverbType.NoReverb
end
```

## 3. Monster cues players can learn

Alien: Isolation's alien heard footsteps (walking vs running) and gunshots; its motion tracker beeped when the alien was near. The lesson for any stalker: **sound is a two-way contract**. The player's noise draws the monster, and the monster's noise warns the player.

- **Signature sound per threat.** Each monster gets one unique, repeated cue (a hum, a giggle, chains). Teach it once in a safe context; afterwards the sound alone is a scare.
- **Distance tiers.** Far (40+ studs): low, muffled, reverb-heavy. Near (15-40): clear footsteps. Very near (<15): breathing, cloth, a filter opening up. Use a `Sound` with `RollOffMaxDistance` about 80, or an `AudioEmitter` distance curve.
- **Occlusion.** A monster behind a wall should sound muffled: lower the high frequencies (an `EqualizerSoundEffect`, or `AudioFilter` with `FilterType` low-pass) when a ray from the listener to the monster hits geometry.
- **Footstep honesty.** If the monster is moving, its footsteps play. Silent stalking is fine only as a special, telegraphed ability.
- **Player noise feedback.** Show or play what the monster heard (a sprint makes your own footsteps louder and echo more), so players connect "I ran" with "it came".

## Pitfalls

- **Global music for the monster** (a chase theme for everyone when one player is chased) gives away the monster to all players and stops direction from reading. Play chase music only on the chased player's client.
- **Too many random one-shots.** Every random creak teaches players that sounds mean nothing. Keep random sounds rare and quiet; make meaningful sounds distinct.
- **Mobile speakers** lose bass. Make sure monster cues have mid and high content, not just rumble.
- **Loud stings.** Keep them within normal peak loudness ([[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]]).

## Related
[[Story Quests Cinematics - Hub]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]] · [[Horror Starter Architecture]]
