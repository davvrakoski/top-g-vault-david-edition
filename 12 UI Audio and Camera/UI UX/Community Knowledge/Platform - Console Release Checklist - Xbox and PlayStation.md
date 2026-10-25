---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Console Release Checklist - Xbox and PlayStation"
tags: [roblox, community-knowledge, ui, platform, console, xbox, playstation, checklist]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/studio/experience-settings
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://create.roblox.com/docs/production/monetization/paid-access-robux
  - https://create.roblox.com/docs/production/publishing/thumbnails
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/chat/quick-words
  - https://create.roblox.com/docs/reference/engine/enums/GamepadType
---
# Platform - Console Release Checklist - Xbox and PlayStation

This is not an official certification list. Roblox publishes console development guidelines, and a few platform rules in other docs act as hard gates. A game that ignores them may be hard to use on a TV, may be filtered out for missing maturity information, or may simply not be offered on a console. This is the list to walk through before you tick the console box. The "why" behind 10-foot UI is in [[Gamepad and Console Design]]; this note is the release gate.

## A. Settings and policy (hard requirements)
- [ ] **Playable Devices:** in Studio **File > Experience Settings > Basic Info**, the *Playable Devices* row enables each device type your game supports. Console must be ticked.
- [ ] **Content maturity:** the console guidelines say console games must always provide content maturity information "to ensure smooth releases and minimize the risk of being removed from consoles". Fill in the Maturity & Compliance Questionnaire, and retake it when updates change the answers (the maturity docs say you must).
- [ ] **No paid access on Xbox:** the paid access docs state games with paid access are not available on Xbox. If you charge Robux for entry, Xbox players cannot reach the game at all.
- [ ] **Thumbnails:** Xbox, PlayStation and VR do not support video thumbnails (Thumbnails docs). Make sure your still images sell the game on their own.

## B. Input
- [ ] Every action has a gamepad binding; nothing requires a keyboard or mouse.
- [ ] Every interactive UI element is reachable with **four directions, select and back** (guideline wording).
- [ ] Key actions take only a few button presses; add shortcuts (bumpers for tabs, a button for the shop).
- [ ] Glyphs match the device: Xbox letters vs PlayStation shapes. On consoles the `GamepadType` is fixed to the native pad, so `GetImageForKeyCode` and `InputActionLabel` pick the right art. See [[Platform - Button Glyphs and Prompts - InputActionLabel, PreferredBinding and GetImageForKeyCode]].
- [ ] `ButtonStart` is left to the Roblox menu (reserved).
- [ ] Text entry is optional. Console players often have no keyboard: offer pickers, presets and default names. For player communication, custom **Quick Words** (Creator Hub > Configure > Chat > Quick Words, up to three categories of three to ten phrases) give pad players safe chat without typing.

## C. Screen
- [ ] UI designed at a low resolution first, scaled with relative sizes and `UISizeConstraint`.
- [ ] Layout checked at `GuiService.ViewportDisplaySize == Large` (most TVs).
- [ ] Nothing important in the outer TV-unsafe band; some TVs crop edges.
- [ ] Text readable from about 8 to 10 feet (2.5 to 3 m), the distance the guidelines assume.
- [ ] Long lists live in ScrollingFrames instead of shrinking text to fit.
- [ ] **Chat window disabled** for console: the guidelines say to do this regardless of how you customise chat.

## D. Feel
- [ ] Haptics for big moments (explosions, collisions, alerts) and small UI ticks, used sparingly; the docs warn constant vibration annoys players. See [[Platform - Haptics Recipes - HapticEffect Types, Custom Waveforms and Cleanup]].
- [ ] Sound feedback on focus moves and confirms (guideline recommendation).
- [ ] Progressive disclosure: secondary options on a second screen rather than one dense desktop-style panel.

## E. Performance and rollout awareness
- [ ] Profile on a real console if you can; at minimum on a mid-range PC at 1080p with the TV-size emulator profile.
- [ ] Watch the Performance Dashboard by platform after release. Its "Roblox update" annotations note that **Xbox** gets engine updates immediately (with Windows and macOS), while **PlayStation** (with iOS, Android stores and Meta Quest) rolls out gradually. A crash that appears on Xbox the day of an update and on PlayStation days later is likely an engine change, not your code.

## F. Final run (30 minutes with a controller only)
1. Join, finish the tutorial, open every menu, buy something, change settings, leave and rejoin, without touching a keyboard.
2. Repeat with the Device Emulator at a TV profile and the Controller Emulator set to a PlayStation pad.
3. Unplug and reconnect the controller mid-menu.
4. Turn on the largest text size in Roblox settings and repeat one menu.

## Related
[[UI UX - Hub]] · [[Gamepad and Console Design]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds]]
