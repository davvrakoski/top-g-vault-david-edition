---
title: "ScriptEditorService"
description: "This service is used for interacting with `ScriptDocument` instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*This service is used for interacting with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

This service is used for interacting with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] instances. It provides methods to open, find, and list script documents that represent scripts currently open in the Studio [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]]. It also enables plugins to register custom callbacks for autocomplete and script analysis, and fires events when script documents are opened, closed, or changed.

This service is only available in Studio plugins and the command bar (Plugin security level).

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#DeregisterAutocompleteCallback\|DeregisterAutocompleteCallback()]] | () | Removes a previously registered callback with the name `name`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#DeregisterScriptAnalysisCallback\|DeregisterScriptAnalysisCallback()]] | () | Removes a previously registered callback with the name `name`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#FindScriptDocument\|FindScriptDocument()]] | [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] | Returns the open [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] corresponding to the given [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]], or `nil` if the given script is not open. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#GetEditorSource\|GetEditorSource()]] | string | Returns the edit-time source for the given script. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#GetScriptDocuments\|GetScriptDocuments()]] | List<[[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]]> | Returns an array of the currently open script documents, including the command bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#OpenScriptDocumentAsync\|OpenScriptDocumentAsync()]] | Tuple | Requests that a Script Editor open the specified script. Returns (true, nil) if the request succeeds. Returns (false, string) if the request fails, with a string that describes the problem. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterAutocompleteCallback\|RegisterAutocompleteCallback()]] | () | Registers an autocomplete callback `callbackFunction` named `name` with priority `priority`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterScriptAnalysisCallback\|RegisterScriptAnalysisCallback()]] | () | Registers a Script Analysis callback `callbackFunction` named `name` with `priority`. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#UpdateSourceAsync\|UpdateSourceAsync()]] | () | Generates new content from the old script and updates the script editor if it's open, or the [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] instance if the script editor is closed. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#TextDocumentDidChange\|TextDocumentDidChange]] | `document`, `changesArray` | Fires just after a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] changes. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#TextDocumentDidClose\|TextDocumentDidClose]] | `oldDocument` | Fires just before a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] object is destroyed, which happens right after the script editor closes. |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#TextDocumentDidOpen\|TextDocumentDidOpen]] | `newDocument` | Fires just after a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] object is created and parented to the service, which happens right after the script editor opens. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### DeregisterAutocompleteCallback

```lua
ScriptEditorService:DeregisterAutocompleteCallback(name: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Removes a previously registered autocomplete callback with the name `name`. The callback must have been registered with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterAutocompleteCallback|ScriptEditorService:RegisterAutocompleteCallback()]]. Throws an error if no callback with the given name is currently registered.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The identifier that was used when registering the callback with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterAutocompleteCallback\|ScriptEditorService:RegisterAutocompleteCallback()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptEditorService-DeregisterAutocompleteCallback`) are published on the source page; their code is not part of the open-source repo.*

### DeregisterScriptAnalysisCallback

```lua
ScriptEditorService:DeregisterScriptAnalysisCallback(name: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Removes a previously registered Script Analysis callback with the name `name`. The callback must have been registered with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterScriptAnalysisCallback|ScriptEditorService:RegisterScriptAnalysisCallback()]]. Throws an error if no callback with the given name is currently registered.

After the callback is removed, Script Analysis automatically reruns on all open scripts to update diagnostics.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The identifier that was used when registering the callback with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterScriptAnalysisCallback\|ScriptEditorService:RegisterScriptAnalysisCallback()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptEditorService-DeregisterScriptAnalysisCallback`) are published on the source page; their code is not part of the open-source repo.*

### FindScriptDocument

