---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, game-feel, camera, hitstop, screen-shake]
cssclasses: [tg-a07]
---

# Hitstop, Screen Shake and Camera Impact Feel

> **Why this matters:** Two games with identical damage numbers feel completely different depending on 80 ms of freeze, a few degrees of camera shake and a flash. That gap is most of what players call "good combat".
> These are client-side presentation effects, so they can be generous, but they must never touch gameplay timing or make players sick.

---

## 1. The impact stack

Layer these on a confirmed hit (or on a predicted hit for the attacker, corrected if rejected):

| Layer | Duration | Who sees it | Notes |
|---|---|---|---|
| **Hitstop** (freeze both animations) | 40 to 120 ms | Attacker and victim clients, optionally nearby | Scales with hit weight |
| **Screen shake** | 100 to 350 ms | Attacker strongly, victim medium, bystanders by distance | Trauma model, decays |
| **Hit flash** on victim | 60 to 100 ms | Everyone near | `Highlight` or brief material/colour change |
| **Impact VFX** | 150 to 400 ms | Everyone near | Spark star, shockwave ring ([[Mesh VFX Recipes with the Top G VFX Mesh Pack]]) |
| **FOV kick** | 80 to 200 ms | Attacker on heavy hits, victim on big knockback | 2 to 6 degrees |
| **Controller rumble** | ≤ 150 ms | Gamepad users | `HapticEffect` (replaces the deprecated `HapticService`) |
| Sound | | | Not covered here; see the audio area |

All durations are starting points used in action games, not engine values. Tune in playtests with [[Combat Feel Tuning Worksheet]].

## 2. Hitstop done safely

Hitstop is "pause the attack and reaction animations for a few frames". On Roblox the safe way is **animation speed 0**, never anchoring characters or pausing physics.

```lua
--!strict
-- ReplicatedStorage/Shared/Hitstop.lua (client)
local Hitstop = {}

local frozen: { [AnimationTrack]: number } = {}   -- track -> speed to restore

-- Explicit set: Enum.AnimationPriority.Core has Value 1000, so ">= Action.Value" would wrongly include Core.
local FREEZE = {
	[Enum.AnimationPriority.Action] = true,
	[Enum.AnimationPriority.Action2] = true,
	[Enum.AnimationPriority.Action3] = true,
	[Enum.AnimationPriority.Action4] = true,
}

local function freezeAnimator(animator: Animator)
	for _, track in animator:GetPlayingAnimationTracks() do
		-- only freeze action layers; leave locomotion running so feet don't lock mid-slide
		if FREEZE[track.Priority] and frozen[track] == nil then
			frozen[track] = track.Speed
			track:AdjustSpeed(0)
		end
	end
end

-- models: attacker and victim. duration in seconds.
function Hitstop.play(models: { Model }, duration: number)
	for _, model in models do
		local host = model:FindFirstChildOfClass("Humanoid") or model:FindFirstChildOfClass("AnimationController")
		local animator = host and host:FindFirstChildOfClass("Animator")
		if animator then
			freezeAnimator(animator)
		end
	end
	task.delay(duration, function()
		for track, speed in frozen do
			if track.IsPlaying then
				track:AdjustSpeed(speed)
			end
		end
		table.clear(frozen)
	end)
end

return Hitstop
```

Rules:

- **Gameplay timing does not stop.** The server's attack windows keep running. If hitstop is 0.1 s and your client-side combo windows are measured from animation time, the client and server drift by 0.1 s per hit. Either measure client windows with a clock that ignores hitstop, or add the hitstop duration to the client's window bookkeeping. The simplest fix: keep combo logic on `os.clock()` (as in [[Combo Systems and Input Buffering]]) and treat hitstop as purely visual.
- **Scale by weight:** light 0.04 to 0.06 s, heavy 0.08 to 0.12 s, finisher up to 0.2 s. More than that reads as lag.
- **Do not hitstop on every hit of a fast multi-hit.** Cap to one hitstop per 0.15 s per character.
- **Freeze VFX too** (optional): set `ParticleEmitter.TimeScale = 0` on the slash emitter for the same duration for a very anime look.

