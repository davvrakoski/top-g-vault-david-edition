---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/selene-roblox-config"
title: "selene for Roblox - Config, Std and Inline Filters"
tags: [roblox, community, "cluster/testing-qa-and-devops", lint, selene, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0 (selene)"
sources:
  - https://github.com/Kampfkarren/selene
  - https://kampfkarren.github.io/selene/usage/configuration.html
  - https://kampfkarren.github.io/selene/roblox.html
  - https://kampfkarren.github.io/selene/usage/filtering.html
---
# selene for Roblox - Config, Std and Inline Filters

| | |
|---|---|
| **What** | Fast Lua/Luau linter written in Rust |
| **Maintainer** | Kampfkarren |
| **License** | MPL-2.0 |
| **Link** | https://github.com/Kampfkarren/selene · docs https://kampfkarren.github.io/selene |

## 1. `selene.toml` for a Roblox repo (original example)

```toml
# selene.toml
std = "roblox"

# Generated/vendored code is not ours to lint.
exclude = ["Packages/*", "DevPackages/*", "vendor/*"]

[lints]
# Treat these as build-breaking in CI.
shadowing = "deny"
unused_variable = "deny"
# Noisy during prototyping; still visible.
empty_if = "warn"
```

How the docs define it:
- `std`: the standard library. Chain several with `+` (for example `std = "roblox+testez"` while you still have TestEZ specs).
- `[lints]`: each lint is `"allow"`, `"warn"` or `"deny"`. Warn and deny behave the same except colour and counters, so your **CI step decides** whether warnings fail the build.
- `[config]`: per-lint options (for example `empty_if = { comments_count = true }`).
- `exclude`: glob list of files to skip.

## 2. The Roblox standard library
- With `std = "roblox"`, selene **generates** the Roblox std on first run and refreshes it automatically every 6 hours (needs internet). `selene update-roblox-std` forces a refresh.
- For CI that should not depend on the network, set `roblox-std-source = "pinned"`. selene then generates `roblox.yml` in your project (or run `selene generate-roblox-std`). Commit it and refresh it on purpose, in its own pull request.
- Using TestEZ? Set `std = "roblox+testez"` and add a `testez.yml` (the docs link a template). Drop it after you migrate to Jest Lua.

## 3. Inline filters (when a rule is wrong for one spot)
- One block: `-- selene: allow(lint_name)` placed before the block. It covers the **whole enclosing block**, not just the next line.
- Whole file: `--# selene: allow(lint_name)` before any code (otherwise selene raises `invalid_lint_filter`).
- Several lints: `-- selene: allow(lint_one, lint_two)`.

House rule worth adopting: every inline allow gets a reason on the same or next line, so reviewers can challenge it.

```luau
-- selene: allow(shadowing) -- loop var intentionally reuses the outer name for readability
for _, player in players do
	local player = resolveAlias(player)
	award(player)
end
```

## 4. Running it
- Local: `selene src`.
- CI: same command; a non-zero exit fails the job. See [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]].
- Install through your toolchain manager so local and CI versions match ([[Toolchain Managers - Rokit, Foreman and Aftman]]).

## Common mistakes
- Forgetting `std = "roblox"`, then "fixing" hundreds of `game is undefined` warnings by hand.
- Linting `Packages/`: you get warnings for code you cannot change.
- Blanket `--#` file-level allows that hide real bugs later.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[StyLua for Roblox - Config, Ignore Rules and CI Check]] · [[luau-lsp analyze and Rojo Sourcemaps in CI]] · [[Luau Strict Mode and Type Checking in Practice]] · [[Unit Testing Luau with Jest-Lua and TestEZ]]

<!-- TDOD_GRAPH_END -->
