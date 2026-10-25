---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events"
tags: [roblox, community-knowledge, testing, qa, analytics, analyticsservice]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/event-types
  - https://create.roblox.com/docs/production/analytics/custom-events
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://create.roblox.com/docs/production/analytics/economy-events
  - https://create.roblox.com/docs/reference/engine/classes/AnalyticsService
---
# QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events

Analytics bugs are invisible until someone makes a wrong decision from a wrong chart: an onboarding funnel that "loses 60% at step 3" because step 3 never fires on mobile, or an economy chart where coins appear from nowhere because a source event was logged twice. `AnalyticsService` events need the same QA as gameplay, with one extra difficulty: they **cannot be sent from Studio or from the client**, only from the server of a published game.

## Know the limits before testing

From the Creator Docs event-types page (values as of Oct 2026):

| Limit | Value |
|---|---|
| Global rate | 120 + (20 x CCU) AnalyticsService requests per minute |
| Custom event names | 100 |
| Funnels | 10, up to 100 steps each |
| Economy resource types | 10 |
| Custom fields per event | 3 (values past 8,000 combined grouped as "Other") |

Most "missing data" bugs are cardinality bugs: a new event name per weapon or per quest blows the 100-name budget. Use one event name plus custom fields instead.

## Make events testable

1. **One wrapper module** for all analytics calls. It logs every call to the output with a prefix (`[ANALYTICS] MissionStarted p=123 v=1`) when a debug flag is on, then forwards to `AnalyticsService`.
2. In Studio, the wrapper only prints (calls would be ignored anyway). This lets you unit-test that the right events fire in the right order.
3. Keep an **event catalogue** (a table in the module): name, type, when it fires, expected fields. Code review rejects events not in the catalogue.

## Test pass on a published test place

1. Publish to a test universe (see [[Test Places, Staging Universes and Places in a Universe]]).
2. Play the scripted route: new player onboarding, one shop visit, one purchase with test currency, one level-up.
3. Open the Creator Hub Analytics page for that game (Economy, Funnel or Custom) and click **View Events**: the docs describe it as a near real-time list of recent events. Refresh after each step.
4. Tick each catalogue entry as seen. Full charts take about 24 hours to aggregate; the event list does not.
5. Check the game's **Error Report** for analytics call errors.

## What to check

- [ ] Onboarding steps are numbered 1..N with no gaps and fire **once** per player (`LogOnboardingFunnelStepEvent`).
- [ ] Recurring funnels (shop) use a fresh `funnelSessionId` per attempt; reopening the shop starts a new session.
- [ ] Economy events fire **after** the operation succeeds (docs warning), never on a failed purchase.
- [ ] Every currency source has a matching sink logic: earn and spend totals roughly reconcile with balances.
- [ ] Mobile and console paths fire the same events as desktop (touch-only UI often bypasses the button handler that logged).
- [ ] Rejoin does not double-fire one-time steps.
- [ ] Event volume stays under the rate limit in a full server: count calls per minute in the debug log during a 20-player load test.

## Regression guard

Add an automated test that runs the onboarding flow against the wrapper in print-only mode and asserts the exact event sequence. A refactor that drops a step then fails CI instead of silently breaking a dashboard.

## Related
[[Testing - Hub]] · [[QA Test Plan Template for Roblox Experiences]] · [[Test Places, Staging Universes and Places in a Universe]] · [[Load Testing Roblox Servers - Simulated Players and Bots]]
