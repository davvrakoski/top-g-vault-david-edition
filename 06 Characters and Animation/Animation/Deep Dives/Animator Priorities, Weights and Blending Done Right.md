---
area: "06 Characters and Animation"
cluster: "Animation"
tags: [deep-dive, roblox, animation, animator, blending]
cssclasses: [tg-a06]
---

# Animator Priorities, Weights and Blending Done Right

> **Why this matters:** Most "my animation looks broken" bugs on Roblox are not bad clips. They are two tracks fighting over the same joints because nobody owns priority, weight and fade time.
> If you get this layer right once, every later system (combat, emotes, vehicles, stun) slots in without visual glitches.

---

## 1. The mental model in one paragraph

An `Animator` (under a `Humanoid` or an `AnimationController`) evaluates every playing `AnimationTrack` each frame. For each joint, it looks at the tracks that **actually key that joint**. The track with the highest `Priority` wins that joint. If several tracks share the top priority, their poses are blended by `WeightCurrent`. A track only affects joints that have keyframes in the clip, so an "upper body only" animation is simply a clip that never keys the legs.

That gives you three tools, in order of how often you should reach for them:

1. **Priority**: who wins a joint (use this 90% of the time).
2. **Fade time**: how smoothly a winner takes over or lets go.
3. **Weight**: blending between tracks on the *same* priority (locomotion blends, aim offsets, partial overlays).

The official reference says it directly: in most cases blending is not required and `Priority` is the more suitable tool.

## 2. The priority ladder (current enum)

`Enum.AnimationPriority` has seven levels, lowest to highest:

| Priority | Use it for | Notes |
|---|---|---|
| `Core` | Default Roblox Animate script clips | Lowest. Anything you author should sit above it. |
| `Idle` | Your custom idle, breathing, weapon-hold idle | Overrides Core idle without touching locomotion. |
| `Movement` | Walk, run, strafe, crouch-walk, swim | Your locomotion layer. Blend inside this layer with weights. |
| `Action` | Attacks, reload, interact, emote | The default "do a thing" layer. |
| `Action2` | Hit reactions, flinches | Must beat attacks so a hit reads instantly. |
| `Action3` | Stun, knockdown, grab victim | Hard interrupts. |
| `Action4` | Cutscene / finisher / forced pose | Highest. Use sparingly so it stays meaningful. |

Write this table into your project's style guide and treat it as law. Every animator on the team (or every AI prompt) should export with the right priority so runtime code rarely has to override it.

You *can* override at runtime, and it is often the safer choice because exported priorities drift:

```lua
local track = animator:LoadAnimation(animationInstance)
track.Priority = Enum.AnimationPriority.Action2
```

## 3. Load once, cache, reuse

`Animator:LoadAnimation()` creates a new `AnimationTrack` every call. Calling it per attack leaks tracks and makes `GetPlayingAnimationTracks()` useless for debugging. Load each clip once per character and cache it.

```lua
--!strict
-- ReplicatedStorage/Shared/AnimSet.lua
-- One AnimSet per character. Loads every clip once, exposes play/stop helpers.

local AnimSet = {}
AnimSet.__index = AnimSet

export type ClipDef = {
	id: string,              -- "rbxassetid://123"
	priority: Enum.AnimationPriority,
	looped: boolean?,
	group: string?,          -- tracks in the same group stop each other
}

function AnimSet.new(animator: Animator, defs: { [string]: ClipDef })
	local self = setmetatable({}, AnimSet)
	self.animator = animator
	self.tracks = {} :: { [string]: AnimationTrack }
	self.defs = defs
	self.activeByGroup = {} :: { [string]: string }

	for name, def in defs do
		local anim = Instance.new("Animation")
		anim.AnimationId = def.id
		local track = animator:LoadAnimation(anim)
		track.Priority = def.priority
		if def.looped ~= nil then
			track.Looped = def.looped
		end
		self.tracks[name] = track
	end
	return self
end

-- fade: seconds to blend in. weight: 0..1. speed: playback multiplier.
function AnimSet:Play(name: string, fade: number?, weight: number?, speed: number?)
	local track = self.tracks[name]
	if not track then
		warn("AnimSet: unknown clip", name)
		return nil
	end
	local def = self.defs[name]
	if def.group then
		local current = self.activeByGroup[def.group]
		if current and current ~= name then
			self.tracks[current]:Stop(fade or 0.1)
		end
		self.activeByGroup[def.group] = name
	end
	if track.IsPlaying then
		track:AdjustWeight(weight or 1, fade or 0.1)
		track:AdjustSpeed(speed or 1)
	else
		track:Play(fade or 0.1, weight or 1, speed or 1)
	end
	return track
end

function AnimSet:Stop(name: string, fade: number?)
	local track = self.tracks[name]
	if track and track.IsPlaying then
		track:Stop(fade or 0.1)
	end
	local def = self.defs[name]
	if def and def.group and self.activeByGroup[def.group] == name then
		self.activeByGroup[def.group] = nil
	end
end

function AnimSet:StopAll(fade: number?)
	for _, track in self.tracks do
		if track.IsPlaying then
			track:Stop(fade or 0.1)
		end
	end
	table.clear(self.activeByGroup)
end

function AnimSet:Destroy()
	self:StopAll(0)
	for _, track in self.tracks do
		track:Destroy()
	end
	table.clear(self.tracks)
end

return AnimSet
```

