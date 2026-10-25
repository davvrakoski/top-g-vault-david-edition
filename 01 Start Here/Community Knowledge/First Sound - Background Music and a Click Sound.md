---
area: "01 Start Here"
cluster: "Start Here"
title: "First Sound - Background Music and a Click Sound"
tags: [roblox, community-knowledge, start-here, audio, sound, music]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/play-background-music
  - https://create.roblox.com/docs/sound/objects
  - https://create.roblox.com/docs/audio
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
---
# First Sound - Background Music and a Click Sound

Sound is the cheapest polish there is: a soft music loop, a click on buttons and a "ding" on coin pickup make a beginner game feel finished. Roblox has two audio systems: the classic **Sound** object (simple, perfect for a first game) and the newer **Audio API** (AudioPlayer, AudioEmitter, wires) for advanced mixing. This note uses Sound objects for the three sounds every first game needs.

## Where a Sound lives decides how it plays

| Parent | Behaviour | Use for |
| --- | --- | --- |
| `SoundService` (or Workspace itself) | Same volume everywhere | Music, UI sounds |
| A Part or Attachment | Comes from that point, fades with distance | Waterfalls, machines, footsteps |
| Inside a player's GUI or played with `PlayLocalSound` | Only that player hears it | Button clicks |

Positional fade is controlled by `RollOffMinDistance`, `RollOffMaxDistance` and `RollOffMode` on the Sound.

## Get an audio ID

- **Toolbox > Creator Store > Audio** has a large library of free-to-use, professionally produced tracks and effects. Preview, then copy the asset ID.
- Or upload your own (only audio you have rights to). Upload rules and privacy are in [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]].
- IDs go in `SoundId` as `rbxassetid://123456789`.

## 1. Background music (2 minutes)

1. In **SoundService**, insert a **Sound** named `BackgroundMusic`.
2. Paste the ID into `SoundId`; press the preview button to check it.
3. Set `Looped = true` and `Volume` around `0.25` (most tracks are mastered loud).
4. In **StarterPlayer > StarterPlayerScripts**, add a LocalScript:

```lua
local SoundService = game:GetService("SoundService")
local music = SoundService:WaitForChild("BackgroundMusic")
music:Play()
```

Playing from a LocalScript means each player controls their own music, which makes a mute button easy:

```lua
muteButton.Activated:Connect(function()
	music.Playing = not music.Playing
end)
```

(Shortcut: ticking `Playing` in Properties also starts a sound when the game runs, no script needed.)

## 2. Click sound for buttons

Put a short `Click` Sound in SoundService, then in your button's LocalScript:

```lua
local SoundService = game:GetService("SoundService")
local click = SoundService:WaitForChild("Click")
button.Activated:Connect(function()
	SoundService:PlayLocalSound(click)
end)
```

`PlayLocalSound` plays it for this player only, without moving the Sound object.

## 3. A 3D sound on pickup

Server-side coin script; the sound is a child of the coin part:

```lua
local coin = script.Parent
local ding = coin:WaitForChild("Ding")
coin.Touched:Connect(function(hit)
	if not game:GetService("Players"):GetPlayerFromCharacter(hit.Parent) then return end
	coin.Transparency = 1
	coin.CanTouch = false
	ding:Play()
	ding.Ended:Wait() -- let the sound finish before deleting its parent
	coin:Destroy()
end)
```

Destroying the part instantly would cut the sound off, which is a common beginner surprise.

## Simple mixing rules

- Music quieter than effects; effects that carry gameplay information (hits, warnings) loudest.
- Group sounds with **SoundGroups** (Music, SFX, UI) so a settings menu can change each group's volume.
- Avoid stacking: the same effect fired 20 times a second becomes noise; add a short cooldown.
- Never surprise players with sudden very loud sounds; ramp volume up.

## When to try the Audio API

The newer objects (AudioPlayer to load audio, AudioEmitter/AudioListener for 3D, AudioDeviceOutput for speakers, connected by Wires, plus text-to-speech and speech-to-text) suit games that need effects chains or voice processing. Start with Sound; move later: [[Audio Mixing and Dynamic Music with the Audio API]].

## Pitfalls

- Sound does not play: wrong ID format (needs `rbxassetid://`), the asset is private to someone else, or the Sound is in `ServerStorage`.
- Music plays twice: you set `Playing = true` in Properties **and** call `:Play()` in a script.
- Heard by everyone when it should be local: it was played from a server Script.

## Related
[[00 START HERE - Top G Vault]] · [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]] · [[Audio Mixing Playbook]] · [[First GUI Button - ScreenGui, TextButton and Activated]] · [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Play background music|Play background music (official)]]
