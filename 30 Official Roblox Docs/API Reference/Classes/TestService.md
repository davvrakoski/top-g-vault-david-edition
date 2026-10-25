---
title: "TestService"
description: "A service used by Roblox to run controlled tests of the engine. It is available for developers to use, to a limited degree."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TestService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service used by Roblox to run controlled tests of the engine. It is available for developers to use, to a limited degree.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Service`

## Description

`TestService` is a service used by Roblox internally to run analytical tests on the engine.

Scripts that are executed inside of `TestService` (via [[30 Official Roblox Docs/API Reference/Classes/TestService#RunAsync|TestService:RunAsync()]]) have access to special macros that directly invoke functions under the service. Macros are essentially substitutions for large blocks of code that shouldn't need to be rewritten each time you want to call them.

#### RBX_CHECK

This macro does tests with calls to the [[30 Official Roblox Docs/API Reference/Classes/TestService#Check|TestService:Check()]] function.

| Macro | Test Condition |
| --- | --- |
| `RBX_CHECK(cond)` | `cond == true` |
| `RBX_CHECK_MESSAGE(cond, failMsg)` | `cond == true` |
| `RBX_CHECK_THROW(CODE)` | `pcall(function() CODE end) == false` |
| `RBX_CHECK_NO_THROW(CODE)` | `pcall(function() CODE end) == true` |
| `RBX_CHECK_EQUAL(a, b)` | `a == b` |
| `RBX_CHECK_NE(a, b)` | `a ~= b` |
| `RBX_CHECK_GE(a, b)` | `a >= b` |
| `RBX_CHECK_LE(a, b)` | `a <= b` |
| `RBX_CHECK_GT(a, b)` | `a > b` |
| `RBX_CHECK_LT(a, b)` | `a < b` |

#### RBX_REQUIRE

This macro does tests with calls to the [[30 Official Roblox Docs/API Reference/Classes/TestService#Require|TestService:Require()]] function.

| Macro | Test Condition |
| --- | --- |
| `RBX_REQUIRE(cond)` | `cond == true` |
| `RBX_REQUIRE_MESSAGE(cond, failMsg)` | `cond == true` |
| `RBX_REQUIRE_THROW(CODE)` | `pcall(function() CODE end) == false` |
| `RBX_REQUIRE_NO_THROW(CODE)` | `pcall(function() CODE end) == true` |
| `RBX_REQUIRE_EQUAL(a, b)` | `a == b` |
| `RBX_REQUIRE_NE(a, b)` | `a ~= b` |
| `RBX_REQUIRE_GE(a, b)` | `a >= b` |
| `RBX_REQUIRE_LE(a, b)` | `a <= b` |
| `RBX_REQUIRE_GT(a, b)` | `a > b` |
| `RBX_REQUIRE_LT(a, b)` | `a < b` |

#### RBX_WARN

This macro does tests with calls to the [[30 Official Roblox Docs/API Reference/Classes/TestService#Warn|TestService:Warn()]] function.

| Macro | Test Condition |
| --- | --- |
| `RBX_WARN(cond)` | `cond == true` |
| `RBX_WARN_MESSAGE(cond, failMsg)` | `cond == true` |
| `RBX_WARN_THROW(CODE)` | `pcall(function() CODE end) == false` |
| `RBX_WARN_NO_THROW(CODE)` | `pcall(function() CODE end) == true` |
| `RBX_WARN_EQUAL(a, b)` | `a == b` |
| `RBX_WARN_NE(a, b)` | `a ~= b` |
| `RBX_WARN_GE(a, b)` | `a >= b` |
| `RBX_WARN_LE(a, b)` | `a <= b` |
| `RBX_WARN_GT(a, b)` | `a > b` |
| `RBX_WARN_LT(a, b)` | `a < b` |

#### Additional Macros

| Macro | Description |
| --- | --- |
| `RBX_ERROR(msg)` | Directly calls the [[30 Official Roblox Docs/API Reference/Classes/TestService#Error\|TestService:Error()]] function. |
| `RBX_FAIL(msg)` | Directly calls the [[30 Official Roblox Docs/API Reference/Classes/TestService#Fail\|TestService:Fail()]] function. |
| `RBX_MESSAGE(msg)` | Directly calls the [[30 Official Roblox Docs/API Reference/Classes/TestService#Message\|TestService:Message()]] function. |

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#AutoRuns\|AutoRuns]] | boolean | If set to `true`, the game will start running when the service's [[30 Official Roblox Docs/API Reference/Classes/TestService#RunAsync\|TestService:RunAsync()]] method is called. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Description\|Description]] | string | A description of the test being executed. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ErrorCount\|ErrorCount]] | int | Measures how many errors have been recorded in the test session. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ExecuteWithStudioRun\|ExecuteWithStudioRun]] | boolean | When set to `true`, `TestService` will be executed when using the **Run** action in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Is30FpsThrottleEnabled\|Is30FpsThrottleEnabled]] | boolean | **Deprecated.** Sets whether or not the physics engine should be throttled to 30 FPS while the test is being ran. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#IsPhysicsEnvironmentalThrottled\|IsPhysicsEnvironmentalThrottled]] | boolean | Sets whether or not the physics environment should be throttled while running this test. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#IsSleepAllowed\|IsSleepAllowed]] | boolean | Sets whether or not physics objects will be allowed to fall asleep while the test simulation is running. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#NumberOfPlayers\|NumberOfPlayers]] | int | The number of players expected in this test, if any. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#SimulateSecondsLag\|SimulateSecondsLag]] | double | Sets a specific amount of additional latency experienced by players during the test session. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#TestCount\|TestCount]] | int | Measures how many test calls have been recorded in the test session. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ThrottlePhysicsToRealtime\|ThrottlePhysicsToRealtime]] | boolean | Sets whether the test should be throttled to simulate time according to real world time or as fast as possible. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Timeout\|Timeout]] | double | The maximum amount of time that tests are allowed to run for. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#WarnCount\|WarnCount]] | int | Measures how many warning calls have been recorded in the test session. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Check\|Check()]] | () | Prints result of a condition to the output. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Checkpoint\|Checkpoint()]] | () | Prints `Test checkpoint:` followed by a string to the output in blue text. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Done\|Done()]] | () | Prints `Testing Done` to the output in blue text. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Error\|Error()]] | () | Prints a red error message to the output, prefixed by `TestService: `. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Fail\|Fail()]] | () | Indicates a fatal error in a `TestService` run. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#isFeatureEnabled\|isFeatureEnabled()]] | boolean | Returns whether the named feature identified by `name` is currently enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Message\|Message()]] | () | Prints `TestService:` followed by a string to the output in blue text. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Require\|Require()]] | () | Prints whether a condition is true along with a description string. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Run\|Run()]] | () | **Deprecated.** Runs scripts which are parented to `TestService`. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#RunAsync\|RunAsync()]] | () | Runs scripts which are parented to `TestService`. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ScopeTime\|ScopeTime()]] | Dictionary | Returns a dictionary of per-scope physics simulation timings for performance testing. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#Warn\|Warn()]] | () | Prints if a condition is `true`, otherwise prints a warning. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ServerCollectConditionalResult\|ServerCollectConditionalResult]] | `condition`, `text`, `script`, `line` | Fires when the server should collect a conditional test result. |
| [[30 Official Roblox Docs/API Reference/Classes/TestService#ServerCollectResult\|ServerCollectResult]] | `text`, `script`, `line` | Fires when the server should collect a test result. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoRuns

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics · **Loaded/Saved:** true/true

If set to `true`, the game will start running when the service's [[30 Official Roblox Docs/API Reference/Classes/TestService#RunAsync|TestService:RunAsync()]] method is called.

### Description

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A description of the test being executed.

### ErrorCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Results · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Measures how many errors have been recorded in the test session.

### ExecuteWithStudioRun

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Settings · **Loaded/Saved:** true/true

When set to `true`, `TestService` will be executed when using the **Run** action in Roblox Studio.

Note that if the [[30 Official Roblox Docs/API Reference/Classes/TestService#NumberOfPlayers|NumberOfPlayers]] property is set to a value above `0`, running the game will open `NumberOfPlayers + 1` Studio windows where one window is a server and the rest are players connected to that server. Try to keep this value within a rational range (1 to 8 players) or else your computer's CPU will get overloaded.

### Is30FpsThrottleEnabled

> [!warning] Deprecated
> This has been deprecated and directly renamed to
> `Class.TestService.ThrottlePhysicsToRealtime|ThrottlePhysicsToRealtime` to
> better reflect its practical use.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`, `Deprecated`

