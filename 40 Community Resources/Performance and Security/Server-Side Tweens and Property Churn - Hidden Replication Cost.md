---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/server-tweens-replication"
title: "Server-Side Tweens and Property Churn - Hidden Replication Cost"
tags: [roblox, community, "cluster/performance-and-security", networking, bandwidth, tweens]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/tweenservice-v-2/199815
  - https://devforum.roblox.com/t/enable-developers-to-disable-built-in-replication-in-games/3965327
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Server-Side Tweens and Property Churn - Hidden Replication Cost

A spinning coin, a sliding door and a bobbing pickup look harmless. Run them with TweenService **on the server**, though, and each step is a property change that has to replicate. AlexanderLindholt summed it up in a 2025 feature request: tweening on the server "unnecessarily replicates every frame to the clients." Multiply that by hundreds of props and every player pays for it in bandwidth, while the motion still looks choppy because replication runs slower than the client's frame rate.

## The pattern: server decides, clients animate

1. The server owns the **state**: door open or closed, platform at waypoint 3, coin collected.
2. The server announces the change **once**, through an attribute, a RemoteEvent, or a start timestamp.
3. **Each client** runs the tween locally.
4. When the motion ends, the server sets the **final** value directly, so late joiners and physics see the right thing.

SteadyOn's **TweenService V2** module (DevForum Community Resources, 2018) is the best-known example. Tweens play on clients, and the server makes one update when they finish. SteadyOn said this cuts server lag and stops properties being replicated continuously.

## Caveats the community raised

- **No resend on missed events.** A client that briefly disconnects won't get the tween request again (SteadyOn). Treat the final server-side value as the source of truth.
- **Drift.** Firing the same tween several times in a short window can leave clients out of sync over time (TweenService V2 documentation).
- **Server logic can't see the motion.** Touched events and server raycasts won't hit a part that only moves on clients (SteadyOn). If server collision matters, use a physics constraint or move it on the server at a low rate.
- **Server overrides.** If the server also writes the same property, the replicated value can snap the client's animation. Have the client animate a **separate visual copy**, or have the server write only the final value.

## Other "churn" sources to audit

- Loops that rewrite the same property every frame (`part.Color = sameColor`). Write only when the value changes.
- Attributes used as per-frame counters. Every change replicates.
- The Creator Hub suggests **limiting unnecessary instance replication** where the server doesn't need to know about instances. Make client-only effects on the client.
- Synical's workaround from the 2025 thread: parent server-only objects under the server's `Camera` so they don't replicate. It's a community trick; the docs don't describe it.

## Original client tween driver

```lua
-- Server: door:SetAttribute("OpenAt", workspace:GetServerTimeNow())  (or "CloseAt")
-- Client (StarterPlayerScripts): animate from the timestamp so late joiners land in the right spot.
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local DURATION = 0.6

local function bind(door: BasePart)
	local closedCF = door.CFrame
	local openCF = closedCF * CFrame.new(0, door.Size.Y, 0)
	local function play()
		local openAt = door:GetAttribute("OpenAt")
		if typeof(openAt) ~= "number" then return end
		local elapsed = workspace:GetServerTimeNow() - openAt
		local alpha = math.clamp(elapsed / DURATION, 0, 1)
		door.CFrame = closedCF:Lerp(openCF, alpha)
		if alpha < 1 then
			TweenService:Create(door, TweenInfo.new(DURATION * (1 - alpha)), { CFrame = openCF }):Play()
		end
	end
	door:GetAttributeChangedSignal("OpenAt"):Connect(play)
	play()
end

CollectionService:GetInstanceAddedSignal("SlidingDoor"):Connect(bind)
for _, d in CollectionService:GetTagged("SlidingDoor") do bind(d) end
```

The door has to be anchored and must not be moved by the server. Otherwise the server's replicated CFrame wins.

## Credits

DevForum: SteadyOn (*TweenService V2*, 2018) and repliers ThoughtSpinnr, artoduane; AlexanderLindholt, Synical, maxim01689, Mauio64, Ruann (*Enable developers to disable built-in replication in games*, 2025). Roblox Creator Hub, *Improve performance* (CC BY 4.0). The code above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] · [[Server Heartbeat, Ping and Bandwidth Monitoring]] · [[Network usage]] · [[Buffers and Bit Packing for Network Payloads]]

<!-- TDOD_GRAPH_END -->
