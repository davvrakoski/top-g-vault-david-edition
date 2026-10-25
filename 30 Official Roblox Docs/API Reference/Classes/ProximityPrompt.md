---
title: "ProximityPrompt"
description: "An object that lets you prompt players to interact with an object in the 3D world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that lets you prompt players to interact with an object in the 3D world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **ProximityPrompt** instance lets you prompt players to interact with an object in the 3D world, such as opening a door or picking up an item. A [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] object works when parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] (with [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] set) in the workspace. When the player's character approaches, a UI appears to prompt them for input.

Prompts consist of three primary elements, each of which can be controlled by the noted properties. The default UI can be swapped out for your own custom appearance as outlined in [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Style|Style]].

*(image in the full Top G Vault)*

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText\|ObjectText]] | An optional name for the object being interacted with. |  |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText\|ActionText]] | An optional action name shown to the player. | Interact |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|KeyboardKeyCode]] | The keyboard key which will trigger the prompt. | E |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#GamepadKeyCode\|GamepadKeyCode]] | The gamepad button which will trigger the prompt. | ButtonX |

You can connect to proximity prompt events either on the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] object itself or globally through [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]]. The [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]] allows you to manage all proximity prompt behavior from one location, preventing any need for duplicate code in your experience.

For more information regarding proximity prompts, see the [[30 Official Roblox Docs/UI/Proximity prompts|Proximity Prompts]] guide.

*Code samples for this API (`using-a-proximity-prompt-with-a-seat`, `generating-a-custom-proximity-prompt`, `healing-proximity-prompt`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText\|ActionText]] | string | The action text shown to the user. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#AutoLocalize\|AutoLocalize]] | boolean | Whether the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText\|ProximityPrompt.ActionText]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText\|ProximityPrompt.ObjectText]] will be localized according to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RootLocalizationTable\|ProximityPrompt.RootLocalizationTable]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ClickablePrompt\|ClickablePrompt]] | boolean | Whether the prompt can be activated by clicking/tapping on the prompt UI. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Enabled\|Enabled]] | boolean | Whether or not this prompt should be shown. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Exclusivity\|Exclusivity]] | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptExclusivity\|ProximityPromptExclusivity]] | Used to customize which prompts can be shown at the same time. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#GamepadKeyCode\|GamepadKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | The gamepad button the player should press to trigger the prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]] | float | The duration, in seconds, that the player must hold the button/key down to trigger the prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|KeyboardKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | The key the player should press to trigger the prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance\|MaxActivationDistance]] | float | The maximum distance a Player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|character]] can be from the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] for the prompt to appear. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance\|MaxIndicatorDistance]] | float | The maximum distance at which a lightweight indicator for the prompt is shown, hinting at a nearby interaction before the player is close enough to trigger it. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText\|ObjectText]] | string | An optional property that determines the object name text shown to the user. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RequiresLineOfSight\|RequiresLineOfSight]] | boolean | Whether the prompt is hidden if the path between the player's [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] and object parented to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|ProximityPrompt]] is obstructed. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RootLocalizationTable\|RootLocalizationTable]] | [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] | A reference to a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] to be used to apply automated localization to this prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText\|ProximityPrompt.ActionText]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText\|ProximityPrompt.ObjectText]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptStyle\|ProximityPromptStyle]] | The style of the prompt's UI. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#UIOffset\|UIOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The pixel offset applied to the prompt's UI. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#InputHoldBegin\|InputHoldBegin()]] | () | Fires a signal indicating that the user began pressing the prompt GUI button. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#InputHoldEnd\|InputHoldEnd()]] | () | Fires a signal indicating that the user ended pressing the prompt GUI button. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#IndicatorHidden\|IndicatorHidden]] |  | Fires on the client when a lightweight indicator for the prompt is no longer shown. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#IndicatorShown\|IndicatorShown]] |  | Fires on the client when a lightweight indicator for the prompt becomes visible. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptButtonHoldBegan\|PromptButtonHoldBegan]] | `playerWhoTriggered` | Triggered when a player begins holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|key]]/button connected to a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|ProximityPrompt.HoldDuration]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptButtonHoldEnded\|PromptButtonHoldEnded]] | `playerWhoTriggered` | Triggers when the player ends holding down the button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|ProximityPrompt.HoldDuration]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptHidden\|PromptHidden]] |  | Triggers when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|prompt]] becomes hidden. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptShown\|PromptShown]] | `inputType` | Triggers when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt\|prompt]] becomes visible. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Triggered\|Triggered]] | `playerWhoTriggered` | Triggered when the prompt [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|key]]/button is pressed, or after a specified amount of time holding the button, if [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|ProximityPrompt.HoldDuration]] is used. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#TriggerEnded\|TriggerEnded]] | `playerWhoTriggered` | Triggers when [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode\|key]]/button is released, for longer events where the user is required to hold down the button. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActionText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines the action text shown to the user.

