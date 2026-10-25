---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, reskin, checklist]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 10 Reskin Checklist

## Why this matters
The point of the kit is that game number two starts with saves, purchases, rewards and UI already working. That only holds if a reskin touches the config, not the systems.
Work through this list top to bottom with a timer; everything per-game is in `GameConfig.luau`, `ServerConfig.luau`, `default.project.json` and your assets.

## The 30-minute pass

### 0-5 min: copy and connect
- [ ] Copy the whole `Source` folder to a new folder named after the game (keep the old game's folder untouched).
- [ ] Change `"name"` in `default.project.json` (cosmetic, but stops mix-ups between projects).
- [ ] New place in Studio, publish it to a **new experience**, enable **Game Settings > Security > Enable Studio Access to API Services**, `rojo serve`, connect.

### 5-10 min: names and currency (`GameConfig.luau`)
- [ ] `GameName`.
- [ ] `Currency.Name` (for example `"Gold"`, `"Cash"`). This is the leaderstats column, the HUD label and the analytics currency name. Decide before launch; renaming later splits your Economy charts.
- [ ] `Currency.Start` (coins for a brand-new player) and `Currency.Max`.
- [ ] Data field names stay as they are (`coins` inside the save is internal; the display name comes from `Currency.Name`).

### 10-20 min: IDs and prices
- [ ] Creator Dashboard > your experience > **Monetization**: create passes and developer products. Set Robux prices there (the shop reads them live).
- [ ] Paste each **pass ID** into `GameConfig.GamePasses` (`Key` stays stable; `Name`/`Description` are display text).
- [ ] Paste each **developer product ID** into `GameConfig.Products` with the `Coins` it grants. Never remove a product you have sold; old unresolved receipts still reference it.
- [ ] `GameConfig.ShopItems`: soft-currency items, `Key` (saved in player data: never rename after launch), `Name`, `Price`.
- [ ] If you renamed the VIP pass key, set `GameConfig.Playtime.VipPassKey` to the new key (playtime multiplier).

### 20-25 min: rewards and secrets (`ServerConfig.luau`, `GameConfig.Daily`, `GameConfig.Playtime`)
- [ ] `GameConfig.Daily.Rewards` and `GameConfig.Playtime` balanced for this game's economy.
- [ ] `ServerConfig.Codes`: delete the sample codes, add launch codes with an `Expires` date.
- [ ] `ServerConfig.DataStoreName`: keep `"PlayerData"` for a new experience (data stores are per experience). Only change it before the first public player, never after.
- [ ] `ServerConfig.StudioTempDataOnError`: leave `true` (Studio only).

### 25-30 min: look and sound
- [ ] `GameConfig.Theme`: colors and font. Check contrast on the accent buttons.
- [ ] Music and SFX: set every `Sound`'s `SoundGroup` to `SoundService.Music` or `SoundService.SFX`; adjust default volumes in `GameConfig.Audio` and `default.project.json`.
- [ ] Analytics: rename or add events in `CUSTOM_EVENTS` and funnels in `FUNNELS` (`Analytics.luau`) for this genre.
- [ ] Play in Studio: Output shows every service started; buy a shop item, claim daily, redeem a code, change volume, rejoin: everything persisted.

## Before going public (not part of the 30 minutes)

- [ ] Real test purchases of every product and pass in the published game (note 04 checklist).
- [ ] Two-server lock test and a dashboard shutdown test (note 02 checklist).
- [ ] Phone, tablet, PC, console layout pass (note 08 checklist).
- [ ] RTBF deletion template `u_{UserId}` on data store `PlayerData`.
- [ ] Icon, thumbnails, description and the maturity questionnaire done ([[Release Readiness Runbook 2026]], [[Launch Week Checklist]]).

## What NOT to change per game

| Leave alone | Why |
|---|---|
| `PlayerData.luau`, `Remotes.luau`, `Monetization.luau` core flow | Battle-tested plumbing; changes here are where dupes and lost purchases come from |
| `u_` key prefix | RTBF templates and support tools rely on it |
| Item and product `Key`s after launch | They are stored in saves and analytics |
| `DataStoreName` after launch | Renaming it is a silent wipe |

## Common mistakes

- **Reusing the old experience** for the new game: the new game inherits the old saves, products and analytics.
- **Leaving sample IDs as 0** for things the shop advertises: the buttons simply do not appear.
- **Sample codes left in** (`WELCOME`, `LAUNCH`): everyone who read this vault can redeem them.
- **Changing systems "just a little" per game.** Fix the kit once in its own folder, then copy the fix into each game.

## Checklist

- [ ] Only config files, assets and new game services changed (diff the new folder against the kit).
- [ ] New experience, new IDs, new codes, new theme.
- [ ] Full Studio smoke test passed and saved data survived a rejoin.

**Related:** [[Starter Code - Hub]] · [[Starter Code - 01 Project Layout and Bootstrap]] · [[Genre Recipes - Hub]] · [[Ship a Roblox Game in 30 Days]] · [[Thumbnail Personalization and Icon Testing Workflow]] · [[Game Descriptions for Search - The 160-Character Hook]]
