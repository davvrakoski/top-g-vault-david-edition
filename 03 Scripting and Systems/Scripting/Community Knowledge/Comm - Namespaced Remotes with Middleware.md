---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Comm - Namespaced Remotes with Middleware"
tags: [roblox, community-knowledge, scripting, networking, remotes, rbxutil, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/Sleitnick/RbxUtil
  - https://sleitnick.github.io/RbxUtil/api/ServerComm/
  - https://sleitnick.github.io/RbxUtil/api/ClientComm/
  - https://sleitnick.github.io/RbxUtil/api/RemoteProperty/
---
# Comm - Namespaced Remotes with Middleware

**License: MIT (bundle-safe).** Part of sleitnick's RbxUtil; Wally `sleitnick/comm@1.0.1`. Comm is the networking layer Knit used internally, published standalone, so it keeps working now that Knit itself is archived ([[Knit Is Archived - Frameworks vs Your Own Module Loader]]).

Comm removes RemoteEvent boilerplate: instead of hand-creating `RemoteEvent` instances in ReplicatedStorage and keeping names in sync, a server module declares functions, signals and replicated properties under a parent instance, and the client builds a matching object. Middleware hooks let you validate or transform every call in one place.

## Server side: ServerComm

| Method | Creates |
| --- | --- |
| `ServerComm.new(parent, namespace?)` | Comm bound to a parent Instance; namespace avoids clashes when several systems share a parent |
| `:BindFunction(name, fn, inbound?, outbound?)` | RemoteFunction; `fn(player, ...)` |
| `:WrapMethod(tbl, name, inbound?, outbound?)` | Exposes `tbl:name(player, ...)` under the same name |
| `:CreateSignal(name, unreliable?, inbound?, outbound?)` | RemoteSignal; `unreliable = true` uses an UnreliableRemoteEvent |
| `:CreateProperty(name, initial, inbound?, outbound?)` | RemoteProperty replicated to clients |
| `:Destroy()` | Removes it all |

RemoteProperty values can be global or per player: `Set` (everyone, overriding custom values), `SetTop` (everyone without custom values), `SetFor(player, v)`, `SetForList`, `SetFilter(predicate, v)`, `ClearFor`, `Get`, `GetFor`.

## Client side: ClientComm

- `ClientComm.new(parent, usePromise, namespace?)`; `usePromise = true` makes remote functions return Promises ([[evaera Promise - Async Recipes for Roblox]]).
- `:GetFunction(name)`, `:GetSignal(name)`, `:GetProperty(name)`.
- `:BuildObject()` returns one table: functions become methods, signals and properties become fields.
- Client property: `:Observe(cb)` runs now and on every change; `:OnReady()` resolves once the first value arrives.

## Example (own code)

```lua
-- Server
local comm = ServerComm.new(ReplicatedStorage, "Shop")
local coins = comm:CreateProperty("Coins", 0)

comm:BindFunction("Buy", function(player, itemId: string)
	if typeof(itemId) ~= "string" or not Catalog[itemId] then return false end
	return ShopService.tryBuy(player, itemId)
end)

-- Client
local shop = ClientComm.new(ReplicatedStorage, true, "Shop"):BuildObject()
shop.Coins:Observe(function(v) coinLabel.Text = `Coins: {v}` end)
shop:Buy("speed_coil"):andThen(function(ok) if ok then playSound() end end)
```

## Middleware

Inbound middleware receives `(player, args)` and returns whether to continue; returning `false` plus values short-circuits with those values. Use it for cross-cutting rules:

- **Rate limiting** per player per remote.
- **Type checks** for every argument shape (still validate game rules in the handler).
- **Logging** in development builds.

```lua
local function rateLimit(player, args)
	if not Limiter.allow(player, 10) then -- own helper: 10 calls/sec
		return false, false
	end
	return true
end
comm:BindFunction("Buy", buyHandler, { rateLimit })
```

## Pitfalls

1. **Namespaces must match** on both sides, or `GetFunction` waits for a remote that never appears.
2. **RemoteFunctions yield the client** until the server answers; never invoke the client from the server (a client can hang the server thread).
3. **Comm is not security.** It forwards whatever the client sends. Validate everything server side ([[Remote Payload Validation]] and [[Anti-Cheat Reality Check - What Servers Can and Cannot Catch]]).
4. **Bandwidth.** RemoteProperty replicates whole values; for big tables changing often, send deltas or use a buffer protocol ([[Luau buffer Library - Packing Binary Data]]).

## Related
[[Scripting - Hub]] · [[Service and Controller Boundaries]] · [[Remote Protocol Versioning]] · [[Knit Is Archived - Frameworks vs Your Own Module Loader]]
