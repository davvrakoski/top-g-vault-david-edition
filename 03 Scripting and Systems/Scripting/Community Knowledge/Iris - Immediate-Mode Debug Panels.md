---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Iris - Immediate-Mode Debug Panels"
tags: [roblox, community-knowledge, scripting, debugging, tools, iris, imgui, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/SirMallard/Iris
  - https://github.com/ocornut/imgui
---
# Iris - Immediate-Mode Debug Panels

**License: MIT (bundle-safe).** Wally: `sirmallard/iris`. No external dependencies.

Iris is an immediate-mode GUI library for Roblox modelled on Dear ImGui. Instead of building a ScreenGui and wiring events, you *call* widget functions every frame and Iris creates, updates and removes the instances for you. That makes it the fastest way to build **developer tools**: tuning sliders for weapon recoil, a live view of a state machine, a spawn menu for testers, a network stats overlay. It is not meant for player-facing UI; use Fusion or React-Lua for that.

## Basic shape

```lua
local Iris = require(ReplicatedStorage.Packages.Iris).Init()

local recoil = Iris.State(1.5)      -- persists between frames
local godMode = Iris.State(false)

Iris:Connect(function()             -- runs every frame
	Iris.Window({"Combat Tuning"})
		Iris.Text({`FPS: {math.floor(1 / lastDt)}`})
		Iris.SliderNum({"Recoil", 0.1, 0, 5}, { number = recoil })
		Iris.Checkbox({"God mode"}, { isChecked = godMode })
		if Iris.Button({"Respawn"}).clicked() then
			RespawnRemote:FireServer()
		end
	Iris.End()
end)
```

How to read this:
- `Iris.Window` opens a container; **every container needs a matching `Iris.End()`**. A missing `End` is the number one Iris bug and shows up as widgets nesting in strange places.
- Widget arguments come as an array (`{"Label", ...}`); state bindings come as a second table.
- `Iris.State(v)` holds values across frames; read with `:get()`, write with `:set(v)`.
- Events are functions on the returned widget: `.clicked()`, `.checked()`, `.hovered()`. They return true only on the frame the event happened.

(The exact argument lists for each widget are in the Iris docs; check them before relying on the slider argument order shown here.)

## Good uses in a Roblox project

| Tool | Widgets |
| --- | --- |
| Live tuning of a config module | SliderNum / InputNum bound to states, a "Copy as Luau" button that prints the table |
| State machine viewer | Text per state, highlight the current one |
| Spawn / teleport menu for QA | Combo of locations + Button |
| Performance overlay | Text lines for memory, instance count, remote calls per second |
| Feature flag toggles in test servers | Checkbox per flag ([[Config Feature Flags and Content Data]]) |

## Shipping safely

1. **Gate it.** Only `Init()` Iris for developers: check `RunService:IsStudio()` or a server-sent admin flag. A debug menu shipped to everyone is an exploit vector if its buttons fire remotes.
2. **Server still decides.** A "give coins" button must fire a remote that the server checks against an admin list ([[Admin Command Safety - Server-Side Permission Checks]]).
3. **Cost.** Immediate mode does work every frame. Close windows you don't need, and avoid huge tables of widgets; it is a dev tool, not a 60 fps HUD.
4. **Strip from releases** if you can: keep Iris under a `DevPackages` or a dev-only folder so production builds don't include it ([[Wally Dev Dependencies and Lockfiles for Test Packages]]).

## Why immediate mode helps for tools
Retained UI requires you to sync UI with data (create once, update on change, destroy on removal). Immediate mode re-describes the UI from current data every frame, so the panel can never be "out of sync". That trade (some CPU per frame for zero sync bugs) is exactly right for debug tools and exactly wrong for complex player UI.

## Related
[[Scripting - Hub]] · [[UI Libraries - Fusion, React-lua, Vide and Iris]] · [[Config Feature Flags and Content Data]] · [[Admin Command Safety - Server-Side Permission Checks]]
