---
title: "ChangeHistoryService"
description: "**Must** be used by plugins to communicate to Studio how to undo and redo the changes which they make to the experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

***Must** be used by plugins to communicate to Studio how to undo and redo the changes which they make to the experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Plugin developers **must** use [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] to tell Studio how to undo and redo changes that their plugins make to experiences by recording. Before making changes, a plugin calls [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|ChangeHistoryService:TryBeginRecording()]], remembering the identifier it assigns, then after making changes, the Plugin calls [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|ChangeHistoryService:FinishRecording()]] to complete the recording.

Plugins may also programmatically invoke an undo or redo through [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo|ChangeHistoryService:Undo()]] or [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Redo|ChangeHistoryService:Redo()]].

[[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] is not enabled at runtime, so calling its methods in a running experience has no effect.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording\|FinishRecording()]] | () | Communicates to Studio that the identified recording is finished and to take the final operation to complete the recording. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#GetCanRedo\|GetCanRedo()]] | Tuple | Returns whether there is an action available to redo and, if so, the name of that action. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#GetCanUndo\|GetCanUndo()]] | Tuple | Returns whether there is an action available to undo and, if so, the name of that action. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#IsRecordingInProgress\|IsRecordingInProgress()]] | boolean | Returns whether the plugin currently has a recording in progress, optionally checking for a specific recording identifier. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Redo\|Redo()]] | () | Re-executes the most recently undone action, advancing forward through the undo/redo history. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#ResetWaypoints\|ResetWaypoints()]] | () | Clears the undo/redo history by collapsing it into a single base waypoint. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#SetEnabled\|SetEnabled()]] | () | Sets whether or not the ChangeHistoryService is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#SetWaypoint\|SetWaypoint()]] | () | Sets a new waypoint which can be used as an undo or redo point. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording\|TryBeginRecording()]] | string? | Begins tracking changes made to the data model into a recording. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo\|Undo()]] | () | Reverts the most recent action, stepping backward through the undo/redo history. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRecordingFinished\|OnRecordingFinished]] | `name`, `displayName`, `identifier`, `operation`, `finalOptions` | Fired when the user completes an action. Parameters come from [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording\|TryBeginRecording()]] and [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording\|FinishRecording()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRecordingStarted\|OnRecordingStarted]] | `name`, `displayName` | Fired when the user begins an action. Parameters come from [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording\|TryBeginRecording()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRedo\|OnRedo]] | `waypoint` | Fires after an action is redone, reporting the name of the action that was replayed. |
| [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnUndo\|OnUndo]] | `waypoint` | Fires after an action is undone, reporting the name of the action that was reverted. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### FinishRecording

```lua
ChangeHistoryService:FinishRecording(identifier: string, operation: FinishRecordingOperation, finalOptions: Dictionary?): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Completes a recording that was started with [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]]. Pass the `identifier` returned by that call along with an [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation]] describing what to do with the recorded changes:

- [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Commit]] adds the changes to the undo/redo history as a new waypoint.
- [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Cancel]] discards the recording and reverts the changes it captured. The `identifier` is ignored for this operation, so a plugin can cancel its own in-progress recording without knowing the identifier.
- [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Append]] merges the recording into the waypoint that immediately precedes it rather than creating a new one.

When the recording finishes, this method fires [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRecordingFinished|OnRecordingFinished]], forwarding the `finalOptions` table. It raises an error if the calling plugin has no recording in progress, or if `operation` is not [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation|Enum.FinishRecordingOperation.Cancel]] and `identifier` does not match the active recording. It has no effect when the service is disabled or while an undo or redo is in progress.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `identifier` | string |  | Identifies the recording from the previous call to [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording\|TryBeginRecording()]]. If the operation is [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation\|Enum.FinishRecordingOperation.Cancel]], this value is ignored, and the recording is determined by context. |
| `operation` | [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation\|FinishRecordingOperation]] |  | Specifies the operation to take. |
| `finalOptions` | Dictionary? |  | Optional table of values to pass to [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRecordingFinished\|OnRecordingFinished]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ChangeHistoryService-TryBeginRecording1`) are published on the source page; their code is not part of the open-source repo.*

