---
title: "Managed pricing"
description: "Managed pricing brings regional pricing and price optimization into one unified system in Creator Hub."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/monetization/managed-pricing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Managed pricing brings regional pricing and price optimization into one unified system in Creator Hub.*

**Managed pricing** is a unified system in Creator Hub that combines [[30 Official Roblox Docs/Production/Monetization/Price optimization|price optimization]] and [[30 Official Roblox Docs/Production/Monetization/Regional pricing|regional pricing]] under a single opt-in. Price optimization helps you find the right price points for your passes and developer products. Regional pricing helps you offer accessible prices to users across different economic regions.

From the **Managed Pricing** tab, you can:

- [[30 Official Roblox Docs/Production/Monetization/Managed pricing#Opt in and enroll items|Opt in]] through a one-time flow for existing games.
- Review eligible items and choose what to include for Managed Pricing.
- Opt specific items in or out of automation.
- Use bulk actions to enable or disable multiple items at once.
- View past tests, upcoming tests, and revenue impact in one view. You can also reschedule tests.

## Opt in and enroll items

> [!info]
> After initial opt-in, **Managed Pricing** replaces the **Price Optimization** tab in your Creator Dashboard.

Managed pricing lives in the **Managed Pricing** tab under **Monetization** in Creator Hub.

To enroll a game:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and select a game.
2. Go to **Monetization** ⟩ **Managed Pricing**.
3. Complete the one-time opt-in flow. If managed pricing detects hard-coded prices in your game, you're prompted to fix them first.
4. Review eligible items and choose what to include. Use bulk actions to enable or disable multiple items at once, and opt specific items in or out of automation at any time.

After opt-in, the **Managed Pricing** tab shows past tests, upcoming tests, and reports for completed tests.

### Item eligibility and defaults

> [!warning]
> If you are already using regional pricing, your existing regional pricing items transition to managed pricing automatically.

- **New games and newly created items** are enrolled in Managed pricing by default. Item-level opt-out is available at any time.
- **Subscriptions, Private Servers, and Developer Servers** are regionalized automatically and don't require opt-in. Subscriptions are not included in price optimization tests.

## Price optimization

Managed pricing uses [[30 Official Roblox Docs/Production/Monetization/Price optimization|price optimization]] to identify better prices for passes and developer products based on signals from your own game, including demand, conversion, spend, and your game's spender penetration in specific countries. Items below the experiment-eligibility threshold for price optimization tests are unaffected.

For details on [[30 Official Roblox Docs/Production/Monetization/Price optimization#How tests work|how tests work]], the dynamic price check tool, the price review period, and the metric glossary, see [[30 Official Roblox Docs/Production/Monetization/Price optimization|price optimization]].

## Regional pricing

Managed pricing uses [[30 Official Roblox Docs/Production/Monetization/Regional pricing|regional pricing]] to adjust prices based on a user's economic location, using signals like purchasing power, currency exchange rates, and local spending behavior. Regional prices are bound between 30% and 100% of the default price.

For details on how economic location is determined, displaying regional prices in your game, and protecting in-game trades and gifts with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetUsersPriceLevelsAsync|GetUsersPriceLevelsAsync]], see [[30 Official Roblox Docs/Production/Monetization/Regional pricing|regional pricing]].

---
*Source: [Managed pricing](https://create.roblox.com/docs/production/monetization/managed-pricing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