Usage on the local player's character (client-played animations on your own character replicate to everyone, because the client owns that character):

```lua
-- StarterPlayerScripts/CombatAnims.client.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AnimSet = require(ReplicatedStorage.Shared.AnimSet)

local P = Enum.AnimationPriority
local DEFS = {
	SwordIdle  = { id = "rbxassetid://0", priority = P.Idle, looped = true },
	Slash1     = { id = "rbxassetid://0", priority = P.Action, group = "attack" },
	Slash2     = { id = "rbxassetid://0", priority = P.Action, group = "attack" },
	HitReact   = { id = "rbxassetid://0", priority = P.Action2, group = "react" },
	Stunned    = { id = "rbxassetid://0", priority = P.Action3, looped = true, group = "react" },
}

local current

local function onCharacter(character: Model)
	if current then
		current:Destroy()
	end
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	local animator = humanoid:WaitForChild("Animator") :: Animator
	current = AnimSet.new(animator, DEFS)
	current:Play("SwordIdle", 0.2)
end

local player = Players.LocalPlayer
player.CharacterAdded:Connect(onCharacter)
if player.Character then
	onCharacter(player.Character)
end
```

Replace the `rbxassetid://0` placeholders with your own uploaded animation IDs. The animation must be owned by the same user or group that owns the experience, or it will silently fail to play in live servers.

## 4. Fade times: the numbers that feel right

There is no official "correct" fade; these are working starting points from shipped action games. Tune with your own clips.

| Transition | Fade in | Fade out | Why |
|---|---|---|---|
| Idle ↔ walk/run | 0.15 to 0.25 s | same | Loose; players never notice. |
| Into an attack | 0.03 to 0.08 s | n/a | Fast attacks need instant read. |
| Attack recovery back to idle | n/a | 0.15 to 0.3 s | Hides the snap back. |
| Hit reaction | 0.0 to 0.05 s | 0.1 to 0.2 s | A hit must read the same frame. |
| Stun loop | 0.05 s | 0.25 s | Exiting stun should feel like regaining control. |
| Emote | 0.3 s | 0.3 s | Slow, social, not gameplay. |

`Play()` and `AdjustWeight()` both default `fadeTime` to `0.1`. `Stop()` also takes a fade. Passing `0` is legal and gives a hard cut, which is exactly what you want for hit reactions and for cleaning up on death.

## 5. Weight: when you actually need it

Weights blend tracks **inside the same priority**. Classic uses:

- **Locomotion blend.** Walk and run both on `Movement`, cross-faded by speed. See [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]].
- **Additive-style overlays.** Roblox has no true additive layer mode; you fake it with a low-weight overlay track on the same priority (for example a 0.3-weight "tired" breathing clip on `Idle`).
- **Smooth hand-off.** Instead of stopping track A and playing track B, keep both playing and move weights over time.

```lua
-- Blend walk -> run by current speed. Both tracks Looped, Priority Movement, both playing.
-- Assumes rootPart (HumanoidRootPart), walkTrack and runTrack are already set up.
local RunService = game:GetService("RunService")

local WALK_SPEED_AUTHORED = 8   -- studs/s the walk clip was authored for (measure it)
local RUN_SPEED_AUTHORED = 18

RunService.PreAnimation:Connect(function()
	local speed = rootPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
	local s = speed.Magnitude
	local t = math.clamp((s - WALK_SPEED_AUTHORED) / (RUN_SPEED_AUTHORED - WALK_SPEED_AUTHORED), 0, 1)
	-- keep the total near 1 so the pose doesn't "shrink"
	walkTrack:AdjustWeight(math.max(1 - t, 0.001), 0.1)
	runTrack:AdjustWeight(math.max(t, 0.001), 0.1)
	-- speed-match so feet don't slide
	local refSpeed = WALK_SPEED_AUTHORED + (RUN_SPEED_AUTHORED - WALK_SPEED_AUTHORED) * t
	local rate = if s > 0.5 then s / refSpeed else 1
	walkTrack:AdjustSpeed(rate)
	runTrack:AdjustSpeed(rate)
end)
```

Two details matter here. First, a weight of exactly `0` means "no visible movement", but the track is still playing and still costs evaluation; use a tiny value like `0.001` only if you need the track kept in sync, otherwise stop it. Second, the pose is a weighted *average*, so two half-weight tracks on the same priority do not "add up" to a stronger pose; they average.

**Cross-priority weight caveat.** The reference describes priority as "the highest priority will show" and weights as blending tracks *at the same priority*. In practice a higher-priority track faded in at a weight below 1 visibly mixes with what is underneath, which is what makes fade-ins smooth. Do not build a gameplay system that depends on the exact mix ratio across priorities; test it in your place, because this behaviour is not specified numerically in the docs.

## 6. Speed: freezing, slow motion, timing to gameplay

`AdjustSpeed()` changes playback rate on a playing track. Three production uses:

