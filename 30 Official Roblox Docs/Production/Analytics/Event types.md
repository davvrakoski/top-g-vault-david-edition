---
title: "Event types"
description: "Overview of using event types to track user sources, sinks and milestones in your game."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/analytics/event-types"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Overview of using event types to track user sources, sinks and milestones in your game.*

![](https://www.youtube.com/watch?v=NFLP-FVv834)

Event types help you identify opportunities to grow and monetize your game. They allow you to integrate event tracking into your game and visualize your in-game economy and player usage patterns on the Analytics dashboard

After you begin tracking these events from your game using [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService|AnalyticsService]], you unlock new [[30 Official Roblox Docs/Production/Analytics/Economy events|economy]], [[30 Official Roblox Docs/Production/Analytics/Funnel events|funnel]], and [[30 Official Roblox Docs/Production/Analytics/Custom events|custom]] dashboards under Analytics on the Creator Dashboard. You can use these dashboards to identify growth opportunities and segment users by age, gender, platform, OS and custom fields. All of these features are **free to use**.

*(image in the full Top G Vault)*

## Event types

Roblox provides three sets of analytic dashboards you can use to track different aspects of your game:

1. **Economy events** let you track your in-game economy, such as:

   - **Top sinks** — What do users spend in-game resources on?
   - **Top sources** — Where do users earn resources?
   - **Average wallet balance** — How many resources are users holding?

2. **Funnel events** let you track your user's progress through key stages of your game, such as:

   - **Onboarding** — Where do users drop off when getting started with your game?
   - **Progression** — Where do users stop advancing through your game?
   - **Shop** — Where do users abandon purchases?

3. **Custom events**  let you track metrics specific to your game, such as:

   - **Adoption** — How many users click on a specific UI component?
   - **User behavior** — What is the most frequently used ability on each map?
   - **Core loop** — How do kill/death ratios compare across different weapons?

For more information on setting up these dashboards, see [[30 Official Roblox Docs/Production/Analytics/Economy events|Economy events]], [[30 Official Roblox Docs/Production/Analytics/Funnel events|Funnel events]] and [[30 Official Roblox Docs/Production/Analytics/Custom events|Custom events]].

## Validate your event tracking

Once you add [[30 Official Roblox Docs/Production/Analytics/Economy events|economy]], [[30 Official Roblox Docs/Production/Analytics/Funnel events|funnel]], or [[30 Official Roblox Docs/Production/Analytics/Custom events|custom]] events to your game, charts on the respective pages typically take 24 hours to appear. In the meantime, you can check if events are set up correctly using the **View Events** tool:

1. Navigate to the **Economy**, **Funnel**, or **Custom** pages of your Analytics dashboard for your game.
2. Click the **View Events** button at the top of each page. A near real-time list of the most recent events displays.
3. Refresh the page to update the list.

*(image in the full Top G Vault)*

If you see more events than you were expecting, verify that your calls to the [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService|AnalyticsService]] methods occur **after** a successful operation. For example, you should call [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent|LogEconomyEvent()]] after a successful purchase, not when the user attempts a purchase (which could fail due to lack of funds).

You can also visit your game's [[30 Official Roblox Docs/Production/Analytics/Error Report|error report]] to see if there are any errors with your event tracking.

## Event tracking limitations

The following limitations apply when tracking your events with [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService|AnalyticsService]]. Limitations reset daily. You will be able to send new events the next day once you stop sending previous events. Each event remains visible on the Creator Dashboard and automatically rolls off after 90 days from the last data received.

> [!warning]
> You can leverage [[30 Official Roblox Docs/Production/Analytics/Custom fields|custom fields]] to additionally filter your analytic events.
>
> For example, instead of tracking `WarriorXP`, `MageXP`, `PaladinXP` as separate economy currencies, set `XP` as one currency and set `Warrior`, `Mage`, `Paladin`, `...`, as Custom Field 1. This allows you to break down these values on your dashboards and not use up your currency cardinality.

|  | **Limitation** | **Maximum value** | **Examples** |
| --- | --- | --- | --- |
| Global Rate Limit | Total [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService\|AnalyticsService]] requests per minute | 120 + (20 * CCU) |  |
|  |  |  |  |
| Economy, Funnel, and Custom events | Number of [[30 Official Roblox Docs/Production/Analytics/Custom fields\|custom fields]] | 3 | Class, Level, Weapon |
| Unique values per [[30 Official Roblox Docs/Production/Analytics/Custom fields\|custom field]] | Unlimited — After 8,000 combined values across all custom fields, values will be grouped as "Other" | Warrior, Mage, Archer |  |
| Economy only | Resource types | 10 | Coins, Gold, Credits |
| transactionTypes | Unlimited — After 20, values will be grouped as "Other" | IAP, Gameplay |  |
| itemSkus | Unlimited — After 100, values will be grouped as "Other" |  |  |
| Funnel only | Number of funnels | 10 | Onboarding, Shop |
| Steps per funnel | 100 | Step 1, Step 2, Step 3 |  |
| Custom only | eventNames | 100 | MonsterDefeated, KillDeathRatio, PetAdoption |

---
*Source: [Event types](https://create.roblox.com/docs/production/analytics/event-types) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
