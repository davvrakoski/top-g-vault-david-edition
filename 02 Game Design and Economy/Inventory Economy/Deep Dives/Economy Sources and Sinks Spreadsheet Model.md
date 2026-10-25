---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
tags: [deep-dive, roblox, economy, sources-sinks, spreadsheet, balancing]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Economy Sources and Sinks Spreadsheet Model

## Why this matters
Most Roblox economies don't break at launch. They break during the first event, when earn rates spike, wallets swell and nothing is left worth buying, so Robux purchases of currency dry up.
A small spreadsheet that models expected value, earn rate per minute and net flow per player-day catches this before you ship, and Roblox's Economy dashboard then tells you whether reality matches the model.

---

## 1. The model in one picture

```
Sources (per minute, per segment)  ─┐
                                    ├─►  Net flow per player-day  ─►  Wallet after N days  ─►  "Is anything worth buying?"
Sinks (per minute, per segment)    ─┘
```

You only need five tabs:

| Tab | Rows | Key columns |
|---|---|---|
| `Sources` | Every way to gain currency | Action, value, probability, actions per minute, segment availability |
| `Sinks` | Every way to spend | Item, cost, repeatable?, cost growth, segment |
| `Segments` | New, Core, Payer | Minutes per day, days active per week, share of DAU |
| `Simulation` | Day 1–30 per segment | Earned, spent, wallet, next purchase ETA |
| `Events` | Each planned event | Modified values and probabilities, expected participation |

Keep one currency per sheet block. If you have Coins and Gems, model them separately and add an exchange row.

---

## 2. Expected value (EV) per action

Roblox's *Balance virtual economies* guide uses Expected Value as the core tool. EV per attempt = the sum of each outcome's value × its probability.

The guide's *Feline Fishing Fun* example: Catfish 10G at 70%, Trout 20G at 20%, Salmon 30G at 10%.

| Fish | Value | Chance | Contribution |
|---|---:|---:|---:|
| Catfish | 10 | 70% | 7.0 |
| Trout | 20 | 20% | 4.0 |
| Salmon | 30 | 10% | 3.0 |
| **EV per cast** | | | **14.0 G** |

> [!warning] Docs typo
> The official page lists the Salmon line as "30 Gold x 30% = 3G". The probability defined earlier on the page is 10%, and 3G is only correct at 10%. Use 10%.

Spreadsheet formula (Google Sheets / Excel), with values in `B2:B4` and chances in `C2:C4`:

```
=SUMPRODUCT(B2:B4, C2:C4)
```

Always add a check cell `=SUM(C2:C4)` that must equal 1 (100%). If you show odds to players for a paid roll, Roblox requires the displayed probabilities to sum to exactly 100% (see [[Paid Random Items, Odds Disclosure and PolicyService]]).

### Earn rate per minute

```
EarnPerMinute = EV_per_action × actions_per_minute × uptime
```

`uptime` is the fraction of play time actually spent doing the action (walking, menus and selling all eat time). Measure it in playtests. Starting estimates of 0.5–0.7 are common, but confirm them with your own data.

---

## 3. Sinks and the "time to next purchase" column

The single most useful column in the sheet is **minutes of play to afford the next meaningful thing**:

```
MinutesToNext = (NextItemCost − CurrentWallet) / EarnPerMinute
```

Target bands (design budgets to test, not Roblox numbers):

| Stage | Minutes to next purchase |
|---|---|
| First session | 1–5 |
| First week | 5–20 |
| Core players | 20–60 (with smaller sinks in between) |

If a cell is negative for a segment (they can already afford everything), you have a missing sink for that segment.

### Escalating cost formula

For repeatable upgrades (pet slots, tool levels, rebirths), a geometric curve keeps sinks relevant:

```
Cost(n) = BaseCost × Growth^(n−1)        -- Sheets: =Base*POWER(Growth, n-1)
```

Growth between 1.15 and 1.6 is typical for idle/simulator games. Model it against earn rate, which usually also grows with upgrades. If earnings grow faster than costs, the wallet explodes.

### Sink types that work on Roblox

| Sink | Notes |
|---|---|
| Upgrades with escalating cost | The backbone of simulators and tycoons |
| Consumables (boosts, potions, ammo) | Repeatable; keep them useful rather than mandatory |
| Cosmetics (trails, skins, titles) | Status value; Roblox players like visible flex items |
| Rebirth / prestige resets | Remove the whole wallet in exchange for a permanent multiplier |
| Trade or market tax | Removes currency on every trade |
| Limited-time event shop | Roblox's guide calls a separate event currency + event shop "the safest solution" |
| Gacha rolls with soft currency | Free-currency random rolls don't need odds disclosure, but if that currency can also be bought with Robux, the policy applies |

---

## 4. Net flow and wallet simulation

Per segment and per day:

```
Earned(d)  = EarnPerMinute × MinutesPerDay
Spent(d)   = MIN(Wallet(d−1) + Earned(d), PlannedSpend(d))
Wallet(d)  = Wallet(d−1) + Earned(d) − Spent(d)
NetFlow(d) = Earned(d) − Spent(d)
```

`PlannedSpend` comes from the cheapest useful sinks the segment has not bought yet. Put the 30-day wallet line for each segment on a chart. What a healthy economy looks like:

