---
area: "14 Testing and QA"
cluster: "Testing"
title: "Economy Regression Checklist - Currency, Rewards and Sinks"
tags: [roblox, community-knowledge, testing, economy, currency, regression, checklist]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/game-design/balance-virtual-economies
  - https://create.roblox.com/docs/production/analytics/economy-events
  - https://create.roblox.com/docs/reference/engine/classes/AnalyticsService
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
---
# Economy Regression Checklist - Currency, Rewards and Sinks

Economy bugs rarely crash anything; they leak. A reward that pays twice, a price that rounds down to zero, a rebirth that keeps a multiplier it should reset: each one quietly inflates currency until the shop stops meaning anything. Because the symptoms show up days later in analytics, the economy needs its own regression pass, run whenever rewards, prices, multipliers, saves or shop code change. Roblox's guidance on balancing virtual economies frames everything as **sources** (where currency enters) and **sinks** (where it leaves); this checklist tests both sides plus the math in between. Run it with QA commands that set and print balances ([[QA Test Commands - Gated Cheats for Testers]]).

## A. Inventory of sources and sinks (keep it in the repo)

List every source (quest reward, kill reward, daily login, offline earnings, codes, purchases, trades in) and every sink (shop, upgrades, crafting, fees, rebirth reset, trades out). The checklist below is run **per row** for anything changed this release. A source or sink missing from the list is itself a bug.

## B. Sources

- [ ] Reward amount matches the balance sheet at level 1, mid and max.
- [ ] Reward granted **once** per trigger: spam the remote, double-click, two players finishing together.
- [ ] Reward granted on the **server** only; the client remote carries no amount.
- [ ] Multipliers (game pass 2x, boost potions, events, rebirth) stack in the documented order (additive vs multiplicative) and expire on time.
- [ ] Offline/idle earnings capped and based on server time, not client time.
- [ ] Promo codes: one redemption per account, expired codes rejected.
- [ ] Developer product currency packs grant once per receipt (see [[Testing Purchases - Developer Products, Passes and ProcessReceipt]]).

## C. Sinks

- [ ] Price charged equals price shown, after every discount.
- [ ] Purchase refused cleanly when balance is 1 short; balance unchanged.
- [ ] Balance can never go negative (try buying two things in the same frame).
- [ ] Upgrade costs follow the curve formula at the first, middle and last level; no free level from rounding.
- [ ] Rebirth/prestige resets what it should and keeps what it should.
- [ ] Trade fees or taxes taken once, from the right player.

## D. Math and storage

- [ ] Large values: test at 1e6, 1e15 and beyond 2^53 (9,007,199,254,740,992) if your game uses big numbers; precision loss shows up as prices that stop changing ([[Big Numbers in Simulators - Doubles, 2^53 and Number Libraries]]).
- [ ] Rounding: decide floor/round/ceil per formula and test a value at .5.
- [ ] Display formatting (1.2K, 3.4M) never hides that a value is 0 or negative.
- [ ] Balances saved with read-modify-write (`UpdateAsync`), not overwritten from a stale copy.
- [ ] Rejoin after each case: the saved balance equals the in-game balance.

## E. Telemetry

If you log economy events (`AnalyticsService:LogEconomyEvent` with a flow type of source or sink), each source and sink in the inventory should emit one, with the right currency and amount.

- [ ] Each changed source/sink fires its event once per action.
- [ ] Event amounts match the balance change seen in game.
- [ ] After release, compare the day's total sources vs sinks with the previous week; a jump in one source after a release points straight at the change.

## F. Abuse spot checks

- [ ] Alt-account farming: does a reward rely on another player (gifting, team kills) that two accounts could loop?
- [ ] AFK farming: rewards that need activity check for it.
- [ ] Server hopping: per-server cooldowns that reset on rejoin are tracked per player in the save instead.

## Exit criteria

Every changed source/sink row passes B-E. Any failure that creates currency is severity 1 (fix before release, or disable the source with a kill switch). Record pass/fail per row with the place version.

## Related

[[Testing - Hub]] · [[Economy - Inflation, Sources and Sinks]] · [[QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events]] · [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]]
