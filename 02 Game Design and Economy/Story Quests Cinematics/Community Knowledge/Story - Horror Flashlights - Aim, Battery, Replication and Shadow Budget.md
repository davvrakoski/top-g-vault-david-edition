---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Horror Flashlights - Aim, Battery, Replication and Shadow Budget"
tags: [roblox, community-knowledge, story, horror, lighting, flashlight, spotlight]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/reference/engine/classes/SpotLight
  - https://devforum.roblox.com/t/advanced-flashlight-horror-game/1972508
  - https://devforum.roblox.com/t/a-moving-flashlight/2521276
  - https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent
---
# Horror Flashlights - Aim, Battery, Replication and Shadow Budget

In a dark horror map the flashlight is the camera, the UI and the main resource all at once. Where it points is what the player knows. When it dies, the game gets scarier without a single new monster. A beginner flashlight (a Tool with a `SpotLight` you toggle) is covered in [[First Tool - A Sword or Flashlight You Can Equip]], and general light costs in [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]]. This note covers the horror-game version: **aim that follows the camera, a battery that creates tension, other players' beams that replicate cheaply, and a strict shadow budget.**

## 1. Aim with the camera, not the hand

A light parented to the tool handle points wherever the hold animation points, which is usually the floor. For horror, the beam should follow where the player looks.

- Create the light **locally** on an invisible part or an attachment that you move to the camera every frame (`RenderStepped` or `BindToRenderStep`).
- Offset it slightly below and right of the camera (for example `CFrame.new(0.6, -0.5, 0)`) so the cone edge is visible on walls; a light exactly at the eye looks flat.
- Add a little **lag**: lerp the light's rotation toward the camera at about 15-20 per second (frame-rate independent, see [[Frame-Rate Independent Camera Smoothing]]). A beam that trails your turn feels heavy and physical.

A DevForum horror flashlight module ("Advanced Flashlight (Horror Game)") is built to run only on the client for this reason: if the server drives it, everyone sees the beam glued to *their own* camera.

## 2. Settings that look good and stay cheap

| Property | Starting value | Why |
|---|---|---|
| `SpotLight.Angle` | 45-60 | Narrow cone = more darkness at the edges (max is 180) |
| `SpotLight.Range` | 30-45 studs | Long enough to see a corridor, short enough to hide the end |
| `Brightness` | 1.5-3 | Higher washes out close walls |
| `Color` | slightly warm white (255, 240, 220) | Pure white reads as clinical |
| `Shadows` | **true for the local player only** | The one shadow-casting light that matters |

Add a faint `PointLight` (Range 6-8, Brightness 0.3, Shadows off) at the same spot so the player's own hands and the floor at their feet never go fully black.

## 3. Battery as tension

- Drain at a fixed rate while on (for example 100 units over 4-6 minutes). Show it as a small diegetic indicator (the bulb dims) plus an optional bar.
- Below 20%, add **flicker**: random short dips in `Brightness` 1-2 times per second. Keep it irregular and slow to stay within flash-safety rules ([[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]]).
- Batteries are loot. Place them in risky rooms, not safe rooms, so recharging means exposure.
- **Monster link:** the monster can notice beams (the beam hitting the monster raises its alert), or the flashlight flickers when a specific entity is near. Either way, players learn when to turn it off.
- Battery state lives on the **server** (it is a resource). The client asks to toggle; the server confirms and updates an attribute the client reads.

## 4. Other players' flashlights (replication)

Your own beam is local. Teammates need to see each other's beams, but cheaply:

1. Each client sends its look direction to the server at **10-15 Hz** through an `UnreliableRemoteEvent` (lost packets do not matter; the next one replaces them).
2. The server validates (is the flashlight on, does the player own one) and re-broadcasts, or stores the direction as an attribute on the character.
3. Other clients render a **simple remote beam**: a `SpotLight` with `Shadows = false`, shorter range, plus an optional `Beam` or cone mesh for a visible light shaft. Smooth toward the latest direction.

One DevForum tutorial ("A moving flashlight") instead sends the camera direction to the server and rotates the arm joint so the held light aims for everyone; the author notes it was built for R6 in first person. Either approach works; the important part is that the per-frame aim stays on each client.

## 5. Shadow budget

- Exactly **one** shadow-casting moving light per client: your own flashlight.
- Remote flashlights: shadows off. With four players in one room, four moving shadow lights is where frame rate dies on phones.
- Turn off remote beams beyond 80-100 studs, or when that player is not on screen.
- Test on the weakest phone you support with the whole party in one room, all lights on.

## Pitfalls

- **Flashlight replaces level lighting.** Players must still be able to find the exit without it, just slowly ([[Horror Map Design - Pacing, Loops and Readable Darkness]]).
- **Light through walls:** a SpotLight with shadows off lights rooms behind thin walls. Keep thick walls or keep shadows on for the local beam.
- **Toggle spam** for strobe effects: rate-limit the toggle (0.2 s).

## Related
[[Story Quests Cinematics - Hub]] · [[Local Light Budgets - PointLight, SpotLight and SurfaceLight]] · [[First Tool - A Sword or Flashlight You Can Equip]] · [[Horror Starter Architecture]]
