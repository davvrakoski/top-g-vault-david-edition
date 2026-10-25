---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Promo Codes - Redeem System With Live Configs and Abuse Guards"
tags: [roblox, community-knowledge, economy, codes, liveops, configs, datastore]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/configs
  - https://create.roblox.com/docs/reference/engine/classes/ConfigService
  - https://devforum.roblox.com/t/redemption-codes-system/2788524
  - https://devforum.roblox.com/t/how-to-make-a-code-one-time-use/581016
  - https://devforum.roblox.com/t/codes-module-v2/963660
  - https://create.roblox.com/docs/production/promotion/social-media-links
---
# Promo Codes - Redeem System With Live Configs and Abuse Guards

"Codes" (type a word, get gems or a boost) are one of the most common Roblox growth tricks: they reward players for following your social links or Discord, give YouTubers something to announce, and bring lapsed players back at update time. A good code system lets you add or expire codes **without republishing** and can't be exploited for infinite rewards.

## Where the code list lives

**Option A (2025+): Experience configs.** Roblox's `ConfigService` stores live key/value data (string, number, boolean or JSON, JSON up to 100,000 characters) that you edit on Creator Hub and publish in roughly 15 s to 1 min, no place publish needed. It is server-only. Store one JSON key such as `promo_codes`:

```json
{ "SPOOKY25": { "reward": "Gems", "amount": 250, "expires": 1793491200, "minLevel": 3 } }
```

**Option B (classic, still common on DevForum):** a DataStore key holding the same table, edited with an admin command. Community threads warn to write with `UpdateAsync` rather than Get+Set and to keep all logic server-side.

## Server flow

```lua
-- Own example (server). profile = your session-locked save table
local ConfigService = game:GetService("ConfigService")
local snapshot = ConfigService:GetConfigAsync()
snapshot.UpdateAvailable:Connect(function() snapshot:Refresh() end)

local function redeem(player: Player, profile, raw: string): (boolean, string)
	local code = string.upper(string.gsub(raw, "%s", ""))
	if #code > 20 then return false, "Invalid code" end
	local codes = snapshot:GetValue("promo_codes") or {}
	local def = codes[code]
	if not def then return false, "Invalid code" end
	if os.time() > def.expires then return false, "This code has expired" end
	if profile.Level < (def.minLevel or 0) then return false, "Reach level " .. def.minLevel end
	if profile.RedeemedCodes[code] then return false, "Already redeemed" end
	profile.RedeemedCodes[code] = os.time()     -- mark first
	grantReward(profile, def.reward, def.amount) -- same save write
	return true, "Redeemed!"
end
```

Key points:

- **Mark redeemed and grant in the same save.** The redeemed set lives in the player's own profile, which is session-locked, so two servers can't double-grant.
- **Rate-limit the remote** (e.g. 1 attempt per 2 s, 10 per minute) to stop brute-forcing secret codes.
- **Expiry uses server `os.time()`** (UTC seconds), never the client clock.
- **Normalize input** (upper-case, strip spaces) so "Spooky25 " works.

## Design tips

- **Gate by level or playtime** (`minLevel`) so codes reward real players and are not a free-alt farm.
- **Small, frequent codes beat one huge code.** Huge rewards inflate your economy; treat code payouts as a faucet in your economy sheet.
- **Release with updates and milestones** ("10k likes code"). Announce via the game description, an in-game update board, Discord and Roblox social links (note: Roblox shows social links only to users age-verified 16+, so younger players need in-game or description announcements).
- **Show the code UI in the main menu** with a link-out hint ("Codes in our community").
- **Log redemptions** with `AnalyticsService` economy events (source = "PromoCode") to see how much currency codes inject.
- **One-time global codes** (first 100 players) need a shared counter: use `MemoryStoreService` or a DataStore `UpdateAsync` counter and accept that it is approximate under load.

## Pitfalls

- Shipping the code list inside a `ModuleScript` in ReplicatedStorage leaks every secret code to exploiters.
- A config snapshot does not update by itself; listen to `UpdateAvailable` and call `Refresh()`.
- Do not require players to buy anything for a code that gives a paid random item without disclosing odds.

## Related
[[Inventory Economy - Hub]] - [[Idempotent Transaction Ledger]] - [[Economy - Inflation, Sources and Sinks]] - [[Daily and Weekly Reward Blueprint]]
