---
title: "InstanceHandle"
description: "A lightweight, weak reference to an `Instance` that might not be available locally."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/InstanceHandle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A lightweight, weak reference to an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that might not be available locally.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle|InstanceHandle]] data type is a weak reference to an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that might not be available locally. Use it to point at an instance that hasn't arrived yet, could stream out, or exists only on another machine, and to pick that instance up once it's there.

A handle always refers to the same target. To reach that target, call [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait|InstanceHandle:Wait()]], which yields until the instance is available:

```lua
local Workspace = game:GetService("Workspace")

local part = Instance.new("Part")
local target = Instance.new("Part")
target.Name = "TargetPart"
part.Parent = Workspace
target.Parent = Workspace

part:SetAttribute("Target", target)

local handle = part:GetAttribute("Target")
local instance = handle:Wait(10)
if instance then
	print("Target is", instance.Name) --> Target is TargetPart
end
```

Prefer [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait|InstanceHandle:Wait()]] with a timeout so your code runs as soon as the instance shows up. Use [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Get|InstanceHandle:Get()]] when you want an immediate answer and can handle `nil`, such as in code that runs every frame.

#### Examples

##### Attributes

Attributes use [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle|InstanceHandle]] instead of an ordinary instance reference. Since the handle itself is never `nil`, you can tell apart an attribute that is missing from one where the instance is not currently present:

```lua
local part = Instance.new("Part")

print(part:GetAttribute("Target")) --> nil

part:SetAttribute("Target", InstanceHandle.new(nil))
local handle = part:GetAttribute("Target")
print(handle:Get()) --> nil
```

[[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle|InstanceHandle]] attributes also appear in [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributes|Instance:GetAttributes()]], which can't hold `nil` values.

[[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|Instance:GetAttributeChangedSignal()]] fires when the attribute is set to a new target or removed. It does not fire when the target streams in or out, or when the target is destroyed. To react to availability, combine the signal with [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait|InstanceHandle:Wait()]]:

```lua
local part = Instance.new("Part")

part:GetAttributeChangedSignal("Target"):Connect(function()
	local handle = part:GetAttribute("Target")
	if not handle then
		return
	end

	local instance = handle:Wait(10)
	if instance then
		print("New target:", instance.Name)
	end
end)
```

##### Remote events

Pass a handle through a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] to give the receiver a reference to an instance it doesn't have yet. The receiver waits for the instance instead of getting nothing.

In a server script, call this function with your remote event, the receiving player, and the model to send:

```lua
local function sendHandle(remoteEvent: RemoteEvent, player: Player, spawnedModel: Model)
	local handle = InstanceHandle.new(spawnedModel)
	remoteEvent:FireClient(player, handle)
end
```

In a client script, call this function with the same remote event to start listening before the server sends the handle:

```lua
local function receiveHandles(remoteEvent: RemoteEvent)
	remoteEvent.OnClientEvent:Connect(function(handle)
		local model = handle:Wait(10)
		if model then
			print("Received", model.Name)
		end
	end)
end
```

#### Ownership

A handle acts as a weak reference. It never keeps its target alive. The lifetime of the target is controlled by the rest of your experience: its parent and any ordinary references your scripts hold that prevent it from being garbage collected.

[[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Get|InstanceHandle:Get()]] and [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait|InstanceHandle:Wait()]] return an ordinary instance reference, which does keep the instance alive for as long as you hold it.

A handle is otherwise lightweight and needs no cleanup.

#### Equality

Two handles are equal when they refer to the same target, even if you created them separately and even after the target is gone. All empty handles are equal to each other. Each handle is still a distinct value.

```lua
local instance1 = Instance.new("Part")
local instance2 = Instance.new("Part")

local a = InstanceHandle.new(instance1)
local b = InstanceHandle.new(instance1)
local c = InstanceHandle.new(instance2)

print(a == b) --> true
print(a == c) --> false
```

Equality depends on target identity, so it still works when the target isn't currently available.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#new\|new()]] | `instance` | Returns a new [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle\|InstanceHandle]] referring to the given [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Get\|Get()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the referenced [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] if it's available locally, otherwise `nil`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait\|Wait()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Yields until the referenced [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is available locally, then returns it. |

## Constructors

### new

```lua
InstanceHandle.new(instance: Instance?): InstanceHandle
```

The handle refers to the instance weakly and doesn't extend its lifetime.

```lua
local target = Instance.new("Part")
target.Name = "TargetPart"

local handle = InstanceHandle.new(target)
local empty = InstanceHandle.new(nil)

print(handle:Get()) --> TargetPart
print(empty:Get()) --> nil
```

Throws if `instance` is neither an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] nor `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? |  | The instance to refer to, or `nil` for an empty handle. |

## Methods

### Get

```lua
InstanceHandle:Get(): Instance?
```

This method doesn't yield.

`Get()` returns `nil` when the handle is empty, when the target hasn't arrived on the client or server running the script, when the target is no longer available after streaming out, when the target has been garbage collected, and when the target isn't accessible to the calling script. Use [[30 Official Roblox Docs/API Reference/Datatypes/InstanceHandle#Wait|InstanceHandle:Wait()]] to yield until the target arrives instead of checking once.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The referenced instance, or `nil` if it isn't available locally. |

### Wait

```lua
InstanceHandle:Wait(timeout: number?): Instance?
```

Returns `nil` if the handle is empty, the target is inaccessible to the calling script, or `timeout` elapses first. `Wait()` returns immediately when the target is already available and when the handle is empty.

Pass a timeout whenever you can't guarantee that the target reaches the caller. A target that's destroyed before it replicates leaves a handle that never resolves, and a `Wait()` with no timeout never returns. A pending wait can't be cancelled: [[30 Official Roblox Docs/API Reference/Libraries/task#cancel|task.cancel()]] stops your coroutine, but the wait isn't unregistered until the target arrives or the timeout elapses.

`timeout` must be a number greater than zero. Throws if `timeout` is zero, negative, or not a number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `timeout` | number? |  | How long to wait, in seconds. Must be greater than zero. Waits indefinitely when omitted. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The referenced instance, or `nil` if the handle is empty, the target is inaccessible to the calling script, or `timeout` elapses first. |

---
*Source: [InstanceHandle](https://create.roblox.com/docs/reference/engine/datatypes/InstanceHandle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
