---
area: "12 UI Audio and Camera"
cluster: "Audio"
tags: [deep-dive, roblox, audio, mixing, dynamic-music, audio-api, soundgroup]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Audio Mixing and Dynamic Music with the Audio API

## Why this matters
Roblox now has two audio systems. The legacy `Sound` / `SoundGroup` / `SoundEffect` objects are officially **discouraged** in favour of the modular Audio API (`AudioPlayer`, `AudioFader`, `AudioEmitter`, `Wire`...). Most tutorials online still teach the old one.
A clean mix bus, player-controlled volume sliders, dialogue ducking and music that reacts to gameplay are the difference between "noisy Roblox game" and "polished game", and they are much easier to build with the new graph.

---

## 1. The new model in one minute

Every Audio API object either **produces**, **modifies**, **consumes** or **carries** audio (Creator Docs › Audio objects):

| Role | Objects |
|---|---|
| Produce | `AudioPlayer` (asset playback), `AudioDeviceInput` (microphone), `AudioTextToSpeech` |
| Modify | `AudioFader`, `AudioCompressor`, `AudioEqualizer`, `AudioReverb`, `AudioFilter`, and more |
| Analyze | `AudioAnalyzer` (`PeakLevel`, `RmsLevel`, optional spectrum) |
| Consume | `AudioEmitter` (3D speaker), `AudioListener` (3D microphone), `AudioDeviceOutput` (the player's speakers/headphones), `AudioSpeechToText` |
| Carry | `Wire` (`SourceInstance` → `TargetInstance`; `SourceName`/`TargetName` pick pins) |

- **2D audio** (music, UI): `AudioPlayer` → `Wire` → `AudioDeviceOutput`.
- **3D audio** (world sounds): `AudioPlayer` → `Wire` → `AudioEmitter` (in a part) … `AudioListener` → `Wire` → `AudioDeviceOutput`.
- `SoundService.DefaultListenerLocation` (`Default`, `None`, `Character`, `Camera`) creates the listener for you. With `Character` or `Camera`, the engine also creates an `AudioDeviceOutput` under SoundService at runtime.

Use `AudioPlayer.Asset` (string such as `"rbxassetid://123"`) or `AudioContent` to set the sound. `AssetId` is **deprecated**.

---

## 2. A mix bus architecture players can control

```
 Music stems ──► [Fader: Music_Layer_*] ──►┐
                                            ├─► [Fader: Bus_Music] ─► [Compressor: Duck] ─► [Fader: Master] ─► DeviceOutput
 UI sounds ───► [Fader: Bus_UI] ───────────────────────────────────────────────────────────►┤
 Dialogue ────► [Fader: Bus_Dialogue] ──────────────────────────────────────────────────────►┤
                           └──────────── Wire (TargetName = "Sidechain") ───► [Compressor: Duck]
 3D SFX ─► Emitters … Listener ─► [Fader: Bus_SFX] ─────────────────────────────────────────►┘
```

- An `AudioFader` is your **bus**: its `Volume` (0–10) multiplies everything wired into it.
- Several wires can feed one input, so a bus mixes many sources.
- **Ducking:** `AudioCompressor` has an **Input** pin and a **Sidechain** pin. Connect the dialogue bus to the compressor with a Wire whose `TargetName = "Sidechain"`, and music gets compressed (ducked) whenever dialogue plays.
- Build the graph **on the client** (LocalScript). Each player then has an independent mix and volume settings never affect anyone else.

### Building the bus graph in code

```lua
-- StarterPlayerScripts/AudioMix.client.luau
local SoundService = game:GetService("SoundService")

local root = Instance.new("Folder")
root.Name = "Mix"
root.Parent = SoundService

local function fader(name: string, volume: number): AudioFader
	local f = Instance.new("AudioFader")
	f.Name = name
	f.Volume = volume
	f.Parent = root
	return f
end

local function wire(from: Instance, to: Instance, targetPin: string?)
	local w = Instance.new("Wire")
	w.SourceInstance = from
	w.TargetInstance = to
	if targetPin then
		w.TargetName = targetPin
	end
	w.Parent = to
	return w
end

local output = Instance.new("AudioDeviceOutput")
output.Parent = root

local master = fader("Master", 1)
local busMusic = fader("Bus_Music", 0.6)
local busUI = fader("Bus_UI", 0.8)
local busDialogue = fader("Bus_Dialogue", 1)

local duck = Instance.new("AudioCompressor")
duck.Name = "Duck_Music"
-- Starting values to tune by ear. API ranges: Threshold -60..0 dB, Ratio 1..50,
-- Attack 0.0001..0.5 s, Release 0.01..5 s
duck.Threshold = -20
duck.Ratio = 4
duck.Attack = 0.01
duck.Release = 0.35
duck.Parent = root

wire(busMusic, duck)                      -- music into compressor Input
wire(busDialogue, duck, "Sidechain")      -- dialogue triggers the ducking
wire(duck, master)
wire(busUI, master)
wire(busDialogue, master)
wire(master, output)

return {
	Master = master, Music = busMusic, UI = busUI, Dialogue = busDialogue,
	Wire = wire,
}
```

Connect player settings sliders to `Master.Volume`, `Bus_Music.Volume` and so on, and persist them (see [[Player Settings, Persistence and Device Profiles]]).

For **3D SFX**, wire your `AudioListener` (the one Roblox creates, or your own) into `Bus_SFX` instead of straight to the output, so the SFX slider works too.

---

## 3. Dynamic music: two techniques

### Vertical layering (stems)
All stems (drums, bass, pads, lead) are the same length and tempo. They play **together, in sync**, and gameplay changes which layers are audible.

```lua
-- Client: layered music controller using the Mix module above
local TweenService = game:GetService("TweenService")
local Mix = require(script.Parent.AudioMix)

local STEMS = { -- replace with your own uploaded, licensed stems
	Base   = "rbxassetid://0",
	Drums  = "rbxassetid://0",
	Danger = "rbxassetid://0",
}

local layers: {[string]: AudioFader} = {}
local players: {AudioPlayer} = {}

for name, asset in STEMS do
	local p = Instance.new("AudioPlayer")
	p.Name = "Stem_" .. name
	p.Asset = asset
	p.Looping = true
	p.Parent = Mix.Music
	local f = Instance.new("AudioFader")
	f.Name = "Layer_" .. name
	f.Volume = if name == "Base" then 1 else 0
	f.Parent = Mix.Music
	Mix.Wire(p, f)
	Mix.Wire(f, Mix.Music)
	layers[name] = f
	table.insert(players, p)
end

-- Start every stem at the same moment, only once all are ready
task.spawn(function()
	for _, p in players do
		while not p.IsReady do task.wait() end
	end
	for _, p in players do
		p.TimePosition = 0
		p:Play()
	end
end)

local function setLayer(name: string, target: number, seconds: number?)
	TweenService:Create(layers[name], TweenInfo.new(seconds or 1.5), { Volume = target }):Play()
end

-- Example states
local Music = {}
function Music.explore() setLayer("Drums", 0); setLayer("Danger", 0) end
function Music.action()  setLayer("Drums", 1); setLayer("Danger", 0) end
function Music.boss()    setLayer("Drums", 1); setLayer("Danger", 1, 0.5) end
return Music
```

Keep stems **sample-accurate in length**. Small length differences drift out of sync on long loops. Re-sync (reset `TimePosition` on every stem) at a musical boundary if you notice drift.

### Horizontal re-sequencing (crossfade between tracks)
Different tracks per zone or state; crossfade on change:

```lua
local function crossfade(fromPlayer: AudioPlayer, fromFader: AudioFader,
	toPlayer: AudioPlayer, toFader: AudioFader, seconds: number)
	toFader.Volume = 0
	toPlayer.TimePosition = 0
	toPlayer:Play()
	TweenService:Create(toFader, TweenInfo.new(seconds), { Volume = 1 }):Play()
	local out = TweenService:Create(fromFader, TweenInfo.new(seconds), { Volume = 0 })
	out.Completed:Once(function()
		fromPlayer:Stop() -- stop the old track only once it is silent
	end)
	out:Play()
end
```

### What should drive the music state
- **Zones:** region checks on the client (cheap distance or region tests every 0.25–0.5 s, not every frame).
- **Combat:** a server-replicated attribute such as `player:SetAttribute("InCombat", true)` with a hold time so music doesn't flicker.
- **Events:** server broadcasts ("BossSpawned") via a RemoteEvent.
- Add **hysteresis**: enter a state immediately, leave it only after N seconds without the trigger.

---

## 4. Effects you'll actually use

| Effect | Use |
|---|---|
| `AudioEqualizer` (`LowGain`, `MidGain`, `HighGain`, `MidRange`) | Muffle music when a menu opens or the player is underwater |
| `AudioReverb` | Caves and halls; put one on the SFX path per zone type |
| `AudioFilter` (`FilterType`, `Frequency`, `Q`) | Low-pass "through the wall" sounds; radio voice |
| `AudioCompressor` | Ducking, taming loud SFX |
| `AudioAnalyzer` | Drive UI or lights from the music's `RmsLevel` (beat-reactive visuals) |

Every effect has `Bypass`. Toggle it rather than rewiring.

---

## 5. If you're still on legacy Sound / SoundGroup

The legacy system still works and many games use it:
- Create `SoundGroup`s under `SoundService` (`Music`, `SFX`, `UI`) and **assign** each `Sound.SoundGroup`. Groups don't work by parenting; the property assignment is what counts.
- `SoundGroup.Volume` is a 0–10 multiplier; nested groups multiply.
- Ducking: `CompressorSoundEffect` on the low-priority group with `SideChain` pointing at the high-priority Sound/SoundGroup, then tune `Threshold`, `Attack`, `Release` and `Ratio`.

**Migration path:** build the new graph for music and UI first (2D is simplest), move 3D world sounds next, and leave character sounds alone until you need them (`SoundService.CharacterSoundsUseNewApi` controls whether default character sounds use the new API).

---

## 6. Respect the player
- Never start loud. Fade music in over 1–2 s on join and after teleports.
- Provide **Master, Music, SFX, UI and Dialogue** sliders and save them.
- Mute or duck music when the Roblox menu is open if your game is music-heavy (`GuiService.MenuOpened` / `MenuClosed`).
- Only use audio you have rights to: your own, licensed, or Creator Store audio offered for use. The docs mention 100,000+ licensed tracks and effects in the Creator Store.

---

## Common mistakes
- Following an old tutorial and building new systems on discouraged `SoundGroup`s.
- Setting `AudioPlayer.AssetId` (deprecated) instead of `Asset` / `AudioContent`.
- Building the mix on the server, so one player's volume slider affects everyone or nothing.
- Forgetting the `Wire`. The audio objects exist but nothing is connected, so you hear silence.
- Sidechain wire without `TargetName = "Sidechain"`, which mixes the dialogue into the music instead of ducking it.
- Starting stems one by one as each loads, so they play out of sync forever.
- Music state flickering on every zone boundary (no hysteresis).
- No player volume controls.

## Checklist
- [ ] New audio uses the Audio API; legacy kept only where already working
- [ ] Client-side mix graph: Master + Music/SFX/UI/Dialogue faders
- [ ] Music ducks under dialogue via compressor sidechain
- [ ] Volume sliders persisted per player
- [ ] Stems start together after all report `IsReady`
- [ ] Music states have hysteresis and fade times
- [ ] Join and teleport fade-in; no sudden loud audio
- [ ] Every audio asset's rights documented

---

**Sources checked (2026-10-25):** Creator Docs: Audio (overview); Audio › Audio objects; Sound › Sound groups (legacy, marked discouraged); Engine API: AudioPlayer (Asset, AssetId deprecated, IsReady), AudioFader, AudioCompressor (Input/Sidechain pins), Wire, AudioEqualizer, AudioReverb, AudioFilter, AudioAnalyzer, SoundService, CompressorSoundEffect.

**Related:** [[Audio - Hub]] · [[Audio Mixing Playbook]] · [[Audio Framework]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Audio Zones, Occlusion and Mixing]] · [[Footsteps and Surface Audio]]
