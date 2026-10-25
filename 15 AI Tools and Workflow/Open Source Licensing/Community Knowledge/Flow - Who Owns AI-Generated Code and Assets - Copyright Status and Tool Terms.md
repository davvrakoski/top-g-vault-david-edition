---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
title: "Who Owns AI-Generated Code and Assets - Copyright Status and Tool Terms"
tags: [roblox, community-knowledge, licensing, ai, copyright]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.copyright.gov/newsnet/2025/1060.html
  - https://www.skadden.com/insights/publications/2025/03/appellate-court-affirms-human-authorship
  - https://raw.githubusercontent.com/Roblox/cube/main/LICENSE
  - https://create.roblox.com/docs/ai-data-sharing
  - https://help.suno.com/en/articles/2416769
  - https://elevenlabs.io/docs/help-center/legal/can-i-publish-the-content-i-generate-on-the-platform
---
# Who Owns AI-Generated Code and Assets - Copyright Status and Tool Terms

"I made it with AI, so it is mine" is only half true. Two separate questions decide what you can do with AI output in a Roblox game: **(1) does copyright protect it at all**, and **(2) what does the tool's licence let you do with it**. The answers differ by country, tool, plan and how much you changed the output. This note gives the current US position (the one most Roblox devs run into) and a practical policy for a small studio. It is general information, not legal advice; for a contract or a dispute, ask a lawyer.

## Question 1: is AI output copyrightable?

**United States, as of late 2026 sources:**

- The US Copyright Office's **Part 2 report on copyrightability (29 Jan 2025)** concluded that **prompts alone** do not give enough human control to make you the author. Protection can exist where a human's own expression is perceptible in the output, or where a human creatively **selects, arranges or modifies** it. Using AI as an assistive tool does not by itself block protection of the larger human work.
- In **Thaler v. Perlmutter** (D.C. Circuit, 18 Mar 2025) the court affirmed that the Copyright Act requires a human author; a machine cannot be the author. Commentators read it narrowly: it does not settle how much human input is enough.
- Other countries differ (some have specific rules for computer-generated works). If your studio or players are mainly elsewhere, check that country.

What this means for a Roblox game:

| Asset | Practical strength of your rights |
|---|---|
| Raw AI image/track/mesh, unedited | Weak or none; others may be able to reuse it freely |
| AI draft heavily edited by you (paint-over, retopo, re-arranged music) | Your human contributions can be protected |
| Your game as a whole (design, code you wrote or reviewed, level layout) | Normal protection for the human-authored parts |
| AI-written code you accepted unchanged | Uncertain; treat as unprotected |

Weak copyright mostly matters when someone copies you: a clone game reusing your raw AI icon is harder to take down than one copying your hand-made art.

## Question 2: what does the tool allow?

Copyright status does not override the tool's terms. Examples checked 2026-10-25:

- **Suno**: free plan, Suno keeps ownership and use is non-commercial; paid plan, songs made while subscribed are yours with commercial rights.
- **ElevenLabs**: free plan, no commercial licence and attribution required; paid plan, commercial licence except Beta Services.
- **Roblox Cube 3D open weights**: Cube3D Research-Only RAIL-MS License, academic and research use only (this is about the downloadable model, not using Cube inside Studio).
- **Roblox data sharing**: what you publish may be used to train Roblox models depending on your setting; free Creator Store assets are always shared ([[Flow - Local vs Cloud AI - Keeping Unreleased Game Code Private]]).

Always record the tool, plan and date per asset ([[Asset and License Log Template]]).

## Question 3: does the output infringe someone else?

Independent of both questions above: if an AI output looks like a protected character, logo, song or another game's asset, you can still infringe. Prompting "in the style of <franchise>" or uploading someone's art as an image prompt raises that risk. Roblox takes down infringing content regardless of how it was made ([[Reference IP, Originality and Asset Rights]]).

## A studio policy in five lines

1. AI output is a **draft**; every shipped asset gets meaningful human editing.
2. Only commercial-plan output in the game; no beta-model output.
3. No prompts naming third-party IP, artists or real people.
4. Log tool, plan, date and prompt for each asset.
5. Signature assets (logo, mascot, main theme) are human-made or human-led.

## For open-source releases

If you publish a Roblox library that includes AI-written code, say so in the README; licence terms still apply to the human-authored parts, and contributors should know where the uncertain parts are ([[Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL]]).

## Related
[[Open Source Licensing - Hub]] · [[IP, Licensing and Asset Due Diligence]] · [[Flow - AI Voice and Music Generators - Licence Tiers and Consent for Roblox Games]] · [[Policy - Generative AI in Games - Disclosure and Maturity Rules]]
