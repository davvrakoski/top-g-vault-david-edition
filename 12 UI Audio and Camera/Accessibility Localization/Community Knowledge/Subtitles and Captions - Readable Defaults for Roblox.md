---
area: "12 UI Audio and Camera"
cluster: "Accessibility Localization"
title: "Subtitles and Captions - Readable Defaults for Roblox"
tags: [roblox, community-knowledge, accessibility, subtitles, captions, dialogue]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gameaccessibilityguidelines.com/if-any-subtitles-captions-are-used-present-them-in-a-clear-easy-to-read-way/
  - https://create.roblox.com/docs/production/publishing/accessibility
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/reference/engine/classes/TextService
---
# Subtitles and Captions - Readable Defaults for Roblox

Many Roblox players play with the sound off (school, bed, public transport) and some are deaf or hard of hearing. If story, quest instructions or warnings only exist as voice or audio, those players miss them. **Subtitles** show spoken words; **captions** also describe important sounds ("[footsteps behind you]", "[alarm blaring]"). Both are cheap to build once and reuse for every line.

## Readable defaults (Game Accessibility Guidelines)

| Guideline | Value | Roblox translation |
|---|---|---|
| Minimum size | 46 px at 1080p | About 4.3% of screen height; compute from `ViewportSize.Y` |
| Background | Solid or semi-opaque box, ideally plus outline/shadow | Frame with BackgroundTransparency ~0.35 + `UIStroke` on text |
| Line length | No more than 40 characters per line | Cap the box width; let text wrap |
| Lines | Two per subtitle (three in exceptional cases) | Split long lines into sequential cards |
| Speaker ID | Name on a character's first line; colour-code speakers | Rich text: `<b>Mara:</b>` in the speaker's colour |

Clashes between readability and art style should be solved with **options** (size, background opacity, speaker colours), not by picking one look for everyone.

## Size that scales with the screen and the player

Pixel text sizes that look fine on a monitor are tiny on a phone in landscape. Scale with viewport height and respect the Roblox Text Size setting:

```lua
local GuiService = game:GetService("GuiService")
local camera = workspace.CurrentCamera

local PREF_MULT = {
	[Enum.PreferredTextSize.Medium] = 1,
	[Enum.PreferredTextSize.Large] = 1.15,
	[Enum.PreferredTextSize.Larger] = 1.3,
	[Enum.PreferredTextSize.Largest] = 1.5,
}

local function subtitleTextSize(userScale: number): number
	local base = camera.ViewportSize.Y * (46 / 1080) -- the 46px@1080p guideline
	return math.floor(math.max(18, base) * userScale)
end
```

Note: the engine already enlarges ordinary text for `PreferredTextSize`, except where `TextScaled` or a `UITextSizeConstraint` caps it. If you compute sizes yourself as above, either apply the `PREF_MULT` table **or** let the engine scale, not both (check in Studio which path your labels use). Re-run on `ViewportSize` changes (phone rotation, window resize).

## Background and contrast

- Use `GuiService.PreferredTransparency` (Background Transparency setting): multiply your box's `BackgroundTransparency` by it, as the docs recommend, so players who choose opaque backgrounds get them.
- White or near-white text, dark box, plus a thin dark `UIStroke`. Avoid coloured text for whole lines; colour only the speaker name.

## Timing

- Show a line for at least ~1.5 s, and roughly as long as the voice clip plus 0.3 s.
- Without voice, a reading-speed rule borrowed from film/TV subtitling is about 15-17 characters per second (industry convention, not from the sources above; unverified for games); let players advance manually in story dialogue.
- Don't stack more than two subtitle cards; newer lines push older ones out.

## Captions for gameplay sounds

Directional or warning sounds need captions when they carry information:

- `[Zombie groan - left]`, `[Glass breaks - upstairs]`, `[Engine starting]`.
- Show direction with a small arrow or edge indicator instead of words when possible.
- Make "sound captions" a separate toggle from dialogue subtitles; some players want one without the other.

## Localization and filtering

- Store lines as localization keys (see the Translator API note) so subtitles translate with the rest of the game; plan for 30% longer text.
- Any line containing player-written text (names, signs) must pass `TextService` filtering before display.

## Settings checklist

- [ ] Subtitles **on by default** for story content (players can turn them off)
- [ ] Size: Small / Medium / Large / Extra large
- [ ] Background opacity slider (and honour PreferredTransparency)
- [ ] Speaker names and colours toggle
- [ ] Sound captions toggle
- [ ] Tested on a phone in landscape at the smallest setting

## Related
[[Accessibility Localization - Hub]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Text-to-Speech and Speech-to-Text with the Audio API]] · [[Settings and Accessibility Blueprint]]