## 3. Screen shake with a trauma model

The robust approach (popularized in game-feel talks) is **trauma**: hits add trauma 0..1; shake intensity = trauma²; trauma decays over time; offsets come from smooth noise, not random jumps. Squaring makes small hits subtle and big hits dramatic.

The Roblox-specific problem: the default camera scripts set `Camera.CFrame` each frame, and some camera modes read the current `CFrame` back. If you just add an offset after the camera runs, the camera may treat your shaken CFrame as its new base and drift. Fix: **remove last frame's offset before the camera updates, add the new one after.**

```lua
--!strict
-- StarterPlayerScripts/CameraShake.client.lua  (exposes a module-like API via a BindableEvent or require pattern)
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Shake = {}

local trauma = 0
local DECAY = 1.6             -- trauma per second
local MAX_ROT = math.rad(2.5) -- max rotation at trauma 1
local MAX_POS = 0.35          -- studs at trauma 1
local FREQ = 18               -- noise frequency
local intensityScale = 1      -- player setting: 0, 0.5, 1

local applied = CFrame.identity
local t0 = os.clock()

function Shake.add(amount: number)
	trauma = math.clamp(trauma + amount, 0, 1)
end

function Shake.setIntensity(scale: number)
	intensityScale = math.clamp(scale, 0, 1)
end

-- Before the default camera: undo last frame's offset so the camera sees its true CFrame.
RunService:BindToRenderStep("ShakeUndo", Enum.RenderPriority.Camera.Value - 1, function()
	local cam = Workspace.CurrentCamera
	if cam and applied ~= CFrame.identity then
		cam.CFrame = cam.CFrame * applied:Inverse()
		applied = CFrame.identity
	end
end)

-- After the default camera: apply this frame's offset.
RunService:BindToRenderStep("ShakeApply", Enum.RenderPriority.Camera.Value + 1, function(dt)
	trauma = math.max(0, trauma - DECAY * dt)
	local cam = Workspace.CurrentCamera
	if not cam or trauma <= 0 or intensityScale <= 0 then return end

	local s = trauma * trauma * intensityScale
	local t = (os.clock() - t0) * FREQ
	-- math.noise returns roughly -1..1 (often smaller); different seeds per axis
	local pitch = MAX_ROT * s * math.noise(t, 0.1, 0)
	local yaw   = MAX_ROT * s * math.noise(t, 0.2, 10)
	local roll  = MAX_ROT * s * 0.5 * math.noise(t, 0.3, 20)
	local px    = MAX_POS * s * math.noise(t, 0.4, 30)
	local py    = MAX_POS * s * math.noise(t, 0.5, 40)

	applied = CFrame.new(px, py, 0) * CFrame.Angles(pitch, yaw, roll)
	cam.CFrame = cam.CFrame * applied
end)

return Shake
```

Put the code in a `ModuleScript` required by your client combat controller so `Shake.add()` can be called from anywhere. Suggested trauma per event:

| Event | Attacker | Victim | Bystander (≤ 30 studs) |
|---|---|---|---|
| Light hit | 0.10 | 0.15 | 0 |
| Heavy hit | 0.25 | 0.35 | 0.05 |
| Explosion at distance d | 0.6 × (1 - d/40) | same | same |
| Landing from a big fall | 0.2 | n/a | 0 |

**Rotation is stronger than translation** for perceived shake; keep roll small (it causes the most motion sickness).

An alternative that avoids camera CFrame juggling entirely is `Humanoid.CameraOffset`, which the default camera respects. It only supports translation, so it suits small "bump" effects better than rotational shake.

## 4. FOV kick

