---
area: "06 Characters and Animation"
cluster: "Animation"
tags: [deep-dive, roblox, animation, markers, combat-timing]
cssclasses: [tg-a06]
---

# Animation Markers for Hit Frames, Footsteps and Sync

> **Why this matters:** `task.wait(0.32)` after playing an attack is how most Roblox combat goes out of sync: change the clip, the speed or the frame rate and the hit lands on the wrong frame.
> Markers put the timing *inside the animation*, and an exported timing table lets the server agree with it without trusting the client.

---

## 1. What markers are (and what they are not)

In the Animation Editor you can add **Animation Events** on the timeline. Each event has a **name** (for example `HitStart`) and an optional **parameter string** (for example `"blade,heavy"`). At runtime you listen for them with:

```lua
track:GetMarkerReachedSignal("HitStart"):Connect(function(param: string)
	-- param is the parameter string you typed in the editor ("" if none)
end)
```

Under the hood the editor stores them as `KeyframeMarker` instances (with `Name` and `Value`) under `Keyframe` objects inside the `KeyframeSequence`. That detail matters later, because it means a Studio tool can read marker times back out.

What markers are **not**:

- They are not a gameplay authority. They fire on whichever machine is evaluating that track, at that machine's frame rate.
- They are not guaranteed to fire if the track is stopped, interrupted or never loaded. Every "open" marker needs a cleanup path.
- They are not the legacy `KeyframeReached` event. That one fires for **named keyframes**; it still exists but markers are the documented approach for events.

## 2. A naming convention that scales

Pick one vocabulary and use it in every clip. A tested set:

| Marker | Parameter example | Meaning |
|---|---|---|
| `HitStart` | `"R_Hand"` or `"blade"` | Open the hit window; param names the hitbox source. |
| `HitEnd` | | Close the hit window. |
| `ComboOpen` | | Next input in the chain is now accepted. |
| `ComboClose` | | Chain window over; recovery only. |
| `CancelOpen` | `"dodge,block"` | These actions may cancel recovery from here. |
| `Footstep` | `"L"` / `"R"` | Footstep audio, dust puff, footprint decal. |
| `VFX` | `"slash_wide"` | Spawn a named effect at this frame. |
| `Release` | | Projectile leaves the hand / bow string releases. |
| `Invuln` / `InvulnEnd` | | Presentation for dodge i-frames (server has its own timing). |

Keep names short and case-exact: `GetMarkerReachedSignal` is matched by exact string.

## 3. Client side: markers drive presentation and requests

```lua
--!strict
-- Client: bind markers for one attack track. Returns a cleanup function.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local AttackRemote = Remotes:WaitForChild("Attack") :: RemoteEvent

local VFX = require(ReplicatedStorage.Shared.VFX)         -- your effect spawner
local Hitbox = require(ReplicatedStorage.Shared.Hitbox)   -- see Hitbox deep dive

local function bindAttackMarkers(track: AnimationTrack, character: Model, swingId: number)
	local conns: { RBXScriptConnection } = {}
	local activeHitbox = nil

	local function closeHitbox()
		if activeHitbox then
			activeHitbox:Stop()
			activeHitbox = nil
		end
	end

	table.insert(conns, track:GetMarkerReachedSignal("HitStart"):Connect(function(source)
		closeHitbox()
		activeHitbox = Hitbox.start(character, source, function(victimModel)
			-- client only *suggests* a hit; the server re-checks everything
			AttackRemote:FireServer("hit", swingId, victimModel)
		end)
	end))

	table.insert(conns, track:GetMarkerReachedSignal("HitEnd"):Connect(closeHitbox))

	table.insert(conns, track:GetMarkerReachedSignal("VFX"):Connect(function(effectName)
		VFX.play(effectName, character)
	end))

	-- Safety net: if the track stops before HitEnd (stun, death, cancel), close anyway.
	table.insert(conns, track.Stopped:Connect(closeHitbox))

	return function()
		closeHitbox()
		for _, c in conns do
			c:Disconnect()
		end
		table.clear(conns)
	end
end

return bindAttackMarkers
```

Two rules hidden in that code:

1. **Bind before you `Play()`**, or a marker on frame 0 can be missed.
2. **Bind once per track, not per play.** `GetMarkerReachedSignal` returns a signal; if you `Connect` every swing without disconnecting, the handler stacks and you get double hits (a classic cause of [[Combat double-hits or misses]]).

