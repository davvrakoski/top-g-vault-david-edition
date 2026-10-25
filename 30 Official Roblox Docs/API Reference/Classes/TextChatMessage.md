---
title: "TextChatMessage"
description: "A data object representing a text chat message."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChatMessage"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A data object representing a text chat message.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

A data object representing a text chat message.

To learn more about using TextChatMessages, see [[30 Official Roblox Docs/Chat/Text chat overview|In-Experience Text Chat]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#BubbleChatMessageProperties\|BubbleChatMessageProperties]] | [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties\|BubbleChatMessageProperties]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties\|BubbleChatMessageProperties]] that overrides the appearance of this message's chat bubble. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#ChatWindowMessageProperties\|ChatWindowMessageProperties]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] that overrides the appearance of this message in the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#MessageId\|MessageId]] | string | A unique identifier for the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Metadata\|Metadata]] | string | A general purpose field for storing miscellaneous data about the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|PrefixText]] | string | A prefix to add to a user's message. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Status\|Status]] | [[30 Official Roblox Docs/API Reference/Enums/TextChatMessageStatus\|TextChatMessageStatus]] | Indicates the status of the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text\|Text]] | string | The filtered text message for the user. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#TextChannel\|TextChannel]] | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] | A reference to the origin [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#TextSource\|TextSource]] | [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] | A reference to the origin [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Timestamp\|Timestamp]] | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | A timestamp of when the message was originally sent. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Translation\|Translation]] | string | Translated and filtered text message. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BubbleChatMessageProperties

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

A reference to the [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]] instance that overrides [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] properties for this individual message's chat bubble.

This property is `nil` by default. It is populated when your [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded|TextChatService.OnBubbleAdded]] callback returns a [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]] instance: the returned instance is stored here on the resulting [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]]. Any properties set on it take precedence over the shared [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] when the message's bubble is rendered.

### ChatWindowMessageProperties

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

A reference to the [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] instance that overrides [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] properties for this individual message as displayed in the chat window.

This property is `nil` by default. It is populated when your [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|TextChatService.OnChatWindowAdded]] callback returns a [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] instance, typically created with [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#DeriveNewMessageProperties|ChatWindowConfiguration:DeriveNewMessageProperties()]]: the returned instance is stored here on the resulting [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]]. Any properties set on it take precedence over the shared [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] when the message is rendered.

### MessageId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

A unique identifier for the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]].

### Metadata

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

A general purpose field for storing miscellaneous data about the `TextChatMessage`. The second argument of [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage|TextChannel:DisplaySystemMessage()]] is used to populate this field.

Use this field to apply additional formatting for special messages within [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] and [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks.

```lua
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local customChannel: TextChannel = Instance.new("TextChannel")
customChannel.Parent = TextChatService:WaitForChild("TextChannels")

customChannel.OnIncomingMessage = function(message: TextChatMessage)
  if string.find(message.Metadata, "Error") then
    local overrideProperties = Instance.new("TextChatMessageProperties")
    overrideProperties.Text = string.format("<font color='rgb(255,0,0)'>%s</font>", message.Text)
    return overrideProperties
  elseif string.find(message.Metadata, "Info") then
    local overrideProperties = Instance.new("TextChatMessageProperties")
    overrideProperties.Text = string.format("<font color='rgb(0, 255, 150)'>%s</font>", message.Text)
    return overrideProperties
  end

  return nil
end

Players.LocalPlayer.CharacterAdded:Connect(function()
  customChannel:DisplaySystemMessage("This is an error!", "Game.Error.Generic")
  customChannel:DisplaySystemMessage("Could not find save data!", "Game.Error.SaveDataNotFound")

  customChannel:DisplaySystemMessage("You won the game!", "Game.Info.Win")
  customChannel:DisplaySystemMessage("You lost the game!", "Game.Info.Lose")
end)
```

As follows is a reference of the default system messages emitted by the chat system:

| Metadata | Description |
| --- | --- |
| `Roblox.ChatTranslation.ChatWindow.SystemMessage` | Indicates that the system may translate chat messages for the player. |
| `Roblox.Notification.Friend.Joined` | Displayed when one of the player's friends join the experience. |
| `Roblox.MessageStatus.Warning.Floodchecked` | Displayed when the player's sent message was rate limited by the server. |
| `Roblox.MessageStatus.Warning.TextFilterFailed` | Displayed when the player's sent message could not be displayed due to a text filtering issue. |
| `Roblox.MessageStatus.Warning.InvalidPrivacySettings` | Displayed when the player's privacy settings prevent them from sending a message. |
| `Roblox.MessageStatus.Warning.MessageTooLong` | Displayed when the player sends a message with content that is too long. |
| `Roblox.MessageStatus.Warning.Unknown` | Displays when the system fails to send the player's message for an unknown reason. |
| `Roblox.Help.Info` | Displays the response from the `RBXHelpCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Version.Info` | Displays the response from the `RBXVersionCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Team.Success.NowInTeam` | Displayed when the player's team changes. |
| `Roblox.Team.Error.CannotTeamChatIfNotInTeam` | Displayed when the player triggers the `RBXTeamCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]] without being on a [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. |
| `Roblox.Whisper.Info.Success` | Displayed when the player successfully starts a whisper conversation. |
| `Roblox.Whisper.Welcome.Sent` | Displayed when entering a whisper [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| `Roblox.Whisper.Error.CannotWhisperToSelf` | An error response from the `RBXWhisperCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Whisper.Error.TargetDoesNotExist` | An error response from the `RBXWhisperCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Whisper.Error.TooManyMatches` | An error response from the `RBXWhisperCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Whisper.Error.Unknown` | An error response from the `RBXWhisperCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.DoesNotExist` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.UserEmotesNotEnabled` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.TemporarilyUnavailable` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.NotSupported` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.SwitchToR15` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Emote.Error.AnimationPlaying` | An error response from the `RBXEmoteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Mute.Error.PlayerNotFound` | An error response from the `RBXMuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Mute.Error.MultipleMatches` | An error response from the `RBXMuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Mute.Error.CannotMuteSelf` | An error response from the `RBXMuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Mute.Info.Success` | An success response from the `RBXMuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Unmute.Error.PlayerNotFound` | An error response from the `RBXUnmuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Unmute.Error.MultipleMatches` | An error response from the `RBXUnmuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Unmute.Error.CannotMuteSelf` | An error response from the `RBXUnmuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| `Roblox.Unmute.Info.Success` | An success response from the `RBXUnmuteCommand` [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |

### PrefixText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

A prefix to add to a user's message. This supports Rich Text, so developers can set custom properties for this text to support chat tags.

By default, [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText|TextChatMessage.PrefixText]] is the name of the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]], which is the [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|Player.DisplayName]] of the user associated with the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] via [[30 Official Roblox Docs/API Reference/Classes/TextSource#UserId|TextSource.UserId]].

### Status

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextChatMessageStatus|TextChatMessageStatus]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

Indicates the status of the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]].

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

The filtered text message for the user. Different users may receive different strings from this property based on filtering rules. It can be an empty string.

### TextChannel

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

A reference to the origin [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]].

### TextSource

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

A reference to the origin [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]].

### Timestamp

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

A timestamp of when the message was originally sent.

### Translation

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

Represents translated and filtered text messages based on users' localization settings. The system doesn't translate messages between users with the same localization settings or using languages without the text filter support, so this property can be an empty string if no translation happens. For customization, see [[30 Official Roblox Docs/Chat/Customize the chat window|Customizing Translated Messages]].

---
*Source: [TextChatMessage](https://create.roblox.com/docs/reference/engine/classes/TextChatMessage) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
