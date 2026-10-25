---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/admin-command-safety"
title: "Admin Command Safety - Server-Side Permission Checks"
tags: [roblox, community, "cluster/performance-and-security", security, admin, remotes]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/is-my-admin-commands-script-system-secureexploiter-proof/3040168
  - https://devforum.roblox.com/t/admin-game-pass/452184
  - https://eryn.io/Cmdr/docs/permissions
  - https://create.roblox.com/docs/scripting/security/access-control-and-confidentiality
---
# Admin Command Safety - Server-Side Permission Checks

A homemade admin panel is often the biggest hole in a game. The usual cause: the UI is hidden from non-admins, but the RemoteEvent behind it **accepts calls from anyone**. Exploiters don't need your UI. They can fire the remote directly. DevForum reviewers make the same point: an admin game pass with no server check lets an exploiter fire the event whenever they like (*Admin Game pass* thread).

## Rules

1. **The server decides who is an admin, every time.** Check the caller (the `player` argument the engine passes to `OnServerEvent`) on **every** request. Never trust a "role" or "isAdmin" value the client sends.
2. **Deny by default.** Unknown command, unknown group or a failed lookup all mean no. The Cmdr docs recommend the same pattern: deny every group, then allowlist specific ones.
3. **Key admins by UserId**, not by name. Names can change. See [[Key Player State by UserId, Not the Player Object]].
4. **Cache rank lookups at join.** Group rank calls can fail or yield. Do them once in `PlayerAdded` inside `pcall`, and treat a failure as **not admin**.
5. **Validate arguments as you would for any remote.** Admin commands take player names, amounts and positions. Clamp them, check their types, and make sure targets exist (see [[Remote Type and Allowlist Validation]]).
6. **Log every privileged command** with executor, command, args and server JobId. Logs show you when a mod account gets compromised.
7. **Don't ship powerful debug commands to production** behind a "secret" remote name. Clients can decompile replicated scripts and read their names (Creator Hub, *Access control and confidentiality*).

## Original reference pattern

```lua
-- ServerScriptService/AdminGate (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GROUP_ID = 0          -- set your group
local MIN_RANK = 250        -- rank allowed to moderate
local OWNER_IDS = { [game.CreatorId] = true }

local rankCache: {[number]: number} = {}

Players.PlayerAdded:Connect(function(player)
	local ok, rank = pcall(player.GetRankInGroup, player, GROUP_ID)
	rankCache[player.UserId] = ok and rank or 0 -- failure = no rights
end)
Players.PlayerRemoving:Connect(function(player)
	rankCache[player.UserId] = nil
end)

local function isAdmin(player: Player): boolean
	return OWNER_IDS[player.UserId] == true or (rankCache[player.UserId] or 0) >= MIN_RANK
end

local COMMANDS = {
	kick = function(admin: Player, targetName: unknown)
		if typeof(targetName) ~= "string" or #targetName > 20 then return end
		local target = Players:FindFirstChild(targetName)
		if target and target:IsA("Player") and not isAdmin(target) then
			target:Kick("Removed by a moderator")
		end
	end,
}

local remote = ReplicatedStorage:WaitForChild("AdminRequest") :: RemoteEvent
remote.OnServerEvent:Connect(function(player, commandName: unknown, ...)
	if not isAdmin(player) then
		warn(("[Admin] denied %s (%d)"):format(player.Name, player.UserId))
		return
	end
	local handler = typeof(commandName) == "string" and COMMANDS[commandName]
	if not handler then return end -- unknown command: deny
	print(("[Admin] %d ran %s"):format(player.UserId, commandName)) -- replace with your audit log
	handler(player, ...)
end)
```

Players who join or get promoted mid-session keep their cached rank until they rejoin. That trade-off is deliberate: a stale "no" is safer than calling the web API on every request.

## About "unbypassable" claims

In a 2024 DevForum review (Ethanthegrand14's admin system), one reply claimed exploiters can hook past any check. The thread doesn't back that up. **Server-side checks run on Roblox's machine, where clients can't modify them.** What clients *can* do is send whatever arguments they like. That's why rules 1 and 5 matter.

## Using a framework instead

If you use Cmdr, you **must** register a BeforeRun hook. It is the permission layer, and Cmdr blocks commands in live games until one exists. See [[Cmdr Permissions - BeforeRun Hooks Done Right]].

## Credits

DevForum: Ethanthegrand14, awry_y, iop2319 (*Is my admin commands script system secure/exploiter proof?*, 2024), and contributors to the *Admin Game pass* thread. Cmdr docs (MIT) by evaera and contributors. Roblox Creator Hub (CC BY 4.0). The Luau above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Remote Type and Allowlist Validation]] · [[Security Threat Model]] · [[Key Player State by UserId, Not the Player Object]] · [[Cmdr Permissions - BeforeRun Hooks Done Right]] · [[Ban API in Practice - BanAsync, Alt Detection and Appeals]]

<!-- TDOD_GRAPH_END -->
