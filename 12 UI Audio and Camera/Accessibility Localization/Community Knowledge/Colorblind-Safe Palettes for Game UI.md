---
area: "12 UI Audio and Camera"
cluster: "Accessibility Localization"
title: "Colorblind-Safe Palettes for Game UI"
tags: [roblox, community-knowledge, accessibility, colorblind, palette, ui]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/accessibility
  - https://gameaccessibilityguidelines.com/ensure-no-essential-information-is-conveyed-by-a-colour-alone/
  - https://jfly.uni-koeln.de/color/
  - https://siegal.bio.nyu.edu/color-palette/
---
# Colorblind-Safe Palettes for Game UI

Roblox's own accessibility guidelines say over 5% of people have some form of colour blindness, and the Game Accessibility Guidelines put red/green difficulty at roughly 8-10% of males. In a 30-player server that is often two or three players who can't tell your red team from your green team, your "rare" from your "common", or a poison puddle from a heal zone. The fix is cheap if you plan it early: a palette chosen to survive colour-vision deficiency, and **never colour alone** for essential information.

## Rule 1: colour is never the only signal

Every colour-coded meaning gets a second channel:

| Meaning | Colour | Second channel |
|---|---|---|
| Team / ally vs enemy | Blue vs orange | Icon shape (circle vs diamond), name plate style |
| Rarity | Grey / green / blue / purple / gold | Number of stars or pips, border shape, label text |
| Status effects | Poison green, burn orange, freeze blue | Distinct icons and particle shapes |
| Health bar state | Green -> yellow -> red | Bar length (already), flashing outline at low HP |
| Hazard floor | Red | Stripes or pattern texture, warning icon |
| Correct / wrong answer | Green / red | Tick / cross icon |

The Roblox guideline shows exactly this: adding symbols alongside colours lets players tell items apart in grayscale. Test your UI in grayscale; if you can still play, you've passed the basic check.

## Rule 2: pick hues that survive

The **Okabe-Ito** palette (Masataka Okabe and Kei Ito's Color Universal Design set, widely used in science figures) was designed to stay distinguishable for the common colour-vision types:

| Name | Hex | Typical game use |
|---|---|---|
| Orange | `#E69F00` | Enemy team, warnings |
| Sky blue | `#56B4E9` | Ally team, info |
| Bluish green | `#009E73` | Success, heal |
| Yellow | `#F0E442` | Highlights, currency |
| Blue | `#0072B2` | Mana, water, secondary team |
| Vermillion | `#D55E00` | Damage, danger |
| Reddish purple | `#CC79A7` | Rare / magic |
| Black | `#000000` | Outlines, text |

Blue vs orange is the safest two-team pair; red vs green is the classic failure. If your art direction needs red and green, separate them strongly in **brightness** (light green vs dark red) as well as hue.

## Rule 3: contrast and value

- Hue differences vanish under colour blindness; brightness differences remain. Check that key pairs differ clearly in value (lightness), for example by viewing a grayscale screenshot.
- Text needs strong contrast against its background. The Roblox guidelines recommend picking text/background colours with sufficient contrast; WCAG's 4.5:1 for body text is a good, widely used target.
- Use outlines (`UIStroke`) on world text so it reads on any background.

## Rule 4: offer presets, not just one look

The Game Accessibility Guidelines recommend customisable colours, ideally presets plus a custom option. In Roblox:

1. Keep every meaning colour in one token table (or a StyleSheet theme).
2. Provide presets such as Default, Protanopia/Deuteranopia-friendly (blue/orange), Tritanopia-friendly (red/teal), High contrast.
3. Let players override team colours (my team / enemy team) independently of the art palette.
4. Save the choice in player settings and apply it to UI, Highlights and VFX tints.

```lua
local Themes = {
	Default = { ally = Color3.fromHex("3FA9F5"), enemy = Color3.fromHex("FF4B4B"), heal = Color3.fromHex("3CCB6C") },
	CVD     = { ally = Color3.fromHex("56B4E9"), enemy = Color3.fromHex("E69F00"), heal = Color3.fromHex("009E73") },
}
local current = Themes.Default
local function colorFor(meaning: string): Color3
	return current[meaning]
end
```

Use `colorFor("enemy")` everywhere (UI, `Highlight.OutlineColor`, damage numbers) so a theme switch updates the whole game.

## Testing

- Run screenshots through a colour-blindness simulator (the GAG page recommends testing with one) for protanopia, deuteranopia and tritanopia.
- Grayscale test: temporarily add a `ColorCorrectionEffect` with `Saturation = -1` in Lighting and play a round.
- Ask a colourblind tester; simulators approximate, people confirm.

## Related
[[Accessibility Localization - Hub]] · [[VFX Color Language and Readability]] · [[UI Styling with StyleSheets, Tokens and Themes]] · [[Settings and Accessibility Blueprint]]
