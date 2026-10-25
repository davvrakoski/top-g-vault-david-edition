---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Generative AI in Games - Disclosure and Maturity Rules"
tags: [roblox, community-knowledge, publishing, policy, generative-ai, npc, disclosure]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/generative-AI
  - https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use
  - https://en.help.roblox.com/hc/en-us/articles/15869919570708-Age-Restricted-Content-on-Roblox
---
# Generative AI in Games - Disclosure and Maturity Rules

> Not legal advice. Summary of the Creator Hub page "Games with Generative AI", the "AI Technologies & AI Tools" part of the Creator Terms, and the Age-Restricted Content policy, checked 2026-10-25.

AI-driven NPCs, generated items and chatty companions are now possible with Roblox's own `TextGenerator` and `GenerationService`, or with third-party models over HttpService. Roblox allows them, but adds three obligations: **moderate the output**, **tell players it is AI**, and **rate the game correctly**. Using AI to *build* your game does not trigger any of this; only player-facing AI does.

## Moderation

- With Roblox APIs (`TextGenerator`, `GenerationService`), inputs and outputs go through Roblox moderation; players are not punished for violating output produced from harmless input.
- With **third-party** models you are responsible for every output. Outputs must meet the Community Standards, and AI text must still pass Roblox safety systems: Roblox's own example is that AI text inputs and outputs go through `TextChatService`.

## Maturity questionnaire

You must declare any player interaction with a generative model (text, voice, images, 3D, avatar movement).

- **Limited interactions** (short, no memory between sessions): the label does not change, but outputs must fit your game's existing rating. Roblox says its served models aim for all-ages output, and only generate (compliant) weapons when the game is rated mild violence or higher.
- **Extended interactions** make the game **Restricted (18+)**. A game is extended if either:
  - the main purpose is to keep talking to an AI character with no time limit, or
  - the AI has **cross-session memory** (it remembers previous sessions).

Even one gameplay NPC with saved conversation memory crosses the line. If you need an all-ages game, do not persist AI conversation context in DataStores.

## Required disclosures

From the Creator Hub page and the Creator Terms:

1. At the start of every AI interaction **and throughout the session**, show that the player is talking to AI and that it can make mistakes.
2. AI output is machine-generated, is not a human's view or advice, and may be wrong.
3. If a player asks for medical or professional advice, point them to authoritative resources; if they show signs of self-harm or crisis, the model must encourage them to seek help (Roblox suggests pointing to resources linked from its Community Standards).
4. Never mislead players into thinking AI output is human, and never use AI for direct interaction without making that obvious.
5. Follow the third-party provider's own terms and pay its fees; Roblox may limit AI tools for certain age groups.

## Implementation checklist

- [ ] Persistent "AI" badge on the NPC nameplate and in the dialogue box
- [ ] A disclaimer line at the start of each conversation
- [ ] Third-party output passed through text filtering before display
- [ ] Prompt rules that keep outputs inside your maturity label
- [ ] Crisis-keyword handling that returns a supportive, resource-pointing reply
- [ ] No conversation memory saved across sessions (unless you accept 18+)
- [ ] API keys for third-party models stored in Secrets Store, never in scripts

## Related
[[Publishing Release - Hub]] · [[Policy - Age-Restricted Content - 16+ and 18+ Rules]] · [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]] · [[Games with Generative AI]]
