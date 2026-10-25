---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Moving from studio-rust-mcp-server to the Built-in Studio MCP"
tags: [roblox, community-knowledge, ai, mcp, studio, claude-code, migration]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/Roblox/studio-rust-mcp-server
  - https://create.roblox.com/docs/studio/mcp
  - https://create.roblox.com/docs/assistant/mcp
---
# Moving from studio-rust-mcp-server to the Built-in Studio MCP

Many early AI-in-Studio setups (2025 tutorials, YouTube guides, older AGENTS.md files) use **`Roblox/studio-rust-mcp-server`**, the open-source reference MCP server that talked to Studio through a plugin. That repository is now **archived and read-only** with the notice that it is no longer actively developed; Roblox points users to the **MCP server built into Studio**. If your project instructions, onboarding docs or agent configs still mention `rbx-studio-mcp.exe` or the old plugin, this note is the checklist to switch. Setup and guardrails for the new server are covered in depth in [[Claude and the Roblox Studio MCP Server - Responsible Setup]].

**License of the old repo: MIT** (fine to read or fork for reference).

## Old vs new at a glance

| | studio-rust-mcp-server (archived) | Built-in Studio MCP |
| --- | --- | --- |
| Install | download a release binary, it auto-configured Claude Desktop/Cursor; Studio plugin long-polled a local web server | ships with Studio; enable in Assistant > ... > Manage MCP Servers > "Enable Studio as MCP server" |
| Transport | stdio (`--stdio`) | stdio |
| Client config | binary path as `command` | Windows: `cmd.exe /c %LOCALAPPDATA%\Roblox\mcp.bat`; macOS: Studio's `StudioMCP` executable; or **Quick connect** for supported clients (Claude Code, Claude Desktop, Codex CLI, Cursor, Gemini CLI, VS Code, Antigravity) |
| Multiple Studios | one session | every tool takes a `studio_id`; `list_roblox_studios` finds it |
| Status | archived | maintained by Roblox |

## Tool mapping

| Old tool | Closest built-in tool(s) |
| --- | --- |
| `run_code` | `execute_luau` (with `datamodel_type` Edit, Client or Server) |
| `insert_model` | `search_asset` + `insert_asset` |
| `get_console_output` | `get_console_output` |
| `start_stop_play` | `start_stop_play` |
| `run_script_in_play_mode` | `start_stop_play` + `execute_luau` on the Server/Client datamodel, or the `playtest` subagent |
| `get_studio_mode` | `get_studio_state` |
| (none) | `script_read`, `multi_edit`, `script_search`, `script_grep`, `search_game_tree`, `inspect_instance` |
| (none) | `screen_capture`, `character_navigation`, `user_keyboard_input`, `user_mouse_input` |
| (none) | `generate_mesh`, `generate_material`, `generate_procedural_model`, `upload_image`, `store_image` |
| (none) | `http_get` (allowed Roblox docs only), `skill`, `subagent` (`explore`, `playtest`) |

The biggest practical change: the new server can **edit scripts directly** (`multi_edit`) and **read** them by path, instead of everything going through `run_code`. Prompts that told the agent "use run_code to set Source" should be rewritten.

## Migration checklist

1. **Remove the old server** from your client config (`mcpServers` entry pointing at the old binary) and uninstall the old Studio plugin, so two servers don't both answer.
2. **Enable the built-in server** in Studio and connect with Quick connect or the JSON/CLI config above. Restart the client.
3. **Update instructions files** (`CLAUDE.md`, `AGENTS.md`): replace old tool names, add "always pass the right `studio_id`", and list which tools need human approval (asset insertion, `execute_luau` on Edit, mesh generation).
4. **Review permissions**: new write-capable tools (`multi_edit`, `insert_asset`, `generate_*`) deserve approval prompts in your client.
5. **Re-test** one end-to-end loop: read a script, make an edit, start play, read console output, stop play.
6. **Commit** before and after the first agent session ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).

## Watch out for
- Roblox's warning applies to both servers: connected MCP clients can read and modify your open places; only connect clients you trust.
- `http_get` is limited to Roblox documentation URLs; agents that need other sites must use their own web tools, and anything fetched is untrusted data ([[Plugin and MCP Supply-Chain Security]]).
- Old blog posts about the archived server's plugin toggles ("click the plugin icon to enable MCP") no longer apply.

## Related
[[Claude MCP AI Workflow - Hub]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]] · [[Roblox Assistant Skills and Planning Mode - Team Setup]] · [[AI Claude MCP Production Workflow]]
