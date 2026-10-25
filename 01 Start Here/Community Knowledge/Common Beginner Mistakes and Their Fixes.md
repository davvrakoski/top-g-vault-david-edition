---
area: "01 Start Here"
cluster: "Start Here"
title: "Common Beginner Mistakes and Their Fixes"
tags: [roblox, community-knowledge, start-here, mistakes, troubleshooting]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/locations
  - https://create.roblox.com/docs/scripting/debounce
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/tutorials/use-case-tutorials/data-storage/save-player-data
  - https://devforum.roblox.com/t/common-errors-in-scripting-knowing-them-and-fixing-them/825683
  - https://devforum.roblox.com/t/how-to-create-a-debounce-in-my-script/4041039
  - https://devforum.roblox.com/t/remote-event-not-firing/789423
  - https://devforum.roblox.com/t/starting-with-scripting/3660990
---
# Common Beginner Mistakes and Their Fixes

The same twenty mistakes fill most Scripting Support threads. None of them mean you are bad at this; they are the normal tax of learning an engine where client and server are separate and the world loads gradually. Skim this list once now and again whenever something "should work but doesn't". Each row gives the symptom you see and the fix.

## Script placement and type

| Symptom | Mistake | Fix |
| --- | --- | --- |
| Script does nothing, no error | LocalScript in Workspace or ServerScriptService; any script in ServerStorage | Server code: Script in ServerScriptService. Client code: LocalScript in StarterPlayerScripts / StarterGui / StarterCharacterScripts. See [[Where Scripts Go - Containers, Script Types and RunContext]] |
| `LocalPlayer` is nil | Using `Players.LocalPlayer` in a server Script | Get the player from event arguments (`PlayerAdded`, `OnServerEvent`, `Triggered`) |
| LocalScript cannot find `ServerStorage.Sword` | Client cannot see server containers | Put shared things in ReplicatedStorage |

## Client vs server

| Symptom | Mistake | Fix |
| --- | --- | --- |
| Coins go up on my screen, reset or others do not see | Changing stats in a LocalScript | Change values on the server; clients ask via RemoteEvent |
| Door opens only for me | Opening it from a LocalScript | Open it on the server (or deliberately keep it client-only) |
| Remote arguments are "shifted" | Forgot `player` as first parameter of `OnServerEvent` | `function(player, a, b)` |
| Exploiters give themselves money | Server trusts amounts sent by the client | Client sends intent; server decides amount and checks rules. See [[First RemoteEvent - Button on the Client, Reward on the Server]] |

## Timing and loading

| Symptom | Mistake | Fix |
| --- | --- | --- |
| `X is not a valid member of Y` on the client | Indexing before it replicated | `WaitForChild` on the client |
| `Infinite yield possible` | Wrong name or path in `WaitForChild` | Fix the spelling/path; it is case-sensitive |
| Character is nil | Script ran before spawn | `player.Character or player.CharacterAdded:Wait()` |
| Script freezes, "exhausted allowed execution time" | `while true do` without a wait | Add `task.wait()` or use events |
| First player's stats missing in Studio | `PlayerAdded` connected after they joined | Also loop over `Players:GetPlayers()` |

## Events

| Symptom | Mistake | Fix |
| --- | --- | --- |
| Trap deals damage 5 times | No debounce on `Touched` | Cooldown flag stored **outside** the handler; per-player if needed |
| Debounce does nothing | Flag declared inside the function | Move it above the `:Connect` |
| Effects double after each respawn | Connecting inside `CharacterAdded` without cleanup | Disconnect old connections or connect once |
| `attempt to call a nil value` | `part.Destroy()` instead of `part:Destroy()`, or a misspelt method | Use `:` for methods; check the API name |

## Building

| Symptom | Mistake | Fix |
| --- | --- | --- |
| Map falls apart on Play | Parts not Anchored | Select all scenery, tick Anchored |
| Lost my changes | Built during a playtest | Edit only in edit mode (no coloured border) |
| Invisible wall | Transparent part with CanCollide on | Turn CanCollide off or delete it |
| Lag spikes, strange chat messages, teleports | Backdoored free model | Search for scripts, remove; see [[Free Model Backdoors - Spot and Remove Them]] |

## Data and money

| Symptom | Mistake | Fix |
| --- | --- | --- |
| DataStore errors in Studio | API access off | Experience Settings > Security > Enable Studio Access to API Services |
| Players lose data sometimes | Saving after a failed load; no `pcall`; no `BindToClose` | See [[First DataStore Save - Load, Save, Leave and Shutdown]] |
| Pass works only after rejoin | Only checking ownership on join | Also handle `PromptGamePassPurchaseFinished` |

## Process mistakes (the expensive ones)

1. **Starting with a dream MMO.** Ship an obby, a tycoon or a tiny round game first. Scope is the number one killer ([[Why Games Fail - Twelve Causes and Fixes]]).
2. **Copying tutorials without understanding.** After each tutorial, change something and see if you can predict the result.
3. **Not reading Output.** The first red line usually names the file, line and cause.
4. **Never testing with 2 players.** Use Server & Clients before every publish.
5. **Never saving checkpoints.** Use Save with Notes before risky edits.
6. **Asking "why doesn't my script work" with no details.** Use the three-question help template ([[Learning Resources - Official Courses and DevForum Categories]]).

## Related
[[00 START HERE - Top G Vault]] · [[Debugging Basics - Output, print, warn and Breakpoints]] · [[Works in Studio, Breaks Live - Checklist]] · [[Common Bad Advice to Avoid]] · [[Troubleshooting Field Guide]]
