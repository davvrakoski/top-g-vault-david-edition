---
title: "StudioTestService"
description: "Service allowing plugins to automate and customize Test and Run mode testing."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioTestService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service allowing plugins to automate and customize Test and Run mode testing.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`StudioTestService` allows plugins to automate and customize Test and Run mode testing. With `StudioTestService`, your plugins can launch tests that jump straight to a specific part of your game, or run complex code tests automatically.

You can use `StudioTestService` to start a server with multiple simulated clients, add players mid-session, pass arguments into running tests, end tests from the server, and trigger client disconnections, all without manually clicking through the Test tab in Studio.

These methods complement the existing playtest automation available through Studio's built-in MCP server. Where the MCP server's `start_stop_play` tool starts a single Play Client session, the `StudioTestService` methods are designed for scripted multi-client scenarios such as lobby, matchmaking, and join/leave flow testing.

A typical multiplayer test splits across three script contexts: the plugin that launches it, the server that drives it, and the clients that participate:

Plugin script:

```lua
local StudioTestService = game:GetService("StudioTestService")

local toolbar = plugin:CreateToolbar("STS Tests")
local button = toolbar:CreateButton("MyTest", "", "")

button.Click:Connect(function()
    button.Enabled = false
    local result = StudioTestService:ExecuteMultiplayerTestAsync(1, "MyArguments")
    assert(result == "Success!")
    print("Test finished successfully!")
    button.Enabled = true
end)
```

Server script:

```lua
local Players = game:GetService("Players")
local StudioTestService = game:GetService("StudioTestService")

assert(StudioTestService:GetTestArgs() == "MyArguments")

Players.PlayerRemoving:Connect(function(player)
    print(player.Name .. " left the experience")
    task.wait(3)
    StudioTestService:EndTest("Success!")
end)
```

Client script:

```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local StudioTestService = game:GetService("StudioTestService")
task.wait(3)
StudioTestService:LeaveTest()
```

##### Limitations

- `ExecuteMultiplayerTestAsync` can only be called from plugin scripts. It yields until the test ends, so wrap it in a coroutine if the calling plugin needs to remain responsive.
- `ExecuteMultiplayerTestAsync` cannot be called from inside a running test.
- `ExecuteMultiplayerTestAsync` supports up to 8 simulated clients per test session.
- Only one multiplayer test session can run at a time per Studio instance.
- `AddPlayers` and `EndTest` must be called from the server DataModel of a running test.
- `CanLeaveTest` and `LeaveTest` must be called from a client DataModel.
- `GetTestArgs` currently has a known issue when called from a client LocalScript.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EditModeActive\|EditModeActive]] | boolean | Plugin-facing. Indicates whether the session is the idle edit [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] with no Studio test session running. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#AddPlayers\|AddPlayers()]] | () | Adds additional simulated clients to the running multiplayer test session. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#CanLeaveTest\|CanLeaveTest()]] | boolean | Returns whether the calling client DataModel can disconnect from the test. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest\|EndTest()]] | () | Ends the current Studio test session from the server DataModel. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecuteMultiplayerTestAsync\|ExecuteMultiplayerTestAsync()]] | Variant | Launches a multiplayer test session and yields until it completes. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecutePlayModeAsync\|ExecutePlayModeAsync()]] | Variant | Starts a solo Test session and yields until it ends. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecuteRunModeAsync\|ExecuteRunModeAsync()]] | Variant | Starts a Run test session and yields until it ends. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#GetTestArgs\|GetTestArgs()]] | Variant | Returns the argument passed to the method that started the current test session. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#LeaveTest\|LeaveTest()]] | () | Disconnects the calling client from the active multiplayer test. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### EditModeActive

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Plugin-facing; requires plugin security and is readable only from plugins and the command bar. Indicates whether the session is the edit [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] with no Studio test session currently running. Defaults to `true`.

In the edit [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], this is `true` while Studio is idle and becomes `false` during an in-Studio play or Team Test session, returning to `true` when that session stops. In the server and client [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] of a running Test or Run session, it is `false`.

## Methods

### AddPlayers

```lua
StudioTestService:AddPlayers(numPlayers: int): ()
```

**Thread safety:** Unsafe

Adds `numPlayers` additional client DataModels to the running test session. Useful for simulating staggered joins, testing lobby-to-game transitions under load, or reproducing race conditions that only appear when clients connect at different times.

Must be called from the server DataModel of an active multiplayer test.

