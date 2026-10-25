---
title: "TextChatCommand"
description: "Represents a text chat command."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChatCommand"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a text chat command.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Represents a text chat command. Can be used to create custom text chat commands when parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

Custom commands can have up to two aliases, and the Triggered event fires when a user's message matches the value of either the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] or [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]]. For an example of custom commands, see [[30 Official Roblox Docs/Chat/Examples/Custom text chat commands|Custom text chat commands]].

To learn more about using [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], see [[30 Official Roblox Docs/Chat/Text chat overview|In-experience text chat]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#AutocompleteVisible\|AutocompleteVisible]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]] is shown as a suggestion in the chat autocomplete menu. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Enabled\|Enabled]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]] is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias\|PrimaryAlias]] | string | A primary alias used to trigger the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias\|SecondaryAlias]] | string | A secondary alias used to trigger the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommand]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered\|Triggered]] | `originTextSource`, `unfilteredText` | An event that developers can bind to execute commands. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutocompleteVisible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether this [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] appears as a suggestion in the chat autocomplete menu. Defaults to `true`.

When `true`, [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] is offered in the autocomplete list. Set to `false` to hide it from suggestions; the command still works when typed in full via [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] or [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]].

Autocomplete itself is controlled by [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AutocompleteEnabled|ChatInputBarConfiguration.AutocompleteEnabled]].

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines whether the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] is enabled.

When disabled, messages that match the value of [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] or [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]] are not sunk and is sent to other users.

Use this to disable default commands on a case-by-case basis.

### PrimaryAlias

**Type:** string

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

A primary alias used to trigger the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]].

If a user sends a message with [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] that matches the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]], the message is not sent and instead [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered|TextChatCommand.Triggered]] is fired.

### SecondaryAlias

**Type:** string

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

A secondary alias used to trigger the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]], in addition to its [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]].

If a user sends a message with [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] that matches the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]], the message is not sent and instead [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered|TextChatCommand.Triggered]] is fired, exactly as it is for the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]]. Matching is case-insensitive, and the alias must be followed by the end of the message or a space, so a [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]] of `"/e"` matches `"/e"` and `"/e dance"` but not `"/emote"`.

Defaults to an empty string, in which case only the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] triggers the command.

## Events

### Triggered

```lua
TextChatCommand.Triggered(originTextSource: TextSource, unfilteredText: string)
```

**Capabilities:** Chat

An event that developers can bind to execute commands.

When a user sends a message to the server via [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]], the message is intercepted by the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] and not replicated to other users if the content of the message matches the [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|PrimaryAlias]] or [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#SecondaryAlias|SecondaryAlias]].

For example, for a [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] with [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#PrimaryAlias|TextChatCommand.PrimaryAlias]] as "mute", if a user sends "/mute SomeUserName", then the relevant [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommand]] for mute will fire its [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand#Triggered|TextChatCommand.Triggered]]. The message "/mute SomeUserName" is not replicated to other users.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `originTextSource` | [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] |  | A reference to the [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] responsible for triggering the command via [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]]. |
| `unfilteredText` | string |  | The full, unfiltered text used to trigger the command that can be used to dissect parameters from the command message. |

---
*Source: [TextChatCommand](https://create.roblox.com/docs/reference/engine/classes/TextChatCommand) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
