---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Clean Roblox Footage - Freecam, Hiding UI and Staging a Shot"
tags: [roblox, community-knowledge, marketing, capture, freecam, camera]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/camera/free-camera
  - https://create.roblox.com/docs/production/publishing/thumbnails
  - https://create.roblox.com/docs/reference/engine/classes/ScreenshotHud
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://devforum.roblox.com/t/freecam-wont-go-away/4087924
---
# Marketing - Clean Roblox Footage - Freecam, Hiding UI and Staging a Shot

Footage with the Roblox top bar, chat bubbles, your own username and a debug panel visible looks amateur, and it can't be reused across platforms. Roblox ships a proper **freecam** and **UI-hiding shortcuts** for owners and editors. With a small "capture mode" script in a private copy of the place, you can record clean shots in minutes. This note collects the official controls and a staging routine.

## 1. Freecam (official controls)
**Who:** the experience owner and users with **edit permission**, in Studio playtests and in the live client. Toggle with **Left Shift + P** (keyboard only). On-screen UI hides automatically while it's on.

| Action | Keyboard / mouse | Gamepad |
|---|---|---|
| Move | W A S D | left stick |
| Up / down | E / Q | R2 / L2 |
| Look | hold right mouse + drag | right stick |
| Zoom (FOV) | scroll wheel | X / Y |
| Roll | Z / C (double-tap to reset) | L1 / R1 |
| Slow, precise move | hold Shift | |
| Config menu | Up arrow | D-pad up |

The **config menu** sets speed and stiffness (smoothness) for movement, rotation, roll and FOV. It also has **Player Lock** (orbit or follow a chosen player) and **custom post-processing**: depth of field, bloom, blur, colour correction, sun rays and colour grading. The config menu and post-processing need `Workspace.PlayerScriptsUseInputActionSystem` set to **Enabled**.

**For cinematic moves:** set high stiffness for smooth glides, use low speed, and plan short moves (3-5 s) that you'll cut together. A slow push-in plus a small roll reads as "trailer".

## 2. Hide UI without code
Hold **Ctrl (⌘ on Mac) + Left Shift**, then press:
- **G**: Roblox Core UI (top bar, menus)
- **C**: your ScreenGuis
- **B**: BillboardGuis
- **N**: player nameplates

Press the same combination again to restore. Owners and editors only.

## 3. Capture-mode script (private place copy)
For multi-player shots you need everyone's nameplates gone and a clean HUD. Put this in a **LocalScript** that only runs when a `CaptureMode` attribute is set on `workspace`, and **only in a capture copy** of the place:

```lua
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
if not workspace:GetAttribute("CaptureMode") then return end

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
local function hideName(char)
    local hum = char:WaitForChild("Humanoid")
    hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
end
for _, p in Players:GetPlayers() do
    if p.Character then hideName(p.Character) end
    p.CharacterAdded:Connect(hideName)
end
Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(hideName) end)
```

`DisplayDistanceType` is a Humanoid property, so set it from the server too if other clients need it hidden. Keep gameplay HUD elements you *want* on screen (health, ammo) in a separate ScreenGui you can toggle on its own.

## 4. Staging checklist before you hit record
- **Graphics:** set the client graphics quality to max (manual 10). Studio playtest quality follows Studio's rendering settings.
- **Lighting:** pick the time of day on purpose (golden hour or night with practicals). Turn off debug parts and collision boxes.
- **Actors:** friends or alt accounts in **matching outfits** (a team look reads better than random avatars). Brief them on one action per take.
- **Repeatable events:** a dev-only command to spawn a wave, trigger the boss or reset a room, so you can do take 2 quickly.
- **Audio:** game SFX and music on; mute voice chat. See [[Marketing - OBS Settings for Recording Roblox Gameplay]] for separate audio tracks.
- **Shot list:** wide establishing, medium action, close-up reward, player POV. The same list as in [[Gameplay Video Thumbnail - Shot List and Edit Structure]].

## 5. Rules if the footage goes on the Roblox game page
Uploaded video thumbnails may use varied camera angles from freecam and highlight-reel editing. They must show **real gameplay at real fidelity**: no enhanced graphics, no real-life footage, **no voice-over or music with lyrics**, and no promotional claims. Rejected uploads count against the **3 per month** quota.

## Pitfalls
- Players who were given edit permission can also freecam in the live game. DevForum users report the Freecam system is added for anyone with Studio access, so review who has edit rights.
- Recording in the live public server: random players walk into the shot and their usernames may appear. Use a private server or the capture copy.
- Forgetting to remove `CaptureMode` from the published main place.

## Related
[[Community Discord - Hub]] · [[In-Game Screenshot Staging for Marketing]] · [[Gameplay Video Thumbnail - Shot List and Edit Structure]] · [[Marketing - Making a Roblox Game Trailer - Gameplay First Structure]]
