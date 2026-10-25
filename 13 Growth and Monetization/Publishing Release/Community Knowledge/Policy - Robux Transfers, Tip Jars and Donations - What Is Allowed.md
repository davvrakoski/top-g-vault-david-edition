---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Robux Transfers, Tip Jars and Donations - What Is Allowed"
tags: [roblox, community-knowledge, publishing, policy, robux-transfers, donations, monetization, luau]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/robux-transfers
  - https://about.roblox.com/community-standards
  - https://create.roblox.com/docs/production/monetization/developer-exchange
  - https://en.help.roblox.com/hc/en-us/articles/30428310121620-Parental-Controls-Overview
---
# Robux Transfers, Tip Jars and Donations - What Is Allowed

> Not legal advice. Summary of the Creator Hub "Robux transfers" page, the Community Standards "Soliciting Donations" and "Fraud" rules, the DevEx page and Parental Controls, checked 2026-10-25.

"Donation" games (stands, tip jars, "give me Robux" booths) are a long-running Roblox genre, and also a common source of moderation. Roblox now offers an official **Robux transfer** system for Roblox Plus subscribers, alongside the older pattern of selling cheap passes as tips. Both are allowed only inside clear limits.

## The official transfer system

- Only **Roblox Plus subscribers** can send Robux directly to other users.
- In your game you start a transfer from a **server** script with `MarketplaceService:PromptRobuxTransferAsync(sender, receiverUserId, amount)`, which returns a `transferRequestId`.
- Amount per transaction: **10 to 500 Robux**.
- Roblox shows its own transfer UI and runs safety and eligibility checks; you never see transfer details or control execution.
- Receipts arrive for both sides through `MarketplaceService:BindReceiptHandler` with `Enum.ReceiptType.RobuxTransferSender` and `RobuxTransferReceiver`; return `Enum.ReceiptDecision.Processed` when handled or `NotProcessedYet` if the player left.
- Roblox says Robux your **game** earns from transfers is DevEx-eligible and Roblox takes no fee. Separately, the DevEx page lists "Robux received from Robux transfers" as **not** Earned Robux. Read both pages before planning revenue around transfers; they appear to describe different sides of a transfer.

Parents can cap a child's transfers (default **500/day and 1,000/month**) and require approval of each one, so transfers from younger players may be slow or blocked.

```lua
-- Server: grant a thank-you badge only after a completed transfer receipt
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

MarketplaceService:BindReceiptHandler(Enum.ReceiptType.RobuxTransferSender, function(info)
	local sender = Players:GetPlayerByUserId(info.PlayerId)
	if not sender then
		return Enum.ReceiptDecision.NotProcessedYet
	end
	sender:SetAttribute("Supporter", true) -- cosmetic only, nothing of gameplay value
	return Enum.ReceiptDecision.Processed
end)
```

## What the Community Standards allow

- A **tip jar** is fine when the player clearly **receives nothing in return**.
- **Soliciting donations for charities or causes**, or claiming a purchase funds a cause, is **not** allowed.
- **Third-party Robux trading**, selling Robux, or arranging off-platform payment for Robux is fraud.
- The transfers page says you may offer items or perks for each successful transfer (process the receipt first). If you call something a "tip" or "donation", keep it reward-free to match the tip-jar rule; if it gives a perk, describe it as a purchase-like exchange.

## Design rules

1. Validate inputs on the server; never let the client choose the receiver or amount without checks.
2. Rate-limit prompts so players cannot be spammed with transfer requests.
3. Make the giver's intent explicit: a button the giver presses, not a prompt triggered by another player.
4. Do not pressure: no "donate or you can't play", no leaderboards that shame non-givers.
5. Keep rewards for donating cosmetic and clearly described.

## Related
[[Publishing Release - Hub]] · [[Purchase Fulfillment and Receipt Reliability]] · [[Policy - Community Standards Integrity and Security Rules Developers Trip Over]] · [[Robux transfers]]
