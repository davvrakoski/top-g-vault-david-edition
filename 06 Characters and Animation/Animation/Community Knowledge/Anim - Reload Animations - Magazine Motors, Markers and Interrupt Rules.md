---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Reload Animations - Magazine Motors, Markers and Interrupt Rules"
tags: [roblox, community-knowledge, animation, weapons, reload, guns, markers]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/KeyframeMarker
  - https://create.roblox.com/docs/reference/engine/enums/AnimationPriority
---
# Anim - Reload Animations - Magazine Motors, Markers and Interrupt Rules

A reload is the most watched animation in a shooter: players see it dozens of times per match, usually at the worst moment. Good reloads move the magazine with the hand, drop an empty mag on the floor, play sounds exactly on contact, and let the player cancel at fair points. On Roblox this is a `Motor6D` on the magazine that changes parent mid-clip, driven by animation markers.

## Rig the gun

- `Handle` (the tool grip part) is the gun body.
- `Mag` is a separate part joined by a `Motor6D` named `MagMotor` with `Part0 = Handle`, `Part1 = Mag`.
- Optional moving parts get their own motors: `BoltMotor`, `SlideMotor`, `CylinderMotor`.
- The character's hand holds the gun through your grip motor (see the Motor6D grips note). Animate the gun parts and the arms **in the same clip** so they stay in sync.

## Mark the clip

Add `KeyframeMarker`s in the Animation Editor at the key moments:

| Marker | When | Code does |
|---|---|---|
| `MagOut` | thumb releases the mag | play release click |
| `MagGrab` | left hand closes on the mag | switch `MagMotor.Part0` to the left hand |
| `MagDrop` | old mag leaves the hand (tactical) | clone a loose mag, unanchored, with a short lifetime |
| `MagIn` | new mag seated | switch `MagMotor.Part0` back to `Handle`, play insert click |
| `Commit` | point of no return | ammo is granted after this |
| `BoltRelease` | chamber slap (empty reload only) | play bolt sound |

Make two clips: `Reload_Tactical` (rounds left, shorter) and `Reload_Empty` (adds the bolt or slide, longer). Players notice and like the difference.

## Switching the magazine's parent

Changing `Part0` makes the magazine follow the new parent part from that frame on. Key the mag's motor so its pose relative to the **new** parent matches where it visually was a frame earlier, otherwise it pops. Practical way: in the editor, at the `MagGrab` frame, place the mag in the hand; the clip after that frame animates the mag relative to the hand.

```lua
local magMotor = gun.Handle.MagMotor
local leftHand = character:WaitForChild("LeftHand")

reloadTrack:GetMarkerReachedSignal("MagGrab"):Connect(function()
	magMotor.Part0 = leftHand
end)
reloadTrack:GetMarkerReachedSignal("MagIn"):Connect(function()
	magMotor.Part0 = gun.Handle
end)
reloadTrack.Stopped:Connect(function()
	magMotor.Part0 = gun.Handle -- always restore, even when cancelled
end)
```

If your clip animates the mag motor's `Transform`, also reset any leftover offset when the track stops.

## Interrupt rules

- **Before `Commit`:** sprinting, switching weapon or getting stunned cancels the reload with no ammo given. Stop the track with a short fade (0.1-0.15 s).
- **After `Commit`:** ammo is granted even if cancelled, or the reload cannot be cancelled. Pick one and be consistent; most shooters grant ammo at the seat.
- **Fire button during reload:** either ignore it or, for shotguns loading shell by shell, finish the current shell and stop.

## Who decides the ammo

The client plays the animation for instant feedback, but the **server** owns ammo. The client sends "reload started"; the server checks it is allowed, waits the clip's commit time (from config, not from the client's marker), then grants ammo. Store each weapon's reload time next to its animation ID so both sides agree.

## Priority and layering

- Play reloads at `Action` (or higher than your hold pose) and key only the arms, upper torso and gun parts; legs keep walking.
- Speed perks scale with `AdjustSpeed(1.25)`; scale the server's commit time by the same factor.

## Pitfalls

- Mag part welded with a `Weld` as well as the motor: the mag never leaves the gun.
- Dropped mag clones never cleaned up: add `Debris` lifetime or a pool, and only spawn them on clients (cosmetic).
- First-person viewmodels need the same marker logic on the viewmodel rig; keep marker names identical between the third-person and first-person clips.

## Related
[[Animation - Hub]] · [[Animating Tools and Weapons with Motor6D Grips]] · [[Animation Markers for Hit Frames, Footsteps and Sync]] · [[First-Person Viewmodels - Arms Rig, Camera Binding and Sway]]
