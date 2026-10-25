---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster"
tags: [roblox, community-knowledge, performance, networking, remotes, bandwidth]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent
  - https://devforum.roblox.com/t/2424611
  - https://devforum.roblox.com/t/remote-event-discussion/1621464
  - https://devforum.roblox.com/t/is-it-practical-to-fire-a-remote-event-every-frame-for-every-player/2389401
  - https://devforum.roblox.com/t/how-to-pass-less-data-to-remotes/333790
---
# Remote Send Rate - Batching, Deltas and When One Remote Is Not Faster

Remote traffic is the one performance cost that hurts the server, every client and every player's ping at the same time. The Improve Performance guide lists the usual causes: replicating data every frame that does not need it, firing on input without throttling, and sending whole tables when one field changed. This note is about **how much and how often** you send. Payload packing (buffers, bit packing) and security throttling (rate limits) have their own notes.

## The order of wins

1. **Send less often.** Most state does not need 60 Hz. Positions of distant NPCs at 10 Hz with client interpolation look fine.
2. **Send only changes.** Replicate when a value changes, not on a timer, and send the changed field, not the whole object.
3. **Send to fewer people.** `FireClient` to the players who care (nearby, same team) instead of `FireAllClients`.
4. **Batch per frame** when many small events fire in the same frame.
5. **Pack the payload** (buffers) once the above is done.

Teams often jump to step 4 or 5 first because libraries make it easy, while steps 1-3 usually save more.

## What the community says about batching

The forum is split, and both sides have a point:

- A reply in thread 2424611 describes queuing every outgoing request until the end of the frame and sending one packed string as the most bandwidth-efficient approach, while admitting it is complex and usually not needed. It suggests a 1-byte opcode at the start of each packed message as a middle ground.
- In "Remote Event Discussion" (1621464) a reply argues that merging many remotes into one is not a performance gain by itself: one remote fired ten times costs about the same as ten remotes fired once.
- In "Is it practical to fire a remote every frame for every player" (2389401) replies recommend a lower send rate (around 4 times per second was suggested in one reply) with timestamps and client-side interpolation.

The useful conclusion: batching helps when it **reduces the number of sends** (many tiny events in the same frame merged into one), not when it only changes the remote name.

## A small per-frame batcher (server to clients)

```lua
-- Server: collect damage numbers per player during the frame, send once on Heartbeat.
local RunService = game:GetService("RunService")
local DamageBatch = game.ReplicatedStorage.Remotes.DamageBatch -- RemoteEvent
local pending: {[Player]: {any}} = {}

local function queueDamage(viewer: Player, targetId: number, amount: number)
    local list = pending[viewer]
    if not list then list = {}; pending[viewer] = list end
    list[#list + 1] = targetId
    list[#list + 1] = amount -- flat array: id, amount, id, amount...
end

RunService.Heartbeat:Connect(function()
    for viewer, list in pending do
        if viewer.Parent then DamageBatch:FireClient(viewer, list) end
    end
    table.clear(pending)
end)
```

A flat array (`id, amount, id, amount`) serializes smaller than an array of small tables.

## Choosing reliable vs unreliable

`UnreliableRemoteEvent` drops and reorders packets instead of resending them. Use it for continuous state where the next update replaces the last one (positions, aim direction, cosmetic effects). Keep `RemoteEvent` for anything that must arrive exactly once (purchases, damage that changes health, inventory). The API page says unreliable payloads larger than 1000 bytes are dropped (Studio logs how far over you were), so batches that grow large belong on a reliable remote or must be split. Client-to-server remotes are also rate limited by the engine, another reason to batch client sends.

## Measuring

- Developer Console > Network shows data sent and received per second; the server-side MicroProfiler scope `Allocate Bandwidth and Run Senders` covers outgoing work, `ProcessPackets` covers incoming (both named in the Improve Performance guide).
- Log the number of `Fire*` calls per second in a debug build. Spikes usually come from one system firing in a loop.

## Pitfalls

- Clients firing on every `InputChanged` or mouse move: throttle on the client and validate rate on the server.
- Sending Instances that the receiver may not have (streaming): send ids and resolve them.
- Large tables on join: send in chunks over several frames, or keep static data in ModuleScripts that ship with the place.

## Related
[[Performance - Hub]] · [[Network Receive Budget - 50 KB per Second and What Fills It]] · [[Buffers and Bit Packing for Network Payloads]] · [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]]
