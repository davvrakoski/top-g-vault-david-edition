---
title: "Customize the chat window"
description: "Customize the chat window and message UI of your in-game text chat."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/chat-window"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Customize the chat window and message UI of your in-game text chat.*

The [[30 Official Roblox Docs/Chat/Text chat overview|in-game text chat]] system, powered by [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], allows players to easily communicate and socialize with each other in live games. In addition to supporting the default text chat, you can [[30 Official Roblox Docs/Chat/Customize the chat window#Chat window configuration|customize]] the front‑end user interface.

## Chat window configuration

The overall chat window consists of:

- Chat window
- Input bar
- Channel tabs (optional)

*(image in the full Top G Vault)*

The channel tabs are disabled by default and each component can be toggled on and off in Studio or through scripting:

### Studio

In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, expand the [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] branch and select [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration|ChatInputBarConfiguration]], or [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]]. Then enable or disable the component in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*

### Scripting

From a client script within [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], enable each component as desired:

```lua title="Client Script"
local TextChatService = game:GetService("TextChatService")

local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")

-- Enable chat window
if ChatWindowConfiguration then
	ChatWindowConfiguration.Enabled = true
end
-- Enable input bar
if ChatInputBarConfiguration then
	ChatInputBarConfiguration.Enabled = true
end
-- Enable channel tabs
if ChannelTabsConfiguration then
	ChannelTabsConfiguration.Enabled = true
end
```

When [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]] is enabled, each default [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] appears in a tab as outlined in the following table. In addition, each custom [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] creates a tab corresponding to the channel's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] property.

| Default channel | Tab name |
| --- | --- |
| `RBXGeneral` | **General** |
| `RBXSystem` | **General** (combined into a single tab with `RBXGeneral`) |
| `RBXTeam` | **Team** |
| `RBXWhisper` | User name of the other player |

### Window appearance

Appearance of the overall chat window is customizable through [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]].

*(image in the full Top G Vault)*

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] background color of the chat window. | `[25, 27, 29]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#BackgroundTransparency\|BackgroundTransparency]] | Transparency of the chat window's background. | `0.3` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#Enabled\|Enabled]] | Whether to show the default chat window. Set to `false` to hide. | `true` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of chat window text. | [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansMedium]] |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of chat window text. | `[255, 255, 255]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextSize\|TextSize]] | Size of chat window text. | `14` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of the stroke for chat window text. | `[0, 0, 0]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | Transparency of the stroke for chat window text. | `0.5` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#HorizontalAlignment\|HorizontalAlignment]] | Horizontal alignment of the chat window. | [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment\|Left]] |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#VerticalAlignment\|VerticalAlignment]] | Vertical alignment of the chat window. | [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment\|Top]] |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#HeightScale\|HeightScale]] | Height scale of the chat window relative to the screen size. | `1` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#WidthScale\|WidthScale]] | Width scale of the chat window relative to the screen size. | `1` |

### Input bar appearance

Appearance of the chat input bar is customizable through [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration|ChatInputBarConfiguration]].

*(image in the full Top G Vault)*

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] background color of the chat input bar. | `[25, 27, 29]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#BackgroundTransparency\|BackgroundTransparency]] | Transparency of the chat input bar's background. | `0.2` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of chat input text. | [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansMedium]] |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#PlaceholderColor3\|PlaceholderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of placeholder chat input text. | `[178, 178, 178]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of player-entered chat input text. | `[255, 255, 255]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextSize\|TextSize]] | Size of chat input text. | `14` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] stroke color of chat input text. | `[0, 0, 0]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | Transparency of the stroke for chat input text. | `0.5` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AutocompleteEnabled\|AutocompleteEnabled]] | Whether the text chat system shows autocomplete options for emojis and [[30 Official Roblox Docs/Chat/Text chat overview\|commands]]. Emojis are autocompleted by typing `:` followed by non-whitespace characters, while commands are autocompleted by typing `/`. | `true` |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#KeyboardKeyCode\|KeyboardKeyCode]] | Additional key players can press to trigger focusing on the default chat input bar. | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Slash]] |

### Channel tabs appearance

Appearance of the **channel tabs** is customizable through [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]].

*(image in the full Top G Vault)*

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] background color of the channel tabs. | `[25, 27, 29]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#BackgroundTransparency\|BackgroundTransparency]] | Transparency of the channel tabs' background. | `0` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#HoverBackgroundColor3\|HoverBackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] background color of tabs when hovering over them. | `[125, 125, 125]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] for the text in channel tabs. | [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansBold]] |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of text in an unselected tab. | `[175, 175, 175]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#SelectedTabTextColor3\|SelectedTabTextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] of text in a selected tab. | `[255, 255, 255]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextSize\|TextSize]] | Size of the text in channel tabs. | `18` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] stroke color of the text in channel tabs. | `[0, 0, 0]` |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | Transparency of the stroke for text in channel tabs. | `1` |

## Customize messages

You can customize the appearance of chat message bodies and prefixes using [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|TextChatService.OnChatWindowAdded]] callbacks without overriding the existing UI. The customization options let you modify the appearance of chat messages to match your game's theme, and you can also sort or highlight messages from different user groups by coloring prefixes or adding [[30 Official Roblox Docs/Chat/Examples/Assign chat tags|chat tags]].

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|OnChatWindowAdded]] only affect the appearance of messages in the chat window. To customize chat bubbles, see [[30 Official Roblox Docs/Chat/Customize bubble chat|Bubble Chat]].

