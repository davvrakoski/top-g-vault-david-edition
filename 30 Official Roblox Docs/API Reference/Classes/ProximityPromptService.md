---
title: "ProximityPromptService"
description: "Allows developers to interact with `ProximityPrompt` objects in a global way."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ProximityPromptService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows developers to interact with [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] objects in a global way.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Service`, `NotBrowsable`

## Description

**ProximityPromptService** allows developers to interact with [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] objects in a global way. It may be more convenient to listen to events through this service rather than on individual [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] objects.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#Enabled\|Enabled]] | boolean | Whether [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompts]] are enabled, and therefore shown, in-experience. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#MaxIndicatorsVisible\|MaxIndicatorsVisible]] | int | Maximum number of prompt indicators that can be visible at once. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#MaxPromptsVisible\|MaxPromptsVisible]] | int | Maximum number of [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompts]] that will be shown to the player. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#IndicatorHidden\|IndicatorHidden]] | `prompt` | Triggers client-side when a prompt's indicator becomes hidden. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#IndicatorShown\|IndicatorShown]] | `prompt` | Triggers client-side when a prompt's indicator becomes visible. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptButtonHoldBegan\|PromptButtonHoldBegan]] | `prompt`, `playerWhoTriggered` | Triggers when the player begins holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|KeyboardKeyCode]] key/button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptButtonHoldEnded\|PromptButtonHoldEnded]] | `prompt`, `playerWhoTriggered` | Triggers when the player stops holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|KeyboardKeyCode]] key/button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptHidden\|PromptHidden]] | `prompt` | Triggers client-side when a prompt becomes hidden. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptShown\|PromptShown]] | `prompt`, `inputType` | Triggers client-side when a prompt becomes visible. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptTriggered\|PromptTriggered]] | `prompt`, `playerWhoTriggered` | Triggers when the user interacts with this prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptTriggerEnded\|PromptTriggerEnded]] | `prompt`, `playerWhoTriggered` | Triggers when the player stops holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|KeyboardKeyCode]] key/button while triggering a prompt. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property determines whether [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompts]] are enabled, and therefore shown, in-experience. When false, no prompts will be shown.

For example, in a round-based system, you can disable prompts at certain points in the experience to disable proximity-based interactions:

*Code samples for this member (`ProximityPromptService-Enabled`) are published on the source page; their code is not part of the open-source repo.*

### MaxIndicatorsVisible

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property sets the maximum number of prompt indicators that can be visible at the same time. Indicators are lightweight distance hints shown for [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompts]] when the player is within the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]] but still outside its [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|MaxActivationDistance]].

This property defaults to `16` and is clamped to the range `[0, 64]`. Because indicators are opt-in per prompt — a prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]] defaults to `0`, which disables its indicator — this property has no visible effect unless at least one prompt sets a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]].

### MaxPromptsVisible

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Input

This property indicates the maximum number of [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompts]] that will be shown to the player.

## Events

### IndicatorHidden

```lua
ProximityPromptService.IndicatorHidden(prompt: ProximityPrompt)
```

**Capabilities:** Input

This event triggers client-side in connected local scripts when the indicator for a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is no longer visible, such as when the player moves outside the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]] or the prompt is disabled. It is the counterpart to [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#IndicatorShown|IndicatorShown]] and is convenient for tearing down custom indicator UI globally rather than connecting to each individual [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt whose indicator becomes hidden. |

### IndicatorShown

```lua
ProximityPromptService.IndicatorShown(prompt: ProximityPrompt)
```

**Capabilities:** Input

This event triggers client-side in connected local scripts when the indicator for a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] becomes visible, which happens when the player moves within the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]] but remains outside its [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|MaxActivationDistance]]. Indicators are opt-in: a prompt only shows one when its [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|MaxIndicatorDistance]] is set greater than `0` (the default of `0` disables the indicator). Listening on the service rather than on each [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is convenient when implementing custom indicator UI globally.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt whose indicator becomes visible. |

### PromptButtonHoldBegan

```lua
ProximityPromptService.PromptButtonHoldBegan(prompt: ProximityPrompt, playerWhoTriggered: Player)
```

**Capabilities:** Input

This event triggers when the player begins holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|KeyboardKeyCode]] key/button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|HoldDuration]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt that the player begins interacting with. |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who holds the key/button. |

### PromptButtonHoldEnded

```lua
ProximityPromptService.PromptButtonHoldEnded(prompt: ProximityPrompt, playerWhoTriggered: Player)
```

**Capabilities:** Input

This event triggers when the player stops holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|KeyboardKeyCode]] key/button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|HoldDuration]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt that the player stops interacting with. |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who releases the held key/button. |

### PromptHidden

```lua
ProximityPromptService.PromptHidden(prompt: ProximityPrompt)
```

**Capabilities:** Input

This event triggers client-side in connected local scripts when a prompt becomes hidden.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt instance that becomes hidden. |

### PromptShown

```lua
ProximityPromptService.PromptShown(prompt: ProximityPrompt, inputType: ProximityPromptInputType)
```

**Capabilities:** Input

This event triggers client-side in connected local scripts when a prompt becomes visible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt instance that becomes visible. |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptInputType\|ProximityPromptInputType]] |  | The input that triggered the event. |

### PromptTriggered

```lua
ProximityPromptService.PromptTriggered(prompt: ProximityPrompt, playerWhoTriggered: Player)
```

**Capabilities:** Input

This event triggers when the player completes interaction with a prompt, either when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|KeyboardKeyCode]] key/button is pressed, or after a specified amount of time holding the key/button if the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|HoldDuration]] is non-zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt that the player interacts with. |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The interacting player. |

### PromptTriggerEnded

```lua
ProximityPromptService.PromptTriggerEnded(prompt: ProximityPrompt, playerWhoTriggered: Player)
```

**Capabilities:** Input

This event triggers when the player stops holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|KeyboardKeyCode]] key/button while triggering a prompt. This is intended to allow interactions which require the player to hold a key/button while something happens in-experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prompt` | [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] |  | The prompt that the player stops interacting with. |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player that releases the key/button. |

---
*Source: [ProximityPromptService](https://create.roblox.com/docs/reference/engine/classes/ProximityPromptService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
