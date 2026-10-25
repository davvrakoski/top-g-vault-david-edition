---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks"
tags: [roblox, community-knowledge, publishing, policy, chat, textchatservice, filtering, luau]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked; code is original"
sources:
  - https://create.roblox.com/docs/chat/guidelines
  - https://devforum.roblox.com/t/migrate-to-textchatservice-removing-support-for-legacy-chat-and-custom-chat-systems/3237100
  - https://en.help.roblox.com/hc/en-us/articles/37541811348884-Text-Chat-Nudge-FAQ-s
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
---
# Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks

> Not legal advice. Summary of the Creator Hub "Chat system guidelines" and the DevForum migration announcement (posted 2024-10-30), checked 2026-10-25.

Player-to-player text is a **platform rule**, not a design choice: if users can message each other in your game, the messages must go through `TextChatService`. Custom chat that bypasses it is listed under "Misusing Roblox Systems" in the Community Standards. The legacy `Chat` service was removed on the schedule below, so old free-model chat systems are now a compliance risk as well as a bug risk.

## What counts as chat

Chat = any message from one user delivered to one or more other users: bubbles, chat window, DMs, team messages, and **replies** in a comments feature.

Not chat (but still needs filtering if users see it): developer menu text, game status ("2 minutes left"), admin announcements, a pet name, moderation logs, standalone UGC text like a sign.

## The requirements

1. **All in-game text chat uses `TextChatService`** and travels through a `TextChannel` (so privacy settings, moderation visibility and filtering apply).
2. **Editable user text visible to others** (signs, bulletin boards, notes) needs a **rate limit of at least 1 minute** per user, plus filtering. Anything built as a conversation must use TextChatService instead.
3. **All incoming text from another user is filtered** before display (`TextService:FilterStringAsync` then `GetNonChatStringForBroadcastAsync` or `GetNonChatStringForUserAsync` for non-chat text).
4. **Privacy settings are respected.** `TextChannel:SendAsync` handles basic privacy and parental settings. Channels you create for direct chat must be marked with `TextChannel:SetDirectChatRequester(requester)`. Use `CanUserChatAsync`, `CanUsersChatAsync` and `CanUsersDirectChatAsync` to decide whether to offer chat features.
5. **Messages are reportable.** TextChannels do this automatically.

## Migration timeline (from the announcement)

- 2024-11-30: no new games with legacy chat.
- 2025-01-30: forked or custom chat must call `CanUserDirectChatAsync`-style checks; Team Chat removed from Studio.
- 2025-04-30: legacy chat removed; migration required. Unmodified legacy chat was auto-migrated; failed migrations could have chat disabled.

## Creating a private DM channel correctly

```lua
-- Server Script: open a 1:1 channel only if both users may DM
local TextChatService = game:GetService("TextChatService")

local function openDirectChannel(requester: Player, target: Player): TextChannel?
	local ok, allowed = pcall(function()
		return TextChatService:CanUsersDirectChatAsync(requester.UserId, { target.UserId })
	end)
	if not ok or #allowed == 0 then
		return nil -- privacy or parental settings forbid it
	end

	local channel = Instance.new("TextChannel")
	channel.Name = `DM_{requester.UserId}_{target.UserId}`
	channel.Parent = TextChatService
	channel:SetDirectChatRequester(requester)
	channel:AddUserAsync(requester.UserId)
	channel:AddUserAsync(target.UserId)
	return channel
end
```

## A sign with the 1-minute limit

Keep a `lastEdit[userId]` timestamp on the server, reject edits within 60 seconds, filter with `FilterStringAsync`, and store the **filtered** result for broadcast. Never store raw text to show later; re-filter for each viewer if you need per-user output.

## Things that are now handled by Roblox

Repeat offenders get a "nudge" warning and then escalating chat mutes across all in-experience chat. You do not need your own swear filter on top; adding one is fine but it cannot replace the platform filter.

## Pre-launch checklist

- [ ] No `game:GetService("Chat")` legacy code or old chat free models in the place
- [ ] Custom chat UI built on `TextChatService` events, not RemoteEvents carrying raw text
- [ ] Signs, pet names, notes: filtered + 60 s rate limit
- [ ] DM or party channels created with `SetDirectChatRequester`
- [ ] Chat feature hidden when `CanUserChatAsync` returns false

## Related
[[Publishing Release - Hub]] · [[Text Chat, Moderation and Player Safety]] · [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]] · [[Chat system guidelines]]
