---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Cross-Promotion with Other Roblox Devs - Collabs, Teleports and Shared Events"
tags: [roblox, community-knowledge, marketing, collaboration, teleport, cross-promotion]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/acquisition
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/production/promotion/experience-events
  - https://about.roblox.com/community-standards
---
# Marketing - Cross-Promotion with Other Roblox Devs - Collabs, Teleports and Shared Events

Roblox's Acquisition guide suggests partnering "with other creators who make similar games to grow together". It's one of the few off-platform tactics that also creates **on-platform** traffic, through portals, collab items and shared events. Two small games with overlapping audiences can trade players without paying for ads, and a collab is also a ready-made story for social media ("we teamed up with X"). This note covers deal shapes, the teleport settings, and comms.

## 1. Finding partners
- Similar **audience** (age, genre fans) but not a direct competitor: a zombie survival game and a horror escape game, or a racing game and a car-meet hangout.
- Similar **size**. A fair swap needs comparable traffic, or an agreed imbalance (the bigger game gets something else).
- Partners you meet in dev Discords, on X/Bluesky, at DevForum, or in creator-dev circles. Your YouTube audience includes developers too.

## 2. Collab shapes

| Shape | Mechanic | Effort |
|---|---|---|
| **Portal swap** | each game places a portal or NPC that teleports to the partner game | low |
| **Collab item** | get item A in game 1 by playing game 2 (badge check) | medium |
| **Shared event weekend** | both games run linked events the same weekend; cross-posted socials | medium |
| **Creator crossover** | each dev appears in the other's video or stream | low |
| **Joint update trailer** | one trailer, two games, both channels | medium |

## 3. Teleport mechanics and settings
- `TeleportService:TeleportAsync()` can **only be called from server scripts**. The client `Teleport()` is deprecated.
- Studio > File > **Experience Settings > Security > Allow Third Party Teleports** controls teleports **to games you don't own**. Enable it for a partner portal. It isn't needed between your own games.
- The partner's game sees your players arrive under the **Teleport** acquisition source. Agree up front which numbers you'll share (visits from the portal, D1 of those players).
- Add a confirmation UI ("Leave to visit <Partner>?"). Surprise teleports frustrate players and feel like a trap.
- Pass small, non-sensitive teleport data if you want a welcome effect. Treat incoming data as untrusted.

**Badge-based collab item (sketch):** game 1 checks on join whether the player owns a badge from game 2, then grants the collab cosmetic. Use `BadgeService:UserHasBadgeAsync(userId, badgeId)` on the server and cache the result.

## 4. Comms plan for a collab
1. Teaser from **both** accounts on the same day ("something's coming to both our games").
2. Joint video: a 30 s "game A x game B" trailer. Each dev posts natively with their own Share Link.
3. Roblox **events** in both games, linked in the descriptions (event share pages can be posted anywhere).
4. Shared Discord announcement (or a temporary shared channel via Discord's announcement-follow feature).
5. Recap with numbers afterwards. It builds trust for the next collab.

## 5. Rules and fairness
- Get it in writing (even a Discord message): dates, placements, how long portals stay, who can end it early.
- No paid traffic swaps hidden from players. If money changes hands for promotion, the disclosure rules apply ([[Marketing - Paid Promo Disclosure - FTC, ASA and Platform Labels]]).
- Don't make collab items **purchasable** in one game as a reward for buying in another. The Community Standards treat indirect benefits for purchases in other Roblox properties as getting around payment systems.
- Use the partner's name and art only as agreed. Both sides own their own IP.

## Pitfalls
- Partnering with a game that has poor retention: your players come back disappointed.
- Permanent portals that keep pulling your players out. Time-box them (1-2 weeks).
- One side shipping late. Agree a fallback date.

## Related
[[Community Discord - Hub]] · [[Global Live Moments - Scheduled Cross-Server Events]] · [[Marketing - Pre-Launch Hype on Roblox - Events, Notify Me and Community Joins]] · [[Social Systems - Parties, Friends and Co-Play]]
