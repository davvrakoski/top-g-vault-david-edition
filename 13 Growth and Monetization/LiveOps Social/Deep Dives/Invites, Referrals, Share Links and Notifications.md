---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
tags: [deep-dive, roblox, growth, invites, referrals, notifications, share-links, launch-data]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Invites, Referrals, Share Links and Notifications

## Why this matters
Friends bring friends, and "intentional co-play days" is one of the documented recommendation signals. Roblox gives you four free growth tools that most games under-use: **invite prompts**, the **friend referral system**, **share links** and **experience notifications**.
Each comes with **launch data**, a small payload that tells your game where an incoming player came from and lets you spawn them next to their friend, credit the inviter, or route them to an event. This note wires all four together safely.

---

## 1. Tool overview

| Tool | Who triggers it | Where it lands | Attribution |
|---|---|---|---|
| **Invite prompt** (`SocialService:PromptGameInvite`) | A player, from your UI | Friend's Roblox notifications | `LaunchData`, plus referral `ReferredByPlayerId` |
| **Friend referral system** | Any invite (your prompt or the default invite menu) | Referral link | `Player:GetJoinData().ReferredByPlayerId` |
| **Share links** (Creator Dashboard) | You, for off-platform channels (YouTube, TikTok, Discord) | Game details page / join | Acquisition dashboard (by link) + optional custom `LaunchData` |
| **Experience notifications** (Open Cloud package) | Your server, about a player's own activity | Player's notification stream (opted-in, 13+) | `launchData` in `joinExperience` |

All launch data is read on the **server** with `player:GetJoinData()`. Treat it as **untrusted input**: anyone can craft a link.

---

## 2. Invite prompts

```lua
-- LocalScript on an "Invite friends" button
local Players = game:GetService("Players")
local SocialService = game:GetService("SocialService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

script.Parent.Activated:Connect(function()
	local ok, canInvite = pcall(SocialService.CanSendGameInviteAsync, SocialService, player)
	if not (ok and canInvite) then return end

	local options = Instance.new("ExperienceInviteOptions")
	options.PromptMessage = "Ask your friends to join your run!"
	options.InviteMessageId = "0000000000" -- Notification string asset ID (optional)
	options.LaunchData = HttpService:JSONEncode({ s = player.UserId, z = "Zone3" }) -- ≤ 200 characters
	SocialService:PromptGameInvite(player, options)
end)
```

Rules:
- Always check `CanSendGameInviteAsync` (wrapped in `pcall`); availability varies by platform and player.
- `PromptMessage` that overflows the UI isn't shown, so keep it short.
- `InviteUser` (a UserId) targets one specific friend instead of a picker.
- **Custom notification text:** Creator Dashboard › your game › **Engagement › Notifications › Create a Notification String**. It **must** include `{experienceName}`; `{displayName}` (sender) is optional. Put the asset ID in `InviteMessageId`.
- `LaunchData` has a **200-character** limit. Encode compact JSON.
- Launch data can take **a few seconds** to arrive after the friend joins, so wait for it (see the reader below).

---

## 3. Friend referral rewards

- `player:GetJoinData().ReferredByPlayerId` is filled automatically for **all invitation types**.
- Reward **both sides** (inviter and invitee), and show a **reward banner** at the top of the invite modal: Creator Hub › Engagement › **Referral Rewards** › Add Reward Details (icon, name, dates, optional description and per-inviter limit) › Save › **Publish**. Only **one** banner is published at a time, and it must match what your code really grants.
- Eligibility: games **live for at least one day** that don't violate Community Standards. Links don't expire, and invitees don't have to be existing Roblox friends.

### Abuse protection (docs list these; implement all three)
1. **One-time** invitee rewards (persist that this invitee was already rewarded).
2. **Cooldown** per inviter.
3. **Monitor** unusual patterns and be able to cancel rewards.

---

## 4. Share links (off-platform acquisition)

Creator Dashboard › **Creations › Share Links** › **Create link** › campaign name + game › optional **custom LaunchData** › Generate.
- Unlimited links per game. Make **one per channel/creator/video** so the Acquisition dashboard's *New users funnel* shows which source brings users with **qualified plays**, **7-day playtime**, **D7** and **30-day revenue per user**.
- For group-owned games, create links from the group account with the right permission.
- Example LaunchData: `{"c":"yt_oct_trailer"}`, which lets you give a small welcome cosmetic. Never tie anything valuable to an unauthenticated code.

---

## 5. Experience notifications

| Rule | Documented value |
|---|---|
| Recipients | Users **13+** who **opted in** to notifications for your game |
| Game eligibility | ≥ **100 visits** since launch, not under moderation, you can manage the game |
| Throttle | **One notification per user per day** per experience (plus a platform-wide daily cap) |
| Delivery | **Not guaranteed**; a spam-prevention system gives more reach to notifications users engage with |
| Payload | `messageId` (notification string), `type = "MOMENT"`, optional `parameters`, `joinExperience.launchData` (≤ **200 bytes**), `analyticsData.category` |
| Sending | Server-side via the **Open Cloud** package from the Creator Store (`createUserNotification(userId, userNotification)`), or the Open Cloud REST API |