```lua
ScriptEditorService:FindScriptDocument(script: LuaSourceContainer): ScriptDocument
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the open [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] corresponding to the given [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]], or `nil` if the given script is not open.

A [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] only exists while the script has an open tab in the Script Editor. If the script's editor tab is closed, this method returns `nil` even if the script instance still exists in the DataModel.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] (such as a [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]], [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]], or [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]]) to find the open document for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] | The open [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] corresponding to the given script, or nil if the script is not currently open in the Script Editor. |

*Code samples for this member (`ScriptDocument-CloseAsync`, `ScriptDocument-ViewportChanged`) are published on the source page; their code is not part of the open-source repo.*

### GetEditorSource

```lua
ScriptEditorService:GetEditorSource(script: LuaSourceContainer): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the edit-time source for the given script.

If the script is open in the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]], this method returns the text currently being displayed in the editor. If the script is not open in the editor, the method returns the text that the editor would display if it's opened. The edit-time source is not always be consistent with the [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]] property.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] to retrieve the edit-time source text for. |

**Returns**

| Type | Description |
| --- | --- |
| string | The edit-time source text of the script as a string. |

### GetScriptDocuments

```lua
ScriptEditorService:GetScriptDocuments(): List<ScriptDocument>
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns an array of the currently open script documents, including the command bar. Each entry is a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] representing one open editor tab. The command bar's document can be identified with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#IsCommandBar|ScriptDocument:IsCommandBar()]] if you need to exclude it.

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] objects representing all currently open editor tabs, including the command bar. |

*Code samples for this member (`ScriptEditorService-GetScriptDocuments`) are published on the source page; their code is not part of the open-source repo.*

### OpenScriptDocumentAsync

```lua
ScriptEditorService:OpenScriptDocumentAsync(script: LuaSourceContainer, options: Dictionary = nil): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Requests that a Script Editor open the specified script. Returns (true, nil) if the request succeeds. Returns (false, string) if the request fails, with a string that describes the problem.

