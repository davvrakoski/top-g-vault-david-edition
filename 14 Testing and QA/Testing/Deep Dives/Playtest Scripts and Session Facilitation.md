---
area: "14 Testing and QA"
cluster: "Testing"
tags: [deep-dive, roblox, playtesting, ux-research, facilitation, onboarding]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Playtest Scripts and Session Facilitation

## Why this matters
The first three minutes decide whether a Roblox player stays, and the developer is the one person who can never experience those minutes fresh. Watching five new players struggle is faster and cheaper than any analytics dashboard at finding *why* they leave.
But a badly run playtest (helping the player, asking leading questions, testing with your friends who already know the game) produces confident wrong conclusions. This note gives you scripts, an observation sheet and a synthesis method, plus Roblox's tester-invite rules and safety requirements.

---

## 1. Pick the right kind of playtest

| Type | Question it answers | Who | Size |
|---|---|---|---|
| **First-time user test** (moderated, think-aloud) | Where do new players get confused or bored? | People who've **never** seen the game | 5 per round |
| **Unmoderated session** | What do players do when nobody's watching? | Testers playing at home + your analytics/custom events | 10–30 |
| **Targeted task test** | Can players complete X (craft, trade, find the shop)? | New or mid players | 5 |
| **Multiplayer/stress session** | Does it hold up with a full server? | Testers + team | Full server |
| **Balance/feel review** | Is combat/difficulty right for experienced players? | Regulars, Discord testers | 5–10 |

**Five users per round** is a widely cited usability rule of thumb: most major problems show up by the fifth participant. Run several small rounds (fix, re-test) rather than one big one.

---

## 2. Getting testers in (Roblox rules)

| Method | Rule (Creator Docs) |
|---|---|
| **Invite early testers** (File › Invite early testers) | Up to **10** similar-aged friends, or trusted friends, before public release. The allowed age range depends on **your** age (for example 18+ creators can add 16+ friends; trusted friends of any age, with parent approval for under 9). Testers see a **preview watermark**; Community Standards and in-game reporting still apply |
| **Audience › Playtest tab** | *Early testers* always on; *Playtesters* limits play to users with Edit or Playtest access plus invited testers |
| **Team Test** | Collaborators with edit access test together in Studio; one session at a time |
| **Paid access** (closed beta) | Docs note some developers temporarily charge for access to run a closed beta with engaged users |
| **Experiments** | For live games, test changes on a share of real players with statistics (see [[Experiments and Configs - In-Game A-B Testing]]) |

Testers under 16 can't preview games rated above what their parent allows, and under-18 testers can't preview **Restricted** games.

### Safety and privacy (non-negotiable)
- Many testers will be **minors**. Don't collect personal data (real names, addresses, school, photos). Don't record faces or voices without proper consent from a parent or guardian.
- Moderated sessions with minors: run them in public channels or with another adult staff member present, never in private one-to-one voice calls.
- Communicate in-game or in your moderated community channels. Don't ask testers to install anything or share account credentials.
- Pay testers only through Roblox-compliant means, and never make "free Robux" offers.

---

## 3. The facilitator script (first-time user test, ~25 minutes)

**Before (2 min)**
> "Thanks for helping! We're testing the **game**, not you, so there are no wrong answers. Please **think out loud**: say what you're looking at, what you expect, and what's confusing. I can't help you during the test because I want to see what a real player would do. You can stop any time."

**Warm-up (1 min)**
> "What kinds of Roblox games do you usually play?" *(record genre familiarity)*

**Free play (10 min)**: say nothing except neutral prompts:
- "What are you thinking right now?"
- "What do you expect will happen if you do that?"
- "What are you looking for?"
- If silent > 20 s: "Can you tell me what's going through your mind?"

**Never say:** "Try the shop", "That's a button", "You missed the arrow", "Do you like it?" (leading and helping).

**Tasks (7 min)**: only after free play, one at a time:
1. "Find a way to get more [currency]."
2. "Upgrade something."
3. "Invite a friend." *(or another feature under test)*

Stop each task after 2 minutes of being stuck and note it as a **fail**.

