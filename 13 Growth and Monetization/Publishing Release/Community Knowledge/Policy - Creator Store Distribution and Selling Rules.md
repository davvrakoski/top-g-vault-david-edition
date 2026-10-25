---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Creator Store Distribution and Selling Rules"
tags: [roblox, community-knowledge, publishing, policy, creator-store, licensing, plugins, models]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/creator-store
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
  - https://create.roblox.com/docs/production/publishing/account-verification
---
# Creator Store Distribution and Selling Rules

> Not legal advice. Summary of the Creator Hub "Creator Store" page and the relevant Creator Terms clauses, checked 2026-10-25.

The Creator Store (the old Toolbox marketplace) is where you both **take** assets for your game and **give or sell** assets to other developers. Two policy questions matter: what you are allowed to do with a free asset you insert, and what rules apply if you distribute or sell your own models and plugins for USD.

## Using other people's Creator Store assets

- When a creator shares UGC directly with other users, the Creator Terms say other users may use it to build their own games and UGC **on Roblox** without further obligation to the creator. This is a Roblox-only permission, not an open-source license: it does not let you export the mesh to another engine or sell it elsewhere.
- Free does not mean safe. Scan inserted models for hidden scripts and remote `require` calls (see [[Plugin and Free Model Safety Checklist]]).
- Purchased USD models are licensed to the buyer's account. Collaborators in group games may be unable to copy-paste them into other games if they or the destination game lack access.

## Distribution requirements

To share assets publicly you need:

- An account at least **2 days old**, not recently banned.
- **Verification by age check or government ID** (phone verification does not count).
- Assets that follow the Community Standards, Terms of Use and IP guidelines.

30-day distribution limits:

| | Meshes | Images | Models | Audio | Plugins |
| --- | --- | --- | --- | --- | --- |
| Verified | 200 | 200 | 200 | 100 | 10 |
| Unverified | 10 | 10 | 10 | 10 | 2 |

**Banned code practices** in distributed assets:

- Obscuring engine features (Luau VMs, `getfenv`, `setfenv`).
- Requiring remote assets: `require(assetId)`, `loadstring`, `InsertService:LoadAsset`, `AssetService:LoadAssetAsync` and similar.
- Obfuscated code of any kind.
- Extremely large or padded scripts.

You may include **Open Use** dependencies made by others, but not **Restricted** dependencies you did not upload (except Creator Store audio and video). Turning on Asset Privacy makes your new uploads Restricted by default.

## Selling models and plugins for USD

- A **seller account through Stripe** is required (one per Roblox account), plus government ID verification and **2-Step Verification**.
- Age 18+, or 13-17 with a parent or guardian who agrees to the Creator Store terms on the Stripe form.
- You must live in a Stripe-supported country; Roblox names Brazil, China, India and Russia as not yet supported. Your seller country cannot change after approval.
- Only **individually owned** assets can be sold; group-owned assets are ineligible (re-upload under your own account).
- Price bands: plugins **$4.99-$249.99**, models **$2.99-$49.99**. USD only, no Robux.
- You receive 100% of net proceeds (only taxes and processing fees deducted), paid monthly on the 1st.
- Refunds and chargebacks come out of your balance; a high share of sales from chargeback-heavy accounts takes the asset off sale and freezes payouts.
- Monthly per-buyer-per-seller purchase caps exist, including across alt accounts.
- Breaking any requirement suspends the seller account, takes assets off sale and freezes payouts; appeal via Violations & Appeals.

## Seller checklist

- [ ] Assets contain only your own work or Open Use dependencies
- [ ] No `require(id)`, `loadstring` or obfuscation anywhere
- [ ] Clear description of what the asset does and its dependencies
- [ ] Support contact via your social links on the asset (16+ age check needed to add them)

## Related
[[Publishing Release - Hub]] · [[Plugin and Free Model Safety Checklist]] · [[Free Model Backdoors - Spot and Remove Them]] · [[Creator Store]]
