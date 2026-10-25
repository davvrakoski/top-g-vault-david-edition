---
area: "13 Growth and Monetization"
cluster: "Monetization"
tags: [deep-dive, roblox, ads, immersive-ads, rewarded-video, sponsored, ads-manager]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Immersive Ads, Rewarded Video and Sponsored Games

## Why this matters
Ads on Roblox run in two directions: **you earn** by showing ads inside your game (immersive ad units, rewarded video), and **you spend** to bring players in (Sponsored tiles on Home and in search, search ads). Both have eligibility rules, fraud enforcement and UX rules that can cost you payouts or your account if ignored.
They also interact with discovery in ways the docs spell out, for example that ad-acquired players don't count toward Recommended For You signals. Knowing this keeps ad spend from being misread as "the algorithm punished us".

> [!note] No revenue promises
> Ad earnings depend on advertiser demand, fill rate, audience eligibility and your traffic. Roblox explicitly states eligibility doesn't guarantee ads will be served. Use the in-dashboard calculator for estimates, not this note.

---

## Part A: Earning from ads in your game (publisher side)

### 1. Eligibility (immersive ads and rewarded video)

| Requirement | Detail |
|---|---|
| Game | **Public**; for rewarded video also *unrestricted* and **no free-form user creation** |
| Owner age | **13+** (for groups, the group owner) |
| Account | **ID-verified** and **2FA enabled**, persistently. Turning either off removes eligibility |
| Questionnaire | **Maturity and Compliance Questionnaire** completed and **approved**. Resubmitting temporarily removes ads eligibility, so only resubmit when an update changes your answers. Re-review of *Pending* status can be requested under Monetization › Ads › Eligibility (response within 24 h) |
| Traffic | **2,000 unique visitors per month** (bots excluded, recalculated monthly) |
| Conduct | Terms of Use, Community Standards and publisher-integrity rules in the Advertising Standards |

### 2. Immersive ad formats

| Format | How it's built | How you earn |
|---|---|---|
| **Image ad** (billboard) | Block `Part` + `AdGui` child, choose `Face` | Per impression: ≥1 s looked at, ≥1.5% of viewport, ≤55° viewing angle, ≥50% of pixels visible |
| **Video ad, autoplay** | Same, with `EnableVideoAds` on | Per impression: ≥0.5 s viewed, same viewport/angle/visibility rules; plays muted, pauses when not looked at |
| **Video ad, click-to-play** | Same | When a user watches **≥15 s** (full-screen with sound) |
| **Portal ad** | Creator Store › Ads › *Portal* package (`BasePortal`) | Per successful teleport into the advertiser's game (the advertiser's game must have a return button) |

**Validity rules for billboard units:** the block must be in `Workspace`, between **8×4.5 and 32×18 studs**, and have no other `AdGui` or `SurfaceGui` on the same face. Nothing may obstruct it. Portal packages: you may only change **scale, position and rotation** of `BasePortal`; customize only the `Decorative` folder.

**Unit states:** *Active* (serving), *Inactive* (valid but showing a fallback, for example an ineligible user, frequency cap, low demand or no matching campaign), *Invalid* (fails validation; portals turn into a concrete wall).

**Placement that earns without hurting the game:**
- High-traffic, natural-view locations: spawn plazas, queue areas, lobby walls facing the spawn direction.
- Don't trap players in front of ads or force views. The ad-fraud rules penalize inflated impressions, and Roblox may deduct or reclaim Robux or suspend the game or account.
- Name each unit clearly in Studio. Per-unit metrics use the **Studio name**.

### 3. Ineligible users
Units show a fallback (customizable image or the Roblox logo) to users who can't see ads. To hide units entirely, check `PolicyService:GetPolicyInfoForPlayerAsync(player).AreAdsAllowed` on the **client** and remove or hide units locally. Keep gameplay identical either way (don't hide a door that is also a portal ad).

```lua
-- LocalScript: hide all ad units for users who can't see ads
local PolicyService = game:GetService("PolicyService")
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local ok, info = pcall(PolicyService.GetPolicyInfoForPlayerAsync, PolicyService, Players.LocalPlayer)
if ok and info and not info.AreAdsAllowed then
	for _, unit in CollectionService:GetTagged("AdUnit") do -- tag your ad parts/packages
		unit:Destroy() -- local-only removal on this client
	end
end
```

### 4. Rewarded video ads
A full-screen ad of **6–30 seconds** that grants a reward when finished.

**Rules (eligibility table in the docs):**
- The reward **must be a developer product** of that universe. **You can't reward Robux.** Rewards **can't be randomized items**, and must not inflate currency or unbalance the economy.
- The player must take a **clear action** (button) to start the ad, with a disclosure of what they must do and what they'll get ("Watch the ad to earn 10 diamonds!").
- Grant the reward **immediately** after completion.
- **Not** a forced progress gate; don't take over the screen or obscure avatar motion; the character mustn't be harmed while watching (pause damage or only offer it in safe zones).
- Docs suggest rewards worth about **3–10 Robux**.

**Implementation (from the docs):**
1. Creator Hub › Monetization › Ads › Settings › *Rewarded Video › Serving enabled*, then pick the dev product reward.
2. **Client:** call `AdService:GetAdAvailabilityNowAsync(...)` only when the player is about to see the offer (for example when the shop opens). Calling early wastes fill and hurts CPM.
3. **Server:** `AdService:CreateAdRewardFromDevProductId(productId)` → `AdService:ShowRewardedVideoAdAsync(player, reward, placementId?)`, then grant through your normal **receipt handler** when the reward receipt arrives.
4. Track offers with `AdService:RegisterAdOpportunityAsync(...)` (optionally per placement) so the funnel *Requested → Filled → Ad Opportunities → Impressions → Rewarded* tells you whether the problem is discoverability or reward value.

