---
title: "ScriptDocument"
description: "Represents the ephemeral state of an open document in the Studio Script Editor, providing APIs for reading and editing code."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScriptDocument"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents the ephemeral state of an open document in the Studio Script Editor, providing APIs for reading and editing code.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] instance is a proxy of the document of a Studio Script Editor. It's different from the [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] open in the editor in that it represents the ephemeral state of an open document, and its representation is in a format that's more suited for reading and editing code than executing it. In particular, [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] reflects any changes that have been made to the open script in Drafts Mode, which the source property doesn't.

The Script Editor itself exists and changes on a different thread than any [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], so the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] replicates the open Script Editor, but it isn't the open editor. Because of the replication, there's sometimes a slight delay between changing the text in the editor and updating the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]]. The delay usually occurs because the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is busy, and it's almost always extremely small, but it still exists.

The existence of a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] indicates that a document is open in the Script Editor. All [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] instances have [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService|ScriptEditorService]] as its parent. Each instance adheres to the following encoding conventions:

- All text in [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] is UTF-8 encoded.
- All line indices are 1-indexed.
- All character indices are 1-indexed and count UTF-8 bytes, not graphemes, so the same warning from [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition|TextBox.CursorPosition]] applies: many Unicode characters take more than one byte.
- All ranges are inclusive of their start position and exclusive of their end position, so start == end implies an empty range.

All APIs for [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] are at **Plugin** level security.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#AddReadOnlyReasonsAsync\|AddReadOnlyReasonsAsync()]] | () | Adds reasons for the Script Editor UI to be read-only. Yields the current thread until the editor acknowledges the change. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#CloseAsync\|CloseAsync()]] | Tuple | Requests that the editor associated with this document close. Yields the current thread until the editor responds to the request. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#EditTextAsync\|EditTextAsync()]] | Tuple | Replaces the text in the specified range from (`startLine`, `startColumn`) to (`endLine`, `endColumn`) with newText. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#ForceSetSelectionAsync\|ForceSetSelectionAsync()]] | Tuple | Asks the editor to set its cursor selection to the argument values. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetLine\|GetLine()]] | string | Returns the text of the specified line. When no argument is provided, returns the line of the current cursor position. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetLineCount\|GetLineCount()]] | int | Returns the number of lines in the document. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetReadOnlyReasons\|GetReadOnlyReasons()]] | List<string> | Returns the reasons the Script Editor UI is currently read-only. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetScript\|GetScript()]] | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] | Returns the underlying [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] instance, if one exists, otherwise `nil`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetSelectedText\|GetSelectedText()]] | string | Gets the text selected in the editor, or an empty string if there is no selection. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetSelection\|GetSelection()]] | Tuple | Returns the last known selection of the Script Editor in the format: `CursorLine, CursorChar, AnchorLine, AnchorChar`. If the Script Editor has no selection, `CursorLine == AnchorLine` and `CursorChar == AnchorChar`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetSelectionEnd\|GetSelectionEnd()]] | Tuple | Gets the larger of the cursor position and anchor. If the editor has no selection, they are the same value. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetSelectionStart\|GetSelectionStart()]] | Tuple | Gets the smaller of the cursor position and anchor. If the editor has no selection, they are the same value. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetText\|GetText()]] | string | Returns text from the open editor. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetViewport\|GetViewport()]] | Tuple | Returns the currently displayed line numbers in the editor change. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#HasSelectedText\|HasSelectedText()]] | boolean | Returns whether or not the editor has any text selected. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#IsCommandBar\|IsCommandBar()]] | boolean | Returns true if the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] represents the Command bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#IsReadOnly\|IsReadOnly()]] | boolean | Returns true if the Script Editor UI is currently read-only. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#MultiEditTextAsync\|MultiEditTextAsync()]] | Tuple | Applies a batch of text edits to the document as a single atomic operation. Yields the current thread until the editor responds. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#RemoveReadOnlyReasonsAsync\|RemoveReadOnlyReasonsAsync()]] | () | Removes reasons for the Script Editor UI to be read-only. Yields the current thread until the editor acknowledges the change. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#RequestSetSelectionAsync\|RequestSetSelectionAsync()]] | Tuple | Asks the editor to set its cursor selection to the argument values. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#ReviewableTextEditsAsync\|ReviewableTextEditsAsync()]] | Tuple | Applies a batch of line-based text edits that appear in the editor as reviewable inline diffs, allowing users to accept or reject each change. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#SelectionChanged\|SelectionChanged]] | `positionLine`, `positionCharacter`, `anchorLine`, `anchorCharacter` | Fires when the ScriptDocument changes, including immediately after a text change. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#ViewportChanged\|ViewportChanged]] | `startLine`, `endLine` | Fires when the displayed line numbers in the editor change. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AddReadOnlyReasonsAsync

