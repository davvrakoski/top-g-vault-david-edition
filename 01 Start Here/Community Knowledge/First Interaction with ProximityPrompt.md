---
area: "01 Start Here"
cluster: "Start Here"
title: "First Interaction with ProximityPrompt"
tags: [roblox, community-knowledge, start-here, proximity-prompt, interaction]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/proximity-prompts
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/proximity-prompts
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
---
# First Interaction with ProximityPrompt

"Press E to open", "Hold E to pick up": that floating prompt is a **ProximityPrompt**, and it is the easiest correct way to make objects interactive. It handles distance, the key/button icon for every device (keyboard, touch tap, gamepad), hold timers and line of sight, and it hands your server script the player who used it. For beginners it replaces fragile `Touched` triggers and click detectors for most "use this" moments.

## Add one (1 minute)

1. Select a Part, Model or Attachment (for example a door or a chest).
2. Insert a **ProximityPrompt** as its child.
3. Set in Properties:

| Property | Example | Meaning |
| --- | --- | --- |
| `ActionText` | `Open` | Verb shown on the prompt |
| `ObjectText` | `Chest` | What the object is |
| `KeyboardKeyCode` | `E` (default) | Key on PC; touch and gamepad get matching inputs |
| `HoldDuration` | `0` or `1.5` | Seconds to hold; 0 = instant |
| `MaxActivationDistance` | `10` | Studs from the prompt before it appears |
| `RequiresLineOfSight` | true (default) | Hidden if something blocks the camera's view |

## Script it (server Script inside the prompt)

```lua
local prompt = script.Parent
local chest = prompt.Parent

prompt.Triggered:Connect(function(player)
	prompt.Enabled = false            -- one use
	player.leaderstats.Coins.Value += 50
	chest.Transparency = 0.5
end)
```

`Triggered` passes the **player** who completed the prompt, on the server, so you can reward them directly without a RemoteEvent. For held prompts it fires only after the hold finishes.

## A door that opens and closes

```lua
local prompt = script.Parent
local door = prompt.Parent
local open = false

prompt.Triggered:Connect(function()
	open = not open
	door.CanCollide = not open
	door.Transparency = open and 0.7 or 0
	prompt.ActionText = open and "Close" or "Open"
end)
```

Swap the instant change for a tween to make it slide: [[First Moving Part with TweenService]].

## Useful extra events

| Event | When |
| --- | --- |
| `PromptButtonHoldBegan` / `PromptButtonHoldEnded` | Player starts or stops holding (start a sound, cancel) |
| `PromptShown` / `PromptHidden` | Prompt appears or disappears (client side) |
| `ProximityPromptService.PromptTriggered` | One listener for every prompt in the game |

The service-wide event pairs well with tags: tag all chests `Chest` and handle them in one script ([[CollectionService Tag-Driven Architecture]]).

## Per-player prompts

A prompt edited on the server changes for everyone. If a chest should stay available to others after one player opens it, track opened chests per player in a server table and give feedback through the player's own UI, or hide the prompt only on that player's client with a LocalScript.

## Design tips

- One clear verb in `ActionText`; keep `ObjectText` short.
- Use `HoldDuration` around 1 second for important or irreversible actions (buying, reviving) so they are not triggered by accident.
- Keep `MaxActivationDistance` small in crowded areas so prompts do not stack on screen.
- Players on touch devices tap the prompt itself; leave space around it.

## Pitfalls

- Prompt never appears: parent is not a Part, Model or Attachment; or `Enabled` is false; or a wall blocks line of sight.
- Trusting a LocalScript `Triggered` for rewards: do rewards on the server.
- Reward fires twice: add a debounce or disable the prompt while processing.

## Related
[[00 START HERE - Top G Vault]] · [[Interaction Gate]] · [[World Interaction System Blueprint]] · [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]] · [[30 Official Roblox Docs/UI/Proximity prompts|Proximity prompts (official)]]
