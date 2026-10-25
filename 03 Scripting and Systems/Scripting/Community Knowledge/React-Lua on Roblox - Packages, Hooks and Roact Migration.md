---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "React-Lua on Roblox - Packages, Hooks and Roact Migration"
tags: [roblox, community-knowledge, scripting, ui, react, roact, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/jsdotlua/react-lua
  - https://raw.githubusercontent.com/jsdotlua/react-lua/main/README.md
  - https://github.com/Roblox/rodux
---
# React-Lua on Roblox - Packages, Hooks and Roact Migration

**License: MIT (bundle-safe).** Repository: `jsdotlua/react-lua`, a community fork of Roblox's own React port.

React-Lua is a Luau translation of React (the same architecture as React JS 17-era: components, hooks, reconciler). Roblox uses it internally for its own app UI. Roblox's own repository is a read-only mirror that the community cannot contribute to and that Roblox did not publish to a package registry, so the `jsdotlua` fork exists to publish packages and accept fixes. It is meant to supplant **Roact**, the older community library, and ships a `roact-compat` package to ease migration.

Pick React-Lua when your team already knows React, when UI is large and component-heavy (shops, inventories, settings), or when you want the huge body of React advice to apply. For a smaller reactive library, see [[Fusion 0.3 - Scopes, State and Reactive UI]].

## Packages in the repo

| Package | Purpose |
| --- | --- |
| `react` | Components, hooks, `createElement`, context |
| `react-roblox` | Renderer that turns elements into Roblox Instances |
| `roact-compat` | Roact-style API on top of React for gradual migration |
| `react-test-renderer`, `react-shallow-renderer` | Testing |
| `react-is` | Element type checks |

The packages are published under the `jsdotlua` scope on Wally and npm (for roblox-ts). Check the registry for the exact current names and versions before pinning (unverified from the README itself).

## Minimal component with hooks

```lua
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

local function CoinButton(props: { start: number })
	local coins, setCoins = React.useState(props.start)
	return e("TextButton", {
		Size = UDim2.fromOffset(200, 50),
		Text = `Coins: {coins}`,
		[React.Event.Activated] = function()
			setCoins(coins + 1)
		end,
	})
end

local root = ReactRoblox.createRoot(Instance.new("Folder"))
root:render(ReactRoblox.createPortal(e(CoinButton, { start = 0 }), player.PlayerGui))
```

Differences from React JS that trip people up:
- No JSX; you call `React.createElement` (alias it to `e`).
- Roblox events and property-change listeners use special keys: `[React.Event.Activated]`, `[React.Change.Text]`.
- Children are a table; giving each child a **string key** (`{ Header = e(...), List = e(...) }`) becomes the Instance name and keeps identity stable.
- Hooks follow React's rules: call them unconditionally, at the top of the component.

## Migrating from Roact

1. Swap the Roact dependency for `roact-compat` and get the game running unchanged.
2. Rewrite components one by one to real React (`React.Component` or function components with hooks).
3. Roact's deprecated `_context` is gone; use `React.createContext` (it already existed in Roact and works the same).
4. Roact bindings (`createBinding`, `joinBindings`) are kept in React-Lua, so animated values can stay.
5. Refs on class components now point at the component instance (Roact could not do this).

## State management
Local state lives in hooks. For game-wide state (inventory, settings), teams pair React with a store: Rodux (Apache-2.0, see [[Rodux - Store, Reducers and Actions]]) or newer atom libraries like Charm ([[Charm Example Game - roblox-ts State Sync Demo (MIT)]]).

## Pitfalls
- **Re-render storms.** Calling `setState` every Heartbeat re-renders the tree; animate with bindings or tweens instead.
- **Effects without cleanup.** `React.useEffect` must return a cleanup function when it connects signals, or you leak connections when components unmount.
- **Coverage is uneven.** The repo's status table marks some ported packages as "not yet assessed"; stick to `react` and `react-roblox` for production.

## Related
[[Scripting - Hub]] · [[UI Libraries - Fusion, React-lua, Vide and Iris]] · [[Fusion 0.3 - Scopes, State and Reactive UI]] · [[Signals, Connections and Leak-Proof Cleanup]]
