---
area: "01 Start Here"
cluster: "Start Here"
title: "Studio Testing Modes for Beginners - Test, Run and Server and Clients"
tags: [roblox, community-knowledge, start-here, testing, studio, playtest]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/studio/developer-console
  - https://create.roblox.com/docs/production/publishing/publish-games-and-places
---
# Studio Testing Modes for Beginners - Test, Run and Server and Clients

Pressing Play is not one thing. Studio has several test modes, and each one catches different bugs. Solo **Test** hides most multiplayer problems; **Server & Clients** reveals them. Knowing which mode to use, and the "edits during a test are lost" rule, prevents two of the most painful beginner experiences: "it worked for me" and "where did my last 20 minutes of building go".

## The modes

| Mode | Key | What happens | Use it for |
| --- | --- | --- | --- |
| **Test** | F5 | Spawns your avatar at a SpawnLocation (or near 0, 100, 0) | Everyday gameplay checks |
| **Test Here** | - | Spawns you in front of the Studio camera | Testing one far-away section without walking |
| **Run** | F8 | Simulates physics and scripts, no avatar; free camera | Watching machines, NPCs, physics |
| **Server & Clients** | F7 | Opens a server window plus 1 to 8 client windows | Anything multiplayer: remotes, leaderboards, replication |
| **Team Test** | - | A shared test session collaborators can join | Testing together in Team Create |

Stop any test with **Shift+F5** (or **End Session** for Server & Clients).

## Solo tests run two simulations

Even solo **Test** runs a client and a server. The **Client/Server** toggle switches what you inspect:
- **Client** view: blue border, you control your character, Explorer shows what the client has (your `PlayerGui`, `Backpack`, `PlayerScripts`).
- **Server** view: green border, free camera, Explorer shows server-only things like `ServerScriptService`.

Exercise: in Client view, delete a wall. Switch to Server: the wall is still there. That is replication in one click (see [[Client and Server in Plain Words]]).

## Pause, step and frame-by-frame

While solo testing you can **Pause** physics and animations and **Step Forward** one 1/60 s frame. Pausing does not stop scripts, and `Heartbeat`/`RenderStepped` keep firing, so camera scripts keep running. Use it to inspect a collision or a ragdoll mid-motion.

## Server & Clients: the multiplayer check

1. Choose **Server & Clients** in the dropdown and set the client count (2 is usually enough).
2. Press Play (F7). You get one server window and one window per player.
3. In each client, check that the other player sees your changes: doors you open, coins you collect, tools you hold.

Bugs this catches that solo Test hides: leaderboard values that only update for the first player, a door opened by a LocalScript (only that player sees it open), shared debounces that block everyone, and `PlayerAdded` handlers that miss players.

## Simulators

- **Device Simulator**: preview phone and tablet screens, touch controls, safe areas.
- **Controller Emulator**: test gamepad and VR controllers without hardware.
- **Network Simulator**: add latency, jitter and packet loss to see how your game feels on mobile data.

A large share of Roblox players are on phones, so test the phone view before every publish. See [[Device, Network and Controller Simulation Test Pass]].

## Testing with real people before release

Once published (still private), **File > Invite early testers** lets you invite up to 10 similar-aged friends to preview the game. They see a preview watermark; normal safety tools stay on. This is the cheapest real-world test you will ever get.

## The golden rule

**Anything you build or edit while a test is running is discarded on Stop.** If you tweak a value mid-test and like it, write it down, stop, and apply it again in edit mode. Watch for the coloured border before you edit.

## Quick test checklist before each publish

- [ ] Solo Test: no red errors in Output
- [ ] Server & Clients with 2 players: shared state matches on both
- [ ] Phone view in Device Simulator: UI readable and buttons reachable
- [ ] Leave and rejoin (for saving): data comes back

## Related
[[00 START HERE - Top G Vault]] · [[Debugging Basics - Output, print, warn and Breakpoints]] · [[Works in Studio, Breaks Live - Checklist]] · [[Multi-Client Integration Recipes with StudioTestService]] · [[30 Official Roblox Docs/Studio/Studio testing modes|Studio testing modes (official)]]
