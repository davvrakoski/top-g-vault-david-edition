---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Selling Plugins for USD - Seller Account, Price Range and Payouts"
tags: [roblox, community-knowledge, studio, plugins, creator-store, monetization]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/creator-store
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/settings/eligibility/priced-assets
---
# Studio Tools - Selling Plugins for USD - Seller Account, Price Range and Payouts

Plugins are one of the few things on Roblox you can sell for **real US dollars**, not Robux. Roblox keeps no platform cut; only taxes and payment-processing fees come off, and there is no DevEx step. For a studio that already builds internal tools, a polished tool can bring in steady side income. The rules are strict, though: who can sell, from which country, at what price, and what happens on refunds. Read this before you promise a "Pro version" on the DevForum.

## Who can sell

All of these must be true (Creator Store docs, 2026-10-25):

1. Your account meets the **distributor** rules: at least 2 days old, not recently banned, and verified by **age check or government ID** (phone verification does not count).
2. You are **18+**, or **13-17 with parental consent**. A parent/guardian must accept the terms and be entered on the Stripe form.
3. **2-Step Verification** is on for your Roblox account.
4. You live in a country that **Stripe cross-border payouts** support. The docs name Brazil, China, India and Russia as not yet supported.
5. The plugin is owned by **your individual account**. **Group-owned assets can't be sold.** Re-upload it under your own account if needed.

## Seller account setup

- Apply through the **Seller Onboarding** page (`create.roblox.com/settings/eligibility/priced-assets`), which links to a **Stripe** form. It asks for personal details, bank details and a **W-8 or W-9** tax form.
- **One Stripe account per Roblox account.** Review takes **up to 7 days**.
- Status values: Pending, **Information Needed**, **Failed**, **Success**, **Rejected** (fraud or malicious activity).
- After approval, **you can't change the country** of the seller account. Editing other details sends you back to Pending and **freezes payouts** until it is reviewed, so change bank details just after a payout.

## Prices and money flow

| Item | Rule |
| --- | --- |
| Plugin price | **$4.99 minimum, $249.99 maximum** |
| (Models, for comparison) | $2.99 - $49.99 |
| Currency | USD only. **Robux pricing is not supported** |
| Escrow | Each sale is held **30 days**, then moves to your Stripe balance |
| Payouts | Automatic, **monthly, on the 1st**. Some countries/currencies have a minimum payout |
| Buyers | **Individual accounts only.** Groups can't buy priced plugins |
| Purchase cap | Sales between one buyer and one seller are capped per month (anti-fraud, including alt accounts) |

## Refunds and moderation

Refunds come out of **your** balance when:

- a buyer gets a refund or files a chargeback; or
- your plugin is **moderated** after people bought it and you don't win an appeal **within 5 days**. Uploading a fixed version does not stop the refunds.

If a large share of an asset's sales comes from accounts with a bad chargeback history, the asset is taken off sale and payouts freeze.

So: **moderation risk is money risk.** Keep the plugin clean. No obfuscation, no `require(id)` of remote code, no hidden HTTP calls ([[Free Model Backdoors - Spot and Remove Them]] lists what moderators and users look for).

## What sells (community experience, unverified figures)

- Tools that save hours every week: building, animation, UI conversion, terrain.
- A **free "Lite" version** with a clear upgrade path. Many popular paid plugins do this (see [[Paid or Off-Sale Plugins Often Called Free]]).
- A demo video and a support thread. The listing allows one video and five images for verified creators.

## Don't

- Don't add licence checks that phone home to your server. Users see the HTTP permission prompt, and it looks like spyware ([[Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts]]).
- Don't bundle code you can't relicense. GPL or unlicensed code in a paid plugin is a legal problem. MIT/CC0 code is fine with attribution.
- Don't sell a plugin that copies a built-in Studio feature. Check [[Built-in Studio Tools That Replace Old Plugins]] first.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Publishing a Plugin - Publish as Plugin, Creator Store Listing and Upload Limits]] · [[Creator Store]] · [[Paid or Off-Sale Plugins Often Called Free]]
