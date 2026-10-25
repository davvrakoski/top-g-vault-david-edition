---
area: "12 UI Audio and Camera"
cluster: "Accessibility Localization"
title: "Translator API in Luau - FormatByKey, Parameters and Fallbacks"
tags: [roblox, community-knowledge, localization, translator, luau, i18n]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/localization/localize-with-scripting
  - https://create.roblox.com/docs/production/localization/translate-dynamic-content
  - https://create.roblox.com/docs/production/localization/auto-translate-dynamic-content
  - https://create.roblox.com/docs/reference/engine/classes/LocalizationService
  - https://create.roblox.com/docs/reference/engine/classes/Translator
  - https://devforum.roblox.com/t/introducing-the-real-time-translation-api/3550206
---
# Translator API in Luau - FormatByKey, Parameters and Fallbacks

Roblox's automatic translation catches static UI text, but scripted text ("You earned 1,250 coins", "Wave 7 begins in 5", item names built from data) slips through or gets translated badly because the number is baked into the string. The fix is to keep text in a localization table with **keys and parameters**, and format it at runtime with a `Translator`. Most of the world's Roblox players don't play in English, so this is reach, not polish.

## The objects

| API | Use |
|---|---|
| `LocalizationService:GetTranslatorForPlayerAsync(player)` | Translator for that player's locale (yields, can fail) |
| `LocalizationService:GetTranslatorForLocaleAsync("es")` | Translator for a fixed locale, used as fallback or for previews |
| `Translator:FormatByKey(key, args)` | Look up a **Key** row and fill parameters |
| `Translator:Translate(context, source)` | Look up by source string (with context override) |
| `Translator.LocaleId` | Current locale; listen for changes |
| `Player.LocaleId` | The player's locale string |

The docs warn the `Get...Async` calls can fail on poor connections and recommend wrapping them in a helper with a fallback translator.

## Table entries with parameters

| Key | Source | es |
|---|---|---|
| `Coins_Earned` | `You earned {1:num} coins` | `Ganaste {1:num} monedas` |
| `Wave_Starts` | `Wave {Wave:int} starts in {Seconds:int}` | `La oleada {Wave:int} empieza en {Seconds:int}` |
| `From_Place` | `I am from {Place:translate}.` | `Soy de {Place:translate}.` |

Format specifiers from the docs: `int`, `fixed` (two decimals, no separators), `num` (two decimals with locale separators), `hex`/`HEX`, `datetime`, `iso8601`, `shorttime`, `shortdatetime`, `shortdate` (timestamps formatted for the player's locale), and `translate` (look up the value itself in the table). Translators can **reorder** parameters freely in their language, which is why parameters beat string concatenation.

## A small helper module

```lua
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")

local T = {}
local player = Players.LocalPlayer
local translator, fallback

local ok, res = pcall(LocalizationService.GetTranslatorForPlayerAsync, LocalizationService, player)
if ok then translator = res end
local ok2, res2 = pcall(LocalizationService.GetTranslatorForLocaleAsync, LocalizationService, "en-us")
if ok2 then fallback = res2 end

function T.key(key: string, args: { [any]: any }?): string
	for _, tr in { translator, fallback } do
		if tr then
			local good, text = pcall(tr.FormatByKey, tr, key, args)
			if good then return text end
		end
	end
	return key -- last resort: show the key so missing strings are obvious in testing
end

T.changed = Instance.new("BindableEvent")
if translator then
	translator:GetPropertyChangedSignal("LocaleId"):Connect(function()
		T.changed:Fire()
	end)
end

return T
```

Usage: `label.Text = T.key("Wave_Starts", { Wave = 7, Seconds = 5 })`. Re-render your labels when `T.changed` fires, because players can switch language mid-session (the docs show listening to `LocaleId`).

`FormatByKey` errors when the key is missing, hence the `pcall`. Showing the raw key in that case makes missing rows easy to spot in a pseudo-locale test.

## Rules that save translators pain

- **Never concatenate sentences.** `"You have " .. n .. " lives"` can't be translated in languages with different word order. Use one key with a parameter.
- **Plural forms differ by language.** Simple approach: separate keys for 1 and many (`Lives_One`, `Lives_Many`) and pick in code; some languages need more forms, so ask your translators.
- **Give context.** Fill the table's Context/Example columns. "Close" (door) and "Close" (menu) translate differently.
- **Keep rich text tags simple** and outside words where possible; tell translators not to translate tags.
- **Numbers and dates via specifiers**, not your own formatting, so separators follow the locale.
- **Images with text** can be localized: put asset IDs in the table as Key rows and fetch them with `FormatByKey`, as the docs show.

## Player-generated or rare text

For text that can't be in a table (player-written content, generated quest names), Roblox documents a **real-time translation** Open Cloud API, called from the server through the Open Cloud client package with your universe ID. The docs label it early development and subject to change; follow the linked DevForum announcement before depending on it. Player text still needs normal text filtering before others see it.

## Testing

- Switch your Roblox language or use Studio's locale emulation to check layouts in long languages (German, Portuguese, Russian).
- Test the failure path: temporarily force `translator = nil` and make sure the UI still shows the fallback.

## Related
[[Accessibility Localization - Hub]] · [[Localization Production Workflow]] · [[Accessibility, Input and Localization]] · [[Rich Text and Typewriter Dialogue - MaxVisibleGraphemes]]