### GetCanRedo

```lua
ChangeHistoryService:GetCanRedo(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Reports whether [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Redo|Redo()]] currently has an action available to replay. It returns a boolean that is `true` when a redoable waypoint exists ahead of the current position in the undo/redo history; when that boolean is `true`, it also returns the name of the waypoint that the next redo would replay.

The boolean is `false`, with no name returned, when the redo stack is empty because the newest waypoint is already the current one, or when the service is disabled (which is always the case at runtime).

**Returns**

| Type | Description |
| --- | --- |
| Tuple | `true` followed by the name of the action that would be redone when a redo is available; otherwise `false`. |

### GetCanUndo

```lua
ChangeHistoryService:GetCanUndo(): Tuple
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Reports whether [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo|Undo()]] currently has an action available to revert. It returns a boolean that is `true` when an undoable waypoint exists at the current position in the undo/redo history; when that boolean is `true`, it also returns the name of the waypoint that the next undo would revert.

The boolean is `false`, with no name returned, when the undo stack is empty because the position is already at the base waypoint, or when the service is disabled (which is always the case at runtime).

**Returns**

| Type | Description |
| --- | --- |
| Tuple | `true` followed by the name of the action that would be undone when an undo is available; otherwise `false`. |

### IsRecordingInProgress

```lua
ChangeHistoryService:IsRecordingInProgress(identifier: string?): boolean
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Reports whether the calling plugin has a recording in progress that was started with [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]].

When called without an `identifier`, it returns `true` if any recording is active for the plugin. When an `identifier` is supplied, it returns `true` only if the active recording's identifier matches that value. It returns `false` when the service is disabled or when the plugin has no active recording.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `identifier` | string? |  | Optional identifier of a specific recording to check for. When omitted, the method reports whether _any_ recording is in progress for the plugin. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if a matching recording is in progress; otherwise `false`. |

### Redo

```lua
ChangeHistoryService:Redo(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Replays the waypoint immediately ahead of the current position in the undo/redo history, redoing the action that a matching [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo|Undo()]] had reverted, and advances the redo pointer forward by one waypoint. After the waypoint is replayed, it fires [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnRedo|OnRedo]] with the name of the redone waypoint.

This method raises an error if a play is already in progress, if the service is disabled (which is always the case at runtime), or if there is nothing left to redo. Call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#GetCanRedo|GetCanRedo()]] first to confirm a redo is available.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ResetWaypoints

```lua
ChangeHistoryService:ResetWaypoints(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Records the current state as a waypoint named `base` and then merges every existing waypoint into that single waypoint, leaving no actions to undo or redo. Use this to establish a clean starting point so that later [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo|Undo()]] calls cannot revert past the current state.

This method has no effect when the service is disabled (which is always the case at runtime).

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEnabled

```lua
ChangeHistoryService:SetEnabled(state: boolean): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Sets whether or not the ChangeHistoryService is enabled. When set to false, the undo/redo list is cleared, and does not repopulate. When set to true again, the original list is not restored, but further operations append to the list once more

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | boolean |  | Whether to enable (`true`) or disable (`false`) the service. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetWaypoint

```lua
ChangeHistoryService:SetWaypoint(name: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method will be **deprecated soon** in favor of [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]].

[[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] tracks plugin history as a stream of property changes. [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#SetWaypoint|SetWaypoint()]] creates a cut in that stream of property changes so that the undo and redo actions know where to stop.

By convention, user-invoked actions in Studio **must** call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#SetWaypoint|SetWaypoint()]] _after_ completing their set of changes to the experience. Calling it **before** a set of changes may clean up another misbehaving plugin which failed to set a waypoint, but it's a poor reason to justify such usage in your own plugin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name to assign to the new waypoint, which appears in the undo/redo history. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ChangeHistoryService-SetWaypoint1`) are published on the source page; their code is not part of the open-source repo.*

