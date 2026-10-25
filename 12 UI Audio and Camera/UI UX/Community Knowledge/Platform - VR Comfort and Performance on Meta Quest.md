---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - VR Comfort and Performance on Meta Quest"
tags: [roblox, community-knowledge, ui, platform, vr, comfort, performance]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://create.roblox.com/docs/reference/engine/enums/VRComfortSetting
  - https://create.roblox.com/docs/reference/engine/classes/VRService
  - https://create.roblox.com/docs/reference/engine/classes/UserGameSettings
  - https://create.roblox.com/docs/ui/3D-drag-detectors
  - https://developers.meta.com/horizon/design/locomotion-best-practices/
  - https://developers.meta.com/horizon/design/locomotion-comfort-usability/
---
# Platform - VR Comfort and Performance on Meta Quest

In VR, a frame drop or a camera that moves without the player's body is not just ugly: it makes people feel sick and quit. Standalone headsets like the Quest render two images on a mobile chipset, so VR is both the most comfort-sensitive and one of the most performance-limited platforms Roblox supports. This note combines Roblox's VR guidelines with Meta's own locomotion guidance.

## What Roblox already does for comfort
Players choose a comfort preset in Roblox's VR settings. `Enum.VRComfortSetting` describes them:

| Preset | Vignette | Smooth rotation | Third-person follow camera |
|---|---|---|---|
| `Comfort` | on | off (stepped) | off |
| `Normal` (default) | on | off | on |
| `Expert` | off | on | on |
| `Custom` | player sets each | | |

The VR guidelines describe the parts: **Vignette** narrows peripheral vision during motion and hides camera teleports; **Stepped Rotation** snaps the camera between angles instead of turning smoothly; **3rd Person Fixed Camera** keeps the camera still and teleports it to keep the player in view.

Readable from scripts:
- `VRService.ThirdPersonFollowCamEnabled`: read-only mirror of the player's setting, fires a change signal when they change it.
- `UserGameSettings.VignetteEnabled`: readable (write is Roblox-only).
- `UserGameSettings.VRSmoothRotationEnabled`: readable by scripts (write is Roblox-only). `VRRotationIntensity` is Roblox-only for both read and write, so you cannot read the snap angle.

If you build a custom camera, **honour these values**: if the player chose stepped rotation, do not smooth-turn them; if they have the vignette on, add one during your scripted motion.

## Meta's locomotion guidance, applied to Roblox
From Meta's Horizon design docs:
- Offer **snap turns and teleport** as comfortable options; make **smooth turning opt-in**.
- **Vignettes** that darken screen edges during movement reduce discomfort.
- Keep **accelerations brief and infrequent**; prefer a few fixed speeds (stop, walk, run) over constant speed changes.
- Provide **tiers of comfort options** and test with users of different sensitivity.

Roblox translations:
- Avoid forced camera motion: knockback that throws the camera, scripted cutscene pans, camera shake. Gate them on `VREnabled` and tone down or skip.
- Vehicles: give a visible cockpit or frame; keep the horizon level (`Camera.VRTiltAndRollEnabled` off).
- Elevators and moving platforms: short, steady speed, no bobbing.
- Never move the camera while a menu is open.

## Performance targets
- The guidelines describe an **Auto Quality Mode** on Quest that aims for at least **72 FPS** by scaling rendering detail. If your game looks bad with it on, optimise rather than fighting it. Draw distance may shrink and lighting work may be disabled automatically.
- The guidelines' tips: enable instance streaming; limit CPU-heavy work like raycasting; prefer `RunService.Heartbeat` over `task.wait()` loops for timing; keep draw calls down (mobile VR is very sensitive to them); low-poly custom meshes; minimise semi-transparent objects (Decals, Glass); keep SurfaceGuis few and simple.
- Oculus drivers on PC VR need at least a GTX 1060-class GPU (guidelines), and testing on PC VR is described as valid for Quest 2 behaviour, but buy a Quest if VR is a real target.

## Interaction tips
- `DragDetector` with `DragStyle = BestForDevice` uses full 6DOF dragging in VR (and plane dragging on touch, plane-or-line for mouse and gamepad), so physical grab-and-move puzzles work in VR without extra code.
- Put important UI on SurfaceGuis in the world or near the hands rather than on a ScreenGui pinned to the face.
- Keep text large; headset resolution per degree is lower than a monitor.

## VR comfort checklist
- [ ] No camera motion the player did not cause (or it is reduced in VR).
- [ ] Custom cameras honour stepped rotation and vignette settings.
- [ ] Horizon always level.
- [ ] Holds 72 FPS in the busiest scene on a Quest with Auto Quality on.
- [ ] A seated/stationary way to play.

## Related
[[UI UX - Hub]] · [[Platform - VR Support Basics - VRService, UserCFrame and HeadScale]] · [[Hitstop, Screen Shake and Camera Impact Feel]] · [[Mobile Performance Deep Dive]]
