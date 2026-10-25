---
title: "Player invite prompts"
description: "Invite prompts are prompts sent to the player of a game to invite their friends to join them."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/promotion/invite-prompts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Invite prompts are prompts sent to the player of a game to invite their friends to join them.*

In addition to common [[30 Official Roblox Docs/Production/Promotion/Promotion|promotion]] methods for increasing your player base, you can implement **invite prompts** directly inside your game, encouraging players to invite their friends and increase co-experience gameplay.

The invite prompt system features the following:

- **Dynamic Invitees** — Prompt players to invite multiple friends from a selection list, or invite one specific friend.
- **Launch Data** — Include optional [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Include launch data|launch data]] that can be read through [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] when the invited friend joins. Example use cases include routing invited friends to a coordinate location or personalizing the joining game for the invitee.
- **Customizable Text** — Customize the [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Prompt an invite|invite prompt]] message and the [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Set notification options|notification]] message. For example, an invite prompt for the player may read "Ask your friends to join the adventure!" and the notification message for the invited friend(s) may read "{displayName} wants you to join their adventure in {experienceName}!".

You can also track and reward inviters and invitees using the [[30 Official Roblox Docs/Production/Promotion/Friend referral system|Friend Invite Reward System]].

### In-experience prompt

*(image in the full Top G Vault)*

### Invite notification

*(image in the full Top G Vault)*

*Notification in Roblox app*

*(image in the full Top G Vault)*

*Notification on phone lock screen*

## Set invite options

By default, an invite prompt for the player shows a menu of their friends with **Invite** buttons. To customize the prompt message, target a specific friend, or include launch data in the invite, you'll need to set up an [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions|ExperienceInviteOptions]] object with the desired properties.

| Property | Type | Description |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#PromptMessage\|PromptMessage]] | string | Custom text shown on the invite prompt for the sending player, for example "Ask your friends to join the adventure!" for a multi-friend invite prompt, or "Invite this friend to join the adventure!" for a specific friend invite prompt. Note that if your custom invite prompt message is long enough to overflow the bounds of the UI, it will not be shown. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#InviteUser\|InviteUser]] | number | Roblox [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the specific friend to invite; if not provided, the player will be prompted to pick from a list of friends. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#InviteMessageId\|InviteMessageId]] | string | Asset ID that maps to a **Notification** asset type. This asset is used to store/localize a custom string for the invite notification that friends receive. See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Set notification options\|Setting Notification Options]] for details. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#LaunchData\|LaunchData]] | string | Used to set a parameter in [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData\|Player:GetJoinData()]] when a friend joins from the invite notification. Maximum of 200 characters. See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Include launch data\|Include launch data]] for a usage example. |

### Multiple friends

```lua title="LocalScript - Invite Multiple Friends" highlight="7-8"
local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Construct invite options with a custom prompt message
local inviteOptions = Instance.new("ExperienceInviteOptions")
inviteOptions.PromptMessage = "Ask your friends to join the adventure!"
```

### Specific friend

```lua title="LocalScript - Invite Specific Friend" highlight="5,8-10"
local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local receiverUserID = 505306092

-- Construct invite options with friend's user ID and a custom prompt message
local inviteOptions = Instance.new("ExperienceInviteOptions")
inviteOptions.InviteUser = receiverUserID
inviteOptions.PromptMessage = "Invite this friend to join the adventure!"
```

## Set notification options

By default, the invite notification that friends receive contains the sender's [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]], username, and the game name. To customize the message, you can create a **Notification** asset on the [Creator Dashboard](https://create.roblox.com/dashboard/creations) and include its asset ID as a parameter of [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions|ExperienceInviteOptions]].

