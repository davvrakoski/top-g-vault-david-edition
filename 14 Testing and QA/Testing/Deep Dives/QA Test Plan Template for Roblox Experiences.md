---
area: "14 Testing and QA"
cluster: "Testing"
tags: [deep-dive, roblox, qa, test-plan, regression, template]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# QA Test Plan Template for Roblox Experiences

## Why this matters
Roblox games ship weekly to phones, PCs, consoles and VR at once, with live purchases and persistent data. The bugs that hurt most (lost saves, unfulfilled purchases, mobile-only soft-locks, exploits) rarely show up in a solo Studio playtest on a gaming PC.
A test plan doesn't have to be bureaucratic. It's a reusable list of *what could hurt players most* and *how we prove it doesn't*, sized so a small team can run it every release.

---

## 1. Plan header (fill in per release)

```
Game / place(s):            Version / place version:
Release type:  [ ] Hotfix  [ ] Cadence drop  [ ] Event  [ ] Major
Owner:                      Test window:            Release target:
Changed systems:            (link to changelog / PRs)
Risk areas (top 3):
Platforms in scope:  PC  Mac  iOS  Android  Xbox  PlayStation  Quest
Exit criteria:       0 open Blockers, 0 open Criticals, smoke pass on all in-scope platforms
```

---

## 2. Risk-based scope: test what can hurt most

Score each changed area **Impact × Likelihood** (1–3 each); test 6–9 first and deepest.

| Area | Typical impact if broken | Why it's likely to break on Roblox |
|---|---|---|
| Player data (saves) | Lost progress → refunds, reviews, quitting | Leave/teleport/shutdown timing, session locking, schema changes |
| Purchases | Paid but not granted → support load, trust loss | Receipt handling on rejoin, price changes, Listed external sales |
| Onboarding | Bounce → discovery signals drop | New content changes spawn, UI and early pacing |
| Mobile controls/UI | Large audience share locked out | Safe areas, thumb zones, touch-only flows |
| Gamepad navigation | Console players stuck | Selection lost on hidden UI |
| Streaming | Nil references → script errors | `StreamingEnabled` default on; parts not present on the client |
| Remotes / anti-exploit | Economy damage | New remotes without server validation |
| Performance | Crashes on low memory devices | New assets, VFX, sounds |
| Localization | Clipped or untranslated text | New strings, long languages |
| Policy compliance | Regional or age issues | Paid random items, ads, trading, subscriptions |

---

## 3. Test types and where to run them

| Type | Purpose | Where (Studio tooling per Creator Docs › Testing modes) |
|---|---|---|
| **Smoke** | Game boots, core loop works, can buy, can save | Studio **Test** (client + server simulations) |
| **Functional** | Each changed feature behaves as specified | Test / **Test Here** |
| **Multiplayer** | Replication, trading, parties, round flow | **Server & Clients** (up to 8 clients), **Party Simulator** |
| **Collaborative** | Real people on real network | **Team Test** (one session at a time) |
| **Device** | Layout, input, performance per form factor | **Device Simulator** + **Controller Emulator**, then real devices |
| **Network** | Latency, jitter, loss | **Network Simulator** presets (Home Wi-Fi, 4G, 3G) |
| **Localization / policy** | Strings, regional rules | **Player Emulator**: Locale, Pseudolocalize, Elongate, Region |
| **Published-only** | Analytics, feedback prompt, purchases, ads, notifications | A private **test place/universe** or the live game with **Playtest** audience settings |
| **Regression** | Old bugs stay fixed | Checklist below plus automated smoke where possible |

See [[Device, Network and Controller Simulation Test Pass]] for the simulator workflow and scripted tests.

> **Published-only features:** AnalyticsService events, `PromptFeedbackSubmissionAsync`, real purchases and experience notifications don't work (or don't record) in Studio. Plan time to test them in a published environment.

---

## 4. Test case format

| Field | Example |
|---|---|
| ID | `DATA-004` |
| Area | Player data |
| Priority | P0 (blocker if fails) |
| Preconditions | Player with 1,000 coins, level 5; server with 2 players |
| Steps | 1) Buy upgrade for 500 coins. 2) Immediately leave the game. 3) Rejoin a different server |
| Expected | Coins = 500, upgrade owned, no duplicate grant |
| Platforms | Any |
| Automation | Partial (server script asserts) |
| Last result / build | Pass / place v214 |

Write cases as **player actions and observable results**, not code paths.

---

## 5. Roblox-specific regression suite (copy and keep updated)

