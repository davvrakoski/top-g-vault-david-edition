---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/stylua-config-ci"
title: "StyLua for Roblox - Config, Ignore Rules and CI Check"
tags: [roblox, community, "cluster/testing-qa-and-devops", format, stylua, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0 (StyLua); MIT (stylua-action)"
sources:
  - https://github.com/JohnnyMorganz/StyLua
  - https://github.com/JohnnyMorganz/stylua-action
---
# StyLua for Roblox - Config, Ignore Rules and CI Check

| | |
|---|---|
| **What** | Opinionated Lua/Luau code formatter |
| **Maintainer** | JohnnyMorganz |
| **License** | StyLua MPL-2.0; the GitHub Action `stylua-action` is MIT |
| **Version seen** | README install examples pin 2.6.0 (2026-10-25) |
| **Link** | https://github.com/JohnnyMorganz/StyLua |

## Why format in CI
Formatting drift makes every diff noisy, and noisy diffs hide real bugs in review. A formatter check in CI ends style debates: the tool decides.

## 1. `stylua.toml` (original example; defaults noted)

```toml
# stylua.toml
syntax = "Luau"            # default "All"; Luau avoids ambiguity with Lua 5.x syntax
column_width = 120         # default 120
line_endings = "Unix"      # default Unix; keeps Windows and macOS teammates in sync
indent_type = "Tabs"       # default Tabs (matches Studio)
indent_width = 4           # default 4
quote_style = "AutoPreferDouble"   # default
call_parentheses = "Always"        # default
collapse_simple_statement = "Never" # default

[sort_requires]
enabled = false            # default false; turning it on reorders require lines
```

Only write the keys you change; the comments above list the README defaults so you can see what you are overriding.

## 2. Ignoring code
- `.styluaignore` uses gitignore-style patterns (for example `Packages/`, `vendor/`).
- Files passed **directly** on the command line are formatted anyway unless you add `--respect-ignores`. In CI, pass a folder (`stylua --check src`) or add that flag.
- Inline: `-- stylua: ignore` before one statement, or `-- stylua: ignore start` / `-- stylua: ignore end` around a range. Ignores cannot cross scope boundaries.

Good uses of ignore: hand-aligned data tables (loot weights, keyframe tables) where alignment carries meaning.

## 3. The CI check
- `stylua --check src` prints a diff instead of rewriting, and **exits with status 1** if any file needs formatting.
- Output formats: `--output-format` with `standard`, `unified`, `json` or `summary` (`summary` is the friendliest in CI logs).

Option A, via the toolchain manager (keeps one version for everyone):

```yaml
- name: Check formatting
  run: stylua --check --output-format summary src
```

Option B, via the official action (original example; pin the version, the README warns `latest` can break when formatting rules change):

```yaml
- uses: JohnnyMorganz/stylua-action@v5
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
    version: 2.6.0
    args: --check src
```

All three inputs (`token`, `version`, `args`) are marked required in the action README.

## 4. Team workflow
- Format on save in your editor with the same version as CI.
- When upgrading StyLua, do it in one pull request that **only** reformats, so reviewers can skip it.
- Run the format check before tests in CI; it is the cheapest failure.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[selene for Roblox - Config, Std and Inline Filters]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] · [[Toolchain Managers - Rokit, Foreman and Aftman]]

<!-- TDOD_GRAPH_END -->
