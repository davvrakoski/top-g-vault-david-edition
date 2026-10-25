---
area: "07 AI and Combat"
cluster: "Combat"
title: "Killcams and Death Recaps - Rolling Buffers and Damage Summaries"
tags: [roblox, community-knowledge, combat, killcam, death-recap, replay, ui]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://wiki.leagueoflegends.com/en-us/Death_recap
  - https://devforum.roblox.com/t/how-would-i-go-about-creating-a-var-system-for-roblox-tps/2278552
  - https://devforum.roblox.com/t/2542237
  - https://gdcvault.com/play/1024053/Replay-Technology-in-Overwatch-Kill
  - https://create.roblox.com/docs/reference/engine/classes/ViewportFrame
  - https://create.roblox.com/docs/reference/engine/classes/WorldModel
---
# Killcams and Death Recaps - Rolling Buffers and Damage Summaries

Players who die without knowing why quit. A **death recap** (who hurt you, with what, how much) and a **killcam** (a few seconds of replay from the killer's side) turn "that was cheating" into "oh, he flanked me". They also expose real cheating to your own testers. Overwatch gave a GDC talk on its replay technology for kill cams and highlights; League of Legends shows a detailed death recap. On Roblox both can be built from data you already have if your damage goes through one function.

## Part 1: death recap (cheap, do this first)

League's recap shows combat time, total damage taken, the top enemies by damage with a physical/magic/true split, and a per-source breakdown, all since entering combat. You can build the same from a per-victim **damage log**:

```lua
-- inside your single damage function (server)
local log = recentDamage[victim] or {}
table.insert(log, { t = now, from = attackerId, source = weaponId, amount = dealt, type = dmgType })
-- drop entries older than 15 s
```

On `Humanoid.Died`, summarize: group by attacker, then by source, sort by damage, keep the top 5, add the killing blow and its distance. Send one remote to the victim. Total payload is a few hundred bytes.

Display: killer name and avatar headshot, weapon icon, "HP lost per attacker" bars, and the final hit's distance and hit zone (headshot or not). Add a **Report** button here; it is the moment players want it.

## Part 2: killcam from a rolling buffer

The DevForum VAR-replay advice is the standard approach:

- Record **CFrames** of the things you want to replay (characters' root and limb parts or just roots plus animation state, projectiles) every Heartbeat or at a fixed rate.
- Keep a **rolling buffer** (they suggest dropping frames older than ~30 s; a killcam needs only 4-6 s).
- Record on the server so one client's lag does not corrupt the record.
- Play back inside a `ViewportFrame` with a `WorldModel` (so animations and raycasts work), or by moving cloned dummies in a hidden area of the workspace.

Budget tip: 12 players × 15 parts × 20 Hz × 6 s = 21,600 CFrames. Record only the root CFrame and the current animation id per character at 20 Hz, and re-animate the clones locally; it is a fraction of the data.

## Killcam flow

1. Victim dies; server takes a copy of the last 5 s of the buffer for the killer and victim (plus anyone within 50 studs).
2. Server sends it to the victim compressed (positions rounded to 0.1 stud, angles to 1 degree), or the client keeps its own buffer of replicated positions and needs nothing from the server.
3. Victim client clones simple rigs, plays the buffer from the killer's camera (head CFrame plus look direction), then shows the recap.
4. **Skippable** after 1 s; never delay respawn more than the respawn timer.

The **client-side buffer** option is cheaper: every client already receives other players' positions. Each client records the last 6 s of what it saw; on death it replays that from the killer's position. It shows the victim's view of the world (with its latency), which is fine for most games.

## When a killcam is not worth it

- Very fast games where respawn is under 3 s: show the recap only.
- Many-NPC horde games: show "killed by Brute, 42 dmg" plus a freeze-frame camera pointing at the killer for 1.5 s (`Camera.CFrame = CFrame.lookAt(...)`).

## Pitfalls

- Killcam reveals hiding places in competitive modes; consider skipping it in ranked or showing it only after the round.
- Replaying with the real character models' scripts enabled (sounds, hit effects firing again). Use script-free clones.
- Memory growth from never trimming buffers on long servers.

## Related
[[Combat - Hub]] - [[Kill Credit, Assists and Damage Attribution]] - [[Lag Compensation and Server Rewind for Melee and Hitscan]] - [[Headshots and Hit Zones - Damage Multipliers and Accessory Hits]]
