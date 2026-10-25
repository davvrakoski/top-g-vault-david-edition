---
title: "Platform-integrated chat"
description: "Opt in to platform-integrated TextChatService so Roblox delivers and renders chat messages with TextChannelWindow."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/platform-integrated-chat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Opt in to platform-integrated TextChatService so Roblox delivers and renders chat messages with TextChannelWindow.*

> [!info]
> Starting in May 2027, platform-integrated chat will be required for all games. The unsupported APIs will be deprecated, and custom chat will have to use the new [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] features.

> [!warning]
> When you enable platform-integrated chat, custom chat features must move to Roblox's native systems ([[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommands]], [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]], [[30 Official Roblox Docs/Chat/Quick Words|Quick Words]]). Message content is also no longer accessible in code.

**Platform-integrated chat** gives every player consistent access to safety tools such as reporting and muting, and lets chat features like [[30 Official Roblox Docs/Chat/Quick Words|Quick Words]] roll out reliably across all games. It also replaces the current prefix system, so roles associated with users render consistently and are safe for all ages.

Nothing in your game changes until you [[30 Official Roblox Docs/Chat/Platform-integrated chat#Enable platform-integrated chat|enable platform-integrated chat]] in Studio. After you enable it:

- Roblox delivers and renders chat in the default window or a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] you place in your UI. Custom chat UIs can no longer render messages themselves.
- Player message text isn't accessible to your code. You can't read, log, or export it. APIs that previously returned message text now return an empty string (`""`) instead of `nil`, so your scripts keep running but receive no content.

> [!warning]
> Commands triggered from chat must use [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]].

## Unsupported APIs

When platform-integrated chat is enabled, the following APIs return `""` (empty string, not `nil`) and log a warning:

| Feature | Unsupported APIs | What to use instead |
| --- | --- | --- |
| Chat messages and display | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text\|TextChatMessage.Text]], [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Translation\|TextChatMessage.Translation]] | Migrate your custom chat GUI to [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow\|TextChannelWindow]]. Set [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target\|Target]] to a [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. Users can send and receive messages automatically. |
| Chat prefixes | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|TextChatMessage.PrefixText]] | Not supported. If your game requires prefixes, don't enable platform-integrated chat yet. |
| Presets / chat wheels | [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] | Use [[30 Official Roblox Docs/Chat/Quick Words\|Quick Words]] creator customization to add relevant phrases to chat. |
| Moderation / admin commands | [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage\|OnIncomingMessage]], [[30 Official Roblox Docs/API Reference/Classes/Player#Chatted\|Player.Chatted]] | Use [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]] for chat-triggered commands. Use read-only chat to view all chats for moderation during live events. |

## Enable platform-integrated chat

To enable platform-integrated chat in Studio:

1. Open the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window.
2. Select [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].
3. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] panel, find [[30 Official Roblox Docs/API Reference/Classes/TextChatService#PlatformIntegratedChat|PlatformIntegratedChat]].
4. Set it to **Enabled**.

With the update enabled, the unsupported APIs listed earlier return empty strings and log warnings. You can set the property back to **Disabled** at any time to revert.

You can only change this property in Studio, not from a script.

## Create a TextChannelWindow

To create a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]]:

1. Create a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] in [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].
2. Add a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] instance as a child of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
3. Set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position|Position]] properties to place the window where you want it.
4. Set the [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target|Target]] property to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] you want the window to display.

Each [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] binds to a single [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]. To show multiple channels together, create a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] for each channel and apply your own show/hide logic. The Global channel isn't available as a target for a custom window.

The following code sample creates a custom chat window that displays the `RBXGeneral` channel:

```lua title="LocalScript in StarterGui"
local TextChatService = game:GetService("TextChatService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TextChannelWindowDemo"
screenGui.Parent = script.Parent

local myTextChannelWindow = Instance.new("TextChannelWindow")
myTextChannelWindow.Size = UDim2.new(0, 400, 0, 300)
myTextChannelWindow.Position = UDim2.new(0, 10, 0, 10)
myTextChannelWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
myTextChannelWindow.BackgroundTransparency = 0.5

local targetChannelName = "RBXGeneral"
local targetChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild(targetChannelName)

if targetChannel and targetChannel:IsA("TextChannel") then
	myTextChannelWindow.Target = targetChannel
end

myTextChannelWindow.Parent = screenGui
```

