---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Genre Picker - Which Shared Test Passes Each Genre Needs"
tags: [roblox, community-knowledge, testing, qa, genre-qa, test-planning]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/scripting/security/security-tactics
---
# QA Pass - Genre Picker - Which Shared Test Passes Each Genre Needs

This vault has two kinds of QA notes: genre passes (the "QA Pass - ..." notes, one per genre) and shared passes (join/leave, dupes, purchases, streaming, saves and so on) that apply to many games. Small teams cannot run all of them every update. This page maps each genre to its own pass plus the three shared passes most likely to catch that genre's worst bugs, and gives the one test to run if you only have five minutes.

## How to use it
1. Find your genre (hybrids: take both rows and merge).
2. Run the genre pass in full before a launch or a big update.
3. Run the three shared passes when the update touches that system (see the Change Impact Map note).
4. Run the five-minute test on every update, even a hotfix. Studio's multi-client testing (Test tab, several clients and a server) covers most of them.

## Genre to pass map

| Genre | Genre pass | Shared passes that matter most | Five-minute test |
|---|---|---|---|
| Tower defense | [[QA Pass - Tower Defense - Pathing, Wave Scaling, Tower Stacking and AFK Farms]] | Remote fuzzing, Economy regression, Teleport flow | Jump to the last wave; enemies still move and the wave ends |
| Simulator | [[QA Pass - Simulator - Multiplier Overflow, Rebirth Resets and Big Numbers]] | Economy regression, Save migration, Purchase testing | Set currency to 1e300, buy and rebirth once |
| Tycoon | [[QA Pass - Tycoon - Plot Ownership, Droppers After Rejoin and Collector Credit]] | Join/leave/respawn, Soak test, DataStore failure | Buy 5 buttons, rejoin, compare plot to save |
| Obby | [[QA Pass - Obby - Checkpoint Skips, Respawn Spawns and Stage-Skip Purchases]] | Purchase testing, Join/leave/respawn, Low-end device | Buy skip stage in Studio; character moves and stage saves |
| Horror | [[QA Pass - Horror - Monster Stuck Spots, Softlocks and Darkness Readability]] | Low-end device, StreamingEnabled, Accessibility | Low graphics on a phone: find the objective in the first room |
| Battlegrounds / fighting | [[QA Pass - Battlegrounds and Fighting - Hitbox Desync, Combo Loops and Spawn Kills]] | Combat regression, Device and network simulation, Remote fuzzing | Two testers trade M1s at 200 ms simulated lag |
| Roleplay | [[QA Pass - Roleplay - Job Abuse, House Permissions and Chat Safety]] | Child safety, Localization (custom text), Exploit QA | Type a filtered phrase into every custom text box |
| Racing | [[QA Pass - Racing - Lap Cheats, Car Collisions and Fair Starts]] | Device and network simulation, Low-end device, Combat regression (collisions) | Reverse over the finish line and forward again |
| Survival | [[QA Pass - Survival - Resource Respawns, Base Griefing and Raids]] | Dupe hunting, Soak test, Server lifecycle chaos | Three players hit one node; total yield is one node |
| Pet / egg | [[QA Pass - Pet and Egg Games - Odds Display vs Real Odds, Hatch Dupes and Inventories]] | Dupe hunting, Purchase testing, Analytics events | Turn on a luck boost; the odds board changes |
| Round-based minigames | [[QA Pass - Round-Based Minigames - Round Desync, Late Joiners and Winner Edge Cases]] | Join/leave/respawn, StreamingEnabled, Server lifecycle chaos | Join mid-round; state and timer are right |
| Trading | [[QA Pass - Trading Games - Scam-Proof Trade UI and Trade Dupes]] | Dupe hunting, DataStore failure, Child safety | Swap an item just before the partner accepts |
| Story / chapters | [[QA Pass - Story and Chapter Games - Save State per Chapter, Replays and Party Progress]] | Save migration, Teleport flow, Join/leave/respawn | Replay chapter 1 after finishing chapter 3 |

## Shared passes referenced above
- [[Test - Join, Leave and Respawn Edge-Case Pass]]
- [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]]
- [[Test - Economy Regression Checklist - Currency, Rewards and Sinks]]
- [[Testing Purchases - Developer Products, Passes and ProcessReceipt]]
- [[Test - Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers]]
- [[QA - DataStore Failure Testing - Fault Injection and Retry Checks]]
- [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]]
- [[Test - StreamingEnabled QA Pass - Forcing Stream-Out and Catching Nil Bugs]]
- [[Test - Server Lifecycle Chaos Pass - Shutdowns, Restarts and Rejoins]]
- [[Test - Child Safety QA - Filter Coverage, Chat Permissions and Policy Flags]]
- [[Low-End Device and Console Hardware Test Pass]]
- [[Soak Tests - Long-Session Memory and Leak Checks]]

## Patterns that repeat across genres
- **The client claims, the server believes.** Placement (TD, tycoon, survival), hits (fighting), checkpoints (obby, racing), finishes (rounds, story). Every genre pass has a version of "fire the remote with a lie".
- **Leave at the worst moment.** During a hatch, a trade, a rebirth, a round end, a chapter results screen. One join/leave pass per update catches most of these.
- **Two of the same thing in one frame.** Two claims, two accepts, two rewards, two end conditions. Multi-client tests and remote fuzzing find them; solo play never does.
- **Shown vs real.** Multipliers, odds, timers, prices. If the UI computes a number the server also computes, test that they agree; for paid random items it is a policy requirement.

## Related
[[Testing - Hub]] - [[Test - Change Impact Map - Picking Which Regression Passes to Run]] - [[QA Test Plan Template for Roblox Experiences]] - [[Full Test Matrix]]
