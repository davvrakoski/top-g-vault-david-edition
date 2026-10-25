---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/luau-lsp-analyze-ci"
title: "luau-lsp analyze and Rojo Sourcemaps in CI"
tags: [roblox, community, "cluster/testing-qa-and-devops", types, luau-lsp, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MIT (luau-lsp); MPL-2.0 (Rojo)"
sources:
  - https://github.com/JohnnyMorganz/luau-lsp
  - https://github.com/rojo-rbx/rojo
---
# luau-lsp analyze and Rojo Sourcemaps in CI

| | |
|---|---|
| **What** | Luau language server; its standalone `luau-lsp analyze` command type-checks and lints from the command line |
| **Maintainer** | JohnnyMorganz |
| **License** | MIT |
| **Link** | https://github.com/JohnnyMorganz/luau-lsp |

**Why:** selene catches style and suspicious patterns; the **type checker** catches "this field doesn't exist", wrong argument counts and nil misuse in `--!strict` files. Running it in CI means a type error blocks the merge instead of reaching players. Strict-mode habits are covered in [[Luau Strict Mode and Type Checking in Practice]].

## The two inputs the analyzer needs
1. **A sourcemap.** Your code says `require(script.Parent.Inventory)`; the checker must know which file `script.Parent.Inventory` is. Rojo writes that map:
   - Editor (watch mode, from the README): `rojo sourcemap --watch default.project.json --output sourcemap.json`
   - CI (one shot): the same command without `--watch`.
   - Rojo 7.3.0+ is required. The README recommends adding `sourcemap.json` to `.gitignore`; generate it fresh in CI.
2. **Roblox API type definitions**, so the checker knows what an `Instance` or `Players` is. In the editor extension these are preloaded for Rojo users. For the standalone CLI you pass a definitions file.

## The CI step (shape, not gospel)
The flag spelling for definitions has changed between luau-lsp versions: some guides show `--definitions=<file>`, the current docs index describes a named form `--definitions:@name=<file>`. **Run `luau-lsp analyze --help` for your pinned version** and copy from that.

```yaml
# Original example: adjust flags to your luau-lsp version's --help output
- name: Generate sourcemap
  run: rojo sourcemap default.project.json --output sourcemap.json

- name: Type check
  run: luau-lsp analyze --sourcemap=sourcemap.json --definitions=types/roblox.d.luau src
```

Where the definitions file comes from: download it in a CI step from the source your luau-lsp version documents, or commit a copy and refresh it on purpose. Do not fetch "latest" silently on every run if you want reproducible builds.

## Rollout tips
- Start with `--!strict` only in new modules and the economy/data folders; widen over time.
- Keep a `.luaurc` in the repo so the editor and CI agree on mode and aliases.
- Treat type errors as build failures from day one in strict folders; warnings elsewhere.
- Pin luau-lsp in your toolchain file ([[Toolchain Managers - Rokit, Foreman and Aftman]]).

## Common mistakes
- Committing a stale `sourcemap.json` so CI checks against yesterday's tree.
- Analyzing `Packages/` and drowning in third-party errors; pass only your source folders or use the ignore option shown in `--help`.
- Copying flags from an old blog post (the definitions flag is the usual casualty).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Luau Strict Mode and Type Checking in Practice]] · [[selene for Roblox - Config, Std and Inline Filters]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] · [[Script Sync vs Rojo — 2026 Decision Guide]]

<!-- TDOD_GRAPH_END -->
