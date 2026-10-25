---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Reviewing AI-Written Luau - Checklist of Common AI Mistakes"
tags: [roblox, community-knowledge, ai-workflow, code-review, luau]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/BodyVelocity
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/studio/script-editor
  - https://devforum.roblox.com/t/psa-dont-use-instance-new-with-parent-argument/30296
---
# Reviewing AI-Written Luau - Checklist of Common AI Mistakes

The existing [[AI Code Review Prompt]] lists *what areas* to review. This note lists the *specific mistakes* AI models make again and again in Roblox code, so a human (or a second AI pass) can scan for them in minutes. The pattern behind most of them: models learned from years of old tutorials and free models, so they reproduce outdated APIs and the trust mistakes those tutorials made. Roblox's own docs for Code Assist say plainly that suggestions are not always correct and reviewing them is your job.

## A. Outdated or deprecated APIs (search the diff for these strings)

| Search for | Why it is wrong | Replace with |
|---|---|---|
| `wait(` `spawn(` `delay(` | Deprecated globals; superseded by the task library | `task.wait`, `task.spawn`, `task.delay` |
| `Humanoid:LoadAnimation` | Deprecated | `Animator:LoadAnimation` on the Humanoid's Animator |
| `BodyVelocity` `BodyGyro` `BodyPosition` `BodyForce` | Deprecated body movers | `LinearVelocity`, `AlignOrientation`, `AlignPosition`, `VectorForce` |
| `FilteringEnabled` | Discontinued property; always on | delete the line |
| `mouse.Hit`/`mouse.Target` lowercase | Deprecated lowercase members | `Mouse.Hit` or raycast from `UserInputService` input |
| `:connect(` lowercase | Old lowercase alias; the current docs only list `Connect` | `:Connect(` |
| `tick()` | Not deprecated, but docs list clock and time-zone issues | `os.clock()` for durations, `os.time()`/`DateTime` for dates |
| `Instance.new("Part", parent)` | Parent set before properties; slower | set properties, then `Parent` last |

## B. Trust and security mistakes

- **Client decides outcomes.** A LocalScript computing damage, coins or cooldowns and firing the result. The server must compute; the client only requests.
- **Remote handler trusts arguments.** `OnServerEvent` with no type checks, no range checks (`typeof(x) == "number"`, finite, within limits), no distance check and no rate limit.
- **Instances passed from client used blindly.** Check the instance is the one you expect (`IsDescendantOf`, tag, ownership).
- **`RemoteFunction:InvokeClient`** from the server. A client can hang it forever; avoid or wrap with a timeout.
- **Purchase handling** that grants items in `PromptProductPurchaseFinished` instead of `MarketplaceService.ProcessReceipt`.
- **`loadstring`, `require(<assetId>)`, unexpected `HttpService` calls.** Remove and ask why they appeared.

## C. Data and lifecycle mistakes

- DataStore calls without `pcall`, or `SetAsync` where concurrent writes are possible (prefer `UpdateAsync`).
- No save on `Players.PlayerRemoving` **and** no `game:BindToClose` flush.
- `Players.PlayerAdded` connected late, missing players already in the server. Loop `Players:GetPlayers()` once after connecting.
- `player.CharacterAdded` used without handling the character that already exists.
- Connections never disconnected; per-player tables never cleared on leave (slow memory leak).
- Code that assumes parts exist on the client at join; with streaming on, use `WaitForChild` with a timeout or `CollectionService` signals.

## D. Hallucinations and style traps

- **Invented APIs or properties.** Anything you have not seen before: look it up in `30 Official Roblox Docs/API Reference` before keeping it.
- **Invented module names** ("require the Roblox ProfileService built-in"). Check the package really exists and its license.
- **Silent behaviour changes in refactors.** Ask the AI for a diff and read every removed line.
- **Overly clever code**: metatables and coroutines where a plain function would do. Ask for the simplest version.
- **Magic numbers** scattered through code. Move to a config module.

## E. A 10-minute review routine

1. Run selene and luau-lsp/`--!strict`; fix every warning first ([[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]).
2. Grep the diff for the strings in table A.
3. Open each `OnServerEvent`/`OnServerInvoke` and walk section B.
4. Open each DataStore call and walk section C.
5. Play test with **2 players, Server & Clients**, then leave mid-action with one.
6. Only then read the rest for logic.

## Related
[[Claude MCP AI Workflow - Hub]] · [[AI Code Review Prompt]] · [[Starter - Using AI Assistants Safely for Roblox Code]] · [[Flow - Prompting AI for Correct Roblox Code - Context Packs, API Names and Acceptance Tests]]
