---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Rich Text and Typewriter Dialogue - MaxVisibleGraphemes"
tags: [roblox, community-knowledge, ui, rich-text, dialogue, text]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/rich-text
  - https://create.roblox.com/docs/reference/engine/classes/TextLabel
  - https://create.roblox.com/docs/reference/engine/libraries/utf8
  - https://create.roblox.com/docs/ui/text-filtering
---
# Rich Text and Typewriter Dialogue - MaxVisibleGraphemes

NPC dialogue, quest text, item descriptions and kill feeds all want inline styling: a coloured item name, a bold number, a highlighted keyword. Rich text lets one `TextLabel` do that without stacking several labels. Combined with `MaxVisibleGraphemes`, it also gives you the classic typewriter reveal with no layout jumping.

## Turn it on

Set `RichText = true` on a `TextLabel`, `TextButton` or `TextBox`. Studio renders the final look when the checkbox is on, which helps catch broken tags. `ContentText` is the read-only string with tags stripped.

## Tags worth knowing

| Effect | Markup |
|---|---|
| Colour | `<font color="#FF7800">orange</font>` or `color="rgb(255,125,0)"` |
| Size | `<font size="40">big</font>` |
| Font face | `<font face="Michroma">...</font>` |
| Weight | `<font weight="heavy">` or `weight="900"` |
| Transparency | `<font transparency="0.5">` |
| Outline | `<stroke color="#00A2FF" thickness="2" transparency="0.25" joins="miter">25 gems</stroke>` |
| Bold / italic / underline / strike | `<b>`, `<i>`, `<u>`, `<s>` |
| Line break | `<br/>` |
| Upper case / small caps | `<uc>` / `<sc>` |
| Highlight behind text | `<mark color="#009966" transparency="0">` |
| Comment (not rendered) | `<!-- note -->` |

Escape literal characters: `&lt;` `&gt;` `&quot;` `&apos;` `&amp;`.

## Keep colours in one place

Don't hard-code hex strings across scripts. Build helpers that read your design tokens:

```lua
local Palette = { item = "#FFC94A", danger = "#FF5A5A", ally = "#56B4E9" }

local function tint(text: string, key: string): string
	return string.format('<font color="%s">%s</font>', Palette[key], text)
end

label.Text = "You found " .. tint("Rusty Key", "item") .. "!"
```

## Escaping player text (do this every time)

If a player-supplied string (pet name, sign text, chat in a custom bubble) goes into a rich-text label, a player can type tags and restyle or break your UI. Filter it with `TextService` first (required for any text other players see), then escape it:

```lua
local function escapeRich(s: string): string
	return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
		:gsub('"', "&quot;"):gsub("'", "&apos;"))
end
```

Escape `&` first, otherwise you double-escape the others.

## Typewriter reveal with MaxVisibleGraphemes

`MaxVisibleGraphemes` limits how many graphemes are shown; `-1` shows all. The docs note the layout is calculated as if everything is visible, so lines don't re-wrap or jump while revealing. Tags are not counted because the reveal works on the displayed text.

```lua
local RunService = game:GetService("RunService")

local function typewrite(label: TextLabel, text: string, charsPerSecond: number)
	label.Text = text
	label.MaxVisibleGraphemes = 0
	local total = 0
	for _ in utf8.graphemes(label.ContentText) do
		total += 1
	end
	local shown = 0
	while shown < total do
		shown += charsPerSecond * RunService.Heartbeat:Wait()
		label.MaxVisibleGraphemes = math.min(math.floor(shown), total)
	end
	label.MaxVisibleGraphemes = -1
end
```

Counting with `utf8.graphemes` (not `#text` or `string.len`) matters for translated text and emoji, where one visible character can be several bytes.

## Dialogue UX rules

- **Skip on input.** First press completes the line (`MaxVisibleGraphemes = -1`), second press advances. Never force players to wait.
- **Speed 30-60 characters per second**, and offer "instant text" in settings. Treat Reduce Motion as a hint to default to instant.
- **Pause on punctuation** for rhythm: add a short wait after `.`, `!`, `?` and `,`.
- **Blip sounds** every 2-3 characters, not every character, with slight pitch variation.
- **Leave room for translation.** German and Portuguese often run 30% longer; size boxes with `AutomaticSize` or test with long strings.

## Pitfalls

- `TextScaled = true` with rich text: size tags fight the scaler. Pick a fixed `TextSize` per style.
- Unclosed tags render the raw markup. Validate strings at load in Studio.
- Localization: keep tags outside translatable words where possible, and give translators the tag rules (see the Translator API note).

## Related
[[UI UX - Hub]] · [[Localization Production Workflow]] · [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]] · [[Fonts for Roblox UI - Built-in Fonts, Builder and OFL]]
