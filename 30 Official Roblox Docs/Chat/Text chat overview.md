---
title: "Text chat overview"
description: "TextChatService lets players communicate with each other using text-based messages in live sessions."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/in-experience-text-chat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*TextChatService lets players communicate with each other using text-based messages in live sessions.*

Roblox offers text-based messaging between players in live sessions through [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], a singleton class responsible for managing the overall chat system, including chat message filtering, moderation, and user permissions. This service has its standard functionality and also provides a set of methods and events for extending and customizing chat, such as delivering messages based on [[30 Official Roblox Docs/Chat/Text chat overview#Conditionally deliver messages|customized requirements]], adding special permissions or moderation to specific players, and creating [[30 Official Roblox Docs/Chat/Examples/Custom text chat commands|custom commands]] to execute specific actions.

> [!warning]
> When [[30 Official Roblox Docs/Chat/Platform-integrated chat|platform-integrated chat]] is enabled, custom chat must use Roblox's native systems, and message content isn't accessible in code.

## UI configuration

[[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] provides a default UI that can be customized to fit your game's needs. Disable any of these configurations to hide its associated UI element. If desired, you can also replace these UI elements with custom interfaces:

- [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration|ChatInputBarConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]]

For more information, see [[30 Official Roblox Docs/Chat/Customize the chat window|Chat window]] and [[30 Official Roblox Docs/Chat/Customize bubble chat|Bubble chat]].

## Channels, messages, and commands

- [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] — Text channels pass user-sent messages from the client to the server, which then displays them to other users based on permissions. Text channels must be parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] in order to function.

  > [!info]
  > If [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|TextChatService.CreateDefaultTextChannels]] is set to `true`, the service automatically creates two text channels, `RBXGeneral` and `RBXSystem`. You can manually create additional [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] instances and parent them to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], as well.

  > [!warning]
  > Having multiple [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] with the same name can cause unintended behavior with the default [[30 Official Roblox Docs/Chat/Customize the chat window|chat window]].

- [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] — A user in a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]. Text sources are directly parented to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#AddUserAsync|AddUserAsync()]] is called. Text sources contains detailed permissions of a user in the channel, such as their ability to send messages. If a single user is in multiple text channels, they are associated with multiple text sources.

- [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] — A message in a text channel. Chat messages contain basic information such as the sender of the message, the original message, the filtered message, and the creation timestamp.

- [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] — Lets users invoke specific actions or behaviors by sending messages that match the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] or [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]] properties. Chat commands must be parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] in order to function.

  > [!info]
  > If [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultCommands|TextChatService.CreateDefaultCommands]] is set to `true`, default chat commands will be created automatically. You can manually create additional [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] instances and parent them to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], as well.

## Chat flowchart

Text chat uses the [[30 Official Roblox Docs/Projects/Client-server runtime|client‑server]] model, with a **sending client**, the **server**, and **receiving clients**.

*(image in the full Top G Vault)*

1. A player sends a message from their local device, triggering the [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] method. This method processes the message and determines whether it's a chat command or a regular chat message.

   - If the message is a chat command, it fires the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered|TextChatCommand.Triggered]] event to perform the defined action. No further steps are required.

   - If the message is a regular chat message, it fires the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#SendingMessage|TextChatService.SendingMessage]] event to display the message to the sender on the sending client. At the same time, [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] passes the message to the server.

1. The server fires [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback|TextChannel.ShouldDeliverCallback]] to determine whether to deliver the message to other players based on permissions and Roblox community filtering requirements.

1. If [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback|TextChannel.ShouldDeliverCallback]] determines that message is eligible to deliver to other players, the server applies any filters and fires [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] twice:

   1. The first time is on the sending client and signals that the server is processing the message through the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]] event. This event replaces the local message on the sending client with the processed message from the server. The message is identical if the original didn't require filtering.

   2. The second time is on the receiving clients, which triggers the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]] event to display the message to other players.

## Text chat hooks and callbacks

The [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] API encourages a clear separation on the appearance and delivery of chat messages. Multiple instances of the text chat system provide hooks and callbacks to format in centralized, clear locations.

> [!warning]
> All callbacks are expected to be non-yielding functions. Yielding or waiting for a response in a callback blocks the chat system and can cause unexpected behavior.

*(image in the full Top G Vault)*

| Callback                                  | Return Value                        |
| ----------------------------------------- | ----------------------------------- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback\|TextChannel.ShouldDeliverCallback]] | boolean                             |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage\|TextChatService.OnIncomingMessage]] | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties\|TextChatMessageProperties]]   |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage\|TextChannel.OnIncomingMessage]]     | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties\|TextChatMessageProperties]]   |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded\|TextChatService.OnBubbleAdded]]     | [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties\|BubbleChatMessageProperties]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded\|TextChatService.OnChatWindowAdded]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] |

### Conditionally deliver messages

