---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "GoodSignal - Pure-Luau Signals and Their Caveats"
tags: [roblox, community-knowledge, scripting, signals, events, goodsignal, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/lua-signal-class-comparison-optimal-goodsignal-class/1387063
  - https://gist.github.com/stravant/b75a322e0919d60dde8a0316d1f09d2f
  - https://github.com/Sleitnick/RbxUtil
---
# GoodSignal - Pure-Luau Signals and Their Caveats

**License: MIT (stated in the gist header) - bundle-safe.** Author: stravant, DevForum post of 2 August 2021, updated June 2022 (added `Once`, made repeated `Disconnect` safe).

Custom events ("signals") let modules talk without knowing each other: `Inventory.ItemAdded:Connect(...)`. The old way was wrapping a BindableEvent, which copies arguments (tables lose identity and metatables) and is slower. GoodSignal is a small pure-Luau signal that keeps arguments by reference and is the base many other signal libraries copy. This note explains how it works, what it costs and where it bites. For the general theory see [[Signals, Connections and Leak-Proof Cleanup]].

## API

| Member | Behaviour |
| --- | --- |
| `Signal.new()` | New signal |
| `signal:Connect(fn)` | Returns a Connection |
| `signal:Once(fn)` | Disconnects itself before running on the next fire |
| `signal:Wait()` | Yields until the next `Fire`, returns its arguments |
| `signal:Fire(...)` | Runs every handler with the arguments |
| `signal:DisconnectAll()` | Drops all handlers |
| `connection:Disconnect()` | Unlinks the handler |

## Why it is fast

- **Runner thread reuse.** Handlers run inside a cached coroutine. If a handler does not yield, the same thread runs the next handler, so a `Fire` allocates nothing. Only a handler that yields forces a fresh runner.
- **Linked-list handlers.** Connections form an intrusive linked list, so disconnecting during a `Fire` does not break the loop in progress.
- The 2021 benchmark in the post measured, for example, about 0.8 microseconds per `Fire` versus 3.2 for a BindableEvent-based signal, and 1.2 versus 18.5 for create-and-fire. Treat those as relative numbers; the engine has changed since.

## Caveats you will hit

1. **Strict members.** Signal and Connection use strict metatables: reading a key that is not a real member (for example `connection.Connected`) **errors** instead of returning nil. Code written for `RBXScriptConnection` that checks `.Connected` breaks.
2. **Cleanup library mismatch.** GoodSignal has `DisconnectAll`, not `Destroy`. Janitor's default cleanup looks for `Destroy`; pass the method name explicitly (`janitor:Add(sig, "DisconnectAll")`) or wrap it. Trove handles connections via `Disconnect` automatically. See [[Trove vs Janitor - Cleanup API Side by Side]].
3. **Handlers run immediately**, inside `Fire`, like Roblox's old "immediate" signal mode. Roblox's own events now use **deferred** behaviour by default, so mixing both can change ordering. If a handler fires another signal that changes shared state, read state again after it.
4. **Errors.** An error in one handler is reported but the runner thread is lost; the next handler still runs in a new thread.
5. **No type safety by default.** The original is untyped. Typed forks exist; sleitnick's RbxUtil `Signal` (Wally `sleitnick/signal@2.0.3`, MIT) is a maintained, typed alternative with the same core idea.

## Pattern: typed wrapper (own code)

```lua
local GoodSignal = require(ReplicatedStorage.Packages.GoodSignal)

export type Signal<T...> = {
	Connect: (self: Signal<T...>, fn: (T...) -> ()) -> any,
	Fire: (self: Signal<T...>, T...) -> (),
	Wait: (self: Signal<T...>) -> T...,
}

local ItemAdded: Signal<Player, string> = GoodSignal.new()
ItemAdded:Connect(function(player, itemId) ... end)
```

## When not to use a custom signal
- Crossing client/server: you need RemoteEvents (or Comm, see [[Comm - Namespaced Remotes with Middleware]]).
- Crossing Actors in Parallel Luau: use Actor messaging.
- Instance state that already has `GetPropertyChangedSignal` or attributes: use the built-in signal.

## Related
[[Scripting - Hub]] · [[Signals, Connections and Leak-Proof Cleanup]] · [[Signals, Promises and Cleanup Libraries - Community Picks]] · [[Events vs Polling]]
