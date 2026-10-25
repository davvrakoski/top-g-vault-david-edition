---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Per-Platform Differences Developers Trip Over"
tags: [roblox, community-knowledge, ui, platform, console, mobile, vr, reference]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/paid-access-robux
  - https://create.roblox.com/docs/production/publishing/thumbnails
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/production/publishing/console-guidelines
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/reference/engine/classes/UserInputService
  - https://create.roblox.com/docs/reference/engine/classes/HapticEffect
  - https://create.roblox.com/docs/input/input-action-system
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
---
# Platform - Per-Platform Differences Developers Trip Over

Roblox's promise is "build once, run everywhere", and mostly it holds. But a handful of platform-specific rules and behaviours are scattered across different doc pages, and each one has burned someone: a paid-access game that vanished from Xbox, a video trailer nobody on PlayStation saw, glyph code that returns nothing on Android. This is the cheat sheet, all checked against the Creator Docs on 2026-10-25.

## Store and discovery

| Difference | Platforms | Doc |
|---|---|---|
| Games with **paid access** (Robux entry fee) are **not available** | Xbox | Paid access |
| **Video thumbnails** are not supported (stills only) | Xbox, PlayStation, VR headsets | Thumbnails |
| Game must be enabled per device type (**Playable Devices**) | all, set in Experience Settings > Basic Info | Experience settings |
| Content maturity information required to avoid removal risk | consoles (and playability everywhere) | Console guidelines, Content maturity |

## Engine updates arrive at different times
The Performance Dashboard's update annotations: **Windows, macOS and Xbox** get a Roblox version immediately; **iOS, Google Play, Amazon, Samsung, PlayStation and Meta Quest** roll out gradually. When a bug appears on one platform group first, check the dashboard markers before blaming your own release.

## Input and UI

| Difference | Detail |
|---|---|
| Chat window | Disable for console games (console guidelines) |
| Reserved keys | Desktop: Esc menu, F9 console, F11 fullscreen (Windows) / show desktop (Mac), F12 record video (Windows), PrintScreen. Gamepad: Start opens the Roblox menu (Input Action System docs) |
| `GetImageForKeyCode` | Images only for Xbox, PlayStation and Windows gamepads; plan text fallbacks elsewhere |
| `GetStringForKeyCode` on gamepads | PlayStation names (`ButtonCross`, `ButtonOptions`, `ButtonTouchpad`/`ButtonShare`) vs Xbox (`ButtonA`, `ButtonStart`, `ButtonSelect`) |
| `GamepadType` | Fixed to the native pad on consoles; follows the last connected pad elsewhere |
| `TouchEnabled` | Can be false on some touch-capable Windows hardware; `TouchScreenEnabled` reports true capability (UserInputService docs). Pick UI from `PreferredInput` |
| `ViewportDisplaySize` | `Large` for most TVs; `Small` for phones, tablets and handhelds |
| TV remotes | Currently arrive as legacy gamepad codes; `PreferredInput.MicroGamepad` not set yet |
| Screen orientation | Only phones/tablets; desktop and console ignore it |

## Performance

| Difference | Detail |
|---|---|
| Client FPS cap | 60 by default; Windows players can raise it to 240 |
| VR on Quest | Auto Quality Mode aims for at least 72 FPS, may shrink draw distance and disable lighting work |
| Memory | Low-end phones crash on OOM; the Studio emulator does not represent device memory |
| Thermal throttling | Phones, tablets and thin laptops slow down after sustained load |

## Haptics support
`HapticEffect` works on haptic-capable Android and iOS phones (most iPhone, Pixel and Samsung Galaxy), PlayStation and Xbox pads, and Quest Touch controllers. Some pads lack separate small/large motors, and "gamepad large left/right" is not supported on PC.

## VR-specific
- OpenXR backend: Quest and PC VR behave the same; PC VR needs a GTX 1060-class GPU or better for Oculus drivers.
- Custom camera scripts opt out of Roblox's VR camera improvements.
- Keyboard-only actions are unusable; the guidelines recommend `InputAction` bindings.

## How to use this note
Add a "platform differences" row to your release checklist and walk this table whenever you add monetisation, a trailer, a new input, or a big visual effect.

## Related
[[UI UX - Hub]] · [[Platform - Console Release Checklist - Xbox and PlayStation]] · [[Platform - Cross-Platform Parity Checklist]] · [[Roblox 2026 Platform Snapshot]]
