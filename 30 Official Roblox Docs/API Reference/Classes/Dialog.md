---
title: "Dialog"
description: "Creates NPC billboard-style dialog bubbles."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Dialog"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Creates NPC billboard-style dialog bubbles.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The Dialog object allows users to create non-player characters (NPCs) that players can talk to using a list of choices. The Dialog object can be inserted into a part such as a Humanoid's head, and then a player will see a speech bubble above the part that they can click on to start a conversation. The creator of a place can choose what choices the player can say by inserting [[30 Official Roblox Docs/API Reference/Classes/DialogChoice|DialogChoice]] objects into the dialog.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#BehaviorType\|BehaviorType]] | [[30 Official Roblox Docs/API Reference/Enums/DialogBehaviorType\|DialogBehaviorType]] | Sets whether the Dialog can be used by multiple players at once. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#ConversationDistance\|ConversationDistance]] | float | The furthest distance that a player can be from the Dialog's parent to start a conversation. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#GoodbyeChoiceActive\|GoodbyeChoiceActive]] | boolean | Toggles whether the goodbye option will be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#GoodbyeDialog\|GoodbyeDialog]] | string | Sets the sentence that the dialog will show to the player when the chat ends. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#InitialPrompt\|InitialPrompt]] | string | Sets the first sentence that the dialog will show to the player, once a chat is commenced. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#InUse\|InUse]] | boolean | If true, this dialog is being used by at least one player. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#Purpose\|Purpose]] | [[30 Official Roblox Docs/API Reference/Enums/DialogPurpose\|DialogPurpose]] | Sets the icon that the initial dialog displays. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#Tone\|Tone]] | [[30 Official Roblox Docs/API Reference/Enums/DialogTone\|DialogTone]] | Sets the color of the NPC's speech bubble. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#TriggerDistance\|TriggerDistance]] | float | Sets the maximum distance that a dialog can be triggered from. |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#TriggerOffset\|TriggerOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Sets the offset of the dialog relative to the dialog's parent. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#GetCurrentPlayers\|GetCurrentPlayers()]] | Instances | Returns a list of players currently using the Dialog. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Dialog#DialogChoiceSelected\|DialogChoiceSelected]] | `player`, `dialogChoice` | Fired when a player chooses something to say, through a [[30 Official Roblox Docs/API Reference/Classes/Dialog\|Dialog]] instance. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BehaviorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DialogBehaviorType|DialogBehaviorType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The BehaviorType of a Dialog determines whether multiple players can interact with a dialog at once. The default value for this property is SinglePlayer.

#### SinglePlayer

When a Dialog is configured to SinglePlayer, only one player can interact with it at a time. As soon as a player engages with a dialog, other players will not be able to initiate the dialog until the first player is finished.

While a player is engaged with a dialog, the other players will see the dialog choices of the player who started the dialog, along with the responses.

#### MultiplePlayers

When a Dialog is set to MultiplePlayers, any player can initiate a dialog at any time, even if another player has already initiated the dialog. Unlike SinglePlayer however, Dialogs set to MultiplePlayers will not show the dialog choices and responses to anyone but the player in the conversation.

*Code samples for this member (`Dialog-BehaviorType`) are published on the source page; their code is not part of the open-source repo.*

### ConversationDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The maximum distance in studs between the player's character and the Dialog's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] at which the player can click on the speech bubble to begin or continue a conversation. If the player moves further than this distance from the parent part, they cannot initiate the dialog. The engine uses this value to select the nearest available Dialog when multiple are in range.

Default is 25.

### GoodbyeChoiceActive

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Toggles whether the goodbye option will be displayed. If true, the dialog will display the content of [[30 Official Roblox Docs/API Reference/Classes/Dialog#GoodbyeDialog|Dialog.GoodbyeDialog]] as the last option after other dialog choices. Clicking on the goodbye option will exit the dialog.

### GoodbyeDialog

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The text displayed as the goodbye option at the bottom of the dialog choices list. When [[30 Official Roblox Docs/API Reference/Classes/Dialog#GoodbyeChoiceActive|Dialog.GoodbyeChoiceActive]] is true, this string appears as the final selectable choice; clicking it ends the conversation. When [[30 Official Roblox Docs/API Reference/Classes/Dialog#GoodbyeChoiceActive|Dialog.GoodbyeChoiceActive]] is false, this property has no visible effect.

Default is an empty string.

### InitialPrompt

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The text that the NPC displays inside the speech bubble when a player first begins the conversation. This is the opening line that appears before the player selects from [[30 Official Roblox Docs/API Reference/Classes/DialogChoice|DialogChoice]] options nested under this Dialog.

Default is an empty string.

### InUse

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI

A read-only runtime indicator that is true whenever at least one player is currently engaged in this dialog conversation. The engine sets this to true when a player begins talking and resets it to false when all participants leave. This property is not serialized and always starts as false when the place loads. Scripts can read this property but cannot set it directly.

Default is false.

### Purpose

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DialogPurpose|DialogPurpose]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls which icon appears on the dialog's speech bubble indicator. Accepts a value from the [[30 Official Roblox Docs/API Reference/Enums/DialogPurpose|Enum.DialogPurpose]] enum:

- **Quest** -- displays an exclamation mark (!)
- **Help** -- displays a question mark (?)
- **Shop** -- displays a dollar sign (\$)

Default is Help.

### Tone

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DialogTone|DialogTone]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the color accent on the dialog's speech bubble. Accepts a value from the [[30 Official Roblox Docs/API Reference/Enums/DialogTone|Enum.DialogTone]] enum:

- **Neutral** -- blue accent bar
- **Friendly** -- green accent bar
- **Enemy** -- red accent bar

Default is Neutral.

### TriggerDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The maximum distance in studs from the Dialog's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] at which the dialog's trigger indicator becomes visible to a player. When a player's character is within this distance, the speech bubble icon appears over the parent part, inviting interaction. The value is clamped between 0 and 400.

Default is 0, which effectively disables the distance-based trigger indicator; the player must be within [[30 Official Roblox Docs/API Reference/Classes/Dialog#ConversationDistance|Dialog.ConversationDistance]] to see and interact with the dialog.

### TriggerOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] offset in studs that shifts the position of the dialog's speech bubble indicator relative to the Dialog's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Use this to position the indicator above or beside the NPC rather than at the part's center. This property participates in model scaling.

Default is (0, 0, 0).

## Methods

### GetCurrentPlayers

```lua
Dialog:GetCurrentPlayers(): Instances
```

**Thread safety:** Unsafe · **Capabilities:** UI

The GetCurrentPlayers function of a Dialog will return a list of [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] currently using the Dialog. If there are no players using the dialog then the returned list will be empty.

**Returns**

| Type | Description |
| --- | --- |
| Instances | A list of [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects currently engaged in the Dialog. |

*Code samples for this member (`Dialog-GetCurrentPlayers1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### DialogChoiceSelected

```lua
Dialog.DialogChoiceSelected(player: Instance, dialogChoice: Instance)
```

**Capabilities:** UI

Fired when a player chooses something to say, through a [[30 Official Roblox Docs/API Reference/Classes/Dialog|Dialog]] instance.

This event is client-side only and will not fire on the server. It should be connected to in either a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] required by a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who made the selection. |
| `dialogChoice` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/DialogChoice\|DialogChoice]] that was selected by the player. |

---
*Source: [Dialog](https://create.roblox.com/docs/reference/engine/classes/Dialog) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
