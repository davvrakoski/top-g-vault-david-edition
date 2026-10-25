---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/signals-promises-cleanup-libraries"
title: "Signals, Promises and Cleanup Libraries - Community Picks"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/engine-native-signal-implementation/4799528
  - https://devforum.roblox.com/t/scythe-a-data-oriented-cleanup-library-for-roblox-luau/4759291
  - https://devforum.roblox.com/t/i-vow-you-youll-switch-from-promisefuture-after-reading-this-post/4788948
  - https://devforum.roblox.com/t/best-community-frameworks-and-architectural-patterns-for-clean-scalable-luau-code/4887691
cssclasses: [tg-a40]
---

# Signals, Promises and Cleanup Libraries - Community Picks

Three kinds of "glue" library appear in almost every mid-size Roblox codebase. Community advice: **borrow these freely** (unlike your data and networking core, see [[Knit Is Archived - Frameworks vs Your Own Module Loader]]).

## 1. Signals (custom events)

- Roblox has no native `Signal.new()`. An Aug 2026 feature request (@Johnnyfireball123) calls the Signal class "the most reinvented wheel" on the platform: BindableEvents work but carry instance overhead and can't be typed.
- Common picks: sleitnick's Signal (called genuinely good in the frameworks thread by @Sametc4n), GoodSignal-style pure-Luau signals.
- Still use BindableEvents where an instance-based event is required (some use them for cross-Actor messaging in Parallel Luau).

## 2. Cleanup ("maids")

- **Janitor**, **Maid**, **Trove** track connections, instances, threads and functions, then clean them all in one call.
- 2026 newcomer **Scythe** (@checcerr) claims a zero-allocation, data-oriented design that is much lighter than Janitor; Janitor's maintainer (@pobammer) answered with optimizations of his own the same day. Benchmarks moved quickly: re-check before switching.
- The pattern matters more than the library; see [[Cleanup Bag Pattern]].

## 3. Promises / Futures

- **evaera's Promise** is the long-time standard for chaining async work with cancellation and error handling. Futures (lighter) are a common alternative.
- **Vow** (2026, same author as Scythe) uses integer handles into module-level arrays instead of objects, claiming large speed and memory gains.
- Counter-voice in the thread: some argue for dropping the abstraction and writing plain Luau with `task` and `pcall`.

## Own: a minimal typed signal (enough for most games)

```lua
--!strict
export type Connection = { Disconnect: (self: Connection) -> () }
export type Signal<T...> = {
	Connect: (self: Signal<T...>, fn: (T...) -> ()) -> Connection,
	Fire: (self: Signal<T...>, T...) -> (),
}

local Signal = {}

function Signal.new<T...>(): Signal<T...>
	local listeners: {[{}]: (T...) -> ()} = {}
	local self = {}

	function self.Connect(_, fn: (T...) -> ()): Connection
		local key = {}
		listeners[key] = fn
		return {
			Disconnect = function()
				listeners[key] = nil
			end,
		}
	end

	function self.Fire(_, ...: T...)
		for _, fn in listeners do
			task.spawn(fn, ...)
		end
	end

	return (self :: any) :: Signal<T...>
end

return Signal
```

Spawning each listener keeps one erroring or yielding handler from blocking the rest. Listener order is not guaranteed.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Signals, Connections and Leak-Proof Cleanup]] · [[Cleanup Bag Pattern]] · [[Coroutines vs the task Library]] · [[Memory Leaks and Lifecycle Management]]

<!-- TDOD_GRAPH_END -->