If the script is already open, this function succeeds and switches tabs to the associated editor.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | The [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] to open in the Script Editor. |
| `options` | Dictionary | `nil` | A dictionary that supports the following options:<br><br>- `Temporary` — Boolean. Whether to open the script in a preview tab. Default is false. - `HighlightRange` — A nested dictionary containing a line and character range to highlight in the editor. Example: `HighlightRange = { Start = { Line = 10, Character = 1 }, End = { Line = 15, Character = 20 }}`. - `InitialReadOnlyReasons` — An array of strings. Reasons to add with [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument#AddReadOnlyReasonsAsync\|ScriptDocument:AddReadOnlyReasonsAsync()]] once the editor opens, so the script is read-only as soon as the call returns. Example: `InitialReadOnlyReasons = { "MyPluginTemplateScript" }`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple where the first value is a boolean indicating success and the second is nil on success or a string describing the problem on failure. |

*Code samples for this member (`ScriptEditorService-OpenScriptDocumentAsync`, `ScriptEditorService-OpenScriptDocumentAsync-InitialReadOnlyReasons`) are published on the source page; their code is not part of the open-source repo.*

### RegisterAutocompleteCallback

```lua
ScriptEditorService:RegisterAutocompleteCallback(name: string, priority: int, callbackFunction: Function): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Registers an autocomplete callback `callbackFunction` named `name` with priority `priority`.

When the Script Editor invokes autocomplete, all registered autocomplete callbacks call in order of ascending priority with the autocomplete request and response. Multiple callbacks may share a priority, but then their calling order is unpredictable. Each callback is intended to return a response table with the same format as the response input table. Callbacks shouldn't yield. The first callback invoked receives the internal autocomplete's response as its response table, and subsequent callbacks receive the previous callback's output as their response table. Callbacks may either modify the passed table or return a new table of the same format.

The `callbackFunction` must have the following type: `(Request: table, Response: table) -> table`

The Request table has the following format:

```lua
type Request = {
  position: {
    line: number,
    character: number
  },
  textDocument: {
    document: ScriptDocument?,
    script: LuaSourceContainer?
  }
}
```

- `position` is the one-indexed cursor position where you are autocompleting.
- `textDocument.document` is the open [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] you are completing in, if it exists.
- `textDocument.script` is the [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] you are completing in, if it exists.

If both `textDocument.document` and `textDocument.script` are present, then they correspond to each other: `req.textDocument.document:GetScript() == req.textDocument.script`

The Response table has the following format:

```
type Response = {
  items: {
    {
      label: string, -- The label
      kind: Enum.CompletionItemKind?,
      tags: {Enum.CompletionItemTag}?,
      detail: string?,
      documentation: {
        value: string,
      }?,
      overloads: number?,
      learnMoreLink: string?,
      codeSample: string?,
      preselect: boolean?,
      textEdit: {
        newText: string,
        insert: { start: { line: number, character: number }, ["end"]: { line: number, character: number } },
        replace: { start: { line: number, character: number }, ["end"]: { line: number, character: number } },
      }?
    }
  }
}
```

- `Response.items` is an array of the completion items. The order of this array is insignificant, and it resorts in the editor as the user types.
- `Response.items[n].label` is the label of the item which display in the autocomplete menu.
- `Response.items[n].kind` specifies what type of autocomplete item this is. Primarily this controls the icon given to the item in the editor. Not all kinds have a unique icon. If not specified, the editor uses the "Text" icon. Unsupported kinds default to displaying the "Property" icon.
- `Response.items[n].tags` specifies an array of tags describing this completion item. See the [[30 Official Roblox Docs/API Reference/Enums/CompletionItemTag|Enum.CompletionItemTag]] for details on their function.
- `Response.items[n].details` specifies a string describing details about the completion item. For default items, this is a string representation of their type. Note that, in order for the documentation widget to display, `documentation` must be present, but `documentation.value` may be empty.
- `Response.items[n].documentation` specifies the main body of the documentation in its `value` field. `documentation` is present, even if value is empty, so the documentation window displays if either details or overloads are specified.
- `Response.items[n].overloads` specifies the number of overloads of a function autocompletion.
- `Response.items[n].learnMoreLink` links to a relevant page on the creator docs. This URL must be a `https` request to create.roblox.com; no other URLs display in the editor.
- `Response.items[n].codeSample` specifies a sample use of the completion item. `documentation` must be non-empty to display this field.
- `Response.items[n].preselect` If true, the editor sorts this completion item ahead of all others and selects it for the user by default. No effect if false or missing.
- `Response.items[n].textEdit` If present, accepting the completion applies this text edit - inserting or replacing the span between the positions start and end with newText.

If a callback returns a malformed result or encounters an error, the editor discards the modified Response table and uses the built-in autocomplete result list.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | A unique identifier for this callback, used to deregister it later with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#DeregisterAutocompleteCallback\|ScriptEditorService:DeregisterAutocompleteCallback()]]. |
| `priority` | int |  | The invocation order among registered callbacks; lower values run first. |
| `callbackFunction` | Function |  | The function invoked during autocomplete with the signature `(Request: table, Response: table) -> table`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptEditorService-RegisterAutocompleteCallback`) are published on the source page; their code is not part of the open-source repo.*

### RegisterScriptAnalysisCallback