1. **Hitstop.** `track:AdjustSpeed(0)` for 50 to 100 ms on impact, then restore. See [[Hitstop, Screen Shake and Camera Impact Feel]].
2. **Attack speed stats.** A 20% attack speed buff is `track:Play(0.05, 1, 1.2)`. Remember your server-side timings (active frames, recovery) must scale by the same factor or the server and client disagree.
3. **Fitting a clip to a duration.** If design says "reload takes 1.6 s", play at `speed = track.Length / 1.6`. `Length` is `0` until the animation asset has loaded, so either preload with `ContentProvider:PreloadAsync()` or wait until `Length > 0` before computing.

```lua
local ContentProvider = game:GetService("ContentProvider")

local function playForDuration(track: AnimationTrack, anim: Animation, duration: number)
	if track.Length == 0 then
		pcall(ContentProvider.PreloadAsync, ContentProvider, { anim })
	end
	local len = track.Length
	local speed = if len > 0 then len / duration else 1
	track:Play(0.05, 1, speed)
end
```

## 7. Overriding the default Animate script cleanly

The default `Animate` LocalScript plays its clips at `Core` priority, so any custom clip you author at `Idle` or above already wins. You only need to touch `Animate` if you want to *replace* the defaults. The documented pattern is to change the `AnimationId` values under the `Animate` script's StringValues (`run.RunAnim`, `walk.WalkAnim`, `idle.Animation1`, and so on) when the character spawns, and stop currently playing tracks so the swap is visible immediately.

If you fork `Animate` entirely (common for shooters and fighting games), copy it from a test play session, put your copy in `StarterCharacterScripts`, and name it `Animate` so it replaces the default.

## 8. Debug overlay: see who owns each joint

When something looks wrong, print what is actually playing. This one function solves most priority bugs in under a minute.

```lua
local function dumpTracks(animator: Animator)
	print("---- tracks on", animator:GetFullName())
	for _, t in animator:GetPlayingAnimationTracks() do
		print(string.format("%-28s pri=%-8s w=%.2f->%.2f speed=%.2f t=%.2f/%.2f loop=%s",
			t.Animation and t.Animation.AnimationId or "?",
			t.Priority.Name,
			t.WeightCurrent, t.WeightTarget,
			t.Speed, t.TimePosition, t.Length,
			tostring(t.Looped)))
	end
end
```

Bind it to a debug key in Studio only (`RunService:IsStudio()`). Look for: two `Action` tracks running at once (missing group stop), a looped track you thought had ended, or a track with `WeightTarget` 0 that is still listed (you adjusted weight instead of stopping).

`Animator:GetTrackByAnimationId()` returns an already-loaded track for an ID without creating a new one, which is handy for debug tools and for code that did not keep a reference.

## 9. Server, client and NPC rules

- **Player characters:** load and play on the owning client. The `Animator` must have been created on the server (the default character already does this) for replication to work.
- **NPCs:** tracks loaded and played on the server replicate to all clients. For big crowds, prefer replicating a state value (attribute) and letting each client play the clips locally. See [[NPC Crowds, Animation LOD and Server Budgets]].
- **Never trust animation for gameplay truth.** The client's track timing is presentation. The server decides damage with its own timing table. See [[Animation Markers for Hit Frames, Footsteps and Sync]].

## Common mistakes

- Calling `LoadAnimation` inside the attack function, creating a new track every swing.
- Exporting everything at `Action`, then wondering why the hit reaction never shows during an attack.
- Using weights to "win" over another clip instead of setting a higher priority.
- Setting `TimePosition` before `Play()`; the docs say to play first, then set the time.
- Reading `track.Length` the frame after loading and getting `0`.
- Forgetting that an attack clip which keys the legs will freeze locomotion; strip leg keys for upper-body actions.
- Leaving `Looped = true` on a one-shot clip because the Animation Editor default was looped.
- Not stopping tracks on death/respawn, so a stun loop plays on the ragdoll.
- Uploading animations to a personal account while the game is owned by a group (they will not play live).
- Comparing priorities numerically: `Enum.AnimationPriority.Core.Value` is `1000` while `Idle` is `0` and `Action4` is `5`, so `track.Priority.Value >= Action.Value` also matches Core tracks. Compare against an explicit set of enum items instead.

## Checklist

- [ ] Priority table written and agreed (Core / Idle / Movement / Action / Action2 / Action3 / Action4).
- [ ] Every clip loaded once per character and cached.
- [ ] Exclusive groups (attack, react, emote) stop each other.
- [ ] Fade times set per transition type, hit reactions near 0.
- [ ] Upper-body clips have no leg keys.
- [ ] Locomotion weights speed-matched to measured authored speed.
- [ ] Track dump debug key works in Studio.
- [ ] All tracks stopped and destroyed on `CharacterRemoving` or death.
- [ ] Animation assets owned by the experience owner (user or group).

---

**Related:** [[Animation - Hub]] · [[Animation Layering, IK and Markers]] · [[Animation foot slide - state fighting]] · [[Character Animation Framework]] · [[Procedural Animation, Springs and Recoil]] · [[Melee Combo Blueprint]]
