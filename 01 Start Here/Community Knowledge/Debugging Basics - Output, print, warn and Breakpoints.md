---
area: "01 Start Here"
cluster: "Start Here"
title: "Debugging Basics - Output, print, warn and Breakpoints"
tags: [roblox, community-knowledge, start-here, debugging, output, breakpoints]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/output
  - https://create.roblox.com/docs/studio/debugging
  - https://create.roblox.com/docs/studio/developer-console
  - https://devforum.roblox.com/t/common-errors-in-scripting-knowing-them-and-fixing-them/825683
---
# Debugging Basics - Output, print, warn and Breakpoints

Every developer writes bugs; good developers find them fast. Studio ships a full debugger, but most beginners never open it and instead stare at code. This note gives a four-level routine, from "read the Output" to "step through with breakpoints", plus how to read logs from a live server with the Developer Console.

## Level 1: read the Output window

Open it from **Window > Output** or the Script tab. It shows script errors, engine messages, `print()` and `warn()`.

- **Red** = error. The line contains the script path and line number. **Click it** to jump there.
- **Orange** = warning. Often an `Infinite yield possible` from `WaitForChild`.
- Lines are tagged **blue** (client) or **green** (server) during a solo test, so you know which side failed.
- Use the filter boxes (type, context, text) to cut noise; `Ctrl+K` clears the window.
- Under the "..." settings, turn on **Show Source** and **Show Context**.

Read the **first** red error, not the last; later errors are usually knock-on effects.

## Level 2: print your way in

```lua
print("onTouched fired by", hit:GetFullName())
print("coins before", coins.Value)
warn("No leaderstats for", player.Name) -- orange, easy to spot
```

- Print at the **start** of a function to confirm it runs at all.
- Print the **values** you think you have; most bugs are a value that is `nil` or a different object than expected.
- `GetFullName()` shows the full path (`Workspace.Map.Door.Hinge`), which settles "which Door?" questions.
- Remove or gate prints before release; spam costs performance and hides real errors.

## Level 3: breakpoints (stop time)

1. Open the script and click in the gutter right of a line number. A red dot appears.
2. Press **Test**. When that line is reached, the game pauses and a yellow arrow marks the next line.
3. Inspect the **Watch** window (Variables tab shows everything in scope), the **Call Stack** window (who called this), and hover variables in the editor.
4. Step with **F10** (over), **F11** (into a function), **Shift+F11** (out). Click **Resume Scripts** to continue.

Variants (right-click the gutter):
- **Conditional breakpoint**: pauses only when a condition like `coins.Value > 1000` is true. Ideal inside loops.
- **Logpoint**: prints a message such as `"coins:", coins.Value` without pausing, so no need to edit code.
- **Temporary breakpoint**: removes itself after one test session.

Breakpoints can be set to trigger only in **Client**, **Server** or **Edit** context from **Edit Breakpoint**, and the **Breakpoints** window lists all of them in one place.

## Level 4: the Developer Console in a live game

Press **F9** (or type `/console` in chat) in a live server. The **Log** tab has a Client / Server switch; server logs are only visible to the owner or group members with edit permission. The console also shows memory, network and script performance. Use it when "it works in Studio but not live" (see [[Works in Studio, Breaks Live - Checklist]]).

## Decoding the first errors you will meet

| Message | Usually means | Fix |
| --- | --- | --- |
| `X is not a valid member of Y` | You indexed a child or property that does not exist (yet) | Check spelling; on the client use `WaitForChild` |
| `attempt to index nil with 'Z'` | Something on the left of `.Z` was `nil` | Print it; guard with `if obj then` |
| `attempt to call a nil value` | Calling a function that does not exist, often `.` vs `:` mixup or a misspelt method | Check the method name in the API reference |
| `Infinite yield possible on ...` | `WaitForChild` is waiting for something that never appears | Fix the name or path; see [[Infinite Yield Possible - Causes and Fixes]] |
| `Unable to assign property ... expected ... got ...` | Wrong value type, such as a string into `Size` | Use the right type (`Vector3.new(...)`) |
| `Script timeout: exhausted allowed execution time` | A loop with no wait | Add `task.wait()` |

The first three are also the ones a long-running DevForum "common errors" tutorial focuses on.

## A habit that saves hours

When stuck, write down: what you expected, what happened, and the exact first error line. Half the time the act of writing it finds the bug; the other half, it becomes a perfect help post (see [[Learning Resources - Official Courses and DevForum Categories]]).

## Related
[[00 START HERE - Top G Vault]] · [[Debugging Playbook]] · [[Studio Testing Modes for Beginners - Test, Run and Server and Clients]] · [[Common Beginner Mistakes and Their Fixes]] · [[30 Official Roblox Docs/Studio/Debugging|Debugging (official)]]
