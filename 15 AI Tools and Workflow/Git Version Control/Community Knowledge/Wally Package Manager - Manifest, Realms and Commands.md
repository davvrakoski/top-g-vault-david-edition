---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "Wally Package Manager - Manifest, Realms and Commands"
tags: [roblox, community-knowledge, wally, packages, dependencies, tooling, mpl-2]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/UpliftGames/wally
  - https://github.com/Sleitnick/RbxUtil
  - https://raw.githubusercontent.com/evaera/roblox-lua-promise/master/wally.toml
---
# Wally Package Manager - Manifest, Realms and Commands

Wally is the community package manager for Roblox (think npm or Cargo for Luau). Instead of copying a ModuleScript from a forum post and never updating it, you declare `Promise = "evaera/promise@4.0.0"` in a manifest, run one command, and get the exact version on every machine. Most open-source Roblox libraries (Promise, Fusion, Trove, Iris, Jest-Lua) publish to Wally. This note covers the manifest, the three realms, the commands, and how packages reach your game through Rojo.

**Wally's own license is MPL-2.0** (the tool; you don't ship it in your game). Each package has its own license: check the `license` field and the package's LICENSE before you ship it ([[Licenses of Popular Roblox Libraries - Quick Table]]).

## wally.toml

```toml
[package]
name = "mystudio/my-game"      # scope/name: lowercase, digits, dashes
version = "0.1.0"              # semantic versioning
registry = "https://github.com/UpliftGames/wally-index"
realm = "shared"               # "shared" or "server"
private = true                 # never publish the game itself

[dependencies]                 # shared code: client and server
Promise = "evaera/promise@4.0.0"
Trove = "sleitnick/trove@1.8.0"
Signal = "sleitnick/signal@2.0.3"

[server-dependencies]          # only the server needs these
# ProfileStore or other server-only packages go here

[dev-dependencies]             # tests and tools only
# Jest-Lua, test helpers
```

- Package names are always `scope/name`.
- The left side (`Promise`) is the **alias**: the name of the folder/module you `require`.
- `license` (an SPDX expression like `MIT`) is required to publish publicly; also available: `description`, `authors`, `homepage`, `repository`, `include`, `exclude`.

## Realms and output folders

| Section | Installed to | Map in Rojo to |
| --- | --- | --- |
| `[dependencies]` | `Packages/` | `ReplicatedStorage.Packages` |
| `[server-dependencies]` | `ServerPackages/` | `ServerScriptService.ServerPackages` or `ServerStorage` |
| `[dev-dependencies]` | `DevPackages/` | somewhere only test runs load |

Keeping server-only packages out of ReplicatedStorage means clients never download that code. Dev packages should not be in your production Rojo project at all ([[Wally Dev Dependencies and Lockfiles for Test Packages]]).

## Commands

| Command | Does |
| --- | --- |
| `wally init` | create a new empty manifest |
| `wally install` | install everything per manifest and lockfile |
| `wally update [names]` | update all or named packages within allowed versions |
| `wally search <query>` | search the registry |
| `wally login` / `wally logout` | registry auth (for publishing) |
| `wally publish` | publish the current package |
| `wally package --output <path>` | build the package archive without publishing |

Commit `wally.toml` **and** `wally.lock`; ignore the generated package folders ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).

## Types for packages
Wally's generated package entry points are thin re-export files, so luau-lsp may lose types through them. The community tool `wally-package-types` (run after `wally install`, with a Rojo sourcemap) rewrites those stubs to re-export types. Verify the tool is still maintained before adding it (unverified for 2026).

## Version requirement tips
- `@4.0.0` in Wally means "compatible with 4.0.0" by semver rules (minor and patch updates allowed for 1.x+). Pin exactly with `=4.0.0` if a package has broken compatibility before (behaviour per semver conventions; check Wally's README for exact syntax support).
- 0.x packages (like Fusion's prereleases) treat minor bumps as breaking; update them deliberately.
- Read changelogs before `wally update` on a release branch.

## Supply-chain hygiene
Packages run with full script permissions inside your game. Prefer well-known authors, read the code of small packages, keep the lockfile in review, and watch for typo-squatted names ([[Plugin and MCP Supply-Chain Security]]).

## Related
[[Git Version Control - Hub]] · [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] · [[Toolchain Managers - Rokit, Foreman and Aftman]] · [[Wally Dev Dependencies and Lockfiles for Test Packages]]
