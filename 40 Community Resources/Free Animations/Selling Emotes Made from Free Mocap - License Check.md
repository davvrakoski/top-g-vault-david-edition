---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/selling-emotes-free-mocap"
title: "Selling Emotes Made from Free Mocap - License Check"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original guidance (not legal advice)"
sources:
  - https://create.roblox.com/docs/avatar/emotes/import
  - http://mocap.cs.cmu.edu/
  - https://community.adobe.com/questions-696/mixamo-faq-licensing-royalties-ownership-eula-and-tos-589400
  - https://quaternius.itch.io/universal-animation-library
  - https://rancidmilk.itch.io/free-character-animations
  - https://accad.osu.edu/research/motion-lab/mocap-system-and-data
cssclasses: [tg-a40]
---

# Selling Emotes Made from Free Mocap - License Check

> A **Marketplace emote** is different from an animation inside your game: the animation itself **is the product** you sell. Licenses that happily allow "use in your game" often forbid exactly this. Check before paying the emote upload fee listed in [[Import emotes]].

## Quick verdicts (reading each source's own terms)

Source | In your game | Sold as a Marketplace emote | Why
---|---|---|---
Your own keyframes / your own video capture | Yes | **Yes** | Your work
CMU mocap (and CMU-derived sets like RancidMilk) | Yes | **No** | CMU: may not resell the data directly, "even in converted form"; RancidMilk: don't sell the animations themselves
Mixamo | Yes | **Avoid** | Adobe allows commercial projects but bans distributing the animation files and asset-store style packages; an emote that is just a Mixamo clip is the clip itself being sold. Not clearly allowed - treat as no
Rokoko free packs | Yes | **Avoid** | Pages allow use in projects; resale/redistribution is not granted
Quaternius UAL (CC0 per page) | Yes (use-only in this vault) | Legally allowed by CC0, but the vault owner excludes Quaternius from anything sold/bundled | Owner policy
ACCAD (CC BY 3.0) | Yes, with credit | Allowed by CC BY with credit - but you cannot put a credit inside an emote item reliably | Put credit in the item description; still check Roblox's own rules
100STYLE (CC BY 4.0) | Yes, with credit | Same as ACCAD | Credit in the description

## Safer pattern
1. Use free mocap as **reference or base**, then substantially re-animate (new timing, poses, style) - still check the base license, since a derivative is still built on it.
2. Best: capture yourself with Roblox [[Animation capture]] and polish it. No third-party license to worry about.
3. Keep proof: project files, capture video, and the license page you relied on.

## Also required by Roblox
Emotes must meet the [[Emote specifications]] and be uploaded as CurveAnimation data ([[KeyframeSequence vs CurveAnimation - Export Paths]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[Import emotes]] · [[Emote specifications]] · [[Free Animation Sources - License Table]] · [[Asset Licenses and Credits]]

<!-- TDOD_GRAPH_END -->
