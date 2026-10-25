---
area: "14 Testing and QA"
cluster: "Testing"
title: "VR Test Pass - Emulation, Headsets and Quest Builds"
tags: [roblox, community-knowledge, testing, vr, quest, devices]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/reference/engine/classes/VRService
  - https://create.roblox.com/docs/reference/engine/classes/HapticEffect
  - https://www.khronos.org/openxr/
---
# VR Test Pass - Emulation, Headsets and Quest Builds

VR players are a small share of Roblox but a loyal one, and VR bugs are severe: a broken camera or menu can make the game unplayable or cause motion sickness. You can do most VR checks without a headset using Studio's emulation, then finish on real hardware. This note is the pass, in the order that saves the most time.

## Level 1: emulation (no headset)
From the testing-modes docs:
- In **Device Simulator** pick a headset device such as Meta Quest 2 or Quest 3; **Controller Emulator** picks the matching controllers.
- **Alt+1** locks / unlocks the mouse to the viewport for motion tracking emulation.
- **Shift+Left / Shift+Right** switches what you are moving: headset, left controller, right controller, or combinations.

Use emulation for:
- [ ] UI reachable and readable in VR (ScreenGuis appear on a panel; check nothing critical depends on hover).
- [ ] Every action bound for VR controllers (no "press E" with no alternative).
- [ ] `VRService.VREnabled` branches run (VR-only UI, comfort settings appear).
- [ ] Camera scripts do not fight the headset (custom cameras that set `Camera.CFrame` every frame are the top VR bug).

## Level 2: PC headset in Studio
- Studio VR testing currently works **on Windows only**, with any OpenXR-compatible headset.
- Connect the headset and set the OpenXR runtime **before** launching Studio (SteamVR: Settings > Developer > set as OpenXR runtime; Oculus app: Settings > General > OpenXR Runtime). With more than one headset installed, configure only the one you are testing.
- Studio Settings > Rendering > **Enable VR Mode**, then playtest normally.
- If the cable disconnects or the headset app closes, restart Studio to test again.

Checks:
- [ ] Scale: doorways, tables and cars feel the right size (Roblox's VR assumes standard units; custom unit choices break VR, per the units docs' advice).
- [ ] Comfort: no forced camera rotation, no camera shake, smooth or snap turning offered, vignette option for fast movement (vehicles!).
- [ ] Hands: tools and weapons line up with controllers.
- [ ] Haptics play on Quest Touch controllers where intended and stop afterwards.
- [ ] Frame rate stays steady; dropped frames are far more noticeable in VR.

## Level 3: standalone Quest
Publish, favourite the game on the website, then open the standalone Roblox app on the headset and launch it from **Favorites**. This is the real performance target: a mobile-class chip running at headset resolution.
- [ ] Memory and frame rate in the Developer Console on device.
- [ ] Load time to first playable moment.
- [ ] Text legibility at headset resolution.

## Bug notes for VR
Include: headset model, Studio-tethered vs standalone, seated or standing, which controller, and a short description of comfort impact (did it cause discomfort?). Treat any discomfort-causing camera bug as high severity.

## Related
[[Testing - Hub]] · [[Device, Network and Controller Simulation Test Pass]] · [[Custom Camera Systems in Luau]] · [[Low-End Device and Console Hardware Test Pass]]