Sets whether or not the physics engine should be throttled to 30 FPS while the test is being ran.

### IsPhysicsEnvironmentalThrottled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics · **Loaded/Saved:** true/true

Sets whether or not the physics environment should be throttled while running this test.

### IsSleepAllowed

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics · **Loaded/Saved:** true/true

Sets whether or not physics objects will be allowed to fall asleep while the test simulation is running.

### NumberOfPlayers

**Type:** int

**Thread safety:** ReadSafe · **Category:** Settings · **Loaded/Saved:** true/true

The number of players expected in this test, if any.

### SimulateSecondsLag

**Type:** double

**Thread safety:** ReadSafe · **Category:** Settings · **Loaded/Saved:** true/true

Sets a specific amount of additional latency experienced by players during the test session.

### TestCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Results · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Measures how many test calls have been recorded in the test session.

### ThrottlePhysicsToRealtime

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Physics · **Loaded/Saved:** true/true

Sets whether the test should be throttled to simulate time according to real world time or as fast as possible.

### Timeout

**Type:** double

**Thread safety:** ReadSafe · **Category:** Settings · **Loaded/Saved:** true/true

The maximum amount of time that tests are allowed to run for.

### WarnCount

**Type:** int

**Thread safety:** ReadSafe · **Category:** Results · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Measures how many warning calls have been recorded in the test session.

