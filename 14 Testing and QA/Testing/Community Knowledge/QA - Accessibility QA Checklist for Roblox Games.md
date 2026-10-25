---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - Accessibility QA Checklist for Roblox Games"
tags: [roblox, community-knowledge, testing, qa, accessibility, ui]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/accessibility
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://www.w3.org/TR/WCAG22/
---
# QA - Accessibility QA Checklist for Roblox Games

Roblox's accessibility guide cites that over a quarter of people have some disability, and many more play on small phones, in noisy rooms or with the sound off. Accessibility bugs are rarely reported because affected players just leave. A short, repeatable checklist run before each release catches most of them, and Roblox now exposes player preferences that your UI is expected to respect.

## Player preferences to honour (GuiService)

| Property | Player setting | What to check |
|---|---|---|
| `GuiService.PreferredTransparency` | Background Transparency | Panels become more opaque when it is lower. The docs pattern: multiply each `BackgroundTransparency` by this value |
| `GuiService.PreferredTextSize` | Text size | Custom UI grows text when the player asks; nothing clips or overlaps |
| `GuiService.ReducedMotionEnabled` | Reduce motion | Screen shake, camera bob, big tweens and flashing are reduced or off |

Test: change each setting in the Roblox in-game menu during a live test session and confirm UI updates without rejoining (listen with `GetPropertyChangedSignal`).

## Checklist

**Text and reading**
- [ ] Smallest in-game text is readable on a phone at arm's length (Device Simulator, smallest phone).
- [ ] Body text contrast at least 4.5:1, large text 3:1 (WCAG AA). Check light text on sky backgrounds and dark text in night maps.
- [ ] Text has a stroke or backing panel where it sits over the 3D world.
- [ ] No important info only in long paragraphs; key words are bold or iconed.

**Colour**
- [ ] View screenshots in greyscale: teams, rarity, health and danger still distinguishable by shape, icon or label.
- [ ] Red/green is never the only difference (team outlines, buy/cancel buttons, minimap dots).

**Sound**
- [ ] Every gameplay-critical sound (enemy behind you, timer ending, phone ringing) has a visual cue.
- [ ] Separate volume sliders for music, effects, voice; master mute works.
- [ ] No sudden loud sounds on join or on menu open.

**Motion and flashing**
- [ ] Nothing flashes more than 3 times per second (photosensitivity guidance).
- [ ] Reduced motion setting tones down shake, sway, FOV punch.

**Input and controls**
- [ ] Every action is reachable on touch, gamepad and keyboard; no hold-only or rapid-tap-only actions without an alternative toggle.
- [ ] Touch buttons at least about 44x44 px at the smallest supported phone size and not overlapping the jump button.
- [ ] Gamepad: UI navigable with `GuiService.SelectedObject`, a visible selection state on every button.
- [ ] Rebinding or at least alternate keys for common actions.

**Cognitive load**
- [ ] Objective always visible or one tap away.
- [ ] Timers can be paused in single-player or are generous; tutorials can be replayed.

## How to run it

- One tester, 30 minutes, each release candidate. Use the Device Simulator for phone sizes and the Player Emulator for language length (see [[Player Emulator QA - Pseudolocalization, Text Elongation and Region]]).
- Log failures with the bug template and tag `a11y` so they are visible in triage.
- Re-test any changed UI screen; accessibility regressions mostly come from new menus.

## Related
[[Testing - Hub]] · [[Player Emulator QA - Pseudolocalization, Text Elongation and Region]] · [[Bug Triage, Severity and Regression Workflow]] · [[Pre-Release Gate]]
