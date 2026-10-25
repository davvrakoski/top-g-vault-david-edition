---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Testing on Real Devices - Baseline Phones, Consoles and Quest"
tags: [roblox, community-knowledge, ui, platform, testing, qa, mobile, console, vr]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://create.roblox.com/docs/studio/experience-settings
---
# Platform - Testing on Real Devices - Baseline Phones, Consoles and Quest

Studio's Device Emulator and Controller Emulator catch layout and binding mistakes fast (see [[Device, Network and Controller Simulation Test Pass]]). They cannot show you memory pressure, thermal throttling, touch latency, a TV's cropped edges or how your sound mix holds up on a phone speaker. Roblox's own guide puts it bluntly: if you only test on your development machine, "you're testing for the minority of your audience". This note is a practical device lab plan for small teams.

## Pick a baseline device first
The docs recommend choosing at least one low-end **baseline** device that matches your target players, testing on it throughout development, and learning its limits (for example noting the draw-call and triangle counts where its FPS drops, or that memory is high unless streaming is on).

Device landscape (Test on hardware, checked 2026-10-25): Android is about 65% of a typical game's players, about 60% of those have 2 to 4 GB RAM, and over half of all players use devices scoring 10,000 to 20,000 on Passmark. The docs' example spread of Android test devices: **Infinix Smart 9, Motorola Moto G05, Oppo A18, Amazon Fire HD 10 (2023), Samsung Galaxy S22 Ultra** (several manufacturers, several performance levels).

## A lab that fits a small budget

| Slot | What | Why |
|---|---|---|
| 1 | Cheap 2 to 4 GB Android phone | Memory and FPS baseline for most players |
| 2 | Any recent iPhone or mid Android | Notch/safe area, haptics, "typical" phone |
| 3 | Tablet (Fire HD class) | Large-screen touch layout, reach, low GPU |
| 4 | A controller for your PC and phone | Gamepad paths, hybrid input switching |
| 5 | Console (Xbox or PlayStation) if targeting TV | 10-foot UI, TV crop, glyphs |
| 6 | Quest if targeting VR | Comfort, 72 FPS target (VR guidelines say invest in one if possible) |

Multi-input shortcuts from the docs: a handheld with a touchscreen and built-in pad tests touch and gamepad on one device; phones with USB-C gamepad adapters or touch laptops do the same. Windows handhelds (the docs mention ROG Xbox Ally) are great for input and UX testing but much faster than a mid-range phone, so they are poor performance baselines.

## What to check on hardware (from the docs, condensed)
**Performance**
- Profile on device: F9 console (Memory tab), MicroProfiler with Ctrl+Alt+F6 to capture frame dumps, Performance Stats overlay from settings.
- Thermal: 10 to 15 minutes of active play; a steady FPS decline means throttling.
- Network: real cellular or weak Wi-Fi after Studio network simulation.
- Load: time join-to-gameplay on the baseline device; consider streaming if it is more than a few seconds.

**User experience**
- Touch targets and gestures on a real 5-inch screen; reach zones for sticks and buttons.
- Text and icons legible at arm's length on the lowest-resolution device.
- Input switching mid-session (connect a Bluetooth pad to a tablet) updates hints.
- Audio on phone speaker and headphones; phone speakers lose low frequencies.
- Streaming pop-in during normal movement.

## Getting a build onto each device
- Phones/tablets/PC: publish (a private or friends-only test place keeps it hidden) and join from the Roblox app.
- Consoles: the game appears only for device types enabled in **Experience Settings > Basic Info > Playable Devices**; enable console on the test place. Remember the maturity questionnaire requirement for console releases.
- Quest: same Playable Devices setting for VR.

## After release
The **Performance Dashboard** tracks client frame rate, memory and crash rate by device over time, with markers for Roblox updates. A crash uptick right after your update usually means a memory regression on low-end devices (hardware guide). Keep your baseline phone and re-run the same route for every release.

## Minimal release routine (60 minutes)
1. Baseline phone: heavy area 15 min, note FPS at 1/5/10/15 min and peak memory.
2. Tablet: all menus, purchase flow, orientation if supported.
3. Controller on PC: whole loop without mouse.
4. Console (if enabled): menus and first 10 minutes from the couch.
5. Log results next to the place version.

## Related
[[UI UX - Hub]] · [[Device, Network and Controller Simulation Test Pass]] · [[Platform - Memory Limits on Low-End Phones - Budgets and Crash Avoidance]] · [[Release Regression Check - Performance Dashboard by Place Version]]