A cleaner production version connects once when the track is loaded and routes the event through a "current swing" variable, so there is nothing to disconnect per swing.

## 4. Server side: the timing table

The server should not wait for a client to say "my HitStart marker fired". It should know, from data, that `Slash1` is active from 0.18 s to 0.30 s at speed 1. That way:

- an exploiter cannot claim a hit at frame 0 of the wind-up,
- the server can reject hits that arrive outside the window (plus a latency allowance),
- NPCs on the server can use the same table without playing any animation on the server.

```lua
-- ReplicatedStorage/Shared/AttackTimings.lua (generated - see section 5)
return {
	Slash1 = { length = 0.70, HitStart = 0.18, HitEnd = 0.30, ComboOpen = 0.28, ComboClose = 0.55 },
	Slash2 = { length = 0.75, HitStart = 0.20, HitEnd = 0.34, ComboOpen = 0.32, ComboClose = 0.60 },
	Heavy  = { length = 1.20, HitStart = 0.52, HitEnd = 0.70 },
}
```

Server validation sketch:

```lua
local Timings = require(game:GetService("ReplicatedStorage").Shared.AttackTimings)

local LATENCY_GRACE = 0.25 -- seconds; tune with real ping data, cap it

local function isInsideHitWindow(swing, now: number): boolean
	local t = Timings[swing.attackName]
	if not t then return false end
	local elapsed = (now - swing.startedAt) * swing.speed  -- scale by attack speed
	return elapsed >= t.HitStart - LATENCY_GRACE and elapsed <= t.HitEnd + LATENCY_GRACE
end
```

`swing.startedAt` is recorded on the server when it *accepts* the attack request, using `workspace:GetServerTimeNow()`. See [[Lag Compensation and Server Rewind for Melee and Hitscan]] for how to widen windows fairly instead of blindly.

## 5. Exporting marker times automatically (no hand-typing)

Hand-copying times from the timeline is how tables drift out of date. Because markers are `KeyframeMarker` instances inside a `KeyframeSequence`, you can read them in Studio and generate the table.

Run this in the **Studio command bar** (or a plugin) with your published animation IDs. `AnimationClipProvider:GetAnimationClipAsync()` is a web call, so wrap it in `pcall` (it replaces the deprecated `KeyframeSequenceProvider`).

```lua
-- Studio command bar: prints a Lua table of marker times for each clip.
local ACP = game:GetService("AnimationClipProvider")

local CLIPS = {
	Slash1 = "rbxassetid://0", -- replace with your IDs
	Slash2 = "rbxassetid://0",
	Heavy  = "rbxassetid://0",
}

local out = { "return {" }
for name, id in CLIPS do
	local ok, seq = pcall(ACP.GetAnimationClipAsync, ACP, id)
	if not ok or not seq or not seq:IsA("KeyframeSequence") then
		warn("Could not load as KeyframeSequence", name, id, seq)
		continue
	end
	local entries = {}
	local length = 0
	for _, kf in seq:GetKeyframes() do
		if kf:IsA("Keyframe") then
			length = math.max(length, kf.Time)
			for _, marker in kf:GetMarkers() do
				-- if a marker name repeats (e.g. two Footsteps) keep the first; extend if you need all
				if entries[marker.Name] == nil then
					entries[marker.Name] = kf.Time
				end
			end
		end
	end
	local parts = { string.format("length = %.3f", length) }
	for markerName, time in entries do
		table.insert(parts, string.format("%s = %.3f", markerName, time))
	end
	table.insert(out, string.format("\t%s = { %s },", name, table.concat(parts, ", ")))
end
table.insert(out, "}")
print(table.concat(out, "\n"))
```

Copy the printed output into `AttackTimings.lua`. Re-run it every time an animator touches a combat clip. Note that `length` here is the time of the last keyframe, which can be slightly shorter than `AnimationTrack.Length` if the clip has trailing empty time; for windows that does not matter.

## 6. Footsteps: the most common marker job

Footsteps are the clearest win for markers, because a walk cycle played at a different speed still lands the sound on the contact frame.

```lua
-- Client: footstep sounds + dust from markers. Only for characters near the camera.
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

local MAX_DIST = 60
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude

local function bindFootsteps(track: AnimationTrack, character: Model, sounds: { [Enum.Material]: Sound })
	params.FilterDescendantsInstances = { character }
	return track:GetMarkerReachedSignal("Footstep"):Connect(function(side)
		local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
		local cam = Workspace.CurrentCamera
		if not root or not cam then return end
		if (root.Position - cam.CFrame.Position).Magnitude > MAX_DIST then return end

		local result = Workspace:Raycast(root.Position, Vector3.new(0, -6, 0), params)
		if not result then return end
		local template = sounds[result.Material] or sounds[Enum.Material.Plastic]
		if template then
			local s = template:Clone()
			s.Parent = root
			s:Play()
			s.Ended:Once(function() s:Destroy() end)
		end
	end)
end
```

