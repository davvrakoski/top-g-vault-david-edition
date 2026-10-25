---
title: "ReflectionService"
description: "A service that allows scripts to query the engine's API at runtime for information about classes, properties, methods, and events."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReflectionService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that allows scripts to query the engine's API at runtime for information about classes, properties, methods, and events.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`ReflectionService` allows scripts to query the engine for details about its API, including required security permissions, functionality, and inheritance structure. You can use this service to dynamically inspect classes and their properties, methods, and events, which can be useful for debugging, tooling, or creating dynamic behaviors based on the engine's capabilities.

The following is an example script that inspects classes and their properties:

*Code samples for this API (`ReflectionService-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ReflectionService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionService#GetClass\|GetClass()]] | ReflectedClass? | Returns information about a class when given its name, assuming that class is accessible. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionService#GetClasses\|GetClasses()]] | List<ReflectedClass> | Returns a list of all classes accessible with filters applied. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionService#GetEventsOfClass\|GetEventsOfClass()]] | List<ReflectedEvent> | Returns a list of events for a given class with filters applied. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionService#GetMethodsOfClass\|GetMethodsOfClass()]] | List<ReflectedMethod> | Returns a list of methods for a given class with filters applied. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionService#GetPropertiesOfClass\|GetPropertiesOfClass()]] | List<ReflectedProperty> | Returns a list of properties for a given class with filters applied. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetClass

```lua
ReflectionService:GetClass(className: string, filter: Dictionary = nil): ReflectedClass?
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Given a class name in the Roblox API, returns a `ReflectedClass` dictionary with information about the associated class's reflection state. If no such class name exists, returns `nil`.

If you pass in a `ReflectionClassFilter` dictionary, you can adjust the set of eligible classes and adjust the output behavior:

```lua
{
	-- The security context to use; can be more expansive than the current script's security
	Security: SecurityCapabilities?, -- default: SecurityCapabilities.fromCurrent()
	-- Require classes to derive from the passed-in class name
	IsA: string?, -- default: nil
	-- Whether to exclude Studio display information about the class
	ExcludeDisplay: boolean?, -- default: false
}
```

If the class name is valid, you'll get the following `ReflectedClass` dictionary as output:

```lua
{
	-- The name of the class
	Name: string,
	-- Whether the class is serialized (able to be saved to disk)
	Serialized: boolean,
	-- The class's parent in the instance hierarchy (unless it's the root)
	Superclass: string?,
	-- The names of the class's direct children in the instance hierarchy
	Subclasses: {string},
	-- Studio display information
	Display: {
		-- Always "General" for classes
		Category: string,
		-- A message indicating that the class is deprecated, if applicable
		DeprecationMessage: string?,
	}?,
	-- The security permissions required to access this class
	Permits: {
		-- If the class is a Service, the security capabilities required to obtain access. If not applicable, this field isn't present
		GetService: SecurityCapabilities?,
		-- The security capabilities required to create an instance of this class. If not possible, this field isn't present
		New: SecurityCapabilities?,
	}
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The name of the class for which you wish to retrieve information. |
| `filter` | Dictionary | `nil` | An optional filter to restrict or expand the set of classes that this method can return and change the method's behavior. |

**Returns**

| Type | Description |
| --- | --- |
| ReflectedClass? | A `ReflectedClass` dictionary with reflection information if the class exists; otherwise, `nil`. |

### GetClasses

```lua
ReflectionService:GetClasses(filter: Dictionary = nil): List<ReflectedClass>
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Returns a list of `ReflectedClass` dictionaries for all classes in the Roblox API that match the provided filter criteria.

If you pass in a `ReflectionClassFilter` dictionary, you can adjust the set of eligible classes and adjust the output behavior:

```lua
{
	-- The security context to use; can be more expansive than the current script's security
	Security: SecurityCapabilities?, -- default: SecurityCapabilities.fromCurrent()
	-- Require classes to derive from the passed-in class name
	IsA: string?, -- default: nil
	-- Whether to exclude Studio display information about the classes
	ExcludeDisplay: boolean?, -- default: false
}
```

You'll get a list of `ReflectedClass` dictionaries as output, each with the same structure as described in the `GetClass` method. If there are no classes that match the filter criteria, you'll receive an empty list.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | Dictionary | `nil` | An optional filter to restrict or expand the set of classes that this method can return and change the method's behavior. |

**Returns**

| Type | Description |
| --- | --- |
| List<ReflectedClass> | A list of `ReflectedClass` dictionaries with reflection information for each class that matches the filter criteria. |

### GetEventsOfClass

```lua
ReflectionService:GetEventsOfClass(className: string, filter: Dictionary = nil): List<ReflectedEvent>
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Given a class name in the Roblox API, returns a list of `ReflectedEvent` dictionaries for all events of that class that match the provided filter criteria. If no such class name exists, returns `nil`.

If you pass in a `ReflectionMemberFilter` dictionary, you can adjust the set of eligible events and adjust the output behavior:

```lua
{
	-- The security context to use; can be more expansive than the current script's security
	Security: SecurityCapabilities?, -- default: SecurityCapabilities.fromCurrent()
	-- Whether to exclude inherited events from superclasses
	ExcludeInherited: boolean?, -- default: false
	-- Whether to exclude Studio display information about the events
	ExcludeDisplay: boolean?, -- default: false
}
```

If the class name is valid and that class has events, you'll get a list of `ReflectedEvent` dictionaries as output, each with the following structure:

```lua
{
	-- The name of the event
	Name: string,
	-- The superclass from which the property is inherited, or the class name if not inherited
	Owner: string,
	-- A list of all parameters the event passes to connected functions
	Parameters: {
		{
			-- The name of the parameter
			Name: string,
			-- The type of the parameter
			Type: ReflectionType,
		}
	},
	-- Studio display information
	Display: {
		-- A message indicating that the event is deprecated, if applicable
		DeprecationMessage: string?,
	}?,
	-- The security permissions required to access this event
	Permits: {
		-- The security permissions required to listen for the event in any context
		Listen: SecurityCapabilities?,
	},
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The name of the class for which you wish to retrieve events. |
| `filter` | Dictionary | `nil` | An optional filter to restrict or expand the set of events that this method can return and change the method's behavior. |

**Returns**

| Type | Description |
| --- | --- |
| List<ReflectedEvent> | A list of `ReflectedEvent` dictionaries with reflection information for each event of the class that matches the filter criteria. |

### GetMethodsOfClass

```lua
ReflectionService:GetMethodsOfClass(className: string, filter: Dictionary = nil): List<ReflectedMethod>
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Given a class name in the Roblox API, returns a list of `ReflectedMethod` dictionaries for all methods of that class that match the provided filter criteria. If no such class name exists, returns `nil`.

If you pass in a `ReflectionMemberFilter` dictionary, you can adjust the set of eligible methods and adjust the output behavior:

```lua
{
	-- The security context to use; can be more expansive than the current script's security
	Security: SecurityCapabilities?, -- default: SecurityCapabilities.fromCurrent()
	-- Whether to exclude inherited methods from superclasses
	ExcludeInherited: boolean?, -- default: false
	-- Whether to exclude Studio display information about the methods
	ExcludeDisplay: boolean?, -- default: false
}
```

If the class name is valid and that class has methods, you'll get a list of `ReflectedMethod` dictionaries as output, each with the following structure:

```lua
{
	-- The name of the method
	Name: string,
	-- The superclass from which the property is inherited, or the class name if not inherited
	Owner: string,
	-- A list of all parameters the method takes
	Parameters: {
		{
			-- The name of the parameter
			Name: string,
			-- The type of the parameter
			Type: ReflectionType,
			-- The default value of the parameter, if it has one
			DefaultValue: any?,
		}
	},
	-- The return type of the method; "void" if none
	ReturnType: ReflectionType,
	-- Whether the method is yielding
	CanYield: boolean,
	-- Studio display information
	Display: {
		-- A message indicating that the method is deprecated, if applicable
		DeprecationMessage: string?,
	}?,
	-- The security permissions required to access this method
	Permits: {
		-- The security permissions required to call the method in a single-threaded context
		Call: SecurityCapabilities?,
		-- The security permissions required to call the method in a parallel context
		CallParallel: SecurityCapabilities?,
	},
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The name of the class for which you wish to retrieve methods. |
| `filter` | Dictionary | `nil` | An optional filter to restrict or expand the set of methods that this method can return and change the method's behavior. |

**Returns**

| Type | Description |
| --- | --- |
| List<ReflectedMethod> | A list of `ReflectedMethod` dictionaries with reflection information for each method of the class that matches the filter criteria. |

### GetPropertiesOfClass

```lua
ReflectionService:GetPropertiesOfClass(className: string, filter: Dictionary = nil): List<ReflectedProperty>
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Given a class name in the Roblox API, returns a list of `ReflectedProperty` dictionaries for all properties of that class that match the provided filter criteria. If no such class name exists, returns `nil`.

If you pass in a `ReflectionMemberFilter` dictionary, you can adjust the set of eligible properties and adjust the output behavior:

```lua
{
	-- The security context to use; can be more expansive than the current script's security
	Security: SecurityCapabilities?, -- default: SecurityCapabilities.fromCurrent()
	-- Whether to exclude inherited properties from superclasses
	ExcludeInherited: boolean?, -- default: false
	-- Whether to exclude Studio display information about the properties
	ExcludeDisplay: boolean?, -- default: false
}
```

If the class name is valid and that class has properties, you'll get a list of `ReflectedProperty` dictionaries as output, each with the following structure:

```lua
{
	-- The name of the property
	Name: string,
	-- The superclass from which the property is inherited, or the class name if not inherited
	Owner: string,
	-- Whether the property is serialized (able to be saved to disk or sent over the network)
	Serialized: boolean,
	-- The type of the property
	Type: ReflectionType,
	-- The content type of the property, if applicable
	ContentType: Enum.AssetType?,
	-- Studio display information
	Display: {
		-- The category under which the property is listed in Studio
		Category: string,
		-- A message indicating that the property is deprecated, if applicable
		DeprecationMessage: string?,
	}?,
	-- The security permissions required to access this property
	Permits: {
		-- The security context required to read this property
		Read: SecurityCapabilities?,
		-- The security context required to read this property while thread-safe
		ReadParallel: SecurityCapabilities?,
		-- The security context required to write to this property
		Write: SecurityCapabilities?,
		-- The security context required to write to this property while thread-safe
		WriteParallel: SecurityCapabilities?,
	},
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The name of the class for which you wish to retrieve properties. |
| `filter` | Dictionary | `nil` | An optional filter to restrict or expand the set of properties that this method can return and change the method's behavior. |

**Returns**

| Type | Description |
| --- | --- |
| List<ReflectedProperty> | A list of `ReflectedProperty` dictionaries with reflection information for each property of the class that matches the filter criteria. |

---
*Source: [ReflectionService](https://create.roblox.com/docs/reference/engine/classes/ReflectionService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
