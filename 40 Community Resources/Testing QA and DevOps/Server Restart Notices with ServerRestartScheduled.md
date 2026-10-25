---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/server-restart-scheduled"
title: "Server Restart Notices with ServerRestartScheduled"
tags: [roblox, community, "cluster/testing-qa-and-devops", live-ops, release, servers]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/projects/update-games
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#ServerRestartScheduled
---
# Server Restart Notices with ServerRestartScheduled

**What the docs say:** when you restart servers with **Delay server restart** (1-60 minutes of bleed-off), affected servers fire `DataModel.ServerRestartScheduled(restartTime, source, attributes)`:
- `restartTime`: a `DateTime`, the earliest shutdown time.
- `source`: `Enum.CloseReason.DeveloperUpdate` for your updates, `Enum.CloseReason.RobloxMaintenance` when Roblox restarts servers for infrastructure work (then `attributes` is empty).
- `attributes`: optional JSON you supply (reason, urgency).

Matchmaking stops sending new players to those servers, and after the delay players are teleported to a server on the new version, together with the people from their old server. See [[Release game updates]].

**Why bother:** a countdown turns a surprise disconnect into a planned break. Players finish their round, you get a chance to save, and support tickets drop.

## Server: announce and prepare (original)

```luau
--!strict
-- ServerScriptService/RestartNotice.server.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local notice = Instance.new("RemoteEvent")
notice.Name = "RestartNotice"
notice.Parent = ReplicatedStorage

local scheduled: { at: number, maintenance: boolean, reason: string }? = nil

game.ServerRestartScheduled:Connect(function(restartTime: DateTime, source: Enum.CloseReason, attributes)
	local reason = "A new update is ready"
	if type(attributes) == "table" and type(attributes.reason) == "string" then
		reason = attributes.reason
	end
	scheduled = {
		at = restartTime.UnixTimestamp,
		maintenance = source == Enum.CloseReason.RobloxMaintenance,
		reason = reason,
	}
	notice:FireAllClients(scheduled)

	-- Good moment to stop starting long activities and flush saves early.
	ReplicatedStorage:SetAttribute("RestartPending", true)
end)

-- Late joiners (invites/teleports can still reach a draining server) get the notice too.
game:GetService("Players").PlayerAdded:Connect(function(player)
	if scheduled then
		notice:FireClient(player, scheduled)
	end
end)
```

Use the `RestartPending` attribute in your round system: do not start a 10-minute boss fight two minutes before shutdown.

## Client: countdown banner (sketch)

```luau
-- StarterPlayerScripts/RestartBanner.client.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local notice = ReplicatedStorage:WaitForChild("RestartNotice")

notice.OnClientEvent:Connect(function(info)
	-- Replace print with your own UI; keep the text short and calm.
	while true do
		local remaining = math.max(0, info.at - DateTime.now().UnixTimestamp)
		print(("%s - moving you to the new version in %d:%02d"):format(info.reason, remaining // 60, remaining % 60))
		if remaining == 0 then break end
		task.wait(1)
	end
end)
```

## Testing it
You cannot fire this engine event yourself in Studio. Keep the handler body in a function and unit-test it with a fake `DateTime` and source, then do one real delayed restart on **staging** before relying on it in production.

## Related shutdown work
Saves on shutdown still go through `BindToClose`; the restart notice is a head start, not a replacement.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Release game updates]] · [[DataModel]] · [[Rollback Drills - Rehearsing a Bad Release]] · [[Open Cloud APIs for Live Ops - Worked Examples]]

<!-- TDOD_GRAPH_END -->
