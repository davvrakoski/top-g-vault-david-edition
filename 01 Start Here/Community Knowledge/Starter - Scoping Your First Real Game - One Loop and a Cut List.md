---
area: "01 Start Here"
cluster: "Start Here"
title: "Scoping Your First Real Game - One Loop and a Cut List"
tags: [roblox, community-knowledge, start-here, scope, game-design, planning]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/game-design/core-loops
  - https://create.roblox.com/docs/production/game-design/content-updates
  - https://create.roblox.com/docs/production/game-design
---
# Scoping Your First Real Game - One Loop and a Cut List

After a few practice obbies, most beginners announce their first "real" game: an open-world RPG with guilds, trading, pets, vehicles, a story mode and 40 weapons. Months later it is half-built and abandoned. The skill that separates shipped games from dead folders is **scope**: deciding what *not* to build. This note gives a beginner-sized method: define one loop, size every feature in days, cut until the first version fits in about four to six weeks, and keep a list for later. It pairs with [[One-Page Design Docs for Roblox Games]] (what to write down) and [[Beginner to Shipping Roadmap]] (where this fits in your learning).

## Step 1: write the loop in one sentence

Roblox's core-loop guide splits a game into three layers: the **minute-to-minute interaction** (what your hands do), the **most repeated set of actions** (what you do again and again), and the **progression engine** (why you keep going). Write one line for each:

| Layer | Example: a mining simulator |
| --- | --- |
| Minute to minute | Click rocks with a pickaxe |
| Repeated actions | Mine, fill your bag, sell at the shop |
| Progression | Buy better pickaxes and bigger bags, unlock deeper zones |

If you cannot write these three lines, you do not have a game yet, you have a theme. Everything in version 1 must serve these lines.

## Step 2: list every feature, then size it

Write every feature you want. Next to each, guess days of work **for you** (not for a pro). Beginners should double their first guess.

| Feature | Serves the loop? | Days (doubled) | v1? |
| --- | --- | --- | --- |
| Mining rocks, ore drops | yes | 4 | yes |
| Sell shop + coins | yes | 3 | yes |
| 5 pickaxe upgrades | yes | 3 | yes |
| 3 zones with unlock gates | yes | 5 | yes |
| Saving (DataStore) | yes | 3 | yes |
| Game pass: 2x bag | yes | 1 | yes |
| Pets that follow you | no | 8 | later |
| Trading | no | 10+ | later |
| Quests and story NPCs | partly | 8 | later |
| Custom vehicles | no | 10 | cut |

## Step 3: cut to a four-to-six-week version 1

Add up the "yes" column. If it is over about 30 working days, cut more. Rules for cutting:

- **Keep anything the loop breaks without.** Mining, selling, upgrades, saving.
- **Cut systems that need other players to be fun** (trading, guilds, PvP) from a first release. You will not have the player count yet.
- **Cut anything with a heavy security surface** (trading, player-made content) until you are confident with server validation.
- **Prefer more content over more systems.** A sixth pickaxe takes an hour; a new system takes a week.
- **Monetisation: one or two simple items** (a game pass, a small developer product), not a full shop.

The "later" column is not a graveyard. It is your **update plan**. Roblox's content-update guide recommends keeping each update's effort under about **three weeks** so you can release regularly; each later feature becomes one update after launch.

## Step 4: define "done" for version 1

Write the finish line before you start, so you know when to publish:

- [ ] A new player understands what to do within 30 seconds, without reading
- [ ] The full loop works for 20-30 minutes of play
- [ ] Data saves and loads (tested by leaving and rejoining, and with 2 players)
- [ ] Works on a phone (Device emulator, touch buttons reachable)
- [ ] No obvious exploits: rewards decided on the server
- [ ] Icon, thumbnails, description ready ([[Publishing Your First Experience - 2026 Release Checklist]])

## Warning signs you are over-scoped

- You are building systems "for later" (an inventory that supports 500 items when you have 6).
- Week three and the loop is still not playable end to end.
- You keep restarting in a new place because the old code is "messy".
- The feature list grows every time you watch a video of a popular game.

When you see these, stop and play your game for ten minutes. Then cut one thing.

## Why small wins

A small finished game teaches you publishing, analytics, player feedback and updating, which a big unfinished one never does. Your second game will be bigger because you will know which parts actually take time. Read your first week of numbers with [[Your First Week of Analytics - Which Numbers to Read First]] and let players tell you which "later" feature to build first.

## Related
[[00 START HERE - Top G Vault]] · [[One-Page Design Docs for Roblox Games]] · [[Beginner to Shipping Roadmap]] · [[Core Loop and Session Design for D1 and D7 Retention]] · [[Your First Week of Analytics - Which Numbers to Read First]]