### TryBeginRecording

```lua
ChangeHistoryService:TryBeginRecording(name: string, displayName: string?): string?
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method begins a recording to track changes to the data model. You **must** call it prior to making changes to avoid future warnings or errors.

When the recording is completed, you call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|FinishRecording()]] with the returned recording identifier to complete the recording and update the undo/redo stack.

This method will return `nil` if it fails to begin a recording. Recordings fail if the plugin already has a recording in progress, or if the user is in a solo playtest.

You may use [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#IsRecordingInProgress|IsRecordingInProgress()]] to check the recording status of the plugin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the action being performed suitable for logging and coding purposes. |
| `displayName` | string? |  | Name of the action being performed to display to the user. |

**Returns**

| Type | Description |
| --- | --- |
| string? | A unique string identifier for the recording on success, or `nil` if the recording could not be started. |

*Code samples for this member (`ChangeHistoryService-TryBeginRecording1`) are published on the source page; their code is not part of the open-source repo.*

### Undo

```lua
ChangeHistoryService:Undo(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Unplays the waypoint at the current position in the undo/redo history, reverting the most recent recorded action, and steps the undo pointer back by one waypoint. After the waypoint is reverted, it fires [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#OnUndo|OnUndo]] with the name of the undone waypoint.

This method raises an error if a play is already in progress, if the service is disabled (which is always the case at runtime), or if there is nothing left to undo. Call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#GetCanUndo|GetCanUndo()]] first to confirm an undo is available.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### OnRecordingFinished

```lua
ChangeHistoryService.OnRecordingFinished(name: string, displayName: string?, identifier: string?, operation: FinishRecordingOperation, finalOptions: Dictionary?)
```

**Security:** PluginSecurity

Fires when a recording started with [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]] is completed through [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|FinishRecording()]]. The `operation` argument reports how the recording was finished (`Commit`, `Cancel`, or `Append`), and `finalOptions` is the optional table that was passed to `FinishRecording()`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the action being performed suitable for logging and coding purposes. |
| `displayName` | string? |  | Name of the action being performed to display to the user. |
| `identifier` | string? |  | The identifier for the recording. |
| `operation` | [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation\|FinishRecordingOperation]] |  | The [[30 Official Roblox Docs/API Reference/Enums/FinishRecordingOperation\|Enum.FinishRecordingOperation]] that completed the recording, either `Commit`, `Cancel`, or `Append`. |
| `finalOptions` | Dictionary? |  | Optional table from [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording\|FinishRecording()]]. |

### OnRecordingStarted

```lua
ChangeHistoryService.OnRecordingStarted(name: string, displayName: string?)
```

**Security:** PluginSecurity

Fires when a plugin begins a recording with [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]], carrying the same `name` and `displayName` values that were passed to that call.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the action being performed suitable for logging and coding purposes. |
| `displayName` | string? |  | Name of the action being performed to display to the user. |

### OnRedo

```lua
ChangeHistoryService.OnRedo(waypoint: string)
```

**Security:** PluginSecurity

Fires immediately after [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Redo|Redo()]] replays a waypoint, whether the redo was triggered by the user through Studio or invoked programmatically. The `waypoint` argument is the name of the action that was redone, matching the name that was recorded for that waypoint.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `waypoint` | string |  | The name of the waypoint (action) that was redone. |

### OnUndo

```lua
ChangeHistoryService.OnUndo(waypoint: string)
```

**Security:** PluginSecurity

Fires immediately after [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#Undo|Undo()]] reverts a waypoint, whether the undo was triggered by the user through Studio or invoked programmatically. The `waypoint` argument is the name of the action that was undone, matching the name that was recorded for that waypoint.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `waypoint` | string |  | The name of the waypoint (action) that was undone. |

---
*Source: [ChangeHistoryService](https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