```lua
ScriptDocument:AddReadOnlyReasonsAsync(reasons: Array): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Adds reasons for the Script Editor UI to be read-only, which makes the editor read-only. Yields the current thread until the editor acknowledges the change. Adding a reason that is already active does nothing.

Read-only state is tracked as a set of named reasons so that multiple plugins can make an editor read-only without interfering with each other. The editor stays read-only until every reason is removed with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#RemoveReadOnlyReasonsAsync|ScriptDocument:RemoveReadOnlyReasonsAsync()]].

Read-only mode only prevents changes from the editor UI and [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] edit functions. It doesn't prevent changes made by other means, such as setting [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]] or calling [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#UpdateSourceAsync|ScriptEditorService:UpdateSourceAsync()]].

Reasons starting with `RBX` are reserved for Roblox; this function throws an error if `reasons` contains one. This function also throws an error for the Command bar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `reasons` | Array |  | An array of non-empty strings naming the reasons to add. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptDocument-AddReadOnlyReasonsAsync`) are published on the source page; their code is not part of the open-source repo.*

### CloseAsync

```lua
ScriptDocument:CloseAsync(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Requests that the editor associated with this document close. Yields the current thread until the editor responds to the request. If the function succeeds, it returns (true, nil). If the function fails, it returns (false, string) as a description of the problem.

This function can't close the command bar.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if the editor closed successfully, or `false` followed by a string describing the failure reason. |

*Code samples for this member (`ScriptDocument-CloseAsync`) are published on the source page; their code is not part of the open-source repo.*

### EditTextAsync

```lua
ScriptDocument:EditTextAsync(newText: string, startLine: int, startCharacter: int, endLine: int, endCharacter: int): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Replaces the text in the specified range from (`startLine`, `startColumn`) to (`endLine`, `endColumn`) with `newText`. If the range is empty, then the function inserts the text at (`startLine`, `startColumn`). If the text cursor is within the specified range, the cursor moves to the end position of the edit. Otherwise, the text cursor doesn't move. This function yields the current thread until it receives a reply from the editor about the edit.

If the function succeeds, it returns (`true`, `nil`).

The function throws an error if:

- The range is invalid.
- The range would slice one Unicode character, for example replace only some of the bytes of the unicode character.
- The `newText` itself contains invalid UTF-8.

