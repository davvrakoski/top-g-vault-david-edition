---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Luau String Interpolation and Formatting Recipes"
tags: [roblox, community-knowledge, scripting, luau, strings]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/strings
  - https://create.roblox.com/docs/reference/engine/libraries/string
  - https://rfcs.luau.org/syntax-string-interpolation.html
---
# Luau String Interpolation and Formatting Recipes

Almost every game prints numbers to players: timers, currency, damage popups, leaderboard ranks, debug logs. Luau gives you two tools for this: backtick **interpolated strings** for readable glue text, and `string.format` for exact number formatting. Knowing which to reach for (and the few traps in each) removes a whole class of "why does my UI say 3.0000001" bugs.

## Interpolated strings (backticks)

- Wrap the string in backticks and put any expression in `{}`: `` `Wave {wave} of {maxWaves}` ``.
- Each value is converted with `tostring`, so tables print as addresses and `nil` prints as `nil` (no error). Guard optional values first.
- To show a literal brace or backtick, escape it with a backslash: `` `\{not code\}` ``.
- There are **no format specifiers** inside the braces. `` `{x:.2f}` `` is not Python; you must call `string.format` inside the braces.
- You cannot call a function with a backtick string and no parentheses (the way `print "hi"` works for normal strings). Always write `` print(`hi {name}`) ``.

```lua
local function hudLine(player: Player, coins: number, mult: number)
	return `{player.DisplayName}: {coins} coins (x{string.format("%.1f", mult)})`
end
```

## string.format cheat sheet

| Specifier | Use | Example result |
| --- | --- | --- |
| `%d` | expects an integer number | `string.format("%d", 42)` -> `42` |
| `%.2f` | fixed decimals | `3.14159` -> `3.14` |
| `%5.1f` | width 5, 1 decimal, right-aligned | `" 12.5"` |
| `%02d` | zero-pad | `7` -> `07` (timers) |
| `%x` / `%X` | hex | color codes, debug ids |
| `%s` | a string, verbatim | |
| `%*` | any value, as if `tostring` was called (this is what backtick strings compile to) | |
| `%q` | quoted, escaped string | safe logging of user text |
| `%%` | a literal percent sign | `"50%"` |

Pitfall: `%d` expects an integer. Round floats yourself first (`math.floor`, `math.round`) so you decide how 2.5 is shown instead of relying on implicit conversion.

## Recipes

**Countdown timer (mm:ss)**
```lua
local function mmss(seconds: number): string
	local s = math.max(0, math.floor(seconds))
	return string.format("%02d:%02d", s // 60, s % 60)
end
```

**Thousands separators** (reverse, chunk by 3, reverse back):
```lua
local function withCommas(n: number): string
	local s = tostring(math.floor(n))
	local sign, digits = s:match("^(-?)(%d+)$")
	local grouped = digits:reverse():gsub("(%d%d%d)", "%1,"):reverse()
	return sign .. grouped:gsub("^,", "")
end
```
For K/M/B suffixes see [[Number Abbreviation for Simulator UIs]].

**Splitting and trimming input**
- `string.split("a,b,c", ",")` returns `{"a", "b", "c"}` (plain separator, not a pattern).
- `s:match("^%s*(.-)%s*$")` trims whitespace.
- `string.rep("-", 20)` builds divider lines for debug output.

## Performance and correctness notes

- Building a long string in a loop with `..` creates many temporary strings. Collect pieces in a table and call `table.concat(parts)` once.
- Interpolation is fine for UI and logs; for per-frame text updates, only rewrite `TextLabel.Text` when the value actually changed (see [[UI Performance - Gradients, Big Lists and Per-Frame Updates]]).
- Player-written text shown to others must still go through text filtering; formatting does not make it safe ([[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]).
- Lua patterns are not regex: no `|` alternation, and `-` is a lazy quantifier, so escape it as `%-` when you mean a dash.

## Checklist
- [ ] Glue text uses backticks; numbers that need precision use `string.format`.
- [ ] Floats are rounded before `%d`.
- [ ] Hot loops use `table.concat`, not repeated `..`.
- [ ] User text is filtered before display.

## Related
[[Scripting - Hub]] · [[Luau Programming]] · [[Practical Luau Pattern Library]] · [[Number Abbreviation for Simulator UIs]]