1. Navigate to the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
1. Similar to [[30 Official Roblox Docs/Production/Publishing/Badges|badges]], notification strings are tied to a **specific game**. Locate that game's thumbnail and click on it.
1. In the left column, under **Engagement**, click **Notifications**.
1. In the center region, click the **Create a Notification String** button.
1. Fill in an identifier name (only visible to you) and the custom notification text. Note that you must include **{experienceName}** as a placeholder to identify the game's name for invited friends, and you can optionally include the sender's [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]] through the **{displayName}** placeholder.

   Example notification strings:

   - **{displayName} wants you to join their adventure in {experienceName}!**
   - **{displayName} just cleared the sixth stage of {experienceName}. Can you?**

1. When ready, click the **Create Notification String** button.
1. On the notifications page, in the table of notifications, click the **⋯** button in the **Actions** column and select **Copy Asset ID**.
1. In the [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions|ExperienceInviteOptions]] object for the invite prompt, paste the asset ID as the value of the [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#InviteMessageId|InviteMessageId]] property.

   ```lua title="LocalScript - Invite Multiple Friends" highlight="7,8"
   local SocialService = game:GetService("SocialService")
   local Players = game:GetService("Players")

   local player = Players.LocalPlayer

   -- Construct invite options with friend's user ID
   local inviteOptions = Instance.new("ExperienceInviteOptions")
   inviteOptions.InviteMessageId = "ef0e0790-e2e8-4441-9a32-93f3a5783bf1"
   ```

## Prompt an invite

To prompt an invite, you should first determine whether the player **can** send an invite, as the ability may vary depending on the platform or player. Once confirmed, you can display the invitation prompt to the player.

1. Call [[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendGameInviteAsync|SocialService:CanSendGameInviteAsync()]], wrapped in a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] since it's an asynchronous network call that may occasionally fail.
1. If the invite ability is confirmed, call [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite|SocialService:PromptGameInvite()]] with the optional [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Set invite options|invite options object]] as the second argument.

Once prompted, the player will see an on-screen prompt to invite multiple friends, or the specific friend defined in the [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Set invite options|invite options object]]. When the player then clicks the **Invite** button for one or more friends, those friends will receive a notification containing the sender's [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]], username, and the experience name. Notifications may be further customized as outlined in [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Set notification options|Set notification options]].

### Multiple Friends

```lua title="LocalScript - Invite Multiple Friends" highlight="8-10,16-18"
local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Function to check whether the player can send an invite
local function canSendGameInvite(sendingPlayer)
	local success, canSend = pcall(function()
		return SocialService:CanSendGameInviteAsync(sendingPlayer)
	end)
	return success and canSend
end

local canInvite = canSendGameInvite(player)
if canInvite then
	SocialService:PromptGameInvite(player)
end
```

### Specific Friend

```lua title="LocalScript - Invite Specific Friend" highlight="5,8,9,13-15,21-23"
local SocialService = game:GetService("SocialService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local receiverUserID = 505306092

-- Construct invite options with friend's user ID
local inviteOptions = Instance.new("ExperienceInviteOptions")
inviteOptions.InviteUser = receiverUserID

-- Function to check whether the player can send an invite
local function canSendGameInvite(sendingPlayer)
	local success, canSend = pcall(function()
		return SocialService:CanSendGameInviteAsync(sendingPlayer, receiverUserID)
	end)
	return success and canSend
end

local canInvite = canSendGameInvite(player)
if canInvite then
	SocialService:PromptGameInvite(player, inviteOptions)
end
```

## Include launch data

To further improve in-experience cooperation or to incentivize player invites, you can include **launch data** in an invite prompt, useful for scenarios such as routing invited friends to a coordinate location or personalizing the joining game for the invitee.