- Wallets rise and fall in a sawtooth (save, buy, save).
- Sources minus sinks across all players stays near zero. Roblox's Economy dashboard says the same: "Total sources subtract total sinks should be close to zero."
- The payer segment's average wallet does not grow without bound. The dashboard specifically recommends new sinks if payers' average balance is growing.

---

## 5. Model an event before it ships

Roblox's guide shows how a 24-hour "Golden Salmon" (1000G at 0.1%) event flooded the economy: fishing volume spiked, gold purchases stayed flat, and revenue fell after the event.

Run it in the sheet:

| Scenario | EV per cast | Casts per day (all players) | Gold created per day |
|---|---:|---:|---:|
| Normal | 14.0 | 1,000 | 14,000 |
| Event (catfish 69.9%, golden 0.1%) | 14.99 | 2,500 (participation spike) | 37,475 |

The EV change is only about +7%. Participation is what breaks it: daily gold creation is about 2.7× normal. Fixes, best first:

1. **Event currency** that only buys from an event shop, so the main economy is untouched.
2. Raise sink capacity during the event (an event-only cosmetic priced to absorb the expected surplus).
3. Cap the event source per player per day.

---

## 6. Wire the live game to the model

Log every source and sink from the **server** after the transaction succeeds, with the post-transaction balance. Amounts are always positive; the dashboard shows sinks as negative.

```lua
-- ReplicatedStorage/Shared/Wallet.luau (required only by server code)
local AnalyticsService = game:GetService("AnalyticsService")

local Wallet = {}

local function fields(category: string?, zone: string?)
	local t = {}
	if category then t[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = category end
	if zone then t[Enum.AnalyticsCustomFieldKeys.CustomField02.Name] = zone end
	return t
end

-- profile is your own session-locked data table
function Wallet.add(player: Player, profile, currency: string, amount: number,
	txType: Enum.AnalyticsEconomyTransactionType, sku: string?, category: string?, zone: string?)
	assert(amount > 0, "amount must be positive")
	profile[currency] += amount
	AnalyticsService:LogEconomyEvent(player, Enum.AnalyticsEconomyFlowType.Source,
		currency, amount, profile[currency], txType.Name, sku, fields(category, zone))
end

function Wallet.spend(player: Player, profile, currency: string, cost: number,
	txType: Enum.AnalyticsEconomyTransactionType, sku: string?, category: string?, zone: string?): boolean
	if cost <= 0 or profile[currency] < cost then
		return false -- never log failed attempts
	end
	profile[currency] -= cost
	AnalyticsService:LogEconomyEvent(player, Enum.AnalyticsEconomyFlowType.Sink,
		currency, cost, profile[currency], txType.Name, sku, fields(category, zone))
	return true
end

return Wallet
```

Built-in transaction types: `IAP`, `TimedReward`, `Onboarding`, `Shop`, `Gameplay`, `ContextualPurchase`. Custom type names are allowed, but after 20 distinct values the rest are grouped as "Other".

### Documented limits that shape the model
- Custom fields: up to 3, values are strings, and after 8,000 combined unique values the rest group as "Other".
- `itemSku`: after 100 unique values the rest group as "Other". Use category custom fields for long catalogs.
- Resource (currency) types: the *Event types* limit table says 10, while the *Economy events* page says the dashboard supports "up to five currencies". **The docs conflict; plan for 5.**
- Global rate limit: 120 + (20 × CCU) AnalyticsService requests per minute. Batch tiny sources (log "10 coins" once, not "1 coin" ten times).
- Charts take about 24 hours to fill; use **View Events** on the Economy page to check events in near real time.

Compare the dashboard's *Average wallet balance* (users, payers, non-payers) against your sheet's Day-7 and Day-30 wallet rows every week.

---

## Common mistakes
- Modeling EV but not participation, so events look safe on paper and flood the economy in practice.
- Logging economy events when a purchase is attempted rather than when it succeeds, which inflates sinks.
- Sending negative amounts for sinks (the dashboard already shows sinks as negative).
- Treating XP-per-class as separate currencies instead of one currency plus a custom field, which burns the currency limit.
- Rewarding rewarded-video ads with large currency drops. Roblox's ad rules say rewards must "not inflate currency or unbalance the game's economy."
- No sink for the payer segment, so paying players run out of things to buy first.
- Hard-coding prices and earn values, which stops you from tuning them with Configs or testing them with Experiments.

## Checklist
- [ ] Every source and sink is a row with value, probability and rate
- [ ] Probability columns sum to 100% (check cell)
- [ ] "Minutes to next purchase" is filled for each segment at Day 1, 7 and 30
- [ ] 30-day wallet simulation charted for New, Core and Payer
- [ ] Every planned event modeled with a participation multiplier
- [ ] Event rewards use a separate event currency or a capped source
- [ ] Server-side `LogEconomyEvent` on every successful transaction, with balance after
- [ ] ≤5 currencies, ≤100 SKUs per currency, and categories in custom fields
- [ ] Weekly comparison of dashboard wallet balances against the model

---

**Sources checked (2026-10-25):** Creator Docs: Game design › Balance virtual economies; Analytics › Economy events; Analytics › Custom fields; Analytics › Event types (limits); Promotion › Rewarded video ads (reward rules).

**Related:** [[Inventory Economy - Hub]] · [[Economy - Inflation, Sources and Sinks]] · [[Idempotent Transaction Ledger]] · [[Weighted Loot Table]] · [[Economy and Monetization Architecture]] · [[Secure Shop and Currency Blueprint]]
