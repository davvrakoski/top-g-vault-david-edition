---
area: "14 Testing and QA"
cluster: "Testing"
title: "Studio Debugger - Breakpoints, Logpoints, Watch and Call Stack"
tags: [roblox, community-knowledge, testing, debugging, studio, breakpoints]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/debugging
  - https://create.roblox.com/docs/studio/developer-console
---
# Studio Debugger - Breakpoints, Logpoints, Watch and Call Stack

Many Roblox developers debug only with `print`. The built-in debugger is faster for anything involving state: it pauses the game at a line, shows every local and upvalue, and lets you step through calls. Logpoints give you prints without editing code, which matters because a forgotten `print` in a hot loop is itself a performance bug. Here is how to use it well.

## Four breakpoint types
| Type | Insert | Icon | Use |
|---|---|---|---|
| Standard | Click the gutter right of the line number | Red circle | Stop here every time |
| Conditional | Right-click gutter > Insert Conditional Breakpoint | Circled = | Stop only when e.g. `player.Name == "Tester2"` or `i == 500` |
| Logpoint | Right-click gutter > Insert Logpoint | Red diamond | Print a message without pausing, without editing the script |
| Temporary | Right-click gutter > Insert Temporary Breakpoint | Red circle | Removes itself after the first playtest |

Disabled breakpoints show as hollow icons. **Deleting** a breakpoint also deletes its condition and log message, so disable instead if you will need it again.

## Edit options worth knowing
In **Edit Breakpoint**:
- **Condition**: any expression; empty means always.
- **Log Message**: same format as `print` arguments, e.g. `"hp:", humanoid.Health`.
- **Continue Execution**: turns a breakpoint into a logpoint-style non-pausing one.
- **Trigger At**: Client, Server or Edit context. This is crucial for ModuleScripts required by both sides: break only on the server copy.

Breakpoints can be edited during a playtest and the edits persist; changes to a breakpoint that is currently paused apply next session.

## The workflow
1. Insert breakpoints, start a playtest.
2. When execution pauses, a yellow arrow marks the next line.
3. Inspect:
   - **Watch** window: Variables (locals, upvalues, globals in scope) and My Watches (expressions you add, re-evaluated at each pause).
   - **Call Stack**: how you got here; click frames to see their variables.
   - **Breakpoints** window: all breakpoints across scripts, enable / disable in bulk.
4. Step with the mezzanine buttons: **Step Into (F11)** enters the function on the current line; Step Over and Step Out move past or out of functions. **Resume Scripts** continues.

## Patterns that save time
- **Find who changes a value.** Put a conditional breakpoint inside the setter or `GetPropertyChangedSignal` handler with a condition on the bad value, then read the Call Stack.
- **Rare bugs in loops.** Conditional breakpoint on the iteration or ID that fails instead of stepping 500 times.
- **Remote handlers.** Logpoint at the top of `OnServerEvent` handlers printing the arguments; turn it off when done, no code change to revert.
- **Client vs server confusion.** Set Trigger At explicitly; in Server & Clients mode each DataModel has its own scripts.

## Beyond breakpoints
- **Command Bar**: run Luau in edit mode or in the current playtest context to inspect or change state.
- **Developer Console (F9)**: works in live servers where the debugger does not; check client and server logs and memory.
- **Log files**: Studio and client logs on disk (Windows, Mac, iOS, Android locations are listed in the debugging docs) are where crashes leave evidence.

## Pitfalls
- Pausing the server for a long time can drop simulated clients or trigger timeouts in your own code; resume promptly.
- Breakpoints do not help with timing bugs that disappear when paused; use logpoints with `os.clock()` there.
- Remove or disable temporary debugging before profiling, since logpoints still cost time.

## Related
[[Testing - Hub]] · [[Debugging Playbook]] · [[Troubleshooting Field Guide]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]]