**Debrief (5 min)**:
1. "In one sentence, what is this game about?" *(checks the core loop is clear)*
2. "What was the most fun moment? The most annoying?"
3. "What would you do next if you kept playing?" *(checks the next goal is visible)*
4. "Would you play again tomorrow? Why or why not?" *(soft D1 signal, but don't over-trust it)*
5. "Was anything hard to read or reach?" *(device/UI issues)*

---

## 4. Observation sheet

Log with **timestamps**. The first three minutes map directly to the documented first-play bounce windows (<60 s, 61–180 s).

| Time | What happened (behaviour, not opinion) | Quote | Severity (0–4) | Area |
|---|---|---|---|---|
| 0:08 | Spawned facing wall, rotated camera for 6 s | "where do I go" | 3 | Spawn |
| 0:41 | First coin collected | "oh nice" | — | Loop |
| 1:55 | Opened shop by accident, closed immediately | — | 1 | UI |
| 3:20 | Didn't notice upgrade button for 70 s | "how do I get faster" | 3 | UI |

**Severity scale** (common usability convention):
0 = not a problem · 1 = cosmetic · 2 = minor, slows the player · 3 = major, player struggles or misunderstands · 4 = blocker, player can't continue or quits.

**Key timings to record per participant:** time to first movement, first core action, first reward, first upgrade, and quit time (if they quit).

---

## 5. Instrument the test build

- Publish to a **test place** and log custom events and funnel steps (they only record in published games) (see [[Analytics Custom Events, Funnels and Dashboards Setup]]).
- Add a lightweight **session recorder**: server-side timestamps of key actions for the test cohort (flag test users by UserId), written to a debug DataStore or printed to the server log, so unmoderated sessions can be compared with moderated ones.
- Turn on the **in-game feedback prompt** after the session's key moment (`SocialService:PromptFeedbackSubmissionAsync`, published games only).

---

## 6. Synthesis in 60 minutes

1. **Dump** every observation onto cards (one issue per card).
2. **Cluster** similar cards (affinity mapping): "can't find shop", "upgrade unclear".
3. For each cluster: **how many of 5 participants** hit it and the **max severity**.
4. Priority = frequency × severity. Fix 3s and 4s seen by 2+ people **before** the next round.
5. Write **one sentence per finding** with evidence: "4/5 players didn't find the upgrade button within 60 s (sev 3), so move it next to the coin counter."
6. Re-test the fix with 3–5 **new** participants.

Feed recurring findings into the onboarding funnel definition. If players consistently struggle at "first upgrade", that should be a funnel step you watch in live analytics too.

---

## 7. Remote and multi-device tips
- Ask testers to play on **their usual device**. A phone tester finds problems a PC tester never will.
- For remote moderated sessions, use screen sharing only where appropriate for the tester's age and with consent; otherwise rely on in-game observation (join their server) and event logs.
- Run at least one round per platform group: phone, PC, console if supported.

---

## Common mistakes
- Testing with teammates or friends who already know the game.
- Helping during the test, which hides the very problem you're looking for.
- Asking "Do you like it?" (everyone says yes) instead of observing behaviour.
- One huge round of 30 people and no re-test after fixes.
- Treating opinions ("add guns!") as findings; record the underlying problem instead.
- Recording minors' voices or faces without proper consent, or collecting personal data.
- Running the test build in Studio and wondering why analytics show nothing.

## Checklist
- [ ] Goal and type chosen; 5 fresh participants per round
- [ ] Testers invited within Roblox's age rules; safety rules briefed to staff
- [ ] Script printed; facilitator rehearsed neutral prompts
- [ ] Observation sheet with timestamps and severity
- [ ] Test place published with custom events and funnel steps
- [ ] Synthesis done within 24 h; top findings have evidence and a fix
- [ ] Fixes re-tested with new participants

---

**Sources checked (2026-10-25):** Creator Docs: Publishing › Publish games and places (Invite early testers, Target audience › Playtest); Monetization (paid access as closed beta); Studio › Testing modes (Team Test); Discovery (first play bounce windows); Analytics › Event types (published games only); Engine API: SocialService.PromptFeedbackSubmissionAsync. The usability severity scale and five-user guideline are general UX-research conventions, not Roblox rules.

**Related:** [[Testing - Hub]] · [[Testing and QA]] · [[First 10 Minutes Retention Design]] · [[Tutorial, Onboarding and FTUE]] · [[Analytics Onboarding Lab]] · [[Core Loop and Session Design for D1 and D7 Retention]]
