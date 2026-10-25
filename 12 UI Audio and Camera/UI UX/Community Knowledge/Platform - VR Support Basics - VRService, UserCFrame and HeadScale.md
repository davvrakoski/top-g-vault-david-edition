---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - VR Support Basics - VRService, UserCFrame and HeadScale"
tags: [roblox, community-knowledge, ui, platform, vr, meta-quest]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VRService
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/reference/engine/enums/UserCFrame
  - https://create.roblox.com/docs/production/publishing/vr-guidelines
  - https://create.roblox.com/docs/reference/engine/classes/HapticEffect
  - https://devforum.roblox.com/t/109055
---
# Platform - VR Support Basics - VRService, UserCFrame and HeadScale

Roblox runs on Meta Quest and PC VR headsets through OpenXR, so the same game works on both (VR guidelines). Most games get a playable VR mode for free from the default camera and controls; what breaks is anything custom: a scripted camera, a gun that only aims with the mouse, a ScreenGui covering the view. This note lists the APIs that tell you where the player's head and hands are, and the switches that change how VR players see your world.

## Is the player in VR?
`VRService.VREnabled` (also on `UserInputService`) is true when a headset is in use. Check it before any gamepad branch, because VR players also hold controllers. Read it on the client; the server cannot know unless you tell it.

## Head and hand tracking
- `VRService:GetUserCFrame(Enum.UserCFrame.Head | LeftHand | RightHand | Floor)` returns the device's CFrame as an offset in real-world space. LocalScript only.
- `VRService:GetUserCFrameEnabled(userCFrame)` tells you if that device is tracked (some setups lack hand tracking).
- `VRService.UserCFrameChanged(type, value)` fires as devices move.
- `VRService:RecenterUserHeadCFrame()` re-centres the head to the current headset position (same as the UserInputService method). Offer it in your settings.
- `VRService.GuiInputUserCFrame` says which device drives UI input (for example the head).

To place an object at a hand in world space, the widely used community formula combines the camera, head scale and the hand offset:

```lua
-- LocalScript: hold a world-space Part at the right controller each frame
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local camera = workspace.CurrentCamera
local held: BasePart = workspace:WaitForChild("VRHeldTorch")

RunService.RenderStepped:Connect(function()
	if not VRService.VREnabled then return end
	local hand = VRService:GetUserCFrame(Enum.UserCFrame.RightHand)
	local scaled = CFrame.new(hand.Position * camera.HeadScale) * hand.Rotation
	held.CFrame = camera.CFrame * scaled
end)
```
Treat this as a starting point and verify alignment in a headset; the official docs describe the inputs but do not publish this exact formula.

## Scale: how big the world feels
- `Camera.HeadScale`: 1 stud in VR equals `0.3 m / HeadScale` (docs). A 1-stud part looks 0.6 m tall at `HeadScale = 0.5`.
- `VRService.AutomaticScaling = Enum.VRScaling.World` makes `HeadScale` follow the avatar's size so small avatars see a bigger world. Switch to `Off` if you control `HeadScale` yourself or use custom characters.
- Rule of thumb: design doors, stairs and buttons at real-world proportions for your avatar scale; VR players notice wrong proportions instantly.

## Camera switches
- `Camera.HeadLocked` (default true): the engine adds head tracking to `Camera.CFrame`. Turning it off for a custom camera means you must apply head movement yourself; doing it badly causes nausea.
- `Camera.VRTiltAndRollEnabled`: keep **off** unless tested heavily; the docs explain a tilting horizon causes dizziness and suggest a stable reference frame (cockpit, floor) if you enable it.
- The VR guidelines recommend the default camera scripts (they include comfort options and future updates). Custom `PlayerScripts` cameras opt out of those updates; if VR looks broken, merge the latest camera scripts or go back to the defaults.

## Avatar and controllers
- `VRService.AvatarGestures` (server-set): lets VR players move their avatar's hands and head with their controllers and headset. Turn it off when IK gestures conflict with your weapon systems or custom rigs (docs).
- `VRService.ControllerModels`: `Transparent` (default) or `Disabled`.
- `VRService.LaserPointer`: `Pointer` (default, one hand), `DualPointer`, or `Disabled` for UI pointing.
- `VRService.FadeOutViewOnCollision` (default true): the view fades when the head enters a wall, preventing seeing through geometry. Leave it on in competitive games.
- Haptics reach the Quest Touch controllers through `HapticEffect` like any pad.

## Community resource
**Nexus VR Character Model** by TheNexusAvenger is a long-running open-source VR character implementation (DevForum thread 109055, also on itch.io/GitHub). The DevForum title now says it needs a maintainer. License not confirmed by us: link only.

## Minimum VR pass
- [ ] Default camera works; no ScreenGui blocks the view.
- [ ] Every action works with Touch controllers (no keyboard-only binds; the guidelines recommend `InputAction`).
- [ ] Menus usable with the laser pointer.
- [ ] Recentre option available.
- [ ] Held items line up with hands.

## Related
[[UI UX - Hub]] · [[Platform - VR Comfort and Performance on Meta Quest]] · [[Custom Camera Systems in Luau]] · [[Platform - Input Mode Detection - PreferredInput, TouchEnabled and Hybrid Devices]]
