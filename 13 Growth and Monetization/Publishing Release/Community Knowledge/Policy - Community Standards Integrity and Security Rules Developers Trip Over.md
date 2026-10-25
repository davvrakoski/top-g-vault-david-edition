---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Community Standards Integrity and Security Rules Developers Trip Over"
tags: [roblox, community-knowledge, publishing, policy, community-standards, moderation]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://about.roblox.com/community-standards
  - https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards
---
# Community Standards Integrity and Security Rules Developers Trip Over

> Not legal advice. Our summary of the Roblox Community Standards, checked 2026-10-25. Read the [official page](https://about.roblox.com/community-standards) for the exact wording.

Most developers know the obvious bans (sexual content, hate, extremism). The rules that actually catch game teams sit in the **Integrity** and **Security** sections, because they are about how you build and sell, not what you draw. This note lists those rules with the design decision each one forces.

## Civility rules that hit game themes

- **Real-world sensitive events:** no recreating, mocking or profiting from real tragedies; no depicting real human-rights violations or border disputes.
- **Violent content and gore:** extreme violence, torture and realistic gore are banned; Restricted (18+) games follow a separate, looser policy.
- **Romantic and sexual content:** includes a ban on flirting, pursuing relationships and "dating" mechanics, and on bathrooms or bedrooms in social hangouts (outside 18+).
- **Illegal and regulated goods:** drugs, alcohol (outside 18+), tobacco, vapes, real firearms, weapon-making instructions. **Simulated gambling is banned too**, including any game of chance where players stake Robux or items.
- **Profanity:** includes obfuscated spellings and profane audio.
- **Political figures and entities:** no officials, campaigns, parties or elections, no political fundraising.

## Integrity rules (the monetization traps)

| Rule | What it means for your game |
| --- | --- |
| Repetitive and misleading content | Misleading titles, thumbnails or descriptions, duplicate uploads, and games that exist only to push players off Roblox are banned. |
| Advertising | Any paid promotion or off-platform call to action must follow the Advertising Standards. |
| Advertising Integrations | Third-party ad units need registration and Roblox tools; no programmatic third-party ad calls, no sharing user data, no personalised ads to under-18s. In effect from 2026-05-04. |
| Fraud (Roblox economy) | No third-party Robux trading, off-platform sales of accounts or items, group-payout abuse, or bypassing Roblox fees. |
| Promotional offers | Selling on-platform items through off-platform promotions needs a contract with Roblox. |
| Commerce | Physical goods only via eligible developers and approved Shopify stores. |
| Soliciting donations | No charity prompts or "your purchase funds a cause" claims. A tip jar is fine if the player clearly gets nothing back. |
| Paid item trading | Must be gated with PolicyService for ineligible users. |
| Paid random items | Odds shown numerically before purchase, every outcome must give some benefit, ineligible users blocked, trading gated. |
| Contests and sweepstakes | You may not run your own contests or chance games with Robux or real-money prizes. |

## Security rules

- **Sharing personal information:** limits depend on the player's age; never build features that ask for emails, addresses, phone numbers or off-Roblox handles.
- **Directing users off-platform:** external links only through the official Social Links feature (age-checked 16+). Everything else, including text in-game telling players to visit a site, is banned.
- **Misusing Roblox systems:** no circumventing safety tools, no ban evasion, no VPN location masking, **no skipping required PolicyService or TextChatService APIs**, and **no kicks or bans through third-party systems instead of the Kick and Ban API**.
- **Disruptive content:** no disruptive bots, **no obfuscated or hidden scripts**, no false reports, no flooding games or groups.

## Design implications checklist

- [ ] Chance mechanics never take Robux, Robux-bought currency or tradeable items as a stake
- [ ] No in-game text pointing to Discord, YouTube or websites; links live on the game page only
- [ ] Moderation tools use `Players:BanAsync` / `Player:Kick`, not a custom external ban list that bypasses them
- [ ] No obfuscated code shipped in the place (also a Creator Store rule)
- [ ] Donation features are pure tips with no reward
- [ ] Giveaways use in-game rewards only, no Robux or cash prizes

## Related
[[Publishing Release - Hub]] · [[Ethical Monetization Lines - Where Devs Draw Pay-to-Win]] · [[Ban API in Practice - BanAsync, Alt Detection and Appeals]] · [[Policy - Paid Random Items - Odds Disclosure Checklist]]
