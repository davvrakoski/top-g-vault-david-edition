---
area: "07 AI and Combat"
cluster: "Combat"
title: "Time-to-Kill Math and the Weapon Balance Sheet"
tags: [roblox, community-knowledge, combat, ttk, weapon-balance, spreadsheet, shooters]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://siege.gg/news/cod-bo7-multiplayer-understanding-ttk-time-to-kill-speed
  - https://splitgatearenareloaded.wiki.gg/wiki/Blitz
  - https://create.roblox.com/docs/reference/engine/classes/ModuleScript
  - https://create.roblox.com/docs/reference/engine/classes/HttpService#JSONDecode
---
# Time-to-Kill Math and the Weapon Balance Sheet

Time to kill (TTK) is the single number that defines how a shooter feels. Low TTK (under ~0.4 s) makes positioning and first shot decisive, like Call of Duty; high TTK (1 s and up) gives time to react, strafe and heal, like arena shooters and most Roblox anime/sim PvP. Siege.gg's Black Ops 7 guide quotes rough averages of ~0.30-0.40 s for strong assault rifles and ~0.25-0.35 s for close-range SMGs. If you never compute TTK, your weapons are balanced by accident.

## The core formulas

- **Shots to kill (STK)** = ceil(effective HP / damage per shot). STK is a count; TTK is a time. Players mix them up.
- **TTK** = (STK - 1) / fire rate (shots per second). The first shot lands at time 0, so a 3-shot gun at 10 shots/s has a TTK of 0.2 s, not 0.3 s.
- Add **reload** if STK exceeds the magazine, and **burst delay** for burst weapons.
- With headshots: damage per shot = body × (1 - h) + head × h for a headshot ratio h; better, compute STK for "all body" and "all head" and show both. Splitgate's wiki lists optimal TTK with a mix such as 6 headshots and 2 body shots, which shows how STK changes per zone.
- **Effective HP** includes armor or shields (see the damage formula note).

Worked example: 100 HP, rifle 24 body / 36 head, 600 RPM (10/s). All body: STK 5, TTK 0.4 s. All head: STK 3, TTK 0.2 s.

## Accuracy-adjusted TTK

Theoretical TTK assumes every shot hits. Real TTK = (STK - 1) / (fire rate × hit rate). Measure hit rate per weapon from analytics (shots fired vs shots hit) and plug it back into the sheet: a gun with great theoretical TTK and 20% real hit rate is not overpowered.

## Damage falloff

Most shooters reduce damage with distance. Give each weapon `falloffStart`, `falloffEnd`, `minDamageMult` and compute STK at 3 ranges (close, mid, long). Your sheet then shows each weapon's "best range", which is how you give SMG/rifle/sniper distinct jobs.

## The balance sheet

One row per weapon, inputs on the left, formulas on the right:

| Input columns | Derived columns |
|---|---|
| damage, headMult, RPM, mag, reload, falloffStart/End, minMult, ADS time, spread | DPS, STK body/head at 3 ranges, TTK body/head at 3 ranges, time to empty mag, damage per mag, TTK + ADS |

Flag rules (conditional formatting):

- Any weapon whose TTK at its **worst** range beats another weapon's TTK at that weapon's **best** range: dominant, fix it.
- Damage per mag below target effective HP: the weapon cannot kill without reloading.
- Two weapons within 5% on every derived column: redundant.

## From sheet to game

Keep the sheet as the source of truth and export to a Luau ModuleScript (a small script that turns CSV rows into `return { Rifle = { damage = 24, ... } }`). Paste or sync it into `ReplicatedStorage/WeaponStats`. Avoid loading balance data from the web at runtime for combat; a bad edit breaks every server.

```lua
local function ttk(stats, hp, headRatio)
	local per = stats.damage * (1 - headRatio) + stats.damage * stats.headMult * headRatio
	local stk = math.ceil(hp / per)
	local shotsPerSec = stats.rpm / 60
	local reloads = math.floor((stk - 1) / stats.mag)
	return (stk - 1) / shotsPerSec + reloads * stats.reload
end
```

Run this in a Studio command bar or test to print the table after every balance change.

## Picking a TTK target

- Mobile-heavy audience: longer TTK (0.8 s+) so touch players can react.
- Many weapons, short rounds: medium (0.4-0.7 s).
- Health regen or healers in the game: TTK must be short enough that focus fire beats healing.

## Related
[[Combat - Hub]] - [[Recoil, Spread and Bloom for Roblox Guns]] - [[Config-Driven Weapons]] - [[Headshots and Hit Zones - Damage Multipliers and Accessory Hits]] - [[Combat Feel Tuning Worksheet]]
