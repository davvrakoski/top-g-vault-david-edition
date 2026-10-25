---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - Type Annotations and Runtime Speed - What Types Actually Change"
tags: [roblox, community-knowledge, performance, luau, types, native-codegen]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://luau.org/performance
  - https://create.roblox.com/docs/luau/native-code-gen
  - https://create.roblox.com/docs/luau/type-checking
---
# Speed - Type Annotations and Runtime Speed - What Types Actually Change

A common belief is that adding `--!strict` and type annotations makes Luau code faster. Mostly it does not, with one important exception: native code generation. Knowing where types matter stops you from spending a week annotating UI code for zero gain, and points you at the few annotations that really change the generated code.

## Three separate things

| Thing | What it does | Runtime speed effect |
|---|---|---|
| `--!strict` / `--!nonstrict` / `--!nocheck` | Chooses how hard the type checker analyses the script in Studio | none by itself; it is analysis, not compilation |
| Type annotations in interpreted code | The compiler may use type info for small peephole optimizations | small, per the Luau team |
| Type annotations in `@native` / `--!native` code | Function parameter types are checked and used to specialise generated machine code | can be large for `Vector3` and other non-number values |

## What the Luau team says

The Luau performance guide explains that, because Roblox controls the whole stack, the compiler **can** use type information, but that this is "currently limited to small peephole optimizations". It also notes that the JIT (native code) takes type annotations into account to specialise code paths and does **not** do runtime type analysis. So in native code, your annotations are the main type information it has.

## The annotation that matters most

Under native codegen, the compiler guesses types. It assumes `a + b` is numeric and `t.X` is a table field. If `v` is really a `Vector3`, the guess is wrong and the code pays for checks and fallbacks. The Creator Hub example compares the same function with and without a `v: Vector3` annotation: annotated, specialised vector code is generated.

```lua
--!native
local function lengthSq(v: Vector3): number   -- specialised
	return v.X * v.X + v.Y * v.Y + v.Z * v.Z
end

local function lengthSqSlow(v)                -- guarded table path
	return v.X * v.X + v.Y * v.Y + v.Z * v.Z
end
```

Priority list for native hot functions:

1. `Vector3` parameters.
2. `buffer` parameters for byte-crunching code.
3. `number` parameters where the function also accepts other types elsewhere (helps avoid mispredictions).
4. `CFrame` and other userdata used in math.

## The trap: wrong types deoptimise

Annotations are checked in native code. Calling a typed function with the wrong type (the docs' example is passing `true` to a `string` parameter) causes a deoptimisation and falls back to slower execution. A loose `any` that flows into a typed native function can quietly cost more than no annotation at all. In strict mode the type checker catches most of these in Studio before they ship, which is the real performance value of `--!strict` around native code.

## Practical guidance

- Use `--!strict` for **correctness**: fewer nil errors, safer refactors. Do not expect frame-time gains from it.
- In functions you mark `@native`, annotate every parameter, especially vectors.
- Keep types honest at boundaries: remote handlers receive `any`; validate and convert (`typeof(x) == "Vector3"`) before passing into typed hot functions.
- Measure with the Script Profiler (look for `<native>` and compare times) rather than assuming.
- Interpreted code wins come from the usual sources instead: fewer allocations, fewer engine calls, using `obj:Method()` syntax and direct builtin calls (`math.max(x, 1)`), which the Luau guide says get the "fastcall" path.

## Pitfalls

- Generic or union-typed parameters (`number | Vector3`) give native code no single type to specialise; split into two functions if both are hot.
- Type casts (`:: Vector3`) are compile-time only; they do not convert values. Casting a table to `Vector3` and passing it into native code is a deopt.
- Annotating returns and locals helps tooling, but the native docs specifically call out **function arguments** as what is checked.

## Related
[[Performance - Hub]] · [[Speed - native in Practice - Picking Functions, Checking Code Size and Avoiding Deopts]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[Luau GC Pressure - What Allocates and How to Cut It]]
