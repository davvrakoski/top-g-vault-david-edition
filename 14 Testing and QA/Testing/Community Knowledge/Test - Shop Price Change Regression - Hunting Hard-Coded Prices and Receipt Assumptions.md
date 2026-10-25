---
area: "14 Testing and QA"
cluster: "Testing"
title: "Shop Price Change Regression - Hunting Hard-Coded Prices and Receipt Assumptions"
tags: [roblox, community-knowledge, testing, monetization, prices, regression, shop]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/price-optimization
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# Shop Price Change Regression - Hunting Hard-Coded Prices and Receipt Assumptions

Prices on Roblox no longer stay where you typed them. Managed Pricing can run **price optimization tests** (different users see different prices for the same product), regional pricing changes what a player in another economy pays, and your own team changes prices for sales. Any code that assumes a fixed number breaks quietly: the button says 100 Robux while the prompt says 79, a "best value" badge points at the wrong bundle, or worse, the receipt handler refuses a purchase because the amount paid was not exactly 100. [[Managed Pricing, Price Tests and Regional Pricing]] explains the features; this note is the **regression pass** to run after any shop change or price change.

## Step 1 - Static hunt (10 minutes)

Search all scripts and UI for literal prices. Patterns worth Find All (Ctrl+Shift+F):

- Every current Robux price as a number (`99`, `199`, `399` ...).
- `PriceInRobux` used with a fallback number (`or 100`).
- Text properties in StarterGui containing a digit next to a Robux symbol or the word "Robux".
- `CurrencySpent` comparisons in the receipt handler.

Every hit must be either removed or justified. The documented pattern for a dynamic price is `MarketplaceService:GetProductInfo(id, Enum.InfoType.Product).PriceInRobux` for developer products and `Enum.InfoType.GamePasses` for passes (the default `InfoType` fetches an asset, a common bug). Roblox recommends showing prices from the **client** when price optimization is in use, so each user sees their own price.

## Step 2 - Receipt assumptions

`ProcessReceipt` gets `receiptInfo.CurrencySpent`, the exact Robux the user paid, even during a price test. Check that the handler:

- Grants by **ProductId**, never by matching a price.
- Does not reject or "partial grant" when `CurrencySpent` differs from your table.
- Logs `CurrencySpent` for analytics, so revenue reports reflect real prices.

## Step 3 - Dynamic Price Check pass (published test or live game)

Roblox's **Dynamic Price Check** tool (Creator Dashboard, Monetization, Managed Pricing) can switch up to five test accounts to fake prices:

- **Price pinned**: every dynamically scripted price becomes a fixed fake amount.
- **Location pinned**: prices switch to a fake economic location's regional price.

Enable it for your tester accounts, wait a few minutes, join the game and walk every place a price appears:

| Surface | Pass if |
| --- | --- |
| Shop buttons and cards | Show the fake price |
| Purchase prompt | Matches the button |
| Bundles, "x% off", "best value" | Recomputed from fetched prices, not a stored table |
| NPC dialogue, billboards, tutorial text | No old number in the text |
| Gift / buy-for-friend flows | Show and charge the fetched price |
| Price sorting in the shop | Order follows fetched prices |

Anything still showing the real price is hard-coded. Disable the tool when done.

## Step 4 - After a real price change

1. Change the price on staging first (or your test universe's product).
2. Re-run Steps 1-3.
3. Rejoin: your own shop module probably caches prices, and engine-side caching of `GetProductInfo` is possible (unverified), so test with a fresh join as well as a long-running server, and decide whether your shop re-fetches on open or only at join.
4. Purchase once with a test account; check the grant, the log and the analytics event.

Note the documented limitation: you cannot change prices of products that are in an active price test until the test ends.

## Pitfalls

- In-game currency packs that show "1,000 Gems for 100 Robux" written in the image itself. Put the Robux price in a text label driven by code.
- Trading or gifting values derived from Robux price: regional prices make arbitrage possible; base value on your own item table, not the Robux price.
- Translated strings with prices baked in. Use a placeholder in the localization table.

## Related

[[Testing - Hub]] · [[Testing Purchases - Developer Products, Passes and ProcessReceipt]] · [[Managed Pricing, Price Tests and Regional Pricing]] · [[Release Readiness Runbook 2026]]
