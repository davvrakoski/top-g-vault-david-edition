---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
title: "Hitstop and Impact Freeze"
tags: [roblox, community-knowledge, game-feel, combat, hitstop, animation]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://devforum.roblox.com/t/how-to-make-player-freeze-temporary/1727606
  - https://forum.defold.com/t/where-would-i-start-programming-hitstop/73713
---
# Hitstop and Impact Freeze

Hitstop (also called hit-pause or hit-freeze) is a tiny pause, a few frames long, at the moment an attack connects. Fighting and action games use it everywhere because it makes hits feel heavy: the brain reads the stall as resistance. Roblox has no global time scale, so you can't pause the engine like some engines do with a time-scale value. You pause the **presentation** of the attacker and victim on each client instead, while the server's combat logic keeps running normally.

## What to freeze

| Thing | How | Notes |
|---|---|---|
| Attacker animation | `track:AdjustSpeed(0)` then restore | The swing "sticks" in the target |
| Victim animation | Pause the hit-react track on its first frame | Optional; reads as a jolt |
| Weapon trail | Leave running | Keeps motion readable |
| Particles | Spawn the impact burst at the frame of contact; optionally `TimeScale` near 0 for the freeze | `ParticleEmitter.TimeScale` slows particle simulation |
| Camera | Do **not** freeze; add a small shake on release | Freezing the camera feels like a lag spike |
| Sound | Play the impact sound at freeze start | Audio sells the weight |

## Durations

| Hit | Freeze |
|---|---|
| Light jab / fast weapon | 40-60 ms (about 3 frames at 60 FPS) |
| Heavy hit | 80-120 ms |
| Finisher / crit / parry | 150-250 ms, plus a flash or zoom |

Keep light-hit hitstop very short; long pauses on fast combos make the game feel laggy. Scale with damage or attack weight.

## Client-side implementation

The server confirms the hit and tells the attacker's client and nearby clients. Each client freezes **its own view** of the involved characters:

```lua
local frozen = {}

local function hitstop(animator: Animator, duration: number)
	if frozen[animator] then return end -- don't stack freezes
	local tracks = animator:GetPlayingAnimationTracks()
	local speeds = {}
	for i, track in tracks do
		speeds[i] = track.Speed
		track:AdjustSpeed(0)
	end
	frozen[animator] = true
	task.delay(duration, function()
		for i, track in tracks do
			if track.IsPlaying then
				track:AdjustSpeed(speeds[i])
			end
		end
		frozen[animator] = nil
	end)
end
```

Call it with the attacker's and victim's `Animator`. For the local player's own attack, you can run it predictively on the client the moment the local hit detection fires, then let the server correct damage.

## Do not freeze movement on the server

A DevForum thread about hitstun shows the classic failure: the server anchored or froze the character, and with replication delay a 0.15 s stun became a one-second freeze plus a teleport. Hitstop is cosmetic; keep it on clients. If you need gameplay stun (can't act), have the server set a state such as an attribute and let the client enforce input lockout, with the server ignoring actions during the stun window.

## Pairing it with other juice

The standard impact recipe in action games is hitstop + spark burst + short camera shake on release + a punchy sound on the contact frame. Stack effects by weight:

- Light: 50 ms hitstop + small spark + no shake.
- Heavy: 100 ms hitstop + big spark + trauma 0.2 + low thump.
- Finisher: 200 ms hitstop + white flash frame + FOV punch + slow-mo on the victim's ragdoll start.

## Accessibility and fairness

- In PvP, only the attacker's and victim's **presentation** stalls; never delay input processing for the victim.
- Very frequent freezes (multi-hit beams, flamethrowers) should skip hitstop; use continuous vibration-like shake instead.
- Reduce Motion: keep hitstop (it's not camera motion) but drop the shake and flash parts.

## Related
[[Camera Game Feel - Hub]] · [[Trauma-Based Camera Shake]] · [[Camera, Feel and Game Juice]] · [[Combat Animation Authoring Tips]] · [[DevForum Impact Frame Techniques]]
