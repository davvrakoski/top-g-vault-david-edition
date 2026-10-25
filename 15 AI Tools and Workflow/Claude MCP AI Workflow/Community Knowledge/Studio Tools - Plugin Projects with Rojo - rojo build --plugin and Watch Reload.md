---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload"
tags: [roblox, community-knowledge, studio, plugins, rojo, git, tooling]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/rojo-rbx/rojo
  - https://raw.githubusercontent.com/rojo-rbx/rojo/master/src/cli/build.rs
  - https://rojo.space/docs/
  - https://create.roblox.com/docs/reference/engine/classes/Studio
  - https://create.roblox.com/docs/projects/external-tools
---
# Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload

Once a plugin grows past one script, editing it inside PluginDebugService gets painful. You get no Git history, no real editor, no linting, and no packages. The common fix is to keep the plugin as files, build it with **Rojo** straight into Studio's local Plugins folder, and let Studio reload it each time you save. Your plugin then gets the same toolchain as your game ([[Rojo, VS Code and luau-lsp - Local Setup from Zero]]).

## The two flags that matter

From Rojo's `build` command source (checked 2026-10-25):

| Flag | Meaning |
| --- | --- |
| `--output` / `-o <file>` | Write the result to a path; it must end in `.rbxm`, `.rbxl`, `.rbxmx` or `.rbxlx` |
| `--plugin` / `-p <file>` | **Instead of `--output`**: write the result into your **local plugins folder**. Must end in `.rbxm` or `.rbxl` |
| `--watch` | Rebuild automatically when any input file changes |

`--output` and `--plugin` cannot be used together. The short forms `-o`/`-p` come from the CLI library's defaults and are not spelled out in the source (unverified; use the long forms in scripts).

```bash
rojo build plugin.project.json --plugin TopGPalette.rbxm --watch
```

## Studio side

- Studio has the setting `ReloadLocalPluginsOnChange`: reload local plugins when their files change. With `--watch`, every save gives a fresh plugin in a second or two.
- If it doesn't reload, check that setting, or use **Plugins > Manage Plugins** to disable and re-enable the plugin.
- You can still set breakpoints: enable **Plugin Debugging Enabled** and find your plugin under PluginDebugService ([[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]]).

## A simple layout

```
my-plugin/
  plugin.project.json
  wally.toml
  src/
    init.server.luau      <- becomes the root Script; runs first
    Toolbar.luau
    Widget.luau
    Util/
      withUndo.luau
  Packages/               <- created by `wally install`
```

```json
{
  "name": "TopGPalette",
  "tree": {
    "$path": "src",
    "Packages": { "$path": "Packages" }
  }
}
```

With `init.server.luau` in `src`, Rojo makes `src` a `Script` named after the project, and the other files become its child ModuleScripts. In `init.server.luau`, `require(script.Toolbar)` and pass `plugin` into your modules. The `plugin` global only exists in the top-level plugin script.

## Keep a separate dev identity

- Build the dev copy as `TopGPalette_Dev.rbxm` and give its toolbar a different name (for example read a `DEV` flag from a small generated module). Then you can run your published copy and your dev copy side by side without both adding buttons with the same IDs.
- Use different `pluginGuiId`s for dev widgets, so dev experiments don't mess up the saved docking of your real tool.

## Releasing

1. `rojo build plugin.project.json -o build/TopGPalette.rbxm`
2. Drag the `.rbxm` into a blank place, select the root Script, then **Plugins > Publish as Plugin** (see [[Studio Tools - Publishing a Plugin - Publish as Plugin, Creator Store Listing and Upload Limits]]).
3. Tag the commit (`git tag v1.3.0`), so a bug report can be traced to exact code.

## Licenses

- **Rojo** is open source under **MPL-2.0**. You use it as a tool; it does not end up in your plugin, so there is no license concern for your output.
- Libraries you bundle through Wally **do** end up in your plugin. Only MIT / CC0 / CC BY 4.0 code is bundle-safe by this vault's rule; check every package's license before you publish.

## Pitfalls

- **Writing into the plugins folder while Studio is closed** is fine. Writing a broken build while Studio is open reloads a broken plugin, so watch the Output.
- **Two Studio windows** each load the plugin, so you get two sets of logs.
- **Script Sync is not a replacement here.** Studio's built-in Script Sync syncs scripts in a place, not plugin files ([[Script Sync vs Rojo — 2026 Decision Guide]]).

## Related

[[Claude MCP AI Workflow - Hub]] · [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] · [[Wally Package Manager - Manifest, Realms and Commands]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]
