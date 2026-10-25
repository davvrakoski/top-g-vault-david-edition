---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "RemoteFunction Pitfalls - InvokeClient, Yields and Timeouts"
tags: [roblox, community-knowledge, networking-security, remotefunction, remotes]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/RemoteFunction
  - https://create.roblox.com/docs/scripting/events/remote
  - https://devforum.roblox.com/t/2507486
---
# RemoteFunction Pitfalls - InvokeClient, Yields and Timeouts

RemoteFunctions look convenient: ask, get an answer. But a RemoteFunction **yields the caller until the other side returns**, and the other side may be an exploit client that never returns, throws on purpose, or returns garbage. Most "my server script froze" and "the shop stops working for everyone" bugs in mid-size games come from one of the patterns below.

## The documented warnings for InvokeClient

The RemoteFunction reference lists three behaviours when the server calls `InvokeClient`:

- If the client **throws**, the server throws too.
- If the client **disconnects** mid-call, `InvokeClient` throws.
- If the client **never returns**, the server **yields forever**.

So a server thread that does `remote:InvokeClient(player)` hands control of that thread to the client. Rule: **do not use InvokeClient** for anything the server needs. Fire a RemoteEvent to the client and have the client fire a RemoteEvent back, with the server tracking a request ID and a timeout.

```lua
-- server: ask a client, with a timeout, without InvokeClient
local pending: { [string]: thread } = {}

local function askClient(player: Player, question: string, timeout: number)
	local id = game:GetService("HttpService"):GenerateGUID(false)
	pending[id] = coroutine.running()
	AskRemote:FireClient(player, id, question)
	task.delay(timeout, function()
		local co = pending[id]
		if co then pending[id] = nil; task.spawn(co, nil) end
	end)
	return coroutine.yield()
end

AnswerRemote.OnServerEvent:Connect(function(player, id, answer)
	local co = pending[id]
	if co and typeof(answer) == "string" and #answer < 200 then
		pending[id] = nil
		task.spawn(co, answer)
	end
end)
```

A production version should also check that the answering player is the one asked.

## Client-to-server InvokeServer is fine, with care

`InvokeServer` from the client is the common, safe direction: the client waits on the server. Still:

1. **Never yield long in `OnServerInvoke`.** A DataStore call inside the handler holds the client's UI. Return quickly with a status and push the final result later.
2. **Only one callback.** Assigning `OnServerInvoke` again replaces the previous one silently; keep the assignment in one module.
3. **Validate everything.** Arguments arrive exactly like RemoteEvent arguments: any type, any size, any frequency. Use the same type checks and rate limits as for events.
4. **Return data, not instances you do not want seen.** Returned tables are copied; returned instances must already exist on the client to arrive as non-nil.
5. **Handle your own errors.** If your handler errors, the client's `InvokeServer` call errors too (how much of the message reaches the client is unverified). Wrap handler bodies in `pcall` and return generic failure codes so clients get a clean result and internals stay private.

## When to pick which

| Need | Use |
| --- | --- |
| Client asks for data it cannot compute (shop price list, cooldown left) | RemoteFunction (InvokeServer) |
| Client tells server about an action | RemoteEvent |
| Server needs something from a client | RemoteEvent out + RemoteEvent back with ID and timeout |
| High-frequency, loss-tolerant updates | UnreliableRemoteEvent |

## Pitfalls seen in forum threads

- Deciding parries, hits or purchases on the client and asking the server to "confirm" via InvokeServer: the client already lied. The server must decide (the parry pseudo-code thread lands on the same conclusion).
- Wrapping InvokeClient in `pcall` and thinking it is safe: `pcall` catches throws, not infinite yields.
- Long `OnServerInvoke` handlers exhausting the remote invocation queue when clients spam them; rate limit per player before doing work.

## Related
[[Networking Security - Hub]] - [[Remote Payload Validation]] - [[Remote Rate Limiting Pattern]] - [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]]