If the function fails, it returns (false, string). The string is a description of the problem. The most common failure type is a version mismatch. This occurs when you try to call `EditTextAsync` during the time when the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] is out of sync with the contents of the editor. If this happens, you can retry the edit.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newText` | string |  | The replacement string to insert into the specified range. |
| `startLine` | int |  | The 1-indexed line number where the replacement range begins. |
| `startCharacter` | int |  | The 1-indexed UTF-8 byte offset within `startLine` where the replacement range begins. |
| `endLine` | int |  | The 1-indexed line number where the replacement range ends (exclusive). |
| `endCharacter` | int |  | The 1-indexed UTF-8 byte offset within `endLine` where the replacement range ends (exclusive). |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if the edit was applied successfully, or `false` followed by a string describing the failure reason. |

### ForceSetSelectionAsync

```lua
ScriptDocument:ForceSetSelectionAsync(cursorLine: int, cursorCharacter: int, anchorLine: int? = nil, anchorCharacter: int? = nil): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Asks the editor to set its cursor selection to the argument values. Both anchor arguments must be passed, or neither. If neither is passed, then they each default to being the same as the corresponding cursor argument. The editor might decline to update its cursor if the text content of the document has changed. Unlike [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#RequestSetSelectionAsync|ScriptDocument:RequestSetSelectionAsync()]], the editor will not decline to move its cursor if the cursor has moved since the request was made. Returns (true, nil) if the cursor was updated, and (false, string) with an explanation string if it was not. Yields the current thread until the editor replies.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cursorLine` | int |  | The 1-indexed line number for the cursor position. |
| `cursorCharacter` | int |  | The 1-indexed UTF-8 byte offset within the line for the cursor position. |
| `anchorLine` | int? | `nil` | The 1-indexed line number for the anchor position. Defaults to `cursorLine` if not provided. |
| `anchorCharacter` | int? | `nil` | The 1-indexed UTF-8 byte offset within the line for the anchor position. Defaults to `cursorCharacter` if not provided. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if the cursor was updated, or `false` followed by a string explaining why the update was declined. |

*Code samples for this member (`ScriptDocument-ForceSetSelectionAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetLine

```lua
ScriptDocument:GetLine(lineIndex: int? = nil): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the text of the specified line. When no argument is provided, returns the line of the current cursor position.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `lineIndex` | int? | `nil` | The 1-indexed line number to retrieve. Defaults to the current cursor line if not provided. |

**Returns**

| Type | Description |
| --- | --- |
| string | The text content of the specified line as a string. |

*Code samples for this member (`ScriptDocument-SelectionChanged-GetLine`) are published on the source page; their code is not part of the open-source repo.*

### GetLineCount

```lua
ScriptDocument:GetLineCount(): int
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the number of lines in the active document.

**Returns**

| Type | Description |
| --- | --- |
| int | The total number of lines in the document. |

*Code samples for this member (`ScriptDocument-GetLineCount`) are published on the source page; their code is not part of the open-source repo.*

### GetReadOnlyReasons

```lua
ScriptDocument:GetReadOnlyReasons(): List<string>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the reasons the Script Editor UI is currently read-only, sorted alphabetically. The array includes reasons added by any plugin as well as reasons that start with `RBX`, which Roblox reserves for its own features.

**Returns**

| Type | Description |
| --- | --- |
| List<string> | A sorted array of strings. The array is empty if the editor isn't read-only. |

*Code samples for this member (`ScriptDocument-GetReadOnlyReasons`) are published on the source page; their code is not part of the open-source repo.*

### GetScript

```lua
ScriptDocument:GetScript(): LuaSourceContainer
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the underlying [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] instance, if one exists, otherwise `nil`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] that the document is editing, or `nil` if the document does not represent a script instance in the place (e.g. the Command Bar is not a real script instance). |

*Code samples for this member (`ScriptDocument-GetScript`) are published on the source page; their code is not part of the open-source repo.*

### GetSelectedText

```lua
ScriptDocument:GetSelectedText(): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Gets the text selected in the editor, or an empty string if there is no selection.

**Returns**

| Type | Description |
| --- | --- |
| string | The currently selected text as a string, or an empty string if nothing is selected. |

*Code samples for this member (`ScriptDocument-HasSelectedText-GetSelectedText`) are published on the source page; their code is not part of the open-source repo.*

### GetSelection

```lua
ScriptDocument:GetSelection(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the last known selection of the Script Editor in the format: `CursorLine, CursorChar, AnchorLine, AnchorChar`. If the Script Editor has no selection, `CursorLine == AnchorLine` and `CursorChar == AnchorChar`.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | CursorLine, CursorChar, AnchorLine, AnchorChar. |

### GetSelectionEnd

```lua
ScriptDocument:GetSelectionEnd(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Gets the larger of the cursor position and anchor. If the editor has no selection, they are the same value.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of (line, character) representing the larger of the cursor and anchor positions, both 1-indexed. |

*Code samples for this member (`ScriptDocument-GetSelectionStart-GetSelectionEnd`) are published on the source page; their code is not part of the open-source repo.*

### GetSelectionStart

```lua
ScriptDocument:GetSelectionStart(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Gets the smaller of the cursor position and anchor. If the editor has no selection, they are the same value.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of (line, character) representing the smaller of the cursor and anchor positions, both 1-indexed. |

*Code samples for this member (`ScriptDocument-GetSelectionStart-GetSelectionEnd`) are published on the source page; their code is not part of the open-source repo.*

### GetText

```lua
ScriptDocument:GetText(startLine: int? = nil, startCharacter: int? = nil, endLine: int? = nil, endCharacter: int? = nil): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns text from the open editor. Must be called with 0, 2 or 4 arguments:

- If called with 0 arguments, gets the entire contents of the open editor.
- If called with 2 arguments, gets the text of the document starting at (`startLine`, `startColumn`).
- If called with 4 arguments, gets the text of the document starting at (`startLine`, `startColumn`) and ending at (`endLine`, `endColumn`).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `startLine` | int? | `nil` | The 1-indexed line number where the text range begins. Optional; omit all arguments to get the entire document. |
| `startCharacter` | int? | `nil` | The 1-indexed UTF-8 byte offset within `startLine` where the text range begins. |
| `endLine` | int? | `nil` | The 1-indexed line number where the text range ends (exclusive). Optional; omit to read from `startLine`/`startCharacter` to the end of the document. |
| `endCharacter` | int? | `nil` | The 1-indexed UTF-8 byte offset within `endLine` where the text range ends (exclusive). |

**Returns**

| Type | Description |
| --- | --- |
| string | The text content within the specified range as a string. |

*Code samples for this member (`ScriptDocument-GetText`) are published on the source page; their code is not part of the open-source repo.*

### GetViewport

```lua
ScriptDocument:GetViewport(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the currently displayed line numbers in the editor change. The editor displays the lines between startLine and endLine, inclusive. The first and last line might only display partially. For example, only the topmost pixel of the last line might be on screen. Furthermore, code folding might hide lines between startLine and endLine.

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of (startLine, endLine) representing the 1-indexed range of lines currently visible in the editor. |

*Code samples for this member (`ScriptDocument-GetViewport`) are published on the source page; their code is not part of the open-source repo.*

### HasSelectedText

```lua
ScriptDocument:HasSelectedText(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns whether or not the editor has any text selected.

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the editor has a non-empty text selection, `false` otherwise. |

*Code samples for this member (`ScriptDocument-HasSelectedText-GetSelectedText`) are published on the source page; their code is not part of the open-source repo.*

### IsCommandBar

```lua
ScriptDocument:IsCommandBar(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns true if the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] represents the Command bar. The command bar has special rules and limitations in this API:

- Studio creates the Command bar before running plugins, so it doesn't always fire the opened event, although it does close and reopen as Studio transitions between DataModels.
- You can't edit the Command bar with `EditTextAsync` for security reasons.

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if this document represents the Command bar, `false` otherwise. |

*Code samples for this member (`ScriptDocument-IsCommandBar`) are published on the source page; their code is not part of the open-source repo.*

### IsReadOnly

```lua
ScriptDocument:IsReadOnly(): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns true if the Script Editor UI is currently read-only. This is equivalent to checking whether [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetReadOnlyReasons|ScriptDocument:GetReadOnlyReasons()]] returns a non-empty array.

A read-only editor prevents the user from changing the script through the editor UI, and [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] edit functions such as [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#EditTextAsync|ScriptDocument:EditTextAsync()]] fail. It doesn't prevent changes made by other means, such as setting [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]] or calling [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#UpdateSourceAsync|ScriptEditorService:UpdateSourceAsync()]].

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the editor is read-only, `false` otherwise. |

*Code samples for this member (`ScriptDocument-IsReadOnly`) are published on the source page; their code is not part of the open-source repo.*

### MultiEditTextAsync

```lua
ScriptDocument:MultiEditTextAsync(edits: Array): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Applies a batch of text edits to the document as a single atomic operation, then yields the current thread until it receives a reply from the editor. Each entry in the `edits` array is a table describing one replacement, with the same meaning as the arguments to [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#EditTextAsync|ScriptDocument:EditTextAsync()]], and the following fields:

- `NewText`: The replacement text.
- `StartLine`: The line of the start of the range to replace.
- `StartCharacter`: The character of the start of the range to replace.
- `EndLine`: The line of the end of the range to replace.
- `EndCharacter`: The character of the end of the range to replace.

The edits are applied together, so either all of them succeed or none of them are applied. Before applying any edit, the function validates every edit and throws an error if:

- Any range is invalid.
- Any range would slice one Unicode character, for example replace only some of the bytes of the unicode character.
- Any `NewText` itself contains invalid UTF-8.
- The ranges of two edits overlap.

If the function succeeds, it returns (`true`, `nil`). If the function fails, it returns (`false`, `string`), where the string describes the problem. As with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#EditTextAsync|ScriptDocument:EditTextAsync()]], the most common failure is a version mismatch, which occurs when the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] is momentarily out of sync with the contents of the editor; if this happens, you can retry the edits.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `edits` | Array |  | An array of tables, each describing a text replacement with fields `NewText`, `StartLine`, `StartCharacter`, `EndLine`, and `EndCharacter`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if all edits were applied successfully, or `false` followed by a string describing the failure reason. |

### RemoveReadOnlyReasonsAsync

```lua
ScriptDocument:RemoveReadOnlyReasonsAsync(reasons: Array): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Removes reasons for the Script Editor UI to be read-only, previously added with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#AddReadOnlyReasonsAsync|ScriptDocument:AddReadOnlyReasonsAsync()]] or the `InitialReadOnlyReasons` option of [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#OpenScriptDocumentAsync|ScriptEditorService:OpenScriptDocumentAsync()]]. Yields the current thread until the editor acknowledges the change. Removing a reason that isn't active does nothing.

The editor stays read-only while any other reason remains active. Reasons starting with `RBX` are reserved for Roblox; plugins can't remove them, and this function throws an error if `reasons` contains one.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `reasons` | Array |  | An array of non-empty strings naming the reasons to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptDocument-RemoveReadOnlyReasonsAsync`) are published on the source page; their code is not part of the open-source repo.*

### RequestSetSelectionAsync

```lua
ScriptDocument:RequestSetSelectionAsync(cursorLine: int, cursorCharacter: int, anchorLine: int? = nil, anchorCharacter: int? = nil): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Asks the editor to set its cursor selection to the argument values. Both anchor arguments must be passed, or neither. If neither is passed, then they each default to being the same as the corresponding cursor argument. The editor might decline to update its cursor if the text content of the document has changed, or the cursor has moved since the request was made. Returns (true, nil) if the cursor was updated, and (false, string) with an explanation string if it was not. Yields the current thread until the editor replies.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cursorLine` | int |  | The 1-indexed line number for the cursor position. |
| `cursorCharacter` | int |  | The 1-indexed UTF-8 byte offset within the line for the cursor position. |
| `anchorLine` | int? | `nil` | The 1-indexed line number for the anchor position. Defaults to `cursorLine` if not provided. |
| `anchorCharacter` | int? | `nil` | The 1-indexed UTF-8 byte offset within the line for the anchor position. Defaults to `cursorCharacter` if not provided. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if the cursor was updated, or `false` followed by a string explaining why the update was declined. |

*Code samples for this member (`ScriptDocument-RequestSetSelectionAsync`) are published on the source page; their code is not part of the open-source repo.*

### ReviewableTextEditsAsync

```lua
ScriptDocument:ReviewableTextEditsAsync(changes: Array): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Applies a batch of line-based text edits to the document that are presented to the user as reviewable inline diffs in the Script Editor gutter. Each entry in the `changes` array is a table with the following fields:

- `Text`: The replacement text to insert. Must be a non-empty string unless `EndLine` is provided.
- `StartLine`: The 1-indexed line number where the edit begins. If `EndLine` is omitted, the text is inserted before this line. If `EndLine` is provided, lines from `StartLine` through `EndLine` are replaced.
- `EndLine`: Optional. The 1-indexed last line of the range to replace (inclusive). Must be greater than or equal to `StartLine`.

The edits must not overlap or border each other; there must be at least one unchanged line between any two edits. Edits are applied atomically. The function throws an error if any entry has invalid fields. If the function fails due to a version mismatch or other editor-side issue, it returns (`false`, `string`).

This method cannot be used on the Command bar.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `changes` | Array |  | An array of tables, each with a `Text` field (the replacement string), a `StartLine` field (1-indexed line to insert or begin replacing at), and an optional `EndLine` field (1-indexed last line to replace, inclusive). |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first element is `true` if the edits were applied successfully, or `false` followed by a string describing the failure reason. |

## Events

### SelectionChanged

```lua
ScriptDocument.SelectionChanged(positionLine: int64, positionCharacter: int64, anchorLine: int64, anchorCharacter: int64)
```

**Security:** PluginSecurity

Fires when the ScriptDocument changes, including immediately after a text change.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `positionLine` | int64 |  | The 1-indexed line number of the cursor position after the change. |
| `positionCharacter` | int64 |  | The 1-indexed UTF-8 byte offset of the cursor position after the change. |
| `anchorLine` | int64 |  | The 1-indexed line number of the selection anchor after the change. |
| `anchorCharacter` | int64 |  | The 1-indexed UTF-8 byte offset of the selection anchor after the change. |

*Code samples for this member (`ScriptDocument-SelectionChanged-GetLine`) are published on the source page; their code is not part of the open-source repo.*

### ViewportChanged

```lua
ScriptDocument.ViewportChanged(startLine: int64, endLine: int64)
```

**Security:** PluginSecurity

Fires when the displayed line numbers in the editor change. See [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#GetViewport|ScriptDocument.GetViewport]] for details.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `startLine` | int64 |  | The 1-indexed first line currently visible in the editor viewport. |
| `endLine` | int64 |  | The 1-indexed last line currently visible in the editor viewport. |

*Code samples for this member (`ScriptDocument-ViewportChanged`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ScriptDocument](https://create.roblox.com/docs/reference/engine/classes/ScriptDocument) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
