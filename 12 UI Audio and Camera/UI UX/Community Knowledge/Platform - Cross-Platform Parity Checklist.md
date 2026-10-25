---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Cross-Platform Parity Checklist"
tags: [roblox, community-knowledge, ui, platform, checklist, cross-platform, qa]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/cross-platform
  - https://create.roblox.com/docs/production/publishing/adaptive-design
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/production/publishing/accessibility
---
# Platform - Cross-Platform Parity Checklist

"Parity" does not mean every device gets identical UI. It means every player can do **everything** in the game, at a similar effort, with the hardware in their hands. Roblox's cross-platform guide and adaptive design guidelines boil down to four principles (input fluidity, responsive layout, dynamic sizing, legibility); this checklist turns them, plus the console, VR and hardware-testing guides, into yes/no checks for a release. Each line links to the vault note with the how-to.

## 1. Every action, every input
- [ ] Each gameplay action has keyboard/mouse, gamepad and touch bindings (Input Action Manager shows no yellow "missing binding" warnings). [[Platform - Input Action Bindings Deep Dive - Thresholds, Modifiers, ResponseCurve and Scriptable]]
- [ ] VR players can do every action with Touch controllers. [[Platform - VR Support Basics - VRService, UserCFrame and HeadScale]]
- [ ] No feature requires hover, right-click, scroll wheel or typing without an alternative. [[Platform - On-Screen Keyboards and Text Input on Phones, Consoles and VR]]
- [ ] Gestures (pinch, swipe) have button/bumper alternatives. [[Platform - Touch Gestures - Pinch, Pan, Swipe, Long Press and Tap-in-World]]
- [ ] TV remote can at least use menus and the shop. [[Platform - TV Remotes and Micro Gamepads - Android TV]]

## 2. UI follows the player's device
- [ ] HUD mode driven by `PreferredInput` and updates live when a pad connects or disconnects. [[Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices]]
- [ ] Prompts show the right glyph or no glyph (touch); no hard-coded "Press E". [[Platform - Button Glyphs and Prompts - InputActionLabel, PreferredBinding and GetImageForKeyCode]]
- [ ] Every menu reachable with four directions + select + back, opens with focus set and remembers it. [[Platform - Gamepad Menu Recipes - Custom Highlights, Focus Memory and Navigation Sounds]]
- [ ] Back always works and never triggers gameplay. [[Platform - Input Action System Contexts - Priority, Sink and Mode Switching]]

## 3. Screens of every size
- [ ] Layout checked for Small (phone, tablet), Medium, Large (TV) display sizes. [[Platform - Screen Size Classes - ViewportDisplaySize, Breakpoints and UIScale]]
- [ ] Nothing interactive under notches, the top bar or TV-unsafe edges. [[Safe Areas, Thumb Zones and Console UI Navigation]]
- [ ] Touch targets at least 44-48 units; primary actions in thumb reach. [[Platform - Touch Target Sizes and Mobile-First HUD Layout]]
- [ ] Portrait handled or orientation locked deliberately. [[Platform - Screen Orientation and Portrait Mode on Phones]]
- [ ] Text readable on the smallest phone at arm's length and on a TV from the couch; Largest text size setting does not break layouts. [[Platform - Text Legibility on Phones and TVs - Sizes, Contrast and PreferredTextSize]]

## 4. Same game, fair game
- [ ] Movement, camera, cooldowns identical at 30, 60 and 240 FPS. [[Platform - Frame Rate Caps and Frame-Rate-Independent Code]]
- [ ] Aim assist or equivalent if PvP mixes mouse and pad/touch players (or matchmaking by input, if your genre needs it).
- [ ] Optional cosmetic effects may differ by device; gameplay-critical visuals never do. [[Platform - Adaptive Quality Governor Driven by Frame Time]]

## 5. Runs on what players own
- [ ] Heavy area holds target FPS on the baseline 2-4 GB phone for 15 minutes (no thermal collapse). [[Platform - Battery and Thermal Throttling on Phones]]
- [ ] Client memory stays under your measured soft limit. [[Platform - Memory Limits on Low-End Phones - Budgets and Crash Avoidance]]
- [ ] Join-to-play time acceptable on the baseline device; streaming considered.
- [ ] Quest holds about 72 FPS if VR is enabled. [[Platform - VR Comfort and Performance on Meta Quest]]

## 6. Feel and feedback
- [ ] Haptics on supported devices, toggleable, always paired with sound/visual. [[Platform - Haptics Recipes - HapticEffect Types, Custom Waveforms and Cleanup]]
- [ ] Sound feedback for console menu navigation.
- [ ] Reduced motion and preferred transparency respected.
- [ ] VR: no forced camera motion; comfort settings honoured.

## 7. Store and policy
- [ ] Playable Devices set for every supported platform; maturity questionnaire current. [[Platform - Console Release Checklist - Xbox and PlayStation]]
- [ ] Paid access, video thumbnails and other per-platform limits checked. [[Platform - Per-Platform Differences Developers Trip Over]]

## 8. Proof
- [ ] Emulator pass done. [[Device, Network and Controller Simulation Test Pass]]
- [ ] Real-device pass done on baseline phone, tablet, controller, and console/Quest if targeted. [[Platform - Testing on Real Devices - Baseline Phones, Consoles and Quest]]
- [ ] Performance Dashboard and per-platform retention reviewed after release. [[Platform - Roblox Device Share Stats and What They Mean for Design (dated)]]

Tip from the docs: Roblox's **Interactivity Showcase** place (linked from the cross-platform and adaptive design guides) demonstrates these patterns in a playable game; play it on a phone and with a pad before designing your own.

## Related
[[UI UX - Hub]] · [[Cross-Platform UI Lab]] · [[Cross-Platform UI System]] · [[Polish Checklist]]