### Player data
- [ ] Progress saves on normal leave, rejoin restores it
- [ ] Progress saves when **teleporting** between places
- [ ] Progress saves on **server shutdown** (`game:BindToClose` path; test with "Shut down all servers" on a test place)
- [ ] Two servers can't write the same profile at once (session lock): join server A, then join server B quickly
- [ ] New data fields migrate old profiles without wiping them
- [ ] Data store throttling or failure shows a safe message and doesn't overwrite good data

### Purchases
- [ ] Each developer product grants exactly once, including when the player **leaves before the grant** and rejoins
- [ ] Duplicate receipt delivery doesn't double-grant
- [ ] Passes grant on join and on purchase
- [ ] Price labels match the purchase prompt (Dynamic Price Check tool)
- [ ] Subscription status refreshes when bought from the game page mid-session
- [ ] Restricted-policy players can't buy paid random items; trading rules enforced

### Onboarding and core loop
- [ ] New account: control within seconds, first reward in under a minute, no blocking popups
- [ ] Onboarding funnel steps fire once each (check View Events after publish)

### Input and UI
- [ ] Touch: all actions reachable; nothing under the notch or in the joystick/jump zones
- [ ] Gamepad: every screen navigable with D-pad + A/B; selection never lost
- [ ] Keyboard/mouse: shortcuts work; mouse unlocks when the Roblox menu opens
- [ ] Text: Elongate 30–50% shows no clipping; Pseudolocalize shows no untranslated strings

### Streaming and performance
- [ ] Teleport into a far zone: no `nil` errors in Output (client and server)
- [ ] Busiest zone on an entry-level phone profile: no memory warnings; frame rate acceptable
- [ ] No new errors in Error Report after a test publish

### Security
- [ ] Every new RemoteEvent/RemoteFunction validates type, range, rate and ownership on the server
- [ ] Client can't grant currency, items or XP directly
- [ ] Analytics steps reported by the client are validated

### Compliance
- [ ] Odds shown for paid random items (sum to 100%)
- [ ] Ads hidden or fallback for ineligible users; rewarded video rules followed
- [ ] No off-platform links in game UI
- [ ] Maturity questionnaire still accurate after this update

---

## 6. Entry and exit criteria

**Entry (start testing when):** build published to the test place; changelog written; test data and accounts ready; known issues listed.

**Exit (ship when):**
- 0 open **Blocker** and **Critical** bugs (definitions in [[Bug Triage, Severity and Regression Workflow]])
- Smoke suite passed on every in-scope platform group (at least one phone, one PC; console if supported)
- P0 regression cases passed
- Rollback plan written (previous place version, Config kill switches)
- Release runbook signed off ([[Release Readiness Runbook 2026]])

---

## 7. Test environments and data

- **Separate test universe** (or at least a private test place) with the same DataStore *keys schema* but **not** production data. Use Configs' **Publish As** to copy config values from staging to live when ready.
- Seed test profiles with known states (new player, mid-game, maxed, payer) using a server-only debug command restricted to team UserIds. Strip or guard debug commands before release.
- Keep a **test account roster** for the team (who has which device, which state), using your team's own accounts and Roblox's Playtest access settings.

---

## 8. Reporting
End each test cycle with a one-screen summary:

| Metric | Value |
|---|---|
| Cases run / passed / failed / blocked | |
| New bugs by severity | |
| Platforms covered | |
| Top risks remaining | |
| Recommendation | Ship / Ship with known issues / Don't ship |

---

## Common mistakes
- Testing only in solo Studio Test on a PC.
- No test of leaving mid-purchase or mid-save.
- Testing purchases and analytics in Studio and concluding they work (or don't).
- Writing cases like "check shop works" (not reproducible).
- No regression list, so old bugs return.
- Using production data for destructive tests.
- Leaving debug commands enabled for everyone.
- Shipping with a "Critical" because "it's rare".

## Checklist
- [ ] Plan header filled; changed systems listed
- [ ] Risk scores done; top areas get deepest coverage
- [ ] Smoke + P0 regression run on phone, PC and (if supported) console
- [ ] Multiplayer, network and device passes for changed areas
- [ ] Published-only features verified in a test universe
- [ ] Exit criteria met and signed off
- [ ] Summary posted; known issues documented

---

**Sources checked (2026-10-25):** Creator Docs: Studio › Testing modes (playtesting, multi-client, Party Simulator, Team Test, Player Emulator, scripted testing); Studio › Device Simulator; Network Simulator; Controller Emulator; Production › Configs (Publish As); Analytics › Event types (server-only, published games); Engine API: SocialService.PromptFeedbackSubmissionAsync (not in Studio).

**Related:** [[Testing - Hub]] · [[Full Test Matrix]] · [[Pre-Release Gate]] · [[Definition of Done]] · [[Testing and QA Operating System]] · [[Bug Report Template]]
