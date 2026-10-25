---
title: "Proximity prompts"
description: "Proximity Prompts allow users to trigger actions when they approach objects in the 3D space."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/proximity-prompts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Proximity Prompts allow users to trigger actions when they approach objects in the 3D space.*

[[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] objects
encourage user interaction to trigger an action when they approach in-game
objects such as doors, light switches, and buttons. Using this object, you can:

- Indicate what objects a user can interact with in the game.
- Display the action a user can take on the object, then trigger the action through user input such as pressing or holding a key.
- Display the correct input for all input types, such a keyboard, gamepad, and touchscreen keys.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/proximity-prompt/Showcase.mp4)

> [!info]
> See the [Dungeon Delve](https://www.roblox.com/games/6074153281/Dungeon-Delve) sample place for the fully working proximity prompt examples shown in the video above.

## Create proximity prompts

You must parent proximity prompts to the part, model, or attachment that you want a user to interact with. To add a proximity prompt to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, hover over the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] and click the ⊕ button. A contextual menu displays.
1. From the menu, insert a **ProximityPrompt**.

   *(image in the full Top G Vault)*

## Customize proximity prompts

You can customize a proximity prompt based on how you want it to [[30 Official Roblox Docs/UI/Proximity prompts#Appearance|appear]], when you want it to be [[30 Official Roblox Docs/UI/Proximity prompts#Visibility|visible]], and what you want a user to do to [[30 Official Roblox Docs/UI/Proximity prompts#Interactivity|trigger the action]].

### Appearance

Proximity prompts need to communicate three things:

- The **object** that a user can interact with.
- The **action** that triggers when they interact with the proximity
  prompt.
- The **key** that a user must press or hold.

You can specify these through the following properties:

- [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ObjectText|ObjectText]] An optional name for the object a user can interact with.
- [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ActionText|ActionText]] An optional name for the action a user will trigger.
- [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#KeyboardKeyCode|KeyboardKeyCode]] The keyboard key a user must press or hold to trigger the action.
- [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#GamepadKeyCode|GamepadKeyCode]] The gamepad key a user must press or hold to trigger the action.

  *(image in the full Top G Vault)*

### Visibility

You can control when the proximity prompt is visible through its [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|MaxActivationDistance]], [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RequiresLineOfSight|RequiresLineOfSight]], and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#Exclusivity|Exclusivity]] properties.

#### MaxActivationDistance

The [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#MaxActivationDistance|MaxActivationDistance]] property allows you to define the range from around the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] object that activates the visibility of the proximity prompt. Once a user's character enters that range, the proximity prompt becomes visible.

*(image in the full Top G Vault)*

#### RequiresLineOfSight

The [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#RequiresLineOfSight|RequiresLineOfSight]] property activates the visibility of the proximity prompt when there's a clear path from the **camera** to the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] object. By default, this property is set to true.

[Video: RequiresLineOfSight.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/proximity-prompt/RequiresLineOfSight.mp4)

#### Exclusivity

If a user's character is within range of multiple proximity prompts, each proximity prompt's visibility depends on which proximity prompt the camera is pointing at, as well as each proximity prompt's [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|Exclusivity]] property value.

##### OnePerButton

*(image in the full Top G Vault)*

*Only one proximity prompt is visible per input keycode. If multiple in-range proximity prompts use different keycodes, they are all visible. However, if multiple in-range proximity prompts use the same keycode, only one proximity prompt is visible at any given time, depending on the camera's view direction.*

##### OneGlobally

*(image in the full Top G Vault)*

*If multiple proximity prompts are set to this exclusivity, only one prompt is visible at any given time, regardless of the character's proximity or the prompt's keycode. The camera's view direction determines which proximity prompt is visible, useful for minimizing prompt distraction when there are several in an area.*

##### AlwaysShow

*(image in the full Top G Vault)*

*Proximity prompts are always visible when in range, assuming no other factors prevent them from being visible. Be cautious when using this setup, as all visible prompts using the same keycode will trigger on a player's input of that keycode.*

### Interactivity

You can customize how a user interacts with a proximity prompt through its [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|HoldDuration]] and [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ClickablePrompt|ClickablePrompt]] properties.

#### HoldDuration

The [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration|HoldDuration]] property determines how many seconds a user has to press a key before the proximity prompt's action triggers. If this property has a value of `0`, the proximity prompt's action triggers immediately.

[Video: HoldDuration.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/proximity-prompt/HoldDuration.mp4)

#### ClickablePrompt

The [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ClickablePrompt|ClickablePrompt]] property specifies if a user can click on a proximity prompt to trigger its action. When set to **true**, a user can interact with the proximity prompt by directly clicking the proximity prompt **or** by pressing the specified key. When set to **false**, a user can only interact with the proximity prompt by pressing the specified key.

> [!warning]
> Note that if a user is using a phone or a tablet, they can always interact with the proximity prompt by directly clicking the proximity prompt regardless of the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#ClickablePrompt|ClickablePrompt]] property's value.

## Script proximity prompts

You can connect to proximity prompt events either on the [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] object itself or globally through [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]]. The [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]] allows you to manage all proximity prompt behavior from one location, preventing any need for duplicate code in your game.

| Event | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptTriggered\|PromptTriggered]] | Fires when a player interacts with a proximity prompt (after the duration for a prompt with non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]]). |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptTriggerEnded\|PromptTriggerEnded]] | Triggers when the player stops interacting with a proximity prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptButtonHoldBegan\|PromptButtonHoldBegan]] | Fires when a player begins interacting with a proximity prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptButtonHoldEnded\|PromptButtonHoldEnded]] | Fires when a player stops interacting with a proximity prompt with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt#HoldDuration\|HoldDuration]] value. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptShown\|PromptShown]] | Triggers in [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScripts]] when a proximity prompt is made visible. |
| [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService#PromptHidden\|PromptHidden]] | Triggers in [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScripts]] when a prompt is hidden. |

The following code sample includes a basic framework for using [[30 Official Roblox Docs/API Reference/Classes/ProximityPromptService|ProximityPromptService]]:

```lua
local ProximityPromptService = game:GetService("ProximityPromptService")

-- Detect when prompt is triggered
local function onPromptTriggered(promptObject, player)

end

-- Detect when prompt hold begins
local function onPromptHoldBegan(promptObject, player)

end

-- Detect when prompt hold ends
local function onPromptHoldEnded(promptObject, player)

end

-- Connect prompt events to handling functions
ProximityPromptService.PromptTriggered:Connect(onPromptTriggered)
ProximityPromptService.PromptButtonHoldBegan:Connect(onPromptHoldBegan)
ProximityPromptService.PromptButtonHoldEnded:Connect(onPromptHoldEnded)
```

---
*Source: [Proximity prompts](https://create.roblox.com/docs/ui/proximity-prompts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
