---
title: "Output"
description: "The Output window in Roblox Studio displays error messages, calls to print(), and calls to warn()."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/output"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Output window in Roblox Studio displays error messages, calls to print(), and calls to warn().*

The **Output** window, accessible from Studio's **Window** menu or **Script** tab toolbar, displays errors captured from running scripts, messages from Roblox Engine, messages from calls to `print()`, and errors from calls to `warn()`.

Plugins can interact with the **Output** window through [[30 Official Roblox Docs/API Reference/Classes/LogService|LogService]] which can record and clear the window's contents. You can customize the output through the following elements:

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Filters output by type, such as **Error** or **Warning**.

*(image in the full Top G Vault)*

Filters output by context, such as **Client**, **Server**, or **User Plugin**.

*(image in the full Top G Vault)*

Filters output by the text entered into the field, such as an object name.

*(image in the full Top G Vault)*

Clears all output messages from the window. This action has a shortcut of <kbd>Ctrl</kbd><kbd>K</kbd> on Windows or <kbd>⌘</kbd><kbd>K</kbd> on Mac.

*(image in the full Top G Vault)*

Controls the level of detail displayed for each output message.

- **Show Timestamp** — Shows a detailed timestamp in `HH:MM:SS.SSS` format.
- **Show Context** — Shows the message context, such as **Client** or **Server**.
- **Show Source** — If applicable, shows the associated script name and line number.
- **Show Tables Expanded by Default** — For outputted tables, contents are expanded by default.
- **Show Memory Address for Expandable Tables** — For expandable tables, shows the internal memory address, such as `0xb4f0417581144ec5`.
- **Log Mode** — Simplifies output by removing options, such as expandable trees.

---
*Source: [Output](https://create.roblox.com/docs/studio/output) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
