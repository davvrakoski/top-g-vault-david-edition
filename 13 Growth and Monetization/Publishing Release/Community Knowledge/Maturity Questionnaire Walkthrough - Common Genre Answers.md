---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Maturity Questionnaire Walkthrough - Common Genre Answers"
tags: [roblox, community-knowledge, publishing, maturity, compliance, gore, horror]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://create.roblox.com/docs/production/publishing/kids-and-select
  - https://create.roblox.com/docs/production/monetization/paid-random-items
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
---
# Maturity Questionnaire Walkthrough - Common Genre Answers

The Maturity & Compliance Questionnaire decides your label (Minimal, Mild, Moderate, Restricted) and therefore which age tiers can play. Small art decisions (blood color, how bodies disappear, one jump scare) move a game across a line. This note maps the documented thresholds onto design choices so you can **choose your label on purpose** instead of discovering it at publish. Always answer for the **most extreme content** a player can meet; misrepresenting it risks moderation.

## The labels (from Roblox's table)

| Label | Can contain |
|---|---|
| Minimal | occasional mild violence, light unrealistic blood |
| Mild | repeated mild violence, heavy unrealistic blood, mild fear, mild crude humor |
| Moderate | moderate violence, light realistic blood, moderate fear, moderate crude humor, unplayable gambling content |
| Restricted (18+ verified) | strong violence, heavy realistic blood, romantic themes, alcohol, strong language, ... |

Kids accounts see Minimal/Mild; Select (9-15) adds Moderate.

## Design levers that set your label

**Violence**
- *Mild* = implied or unrealistic: bodies vanish at 0 HP, cartoon knockouts, off-screen sounds.
- *Moderate* = realistic-looking but non-graphic violence or death (realistic injuries).
- *Restricted* = graphic (e.g. dismemberment, decapitation).
- Frequency matters: even a small part with lots of violence in quick succession counts as **Repeated**.

**Blood**
- Unrealistic (pixelated, wrong color/shape, e.g. green goo) stays in Minimal/Mild territory.
- Any realistic blood, even distant splatter, is at least **Light realistic** -> Moderate.
- **Heavy realistic** blood (pools, gushing, close splatter) is 18+ only.

**Fear**
- *Mild* covers typical Roblox horror: jump scares, creepy NPCs, screams, ominous music, suspense.
- *Moderate* starts with realistic gore on faces/bodies (exposed tissue, bleeding eyes).

**Other questions that catch games**
- **Paid random items** (eggs, crates, spins bought with Robux or Robux-bought currency) and **paid item trading** must be declared; respect `ArePaidRandomItemsRestricted` and `IsPaidItemTradingAllowed`.
- **Social hangout** applies to chat/hangout-first games, not to roleplay/life sims with roles and props.
- **Free-form user creation**, **media sharing**, and **AI interaction** (generative AI players can talk to) each have their own questions.
- Only content **you** create counts, not avatar items players bring.

## Typical answers by genre (check your own game)

| Genre example | Likely label | Watch out for |
|---|---|---|
| Simulator / obby, cartoon hits | Minimal | a "blood" particle in red realistic style |
| Tower defense, enemies pop | Minimal-Mild | repeated combat -> Repeated violence |
| Kid-friendly horror (chases, jump scares) | Mild | realistic gore textures on the monster -> Moderate |
| Zombie shooter, ragdolls, red splatter | Moderate | dismemberment/decapitation or blood pools -> Restricted |
| Gore-heavy survival | Restricted | locks you to 18+ verified, small audience |

**Tip for gore games:** build the gore level as one setting in code (e.g. none / unrealistic / realistic) so you can ship the level that matches the label you want. Use `PolicyService` separately for the per-region rules it actually covers (paid random items, trading). The questionnaire rates what can be encountered, so a hidden "max gore" mode still counts if players can reach it.

## Process tips

- Retake the questionnaire **every time an update changes an answer** (new gore, trading, AI NPCs).
- The preview page shows the label and regional non-compliance before you submit; screenshot it for your release notes.
- Restricted can't be changed back to a lower maturity later.

## Related
[[Publishing Release - Hub]] - [[Roblox Kids and Select - Reaching Players Under 16 in 2026]] - [[Paid Random Items, Odds Disclosure and PolicyService]] - [[Release Checklist]]