### AutoLocalize

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines whether the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText|ProximityPrompt.ActionText]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText|ProximityPrompt.ObjectText]] will be localized according to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RootLocalizationTable|ProximityPrompt.RootLocalizationTable]]. When set to true, localization will be applied.

### ClickablePrompt

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines whether the prompt can be activated by clicking/tapping on the prompt's UI. When set to false, the prompt cannot be activated by click/tap except on mobile.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property indicates whether or this [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] should be shown.

### Exclusivity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptExclusivity|ProximityPromptExclusivity]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property is used to customize which prompts can be shown at the same time.

### GamepadKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines the gamepad button the player should press to trigger the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]]. Default is **ButtonX**.

### HoldDuration

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property indicates the duration, in seconds, that the player must hold the button/key down to trigger the prompt.

### KeyboardKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines the key the player should press to trigger the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]]. Default is <kbd>E</kbd>.

### MaxActivationDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property determines the maximum distance a Player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|character]] can be from the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] for the prompt to appear.

### MaxIndicatorDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

The maximum distance a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|character]] can be from the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] for a lightweight indicator to appear. An indicator is shown while the player is farther than [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|ProximityPrompt.MaxActivationDistance]] but no farther than **MaxIndicatorDistance**, hinting that an interaction is nearby before the prompt itself becomes active.

The default is `0`, which disables the indicator; an indicator only appears when this property is set to a value greater than `0`. The number of indicators shown at once is capped by [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#MaxIndicatorsVisible|ProximityPromptService.MaxIndicatorsVisible]].

### ObjectText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This optional property determines the optional object name text shown to the user.

### RequiresLineOfSight

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property indicates whether the prompt is hidden if the path between the player's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] and object parented to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is obstructed. If true, this prompt will only be shown if there is a clear path from the camera to the object.

The parent [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] of the prompt will be excluded from this check.

### RootLocalizationTable

**Type:** [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]]

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property serves as a reference to the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] used to apply automated localization to the prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText|ProximityPrompt.ActionText]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText|ProximityPrompt.ObjectText]]. In order for this to apply, [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#AutoLocalize|ProximityPrompt.AutoLocalize]] must be set.

Developers can set this to reference a LocalizationTable anywhere in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. It is not required to be a child of [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]]. If there is no translation available in the referenced table it will look for a translation in the parent of that table, if it is also a LocalizationTable, and so on.

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptStyle|ProximityPromptStyle]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property indicates the prompt's style. When set to Custom, no default UI will be provided.

The provided UI can be swapped out for a custom UI. In order to do this, set Style to Custom. Then, listen to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptShown|ProximityPrompt.PromptShown]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptHidden|ProximityPrompt.PromptHidden]] events in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], where developers should create and tear down the UI.

