---
area: "14 Testing and QA"
cluster: "Testing"
title: "Player Emulator QA - Pseudolocalization, Text Elongation and Region"
tags: [roblox, community-knowledge, testing, localization, policy, studio]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/production/localization
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
---
# Player Emulator QA - Pseudolocalization, Text Elongation and Region

Most Roblox players are not English speakers, and many live under policies that hide or change features (paid random items, social links, ads). Studio's **Player Emulator** lets one tester check translated UI and policy-dependent features without a VPN or a second account. It is a 15-minute pass that catches clipped text and illegal shop buttons before launch.

## Turning it on
Test menu > **Player Emulator** > toggle **Enable Test Profile**. The setting stays on even if you close the window, so turn it off when done (a forgotten test profile has confused many solo devs).

## The four options that matter
| Option | What it does | Bug it finds |
|---|---|---|
| **Locale** | Plays as if the player's language were the chosen one | Missing translations, wrong fonts for scripts like Thai or Arabic |
| **Pseudolocalize** | Swaps letters for look-alike accented characters | Any text that stays plain English is **not** going through the translation system (hard-coded strings, text built by concatenation) |
| **Elongate** | Stretches strings by a slider percentage | Buttons and labels that clip or overflow when translated text is longer |
| **Region** | Emulates a country / region | Features gated by `PolicyService:GetPolicyInfoForPlayerAsync()` |

The docs note Spanish averages about 30 percent longer than English and German even longer, so test with Elongate at **at least 30-40 percent**.

## Pass 1: pseudolocalize everything
1. Enable Pseudolocalize, play through onboarding, shop, settings, results screens.
2. Screenshot any plain-English text. Typical causes:
   - Strings assigned from a script with `AutoLocalize` off or in a way the translator does not capture.
   - Numbers and names joined into sentences (`"You earned " .. n .. " coins"`): use translator formatting with parameters instead.
   - Text inside images. These can never be translated: replace with live text.

## Pass 2: elongate at 40 percent
Look for: clipped words, text over icons, buttons growing off-screen. Fixes: `TextScaled` with `UITextSizeConstraint` (MaxTextSize), `AutomaticSize`, wrapping, or wider containers. Recheck on the Device Simulator's smallest phone.

## Pass 3: regions and policy
For each region in your top markets plus at least one strict region:
- Shop: are paid random items (loot boxes) hidden when the policy says so?
- Social: are external links and social handles hidden where not allowed?
- Ads / sponsored content and voice features behave per policy.
Read the policy result on the server, cache per player, and expose it to UI; never decide on the client alone.

## Record format
`[Locale/Region] Screen - element - problem - screenshot`, one line each, sorted by screen. Most fixes are UI layout, which designers can batch.

## Pitfalls
- Testing only with machine translation on: you see real text but not missing hooks. Pseudolocalization is better for coverage.
- Fixing clipping with smaller fonts everywhere: hurts readability on phones. Prefer layout that grows.
- Forgetting right-to-left: if you support Arabic, check alignment and icons that imply direction.

## Related
[[Testing - Hub]] · [[Localization Production Workflow]] · [[Accessibility, Input and Localization]] · [[Device, Network and Controller Simulation Test Pass]]
