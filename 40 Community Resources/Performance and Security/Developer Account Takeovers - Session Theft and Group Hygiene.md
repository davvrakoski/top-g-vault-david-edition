---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/developer-account-takeovers"
title: "Developer Account Takeovers - Session Theft and Group Hygiene"
tags: [roblox, community, "cluster/performance-and-security", security, accounts, groups]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://www.malwarebytes.com/blog/scams/2026/06/roblox-developers-are-losing-entire-games-to-malware-attacks
  - https://devforum.roblox.com/t/my-games-were-stolen-and-now-8500-usd-is-not-eligible-for-devex/4773705
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/projects/collaboration
  - https://create.roblox.com/docs/projects/activity-history
---
# Developer Account Takeovers - Session Theft and Group Hygiene

In 2026, the biggest security risk for many Roblox games wasn't an exploiter. It was **someone stealing the developer's logged-in session**. Anti-cheat scripts can't help once someone else holds the keys to the group.

## How the 2026 takeovers worked (reported cases)

- **Lure:** a fake job offer on Discord. Malwarebytes (Danny Bradbury, Jun 2026) describes developers being asked to install a "database tool" (a Python package named `robase`). In another case, the attackers posed as a known studio.
- **Payload:** an **infostealer** that grabs authenticated browser **sessions** instead of passwords. Because the session is already logged in, **2-step verification is often bypassed**.
- **After the theft:** the victim's 2-step settings and passkey were changed, Discord was taken too, and the game's **group and Robux** moved to other accounts within hours. One developer said they spent over 30 days with support before press coverage moved things along.
- **DevForum example:** BEASTCHICKEN49 (Aug 2026) reported that two games were moved out of their profile into an attacker-controlled group and then moderated, leaving about 2,000,000 Robux of earnings **not eligible for DevEx**. A reply from sfs_theDev suggested a malicious GitHub download as one possible way in; the original poster didn't confirm how it happened.

## Hardening checklist

**Your machine**
- Never run installers, "tools" or scripts from unsolicited job offers. Open unknown software only in a VM or on a machine that isn't signed in to anything important (Malwarebytes advice).
- Review your **active sessions and signed-in devices** regularly, and sign out everywhere after anything suspicious.
- Turn on Roblox's **Enhanced Protection** / 2-step verification. It still matters, even though session theft can get around it.

**Your group** (Creator Hub *Groups*)
- Keep the number of people holding **Owner** and powerful roles small. Review every role's permissions on the **Permissions** tab, especially Role Manager, **Universe Publisher**, **Universe Monetization Manager** and **Universe Bans Manager**.
- Give collaborators **per-game** permissions rather than group-wide editor or publisher roles where you can.
- The docs say Roblox **can't arbitrate disputes** inside a group. Settle ownership and revenue agreements in writing before you ship.

**Your game**
- Collaborator levels are **Owner / Edit / Play / No Access** (Creator Hub *Collaboration*). Remove Edit from anyone who no longer needs it.
- Check **Activity History** (Studio Window menu, or the Creator Dashboard page) after publishes. It logs who published or changed what, and when.
- Keep API keys in the **Secrets store**, not in scripts. A stolen place file then doesn't include your keys (see [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]]).
- Keep regular **local backups** of your place files, so you can rebuild if recovery fails.

**If it happens:** record everything early (messages, screenshots, account changes, ticket IDs) and keep writing to Roblox Support. Both the Malwarebytes article and DevForum replies recommend this.

## Credits

Malwarebytes Labs, Danny Bradbury, *Roblox developers are losing entire games to malware attacks* (Jun 2026). DevForum: BEASTCHICKEN49, sfs_theDev, zombi_vadim, icyMillys (2026). Roblox Creator Hub *Groups*, *Collaboration* and *Activity History* (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Groups (teams)]] · [[Collaboration]] · [[Activity History]] · [[Plugin and MCP Supply-Chain Security]] · [[Plugin and Free Model Safety Checklist]]

<!-- TDOD_GRAPH_END -->
