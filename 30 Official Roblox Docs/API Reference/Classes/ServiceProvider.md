---
title: "ServiceProvider"
description: "A ServiceProvider is an abstract class, which stores, and provides certain singleton classes, depending on what inherited class you are using its members with."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ServiceProvider"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A ServiceProvider is an abstract class, which stores, and provides certain singleton classes, depending on what inherited class you are using its members with.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], [[30 Official Roblox Docs/API Reference/Classes/GenericSettings|GenericSettings]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

A ServiceProvider is an abstract base class that manages a registry of singleton service instances. The [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] (accessible in Lua as `game`) is the primary ServiceProvider in an experience. Services are created lazily the first time they are requested via [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|ServiceProvider:GetService()]] and remain available for the lifetime of the DataModel.

You do not create ServiceProvider instances directly; instead you interact with its members through the DataModel.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#FindService\|FindService()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the service specified by the given className if it's already created, errors for an invalid name. |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService\|GetService()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the service with the requested class name, creating it if it does not exist. |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#getService\|getService()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#service\|service()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#Close\|Close]] |  | Fires when the current place is exited. |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#ServiceAdded\|ServiceAdded]] | `service` | Fired when a service is created. |
| [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#ServiceRemoving\|ServiceRemoving]] | `service` | Fired when a service is about to be removed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### FindService

```lua
ServiceProvider:FindService(className: string): Instance
```

**Thread safety:** Safe

Returns the service with the given class name only if it has already been created. Unlike [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|ServiceProvider:GetService()]], this method does not create the service when it does not yet exist; it returns `nil` instead. If `className` is not a valid service name, the method throws an error.

This method is thread-safe and can be called from any thread context. It is useful when you need to check whether a service is present without triggering its initialization, for example during cleanup or conditional logic that should not force service creation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The class name of the service to find. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The service instance if it has already been created, or nil if the service does not yet exist. |

*Code samples for this member (`ServiceProvider-FindService1`) are published on the source page; their code is not part of the open-source repo.*

### GetService

```lua
ServiceProvider:GetService(className: string): Instance
```

**Thread safety:** Unsafe

Returns a service with the class name requested. When called with the name of a service (such as [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]]) it will return the instance of that service. If the service does not yet exist it will be created and the new service is returned. This is the only way to create some services, and can also be used for services that have unusual names, e.g. RunService's name is "Run Service".

Note:

- This function will return `nil` if the className parameter is an existing class, but the class is not a service.
- If you attempt to fetch a service that is present under another Object, an error will be thrown stating that the "singleton serviceName already exists".

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The class name of the requested service. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An instance of the requested service. |

*Code samples for this member (`ServiceProvider-GetService1`) are published on the source page; their code is not part of the open-source repo.*

### getService

> [!warning] Deprecated
> This deprecated function is a variant of
> `Class.ServiceProvider:GetService()` which should be used instead.

```lua
ServiceProvider:getService(className: string): Instance
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### service

> [!warning] Deprecated
> This item has been superseded by `Class.ServiceProvider:GetService()`
> which should be used in all new work.

```lua
ServiceProvider:service(className: string): Instance
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

## Events

### Close

```lua
ServiceProvider.Close()
```

Fires when the game instance is shutting down, immediately before services and instances are torn down. On the server this occurs when the last player leaves or the server is closed; on the client it fires when the player leaves the experience.

Connect to this event to perform final cleanup such as saving player data with [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]]. Handlers run synchronously — the engine waits for all connected callbacks to return before proceeding with shutdown.

*Code samples for this member (`ServiceProvider-Close1`) are published on the source page; their code is not part of the open-source repo.*

### ServiceAdded

```lua
ServiceProvider.ServiceAdded(service: Instance)
```

Fires after a service is added to the DataModel. The `service` parameter is the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] of the newly added service. Because services are created lazily (the first time [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|ServiceProvider:GetService()]] is called for them), this event lets you react to a service becoming available without polling for it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance of the service that was added. |

### ServiceRemoving

```lua
ServiceProvider.ServiceRemoving(service: Instance)
```

Fires just before a service is removed from the DataModel. The `service` parameter is the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that is about to be removed. This event fires during DataModel teardown, giving listeners a chance to disconnect from the service or release references before the service is destroyed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The Instance of the service that is about to be removed. |

---
*Source: [ServiceProvider](https://create.roblox.com/docs/reference/engine/classes/ServiceProvider) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
