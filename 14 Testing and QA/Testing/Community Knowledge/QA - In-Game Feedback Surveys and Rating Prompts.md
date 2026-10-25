---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - In-Game Feedback Surveys and Rating Prompts"
tags: [roblox, community-knowledge, testing, qa, feedback, surveys, playtest]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/education/developer/beta-testing-experiences
  - https://create.roblox.com/docs/production/analytics/feedback
  - https://create.roblox.com/docs/ui/text-filtering
  - https://devforum.roblox.com/t/form-embedder-an-impossibly-simple-way-to-add-a-google-form-to-your-experience/2183701
---
# QA - In-Game Feedback Surveys and Rating Prompts

Discord feedback comes from your biggest fans; most players never join. A small in-game survey reaches the silent majority at the exact moment they have an opinion (end of a round, after the tutorial, after leaving the shop without buying). Roblox's beta-testing guide recommends in-game feedback for exactly this, and warns that leading questions and poor survey design make the data useless.

## What Roblox already gives you

- **Feedback dashboard** (Creator Hub > game > Audience > Feedback): upvote/downvote trend and filtered player comments from the game page, with device and platform, exportable to CSV. Check it after every update: a spike in downvotes the day after a patch is your first regression alarm.
- Everything else (in-game questions) you build yourself.

## Design the survey

- **One to three questions**, never a long form mid-game.
- **Trigger at natural breaks:** after the tutorial, at the end of a match, on the third session. Never during combat or on first join.
- **Rate-limit:** at most once per player per update (store the build version they answered in their data).
- **Close-ended first:** a 1-5 rating or emoji scale, then one optional multiple choice ("What stopped you?" Too hard / Confusing / Bored / Bugs / Other).
- **Neutral wording:** "How was this round?" not "Did you enjoy our awesome new map?".
- **Always skippable** with a clear "Not now" button the same size as the answer buttons.

## Free text: be careful

Typed comments from players are user text: filter through `TextService:FilterStringAsync()` before storing anything that might be shown to anyone, and never ask for personal info (age, school, real name, contact). Many players are minors. Prefer choices over free text; if you allow text, cap it (200 characters).

## Storing answers

| Option | Notes |
|---|---|
| `AnalyticsService:LogCustomEvent(player, "SurveyRound", rating)` with custom fields (map, mode) | Aggregates for you, no storage code; counts against the 100 custom event names |
| A DataStore keyed by build + date | Raw answers; read with Open Cloud or a staff-only reader |
| External form (Google Forms embed community tools) | Community tools like Form Embedder exist on the DevForum; not supported by Roblox, check HTTP rules and privacy before using |

Avoid sending answers to external webhooks from the server unless you understand data rules for minors; analytics events are the safest default.

## QA the survey itself

- [ ] Appears only on its trigger and only once per build.
- [ ] Does not appear in Studio test sessions or for QA staff (flag check).
- [ ] Works on touch, gamepad (selectable buttons) and keyboard.
- [ ] Skipping and answering both close it and never block input afterwards.
- [ ] Answers show up in the analytics **View Events** list on the test place.
- [ ] Text is localised and fits at the largest preferred text size.

## Reading results

Compare ratings per build, per device and per mode. Pair low scores with the session's analytics (did they die 5 times?). A rating drop that appears only on phones is usually a UI or performance bug, not a design problem.

## Related
[[Testing - Hub]] · [[Playtest Scripts and Session Facilitation]] · [[QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events]] · [[In-Game Bug Report Button - Capturing Useful Context]]
