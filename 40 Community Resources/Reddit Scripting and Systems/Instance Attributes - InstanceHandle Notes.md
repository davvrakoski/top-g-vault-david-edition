---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/instance-attributes-instancehandle"
title: "Instance Attributes - InstanceHandle Notes"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/reference-instances-directly-with-attributes/4753441
cssclasses: [tg-a40]
---

# Instance Attributes - InstanceHandle Notes

July 2026, Studio beta: **attributes can now point at another Instance**, replacing the old "ObjectValue child" workaround. The announcement by @WallsAreForClimbing passed 1,100 likes; the most common reaction was some version of "needed this years ago." API page: [[InstanceHandle]].

## How it works

- `part:SetAttribute("Target", someInstance)` stores a reference.
- `part:GetAttribute("Target")` returns an **InstanceHandle**, not the Instance.
- `handle:Get()` returns the Instance if it's available locally, else `nil` (never yields).
- `handle:Wait(timeout?)` yields until the Instance is available, or returns `nil` after the timeout.
- `InstanceHandle.new(instance)` lets you send references through RemoteEvents, even when the target hasn't replicated to that client yet.

## Why a handle and not the Instance

Replication. On a client the target may not exist yet (or may have streamed out). A plain `nil` couldn't tell "no attribute" from "target not here right now". So:
- attribute missing: `GetAttribute` returns `nil`;
- attribute set but target absent: you get a handle and `Get()` returns `nil`.

## Gotchas

- `GetAttributeChangedSignal("Target")` fires when the attribute is **re-pointed or deleted**, not when the target streams in/out or is destroyed. Use `Wait()` for arrival.
- It's a **beta**: check the current release status before relying on it in live games.
- Handles compare equal (`==`) if they point at the same target.

## Own example: door linked to its button

```lua
-- Server: link once (or set the attribute in Studio's Properties panel)
local button = workspace.Doors.Door1Button
button:SetAttribute("Door", workspace.Doors.Door1)

-- Client: streaming-safe lookup
local handle = button:GetAttribute("Door")
if handle then -- nil means the attribute is not set
	local door = handle:Wait(10)
	if door then
		print("Button controls", door:GetFullName())
	end
end
```

Prefer this over `ObjectValue` children for new code: one less instance per link, and the streaming behavior is explicit.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Attributes]] · [[Infinite Yield Possible - Causes and Fixes]]

<!-- TDOD_GRAPH_END -->
