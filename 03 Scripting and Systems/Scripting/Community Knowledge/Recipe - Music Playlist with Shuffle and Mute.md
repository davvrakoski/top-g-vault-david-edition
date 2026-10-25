---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Music Playlist with Shuffle and Mute"
tags: [roblox, community-knowledge, scripting, recipe, luau, audio, music, playlist, soundgroup, ui]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Sound
  - https://create.roblox.com/docs/reference/engine/classes/SoundGroup
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/play-background-music
---
# Recipe - Music Playlist with Shuffle and Mute

Background music that plays a shuffled list of tracks back to back, never repeats the same song twice in a row, skips tracks that fail to load, and has a music on/off button. A single looping track ([[First Sound - Background Music and a Click Sound]]) gets old fast; a playlist is the usual next step. Music runs **on the client**: each player hears their own stream, and muting is a personal choice, so nothing here needs the server.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25). Uses the classic `Sound` object; the newer Audio API version is in [[Audio Mixing and Dynamic Music with the Audio API]].

## Where it goes
| Item | Type | Location |
|---|---|---|
| `MusicPlaylist` | ModuleScript | `ReplicatedStorage` |
| `MusicPlayer` | LocalScript | `StarterPlayer > StarterPlayerScripts` |

Track IDs must be audio the experience is allowed to play (your own uploads, or Creator Store audio marked for use). See [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]] and the license table in [[Free Music for Roblox Games - License Table]].

## Playlist data
```lua
-- ReplicatedStorage/MusicPlaylist (ModuleScript)
return {
	{ id = "rbxassetid://0", title = "Calm Lobby" },   -- replace 0 with your asset IDs
	{ id = "rbxassetid://0", title = "Night Drive" },
	{ id = "rbxassetid://0", title = "Boss Theme" },
}
```

## Player
```lua
-- StarterPlayerScripts/MusicPlayer (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local TRACKS = require(ReplicatedStorage:WaitForChild("MusicPlaylist"))
local MUSIC_VOLUME = 0.35   -- moderate start: never blast players
local GAP = 2               -- seconds of silence between songs
local LOAD_TIMEOUT = 10

local group = Instance.new("SoundGroup")
group.Name = "Music"
group.Volume = MUSIC_VOLUME
group.Parent = SoundService

local sound = Instance.new("Sound")
sound.Name = "MusicTrack"
sound.SoundGroup = group
sound.Volume = 1
sound.Parent = SoundService

local rng = Random.new()
local lastPlayed: string? = nil
local muted = false

local function waitLoaded(s: Sound, timeout: number): boolean
	if s.IsLoaded then return true end
	local done = false
	local conn = s.Loaded:Once(function() done = true end)
	local started = os.clock()
	while not done and os.clock() - started < timeout do
		task.wait(0.1)
	end
	conn:Disconnect()
	return done
end

local function newOrder()
	local order = table.clone(TRACKS)
	rng:Shuffle(order)
	-- avoid playing the same song twice across the reshuffle boundary
	if #order > 1 and order[1].id == lastPlayed then
		order[1], order[2] = order[2], order[1]
	end
	return order
end

-- UI: one toggle button
local gui = Instance.new("ScreenGui"); gui.Name = "MusicGui"; gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
local button = Instance.new("TextButton")
button.AnchorPoint = Vector2.new(0, 1)
button.Position = UDim2.new(0, 12, 1, -12)
button.Size = UDim2.fromOffset(140, 32)
button.Text = "Music: On"
button.Parent = gui
local nowPlaying = Instance.new("TextLabel")
nowPlaying.AnchorPoint = Vector2.new(0, 1)
nowPlaying.Position = UDim2.new(0, 160, 1, -12)
nowPlaying.Size = UDim2.fromOffset(240, 32)
nowPlaying.BackgroundTransparency = 1
nowPlaying.TextXAlignment = Enum.TextXAlignment.Left
nowPlaying.TextColor3 = Color3.new(1, 1, 1)
nowPlaying.Parent = gui

button.Activated:Connect(function()
	muted = not muted
	button.Text = if muted then "Music: Off" else "Music: On"
	-- fade the group, keep the track running so unmuting is instant
	TweenService:Create(group, TweenInfo.new(0.6), { Volume = if muted then 0 else MUSIC_VOLUME }):Play()
end)

-- main loop
task.spawn(function()
	if #TRACKS == 0 then return end
	while true do
		for _, track in newOrder() do
			sound.SoundId = track.id
			if waitLoaded(sound, LOAD_TIMEOUT) then
				lastPlayed = track.id
				nowPlaying.Text = "Now playing: " .. track.title
				sound.TimePosition = 0
				sound:Play()
				sound.Ended:Wait()
				task.wait(GAP)
			else
				warn("Music track failed to load, skipping:", track.id)
				task.wait(1)
			end
		end
	end
end)
```

## How to test
1. Put three real audio IDs in the playlist. Play: a track starts at moderate volume; its title shows bottom-left.
2. Temporarily set one entry to a wrong ID: the output warns and the next track starts after about 10 s, instead of the loop freezing.
3. Click the button: music fades out over 0.6 s; click again: it fades back in mid-song.
4. Let the list wrap around (use short test clips): the first song of the new round is never the last song of the previous one.
5. Two-player test: muting on one client does not affect the other.

## Common mistakes
- **Playing music from a server Script** in `Workspace`: everyone hears the same thing, mute buttons cannot work per player, and late joiners start mid-song.
- **`sound.Loaded:Wait()` with no timeout**: a deleted or private asset never loads and the playlist stops forever.
- **`Looped = true`** on a playlist track: `Ended` never fires.
- **Muting by `Stop()`**: resuming restarts the song. Fade the `SoundGroup` instead.
- **Surprise loud audio.** Start quiet, and remember the mute choice (store it per player, see [[Player Settings, Persistence and Device Profiles]]).

## Related
[[Scripting - Hub]] · [[First Sound - Background Music and a Click Sound]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Dynamic Music and Combat States]]
