---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "What a Client Controls on Its Own Character - Replication Exceptions"
tags: [roblox, community-knowledge, networking-security, replication, filteringenabled, character, exploits]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/client-server
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/SoundService#RespectFilteringEnabled
  - https://create.roblox.com/docs/physics/network-ownership
  - https://devforum.roblox.com/t/humanoid-state-still-replicating-to-the-server-on-locally-created-humanoid/2981043
  - https://devforum.roblox.com/t/2389743
---
# What a Client Controls on Its Own Character - Replication Exceptions

"FilteringEnabled means client changes do not replicate" is true for most of the DataModel, and false for the one object exploiters care about most: **their own character**. Several systems deliberately let the owning client drive the server's copy so movement and animation feel instant. Every anti-exploit and combat check must start from this list, because anything on it is attacker-controlled input, not server truth.

## What does replicate from the owning client

| Channel | Why it replicates | What an exploiter can do |
| --- | --- | --- |
| **Physics of parts it owns** (its character by default) | Network ownership: the owner simulates and sends CFrame/velocity | Speed, fly, noclip-like movement, teleport, spin, fling other unanchored parts it touches |
| **Animations on its character's Animator** | The Animator docs: animations started on the player's client for their own character replicate | Play any animation the game can load (including emotes or attack animations) at any time and speed |
| **Some Humanoid state changes** | Humanoid state machine runs on the owner | Force Jumping/Freefall/PlatformStand states; forum reports confirm states replicate while Health does not |
| **Tool equip / unequip** | Equipping is driven by the client moving the Tool between Backpack and character | Equip tools out of sequence, drop tools if `CanBeDropped` is on |
| **Sounds, only if `SoundService.RespectFilteringEnabled` is false** | Legacy compatibility | Play sounds for everyone; keep it **true** |

Forum threads also report edge cases (for example removing parts of one's own character) whose replication has changed over time; treat any client-owned descendant of the character as untrusted and verify with a two-client Studio test before relying on it.

## What does not replicate

- Health, attributes, values, leaderstats, GUIs and parts the client does not own.
- New instances the client creates (they exist only locally), including a locally created Animator: tracks loaded through it will not replicate.
- Property changes on anchored or server-owned parts.

## Design rules that follow

1. **Never read the character as truth for game rules.** Position is a claim. Use server-side distance/speed sanity checks before awarding pickups, opening doors or applying melee hits.
2. **Animations are cosmetic; hit windows are server-timed.** An exploiter can play the heavy-attack animation without the cooldown, so damage must come from a server state machine, not from "the attack animation is playing" or from animation events received over a remote.
3. **Tools: validate Activated on the server.** Check the tool is equipped (parented to the character), the cooldown, the ammo and the target, on the server.
4. **Prefer server ownership for things that matter.** NPCs, projectiles and loot should be server-owned (`SetNetworkOwner(nil)`) so clients cannot push them.
5. **Lock fling vectors.** Unanchored loose parts near players can be flung by client-owned characters; anchor decor or give it its own collision group.
6. **Do not grant on Touched alone.** Touched fires from the owner's physics; combine it with a server-side distance check.
7. **Consider server authority** (the newer Server Authority model) if competitive movement fairness matters more than responsiveness; it moves simulation of characters to the server with client prediction.

## Quick self-test

In Studio, start a 2-player local server. On Client 1, use the command bar (client context) to change your character's position, play an animation, set Humanoid state and change Health. Watch the server view: the first three appear, Health does not. Anything that appears is on your "must validate" list.

## Related
[[Networking Security - Hub]] - [[Network Ownership and Physics Replication]] - [[Server-Side Movement Validation and Anti-Exploit Checks]] - [[Security and Anti-exploit Design]]