```lua
local TweenService = game:GetService("TweenService")

local baseFov = 70
local function fovKick(amount: number, outTime: number, backTime: number)
	local cam = workspace.CurrentCamera
	local out = TweenService:Create(cam, TweenInfo.new(outTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ FieldOfView = baseFov + amount })
	out:Play()
	out.Completed:Once(function()
		TweenService:Create(cam, TweenInfo.new(backTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ FieldOfView = baseFov }):Play()
	end)
end

-- heavy hit landed: fovKick(4, 0.05, 0.18)
```

If other systems also tween FOV (sprint, aim down sights), route all of them through one FOV controller that sums offsets; competing tweens overwrite each other.

## 5. Hit flash

A `Highlight` on the victim for one or two frames is the cheapest readable flash:

```lua
local function flash(model: Model, duration: number)
	local h = Instance.new("Highlight")
	h.FillColor = Color3.new(1, 1, 1)
	h.FillTransparency = 0.2
	h.OutlineTransparency = 1
	h.DepthMode = Enum.HighlightDepthMode.Occluded
	h.Adornee = model
	h.Parent = model
	task.delay(duration, function() h:Destroy() end)
end
```

The Highlighting docs state that only 255 `Highlight` instances display on a client at once; extras are silently ignored. Each one also has a rendering cost, so for crowds reuse a small pool and only flash the most recent victims.

## 6. Who triggers what (network flow)

1. Attacker's client: on its own predicted hit, play **hitstop + shake + flash** immediately. Feels instant.
2. Server validates, applies damage, sends a hit event (`attacker`, `victim`, `weight`) to clients near the fight.
3. Victim's client: plays **shake (victim amount) + hitstop + flash** on receive.
4. Bystanders: play **flash + VFX**, shake only if close.
5. If the server **rejects** the attacker's hit, do nothing visible; the attacker already saw a small effect. Do not "undo" visuals.

Send hit events with `RemoteEvent` (reliable) for damage numbers; purely cosmetic extras can use `UnreliableRemoteEvent`.

## 7. Accessibility and comfort

- Expose **Screen shake: Off / Reduced / Full** in settings ([[Settings and Accessibility Blueprint]]) and pass it to `Shake.setIntensity()`.
- Respect the reduced-motion setting for FOV kicks too.
- Avoid full-screen white flashes; if you use a `ColorCorrectionEffect` pulse, keep `Brightness` changes small and never strobe faster than a few times per second. The vault's weather note on flashes applies here: [[Thunder, Lightning and Accessibility]].
- Never shake the camera during UI menus or cutscenes.

## Common mistakes

- Anchoring characters or setting `WalkSpeed = 0` for hitstop (desyncs physics and replication).
- Applying shake after the camera without undoing it, causing camera drift.
- Random per-frame offsets instead of smooth noise (looks like jitter, not impact).
- Linear trauma instead of squared, so light hits shake too much.
- Hitstop on every tick of a 10-hit flurry.
- Combo windows measured in animation time while hitstop pauses animations.
- Multiple scripts tweening `FieldOfView` at once.
- No player setting to turn shake off.

## Checklist

- [ ] Hitstop via `AdjustSpeed(0)` on action-priority tracks, capped per character.
- [ ] Gameplay timing independent of hitstop.
- [ ] Trauma-based shake with undo-before / apply-after camera steps.
- [ ] Per-event trauma table, bystander distance falloff.
- [ ] Single FOV controller.
- [ ] Hit flash pooled; Highlight count checked.
- [ ] Attacker predicts, victim/bystanders react to server events.
- [ ] Shake and FOV respect accessibility settings.

---

**Related:** [[Combat - Hub]] · [[Camera, Feel and Game Juice]] · [[Camera Game Feel - Hub]] · [[Springs and Damping for Game Feel]] · [[Combat Feel Tuning Worksheet]] · [[Settings and Accessibility Blueprint]]

> Updated 2026-10-25: controller rumble now points to `HapticEffect`; `HapticService` is deprecated (source: https://create.roblox.com/docs/reference/engine/classes/HapticService)