The [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback|TextChannel.ShouldDeliverCallback]] callback should be defined on the server only. The callback is fired for each [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] child of the text channel when a message is sent to determine whether the message should be delivered. This callback can be used to implement custom message delivery logic that may depend on additional gameplay context, such as:

- [[30 Official Roblox Docs/Chat/Examples/Proximity-based chat|Proximity-based chat]] where users can only send messages to those close to them.
- Preventing users with certain attributes from sending messages to others.

### Customize message display

The default [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] UI relies on [[30 Official Roblox Docs/UI/Rich text markup|rich text]] to format and customize how messages are displayed. You can use the following callbacks to format messages before they are displayed to users, for example to add colors or [[30 Official Roblox Docs/Chat/Examples/Assign chat tags|chat tags]] to user names or format message content.

The following callbacks are called on every [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] that is about to be displayed, which lets you customize chat window appearance based on the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]], [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]], or [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] content. When a client sends a message, these callbacks are called once when the message is sent to the server and the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Status|TextChatMessage.Status]] value will be [[30 Official Roblox Docs/API Reference/Enums/TextChatMessageStatus|Enum.TextChatMessageStatus.Sending]]. Once the message is received by the server and is being delivered to other users, the sender client receives the message again with an updated [[30 Official Roblox Docs/API Reference/Enums/TextChatMessageStatus|Enum.TextChatMessageStatus]] value.

- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] — This callback should be defined on the client only. The callback is fired when a message is received, either from the server or if the local client has just sent a message. The callback is called on every [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] received from all [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] instances and is the first to process the message before it is displayed to the user.
- [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] — This callback should be defined on the client only. The callback is fired when a message is received from the server. The callback is called on every [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] received from the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]. Default [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] instances created from [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|TextChatService.CreateDefaultTextChannels]] have this callback defined and can be overwritten.
- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded|TextChatService.OnBubbleAdded]] — This callback should be defined on the client only. Use it to customize the appearance of chat bubbles independent of the appearance of the message in the chat window UI.
- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|TextChatService.OnChatWindowAdded]] — This callback should be defined on the client only. Use it to customize the appearance of chat messages in the chat window UI independent of the appearance of the message in chat bubbles.

## Migrate from legacy chat

This section assists you in migrating from the legacy chat system by providing alternative methods for implementing common chat functionalities and behaviors using [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, find the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#ChatVersion|ChatVersion]] dropdown and select [[30 Official Roblox Docs/API Reference/Enums/ChatVersion|TextChatService]].

   *(image in the full Top G Vault)*

### Basic functionalities

Though both systems share the same basic chat functionalities, [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] implementations are in general more sustainable and easier to iterate on.

| Functionality | Legacy chat | TextChatService | Differences |
| --- | --- | --- | --- |
| Send a chat message | [[30 Official Roblox Docs/API Reference/Classes/Players#Chat\|Players:Chat()]] | [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] | The [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|SendAsync()]] method supports more advanced chat features, such as rich text formatting and message priority. It also includes built-in filtering to help prevent inappropriate messages from being sent. |
| Implement messaging callbacks | [[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback\|Chat:InvokeChatCallback()]]<br>[[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback\|Chat:RegisterChatCallback()]] | [[30 Official Roblox Docs/API Reference/Classes/TextChatService#SendingMessage\|TextChatService.SendingMessage]]<br>[[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage\|TextChatService.OnIncomingMessage]] | The legacy chat system binds a function to chat system events for delivering messages. The two methods of `TextChatService` offer better flexibility and customization. |
| Add custom chat commands | `ChatService/ChatCommand` module | [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]] | `TextChatService` has a dedicated class for text commands rather than using a legacy chat module. |
| Display a system message | [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCore\|StarterGui:SetCore()]] using `ChatMakeSystemMessage` | [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage\|TextChannel:DisplaySystemMessage()]] | The [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage\|TextChannel.OnIncomingMessage]] callback can return a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties\|TextChatMessageProperties]] instance to customize the message appearance. |
| Disable chat | `ChatWindow/ChatSettings` module for hiding the chat window | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#Enabled\|ChatWindowConfiguration.Enabled]] |  |

### Message filtering

[[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] automatically filters chat messages based on each player's account information, so you don't need to manually implement text filtering for all kinds of chat messages.

| Functionality | Legacy chat | TextChatService |
| --- | --- | --- |
| Filter chat message for individual player | [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringAsync\|Chat:FilterStringAsync()]] | Automatic |
| Filter broadcasting messages | [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringForBroadcast\|Chat:FilterStringForBroadcast()]] | Automatic |

### Window and bubble chat

Both the [[30 Official Roblox Docs/Chat/Customize the chat window|chat window]] and [[30 Official Roblox Docs/Chat/Customize bubble chat|bubble chat]] behavior and customization options of [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] are identical to those of the legacy chat system. As the legacy chat system only allows customization using chat modules or the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] container, the service provides dedicated classes ([[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] and [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]]) to manage all chat window and bubble chat properties. Additionally, you can easily adjust and preview your bubble chat appearance and behavior properties using Studio settings instead of having to script them all.

