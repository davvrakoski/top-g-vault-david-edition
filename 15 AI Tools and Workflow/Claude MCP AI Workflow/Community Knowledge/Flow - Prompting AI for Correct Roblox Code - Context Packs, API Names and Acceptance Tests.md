---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Prompting AI for Correct Roblox Code - Context Packs, API Names and Acceptance Tests"
tags: [roblox, community-knowledge, ai-workflow, prompting, luau]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/assistant/prompt-engineering
  - https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
  - https://devforum.roblox.com/t/psa-dont-use-instance-new-with-parent-argument/30296
---
# Prompting AI for Correct Roblox Code - Context Packs, API Names and Acceptance Tests

Most bad AI Luau is not a model problem, it is a missing-context problem. A model that does not know your folder layout, your remote list or who owns the data will invent all three, and it will happily use APIs from 2016 because a lot of its training data is old forum code. A prompt that ships a small **context pack**, names the exact APIs, forces a server/client split and asks for tests turns "looks right" code into code you can actually merge. This note is the "how to ask" half; [[Flow - Reviewing AI-Written Luau - Checklist of Common AI Mistakes]] is the "how to check" half.

## 1. Send a context pack, not a wish

Keep a short file (for example `docs/ai-context.md`) and paste or attach it every time. Five blocks are enough:

1. **Tree**: where code lives (`ServerScriptService/Server`, `ReplicatedStorage/Shared`, `StarterPlayerScripts/Client`) and whether you use Rojo.
2. **Remotes**: the existing RemoteEvents/RemoteFunctions, their payloads and who validates them.
3. **Data owner**: which module writes DataStores (one only) and its public functions.
4. **Style rules**: `--!strict`, `task` library only, `game:GetService` for services, no globals.
5. **Do-not-touch list**: files the AI must not edit (save code, purchase handlers).

The Roblox Assistant prompt guide makes the same point in its own words: be specific about objects, names and the expected result, and break big requests into steps.

## 2. Name the APIs you want

Models drift to whatever API was most common in their data. Close that door by naming the modern API in the prompt:

| Ask for | Instead of what AI often writes |
|---|---|
| `task.wait`, `task.spawn`, `task.delay` | `wait`, `spawn`, `delay` (deprecated globals) |
| `Animator:LoadAnimation` | `Humanoid:LoadAnimation` (deprecated) |
| `LinearVelocity`, `AlignOrientation` | `BodyVelocity`, `BodyGyro` (deprecated) |
| `UserInputService` / `ContextActionService` | `Player:GetMouse()` for everything |
| `os.clock()` for timing | `tick()` (not deprecated, but the docs list its problems) |
| `UpdateAsync` with `pcall` | bare `SetAsync` |

Add one line: "If you are not sure an API exists, say so instead of guessing." Models comply surprisingly often.

## 3. Force the server/client split

Ask for files, not "a script":

> Output three files: `Server/CoinService.luau` (all rules and rewards), `Shared/CoinConfig.luau` (numbers only), `Client/CoinUI.luau` (display only). The client may only send "I touched coin <id>"; the server decides if that is true.

Naming the trust boundary in the prompt removes the most common AI bug: the client telling the server how much it earned.

## 4. Ask for assumptions and tests

End every feature prompt with:

1. "List every assumption you made about my project." (You fix wrong ones before reading the code.)
2. "Write a Jest-Lua or TestEZ spec for the pure logic module" (see [[Unit Testing Luau with Jest-Lua and TestEZ]]).
3. "Give a manual test plan for Studio: Play with 2 players, spam the remote, leave mid-action."

A short example of the logic split that makes tests possible:

```lua
--!strict
-- Shared/CoinRules.luau : pure, no Instances, easy to test
local CoinRules = {}
function CoinRules.canCollect(lastAt: number, now: number, cooldown: number): boolean
	return now - lastAt >= cooldown
end
return CoinRules
```

## 5. One change per prompt

Small asks beat one-shot game builds for code you will keep. A good unit is "one module plus its test". Big rewrites hide regressions; ask for a diff against the file you pasted, not a fresh file.

## Prompt template

```
Context: <paste ai-context.md>
Task: <one feature, one sentence>
Files to create/edit: <paths>
APIs to use: <list>; do not use: wait, spawn, Humanoid:LoadAnimation, Body* movers
Trust: server decides <X>; client may only send <Y>
Output: code per file, then assumptions list, then test spec, then manual test plan
```

## Pitfalls

- Pasting secrets (API keys, webhook URLs) into the context pack. Keep them out; see [[Starter - Using AI Assistants Safely for Roblox Code]].
- Letting the context pack go stale: update the remote list whenever you add a remote.
- Accepting code that uses `Instance.new(class, parent)` in hot paths; a long-standing DevForum PSA explains why setting Parent last is faster.

## Related
[[Claude MCP AI Workflow - Hub]] · [[Prompt Library for Claude]] · [[AI Code Review Prompt]] · [[Coding with AI on Roblox - Community Consensus]]
