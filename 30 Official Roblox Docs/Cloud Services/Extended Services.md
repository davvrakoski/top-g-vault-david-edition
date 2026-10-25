---
title: "Extended Services"
description: "Extended Services lets you pay for data store, memory store, and speech usage, and for more server CPU, beyond Roblox's default limits."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/extended-services"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Extended Services lets you pay for data store, memory store, and speech usage, and for more server CPU, beyond Roblox's default limits.*

Extended Services is a solution that lets you manage service usage and payment beyond Roblox's default limits. It includes data stores, memory stores, text-to-speech, speech-to-text, and compute.

## Eligibility requirements

To use Extended Services, your Roblox account must:

- Be [[30 Official Roblox Docs/Production/Publishing/Account verification#Verify through government ID|ID-verified]] and 18+ years old.
- Be located in a [[30 Official Roblox Docs/Cloud Services/Extended Services#Supported countries|supported country]].
- Have a valid email address associated with it.
- Not currently be banned or moderated.
- Accept and comply with the [terms of service](https://en.help.roblox.com/hc/articles/37967848292500).

> [!info]
> For group accounts, only the group owner needs to meet the eligibility requirements.

## Unlock Extended Services

If you meet all of the [[30 Official Roblox Docs/Cloud Services/Extended Services#Eligibility requirements|eligibility requirements]], you can finish setting up Extended Services by entering your account details and payment information. For group-owned games, only the group owner can unlock Extended Services and onboard the game onto it.

To unlock and use Extended Services:

1. In the [Creator Dashboard](https://create.roblox.com/dashboard/creations), go to **Creations** and select a game.
2. Go to **Extended Services**.
3. If you haven't entered your account details and payment information yet, click **Add missing information** on the top banner.
   1. Enter your account information. The **Account type**, **Tax ID type**, and **Tax ID** fields are optional.
      - You can also go to **Finances** ⟩ **Account Information** under the **Extended Services** section to manage your account information. You don't need to update anything else on this page.
   2. Click **Next**.
   3. Enter a payment method. You can enter a new payment method or select from the available payment options already associated with your Roblox account.
      - You can also go to **Finances** ⟩ **Payments** to add new payment methods, or go to **Finances** ⟩ **Billing** to set a new default payment method.
   4. Click **Save**.

##### Account status

Your Extended Services account can be in one of the following statuses:

| | | |
| --- | --- | --- |
| **Normal** | You can use all Extended Services features. | No action is required. |
| **Overdue** | Your account is overdue because your automatic payment method failed. Roblox offers a grace period of **seven days** before suspending your Extended Services account. | Change your payment method and retry a manual payment, or wait until Roblox attempts to charge your payment method again after the grace period has ended. |
| **Suspended** | You can't use any paid Extended Services. You can, however, still use services with default limits. | Fix your eligibility requirements, add a valid payment method, or manually pay the overdue balance on your account. |

## Enable a service

To enable a service:

1. Go to **Extended Services**.
2. Toggle on the service you want to enable.
3. Enter a monthly budget for each applicable resource under the service. The minimum monthly budget you can set is \$0.50 USD.

Your payment method is charged either at the end of the month when a bill is generated, or when your usage reaches \$10 USD, whichever comes first.

You can increase or decrease a service's monthly budget any time. Your service is automatically throttled if you decrease your budget to an amount below your current month-to-date usage, or if you exceed the budget you have set.

Roblox notifies you by email when your usage reaches 80% of your budget, and then again when it reaches 100%.

### Extended Services for Compute

Every game server gets a default amount of CPU, which grows with each player who joins. **Extended Services for Compute** more than doubles the per-player CPU that your game's servers receive.

The vast majority of games on Roblox see no benefit from this service, but games with heavy server-side physics or that make extensive use of [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|server authority]] hit existing limits. To see if your game can benefit from **Extended Services for Compute**:

- Check [[30 Official Roblox Docs/Performance Optimization/Identify performance issues#Server compute|server heartbeat]] for persistent drops below 60 FPS.
- Examine CPU core utilization on the [[30 Official Roblox Docs/Production/Analytics/Performance#Server charts|Performance dashboard]].

> [!success]
> Before you pay for more CPU, try to [[30 Official Roblox Docs/Performance Optimization/Improve performance|reduce the work your servers do]].

## Manage billing

To access the Extended Services billing dashboard:

1. Go to **Finances** ⟩ **Billing**.
2. Select the **Cloud services** tab to display the following:
   - Your pending balance, including month-to-date cost
   - Your billing history, including all Extended Services billing activity across your games

For a detailed breakdown of your current pending balance costs, click **View Details** next to your payment method. For a detailed invoice of a previous bill, click **View Bill** under **Billing history**.

## Service pricing

See the following table for Extended Services pricing:

| **Service** |  | **Default** | **Extended** |
| --- | --- | --- | --- |
| [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores\|Memory stores]] | Requests | 1000 + (CCU × 120) requests per minute | \$0.003 / 1M requests |
|  | Storage | 64 KB + (CCU × 1.2 KB) | \$0.10 / GB per hour¹ |
| [[30 Official Roblox Docs/Audio/Audio objects#Text-to-speech\|Text-to-speech]] | Requests | 1 + (CCU × 6) requests per minute | \$5.00 / 1M requests |
| [[30 Official Roblox Docs/Audio/Audio objects#Speech-to-text\|Speech-to-text]] | Requests | 1 + (CCU × 5) requests per minute | \$1 / 1M requests |
| [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores\|Standard data stores]] | Get | 250 + (CCU * 40) requests per minute | \$0.08 / 1M requests |
|  | Set | 250 + (CCU * 20) requests per minute | \$0.80 / 1M requests |
|  | List | 10 + (CCU * 2) requests per minute | \$0.60 / 1M requests |
|  | Remove | 100 + (CCU * 40) requests per minute | \$0.80 / 1M requests |
| [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores\|Ordered data stores]] | Get | 250 + (CCU * 40) requests per minute | \$0.08 / 1M requests |
|  | Set | 250 + (CCU * 20) requests per minute | \$0.25 / 1M requests |
|  | GetSorted | 100 + (CCU * 2) requests per minute | \$0.32 / 1M requests |
|  | Remove | 100 + (CCU * 40) requests per minute | \$0.25 / 1M requests |
| [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores\|Data store storage]] | Storage | 100 MB + (1 MB * Lifetime Players) GB per month | \$0.12 / GB per month |
| [[30 Official Roblox Docs/Production/Analytics/Performance\|Compute]] | CPU cores | First 100K playtime hours per month at no charge (when enrolled in Extended Services for Compute) | \$0.001 / playtime hour² |

*¹ GB per hour = the storage consumption multiplied by the amount of time. For example, 100 GB hours might equate to "100 GB × 1 hour" or "200 GB × 0.5 hours".*

*² Extended Services for Compute is billed based on how long the feature remains enabled, measured in minutes of playtime. Because enabling the feature reserves additional compute capacity for your game, charges apply whenever the feature is active, even if the additional compute is not fully consumed. Playtime hours are calculated as the sum of all player session durations. For example, if 10,000 users each play for 1 hour, that equals 10,000 playtime hours, resulting in \$10 in charges beyond the included monthly allowance of 100,000 playtime hours. These limits and pricing only apply to games enrolled in Extended Services for Compute. Games that do not enroll continue to receive unlimited playtime hours under the current default limits at no additional charge.*

## Supported countries

Extended Services is available in the following countries:

| Country |  |  |
| --- | --- | --- |
| Australia | Germany | Poland |
| Austria | Hong Kong | Portugal |
| Belgium | Hungary | Romania |
| Brazil | Ireland | Singapore |
| Bulgaria | Italy | Slovakia |
| Canada | Kazakhstan | Slovenia |
| Chile | Latvia | South Africa |
| Croatia | Lithuania | South Korea |
| Cyprus | Malaysia | Spain |
| Czechia | Malta | Sweden |
| Denmark | Mexico | Switzerland |
| Estonia | Netherlands | Thailand |
| Finland | New Zealand | United Kingdom |
| France | Norway | United States |
| Georgia | Peru |  |

## Additional localizations for this page

For additional, localized versions of this page that aren't available in the site's language picker, see the following links:

- [[30 Official Roblox Docs/Cloud Services/Extended Services|Bulgarian (български)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Croatian (hrvatski)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Czech (čeština)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Danish (dansk)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Dutch (Nederlands)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Estonian (eesti)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Finnish (suomi)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Greek (Ελληνικά)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Hungarian (magyar)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Irish (Gaeilge)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Latvian (latviešu)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Lithuanian (lietuvių)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Maltese (Malti)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Portuguese - Portugal (português)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Romanian (română)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Slovak (slovenčina)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Slovenian (slovenščina)]]
- [[30 Official Roblox Docs/Cloud Services/Extended Services|Swedish (svenska)]]

---
*Source: [Extended Services](https://create.roblox.com/docs/cloud-services/extended-services) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
