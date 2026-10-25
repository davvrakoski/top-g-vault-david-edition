---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - native in Practice - Picking Functions, Checking Code Size and Avoiding Deopts"
tags: [roblox, community-knowledge, performance, luau, native-codegen, profiling]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/luau/native-code-gen
  - https://luau.org/performance
  - https://create.roblox.com/docs/studio/optimization/scriptprofiler
---
# Speed - native in Practice - Picking Functions, Checking Code Size and Avoiding Deopts

Native code generation compiles Luau functions to machine code instead of bytecode. It can make number-crunching server code noticeably faster, but it is not free: compile time at server start, extra memory, and a hard cap on total native code per game. Putting `--!native` on every script wastes that cap on code that never runs hot. This note is the workflow for using it on purpose. (The broader hot-path rules are in [[Script Profiler, Native Code Gen and Luau Hot Paths]].)

## What it is good and bad at

From the Creator Hub page: the best candidates do a lot of computation **inside Luau**, especially math on tables and `buffer` data. Code that mostly calls Roblox APIs (`Instance` properties, `Raycast`, `FindFirstChild`) gains little, because the time is spent in the engine, not in your bytecode. Only functions are compiled; top-level script code runs once and gains almost nothing.

| Good candidate | Poor candidate |
|---|---|
| Noise / terrain generation loops | UI event handlers |
| Flow fields, A*, influence maps over arrays | Code that is mostly `:FindFirstChild` and property sets |
| Bit packing, compression, checksums over buffers | One-time setup at the top of a script |
| Custom physics integration on Vector3 math | Rarely called admin commands |
| Damage / stat formulas run thousands of times per frame | Anything you have not profiled |

## The workflow

1. **Profile first.** Script Profiler (Developer Console or Studio) on the server; find functions with high total time that are mostly Luau math.
2. **Mark only those functions** with `@native`, not the whole file:

```lua
@native
local function sampleField(field: buffer, w: number, x: number, z: number): number
	local i = (z * w + x) * 4
	return buffer.readf32(field, i)
end
```

3. **Confirm it runs natively.** In the Script Profiler, native functions show `<native>` next to their name. If it is missing, see the deopt list below.
4. **Measure the gain.** Compare the function's time with and without the attribute on the same workload. Keep it only if the gain is real.
5. **Check code size.** In Studio, switch to the **Server** view and run `debug.dumpcodesize()` in the command bar. The output lists native scripts and functions by size and each one's share of the native code limit. Large functions you rarely call should not be native.

## What breaks native execution (deopts)

From the official list:

- `getfenv` / `setfenv` anywhere in the script.
- Builtins like `math.asin` called with non-numbers.
- Calling a typed function with the wrong type (for example `foo(true)` where `foo(arg: string)`).
- **Breakpoints**: placing one disables native execution for that function while debugging.

## Compile limits and their errors

The Output window reports these when you hit them:

- a single code block over **64K instructions**: split the function;
- over **32K internal blocks** in one function: simplify control flow;
- over **1 million instructions** for a whole script: move big functions to a non-native module or use `@native` selectively;
- "Memory allocation limit reached for native code generation": remove `--!native` from memory-heavy scripts so more small hot ones fit.

## Rules of thumb

- Start with zero native code. Add it to the top 1 to 5 profiled hot functions.
- Prefer `@native` per function over `--!native` per script.
- Annotate `Vector3` parameters (see [[Speed - Type Annotations and Runtime Speed - What Types Actually Change]]); unannotated `v.X` is assumed to be a table access and generates slower guarded code.
- The Creator Hub page describes this as a **server-side** feature. Do not count on it for client frame time unless you have confirmed client support for your target platforms (unverified for 2026).
- Re-check `debug.dumpcodesize()` after big merges; native size creeps up.

## Pitfalls

- "Native made it slower": usually a type misprediction (operator-overloaded values in a function assumed numeric) or a function dominated by API calls.
- Debugging a native function and seeing missing locals: the debugger's locals view can be incomplete for native frames.
- Hitting the limit with generated code (huge lookup-table functions): store such data in tables or buffers, not code.

## Related
[[Performance - Hub]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[MicroProfiler Reading Guide]] · [[Speed - Table vs buffer for Big In-Memory Data - Grids, Maps and Caches]]
