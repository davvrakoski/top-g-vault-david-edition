---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Hangout Weekend - Showcase Space, Seats, Music and a Synced Dance Floor"
tags: [roblox, community-knowledge, start-here, weekend-build, hangout, showcase]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/play-background-music
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/chat/guidelines
---
# Build - Hangout Weekend - Showcase Space, Seats, Music and a Synced Dance Floor

A hangout or showcase has no win state: people come to talk, sit, take screenshots and show their avatars. That makes it the most **art and layout** heavy weekend build and the lightest on code. The risk is a beautiful empty map where nobody knows where to stand. This plan spends day 1 on spaces that pull people together (seats, corners, a view), and day 2 on a few shared toys, the main one being a dance floor that shows the same colours to every player without any network traffic. Background: [[Social Hangout Starter Architecture]] and [[Map - Hangout and Showcase Spaces - Conversation Pockets, Seats and Viewpoints]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 1 themed space (rooftop, beach cafe, cabin) | Several worlds, teleports |
| 6-10 seat clusters, 1 viewpoint | Apartments, housing |
| Background playlist with mute | DJ booth, music voting |
| Emote wheel, synced dance floor | Custom emote shop |
| Photo spot with good light | Photo mode with filters |

## Day 1 - the space (about 6 hours)

1. **Pick one mood and one reference (30 min).** Collect 3-5 reference images and decompose them: [[Reference Decomposition Method — Turn Any Image Into a Build Plan]].
2. **Block out (2 h).** A spawn that faces the best view, then 6-10 "pockets" where 2-5 people can sit facing each other. People cluster at edges, corners and seats, not in open middles.
3. **Seats (1 h).** Benches and sofas with Seat parts. Turn off accidental sitting by using a prompt: [[Seat Entry with ProximityPrompt - No More Accidental Sits]]. Sit poses: [[Anim - Sit Poses per Seat - Benches, Thrones, Beds and Drivers]].
4. **Light (1.5 h).** This is a showcase; light is the product. Warm key light, darker edges, one bright focal point. Read [[Grounded Lighting Composition]] and [[Guiding Players with Light, Color and Affordance]].
5. **Music (1 h).** A quiet playlist with a mute button that remembers the choice: [[Recipe - Music Playlist with Shuffle and Mute]]. Only use audio you are allowed to use: [[Free Music for Roblox Games - License Table]].

## Day 2 - shared toys and safety (about 5 hours)

1. **Dance floor (1.5 h).** The core script below.
2. **Emotes (1 h).** The default emote menu works; for a custom wheel see [[Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation]].
3. **Photo spot (1 h).** A lit backdrop and a marked standing spot near the viewpoint. Later, a photo mode: [[Racing - Photo Mode with CaptureService]].
4. **Chat and safety (1 h).** Hangouts are chat-first. Keep TextChatService on, filter all player text you display, and add a join message. [[Text Chat, Moderation and Player Safety]] and [[Recipe - Join, Leave and Server Messages in Chat]].
5. **Performance (30 min).** Lots of decoration hurts phones; check [[Speed - Pre-Publish Performance Gate - Numbers to Pass Before Every Release]].

> **Code status:** original example, not run in Studio. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## The core script: a dance floor every client sees in sync

```lua
-- StarterPlayerScripts/DanceFloor (LocalScript)
local RunService = game:GetService("RunService")
local floor = workspace:WaitForChild("DanceFloor") -- a Model of tile parts

local PALETTE = {
	Color3.fromRGB(255, 80, 160), Color3.fromRGB(80, 200, 255),
	Color3.fromRGB(255, 220, 90), Color3.fromRGB(140, 255, 120),
}
local BEAT = 0.5 -- seconds per colour step

local tiles = {}
for _, tile in floor:GetChildren() do
	if tile:IsA("BasePart") then
		-- the tile's grid position gives each tile its own offset
		local p = tile.Position
		tiles[tile] = math.floor(p.X / 4) + math.floor(p.Z / 4)
	end
end

local lastBeat = -1
RunService.Heartbeat:Connect(function()
	local beat = math.floor(workspace:GetServerTimeNow() / BEAT)
	if beat == lastBeat then return end
	lastBeat = beat
	for tile, offset in tiles do
		tile.Color = PALETTE[(beat + offset) % #PALETTE + 1]
	end
end)
```

How it stays in sync with zero remotes: `workspace:GetServerTimeNow()` returns the server's clock on every client, so every client computes the same beat number at the same moment. The colour change happens only on each client, which costs no bandwidth and does not replicate. The same trick drives any decorative loop (spinning signs, light shows): [[Recipe - Countdown Timer UI Synced to Server Time]].

With StreamingEnabled on, set the `DanceFloor` model's `ModelStreamingMode` to `Atomic` so the tiles arrive together; otherwise the table may miss tiles that had not streamed in yet.

## What to cut when you run late

- Custom emote wheel: the built-in emotes are fine.
- Photo spot: the viewpoint already doubles as one.
- Playlist: one looping track at low volume, with a mute button.

## How to test

- [ ] Two clients side by side in **Server and Clients**: the dance floor colours match on every beat.
- [ ] Walk the whole map on a phone emulator: no seat is hard to reach, no pocket is darker than the rest.
- [ ] Sit, stand, emote, and walk off a seat without getting stuck.
- [ ] Mute music, rejoin: still muted (if you saved the setting).
- [ ] 20 player server test: FPS on a low-end phone stays playable.

## Related
[[00 START HERE - Top G Vault]] - [[Social Hangout Starter Architecture]] - [[Social Hub and Lobby Layout]] - [[Starter - Scoping Your First Real Game - One Loop and a Cut List]]
