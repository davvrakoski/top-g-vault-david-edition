---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Player-Made Content - Auto Clips, Share Prompts and Filmable Moments"
tags: [roblox, community-knowledge, marketing, captures, ugc-video, sharing]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CaptureService
  - https://create.roblox.com/docs/reference/engine/classes/ScreenshotHud
  - https://devforum.roblox.com/t/i-made-a-small-game-thing-and-it-blew-up-on-tiktok/732372
  - https://create.roblox.com/docs/production/promotion/share-links
---
# Marketing - Player-Made Content - Auto Clips, Share Prompts and Filmable Moments

Your own posts reach your followers. Your **players'** posts reach their friends, and those friends are the best possible new players. The 2020 DevForum LOFTS case grew because **other people** made TikToks of the game. Roblox now gives you engine tools for this: `CaptureService` can record a **30-second clip** or a screenshot at a moment you choose, and prompt the player to **share it with an invite link that carries LaunchData**. This note shows how to design and wire those moments.

## 1. The API pieces (CaptureService, client-side)

| Method | Use |
|---|---|
| `StartVideoCaptureAsync(onCaptureReady)` | starts a video capture; it stops on `StopVideoCapture()` or after **30 s**. **All user voices are muted** during recording. Returns `Enum.VideoCaptureStartedResult` (`Success`, `CapturingAlready`, `NoDeviceSupport`, `NoSpaceOnDevice`, `OtherError`) |
| `CaptureScreenshot(onCaptureReady)` | temporary screenshot `contentId` (not saved to the gallery automatically) |
| `PromptSaveCapturesToGallery(captures, callback)` | asks to save to the player's Captures gallery |
| `PromptShareCapture(content, launchData, onAccepted, onDenied)` | native share sheet with the capture **plus an invite link** where supported; `launchData` reaches whoever joins via that link. On devices without share sheets it offers a download instead |
| `CaptureBegan` / `CaptureEnded` | events to hide your own UI during a capture |

`ScreenshotHud.HideCoreGuiForCaptures` (default **true**) hides Roblox core UI during captures. Hide your own HUD on `CaptureBegan` for clean shots.

## 2. Design "clip moments"
Choose 3-5 moments that are short, visual and worth bragging about:
- a **boss defeat**, a **rare drop** reveal, a **last-second save**, a **new personal record**, or a funny physics fail (ragdoll launch).
- Start the recording **just before** the moment you expect (boss at 10% HP, final wave starting). You can't record backwards.
- Keep clips well under 30 s and stop shortly after the payoff.

## 3. Wiring a share prompt (sketch)
```lua
local CaptureService = game:GetService("CaptureService")

local function onBossLowHP()
    local started = CaptureService:StartVideoCaptureAsync(function(result, capture)
        local ok = result == Enum.VideoCaptureResult.Success
            or result == Enum.VideoCaptureResult.TimeLimitReached -- hit the 30 s cap
        if ok and capture then
            -- show your own "Share this clip?" button first, then:
            CaptureService:PromptShareCapture(capture, "src=clipboss", nil, nil)
        end
    end)
    if started ~= Enum.VideoCaptureStartedResult.Success then return end
end
-- call CaptureService:StopVideoCapture() a few seconds after the boss dies
```
(Check how `Content` wraps the capture for `PromptShareCapture` on the docs page. The doc accepts a `Content` with a contentId or `Capture` object.)

On the receiving side, read `Player:GetJoinData().LaunchData == "src=clipboss"` and give a tiny welcome cosmetic, once per player, server-checked. See [[Marketing - Share Links per Channel - Naming, LaunchData Perks and Reading Results]].

## 4. Make the whole game filmable
- **Photo spots:** scenic overlooks, a stage, a mirror room. Players film where it looks good.
- **Emote and pose space** in lobbies; group-photo moments after wins.
- **A readable HUD** that also looks good in a crop (large, high-contrast).
- **A spectator or free camera** for players after death or in lobbies. Creators need it for B-roll.
- **Streamer-friendly options:** hide usernames on the leaderboard, a music toggle (copyright-safe if your soundtrack is original).

## 5. Rules and UX
- **Ask, don't force.** Show your own "Share?" button and only then call the prompt. Never block progress behind sharing.
- Don't reward the *share itself* with valuable items. Sharing is optional, and rewarding off-platform actions risks the Community Standards. A small cosmetic for the **joiner** via LaunchData is the cleaner pattern.
- Be careful with captures that show **other players' usernames or chat**. Hide nameplates during auto-captures if you can.
- Voice is muted in captures, so players can't accidentally share voice chat.

## Checklist
- [ ] 3-5 clip moments chosen; recording starts before the payoff
- [ ] HUD hides on `CaptureBegan`; core UI hidden by default
- [ ] Own "Share?" button, then `PromptShareCapture` with `launchData`
- [ ] Join handler grants a once-only cosmetic for `src=clip*`
- [ ] Photo spots and a spectator camera in the build

## Related
[[Community Discord - Hub]] · [[Racing - Photo Mode with CaptureService]] · [[Invites, Referrals, Share Links and Notifications]] · [[TikTok and Short-Video Promotion - What Devs Report]]
