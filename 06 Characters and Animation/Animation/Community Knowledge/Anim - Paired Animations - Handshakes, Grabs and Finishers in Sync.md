---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Paired Animations - Handshakes, Grabs and Finishers in Sync"
tags: [roblox, community-knowledge, animation, paired-animation, grab, finisher, social]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/physics/network-ownership
  - https://devforum.roblox.com/t/animating-2-or-more-characters/1236189
  - https://devforum.roblox.com/t/how-to-make-a-grab-move/2435254
  - https://devforum.roblox.com/t/how-do-i-carry-players/294212
---
# Anim - Paired Animations - Handshakes, Grabs and Finishers in Sync

A paired animation is one moment played by two characters at once: a handshake or high five in a social hangout, a grab-and-throw in a fighting game, a takedown finisher, a hug emote. It only works if both characters stand in exactly the right spot relative to each other and both clips start on the same frame. DevForum threads agree on the core idea (animate both rigs together, then lock their relative position) and also warn about the usual failure: physics and network ownership pulling the characters apart, then a "snap back" at the end.

## Author both clips together

1. In the Animation Editor (or Blender), put **two rigs in one scene**, positioned exactly as they should stand at frame 0 (for example 3 studs apart, facing each other).
2. Animate both on the **same timeline length**. Key the interaction frames (hand contact, the grab, the hit) on the same frame for both.
3. Publish as two clips: `Shake_A` and `Shake_B`. Write down the **offset** of B's root relative to A's root at frame 0 (`A.root.CFrame:ToObjectSpace(B.root.CFrame)`). That CFrame is the contract your code must recreate.
4. Keep roots **in place** in both clips (no root travel), or the offset drifts.

## Play them in sync (server)

```lua
local PAIR_OFFSET = CFrame.new(0, 0, -3) * CFrame.Angles(0, math.pi, 0) -- B in front of A, facing A

local function playPair(charA, charB, trackA, trackB)
	local rootA, rootB = charA.HumanoidRootPart, charB.HumanoidRootPart
	rootA.Anchored, rootB.Anchored = true, true          -- freeze physics for both
	rootB.CFrame = rootA.CFrame * PAIR_OFFSET            -- recreate authored spacing
	trackA:Play(0.1); trackB:Play(0.1)                  -- same frame, same fade
	trackA.Stopped:Wait()
	rootA.Anchored, rootB.Anchored = false, false
end
```

Why anchor on the server: welding two player characters makes them one assembly with a single network owner, which DevForum posters report as jittery and unreliable for player-to-player carries. Anchoring both roots for a short (1-3 s) interaction avoids the ownership fight entirely. For long carries, see the alternatives below.

Tracks loaded on the server on a player's `Animator` replicate to everyone, so both participants and spectators see the same timing.

## Approach and alignment

- **Walk-in:** before starting, move B to the target spot with a short tween or `Humanoid:MoveTo` and wait (with a timeout) until within 0.5 studs, or just snap if the move is fast (most fighting games snap within 0.1-0.2 s and hide it with the clip's first motion).
- **Validate first:** both alive, not already in a pair, within range, line of sight, and B consents (social emotes) or is in a grabbable state (combat).

## Ending without a snap

The classic bug: the clip ends, the rig returns to its root, and the character pops back to where the root was. Fix options:

- Keep the root in place in the clip so the final pose sits where the root is.
- If the clip must move the body (a throw), add a marker `End` near the end and, on that marker, set the root CFrame to where the body visually ended before unanchoring. DevForum users recommend exactly this event-based correction.
- Unanchor after the fade-out, not before.

## Long carries and grabs

For carrying a player for many seconds:

- Make the carried player's parts `Massless`, disable their collisions with the carrier (collision group), and attach them with a weld or `RigidConstraint` to an attachment on the carrier.
- Set the carried humanoid to `PlatformStand` (or the `Physics` state) so it does not fight the weld.
- Expect the carrier's client to own the combined assembly; test with real latency.

## Pitfalls

- Different body scales: a tall avatar shaking hands with a small one misses the hand. Use IK on the hand toward the partner's hand attachment, or normalise scale during the interaction.
- One track loads late: the pair starts out of sync. Preload both clips and load the tracks before the interaction is offered.
- Exploits: a client asking to "grab" anyone anywhere. All pair starts must be validated on the server.

## Related
[[Animation - Hub]] · [[Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation]] · [[IKControl Recipes - Foot Planting, Aiming and Look-At]] · [[Root Motion on Roblox - Faking It with In-Place Clips]]
