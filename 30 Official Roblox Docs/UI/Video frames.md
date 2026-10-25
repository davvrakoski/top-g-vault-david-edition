---
title: "Video frames"
description: "Video assets used on VideoFrame instances allow for video playback in games."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/video-frames"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Video assets used on VideoFrame instances allow for video playback in games.*

Video assets used in [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] instances allow for video playback in games. You can [[30 Official Roblox Docs/UI/Video frames#Upload videos|upload]] videos that you're certain you have permission to use, such as videos you make yourself, and the [asset privacy](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) system automatically ensures that the IDs of your uploaded videos can't be accessed by users without the proper permissions.

## Upload videos

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

If you're a 13+ [ID verified](https://en.help.roblox.com/hc/en-us/articles/4407282410644-Age-ID-Verification) user, you can upload videos through the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md), the [Creator Dashboard](https://create.roblox.com/dashboard/creations?activeTab=Video), or the [[30 Official Roblox Docs/Cloud/Guides/Usage guide for assets|Open Cloud API]]. You can upload a video as long as it meets the following requirements:

- You have the legal rights to use the video asset.
- It adheres to the [Roblox Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410) and [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846).
- It's 5 minutes or less in either `.mp4` or `.mov` format.
- Its resolution is less than or equal to 4096×2160.
- It's less than 3.75 GB.

Videos that don't meet these requirements are rejected. Alpha channels are not supported and will be ignored. When uploading videos, consider the following:

- Each video upload costs 2,000 Robux.
- You can upload a maximum of 20 videos a day.

## Play videos

A [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] must be parented to a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]], or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] in order to be playable. Currently, a maximum of two videos can play simultaneously.

To play a video in your game without code:

1. Create a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] as outlined in [[30 Official Roblox Docs/UI/On-screen UI containers|On-Screen UI Containers]], or a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] or [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] as outlined in [[30 Official Roblox Docs/UI/In-game UI containers|In-game UI containers]].
2. Insert a video from the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md). A new [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] object is inserted for the video.
3. Parent the [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] to the container.

   *(image in the full Top G Vault)*

4. With the new [[30 Official Roblox Docs/API Reference/Classes/VideoFrame|VideoFrame]] selected, enable its **Looped** and **Playing** properties in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

   *(image in the full Top G Vault)*

If you want to play a video in your game with code, paste the following code into a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] within [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] to create a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and play the video on its front surface.

```lua
local Workspace = game:GetService("Workspace")

local screenPart = Instance.new("Part")
screenPart.Size = Vector3.new(16, 9, 1)
screenPart.Position = Vector3.new(0, 8, -20)
screenPart.Orientation = Vector3.new(0, 180, 0)
screenPart.Anchored = true
screenPart.Parent = Workspace

local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Parent = screenPart

local videoFrame = Instance.new("VideoFrame")
videoFrame.Size = UDim2.new(1, 0, 1, 0)
videoFrame.Parent = surfaceGui

videoFrame.Looped = true
videoFrame.Video = "rbxassetid://5608384572"  -- Replace with your video's asset ID

while not videoFrame.IsLoaded do
	videoFrame.Loaded:Wait()
end

videoFrame:Play()
```

---
*Source: [Video frames](https://create.roblox.com/docs/ui/video-frames) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
