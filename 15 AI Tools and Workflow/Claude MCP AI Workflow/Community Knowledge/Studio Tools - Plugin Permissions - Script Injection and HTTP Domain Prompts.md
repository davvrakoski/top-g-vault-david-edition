---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts"
tags: [roblox, community-knowledge, studio, plugins, security, permissions]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/introducing-plugin-http-permissions/493269
  - https://devforum.roblox.com/t/script-injection-vulnerability/221954
  - https://devforum.roblox.com/t/claude-refusing-to-insert-scripts/4876761
  - https://devforum.roblox.com/t/how-to-detect-when-a-player-has-denied-script-injection-permission-on-a-plugin/1375400
  - https://create.roblox.com/docs/reference/engine/classes/Studio
---
# Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts

A plugin runs with more power than any game script. It can read every script in your place and change any instance. The two abilities that do the most damage, **creating scripts** and **talking to the internet**, are behind permission prompts. Knowing what the prompts mean, where to change your answer, and what a well-behaved plugin should ask for protects your game. If you write plugins, it also stops your users from silently breaking your tool by clicking "Deny".

## Why these permissions exist

In January 2019 Roblox announced that malicious plugins were **injecting scripts into hidden services** that the Explorer did not show, where they were very hard to find. Roblox patched where scripts may run and said it would rework the plugin security model so plugins could not do this **without the user's consent**. The Script Injection prompt is that consent. Studio also has a **Show Hidden Objects in Explorer** setting; turn it on when you hunt for planted scripts.

## HTTP permissions (per domain)

From the March 2020 announcement:

- The first time a plugin contacts a **new domain**, Studio asks you to **Allow** or **Deny** that domain for that plugin, or to cancel just that request.
- Allow/Deny is **remembered** per plugin and domain. Closing the prompt without choosing blocks the request but saves nothing.
- **Each subdomain** needs its own permission.
- Plugins **ignore the game's "Allow HTTP Requests" setting**, which only applies in-game.
- **Local plugins bypass these permissions** (at least as announced in 2020; unverified today). That is one more reason never to drop a downloaded `.rbxm` into your Plugins folder.
- Studio also has an **Enable Http Sandboxing** setting ("whether HTTP requests from plugins are sandboxed"). Leave it at its default unless you know why you are changing it.

## Script Injection

- Shown when a plugin first tries to create or parent a `Script` / `LocalScript` (community reports say **cloning** a model that contains scripts triggers it too).
- It is **per plugin**, not per service.
- If denied, script creation by that plugin **fails**, while other edits (parts, GUIs, values) still work. A September 2026 DevForum thread shows exactly this with an AI assistant plugin that could edit scripts but not create them.
- To change your answer: **Plugins > Manage Plugins**, find the plugin, and edit its Script Injection permission. The thread quotes the label as "Script Injection Denied" with an edit button next to it; the wording changes between Studio versions (community-reported).

## What a well-behaved plugin asks for

| Plugin type | Script Injection | HTTP |
| --- | --- | --- |
| Building / alignment / terrain | **No** | **No** |
| UI converter that outputs LocalScripts | Yes (explain it) | No |
| Code generator / framework installer | Yes | Maybe (package registry) |
| AI assistant / MCP bridge | Yes | Yes (its own API domain, or `localhost`) |
| "Analytics" or "licence check" in a building plugin | Red flag | **Red flag** |

If a prompt shows a domain you don't recognise, **deny it** and look for the plugin's source or DevForum thread.

## For plugin authors: handle denial gracefully

Don't let your tool "completely break" (as one 2021 thread put it). Probe once and explain:

```lua
local function canInjectScripts(): boolean
	local ok = pcall(function()
		local probe = Instance.new("Script")
		probe.Name = "__TopG_PermissionProbe"
		probe.Parent = game:GetService("ServerStorage")
		probe:Destroy()
	end)
	return ok
end

if not canInjectScripts() then
	warn("[TopG] Script Injection is denied. Enable it in Plugins > Manage Plugins to use code generation.")
end
```

Probe **only when the user first uses a feature that needs it**, not at start-up, so the prompt makes sense when it appears. Destroy the probe inside the `pcall`.

## Review your permissions now and then

1. Open **Manage Plugins**.
2. For each plugin: do you still use it? Does it need what it was granted?
3. Remove anything you don't recognise, then restore from version history if you suspect damage ([[Saving and Version History - Never Lose a Place]]).

More checks before you install anything: [[Plugin and Free Model Safety Checklist]].

## Related

[[Claude MCP AI Workflow - Hub]] · [[Plugin and MCP Supply-Chain Security]] · [[Free Model Backdoors - Spot and Remove Them]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]]
