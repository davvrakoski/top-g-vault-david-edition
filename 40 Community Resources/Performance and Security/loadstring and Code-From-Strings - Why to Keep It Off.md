---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/loadstring-keep-it-off"
title: "loadstring and Code-From-Strings - Why to Keep It Off"
tags: [roblox, community, "cluster/performance-and-security", security, loadstring, admin]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ServerScriptService#LoadStringEnabled
  - https://devforum.roblox.com/t/question-about-loadstring/2013696
---
# loadstring and Code-From-Strings - Why to Keep It Off

`loadstring` turns a string into runnable Luau. On Roblox, server scripts can use it only when **`ServerScriptService.LoadStringEnabled`** is on. That property **defaults to false** and can't be changed by scripts (Creator Hub). Most games never need it. When it is on, it's often the hole behind "someone is running server commands in my game."

## Why it's dangerous

- **Remote code execution.** Pseudoclassic (DevForum, Oct 2022) explained it plainly: if a server runs code that a client sent through a remote without checks, an exploiter can run **any code on your server**. "Execute" commands in admin panels are the classic way this goes wrong.
- **"Loadstring modules" carry the same risk, plus supply-chain risk.** These are interpreters written in Luau that run code strings without the property. They have exactly the same remote code execution exposure. In the same thread, Pseudoclassic pointed out that a module someone recommended had a **backdoor** hidden inside it. Treat any interpreter module from a link as hostile until you've read every line.
- **Backdoors love it.** Malicious free models often depend on `LoadStringEnabled` or a bundled interpreter, so they can run whatever the attacker sends later. If you find the property turned on and you didn't enable it, investigate (see [[Free Model Backdoors - Spot and Remove Them]]).

## If you think you need it

| You want... | Do this instead |
|---|---|
| Live-tunable game values | Store **data** (numbers, tables) in Configs, a DataStore or attributes, and have normal code read it. |
| Mod or admin "run code" for debugging | Use Studio's Command Bar or the Developer Console's **server** command line. Only people with edit rights can use them. |
| User-made content (levels, rules) | Design a small **data format** with fixed actions and validate it server-side. Never accept code. |
| Plugin-style extensibility | Ship ModuleScripts in your place, chosen by name from a server-side allowlist. |

## If you truly must keep it on

- Only one server Script may call it. No remote may ever pass a string to it.
- Check the caller on the server. The thread suggests at least `player.UserId == game.CreatorId`. Use an allowlist of UserIds and log every run.
- Audit after each update: search the place for `loadstring(` and `LoadStringEnabled`.

## Original audit snippet (Studio Command Bar)

```lua
-- Lists every script mentioning loadstring and reports the property state.
print("LoadStringEnabled =", game:GetService("ServerScriptService").LoadStringEnabled)
for _, inst in game:GetDescendants() do
	if inst:IsA("LuaSourceContainer") then
		local ok, src = pcall(function() return (inst :: any).Source end)
		if ok and typeof(src) == "string" and src:lower():find("loadstring", 1, true) then
			warn("loadstring reference:", inst:GetFullName())
		end
	end
end
```

`Source` can only be read from the Command Bar or plugins, so the read is wrapped in `pcall`. Obfuscated code can hide the word, so a clean result is not proof that nothing is there.

## Credits

Roblox Creator Hub, *ServerScriptService.LoadStringEnabled* (CC BY 4.0). DevForum: Pseudoclassic and ScriptingsMaster (*Question About Loadstring*, Oct 2022). The snippet is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Free Model Backdoors - Spot and Remove Them]] · [[Admin Command Safety - Server-Side Permission Checks]] · [[Vulnerabilities from third-party assets]] · [[Plugin and Free Model Safety Checklist]]

<!-- TDOD_GRAPH_END -->