```lua
ScriptEditorService:RegisterScriptAnalysisCallback(name: string, priority: int, callbackFunction: Function): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Registers a Script Analysis callback `callbackFunction` named `name` with `priority`. When Script Analysis in Studio runs, all registered callbacks call in order of ascending priority. Each callback is intended to return a response table matching the format specified below. Callbacks should not yield.

The request table has the following format, where `script` is the `LuaSourceContainer` that is going to be analyzed.

```
type Request = {
  script: LuaSourceContainer?
}
```

The response table has the following format, where `diagnostics` is an array of diagnostic tables. Each diagnostic table has the entries listed below.

```
type Response = {
  diagnostics: {
    {
      range: {
        start: {
          line: number,
          character: number,
        },
        ["end"]: {
          line: number,
          character: number,
        }
      },
      code: string?,
      message: string,
      severity: Enum.Severity?,
      codeDescription: { href: string }?
    }
  }
}
```

- `range` represents a text range that should be highlighted by the linter, providing what line/character to start highlighting and what line/character to stop highlighting.
- `code` is a label for the message.
- `message` is a warning message to be displayed for the line. This will also appear on a tooltip when the user hovers their cursor over the line in the Script Editor.
- `severity` is a [[30 Official Roblox Docs/API Reference/Enums/Severity|Enum.Severity]] value for the diagnostics. This determines how the diagnostic is categorized in the Script Analysis tool in Studio, as well as how text is highlighted in the Script Editor.
- `codeDescription` links to a relevant page on the creator docs. This URL must be an `https` request to `create.roblox.com`; no other URLs display in the editor.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | A unique identifier for this callback, used to deregister it later with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#DeregisterScriptAnalysisCallback\|ScriptEditorService:DeregisterScriptAnalysisCallback()]]. |
| `priority` | int |  | The invocation order among registered callbacks; lower values run first. |
| `callbackFunction` | Function |  | The function invoked during Script Analysis with the signature `(Request: table) -> table`, returning a response containing diagnostics. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptEditorService-RegisterScriptAnalysisCallback`) are published on the source page; their code is not part of the open-source repo.*

### UpdateSourceAsync

```lua
ScriptEditorService:UpdateSourceAsync(script: LuaSourceContainer, callback: Function): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Returns the edit-time [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]] for the given script.

This function calls the passed callback using the old contents of the script to calculate the new contents of the script.

If the script is open in the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]], then it issues a request to the editor to update its source. The editor may reject this update if the [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]] property was out of date with the user's version of the script when this function was called, in which case the callback will be re-invoked and the attempt will be repeated.

The callback may not yield. If the callback returns `nil`, the operation is cancelled. This function yields until the operation is cancelled or succeeds.

If the script is not open in the editor, the new content updates to the script source, which is the text the editor would display if it is opened.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] |  | Script instance to be updated. |
| `callback` | Function |  | The function to return new script content. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ScriptEditorService-UpdateSourceAsync`) are published on the source page; their code is not part of the open-source repo.*

## Events

### TextDocumentDidChange

```lua
ScriptEditorService.TextDocumentDidChange(document: ScriptDocument, changesArray: Variant)
```

**Security:** PluginSecurity

Fires just after a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] changes. The `textChanged` is an array of change structures of the format:

`{ range : { start : { line : number, character : number }, end : { line : number, character : number } }, text: string }`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `document` | [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] |  | The [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] that changed. |
| `changesArray` | Variant |  | An array of change structures, each describing a range that was replaced and the new text. |

*Code samples for this member (`ScriptEditorService-TextDocumentDidChange`) are published on the source page; their code is not part of the open-source repo.*

### TextDocumentDidClose

```lua
ScriptEditorService.TextDocumentDidClose(oldDocument: ScriptDocument)
```

**Security:** PluginSecurity

Fires just before a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] object is destroyed, which happens right after the script editor closes. After this event fires, the [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] enters a "Closed" state, and trying to call its methods throws an error. [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] objects aren't reusable, even if the script editor reopens the same script.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `oldDocument` | [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] |  | The [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] that is about to be destroyed. |

*Code samples for this member (`ScriptEditorService-TextDocumentDidClose`) are published on the source page; their code is not part of the open-source repo.*

### TextDocumentDidOpen

```lua
ScriptEditorService.TextDocumentDidOpen(newDocument: ScriptDocument)
```

**Security:** PluginSecurity

Fires just after a [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] object is created and parented to the service, which happens right after the script editor opens. The [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument|ScriptDocument]] passed to the handler is fully initialized and ready to read or modify. This event also fires for the command bar document.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `newDocument` | [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] |  | The newly created [[30 Official Roblox Docs/API Reference/Classes/ScriptDocument\|ScriptDocument]] representing the opened editor tab. |

*Code samples for this member (`ScriptEditorService-TextDocumentDidOpen`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ScriptEditorService](https://create.roblox.com/docs/reference/engine/classes/ScriptEditorService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
