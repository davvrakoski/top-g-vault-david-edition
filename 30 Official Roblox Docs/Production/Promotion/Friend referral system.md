---
title: "Friend referral system"
description: "Use referral links to track and reward players that have successfully invited other players into your game, and players that have joined your game using a referral link invitation from another player."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/promotion/referral-system"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use referral links to track and reward players that have successfully invited other players into your game, and players that have joined your game using a referral link invitation from another player.*

> [!info]
> If you previously used this feature while it was still in beta, make sure to implement the new [[30 Official Roblox Docs/Production/Promotion/Friend referral system#Create a reward banner|customized reward banners]] to maximize the reach of your friend referral system.

| | |
| --- | --- |
| ![](https://www.youtube.com/watch?v=qfWKYgO63OI) | ![](https://www.youtube.com/watch?v=rVFmc8gxu4s) |

The friend referral system encourages existing players to bring new players into your game, increasing player retention and overall engagement. Players can access and share referral links from [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|player invite prompts]] or directly from the default in-game invite menu.

As a developer, you can create customized banners to advertise your reward system and use shareable referral links to:

- Track which players have successfully invited other players into your game.
- Track which players have joined your game using a referral link invitation from another player.
- Create and distribute rewards to both inviters and invitees.

*Inviters send out invites*

[Video: Invite-Flow-Referral-System.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/promotion/referral-system/Invite-Flow-Referral-System.mp4)

*Invitees join the game*

[Video: Invitee-Flow-Referral-System.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/promotion/referral-system/Invitee-Flow-Referral-System.mp4)

To implement a referral system, [[30 Official Roblox Docs/Production/Promotion/Friend referral system#Set up a referral event|set up a referral event]] and [[30 Official Roblox Docs/Production/Promotion/Friend referral system#Grant referral rewards|create referral rewards]] in Studio. The `ReferredByPlayerId` property of [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|GetJoinData()]] automatically populates for all types of invitations and gives you access to the user ID of the referring player. You can then access this data in the `Players.PlayerAdded` event to identify the inviter and grant rewards to both the inviter and the invitee.

```lua
function onPlayerAdded(player)

    local referredByPlayerId = player:GetJoinData().ReferredByPlayerId

    local referrerEvent: RemoteEvent = ReplicatedStorage:FindFirstChild("ReferralReceivedEvent")
    referrerEvent:FireClient(player, referredByPlayerId)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

To make sure that players understand the reward system, [[30 Official Roblox Docs/Production/Promotion/Friend referral system#Create a reward banner|implement a customized reward banner]] at the top of your friend invite modal showing them details about the rewards they can earn.

## Set up a referral event

To set up a referral event:

1. Set up a `RemoteEvent` in `ReplicatedStorage` to create a remote event to communicate with the client when a referral is received.
2. Retrieve the inviter's user ID using `ReferredByPlayerId` to track player joins and handle the referral logic in your server-side script during the `Players.PlayerAdded` event.

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create or get the RemoteEvent for handling referrals
local referrerEvent: RemoteEvent = ReplicatedStorage:FindFirstChild("ReferralReceivedEvent")

-- Function that triggers when a player joins
function onPlayerAdded(player)
    local joinData = player:GetJoinData()
    local referredByPlayerId = joinData.ReferredByPlayerId

    -- Check if the player was invited through a referral
    if referredByPlayerId and referredByPlayerId ~= 0 then
        -- Fire the referral event to the client, passing the inviter's ID
        referrerEvent:FireClient(player, referredByPlayerId)

        -- Additional logic for rewarding inviter and invitee can be added here
        -- e.g., rewardReferrer(referredByPlayerId)
        -- e.g., rewardInvitee(player)
    end
end

-- Connect the function to the PlayerAdded event
Players.PlayerAdded:Connect(onPlayerAdded)
```

## Grant referral rewards

To encourage participation, grant rewards to both inviters and invitees. For example, you can give inviters a badge or in-game currency when their friend joins the game, and give invitees a welcome reward for joining the game through a referral link.

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create or get the RemoteEvent for handling referrals
local referrerEvent: RemoteEvent = ReplicatedStorage:FindFirstChild("ReferralReceivedEvent")

-- Function that triggers when a player joins
function onPlayerAdded(player)
    local joinData = player:GetJoinData()
    local referredByPlayerId = joinData.ReferredByPlayerId

    -- Check if the player was invited through a referral
    if referredByPlayerId and referredByPlayerId ~= 0 then
        -- Fire the referral event to the client, passing the inviter's ID
        referrerEvent:FireClient(player, referredByPlayerId)

        -- Reward the inviter
        function rewardReferrer(referrerId)
          local referrerPlayer = Players:GetPlayerByUserId(referrerId)
          if referrerPlayer then
              -- Grant the inviter their reward
              -- Example: referrerPlayer.leaderstats.Coins.Value += 100
          end
        end

        -- Reward the invitee
        function rewardInvitee(player)
            -- Grant the invitee their reward
            -- Example: player.leaderstats.WelcomeBonus.Value += 50
        end
    end
end

-- Connect the function to the PlayerAdded event
Players.PlayerAdded:Connect(onPlayerAdded)
```

## Create a reward banner

Reward banners encourage users to invite friends to join your game by showing them details about the referral rewards they can earn. These banners are displayed at the top of your friend invite modal.

To create a customized reward banner:

1. In the Creator Hub, go to **Creations** and select the game that you have set up a referral event for.
2. Go to **Engagement** ⟩ **Referral Rewards**.
3. Click **Add Reward Details**.
4. In the **Referral Rewards** page:
    1. Replace the default icon with an image that represents your game.
    2. Enter a reward name to display on the banner.
    3. Select a start and end date for when you want to show the banner to players.
    4. **OPTIONAL** Enter a description with details about the reward.
    5. **OPTIONAL** If you want to add reward restrictions, enter a reward limit. For example, a limit of up to 3 rewards per inviter.
5. Click **Save** to save your changes.
6. Click **Publish** to make the banner visible to players.

You can create many different banners, but only one banner can be published and shown at a time. Make sure that the published banner accurately describes the referral system you have implemented in Studio.

<br><br>

[Video: Reward-Details.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/promotion/referral-system/Reward-Details.mp4)

## Prevent referral system abuse

You can implement safeguards to prevent players from exploiting the friend referral system.

- Offer one-time rewards to track invitees and make sure they're only rewarded once.
- Introduce a cooldown period before an inviter can submit another referral.
- Monitor unusual activity and implement corrective measures like banning users or canceling rewards.

```lua
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

-- Create or get the datastore for referrals
local referralDataStore = DataStoreService:GetDataStore("ReferralDataStore")

-- Function to check and mark referral
local function onPlayerAdded(player)
    local joinData = player:GetJoinData()
    local referredByPlayerId = joinData.ReferredByPlayerId

    -- Load player's referral data
    local success, alreadyReferred = pcall(function()
        return referralDataStore:GetAsync(tostring(player.UserId))
    end)

    if not success then
        warn("Failed to get referral data for player:", player.UserId)
        return
    end

    if referredByPlayerId and referredByPlayerId ~= 0 and not alreadyReferred then
        -- Reward inviter and invitee
        rewardReferrer(referredByPlayerId)
        rewardInvitee(player)

        -- Mark the player as referred in DataStore
        local saveSuccess, err = pcall(function()
            referralDataStore:SetAsync(tostring(player.UserId), true)
        end)

        if not saveSuccess then
            warn("Failed to save referral status for player:", player.UserId, err)
        end
    end
end

-- Connect the function to the player joining
Players.PlayerAdded:Connect(onPlayerAdded)
```

## Frequently asked questions

**Which games are eligible to use this feature?**

This feature is open to any game that has been live for at least one day and that doesn't violate the [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards).

**Which players can take advantage of referrals?**

All players are eligible to earn rewards through referrals.

**Is the invite restricted to a player's friends on Roblox?**

No, players can send an invite to friends they aren't connected with on the Roblox platform yet.

**Does the referral link expire?**

The link never expires.

**How can I get the most out of this feature?**

You can add an in-game button to advertise the referral system to encourage players to take advantage of referrals. You can then give the button a descriptive title and connect the button click event to the friend invite modal where players can see the reward banner.

---
*Source: [Friend referral system](https://create.roblox.com/docs/production/promotion/referral-system) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
