---
area: "14 Testing and QA"
cluster: "Testing"
title: "Team Test - Collaborative Playtesting in Studio"
tags: [roblox, community-knowledge, testing, team-test, studio, collaboration]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/projects/collaboration
  - https://devforum.roblox.com/t/marketplaceserviceprocessreceipt-is-not-called-in-team-test/3983692
  - https://devforum.roblox.com/t/mock-purchases-in-studio/26974
---
# Team Test - Collaborative Playtesting in Studio

Local "Server & Clients" tests run every player on your own machine. **Team Test** is different: it runs a real server session that other collaborators join from their own Studio, on their own hardware and network. It is the quickest way to test social features, real latency between people and "does this work for someone who is not me" without publishing a build to a test place.

## How it works (from the testing-modes docs)
1. Work in a place with **Collaboration** enabled and the testers added as collaborators.
2. In the Test tab's play dropdown choose **Team Test**, then press **Play**. A new Studio session opens with your character.
3. Other collaborators press **Play** in their own Studio mezzanine to join.
4. Only **one Team Test session** can run at a time. **End Session** closes it and kicks everyone.

## When to use which mode
| Need | Mode |
|---|---|
| Fast replication check, solo | Play (F5) or Server & Clients with 1-2 clients |
| Up to 8 simulated players on your PC | Server & Clients, or StudioTestService from a plugin |
| Real people, real devices, before publishing | **Team Test** |
| Purchases, teleports, DataStores exactly as in production | Published **test place** |

## A 20-minute Team Test script
1. **Before:** commit or save scripts (Team Test uses the current place state), write 3-5 goals in a shared doc ("trade between two players", "race with 4 cars").
2. **Join:** everyone joins and calls out their device (PC, laptop, controller). One person is the note-taker.
3. **Run each goal** twice: once normally, once trying to break it (spam, leave mid-action, both do it at once).
4. **Capture:** note-taker writes symptom + who + time; anyone seeing an error copies it from Output immediately.
5. **End Session**, then triage together for 5 minutes while it is fresh.

## Known gaps
- **ProcessReceipt.** A DevForum bug report says that in Team Test a developer product purchase succeeds but `MarketplaceService.ProcessReceipt` is never called, and staff said a short-term fix was not planned (check the thread for current status). Test purchase granting in a normal Studio Play session (purchases there are simulated and not charged, per the long-standing mock purchases announcement) and again in a published test place.
- **Not a production server.** Do not treat Team Test performance as live server performance; measure that with the Developer Console server stats in a published test place.
- **Not everyone has edit rights.** Team Test needs collaborators. For outside playtesters, use a private test place or a group-restricted experience instead (see [[Test Places, Staging Universes and Places in a Universe]]).
- **Data.** Team Test can hit real DataStores if Studio API access is on. Point tests at a test universe or prefixed keys ([[Studio API Access and Data Safety During Testing]]).

## Tips
- Pair Team Test with **Network owners** visualization to watch physics ownership move between real players.
- Keep a "Team Test" checklist note per milestone so each session tests the newest risky systems first.
- Ask at least one tester to join on a laptop with no gamepad and one with a gamepad; it doubles input coverage for free.

## Related
[[Testing - Hub]] · [[Playtest Scripts and Session Facilitation]] · [[Device, Network and Controller Simulation Test Pass]] · [[Multi-Client Integration Recipes with StudioTestService]]
