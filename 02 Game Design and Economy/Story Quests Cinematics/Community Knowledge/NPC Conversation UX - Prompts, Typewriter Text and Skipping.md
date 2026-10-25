---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "NPC Conversation UX - Prompts, Typewriter Text and Skipping"
tags: [roblox, community-knowledge, dialogue, npc, ui, mobile, accessibility]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/TextLabel
  - https://create.roblox.com/docs/ui/animation
  - https://create.roblox.com/docs/production/publishing/accessibility
---
# NPC Conversation UX - Prompts, Typewriter Text and Skipping

A dialogue system lives or dies on feel: how you start talking, how fast text appears, how quickly you can get out. On Roblox you must also design for touch screens, gamepads and players who read slowly or not at all. These are the conventions that most polished Roblox RPG and story games follow, with the engine features that implement them.

## 1. Starting a conversation: ProximityPrompt

- Put a `ProximityPrompt` on the NPC's `HumanoidRootPart` (or an attachment above the head).
- `ActionText = "Talk"`, `ObjectText = "Blacksmith"`. `HoldDuration = 0` for talking (holds are for destructive or costly actions).
- `MaxActivationDistance` around 8-10 studs; `RequiresLineOfSight = true` so players can't talk through walls.
- Use `Exclusivity = OnePerButton` when several NPCs stand close, so only the nearest shows.
- Listen to `Triggered` on the **server** to start the conversation state (the server must know who is talking to whom), then tell the client to open the UI.

## 2. Typewriter text with MaxVisibleGraphemes

`TextLabel.MaxVisibleGraphemes` limits how many characters display, so you set the full `Text` once (layout and wrapping stay stable) and raise the number over time. Roblox documents it as the intended way to build a typewriter effect, and it counts graphemes, so emoji and accented letters don't break.

```lua
-- Own example (client)
local function typeOut(label: TextLabel, text: string, cps: number)
	label.Text = text
	label.MaxVisibleGraphemes = 0
	local total = utf8.len(text) or #text
	local shown = 0
	while shown < total do
		if label:GetAttribute("SkipRequested") then break end
		shown += 1
		label.MaxVisibleGraphemes = shown
		task.wait(1 / cps)
	end
	label.MaxVisibleGraphemes = -1   -- -1 = show everything
	label:SetAttribute("SkipRequested", false)
end
```

Good speeds are roughly 30-60 characters per second. Add a slight pause after `.`, `?`, `!` for rhythm.

## 3. The two-tap rule

- **First tap/click/button:** finish the current line instantly.
- **Second tap:** advance to the next line.
- Support **every input**: click anywhere on the dialogue box, `E`/`Space` on keyboard, `ButtonA` on gamepad. Use one input action for "advance" so all devices behave the same.
- Always show a visible **Skip / Close** button. Players who replay a quest should never be trapped.

## 4. Choices

- Max 3-4 options, short labels, big touch targets (at least ~44 px tall on phone).
- Gamepad: set `GuiService.SelectedObject` to the first choice when choices appear.
- Grey out locked choices with the reason ("Requires Level 5") rather than hiding them; it teaches goals.

## 5. Camera and world

- Optional: tween the camera to frame the NPC, but return control quickly and never during combat.
- Freeze or slow the player only if the conversation is safe; otherwise allow walking away to cancel (check distance on the server too).
- Make the NPC face the player and play a talk animation loop. Cheap, sells the moment.

## 6. Accessibility and localization

- Text size should scale with screen size (`UITextSizeConstraint`, `TextScaled` with limits) and pass contrast checks.
- Use localization keys (the dialogue-as-data note) and let `AutoLocalize` translate.
- Don't rely on voice or color alone for important info.

## Related
[[Story Quests Cinematics - Hub]] - [[Dialogue and Cutscene Blueprint]] - [[Dialogue Trees as Data - Nodes, Conditions and Effects]] - [[Quest System Blueprint]]