Pair this with the surface table in [[Footsteps and Surface Audio]]. Keep a distance cutoff: 30 NPCs each firing footstep markers at full rate is a real cost.

## 7. Timing pitfalls you will hit

**Low frame rate.** Markers fire during animation evaluation, so at 20 FPS a marker can fire up to ~50 ms late relative to wall-clock. This is fine for presentation; it is one more reason the server uses its own table.

**Speed changes.** At `AdjustSpeed(2)` the marker arrives twice as fast in wall-clock time. If your server table is in "clip seconds", multiply elapsed server time by the same speed factor (as in the validation sketch).

**Very short windows.** A hit window of one frame (e.g. 0.016 s) can be skipped entirely by a hitbox that samples on Heartbeat. Use `HitStart`/`HitEnd` pairs that span at least 2 to 3 frames, and sweep the hitbox between samples (see [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]]).

**Looping tracks.** Markers on a looped clip fire every loop. That is what you want for footsteps and what you do not want for one-shot VFX accidentally left on a looped idle.

**Fade-out.** When a track stops with a fade, markers after the stop point do not fire. The `Stopped` event fires when playback ends and the fade begins; `Ended` fires after the fade, when the track no longer moves anything. Use `Stopped` for gameplay cleanup and `Ended` for destroying temporary instances tied to the pose.

**Server-side markers on player tracks.** Tracks a client plays on its own character replicate to the server, but do not build server logic on marker signals from those replicated tracks. Treat them as unreliable on the server.

## 8. Marker-driven VFX without spam

Use a single dispatcher per character instead of one connection per effect. The parameter string carries the effect name; the dispatcher handles pooling, distance culling and quality tiers ([[VFX Performance, LOD and Pooling]]).

```lua
track:GetMarkerReachedSignal("VFX"):Connect(function(param)
	local effectName, attachName = string.match(param, "^([%w_]+),?([%w_]*)$")
	if not effectName then return end
	local attach = if attachName ~= "" then character:FindFirstChild(attachName, true) else nil
	VFX.play(effectName, character, attach)
end)
```

Typing `slash_wide,RightGripAttachment` in the editor's parameter field then spawns the slash at the hand. The bundled `VFX_Slash_Wide` mesh from [[Top G Originals - VFX Mesh Pack]] is a good default for that event; recipes are in [[Mesh VFX Recipes with the Top G VFX Mesh Pack]].

## Common mistakes

- Connecting `GetMarkerReachedSignal` inside the attack function every swing (handlers stack, double hits).
- Opening a hitbox on `HitStart` with no cleanup on `Stopped`, leaving an invisible damage zone after a stun.
- Server waiting on a client's "marker fired" remote as proof of timing.
- Marker names that differ by case between clips (`hitStart` vs `HitStart`).
- Hand-typed timing tables that no longer match the clips.
- Footstep markers on 50 distant NPCs with no distance cutoff.
- One-frame hit windows sampled once per Heartbeat.
- Forgetting to scale server windows by attack speed buffs.

## Checklist

- [ ] One marker vocabulary documented and used in every clip.
- [ ] Every `HitStart` has a matching `HitEnd`, and `Stopped` also closes the window.
- [ ] Marker connections made once per loaded track.
- [ ] Timing table generated from the clips by the export script.
- [ ] Server validates hit timing from the table with a capped latency grace.
- [ ] Footstep markers distance-culled on the client.
- [ ] VFX markers routed through one pooled dispatcher.
- [ ] Re-export timings whenever a combat clip changes.

---

**Related:** [[Animation - Hub]] · [[Animation Layering, IK and Markers]] · [[Melee Combo Blueprint]] · [[Server Melee Validation]] · [[Footsteps and Surface Audio]] · [[Combat - Hub]]

> Updated 2026-10-25: export script now uses `AnimationClipProvider:GetAnimationClipAsync()` (with a `KeyframeSequence` check) instead of the deprecated `KeyframeSequenceProvider` (source: https://create.roblox.com/docs/reference/engine/classes/KeyframeSequenceProvider)
