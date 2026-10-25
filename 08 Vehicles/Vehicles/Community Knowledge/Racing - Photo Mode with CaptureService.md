---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Photo Mode with CaptureService"
tags: [roblox, community-knowledge, vehicles, photo-mode, camera, captures]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CaptureService
  - https://devforum.roblox.com/t/captures-apis-are-now-available/2838188
  - https://devforum.roblox.com/t/how-to-take-a-screenshot-from-any-position-using-captureservice/2872075
  - https://devforum.roblox.com/t/capturescreenshot-to-editableimage-image/3629937
  - https://create.roblox.com/docs/reference/engine/classes/DepthOfFieldEffect
---
# Racing - Photo Mode with CaptureService

Car players love showing off their builds. A photo mode (freeze the moment, fly the camera, add filters, save the shot) turns customisation into free marketing: shared screenshots of cool cars bring new players. Roblox's Captures APIs let your game take the screenshot and prompt the player to save or share it.

## 1. Entering photo mode

- Pause *your* game state for that player only: in a solo or time-trial mode, anchor the car (`chassis.Anchored = true`) to freeze it mid-drift; in multiplayer you cannot pause the world, so freeze only the local view of the player's own car or simply let the scene continue.
- Hide the HUD (`ScreenGui.Enabled = false`) and show a small photo toolbar.
- Switch `Camera.CameraType = Enum.CameraType.Scriptable`.

## 2. Free camera with limits

- Orbit around the car by default (mouse drag / right stick / one-finger drag), plus zoom and roll.
- Optional free-fly mode (WASD / left stick).
- **Clamp distance** from the car (e.g. 60 studs) and stop the camera entering walls (raycast from the car to the camera) so photo mode cannot be used to peek through the map or spot hidden areas in competitive games.

## 3. Look controls

Each one maps to a real post-processing instance (created on the client, under `Lighting` or the camera):

| Control | Instance and property |
|---|---|
| Field of view | `Camera.FieldOfView` (20-90) |
| Focus / blur | `DepthOfFieldEffect.FocusDistance`, `InFocusRadius`, `FarIntensity` |
| Exposure | `Lighting.ExposureCompensation` |
| Saturation / contrast / tint | `ColorCorrectionEffect.Saturation`, `Contrast`, `TintColor` |
| Glow | `BloomEffect.Intensity`, `Threshold` |
| Time of day (solo only) | `Lighting.ClockTime` |
| Letterbox / frames | two black Frames, or a decorative border image |

Restore every value on exit; keep the originals in a table when entering.

## 4. Taking the shot

`CaptureService:TakeScreenshotCaptureAsync(onCaptureReady, captureParams)` starts a capture; `captureParams` can use `Enum.UICaptureMode` to include or exclude UI, and the default excludes UI (check the docs for the exact parameter key). The callback receives an `Enum.ScreenshotCaptureResult` and, on success, the capture. Then prompt the player with `CaptureService:PromptSaveCapturesToGallery(captures, callback)` or `PromptShareCapture(...)`.

The older `CaptureService:CaptureScreenshot(callback)` gives a temporary content id you can show in an `ImageLabel` as a preview.

Notes from the Captures API threads:
- You can only capture what the **current camera** shows; capturing from an arbitrary camera is not supported. Community workarounds briefly swap the camera, with a delay of several frames measured.
- Temporary capture ids are not uploaded assets; turning them into an `EditableImage` was reported as blocked in one 2025 thread, but a later reply describes a working pattern (unverified for current builds).
- The announcement was updated in January 2026: user-initiated captures no longer get a watermark, and `CaptureSaved` is deprecated in favour of `UserCaptureSaved`.

## 5. UX details

- Hide the toolbar during the capture frame (wait one `RenderStepped` after hiding).
- Add a shutter flash and sound after the capture, not before.
- "Hide my car's name tag" and "hide other players" toggles (set other characters' `LocalTransparencyModifier` to 1 on the client).
- Remember the last filter set per player for convenience (local storage via a settings profile).

## Related
[[Vehicles - Hub]] · [[Vehicle Customisation - Paint, Parts and Saved Loadouts]] · [[Cutscene Cameras - Spline Paths, Letterbox and Skip]] · [[Racing - Car Meets and Cruising Social Design]]