Developers may also use [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptButtonHoldBegan|ProximityPrompt.PromptButtonHoldBegan]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#PromptButtonHoldEnded|ProximityPrompt.PromptButtonHoldEnded]] in order to utilize the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|ProximityPrompt.HoldDuration]] progress animation feature.

### UIOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Input

This property indicates the pixel offset applied to the prompt's UI.

## Methods

### InputHoldBegin

```lua
ProximityPrompt:InputHoldBegin(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Input

This function triggers a signal indicating that the user began pressing the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] prompt button. It should be used by developers who wish to customize the prompt and trigger it from a prompt GUI button press.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### InputHoldEnd

```lua
ProximityPrompt:InputHoldEnd(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Input

A counterpoint to [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#InputHoldBegin|ProximityPrompt:InputHoldBegin()]], this signals that the user ended pressing the prompt GUI button.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### IndicatorHidden

```lua
ProximityPrompt.IndicatorHidden()
```

**Capabilities:** UI, Input

Fires client-side when a lightweight indicator for this [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] is hidden, which occurs when the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|character]] moves farther than [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|ProximityPrompt.MaxIndicatorDistance]] from the prompt or the prompt itself becomes active. Use this event to tear down a custom indicator UI.

As with [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#IndicatorShown|ProximityPrompt.IndicatorShown]], indicators only appear when [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|ProximityPrompt.MaxIndicatorDistance]] is set to a value greater than `0`; it defaults to `0`.

### IndicatorShown

```lua
ProximityPrompt.IndicatorShown()
```

**Capabilities:** UI, Input

Fires client-side when a lightweight indicator for this [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] becomes visible, which occurs when the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|character]] is within [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|ProximityPrompt.MaxIndicatorDistance]] of the prompt but still farther away than [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|ProximityPrompt.MaxActivationDistance]]. Listen to this event to render a custom indicator UI.

Because [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxIndicatorDistance|ProximityPrompt.MaxIndicatorDistance]] defaults to `0`, indicators are disabled unless you set it to a value greater than `0`.

### PromptButtonHoldBegan

```lua
ProximityPrompt.PromptButtonHoldBegan(playerWhoTriggered: Player)
```

**Capabilities:** UI, Input

This event triggers when a player begins holding down the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|key]]/button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|ProximityPrompt.HoldDuration]]. One possible usage includes to animate a hold progress bar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who begins holding down the prompt button. |

### PromptButtonHoldEnded

```lua
ProximityPrompt.PromptButtonHoldEnded(playerWhoTriggered: Player)
```

**Capabilities:** UI, Input

This event triggers when the player ends holding down the button on a prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|ProximityPrompt.HoldDuration]]. One possible usage includes to animate a hold progress bar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who ended the input hold. |

### PromptHidden

```lua
ProximityPrompt.PromptHidden()
```

**Capabilities:** UI, Input

This event triggers when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|prompt]] becomes hidden. This event is triggered client-side for `LocalScripts`.

### PromptShown

```lua
ProximityPrompt.PromptShown(inputType: ProximityPromptInputType)
```

**Capabilities:** UI, Input

This event triggers when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|prompt]] becomes visible. This event is triggered client-side for `LocalScripts`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `inputType` | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptInputType\|ProximityPromptInputType]] |  | The input that triggers the prompt. |

### Triggered

```lua
ProximityPrompt.Triggered(playerWhoTriggered: Player)
```

**Capabilities:** UI, Input

This event is triggered when the prompt [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|key]]/button is pressed, or after a specified amount of time holding the button, if [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|ProximityPrompt.HoldDuration]] is used.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who triggered the prompt. |

### TriggerEnded

```lua
ProximityPrompt.TriggerEnded(playerWhoTriggered: Player)
```

**Capabilities:** UI, Input

This event is triggered when the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|key]]/button is released, for longer events where the user is required to hold down the button (e.g. heal another player over time.)

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playerWhoTriggered` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who released the key/button, ending the trigger event. |

---
*Source: [ProximityPrompt](https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
