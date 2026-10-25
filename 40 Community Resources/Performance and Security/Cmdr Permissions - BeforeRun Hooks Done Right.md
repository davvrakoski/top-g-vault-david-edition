---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/cmdr-permissions"
title: "Cmdr Permissions - BeforeRun Hooks Done Right"
tags: [roblox, community, "cluster/performance-and-security", security, admin, open-source]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://github.com/evaera/Cmdr
  - https://eryn.io/Cmdr/docs/permissions
---
# Cmdr Permissions - BeforeRun Hooks Done Right

**Cmdr** (evaera and contributors, MIT, GitHub `evaera/Cmdr`, docs at eryn.io/Cmdr, latest listed version 1.13.1) is a widely used typed command console for Roblox. It handles parsing, autocomplete and argument types. **Permissions are your job**, and the docs call this out clearly.

## What the docs say (Permissions page)

- **Security warning:** in a live game, commands are **blocked completely** until you register at least one `BeforeRun` hook. That is a safe default, but it pushes some people to write an "allow everything" hook just to get commands working. Don't.
- **Golden rule:** never trust the client. `Registry:RegisterHooksIn()` copies hook code to **both** client and server. The client copy is only for quick feedback, and exploiters can skip it.
- Commands that run purely on the client (`ClientRun`) can be run by an exploiter anyway. That's fine for local utilities, since exploiters already control their own client.
- Any command that **changes game state, manages data or affects other players** must be checked by a hook that **runs on the server**.
- Recommended pattern: **deny every group by default** and allowlist specific ones. Commands carry a `Group` string (for example `"Admin"`). The hook reads `context.Group` and `context.Executor`, and returns a string to deny or `nil` to allow. The docs suggest allowlisting harmless built-in groups like `DefaultUtil` and `UserAlias` for everyone.
- `registry:GetStore(name)` gives an **in-memory, per-server** table. It doesn't sync to the client or save across sessions. Hooks that read it must be registered **on the server only**, not through `RegisterHooksIn`.
- When a command collects client-side `Data` (for example, the player under the mouse), the server hook must **check it again**, because that data can be spoofed.

## Original hook (server-only registration)

```lua
-- ServerScriptService/CmdrBoot (Script)
local Cmdr = require(path.to.Cmdr) -- adjust to where you installed Cmdr

local GROUP_ID, MIN_RANK = 0, 250
local PUBLIC = { DefaultUtil = true, UserAlias = true, Help = true }
local ADMIN_GROUPS = { DefaultAdmin = true, Admin = true, DefaultDebug = true }

Cmdr.Registry:RegisterDefaultCommands()
Cmdr.Registry:RegisterHook("BeforeRun", function(context)
	if PUBLIC[context.Group] then
		return nil
	end
	local player = context.Executor
	if ADMIN_GROUPS[context.Group] then
		if player.UserId == game.CreatorId then
			return nil
		end
		local ok, rank = pcall(player.GetRankInGroup, player, GROUP_ID)
		if ok and rank >= MIN_RANK then
			return nil
		end
		return "You don't have permission to run this."
	end
	return "This command group is restricted." -- catch-all deny
end)
```

Because this hook is registered directly in a server Script, players can't skip it. You can still add a client copy for quick "no permission" messages, but the server copy is the one that actually protects you.

## Common mistakes

- Registering `return nil` for every group "for now" and shipping it.
- Putting rank checks only in a hook loaded through `RegisterHooksIn` and assuming the client copy is enough.
- Writing custom commands without a `Group`. The catch-all deny above blocks them. A hook without a catch-all lets them through.
- Treating a `GetStore` ban list as permanent. It disappears when the server shuts down. Use the Ban API or a DataStore for real bans.

## Credits

Cmdr by evaera and contributors (MIT License), GitHub repository and documentation site. The Luau above is original and only follows the documented hook API.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Admin Command Safety - Server-Side Permission Checks]] · [[Security Threat Model]] · [[Plugin and Free Model Safety Checklist]] · [[Ban API in Practice - BanAsync, Alt Detection and Appeals]]

<!-- TDOD_GRAPH_END -->