## Methods

### Check

```lua
TestService:Check(condition: boolean, description: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

If `condition` is `true`, prints `Check passed:` followed by `description` to the output in blue text. Otherwise, prints `Check failed:` followed by `description` in red text.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `condition` | boolean |  | The boolean expression to evaluate as the test assertion. |
| `description` | string |  | A label that identifies this check in the test output. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that invoked the check, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the check was called. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Check1`) are published on the source page; their code is not part of the open-source repo.*

### Checkpoint

```lua
TestService:Checkpoint(text: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

Prints `Test checkpoint:` followed by `text` to the output in blue text.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | string |  | The message to print alongside the checkpoint label. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that invoked the checkpoint, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the checkpoint was called. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Checkpoint1`) are published on the source page; their code is not part of the open-source repo.*

### Done

```lua
TestService:Done(): ()
```

**Thread safety:** Unsafe

Prints `Testing Done` to the output in blue text.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Done1`) are published on the source page; their code is not part of the open-source repo.*

### Error

```lua
TestService:Error(description: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

Prints a red error message (`description`) to the output, prefixed by `TestService: `.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `description` | string |  | The error message text to display. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that raised the error, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the error was raised. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Error1`) are published on the source page; their code is not part of the open-source repo.*

### Fail

```lua
TestService:Fail(description: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

Indicates a fatal error in a `TestService` run. If this is called inside of a script running inside the service, it will initiate a breakpoint on the line that invoked the error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `description` | string |  | The failure message text to display. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance where the failure occurred, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the failure was triggered. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### isFeatureEnabled

```lua
TestService:isFeatureEnabled(name: string): boolean
```

**Thread safety:** Unsafe

Returns `true` if the feature identified by `name` is set to `true`, and `false` if it is set to any other value. Raises an error if `name` doesn't correspond to a defined feature.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the feature to query. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the named feature resolves to `true`, `false` otherwise. |

### Message

```lua
TestService:Message(text: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

Prints `TestService:` followed by `text` to the output in blue text.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | string |  | The message to print to the output. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that sent the message, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the message was sent. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Message1`) are published on the source page; their code is not part of the open-source repo.*

### Require

```lua
TestService:Require(condition: boolean, description: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

If `condition` is `true`, prints `Require passed:` followed by `description` to the output in blue text. Otherwise prints `Require failed. Test ended:` followed by `description` in red text.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `condition` | boolean |  | The boolean expression to evaluate as a required assertion. |
| `description` | string |  | A label that identifies this requirement in the test output. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that invoked the requirement, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the requirement was called. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Require1`) are published on the source page; their code is not part of the open-source repo.*

### Run

> [!warning] Deprecated
> Use `Class.TestService:RunAsync()|RunAsync()` instead.

```lua
TestService:Run(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

Runs scripts which are parented to `TestService`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RunAsync

```lua
TestService:RunAsync(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

Runs scripts which are parented to `TestService`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ScopeTime

```lua
TestService:ScopeTime(): Dictionary
```

**Thread safety:** Unsafe

Returns a dictionary mapping physics simulation scopes to their measured step times, used for per-scope physics performance testing. Raises an error if the caller lacks permission.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping physics simulation scopes to their measured step times. |

### Warn

```lua
TestService:Warn(condition: boolean, description: string, source: Instance = nil, line: int = 0): ()
```

**Thread safety:** Unsafe

If `condition` is `true`, prints `Warning passed:` followed by `description` to the output in blue text. Otherwise prints `Warning:` followed by `description` to the output in yellow text.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `condition` | boolean |  | The boolean expression to evaluate as the warning assertion. |
| `description` | string |  | A label that identifies this warning check in the test output. |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The script instance that invoked the warning, used for output attribution. Defaults to `nil`. |
| `line` | int | `0` | The line number in the source script where the warning was called. Defaults to `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TestService-Warn1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### ServerCollectConditionalResult

```lua
TestService.ServerCollectConditionalResult(condition: boolean, text: string, script: Instance, line: int)
```

Fires when the server should collect a conditional test result.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `condition` | boolean |  | Whether the conditional test assertion passed or failed. |
| `text` | string |  | The description label associated with the test assertion. |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The script instance that produced the result. |
| `line` | int |  | The line number in the script where the assertion was made. |

### ServerCollectResult

```lua
TestService.ServerCollectResult(text: string, script: Instance, line: int)
```

Fires when the server should collect a test result.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | string |  | The result message text sent from the client. |
| `script` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The script instance that produced the result. |
| `line` | int |  | The line number in the script where the result was generated. |

---
*Source: [TestService](https://create.roblox.com/docs/reference/engine/classes/TestService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
