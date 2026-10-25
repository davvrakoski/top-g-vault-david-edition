---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Fusion 0.3 - Scopes, State and Reactive UI"
tags: [roblox, community-knowledge, scripting, ui, fusion, reactive, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/dphfox/Fusion
  - https://raw.githubusercontent.com/dphfox/Fusion/main/wally.toml
  - https://elttob.uk/Fusion/0.3/tutorials/fundamentals/scopes/
  - https://elttob.uk/Fusion/0.3/tutorials/fundamentals/computeds/
---
# Fusion 0.3 - Scopes, State and Reactive UI

**License: MIT (bundle-safe).** Wally package `elttob/fusion` (shared realm). The main branch manifest already reads `0.4.0-dev1`, so pin an exact released version in `wally.toml` instead of tracking main.

Fusion is a reactive UI library made for Roblox and Luau: you declare *what* the UI should look like for a given state, and Fusion updates instance properties when that state changes. Compared with hand-wiring `.Changed` events, you stop writing "remember to also update label X" code. Version 0.3 introduced **scopes**, which is the part most older tutorials get wrong, so this note focuses on it. For choosing between Fusion, React-lua, Vide and Iris, see [[UI Libraries - Fusion, React-lua, Vide and Iris]].

## Scopes: the 0.3 idea

A scope is just an array of things to destroy later.

- `scoped(Fusion)` returns a new scope whose methods are all Fusion constructors, so you write `scope:Value(0)` instead of `Fusion.Value(scope, 0)`.
- `scoped(Fusion, { MyComponent = MyComponent })` adds your own functions; duplicate names across tables raise an error.
- `scope:doCleanup()` destroys everything in the scope **in reverse creation order**.
- `scope:innerScope()` makes a child scope that is cleaned when the parent is, but can also be cleaned early (dropdowns, popups).
- `scope:deriveScope()` copies the methods without linking lifetimes.

Rule: every screen or component gets a scope; closing the screen calls `doCleanup` once. No more leaked connections.

## State objects

```lua
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local scoped, peek, Children, OnEvent = Fusion.scoped, Fusion.peek, Fusion.Children, Fusion.OnEvent

local scope = scoped(Fusion)
local coins = scope:Value(0)

-- `use` subscribes; the inner `scope` is cleaned each time this recomputes
local label = scope:Computed(function(use, scope)
	return `Coins: {use(coins)}`
end)

coins:set(peek(coins) + 10) -- peek reads without subscribing
```

- `Value` holds a value you set.
- `Computed` derives a value; it re-runs only when something it `use`d changes.
- `peek(x)` reads now without subscribing. Do **not** use `peek` for dependencies inside a Computed; the computed will not update.
- `scope:Observer(x):onChange(fn)` runs side effects (sounds, analytics) when state changes.
- Animation: `scope:Tween(goalState, TweenInfo)` and `scope:Spring(goalState, speed, damping)` follow another state smoothly.
- Lists: `scope:ForValues(tbl, function(use, scope, v) ... end)` (also `ForPairs`, `ForKeys`) build per-item UI that is created and destroyed as entries change.

## Building instances

```lua
local gui = scope:New "ScreenGui" {
	Parent = player.PlayerGui,
	[Children] = scope:New "TextButton" {
		Size = UDim2.fromOffset(200, 50),
		Text = label,                       -- a state object binds the property
		[OnEvent "Activated"] = function()
			coins:set(peek(coins) + 1)
		end,
	},
}
```

`scope:Hydrate(existingInstance) { ... }` applies the same binding syntax to UI made in Studio, which is a good migration path for teams with designer-built screens.

## Pitfalls

1. **Mixing 0.2 and 0.3 tutorials.** 0.2 code calls `Value(0)` without a scope and uses `Computed(function(use) ...)` without a scope argument. If a snippet has no scope, it is old.
2. **The `LocalShadow` lint.** Naming the Computed's second parameter `scope` shadows the outer one on purpose; silence it with `--!nolint LocalShadow` if your linter complains.
3. **Server use.** Fusion is client UI; don't require it from server scripts.
4. **Huge lists.** ForValues over thousands of items still creates thousands of instances. Page or virtualize big inventories ([[UI Performance - Gradients, Big Lists and Per-Frame Updates]]).

## Related
[[Scripting - Hub]] · [[UI Libraries - Fusion, React-lua, Vide and Iris]] · [[Cleanup Bag Pattern]] · [[Signals, Connections and Leak-Proof Cleanup]]