### Color user names

When a user sends a chat message, their [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]] displays as the prefix portion of the message. By default, each user's name is colored according to their [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] but you can change the colors of chat names using [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|OnChatWindowAdded]]. The following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] assigns a predetermined color to each user, picking randomly from a table of RGB colors.

*(image in the full Top G Vault)*

```lua title="LocalScript - Random User Name Colors"
local TextChatService = game:GetService("TextChatService")

local chatWindowConfiguration = TextChatService.ChatWindowConfiguration

local nameColors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(0, 0, 255),
	Color3.fromRGB(255, 255, 0),
}

TextChatService.OnChatWindowAdded = function(message: TextChatMessage)
	local properties = chatWindowConfiguration:DeriveNewMessageProperties()

	local textSource = message.TextSource
	if textSource then
		local index: number = (textSource.UserId % #nameColors) + 1
		local randomColor: Color3 = nameColors[index]

    	properties.PrefixTextProperties = chatWindowConfiguration:DeriveNewMessageProperties()
		properties.PrefixTextProperties.TextColor3 = randomColor
	end

	return properties
end
```

You can also apply color and transparency gradients to color message prefixes using [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]].

*(image in the full Top G Vault)*

```lua title="Gradient User Name Colors"
local TextChatService = game:GetService("TextChatService")

local chatWindowConfiguration = TextChatService.ChatWindowConfiguration

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}

TextChatService.OnChatWindowAdded = function(message: TextChatMessage)
	local properties = chatWindowConfiguration:DeriveNewMessageProperties()

	local textSource = message.TextSource
	if textSource then
    	properties.PrefixTextProperties = chatWindowConfiguration:DeriveNewMessageProperties()
		gradient:Clone().Parent = properties.PrefixTextProperties
	end

	return properties
end
```

### Rich text customization

Rich text [[30 Official Roblox Docs/UI/Rich text markup#Supported tags|font color tags]] can be used to format chat messages, helpful if you want to apply formatting to very specific parts of the message. Note that rich text does not support gradients, but the following code sample shows how you can move the user name (stored in [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText|TextChatMessage.PrefixText]]) into the message body and then apply rich text tagging to only the name portion.

*(image in the full Top G Vault)*

```lua title="Rich Text Customization"
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local chatWindowConfiguration = TextChatService.ChatWindowConfiguration

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}

TextChatService.OnChatWindowAdded = function(message: TextChatMessage)
	local properties = chatWindowConfiguration:DeriveNewMessageProperties()

	if message.TextSource then
		properties.PrefixText = "[VIP]"
		properties.Text = string.format("<font color='#00ffff'>%s</font>", message.PrefixText) .. " " .. message.Text

		properties.PrefixTextProperties = chatWindowConfiguration:DeriveNewMessageProperties()
		gradient:Clone().Parent = properties.PrefixTextProperties
	end

	return properties
end
```

## Messages from non‑player sources

When [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|TextChatService.CreateDefaultTextChannels]] is `true`, one of the default text channels is the `RBXSystem` channel. The default chat scripts automatically display system messages in this channel. You can customize the appearance of these messages using the [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callback.

You might want to customize or alter the system messages that are automatically emitted by the chat system. Since the default system messages are localized for users, you should reference them by [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Metadata|TextChatMessage.Metadata]] in your [[30 Official Roblox Docs/Chat/Text chat overview#Text chat hooks and callbacks|text chat callbacks]] if you wish to customize their appearance. For example, you could use [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Metadata|Metadata]] to identify system messages, error messages, or messages from specific systems in your game.

### System

To deliver a system message to the local player, such as "speech" from a public address system, call [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage|DisplaySystemMessage()]] from the default `RBXGeneral` channel with a prefix before the player's display name.

```lua title="Client Script"
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local generalChannel: TextChannel = TextChatService:WaitForChild("TextChannels").RBXGeneral

local PREFIX = "[Guide] Welcome "

-- Send "system message" to player with their display name appended
generalChannel:DisplaySystemMessage(PREFIX .. player.DisplayName)
```

*(image in the full Top G Vault)*

### NPC/object

You can also stylize non-player dialogue and add [[30 Official Roblox Docs/Chat/Customize bubble chat|chat bubbles]] to make it appear like messages are coming from an NPC or object within the 3D world.

```lua title="Client Script"
local TextChatService = game:GetService("TextChatService")
local Workspace = game:GetService("Workspace")

local generalChannel: TextChannel = TextChatService:WaitForChild("TextChannels").RBXGeneral

TextChatService.OnIncomingMessage = function(textChatMessage: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")

	-- Check for system messages that contain metadata
	if not textChatMessage.TextSource and textChatMessage.Metadata ~= "" then

		-- Add prefix to make message look like it was sent by a player
		properties.PrefixText = string.format("<font color='#%s'>%s: </font>", "#50C999", textChatMessage.Metadata)

		-- Add bubble chat
		TextChatService:DisplayBubble(Workspace.Statue, textChatMessage.Text)
	end

	return properties
end

local message = "Welcome! I will be your guide."
local speakerName = "Ancient Knight"
generalChannel:DisplaySystemMessage(message, speakerName)
```

*(image in the full Top G Vault)*

---
*Source: [Customize the chat window](https://create.roblox.com/docs/chat/chat-window) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
