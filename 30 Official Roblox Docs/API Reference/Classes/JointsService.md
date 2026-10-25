---
title: "JointsService"
description: "A service that stores joints created by surface connections."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/JointsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that stores joints created by surface connections.*

> [!warning] Deprecated
> This service has been deprecated in favor of
> [constraints](30%20Official%20Roblox%20Docs/Physics/Mechanical%20constraints.md) which should be used
> for surface connections instead

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `Deprecated`

## Description

The JointsService is a service that stores joints created by surface connections. It also has API available for visualizing surface to surface contact, and joining surfaces together.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/JointsService#ClearJoinAfterMoveJoints\|ClearJoinAfterMoveJoints()]] | () | Will remove any 'create joints' that were made visible via the [[30 Official Roblox Docs/API Reference/Classes/JointsService#ShowPermissibleJoints\|JointsService:ShowPermissibleJoints()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/JointsService#CreateJoinAfterMoveJoints\|CreateJoinAfterMoveJoints()]] | () | Updates all visible joints for the parts assigned by the [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget\|JointsService:SetJoinAfterMoveTarget()]] and [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance\|JointsService:SetJoinAfterMoveInstance()]] methods. |
| [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance\|SetJoinAfterMoveInstance()]] | () | Sets the PVInstance that will be connected with the target PVInstance specified by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget\|JointsService:SetJoinAfterMoveTarget()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget\|SetJoinAfterMoveTarget()]] | () | Sets the PVInstance that will be connected with the PVInstance specified by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance\|JointsService:SetJoinAfterMoveInstance()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/JointsService#ShowPermissibleJoints\|ShowPermissibleJoints()]] | () | When used it will visibly display a potential surface connection between the two [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]], which were set with [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget\|JointsService:SetJoinAfterMoveTarget()]] and [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance\|JointsService:SetJoinAfterMoveInstance()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClearJoinAfterMoveJoints

```lua
JointsService:ClearJoinAfterMoveJoints(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Will remove any 'create joints' that were made visible via the [[30 Official Roblox Docs/API Reference/Classes/JointsService#ShowPermissibleJoints|JointsService:ShowPermissibleJoints()]] method.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CreateJoinAfterMoveJoints

```lua
JointsService:CreateJoinAfterMoveJoints(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Updates all visible joints for the parts assigned by the [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget|JointsService:SetJoinAfterMoveTarget()]] and [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance|JointsService:SetJoinAfterMoveInstance()]] methods.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetJoinAfterMoveInstance

```lua
JointsService:SetJoinAfterMoveInstance(joinInstance: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Sets the PVInstance that will be connected with the target PVInstance specified by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget|JointsService:SetJoinAfterMoveTarget()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `joinInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] to be joined to the target set by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget\|JointsService:SetJoinAfterMoveTarget()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetJoinAfterMoveTarget

```lua
JointsService:SetJoinAfterMoveTarget(joinTarget: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Sets the PVInstance that will be connected with the PVInstance specified by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance|JointsService:SetJoinAfterMoveInstance()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `joinTarget` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstance]] to serve as the connection target for the instance set by [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance\|JointsService:SetJoinAfterMoveInstance()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ShowPermissibleJoints

```lua
JointsService:ShowPermissibleJoints(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

When used it will visibly display a potential surface connection between the two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], which were set with [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveTarget|JointsService:SetJoinAfterMoveTarget()]] and [[30 Official Roblox Docs/API Reference/Classes/JointsService#SetJoinAfterMoveInstance|JointsService:SetJoinAfterMoveInstance()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [JointsService](https://create.roblox.com/docs/reference/engine/classes/JointsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
