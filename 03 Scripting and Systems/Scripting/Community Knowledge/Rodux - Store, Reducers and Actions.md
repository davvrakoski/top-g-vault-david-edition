---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Rodux - Store, Reducers and Actions"
tags: [roblox, community-knowledge, scripting, state-management, rodux, open-source, apache-2]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/Roblox/rodux
  - https://roblox.github.io/rodux/api-reference/
---
# Rodux - Store, Reducers and Actions

**License: Apache-2.0.** Under this vault's rule only CC0 / CC BY 4.0 / MIT count as "bundle-safe", so treat Rodux as **link only / install as a dependency with its LICENSE and NOTICE kept**. Apache-2.0 itself allows commercial use and modification as long as you keep the license and notices and state changes.

Rodux is Roblox's Luau port of the Redux pattern: all shared client state lives in one **store**, changes happen only by **dispatching actions**, and pure **reducer** functions compute the next state. It is old and stable, and it is the classic partner for Roact / React-Lua UIs. The pattern pays off when many screens read the same data (inventory, currency, settings, quest log) and you want every change to be traceable.

## Core API (from the official reference)

| Call | Does |
| --- | --- |
| `Rodux.Store.new(reducer, initialState?, middlewares?, errorReporter?)` | Create the store; dispatches an internal `@@INIT` action |
| `store:dispatch(action)` | Run an action (a table with a `type` field) through middleware then the reducer |
| `store:getState()` | Current state; treat it as **read-only** |
| `store.changed:connect(function(new, old) end)` | Listen for changes; returns an object with `disconnect` |
| `store:flush()` | Process pending changes now (Rodux calls this every frame for you) |
| `store:destruct()` | Tear down; don't use the store afterwards |
| `Rodux.createReducer(initial, handlers)` | Reducer from a table of handlers keyed by action type |
| `Rodux.combineReducers({ a = ra, b = rb })` | One reducer per state slice |
| `Rodux.makeActionCreator(name, fn)` | Action creator that sets `type` for you |
| `Rodux.thunkMiddleware` | Allows dispatching functions (async flows) |
| `Rodux.loggerMiddleware` | Prints actions and resulting state (dev only) |

## Minimal slice

```lua
local Rodux = require(ReplicatedStorage.Packages.Rodux)

local AddCoins = Rodux.makeActionCreator("AddCoins", function(amount: number)
	return { amount = amount }
end)

local wallet = Rodux.createReducer({ coins = 0 }, {
	AddCoins = function(state, action)
		return { coins = state.coins + action.amount } -- new table, never mutate
	end,
})

local store = Rodux.Store.new(Rodux.combineReducers({ wallet = wallet }), nil, {
	Rodux.thunkMiddleware,
})

store.changed:connect(function(new, old)
	if new.wallet ~= old.wallet then
		updateCoinLabel(new.wallet.coins)
	end
end)

store:dispatch(AddCoins(25))
```

## Behaviour you must know

- **`changed` is batched**: it fires at most once per frame, so several dispatches in one frame give one event. Don't expect a callback per action.
- **Never yield in a `changed` listener**; Rodux throws an error if you do.
- **Immutability is the contract.** Reducers must return a *new* table for anything that changed. Mutating `state.coins += 1` in place means `new.wallet == old.wallet` and listeners skip the update. Copy with `table.clone` for shallow copies.
- Comparing slices by reference (`new.wallet ~= old.wallet`) is cheap and is why immutability matters.

## Where Rodux fits in a Roblox game

- **Client-side UI state** mirrored from the server: the server sends authoritative values over remotes, a client controller dispatches actions, UI reads the store. The server stays the source of truth ([[Server Authority 2026 - What the Community Learned]]).
- Not a replacement for server data saving; persist with your DataStore layer.
- Thunks are handy for "dispatch loading, call remote, dispatch result" flows; pair them with Promises ([[evaera Promise - Async Recipes for Roblox]]).

## When to skip it
Small games with three screens rarely need a store; a module holding values plus a Signal is simpler. Newer atom-based libraries (for example Charm, used in [[Charm Example Game - roblox-ts State Sync Demo (MIT)]]) cut boilerplate. Pick one state pattern per project.

## Related
[[Scripting - Hub]] · [[React-Lua on Roblox - Packages, Hooks and Roact Migration]] · [[Runtime State and FSM Architecture]] · [[Service and Controller Boundaries]]