| Functionality | Legacy chat | TextChatService |
| --- | --- | --- |
| Enable Chat Window | [[30 Official Roblox Docs/API Reference/Classes/Chat#LoadDefaultChat\|Chat.LoadDefaultChat]]<br>[[30 Official Roblox Docs/API Reference/Classes/Players#ClassicChat\|Players.ClassicChat]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#Enabled\|ChatWindowConfiguration.Enabled]] |
| Enable Bubble Chat | [[30 Official Roblox Docs/API Reference/Classes/Chat#BubbleChatEnabled\|Chat.BubbleChatEnabled]]<br>[[30 Official Roblox Docs/API Reference/Classes/Players#BubbleChat\|Players.BubbleChat]] | [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Enabled\|BubbleChatConfiguration.Enabled]] |
| Set Chat Window Properties | [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle\|Players:SetChatStyle()]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration\|ChatWindowConfiguration]] |
| Set Bubble Chat Properties | [[30 Official Roblox Docs/API Reference/Classes/Chat#SetBubbleChatSettings\|Chat:SetBubbleChatSettings()]]<br>[[30 Official Roblox Docs/API Reference/Classes/Chat\|Chat.BubbleChatSettingsChanged()]]<br>[[30 Official Roblox Docs/API Reference/Classes/Players#BubbleChat\|Players.BubbleChat]]<br>[[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle\|Players:SetChatStyle()]] | [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration\|BubbleChatConfiguration]] |
| Enable NPC Bubbles | [[30 Official Roblox Docs/API Reference/Classes/Chat#Chat\|Chat:Chat()]] | [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble\|TextChatService:DisplayBubble()]] |

### Migrate speaker "extra data"

The legacy Lua chat system allowed developers to use `SetExtraData` on the `Speaker` class. This data was used to format the name color, chat color, or to apply name tags for a given speaker.

```lua title="Legacy Chat System SetExtraData"
-- An example of setting extra data on a speaker in the legacy chat system
ChatService.SpeakerAdded:Connect(function(playerName)
	local speaker = ChatService:GetSpeaker(playerName)
	speaker:SetExtraData("NameColor", Color3.fromRGB(255, 255, 55))
	speaker:SetExtraData("ChatColor", Color3.fromRGB(212, 175, 55))
	speaker:SetExtraData("Tags", {{TagText = "YourTagName", TagColor = Color3.fromRGB(0, 255, 0)}, {TagText = "OtherTagName", TagColor = Color3.fromRGB(255, 0, 0)}})
end)
```

[[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] does not have a direct equivalent to `SetExtraData`. Instead, use [[30 Official Roblox Docs/Chat/Text chat overview#Text chat hooks and callbacks|callbacks]] such as [[30 Official Roblox Docs/API Reference/Classes/TextChatService|OnWindowAdded]] to customize the appearance of messages using rich text based on the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] of the message.

The following is an example of emulating legacy Lua chat's "extra data" by accessing attributes on [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects:

```lua title="TextChatService SetAttributes"
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player:SetAttribute("NameColor", Color3.fromRGB(255, 255, 55))
	player:SetAttribute("ChatColor", Color3.fromRGB(212, 175, 55))
	player:SetAttribute("isYourTag", true)
	player:SetAttribute("isOtherTag", true)
end)
```

Then you can use the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|OnChatWindowAdded]] callback to customize the appearance of the chat window based on the attributes set on the player:

```lua title="TextChatService OnChatWindowAdded"
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

TextChatService.OnChatWindowAdded = function(textChatMessage)
	local textSource = textChatMessage.TextSource
	if textSource then
		local player = Players:GetPlayerByUserId(textSource.UserId)
		if player then
			local overrideProperties = TextChatService.ChatWindowConfiguration:DeriveNewMessageProperties()
			overrideProperties.PrefixText = textChatMessage.PrefixText
			overrideProperties.Text = textChatMessage.Text

			local nameColor = player:GetAttribute("NameColor")
			if nameColor and typeof(nameColor) == "Color3" then
				overrideProperties.PrefixTextProperties.TextColor3 = nameColor
			end

			local chatColor = player:GetAttribute("ChatColor")
			if chatColor and typeof(chatColor) == "Color3" then
				overrideProperties.TextColor3 = chatColor
			end

			local isYourTag = player:GetAttribute("isYourTag")
			if isYourTag == true then
				overrideProperties.PrefixText = `<font color='rgb(0, 255, 0)'>[YourTag]</font> {overrideProperties.PrefixText}`
			end

			local isOtherTag = player:GetAttribute("isOtherTag")
			if isOtherTag == true then
				overrideProperties.PrefixText = `<font color='rgb(255, 0, 0)'>[OtherTag]</font> {overrideProperties.PrefixText}`
			end

			return overrideProperties
		end
	end

	return nil
end
```

---
*Source: [Text chat overview](https://create.roblox.com/docs/chat/in-experience-text-chat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
