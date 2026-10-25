---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Car Shops, Unlock Ladders and Progression Pacing"
tags: [roblox, community-knowledge, vehicles, economy, progression, shop]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/production/monetization/game-passes
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
  - https://create.roblox.com/docs/cloud-services/data-stores
---
# Racing - Car Shops, Unlock Ladders and Progression Pacing

In driving games the car list *is* the progression. Players stay for "the next car", so the shop needs a clear ladder, prices that match earning rates, and ownership stored safely. Paint/parts customisation and loadout saving are covered in [[Vehicle Customisation - Paint, Parts and Saved Loadouts]]; this note is buying and unlocking whole cars.

## 1. A car catalogue as data

Keep one ModuleScript in `ReplicatedStorage` (both server and UI read it). Never put prices in the UI only.

```lua
return {
	starter_hatch = { name = "Hatch 1.4", class = "D", price = 0,       unlockLevel = 1  },
	city_coupe    = { name = "Coupe GT",  class = "C", price = 12000,   unlockLevel = 5  },
	rally_4x4     = { name = "Rally 4x4", class = "B", price = 45000,   unlockLevel = 12 },
	track_s       = { name = "Track S",   class = "A", price = 160000,  unlockLevel = 25 },
	hyper_x       = { name = "Hyper X",   class = "S", price = 600000,  unlockLevel = 40, gamepass = nil },
}
```

## 2. Pace prices from earning rates

Work backwards from playtime. Measure (or estimate) average cash per minute at each stage, then choose how many minutes each car should take:

| Step | Target play time to afford | Example (at ~400 cash/min early, ~1,500 late) |
|---|---|---|
| 1st upgrade | 15-30 min (first session) | 12,000 |
| Mid cars | 1-3 h each | 45,000-160,000 |
| Dream car | 10-20 h | 600,000+ |

The first purchase must land inside the first session; it teaches the loop. Raise earnings per race with car class so the curve does not flatten into a grind.

## 3. Mix of gates

- **Cash** (the main gate), **level** (stops instant whale skipping), **achievement** ("win 10 races in class B"), and **event** cars (time-limited, bring players back).
- Show locked cars greyed with the exact requirement; "???" silhouettes for the top tier create curiosity.
- Let players test drive any car on a short loop. Test drives sell cars more than stats do.

## 4. Buying on the server

```lua
BuyCar.OnServerInvoke = function(player, carId)
	local car = Catalogue[carId]
	local profile = Profiles[player]
	if not car or not profile then return false, "invalid" end
	if profile.Owned[carId] then return false, "owned" end
	if profile.Level < car.unlockLevel then return false, "level" end
	if profile.Cash < car.price then return false, "cash" end
	profile.Cash -= car.price
	profile.Owned[carId] = { boughtAt = os.time() }
	return true
end
```

Use your profile/session-lock system for saves (one write path, retries). Store **ids** of owned cars, never instances.

## 5. Robux

- Premium cars as **game passes** (permanent, check with `UserOwnsGamePassAsync`).
- Cash packs as **developer products**, granted in `MarketplaceService.ProcessReceipt`, which must record the `PurchaseId` and return `PurchaseGranted` only after the save succeeded.
- Keep Robux cars side-grades or equal to the top cash car in performance so races stay fair; sell style and convenience.

## 6. Retention extras

- Garage screen with every owned car on display; spawn any owned car from the garage (see [[Vehicle Spawner and Garage System - Server Flow]]).
- Sell-back at 50-60% so mistakes are not permanent.
- "Next goal" banner on the HUD: closest affordable car and how much cash is left.

## Pitfalls

- Prices checked only on the client.
- One giant price jump with nothing between.
- Granting dev-product cash before the save succeeded.

## Related
[[Vehicles - Hub]] · [[Vehicle Customisation - Paint, Parts and Saved Loadouts]] · [[Vehicle Spawner and Garage System - Server Flow]] · [[Racing - Tuning Menus and Performance Index Balancing]]