Errors if called outside of an active test, or if called from a client DataModel.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `numPlayers` | int |  | The number of additional client DataModels to add. Must be between 1 and 8. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StudioTestService-AddPlayers`) are published on the source page; their code is not part of the open-source repo.*

### CanLeaveTest

```lua
StudioTestService:CanLeaveTest(): boolean
```

**Thread safety:** Unsafe

Returns `true` if the calling client DataModel is allowed to disconnect from the test, and `false` otherwise. Check this before calling `LeaveTest` to avoid errors during session teardown or during states where disconnection is blocked.

Call from a client DataModel.

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the client can leave, `false` otherwise. |

*Code samples for this member (`StudioTestService-CanLeaveTest`) are published on the source page; their code is not part of the open-source repo.*

### EndTest

```lua
StudioTestService:EndTest(value: Variant): ()
```

**Thread safety:** Unsafe

Ends the current Studio test session if called from the server [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], even if the test was not started by this service.

If the test was started by [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecutePlayModeAsync|StudioTestService:ExecutePlayModeAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecuteRunModeAsync|StudioTestService:ExecuteRunModeAsync()]], the value passed here is returned by that method.

This method returns immediately and ends the test session asynchronously. It errors if called from any [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] other than that of the server during a running Studio test session.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | Variant |  | Value returned to the calling [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecutePlayModeAsync\|StudioTestService:ExecutePlayModeAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecuteRunModeAsync\|StudioTestService:ExecuteRunModeAsync()]] method. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StudioTestService-EndTest`) are published on the source page; their code is not part of the open-source repo.*

### ExecuteMultiplayerTestAsync

```lua
StudioTestService:ExecuteMultiplayerTestAsync(numPlayers: int, args: Variant): Variant
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Launches a multiplayer test session with one server and `numPlayers` client DataModels. Yields until the test completes and returns the value passed to `EndTest` on the server.

Supports up to 8 simulated clients per test session.

The optional `args` value is forwarded to scripts running inside the test session and can be read via `GetTestArgs`. It can be any Roblox-serializable value, for example a string, a Color3, or a table. Common uses include passing a test name, a timeout, or configuration flags.

Errors if a test is already running. Errors if `numPlayers` is less than 1 or exceeds 8.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `numPlayers` | int |  | The number of client DataModels to create. Must be between 1 and 8. |
| `args` | Variant |  | An optional Roblox-serializable value forwarded to scripts inside the test session. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value passed to [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest\|StudioTestService:EndTest()]]. |

*Code samples for this member (`StudioTestService-ExecuteMultiplayerTestAsync`) are published on the source page; their code is not part of the open-source repo.*

### ExecutePlayModeAsync

```lua
StudioTestService:ExecutePlayModeAsync(args: Variant): Variant
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Starts a solo **Test** session and yields until that session ends.

The `args` parameter can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#GetTestArgs|StudioTestService:GetTestArgs()]]. Returns the value passed to [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest|StudioTestService:EndTest()]], or `nil` if the test ended by other means.

This method errors if a test session is already running.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | Variant |  | Argument passed to the test session, or `nil`. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | Value passed from [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest\|StudioTestService:EndTest()]], or `nil`. |

### ExecuteRunModeAsync

```lua
StudioTestService:ExecuteRunModeAsync(args: Variant): Variant
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Starts a **Run** test session and yields until that session ends.

The `args` parameter can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#GetTestArgs|StudioTestService:GetTestArgs()]]. Returns the value passed to [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest|StudioTestService:EndTest()]], or `nil` if the test ended by other means.

This method errors if a test session is already running.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | Variant |  | Argument passed to the test session, or `nil`. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | Value passed from [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#EndTest\|StudioTestService:EndTest()]], or `nil`. |

### GetTestArgs

```lua
StudioTestService:GetTestArgs(): Variant
```

**Thread safety:** Unsafe

Returns the argument passed to [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecutePlayModeAsync|StudioTestService:ExecutePlayModeAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/StudioTestService#ExecuteRunModeAsync|StudioTestService:ExecuteRunModeAsync()]] for the current test session, or `nil` if the session was not started by those methods.

`GetTestArgs` returns the value as-is, preserving its type. For example, if the plugin passed a Color3, `GetTestArgs` returns a Color3.

Note that if you call `GetTestArgs` a client `LocalScript`, it may fail. Server-side calls work as expected.

**Returns**

| Type | Description |
| --- | --- |
| Variant | Arguments passed to the test, or `nil`. |

*Code samples for this member (`StudioTestService-GetTestArgs`) are published on the source page; their code is not part of the open-source repo.*

### LeaveTest

```lua
StudioTestService:LeaveTest(): ()
```

**Thread safety:** Unsafe

Disconnects the calling client from the active multiplayer test. Useful for testing player leave and reconnection logic, cleanup-on-disconnect behavior, and leader reassignment in lobby systems.

Call from a client DataModel. Make sure to check `CanLeaveTest()` first.

Errors if the client cannot currently leave or if called from a server DataModel.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [StudioTestService](https://create.roblox.com/docs/reference/engine/classes/StudioTestService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
