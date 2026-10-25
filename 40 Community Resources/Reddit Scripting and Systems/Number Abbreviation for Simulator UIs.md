---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/number-abbreviation"
title: "Number Abbreviation for Simulator UIs"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/simulator-number-abbreviation-system-with-custom-decimals/1647339
  - https://devforum.roblox.com/t/alephnum-calculate-up-to-101e308/4761508
cssclasses: [tg-a40]
---

# Number Abbreviation for Simulator UIs

Every simulator needs `1.25K`, `3.4M`, `12.7Qa`. Community versions are everywhere (a 2022 one by @Arthur_Grandwell is widely copied), and the replies always argue about the same things.

## What the threads get right and wrong

- **Use `math.log10`, not a loop of divisions.** The suffix index is `floor(log10(n) / 3)`.
- **Floor, don't round, for display.** Rounding `999,950` up shows `1000K` instead of `999.9K`. Floor at the chosen decimals.
- **Handle edge cases:** 0, negatives, numbers below 1000, and values past your suffix list.
- **Doubles run out.** Luau numbers are 64-bit floats: exact integers only up to 2^53 (about 9 quadrillion), max about 1.8e308. Past ~1e15 your coin counts silently lose precision. Big-number libraries (2026 examples include AlephNum and InfinityNumbers) store mantissa + exponent instead; you need one if your economy goes that high.
- **Store raw numbers, format only in UI.** Never save the abbreviated string.

## Own implementation

```lua
--!strict
local SUFFIXES = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc" }

local function abbreviate(n: number, decimals: number?): string
	local places = decimals or 1
	if n ~= n then return "NaN" end
	local sign = if n < 0 then "-" else ""
	n = math.abs(n)
	if n < 1000 then
		return sign .. tostring(math.floor(n))
	end

	local tier = math.floor(math.log10(n) / 3)
	if tier >= #SUFFIXES then
		return sign .. string.format("%.2e", n) -- beyond the list: scientific notation
	end

	local scaled = n / 10 ^ (tier * 3)
	local factor = 10 ^ places
	-- floor (never round up into the next tier); the tiny epsilon absorbs float error like 229.99999 for 2.3T
	scaled = math.floor(scaled * factor + 1e-9) / factor

	local text = string.format("%." .. places .. "f", scaled)
	if places > 0 then
		text = text:gsub("0+$", ""):gsub("%.$", "") -- trim zeros: "1.0K" -> "1K", "1.20M" -> "1.2M"
	end
	return sign .. text .. SUFFIXES[tier + 1]
end

print(abbreviate(999))       --> 999
print(abbreviate(1250))      --> 1.2K
print(abbreviate(999950))    --> 999.9K
print(abbreviate(3.4e6, 2))  --> 3.4M
print(abbreviate(-12_700))   --> -12.7K
```

Trimming only runs when there are decimals, so integer parts like `100K` are never touched.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[UI Design System]] · [[Practical Luau Pattern Library]] · [[Custom Inventory and Hotbar - Community Approaches]] · [[Math for Game Development]]

<!-- TDOD_GRAPH_END -->