Content rules (*Usage guidelines*):
- **Personal and actionable:** "You're 2 races away from completing the weekly challenge!" Not generic ads ("A new line of race cars just dropped").
- **No dark patterns:** disguised ads, false time pressure, bait-and-switch freebies, or links that drop users into pre-loaded purchases.
- **Don't gate gameplay** behind enabling notifications.
- Always subject to platform-wide Community Standards and filtering, even for 17+ games.

### Ask for opt-in at a meaningful moment
`ExperienceNotificationService:CanPromptOptInAsync()` (in `pcall`), then `ExperienceNotificationService:PromptOptIn()`. The prompt text is standardized. It **won't show** if the user is under 13, already opted in, or saw the prompt for your game in the **past 30 days**. Ask right after something that warrants a future notification ("Your egg will hatch in 6 hours. Want a notification?"), not at spawn.

```lua
-- LocalScript: ask for notification opt-in right after the player starts a timed action
local ExperienceNotificationService = game:GetService("ExperienceNotificationService")

local function maybeAskForNotifications()
	local ok, canPrompt = pcall(ExperienceNotificationService.CanPromptOptInAsync, ExperienceNotificationService)
	if ok and canPrompt then
		ExperienceNotificationService:PromptOptIn()
	end
end
```

```lua
-- Server: send "egg hatched" (OpenCloud package placed in ServerScriptService per the docs)
local OpenCloud = require(game:GetService("ServerScriptService").OpenCloud.V2.UserNotification)

local function notifyEggHatched(userId: number, eggName: string)
	local result = OpenCloud.createUserNotification(userId, {
		payload = {
			messageId = "00000000-0000-0000-0000-000000000000", -- your notification string ID
			type = "MOMENT",
			parameters = { ["eggName"] = { stringValue = eggName } },
			joinExperience = { launchData = "hatch" },
			analyticsData = { category = "Hatch" },
		},
	})
	if result.statusCode ~= 200 then
		warn("Notification failed", result.statusCode, result.error and result.error.message)
	end
end
```

The `require` path and parameter shape follow the docs' package layout at the time of writing. **Open the package after inserting it** and match its module path and parameter format, because the package can change.

---

## 6. One launch-data reader for everything

```lua
-- ServerScriptService/JoinRouter.server.luau
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local MAX_WAIT = 8

local function readLaunchData(player: Player)
	local joinData = player:GetJoinData()
	local referrer = joinData and joinData.ReferredByPlayerId
	local raw = joinData and joinData.LaunchData
	-- Launch data can arrive a few seconds late: poll briefly
	local t = 0
	while (raw == nil or raw == "") and t < MAX_WAIT do
		task.wait(1); t += 1
		joinData = player:GetJoinData()
		raw = joinData and joinData.LaunchData
	end
	local data
	if raw and #raw <= 200 then
		local ok, decoded = pcall(HttpService.JSONDecode, HttpService, raw)
		data = if ok and type(decoded) == "table" then decoded else { raw = raw }
	end
	return referrer, data
end

Players.PlayerAdded:Connect(function(player)
	local referrer, data = readLaunchData(player)
	if referrer and referrer ~= 0 and referrer ~= player.UserId then
		Referrals.handle(player, referrer) -- your module: one-time + cooldown checks, then rewards
	end
	if data and type(data.s) == "number" then
		local host = Players:GetPlayerByUserId(data.s)
		if host and host.Character then
			-- spawn near the inviting friend if they're in this server
		end
	end
	if data and type(data.c) == "string" then
		player:SetAttribute("Campaign", data.c:sub(1, 40)) -- also log it as an analytics custom field
	end
end)
```

---

## Common mistakes
- Granting valuable rewards for raw launch data (forgeable) instead of server-validated referral logic.
- Unlimited referral rewards with no one-time or cooldown checks.
- Prompting invites or notification opt-in the moment a player spawns.
- A reward banner promising rewards your code doesn't grant.
- One share link for all channels (no attribution).
- Generic, ad-like notifications that get low engagement and reduced reach.
- Using notifications as "come back" spam; the throttle is one per user per day anyway.
- Exceeding the 200-character/byte launch-data limits.

## Checklist
- [ ] Invite button with `CanSendGameInviteAsync`, custom notification string with `{experienceName}`
- [ ] Referral rewards for both sides, one-time, cooldown, monitored; banner published and accurate
- [ ] Share link per channel; Acquisition dashboard reviewed by link
- [ ] Notification opt-in asked after a relevant action; strings personal and actionable
- [ ] Notifications sent server-side with `analyticsData.category`; failures logged
- [ ] Single join router validates and caps launch data
- [ ] Co-play features (spawn near friend, party goals) use the attribution

---

**Sources checked (2026-10-25):** Creator Docs: Promotion › Player invite prompts; Friend referral system; Share links; Experience notifications (eligibility, guidelines, delivery system, API reference); Analytics › Acquisition; Discovery (co-play signal); Engine API: SocialService, ExperienceInviteOptions, ExperienceNotificationService, Player.GetJoinData.

**Related:** [[LiveOps Social - Hub]] · [[Social Systems - Parties, Friends and Co-Play]] · [[Discovery, Retention and Analytics]] · [[Text Chat, Moderation and Player Safety]] · [[Home Recommendations - What Roblox Documents About Discovery]]