## Show a custom channel only in its own window

By default, the default chat window renders messages from every [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]], so a channel you show in a custom [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] also appears in the default window.

To show a custom channel only in its own window:

1. In the Explorer, select [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] under [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].
2. In the **Properties** panel, set [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|TextChannelDisplayMode]] to **DefaultTextChannels**.
3. For each custom channel, create a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] and set its [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target|Target]] to that channel.

The following example shows a custom Guild channel that appears only in its own window:

```lua title="LocalScript in StarterPlayerScripts"
-- Prerequisite: TextChannelDisplayMode is set to DefaultTextChannels in Studio.
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Scripts can read the property at runtime, but can't change it.
local config = TextChatService.ChatWindowConfiguration
if config.TextChannelDisplayMode ~= Enum.TextChannelDisplayMode.DefaultTextChannels then
	warn("Guild messages will also appear in the default chat window.")
end

local guildChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("Guild")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GuildChat"
screenGui.Parent = playerGui

local guildWindow = Instance.new("TextChannelWindow")
guildWindow.Size = UDim2.new(0, 400, 0, 300)
guildWindow.Target = guildChannel
guildWindow.Parent = screenGui
```

Keep these behaviors in mind:

- You can set [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|TextChannelDisplayMode]] only in Studio or from a plugin. Scripts can read it at runtime but can't change it.
- The property exists only on [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]]. [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] doesn't need it because it already shows a single channel through [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target|Target]].
- Channels created at runtime follow the current mode when they appear. Default channels created at runtime, such as Team and Whisper, still appear in the default window.

## Migrate chat-triggered admin commands

Whether you need to update your admin commands depends on how they are triggered:

- Commands triggered from chat must use [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]].
- Command handling that reads raw chat text no longer works. This includes [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|MessageReceived]], [[30 Official Roblox Docs/API Reference/Classes/Player#Chatted|Chatted]], or anything else that inspects [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] content.

To migrate:

1. Identify admin commands in your game that currently parse raw chat messages.
2. Create a [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] for each command.
3. Define the command's trigger keyword and callback logic.
4. Remove any code that reads [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|Text]] or listens to [[30 Official Roblox Docs/API Reference/Classes/Player#Chatted|Chatted]] for command handling.

For an example, see [[30 Official Roblox Docs/Chat/Examples/Custom text chat commands|Custom text chat commands]].

## FAQ

> [!note]- **Will anything change if I do nothing?**
> Nothing changes in your game unless you set [[30 Official Roblox Docs/API Reference/Classes/TextChatService#PlatformIntegratedChat|PlatformIntegratedChat]] to **Enabled**.

> [!note]- **Does this affect signs, boards, notes, or other in-world text players can write?**
> No. Policy for those surfaces is unchanged: they can't be used for two-way communication between players, they need rate limiting of at least 1 minute, and they are subject to moderation.

> [!note]- **Does this affect comment systems, message boards, or mail in my game?**
> No. This update covers [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] only.

> [!note]- **Can I still record and pull chat logs as a game admin?**
> No. When [[30 Official Roblox Docs/API Reference/Classes/TextChatService#PlatformIntegratedChat|PlatformIntegratedChat]] is **Enabled**, no API returns player message content on the client or server. Moderators in your game can still use read-only chat permissions to view chat. Players can also rely on Roblox's abuse reporting and on safety tools such as muting and blocking.

> [!note]- **Do I need to change anything if I use the default Roblox chat?**
> No. If your game uses the default Roblox chat with no customizations, you don't need to take action and shouldn't see a change.

---
*Source: [Platform-integrated chat](https://create.roblox.com/docs/chat/platform-integrated-chat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
