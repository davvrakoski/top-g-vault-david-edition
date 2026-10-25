---
title: "Paid random items policy guidelines"
description: "Summarizes Roblox's policy for offering paid random items in a game."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/monetization/paid-random-items"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Summarizes Roblox's policy for offering paid random items in a game.*

Due to regulations in various countries, certain requirements may apply to random items purchased directly or indirectly with Robux. This includes random items purchased with paid in-game currency. For example, both of the following are paid random items:

- Paying Robux to spin a prize wheel
- Paying Robux to buy gems or spin tickets that are spent at a prize wheel

There are a variety of item types that are paid random items, including but not limited to:

| **Item type** | **Examples** |
| --- | --- |
| **Capsule items** | • Spin a wheel for a prize<br>• Hatch an egg for a pet<br>• Open a chest for loot |
| **Enhancement items** | • Potion for ability with random duration<br>• Upgrade spell with some chance of working |
| **Combination items** | • Consuming or synthesizing two rare eggs for a better chance of a higher-quality result |
| **Probability modifier items** | • Luck boosts<br>• Pity systems<br>• Enhanced resource drops<br>• Rate-up scrolls |

## Item odds disclosures

Under Roblox's [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use) and [Community Standards](https://about.roblox.com/community-standards#roblox-economy-paid-random-items), if you offer paid random items that users can purchase with Robux or other in-game currency purchasable with Robux, you must indicate all possible outcomes and the actual numerical odds of what they may receive.

*(image in the full Top G Vault)*

In addition:

- If there are too many individual outcomes to fit in the user's dynamic 3D view, such as rarity categories that have many individual items in each category, the itemized list of final outcomes and their numerical possibilities can be shown in a clickable pop-up with an "Info" or "Details" icon visible and accessible prior to purchase. Using a standalone symbol like the (i) icon without a descriptive word is **not** sufficient.

- Odds must be displayed as a probability percentage, and the probability percentages of all final outcomes must sum to exactly 100%. For probabilities with long decimals, you can round to four or more decimal places lower than the decimal place with the first non-zero number, and include a disclaimer, such as: "Probabilities are rounded; total of displayed individual probabilities may not equal 100%."

- If many items within a list have the same individual odds, it is acceptable to disclose at the beginning of the list of items "Odds for each item listed below: X%"

- If users can only obtain one instance of an outcome, the odds for the remaining obtainable outcomes must be updated to reflect up-to-date remaining odds for that user.

*(image in the full Top G Vault)*

*Example of odds by rarity tier with clickable "Details" button*

*(image in the full Top G Vault)*

*Example of individual item odds disclosure*

> [!warning]
> This policy also applies to indirect purchases. For example, if a user uses their Robux to purchase keys to open boxes, re-roll tokens, or spin tickets, you must disclose the odds of their potential award before they spend the in-game currency on the random outcome.

Paid items that augment the odds of other random outcomes must also be explained before purchase. For example, if a user can purchase a "lucky potion" or "magic fishing rod" that improves the odds of more unlikely outcomes, these impacts must be numerically explained. The new odds of the enhanced random items must also be dynamically updated when these items are active to show the user's true odds.

> [!info]
> If your game offers randomized virtual rewards in exchange for completing an action that does not involve the payment of Robux or other in-game currency, you aren't required to disclose the odds. For example, if a user locates a key that opens a treasure chest, you don't need to state the odds of what items they might receive from the treasure chest.

## Per-user regulations

To help you determine how to handle virtual items in your game per user, use the [[30 Official Roblox Docs/API Reference/Classes/PolicyService#GetPolicyInfoForPlayerAsync|PolicyService:GetPolicyInfoForPlayerAsync()]] method. Specifically, the structure of the returned dictionary includes `ArePaidRandomItemsRestricted` and `IsPaidItemTradingAllowed`.

### ArePaidRandomItemsRestricted

When `ArePaidRandomItemsRestricted` is **true**, the user cannot interact with paid random item generators, either through Robux directly or game currency bought with Robux.

For ineligible users defined by the API, creators must apply one of these treatments:

| **Treatment** | **Examples** |
| --- | --- |
| **Offering an unpaid, earnable path to acquiring the random item** | Mystery eggs are granted for free at milestones of gameplay |
| **Offering the item's outcomes in a pre-determined, non-random order disclosed to the user before purchase** | First spin is always 5 gems, second is always 10 gems, third is always 20 gems, etc. |
| **Offering the specific outcomes for direct, guaranteed purchase (priced based on the expected value of the outcome)** | If a lootbox for a rare sword is 10 Robux with 5% odds, offer the sword to ineligible users for direct purchase priced at 200 Robux |
| **Removing or hiding the paid random item from the game** | Replace a giant spin prize wheel with a shop offering direct purchases |
| **Blocking the purchase of the paid random item with an error message** | Replacing the purchase button with "Sorry, this item is unavailable for users in your region" |
| **Removing the user from the parts of the game with paid random items** | Teleporting them away |

### IsPaidItemTradingAllowed

When `IsPaidItemTradingAllowed` is **true**, the user can trade virtual items that they purchased with game currency or Robux.

For ineligible users defined by the API, creators must not allow them to access the ability to trade the resulting outcome of a paid random item or other paid items.

---
*Source: [Paid random items policy guidelines](https://create.roblox.com/docs/production/monetization/paid-random-items) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
