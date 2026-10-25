---
area: "01 Start Here"
cluster: "Start Here"
title: "Beginner to Shipping Roadmap"
tags: [roblox, community-knowledge, start-here, roadmap, learning-path]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/curriculum-overview
  - https://create.roblox.com/docs/tutorials/curriculums/core
  - https://create.roblox.com/docs/production/publishing/publish-games-and-places
  - https://devforum.roblox.com/t/starting-with-scripting/3660990
  - https://devforum.roblox.com/t/about-the-scripting-support-category/45863/1
---
# Beginner to Shipping Roadmap

"Where do I start and what do I learn next?" is the most common beginner question. This roadmap turns it into seven stages, each ending with a **shipped** thing rather than a finished tutorial, because finishing small games teaches what tutorials cannot: scope, bugs under real players, and publishing. Each stage lists the skills, the project, and the vault notes to use. Time estimates are rough guides for a few hours a week, not rules.

## Stage 0: Studio comfort (week 1)

- Skills: camera, Explorer, Properties, Toolbox safety, testing, saving.
- Project: decorate a Baseplate into a small scene; save checkpoints.
- Notes: [[Install Studio and Your First Hour - Interface Tour]] · [[Explorer, Properties and Toolbox - Beginner Field Guide]] · [[Studio Keyboard Shortcuts Cheat Sheet]]
- Done when: you can build, test, stop and restore a version without help.

## Stage 1: first scripts (weeks 2-3)

- Skills: variables, if, loops, functions, events, debounce, Output.
- Project: five tiny scripts (colour changer, kill brick, timed bridge, counter, spinning part).
- Notes: [[Your First Luau Script - Step by Step]] · [[Luau Basics Cheat Sheet - Variables, Tables, Loops, Functions]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]]
- Done when: you fix your own errors from the Output line number.

## Stage 2: ship game #1, an obby (weeks 3-5)

- Skills: anchoring, checkpoints, leaderstats, publishing, phone testing.
- Project: 10-20 stage obby, released publicly.
- Notes: [[First Obby in 30 Minutes]] · [[First Leaderboard with leaderstats]] · [[Publishing Your First Experience - 2026 Release Checklist]]
- Done when: a friend you did not help finishes it on a phone.

## Stage 3: client/server and saving (weeks 5-8)

- Skills: where scripts go, RemoteEvents, server validation, DataStores, UI buttons.
- Project: add saving and a UI shop menu to the obby, or start a one-plot tycoon.
- Notes: [[Client and Server in Plain Words]] · [[Where Scripts Go - Containers, Script Types and RunContext]] · [[First RemoteEvent - Button on the Client, Reward on the Server]] · [[First DataStore Save - Load, Save, Leave and Shutdown]] · [[First GUI Button - ScreenGui, TextButton and Activated]]
- Done when: progress survives rejoining, tested in Server & Clients.

## Stage 4: ship game #2 with a loop and monetisation (weeks 8-14)

- Skills: tycoon or simulator loop, tools, sound, tweens, badges, a pass, ModuleScripts.
- Project: small tycoon/simulator with one pass and 3-5 badges.
- Notes: [[First Tycoon Dropper - Dropper, Conveyor and Collector]] · [[First Shop - Selling a Game Pass and Opening the Built-in Shop]] · [[First Tool - A Sword or Flashlight You Can Equip]] · [[First Badge - Award on Achievement]] · [[First Sound - Background Music and a Click Sound]]
- Done when: strangers play it and you can read their behaviour in the Dashboard analytics.

## Stage 5: multiplayer and structure (months 4-6)

- Skills: rounds, teams, module architecture, CollectionService, security basics, performance basics.
- Project: a round-based game (tag, team battle, survival) with a lobby.
- Notes: [[First Team Game - Teams and SpawnLocations]] · [[Lobby and Round System Blueprint]] · [[Module Architecture for a 50k-Line Roblox Game]] · [[Security and Anti-exploit Design]]
- Done when: 6+ players can play several rounds with no desync or exploits you know of.

## Stage 6: production habits (months 6+)

- Skills: Git with Script Sync or Rojo, testing, analytics, LiveOps, thumbnails and icons, update cadence.
- Project: pick your best game, plan 4-6 weeks of updates, run them.
- Notes: [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Analytics Instrumentation Plan]] · [[Thumbnail and Icon A - B Test Playbook]] · [[Release Checklist]]

## Rules that apply at every stage

1. **Finish before you expand.** A small finished game beats a big unfinished one; scope creep is the most common reason projects die ([[Why Games Fail - Twelve Causes and Fixes]]).
2. **Build, do not just watch.** DevForum advice for beginners: practise every concept in Studio and build small unrelated systems.
3. **Search, then ask well.** The Scripting Support template: what you want, what is wrong, what you tried.
4. **Server decides, client asks.** From Stage 3 on, every feature follows this.
5. **Test on a phone and with 2 players** before each release.
6. **Save named checkpoints** before risky changes.

## Optional official track alongside

The Creator Hub's curriculum path (Studio lesson, first game, Luau basics, then the **Core curriculum** and the **advanced paths**: environmental art, gameplay scripting, UI design) maps cleanly onto Stages 0-5. See [[Learning Resources - Official Courses and DevForum Categories]].

## Related
[[00 START HERE - Top G Vault]] · [[12-Week Roblox Developer Curriculum]] · [[Master Build Order]] · [[Common Beginner Mistakes and Their Fixes]] · [[30 Official Roblox Docs/Tutorials/Curriculums/Core/Core curriculum|Core curriculum (official)]]
