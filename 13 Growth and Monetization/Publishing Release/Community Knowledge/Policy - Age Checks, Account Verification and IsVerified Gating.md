---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Age Checks, Account Verification and IsVerified Gating"
tags: [roblox, community-knowledge, publishing, policy, age-check, verification, luau]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://en.help.roblox.com/hc/en-us/articles/39143693116052-Understanding-Age-Checks-on-Roblox
  - https://create.roblox.com/docs/production/publishing/account-verification
  - https://create.roblox.com/docs/reference/engine/classes/Player#IsVerified
---
# Age Checks, Account Verification and IsVerified Gating

> Not legal advice. Summary of "Understanding Age Checks on Roblox" (edited 2026-10-12) and the Creator Hub "Account verification" page, checked 2026-10-25.

Age checks now sit in front of chat, Team Create collaboration, 16+/18+ games and publishing to younger audiences. As a developer you meet them twice: **your own account** needs them to unlock creator features, and **your players'** status changes who can enter and talk in your game. You can also read a player's verification status in code.

## What needs an age check (player side)

- Chat, and chat with fewer filters between trusted friends
- Age-restricted games (16+ and 18+) and Content May Vary games
- Games outside the Kids and Select catalog
- Being invited as an early tester, or inviting testers

Unchecked accounts use the age entered at sign-up: under 9 go to Roblox Kids, 9 and older go to Roblox Select, both with chat off.

## Age groups Roblox uses

Facial age estimation places users in **5-8, 9-12, 13-15, 16-17, 18-20, 21+**. Chat and voice pair users with "similar age groups" unless they are trusted friends. ID verification is only for users 13+.

## What verification unlocks for creators

From the Account verification page and related docs:

- Higher Creator Store distribution limits (for example 200 models per 30 days instead of 10).
- Distributing audio clips under 10 seconds, monetising plugins, and seller accounts (government ID required to sell).
- Age-restricted Studio features such as voice chat testing.
- Generating a Restricted maturity label (18+ check).
- Team Create collaboration with others (the owner must age check, even for group games).
- Kids and Select publishing (ID if 18+, facial estimation if under 18).

Government ID verification needs a photo ID and a phone camera; it is started from **Settings > Account Info > Continue with ID**.

## Reading verification in a script

`Player:IsVerified(level)` returns whether the player has verified their account. The optional `Enum.VerifiedLevel` argument is `Low` (default, for things like trading, to deter alts) or `High` (for ranked queues and other high-stakes features).

```lua
-- Server Script: only verified players may open the trading UI
local Players = game:GetService("Players")

local function canTrade(player: Player): boolean
	local ok, verified = pcall(function()
		return player:IsVerified(Enum.VerifiedLevel.Low)
	end)
	return ok and verified
end

Players.PlayerAdded:Connect(function(player)
	player:SetAttribute("CanTrade", canTrade(player))
end)
```

Keep the check on the server and store the result as an attribute or in your session data; clients only read it for UI.

## Pitfalls

- `IsVerified` is about identity, not age. For age-based features use the platform systems (maturity label, PolicyService, chat APIs) rather than guessing age yourself.
- Never ask players to type their age or birthday into your own UI; collecting personal data breaks the Community Standards and your privacy duties.
- Gating core gameplay behind verification shrinks your audience a lot. Use it for trading, ranked and economy-sensitive features only.
- Your test alt accounts need age checks too if you test chat or Team Create with them.

## Related
[[Publishing Release - Hub]] · [[Roblox Kids and Select - Reaching Players Under 16 in 2026]] · [[Policy - Creator Account Security - 2SV, Groups and Team Create Age Rules]] · [[Account verification]]