1. When [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Prompt an invite|prompting an invite]], include an [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions|ExperienceInviteOptions]] object with relevant data that will be used when the friend joins the game, for example the sender's [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]], the ID of a [[30 Official Roblox Docs/Production/Publishing/Badges|badge]] to award to the friend upon joining, or a coordinate location to spawn the friend at. If you need to compile multiple pieces of data, encode the data using [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONEncode|JSONEncode()]].

   ### Multiple Friends

   ```lua title="LocalScript - Invite Multiple Friends" highlight="1,7-11,14-15,27-29"
   local HttpService = game:GetService("HttpService")
   local SocialService = game:GetService("SocialService")
   local Players = game:GetService("Players")

   local player = Players.LocalPlayer

   local data = {
   	senderUserID = player.UserId,
   	spawnLocation = {12, 48, 205.5}
   }

   local launchData = HttpService:JSONEncode(data)

   -- Construct invite options with launch data
   local inviteOptions = Instance.new("ExperienceInviteOptions")
   inviteOptions.LaunchData = launchData

   -- Function to check whether the player can send an invite
   local function canSendGameInvite(sendingPlayer)
   	local success, canSend = pcall(function()
   		return SocialService:CanSendGameInviteAsync(sendingPlayer)
   	end)
   	return success and canSend
   end

   local canInvite = canSendGameInvite(player)
   if canInvite then
   	SocialService:PromptGameInvite(player, inviteOptions)
   end
   ```

   ### Specific Friend

   ```lua title="LocalScript - Invite Specific Friend" highlight="1,6,8-12,15-17,29-31"
   local HttpService = game:GetService("HttpService")
   local SocialService = game:GetService("SocialService")
   local Players = game:GetService("Players")

   local player = Players.LocalPlayer
   local receiverUserID = 505306092

   local data = {
   	senderUserID = player.UserId,
   	spawnLocation = {12, 48, 205.5}
   }

   local launchData = HttpService:JSONEncode(data)

   -- Construct invite options with friend's user ID and launch data
   local inviteOptions = Instance.new("ExperienceInviteOptions")
   inviteOptions.InviteUser = receiverUserID
   inviteOptions.LaunchData = launchData

   -- Function to check whether the player can send an invite
   local function canSendGameInvite(sendingPlayer)
   	local success, canSend = pcall(function()
   		return SocialService:CanSendGameInviteAsync(sendingPlayer, receiverUserID)
   	end)
   	return success and canSend
   end

   local canInvite = canSendGameInvite(player)
   if canInvite then
   	SocialService:PromptGameInvite(player, inviteOptions)
   end
   ```

   > [!warning]
   > Always remember to include `inviteOptions` containing the launch data (maximum of 200 characters) as the second parameter of [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite|PromptGameInvite()]].

1. For incoming friends who join via the notification, check for launch data on the server side through [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]]. If you encode multiple pieces of data into JSON for the invite prompt, remember to decode it with [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONDecode|JSONDecode()]].

   ```lua title="Script - Using Invite Launch Data" highlight="1,5-6,8-10"
   local HttpService = game:GetService("HttpService")
   local Players = game:GetService("Players")

   local ATTEMPT_LIMIT = 10
   local RETRY_DELAY = 1

   local function onPlayerAdded(player)
   	local launchData

   	for _ = 1, ATTEMPT_LIMIT do
   		task.wait(RETRY_DELAY)
   		local joinData = player:GetJoinData()
   		if joinData.LaunchData ~= "" then
   			launchData = joinData.LaunchData
   			break
   		end
   	end

   	if launchData then
   		local data = HttpService:JSONDecode(launchData)
   		print(data.senderUserID)
   		print(data.spawnLocation)
   	else
   		warn("No launch data received!")
   	end
   end

   Players.PlayerAdded:Connect(onPlayerAdded)
   ```

   > [!info]
   > Launch data can take a few seconds to appear after the friend joins from the invite. As shown in the code sample above, it's recommended that you wait until the launch data arrives before attempting to use it.

1. If the launch data exists, you can use it for a wide variety of design scenarios, including:

   - Spawn the incoming friend at the beginning of a challenging obstacle course that the sender just completed, based on a coordinate location passed through the launch data.
   - Check if the **sender** is in the place, based on their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] in the launch data, and teleport the friend's character near their character.

---
*Source: [Player invite prompts](https://create.roblox.com/docs/production/promotion/invite-prompts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
