---
area: "16 Fast Game Kit"
cluster: "Playbook"
tags: [fast-game-kit, roblox, playbook, scope, mvp]
cssclasses: [tg-a16]
---

# Scope Cutter - What to Build First

## Why this matters
Scope, not skill, is the most common reason Roblox games never ship. Every feature you add before launch is a feature you have not tested on real players.
This note is a set of rules and checklists for cutting a game down to the smallest version that is still fun, so the rest can be added as updates.

## The one-sentence test
Write your game as: **"You [action] to get [reward] so you can [upgrade], then [repeat bigger]."**
- If you need "and" twice, you have two games. Pick one.
- If the reward is not visible on screen within 30 seconds, the loop is too slow.
- Source method: [[Starter - Scoping Your First Real Game - One Loop and a Cut List]] · [[Core Loop and Session Design for D1 and D7 Retention]].

## The 10 MVP rules
1. **One loop, one map, one mode.** Extra modes split a small player base ([[Empty Server Problem - Bots, Lead-In Areas and Community]]).
2. **Fun in grey boxes first.** If it is not fun with parts and the [[Kenney - Prototype Kit]], art will not save it.
3. **Plumbing is reused, not built.** Saving, currency, purchases, remotes, analytics, settings come from [[Starter Code - Hub]]. Do not rewrite them per game.
4. **Content is data.** Every cost, reward and cooldown lives in one config module so balancing is editing numbers ([[Config Feature Flags and Content Data]]).
5. **30 minutes of goals at launch is enough.** Add the next 30 minutes in update #1.
6. **One art family.** Pick one kit style (Kenney, KayKit or Poly Haven realistic) and stay in it ([[Stylized vs Realistic Art Direction on Roblox]]).
7. **Phone first.** Over half of a typical audience plays on phones; if the HUD fails on a phone, the game fails ([[Platform - Roblox Device Share Stats and What They Mean for Design (dated)]]).
8. **Server decides.** Anything that gives currency, damage or items is validated on the server from day one. Retrofitting security costs more than building it in ([[Threat Modeling Every Roblox Feature]]).
9. **No feature without a metric.** If you cannot say which number it moves (D1, session length, conversion), cut it ([[Analytics Instrumentation Plan]]).
10. **Ship date beats feature list.** When a feature threatens the date, the feature moves.

## Feature triage table
Score each feature: **Must** (loop breaks without it), **Should** (big retention/revenue effect, cheap), **Later** (everything else).

| Feature | Usually | Why |
|---|---|---|
| Core action + reward | Must | It is the game |
| Saving | Must | Players who lose progress do not return |
| Upgrade ladder (3+ tiers) | Must | Gives a reason to keep playing |
| Onboarding (first 30 s) | Must | Most players decide in the first minutes ([[First 10 Minutes Retention Design]]) |
| Mobile HUD | Must | Phone players |
| Analytics funnel | Must | You cannot fix what you cannot see |
| 2-3 passes + 1-2 products | Should | Cheap with the Starter Code kit |
| Daily reward + codes | Should | Cheap, helps D1 ([[Daily and Weekly Reward Blueprint]]) |
| Leaderboard | Should | Cheap social goal ([[Leaderboard Blueprint]]) |
| Second zone/world | Should | Only if the first one is finished |
| Trading | Later | Dupe and scam risk, policy gates ([[Trading Economy Design - Trade Windows, Value and Policy Gates]]) |
| Clans/guilds | Later | Multi-writer data problems |
| Quests with dialogue | Later | Content-heavy |
| Paid random items (eggs, crates) | Later unless core | Needs odds UI + PolicyService ([[Paid Random Items, Odds Disclosure and PolicyService]]) |
| Custom character rigs | Later | Breaks avatar items, costs weeks ([[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]) |
| Open world > 1 km | Later | Streaming bugs ([[StreamingEnabled Gotchas and Streaming-Safe Client Code]]) |
| Seasons / battle pass | Later | Needs a live player base ([[Season Pass Tier Pacing - XP per Tier and Mission Budget Math]]) |
| Console / VR polish | Later | Small share, separate QA |
| Cutscenes | Later | Players skip them |
| Custom physics vehicles | Later unless core | Ownership and exploit issues ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]) |

## Size every feature (honest estimates)
Use T-shirt sizes and add 50% for anything you have not built before.

| Size | Solo time (estimate) | Examples |
|---|---|---|
| XS | under 2 hours | Speed pad, kill brick, badge, gamepass perk |
| S | half a day | Daily reward wired to currency, stage checkpoint, a new zone reskin |
| M | 1-3 days | Pet follow + equip, round system, gun with recoil, rebirth |
| L | 1-2 weeks | Melee combo system, trading, quests, vehicle with garage |
| XL | 3+ weeks | Open world, custom rig, cross-server economy, boss AI with phases |

**Rule:** an MVP has no XL features and at most one L. If your genre needs an L (combat for battlegrounds, vehicles for GTA-lite), that L is your whole Week 1-2.

## Warning signs you are over-scoped
- [ ] You are writing a lore document before the loop is playable.
- [ ] You have more than one currency before launch.
- [ ] You are building a system "for later" (inventory for items that do not exist yet).
- [ ] You are modelling assets that the vault already has ([[FBX Asset Library - Hub]]).
- [ ] The map takes more than 10 seconds to cross and has nothing to do in between ([[Open World Layout - POIs, Triangle Rule and Travel Time]]).
- [ ] You have changed genres once already this month.
- [ ] "One more feature, then I'll test" has happened three times.

## Cut list templates by genre
| Genre | Keep for v1 | Cut to update #1+ |
|---|---|---|
| Simulator | 1 action, 3 zones, rebirth, fixed pets | Eggs, trading, pet fusion, worlds 4+ |
| Tycoon | 1 plot type, 40 buttons, 1 rebirth | Second floor, decor mode, NPC customers |
| Obby | 30-50 stages, checkpoints, skip product | Timer leaderboards, difficulty modes |
| Arena shooter | 1 mode, 2-3 maps, 4 weapons | Ranked, skins shop, more modes |
| Battlegrounds | 2 characters, 4 moves each, 1 map | Ultimates, more characters, ranked |
| Open-sea RPG | 2 islands, 1 boat, 3 abilities, 1 boss | Crews, more seas, raids |
| GTA-lite city | 1 district, 3 cars, 2 jobs, police | Heists, houses, gangs |
| Medieval RPG | 1 town, 1 dungeon, 3 enemy types, 10 quests | Crafting, mounts, guilds |
| Horror | 1 map, 1 monster, 1 chapter (20-30 min) | Chapter 2, more monsters, modes |

Detailed per-genre lists: [[Genre Recipes - Hub]].

## The "update #1" parking lot
Every cut feature goes into a list with: name, size, which metric it should move. After launch, pick from the list using real numbers, not gut feeling ([[LiveOps Calendar and Update Cadence Planner]] · [[Experiments and Configs - In-Game A-B Testing]]).

## Related
[[Playbook - Hub]] · [[Ship a Roblox Game in 30 Days]] · [[7-Day Cash-Grab Sprint - Simulator, Obby, Tycoon]] · [[Definition of Done]] · [[Eight Years of Roblox Dev - Tall vs Fat Features]] · [[So Your Game Died - Fun, Niche and Vision]] · [[Project Planning]]
