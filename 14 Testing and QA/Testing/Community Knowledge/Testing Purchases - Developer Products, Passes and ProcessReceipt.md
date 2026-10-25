---
area: "14 Testing and QA"
cluster: "Testing"
title: "Testing Purchases - Developer Products, Passes and ProcessReceipt"
tags: [roblox, community-knowledge, testing, monetization, processreceipt, qa]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
  - https://devforum.roblox.com/t/mock-purchases-in-studio/26974
  - https://devforum.roblox.com/t/marketplaceserviceprocessreceipt-is-not-called-in-team-test/3983692
  - https://devforum.roblox.com/t/processreceipt-code-isnt-firing/2593754
---
# Testing Purchases - Developer Products, Passes and ProcessReceipt

Purchase bugs are the worst bugs to ship: players pay Robux and get nothing, or get the item twice, and you lose trust and money. They are also hard to test because real purchases cost real Robux. Roblox simulates purchases in Studio, which covers most of the logic, but there are known gaps. This note is a purchase test plan that uses each environment for what it can actually prove.

## What each environment can prove
| Environment | Purchases | ProcessReceipt | Use it for |
|---|---|---|---|
| Studio Play / Server & Clients | Simulated, no Robux charged (per the long-standing "Mock purchases in Studio" announcement) | Called | Grant logic, receipt handling, UI flow, retries |
| Team Test | Prompt succeeds | **Reported not called** (DevForum bug report; staff said no short-term fix) | Do not test receipts here |
| Published test place | Real purchases (costs Robux, consider cheap test products) | Real | Final check with the real backend |

Roblox's developer products docs also describe a **test mode** to verify `ProcessReceipt` before enabling external (outside-experience) developer product sales.

## Test cases for developer products
1. **Happy path:** buy, `ProcessReceipt` returns `Enum.ProductPurchaseDecision.PurchaseGranted`, item appears, data saved.
2. **Player leaves before grant:** your handler must return `NotProcessedYet` if the player is not in the server, so Roblox retries later.
3. **Save fails:** simulate a DataStore error (fake save layer). Expected: `NotProcessedYet`, no item granted in memory that is then lost.
4. **Duplicate receipt:** call your handler twice with the same `PurchaseId`. Expected: granted once. Store processed purchase ids in the player's data.
5. **Unknown product id:** handler logs and returns `NotProcessedYet` (or handles explicitly), never errors.
6. **Handler error:** force an error inside the grant function; the callback must not crash silently into a granted decision.
7. **Server shutdown mid-purchase:** covered by retry behaviour plus `BindToClose` save flush.

## Driving the handler directly
You can unit-test the receipt logic by calling your handler with a fake receipt table, without any prompt:
```lua
local fakeReceipt = {
	PlayerId = testPlayer.UserId,
	ProductId = 123456,
	PurchaseId = "test-" .. tostring(os.clock()),
	CurrencySpent = 25,
	PlaceIdWherePurchased = game.PlaceId,
}
local decision = Receipts.process(fakeReceipt, { save = FakeSave.new({ failNext = true }) })
expect(decision).toBe(Enum.ProductPurchaseDecision.NotProcessedYet)
```
Structure your real `MarketplaceService.ProcessReceipt` callback as a thin wrapper around `Receipts.process` so this test covers the real logic.

## Game passes
- `UserOwnsGamePassAsync` results are cached. The docs say the cache updates when `PromptGamePassPurchaseFinished` fires, but a pass bought **outside** the experience during the session can take several minutes to show up. Test both: buy in-game (perk should apply right after the finished event, handled on the server), and buy on the website while in a server (expect a delay; offer a rejoin hint or re-check periodically).
- Test: buy in-session, rejoin, check the perk is still there. Test the "already owns" path.
- Wrap ownership checks in `pcall`; they can fail.

## Checklist before enabling a new product
- [ ] Product id in the receipt handler table (startup self-check verifies this)
- [ ] All 7 receipt cases pass in Studio
- [ ] One real purchase in a published test place, item granted, data persisted after rejoin
- [ ] Analytics/logging records purchase id and grant result

## Related
[[Testing - Hub]] · [[Purchase Fulfillment and Receipt Reliability]] · [[Save and Purchase Reliability Lab]] · [[Testable Save Layer - Fake DataStores and Failure Injection]]
