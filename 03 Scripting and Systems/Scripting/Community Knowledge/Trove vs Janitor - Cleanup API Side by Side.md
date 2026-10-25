---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Trove vs Janitor - Cleanup API Side by Side"
tags: [roblox, community-knowledge, scripting, cleanup, memory-leaks, trove, janitor, open-source, mit]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://sleitnick.github.io/RbxUtil/api/Trove/
  - https://github.com/Sleitnick/RbxUtil
  - https://howmanysmall.github.io/Janitor/api/Janitor/
  - https://github.com/howmanysmall/Janitor
---
# Trove vs Janitor - Cleanup API Side by Side

**Licenses: both MIT (bundle-safe).** Trove: Wally `sleitnick/trove@1.8.0` (part of RbxUtil). Janitor: repository `howmanysmall/Janitor`.

Every tool, round, NPC or UI screen creates connections, instances, threads and tweens. Forget to clean one and you get leaks, double-firing handlers and "my sword hits twice after respawn". A cleanup object collects everything a lifetime owns and destroys it all in one call. The generic pattern is in [[Cleanup Bag Pattern]]; this note compares the two libraries most teams actually install, so you can pick one and use it correctly.

## What gets cleaned, and how

| Object added | Trove does | Janitor does (default) |
| --- | --- | --- |
| Instance | `:Destroy()` | `:Destroy()` |
| RBXScriptConnection | `:Disconnect()` | `:Disconnect()` |
| function | calls it | calls it when `methodName` is `true` |
| thread | `task.cancel(thread)` | `task.cancel` when `methodName` is `true` |
| table/object | calls `Destroy`, `Disconnect`, `destroy` or `disconnect` | calls the method you name, else type default, else `Destroy` |
| Promise (v4) | `AddPromise` cancels if pending | `AddPromise` cancels if pending |

## API map

| Task | Trove | Janitor |
| --- | --- | --- |
| Track something | `trove:Add(obj, cleanupMethod?)` | `janitor:Add(obj, methodName?, index?)` |
| Connect + track | `trove:Connect(signal, fn)` / `trove:Once(...)` | `janitor:Add(signal:Connect(fn), "Disconnect")` |
| Clone + track | `trove:Clone(instance)` | `janitor:Add(instance:Clone())` |
| Construct + track | `trove:Construct(Class, ...)` | `janitor:AddObject(Class, ...)` |
| Render step | `trove:BindToRenderStep(name, priority, fn)` | (add an unbind function) |
| Child lifetime | `trove:Extend()` returns a sub-trove | a Janitor can be added to another Janitor |
| Remove one item | `trove:Remove(obj)` (cleans it) / `trove:Pop(obj)` (no clean) | `janitor:Remove(index)` / `janitor:RemoveNoClean(index)` |
| Named slots | no | `index` argument + `Get`, `RemoveList` |
| Clean all | `trove:Clean()` (alias `Destroy`) | `janitor:Cleanup()` or call `janitor()`; `Destroy` also locks it |
| Tie to an Instance | `trove:AttachToInstance(inst)` | `janitor:LinkToInstance(inst)` |
| Callback-friendly | `trove:WrapClean()` returns a function | `janitor()` itself is callable |

## The feature that decides it: Janitor's indexes

Janitor's optional `index` gives an item a named slot. Adding to an occupied index cleans the old item first. That makes "replace the current X" one line:

```lua
-- Only one active hitbox connection per weapon; old one is cleaned automatically
janitor:Add(hitbox.Touched:Connect(onHit), "Disconnect", "Hitbox")
```

Trove has no slots; you keep a reference and call `trove:Remove(oldConn)`.

## Typical lifetimes (own example, Trove)

```lua
local function equipWeapon(tool: Tool)
	local trove = Trove.new()
	trove:AttachToInstance(tool)               -- tool destroyed -> everything cleaned
	trove:Connect(tool.Activated, swing)
	local vfx = trove:Clone(ReplicatedStorage.FX.Trail)
	vfx.Parent = tool.Handle
	trove:Connect(tool.Unequipped, function()
		trove:Clean()
	end)
end
```

## Gotchas

1. **Clean order.** Trove documents no guaranteed order. If B depends on A (e.g. a tween on a part), destroying A first is usually harmless, but don't write cleanup functions that assume another tracked item still exists.
2. **Cleaning a running thread** you are inside of errors; don't add `coroutine.running()` and then clean from that same thread.
3. **Double ownership.** Don't add an Instance to two cleanup objects; the second `Destroy` is harmless, but a function cleaner can run twice.
4. **GoodSignal connections** are strict about double `Disconnect`; see [[GoodSignal - Pure-Luau Signals and Their Caveats]].
5. Pick **one** library per codebase; mixing them confuses teammates.

## Verdict
- Want named replace-in-place slots and callable janitors: **Janitor**.
- Already using RbxUtil (Comm, Signal, Component): **Trove**, for consistency.

## Related
[[Scripting - Hub]] · [[Cleanup Bag Pattern]] · [[Signals, Connections and Leak-Proof Cleanup]] · [[Signals, Promises and Cleanup Libraries - Community Picks]]