> The docs' Placements section names the method `ShowRewardedVideoAsync` in one sentence, while the API reference lists **`ShowRewardedVideoAdAsync`**. Use the API reference name.

**Setting:** *Exclude your most likely purchasers from Rewarded Video Ads* is recommended **only** when the ad reward is also sold for Robux; don't enable it for unique ad-only rewards.

**Analytics to watch:** Fill rate, EPM, DUV/eDAU (share of eligible players who watched), Opt-in rate and Frequency, all under Monetization › Ads › Analytics. Roll new placements out through **Experiments** first to check retention isn't harmed (see [[Experiments and Configs - In-Game A-B Testing]]).

### 5. Payouts
Immersive ad earnings pay out on the **25th of the following month** (to My Transactions / Group Transactions). Metrics appear after about **48 hours**. Roblox may make "over-delivery" adjustments for invalid traffic, which can move EPM.

---

## Part B: Paying for players (advertiser side)

### 6. Products
| Product | Where it shows | Notes |
|---|---|---|
| **Sponsored games** (Ads Manager) | Home "Sponsored" + search results | Goals: **Plays**, **Earnings** (limited availability), **Engagement** (age-checked highly engaged players toward the Kids and Select threshold; expect a higher cost per play) |
| **Search ads** | Search results for exact keyword matches | Up to **10 keywords per Ad Set**; audience is fixed to all regions/genders, **13+** and all eligible devices; relevance affects the auction |
| **Immersive ads (as advertiser)** | Inside other games' ad units | Images, video, portals |
| **Sponsored items** | Marketplace surfaces | For UGC items |

Key mechanics:
- **Auto-bidding** from your budget and duration; **daily** or **lifetime** budgets. The payment method can't be changed after publishing.
- Pay by card (18+) or **Robux converted to ad credits** (13+, minimum 1 credit, **permanent and irreversible**; unused credits are refunded to the ad credit balance).
- Up to **10 thumbnails** per campaign, rotated evenly; shown at 16:9. Ads Manager can also AI-generate variations.
- Auctions are **second-price** (pay the next-highest bid + $0.01, adjusted by ad quality/relevance).
- **Non-unique games** (metadata and place files resembling existing games) may get **no ad spend and no conversions**.

### 7. How ads interact with discovery (documented)
- Running ads **does not affect** your Recommended For You ranking, and sponsored tiles aren't RFY candidates.
- Engagement, retention and monetization from **ad-acquired players are excluded** from RFY signals, even if those players later return via Home.
- Ad-acquired users are considered "already acquired", so your **RFY impressions can dip while total acquisition rises**. The docs state this is not a penalty.
- In acquisition analytics, search ads and sponsored ads currently appear combined as one *Sponsored Ad* metric.

**Practical consequence:** ads are for **testing and accelerating** (new update, new thumbnail, onboarding changes). Measure ad cohorts by D1/D7 and 30-day revenue per user in the Acquisition dashboard. If ad cohorts don't retain, fix onboarding before spending more; the Engagement-goal guidance itself says to revisit FTUE if there's no progress after 3–5 days.

---

## Common mistakes
- Placing ad units off the beaten path (no impressions) or forcing players to stare at them (fraud risk).
- Resizing billboard parts outside 8×4.5–32×18 studs, or stacking a SurfaceGui on the ad face.
- Editing the `BasePortal` package beyond scale/position/rotation.
- Rewarding Robux, random items or huge currency drops for rewarded video.
- Offering rewarded ads mid-combat without pausing damage.
- Calling `GetAdAvailabilityNowAsync` at join "just in case".
- Turning off 2FA or ID verification and silently losing ad eligibility.
- Reading an RFY dip during a sponsored campaign as a penalty.
- Advertising a game that is a near-copy of another (wasted spend).

## Checklist
- [ ] Eligibility met: public, 13+, ID-verified, 2FA, questionnaire approved, ≥2,000 monthly visitors
- [ ] Ad units valid size, unobstructed, clearly named, in natural sightlines
- [ ] Ineligible users handled with the fallback or local removal via `AreAdsAllowed`
- [ ] Rewarded video: clear button + disclosure, dev-product reward worth roughly 3–10 Robux, granted via receipt, no harm while watching
- [ ] Ad opportunities registered; funnel reviewed weekly
- [ ] New placements rolled out via an experiment
- [ ] Sponsored campaigns measured by cohort D1/D7 and 30D revenue, not just plays
- [ ] Ad credits conversion understood as irreversible before buying

---

**Sources checked (2026-10-25):** Creator Docs: Monetization › Immersive ads; Promotion › Rewarded video ads; Promotion › Advertise on Roblox; Promotion › Ads Manager; Promotion › Search ads; Discovery FAQ (Ads questions); Analytics › Acquisition; Engine API: AdService (GetAdAvailabilityNowAsync, CreateAdRewardFromDevProductId, ShowRewardedVideoAdAsync, RegisterAdOpportunityAsync), PolicyService.

**Related:** [[Monetization - Hub]] · [[Monetization Analytics and Segmentation]] · [[Analytics Discovery - Hub]] · [[Home Recommendations - What Roblox Documents About Discovery]] · [[Economy Sources and Sinks Spreadsheet Model]] · [[Thumbnail clicks but players leave]]
