---
title: "Instance"
description: "`Instance` is the base class for all classes in the Roblox class hierarchy which can be part of the `DataModel` tree."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Instance"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`Instance` is the base class for all classes in the Roblox class hierarchy which can be part of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] tree.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** 341 direct subclasses (see [[30 Official Roblox Docs/API Reference/Classes/_Index - Classes|Classes index]])
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

`Instance` is the base class for all classes in the Roblox class hierarchy which can be part of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] tree.

It is not possible to directly create root `Instance` objects, but the special [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] constructor creates objects via code, taking the name of the class as a parameter and returning the created object.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable\|Archivable]] | boolean | Determines if an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] and its descendants can be cloned using [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone\|Instance:Clone()]], and can be saved/published. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable\|archivable]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Capabilities\|Capabilities]] | [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities\|SecurityCapabilities]] | The set of capabilities allowed to be used for scripts inside this container. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#IsInSandbox\|IsInSandbox]] | boolean | Indicates whether the instance is inside a sandboxed container. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] | string | A non-unique identifier of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Parent]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Determines the hierarchical parent of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#PredictionMode\|PredictionMode]] | [[30 Official Roblox Docs/API Reference/Enums/PredictionMode\|PredictionMode]] | Reflects the client-side prediction mode applied to the instance under server-authoritative physics. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#RobloxLocked\|RobloxLocked]] | boolean | **Deprecated.** A deprecated property that used to protect [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Sandboxed\|Sandboxed]] | boolean | When enabled, the instance can only access abilities in its `Capabilities` list. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#UniqueId\|UniqueId]] | UniqueId | A unique identifier for the instance. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#AddTag\|AddTag()]] | () | Applies a tag to the instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#children\|children()]] | Instances | **Deprecated.** Returns an array of the object's children. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#ClearAllChildren\|ClearAllChildren()]] | () | This method destroys all of an instance's children. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone\|Clone()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Create a copy of an instance and all its descendants, ignoring instances that are not [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable\|Archivable]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone\|clone()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy\|Destroy()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Instance.Parent]] property to `nil`, locks the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Instance.Parent]] property, disconnects all connections, and calls `Destroy()` on all children. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy\|destroy()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestor\|FindFirstAncestor()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] is equal to the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorOfClass\|FindFirstAncestorOfClass()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]] is equal to the given className. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorWhichIsA\|FindFirstAncestorWhichIsA()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for whom [[30 Official Roblox Docs/API Reference/Classes/Object#IsA\|Object:IsA()]] returns true for the given className. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild\|FindFirstChild()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#findFirstChild\|findFirstChild()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildOfClass\|FindFirstChildOfClass()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|ClassName]] is equal to the given class name. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildWhichIsA\|FindFirstChildWhichIsA()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for whom [[30 Official Roblox Docs/API Reference/Classes/Object#IsA\|Object:IsA()]] returns true for the given className. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstDescendant\|FindFirstDescendant()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | Returns the first descendant found with the given [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetActor\|GetActor()]] | [[30 Official Roblox Docs/API Reference/Classes/Actor\|Actor]]? | Returns the [[30 Official Roblox Docs/API Reference/Classes/Actor\|Actor]] associated with the Instance, if any. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttribute\|GetAttribute()]] | Variant | Returns the value which has been assigned to the given attribute name. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal\|GetAttributeChangedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns an event that fires when the given attribute changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributes\|GetAttributes()]] | Dictionary | Returns a dictionary of the instance's attributes. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren\|GetChildren()]] | Instances | Returns an array containing all of the instance's children. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#getChildren\|getChildren()]] | Instances | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDebugId\|GetDebugId()]] | string | Returns a coded string of the debug ID used internally by Roblox. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDescendants\|GetDescendants()]] | Instances | Returns an array containing all of the descendants of the instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|GetFullName()]] | string | Returns a string describing the instance's ancestry. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetStyled\|GetStyled()]] | Variant | Returns the styled or explicitly modified value of the specified property, or else the default property value if it hasn't been styled/modified. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetStyledPropertyChangedSignal\|GetStyledPropertyChangedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns an event that fires when the given style property changes on the instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#GetTags\|GetTags()]] | Array | Gets an array of all tags applied to the instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#HasTag\|HasTag()]] | boolean | Check whether the instance has a given tag. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#IsAncestorOf\|IsAncestorOf()]] | boolean | Returns true if an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is an ancestor of the given descendant. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#IsDescendantOf\|IsDescendantOf()]] | boolean | Returns `true` if an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is a descendant of the given ancestor. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#isDescendantOf\|isDescendantOf()]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#IsPropertyModified\|IsPropertyModified()]] | boolean | Returns `true` if the value stored in the specified property is not equal to the code-instantiated default. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#QueryDescendants\|QueryDescendants()]] | Instances | Returns an array containing all descendants of the instance that match the `selector` string. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Remove\|Remove()]] | () | **Deprecated.** Sets the object's `Parent` to `nil`, and does the same for all its descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Remove\|remove()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#RemoveTag\|RemoveTag()]] | () | Removes a tag from the instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#ResetPropertyToDefault\|ResetPropertyToDefault()]] | () | Resets a property to its default value. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#SetAttribute\|SetAttribute()]] | () | Sets the attribute with the given name to the given value. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild\|WaitForChild()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the child of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] with the given name. If the child does not exist, it will yield the current thread until it does. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#AncestryChanged\|AncestryChanged]] | `child`, `parent` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Instance.Parent]] property of this object or one of its ancestors is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#AttributeChanged\|AttributeChanged]] | `attribute` | Fires whenever an attribute is changed on the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded\|ChildAdded]] | `child` | Fires after an object is parented to this [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#childAdded\|childAdded]] | `child` | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved\|ChildRemoved]] | `child` | Fires after a child is removed from this [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantAdded\|DescendantAdded]] | `descendant` | Fires after a descendant is added to the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantRemoving\|DescendantRemoving]] | `descendant` | Fires immediately before a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is removed. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroying\|Destroying]] |  | Fires immediately before (or is deferred until after) the instance is destroyed via [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy\|Instance:Destroy()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Instance#StyledPropertiesChanged\|StyledPropertiesChanged]] |  | Fires whenever any style property is changed on the instance, including when a property is set to `nil`. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Archivable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false

This property determines whether the instance should be included when the experience is published or saved, or when [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]] is called on one of the instance's ancestors. Calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]] directly on an instance will return `nil` if that instance is **not** [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Archivable]].

Copying an object in Studio using the **Duplicate** or **Copy**/**Paste** options will ignore its own [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Archivable]] property and set [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Archivable]] to `true` for the copy.

*Code samples for this member (`Instance-Archivable`) are published on the source page; their code is not part of the open-source repo.*

### archivable

> [!warning] Deprecated
> This deprecated property is a variant of `Class.Instance.Archivable` which
> should be used instead.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/false · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

### Capabilities

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/SecurityCapabilities|SecurityCapabilities]]

**Thread safety:** ReadSafe · **Category:** Permissions · **Loaded/Saved:** true/true · **Capabilities:** CapabilityControl

The set of capabilities allowed to be used for scripts inside this instance. For the capabilities to take effect, [[30 Official Roblox Docs/API Reference/Classes/Instance#Sandboxed|Instance.Sandboxed]] property must be enabled.

This property is used by an experimental feature. See [[30 Official Roblox Docs/Scripting/Script capabilities|script capabilities]] for further details.

### IsInSandbox

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Permissions · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

This read-only property returns `true` if the instance is contained within a sandboxed container — that is, if the instance itself or any of its ancestors has [[30 Official Roblox Docs/API Reference/Classes/Instance#Sandboxed|Instance.Sandboxed]] enabled. Otherwise it returns `false`.

This property is not scriptable and is only visible in Studio's Properties window. See [[30 Official Roblox Docs/Scripting/Script capabilities|script capabilities]] for further details.

### Name

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A non-unique identifier of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. Names are used to keep the object hierarchy organized, along with allowing scripts to access specific objects. The name of an instance cannot exceed 100 characters in size.

The name of an object is often used to access the object through the data model hierarchy using the following methods:

```
local Workspace = game:GetService("Workspace")

local baseplate = Workspace.Baseplate
local baseplate = Workspace["Baseplate"]
local baseplate = Workspace:FindFirstChild("BasePlate")
```

In order to make an object accessible using the dot operator (`.`), its name must start with an underscore or letter, and the rest of the name can only contain letters, numbers, or underscores (no other special characters). If an object's name does not follow this syntax, it will not be accessible using the dot operator and Luau will not interpret its name as an identifier.

If more than one object with the same name are siblings, any attempt to index an object by that name will return only one of the objects, similar to [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]], but not always the desired object. If a specific object needs to be accessed through code, it's recommended to give it a unique name or guarantee that none of its siblings share the same name.

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName|Instance:GetFullName()]] to obtain a full name including the object's hierarchy.

### Parent

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The `Parent` property determines the hierarchical parent of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. The following terminology is commonly used when talking about how this property is set:

- An object is a **child** of, or is **parented to**, another object when its `Parent` is set to that object.

- The **descendants** of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] are the children of that object, plus the descendants of the children as well.

- The **ancestors** of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] are all the objects that the instance is a descendant of.

It is from the `Parent` property that many other API members get their name, such as [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|GetChildren()]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|FindFirstChild()]]. This property is also used to manage whether an object exists in the experience or needs to be removed. As long as an object's parent is in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], is stored in a variable, or is referenced by another object's property, the object remains in the experience; otherwise, the object will automatically be removed.

Calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] will set the `Parent` of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and all of its descendants to `nil`, and also **lock** the `Parent` property. An error is raised when setting the `Parent` of a destroyed object.

Newly created objects using [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] will not have a parent, and usually will not be visible or function until one is set.

#### Object Replication

An object created by the server will not replicate to clients until it is parented to some object that is replicated. When creating an object and setting many properties, it's recommended to set the `Parent` property **last**. This ensures the object replicates once, instead of replicating many property changes.

```lua
local Workspace = game:GetService("Workspace")

-- Set new instance's parent last (recommended)
local part = Instance.new("Part")
part.Position = Vector3.new(0, 10, 0)
part.Parent = Workspace
```

However, if parenting parts to a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] whose parent hasn't been set yet, parenting each part to that model is acceptable since the model would not have replicated.

### PredictionMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|PredictionMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

This property reflects the [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Enum.PredictionMode]] currently applied to the instance, which determines whether the instance's state is predicted on the client ahead of the authoritative server state under server-authoritative physics. It defaults to [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Automatic]].

This property is read-only and cannot be assigned directly from a script; the prediction mode is set through [[30 Official Roblox Docs/API Reference/Classes/RunService#SetPredictionMode|RunService:SetPredictionMode()]]. The property is shown in Studio's Properties window only when the experience uses server-authoritative physics.

- [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Automatic]] (default) — the engine automatically decides whether to predict the instance. Currently, only [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] near the local player character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] are predicted, within a dynamic radius that grows and shrinks based on the device's capacity to handle the simulation load.
- [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|On]] — the instance is always predicted. If it is a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], its physics properties are predicted ahead of the replicated authoritative server state, and mismatches in the instance's attributes between the client and server cause a rollback and resimulation.
- [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Off]] — the instance is not predicted, and regular network ownership semantics apply.

### RobloxLocked

> [!warning] Deprecated
> This property is deprecated and does not do anything.

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `Hidden`

This property used to protect objects in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] service from being altered by users in an unauthorized manner. It has been deprecated and does not do anything.

### Sandboxed

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Permissions · **Loaded/Saved:** false/false · **Capabilities:** CapabilityControl · **Tags:** `NotReplicated`

Turns the instance to be a **sandboxed container**, an experimental feature which limits the actions that scripts inside a particular container can perform. See [[30 Official Roblox Docs/Scripting/Script capabilities|script capabilities]] for further details.

### UniqueId

**Type:** UniqueId

**Security:** read RobloxScriptSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Tags:** `NotReplicated`

A unique identifier for the instance, distinct from [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] which is not necessarily unique. This property is visible in the Properties window in Studio but is not readable or writable from scripts.

## Methods

### AddTag

```lua
Instance:AddTag(tag: string): ()
```

**Thread safety:** Unsafe

This method applies a tag to the instance, with no effect if the tag is already applied. Successfully adding a tag will fire a signal created by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|CollectionService:GetInstanceAddedSignal()]] with the given tag.

#### Warnings

- An instance's tags that were added client-side will be dropped if the server later adds or removes a tag on that instance because the server replicates all tags together and overwrites previous tags.

- When tagging an instance, it is common that some resources are used to give the tag its functionality, for example event connections or tables. To prevent memory leaks, it's a good idea to clean these up (disconnect, set to `nil`, etc.) when no longer needed for a tag. Do this when calling [[30 Official Roblox Docs/API Reference/Classes/Instance#RemoveTag|Instance:RemoveTag()]], calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]], or in a function connected to a signal returned by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|CollectionService:GetInstanceRemovedSignal()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to apply to the instance. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### children

> [!warning] Deprecated
> This item has been superseded by `Class.Instance:GetChildren()` which
> should be used in all new work.

```lua
Instance:children(): Instances
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The children function returns an array of the object's children.

**Returns**

| Type | Description |
| --- | --- |
| Instances | Array of child objects/instances. |

### ClearAllChildren

```lua
Instance:ClearAllChildren(): ()
```

**Thread safety:** Unsafe

This method destroys all of an instance's children and descendants.

```
local part = Instance.new("Part")

-- Add some sparkles
for i = 1, 3 do
	local sparkles = Instance.new("Sparkles")
	sparkles.Parent = part

  local sc = Instance.new("Sparkles")
  sc.Parent = sparkles
end

print("Children:", #part:GetChildren())  --> Children: 3

part:ClearAllChildren()

print("Children:", #part:GetChildren())  --> Children: 0
```

If you do not wish to destroy **all** children and descendants, use either [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDescendants|Instance:GetDescendants()]] to loop through those children/descendants and select what to destroy. For example, the following code sample will destroy all [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] descending from a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]:

```
local Workspace = game:GetService("Workspace")

local model = Workspace:FindFirstChild("TestModel")

for _, descendant in model:GetDescendants() do
	if descendant:IsA("BasePart") then
		descendant:Destroy()
	end
end
```

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Clone

```lua
Instance:Clone(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** CreateInstances

`Clone()` creates a copy of an instance and all of its descendants, ignoring all instances that are not [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Archivable]]. The copy of the root instance is returned by this method and its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] is set to `nil`. Note that if the instance itself has [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable|Archivable]] set to `false`, this method will return `nil`.

If a reference property such as [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value|ObjectValue.Value]] is set in a cloned instance, the value of the copy's property depends on the original's value:

- If a reference property refers to an instance that was **also** cloned, the copy will refer to the copy.
- If a reference property refers to an instance that was **not** cloned, the same value is maintained in the copy.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | A copy of the instance, or `nil` if the instance is not [[30 Official Roblox Docs/API Reference/Classes/Instance#Archivable\|Archivable]]. |

*Code samples for this member (`Clone-Example`) are published on the source page; their code is not part of the open-source repo.*

### clone

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:Clone()` which
> should be used instead.

```lua
Instance:clone(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** CreateInstances · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### Destroy

```lua
Instance:Destroy(): ()
```

**Thread safety:** Unsafe

Sets the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] property to `nil`, locks the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] property, disconnects all connections, and calls `Destroy()` on all children. This method is the correct way to dispose of objects that are no longer required.

Disposing of unneeded objects is important, since unnecessary objects and connections in a place use up memory which can lead to serious performance issues over time.

As a best practice after calling `Destroy()` on an object, set any variables referencing the object (or its descendants) to `nil`. This prevents your code from accessing anything to do with the object.

```lua
local part = Instance.new("Part")
part.Name = "Hello, world"
part:Destroy()
-- Don't do this:
print(part.Name)  --> "Hello, world"
-- Do this to prevent the above line from working:
part = nil
```

Once an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] has been destroyed by this method, it cannot be reused because the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] property is locked. To **temporarily** remove an object instead of destroying it, set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] to `nil`. For example:

```
local Workspace = game:GetService("Workspace")

object.Parent = nil
task.wait(2)
object.Parent = Workspace
```

To destroy an object after a set amount of time, use [[30 Official Roblox Docs/API Reference/Classes/Debris#AddItem|Debris:AddItem()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Instance-Destroy1`) are published on the source page; their code is not part of the open-source repo.*

### destroy

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:Destroy()` which
> should be used instead.

```lua
Instance:destroy(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FindFirstAncestor

```lua
Instance:FindFirstAncestor(name: string): Instance?
```

**Thread safety:** Safe

Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] is equal to the given name.

This method works upwards, meaning it starts at the instance's immediate [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] and works up towards the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. If no matching ancestor is found, it returns `nil`.

The following code snippet would find the first ancestor of the object named `Car`.

```
local car = object:FindFirstAncestor("Car")
```

For variants of this method that find ancestors of a specific class, please see [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorOfClass|Instance:FindFirstAncestorOfClass()]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorWhichIsA|Instance:FindFirstAncestorWhichIsA()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] to be looked for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

### FindFirstAncestorOfClass

```lua
Instance:FindFirstAncestorOfClass(className: string): Instance?
```

**Thread safety:** Safe

Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName|Object.ClassName]] is equal to the given className.

This method works upwards, meaning it starts at the instance's immediate [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] and works up towards the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. If no matching ancestor is found, it returns `nil`.

A common use of this method is finding the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] belongs to. For example:

```
local model = part:FindFirstAncestorOfClass("Model")
```

This method is a variant of [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestor|Instance:FindFirstAncestor()]] which checks the [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName|Object.ClassName]] property rather than [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]]. [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorWhichIsA|Instance:FindFirstAncestorWhichIsA()]] also exists, using the [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] method instead to respect class inheritance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]] to be looked for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

### FindFirstAncestorWhichIsA

```lua
Instance:FindFirstAncestorWhichIsA(className: string): Instance?
```

**Thread safety:** Safe

Returns the first ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for whom [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] returns true for the given className.

This method works upwards, meaning it starts at the instance's immediate [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] and works up towards the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. If no matching ancestor is found, it returns `nil`.

Unlike [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorOfClass|Instance:FindFirstAncestorOfClass()]], this method uses [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] which respects class inheritance. For example:

```
print(part:IsA("Part"))  --> true
print(part:IsA("BasePart"))  --> true
print(part:IsA("Instance"))  --> true
```

Therefore, the following code sample will return the first [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] ancestor, regardless of if it is a [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

```
local part = object:FindFirstAncestorWhichIsA("BasePart")
```

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestor|Instance:FindFirstAncestor()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]] to be looked for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

### FindFirstChild

```lua
Instance:FindFirstChild(name: string, recursive: boolean = False): Instance?
```

**Thread safety:** Safe

Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] with the given name, or `nil` if no such child exists. If the optional `recursive` argument is `true`, this method searches all descendants rather than only the immediate children of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

#### Checking the Existence of an Object

`FindFirstChild()` is necessary if you need to verify an object exists before continuing. Attempting to index a child by name using the dot operator throws an error if the child doesn't exist.

```lua
local Workspace = game:GetService("Workspace")

-- The following line errors if the part doesn't exist in the workspace
Workspace.Part.Transparency = 0.5
```

A better approach is to use `FindFirstChild()` to first check for `Part`, then use an `if` statement to run code that needs it.

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace:FindFirstChild("Part")
if part then
	part.Transparency = 0.5
end
```

#### Finding a Child Whose Name Matches a Property

Sometimes the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] of an object is the same as that of a property of its [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]]. When using the dot operator, properties take precedence over children if they share a name.

In the following example, a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] called `Color` is added to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], which also has the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Part.Color]] property. Notice that `part.Color` refers to the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] property value, not the child [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] instance. A benefit of using [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|FindFirstChild()]] is that the introduction of new properties does not impose a risk on your code.

```lua
local part = Instance.new("Part")
local folder = Instance.new("Folder")
folder.Name = "Color"
folder.Parent = part
local c1 = part.Color  -- The property
local c2 = part:FindFirstChild("Color")  -- The child folder
```

#### Performance Notes

[[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|FindFirstChild()]] takes about 20% longer than using the dot operator and almost 8 times longer than simply storing a reference to an object. Therefore, you should avoid calling it in performance-dependent code such as in tight loops or functions connected to [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]] and [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|RunService.PreRender]]. Instead, store the result in a variable, or consider using [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|ChildAdded]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] to detect when a child of a given name becomes available.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] to be searched for. |
| `recursive` | boolean | `False` | Whether or not the search should be conducted recursively. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

*Code samples for this member (`Instance-FindFirstChild1`) are published on the source page; their code is not part of the open-source repo.*

### findFirstChild

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:FindFirstChild()`
> which should be used instead.

```lua
Instance:findFirstChild(name: string, recursive: boolean = False): Instance
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  |  |
| `recursive` | boolean | `False` |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### FindFirstChildOfClass

```lua
Instance:FindFirstChildOfClass(className: string): Instance?
```

**Thread safety:** Safe

Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName|ClassName]] is equal to the given `className`. Unlike [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildWhichIsA|Instance:FindFirstChildWhichIsA()]], this method only returns objects whose class matches `className`, ignoring class inheritance. If no matching child is found, this method returns `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]] to be looked for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

*Code samples for this member (`Instance-FindFirstChildOfClass1`) are published on the source page; their code is not part of the open-source repo.*

### FindFirstChildWhichIsA

```lua
Instance:FindFirstChildWhichIsA(className: string, recursive: boolean = False): Instance?
```

**Thread safety:** Safe

Returns the first child of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for whom [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] returns true for the given className.

If no matching child is found, this method returns `nil`. If the optional recursive argument is true, this method searches all descendants rather than only the immediate children of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

Unlike [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildOfClass|Instance:FindFirstChildOfClass()]], this method uses [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] which respects class inheritance. For example:

```lua
print(part:IsA("Part")) --> true
print(part:IsA("BasePart")) --> true
print(part:IsA("Instance")) --> true
```

Therefore, the following code sample will return the first [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] child, regardless of if it is a [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

```
local part = object:FindFirstChildWhichIsA("BasePart")
```

Developers looking for a child by name, should use [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Object#ClassName\|Object.ClassName]] to be searched for. |
| `recursive` | boolean | `False` | Whether or not the search should be conducted recursively. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

### FindFirstDescendant

```lua
Instance:FindFirstDescendant(name: string): Instance?
```

**Thread safety:** Safe

Returns the first descendant found with the given [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]].

This method is disabled and cannot be used. To find the first descendant of an instance, consider using the `recursive` parameter on [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] to search for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]? | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

### GetActor

```lua
Instance:GetActor(): Actor?
```

**Thread safety:** Safe

If the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] is an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]], the [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] itself is returned. Otherwise, its closest ancestor [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]] is returned. If no ancestor is an [[30 Official Roblox Docs/API Reference/Classes/Actor|Actor]], the result is `nil`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Actor\|Actor]]? | The [[30 Official Roblox Docs/API Reference/Classes/Actor\|Actor]] found. |

### GetAttribute

```lua
Instance:GetAttribute(attribute: string): Variant
```

**Thread safety:** Safe

This method returns the value which has been assigned to the given attribute name. If no attribute has been assigned, `nil` is returned.

For example, the following code snippet sets and then gets the value of the instance's `InitialPosition` attribute:

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace.Part
part:SetAttribute("InitialPosition", part.Position)

local initialPosition = instance:GetAttribute("InitialPosition")
print(initialPosition)
```

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Instance#SetAttribute|Instance:SetAttribute()]] which sets the attribute with the given name to the given value.
- [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributes|Instance:GetAttributes()]] which returns a dictionary of key‑value pairs for each of the instance's attributes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attribute` | string |  | The name of the attribute being retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value which has been assigned to the given attribute name. If no attribute has been assigned, `nil` is returned. |

### GetAttributeChangedSignal

```lua
Instance:GetAttributeChangedSignal(attribute: string): RBXScriptSignal
```

**Thread safety:** Unsafe

This method returns an event that behaves exactly like the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event, except that it only fires when the specific given attribute changes; effectively it is similar to [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]] but for attributes.

It's generally a good idea to use this method instead of a connection to [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] with a function that checks the attribute name. Subsequent calls to this method on the same object with the same attribute name return the same event.

The following code example returns a signal that fires the function `attributeChanged()` when the part's `InitialPosition` attribute changes:

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace.Part
part:SetAttribute("InitialPosition", part.Position)

local function attributeChanged()
	print("Attribute changed")
end

part:GetAttributeChangedSignal("InitialPosition"):Connect(attributeChanged)
```

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#AttributeChanged|Instance.AttributeChanged]] which fires whenever any attribute is changed on the instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attribute` | string |  | The name of the specified attribute for which the change signal is being returned. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | An event that fires when the given attribute changes. |

### GetAttributes

```lua
Instance:GetAttributes(): Dictionary
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

This method returns a dictionary of key‑value pairs for each attribute where the key is the attribute's name and the value is a non‑`nil` value.

For example, the following code snippet outputs an instance's attributes and values:

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace.Part
part:SetAttribute("InitialPosition", part.Position)
part:SetAttribute("CanUse", true)

for name, value in part:GetAttributes() do
	print(name .. " = " .. value)
end
```

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttribute|Instance:GetAttribute()]] which returns the value that has been assigned to the given attribute name.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary of string → variant pairs for each attribute where the string is the name of the attribute and the variant is a non-nil value. |

### GetChildren

```lua
Instance:GetChildren(): Instances
```

**Thread safety:** Safe

Returns an array (a numerically indexed table) containing all of the instance's direct children, or every [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] whose [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] is equal to the object. The array can be iterated upon using either a numeric or generic `for` loop:

```lua
local Workspace = game:GetService("Workspace")

-- Numeric loop example
local children = Workspace:GetChildren()
for i = 1, #children do
	local child = children[i]
	print(child.Name .. " is child number " .. i)
end
```

```lua
local Workspace = game:GetService("Workspace")

-- Generic loop example
local children = Workspace:GetChildren()
for i, child in children do
	print(child.Name .. " is child number " .. i)
end
```

Note that the returned array is **not** sorted in any particular order, so manual sorting (for example using [[30 Official Roblox Docs/API Reference/Libraries/table#sort|table.sort()]]) is advised for sorting the children returned by this method.

See also the [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDescendants|GetDescendants()]] method.

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array containing the instance's children. |

*Code samples for this member (`Instance-GetChildren1`) are published on the source page; their code is not part of the open-source repo.*

### getChildren

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:GetChildren()`
> which should be used instead.

```lua
Instance:getChildren(): Instances
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| Instances |  |

### GetDebugId

```lua
Instance:GetDebugId(scopeLength: int = 4): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `NotBrowsable`

Returns a coded string of the debug ID used internally by Roblox. Note that:

- This item is protected. Attempting to use it in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will cause an error.
- A debug ID is an ID used in debugging processes. It allows a debugger to read each instruction before an application processes it. All objects in Roblox act like processes and each run instructions (or 'code') that can be debugged if needed.
- This can be helpful for plugins which need to distinguish similar objects from one-another (such as objects that share the same name).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `scopeLength` | int | `4` | The scope length. |

**Returns**

| Type | Description |
| --- | --- |
| string | The Debug ID string. |

*Code samples for this member (`Instance-GetDebugId1`) are published on the source page; their code is not part of the open-source repo.*

### GetDescendants

```lua
Instance:GetDescendants(): Instances
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

This object method returns an array that contains all of the descendants of that object. Unlike [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]], which only returns the immediate children of an object, this method finds every child of the object, every child of those children, and so on.

Note that the returned array is **not** sorted in any particular order, so manual sorting (for example using [[30 Official Roblox Docs/API Reference/Libraries/table#sort|table.sort()]]) is advised for sorting the descendants returned by this method. Also consdier the [[30 Official Roblox Docs/API Reference/Classes/Instance#QueryDescendants|QueryDescendants()]] method to query descendants by a combination of selectors and combinators.

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array containing the instance's descendants. |

*Code samples for this member (`Instance-GetDescendants1`) are published on the source page; their code is not part of the open-source repo.*

### GetFullName

```lua
Instance:GetFullName(): string
```

**Thread safety:** Safe

Returns a string describing the instance's ancestry. The string is a concatenation of the [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] of the object and its ancestors, separated by periods. The [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] (`game`) is not considered. For example, a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] may return [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.Part]].

When called on an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that is not a descendant of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]], this method considers all ancestors up to and including the topmost one without a [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]].

This method is useful for logging and debugging. You shouldn't attempt to parse the returned string for any useful operation; this method does not escape periods (or any other symbol) in object names. In other words, although its output often appears to be a valid Luau identifier, it is not guaranteed.

**Returns**

| Type | Description |
| --- | --- |
| string | The full name of the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

*Code samples for this member (`Instance-GetFullName1`, `instance-getfullname-lua-implementation`) are published on the source page; their code is not part of the open-source repo.*

### GetStyled

```lua
Instance:GetStyled(name: string, selector: string?): Variant
```

**Thread safety:** Unsafe

This method returns the styled or explicitly modified value of the specified property, or else the default property value if it hasn't been styled/modified. This differs slightly from accessing the property value directly, such as `[GuiObject].Rotation`, which returns the default or modified value of the property.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | Name of the property to query. |
| `selector` | string? |  | Optional selector for the pseudo instance you are targeting on the instance. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The styled or explicitly modified value of the specified property, or else the default property value if it hasn't been styled/modified. |

*Code samples for this member (`Instance-GetStyled`) are published on the source page; their code is not part of the open-source repo.*

### GetStyledPropertyChangedSignal

```lua
Instance:GetStyledPropertyChangedSignal(property: string): RBXScriptSignal
```

**Thread safety:** Unsafe

This method returns an event that behaves exactly like the [[30 Official Roblox Docs/API Reference/Classes/Instance#StyledPropertiesChanged|StyledPropertiesChanged]] event, except that it only fires when the given style property changes. It's generally a good idea to use this method instead of a connection to [[30 Official Roblox Docs/API Reference/Classes/Instance#StyledPropertiesChanged|StyledPropertiesChanged]] with a function that checks the property name. Subsequent calls to this method on the same object with the same property name return the same event.

Note that this event will not pass any arguments to a connected function, so the value of the changed property must be read directly within a script.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | Name of the style property for which to listen for changes. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Event that fires when the given style property changes. |

*Code samples for this member (`Instance-GetStyledPropertyChangedSignal`) are published on the source page; their code is not part of the open-source repo.*

### GetTags

```lua
Instance:GetTags(): Array
```

**Thread safety:** Safe

This method returns an array of the tags applied to the given instance, as strings. You can add tags either in Studio in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window or at runtime with [[30 Official Roblox Docs/API Reference/Classes/Instance#AddTag|AddTag()]].

This method is useful when you want to do something with multiple tags on an instance at once. However, it is inefficient to use this method to check for the existence of a single tag; instead, use [[30 Official Roblox Docs/API Reference/Classes/Instance#HasTag|HasTag()]] to check for a specific tag.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings, each representing a tag applied to the instance. |

### HasTag

```lua
Instance:HasTag(tag: string): boolean
```

**Thread safety:** Safe

This method returns `true` if the provided tag has been added to the object. You can add tags either in Studio in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window or at runtime with [[30 Official Roblox Docs/API Reference/Classes/Instance#AddTag|AddTag()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to check for on the instance. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | `true` if the instance has the given tag, `false` otherwise. |

### IsAncestorOf

```lua
Instance:IsAncestorOf(descendant: Instance): boolean
```

**Thread safety:** Safe

Returns true if an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] is an ancestor of the given descendant.

An [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] is considered the ancestor of an object if the object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] or one of it's parent's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

See also, [[30 Official Roblox Docs/API Reference/Classes/Instance#IsDescendantOf|Instance:IsDescendantOf()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `descendant` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The descendant [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is an ancestor of the given descendant. |

*Code samples for this member (`Instance-IsAncestorOf1`) are published on the source page; their code is not part of the open-source repo.*

### IsDescendantOf

```lua
Instance:IsDescendantOf(ancestor: Instance): boolean
```

**Thread safety:** Safe

Returns `true` if an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] is a descendant of the given ancestor.

Note that `IsDescendantOf()` cannot be used with a parameter of `nil` to check if an object has been removed.

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#IsAncestorOf|Instance:IsAncestorOf()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ancestor` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The ancestor [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] is a descendant of the given ancestor. |

*Code samples for this member (`Instance-IsDescendantOf1`) are published on the source page; their code is not part of the open-source repo.*

### isDescendantOf

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:IsDescendantOf()`
> which should be used instead.

```lua
Instance:isDescendantOf(ancestor: Instance): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ancestor` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### IsPropertyModified

```lua
Instance:IsPropertyModified(property: string): boolean
```

**Thread safety:** Unsafe

This method indicates whether a specific property has been modified from the code‑instantiated default. If called on an instance newly created via code ([[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]]), this method will return `false`. If called on an object newly created by Studio workflows such as [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window insertion, the result may differ.

For example, querying the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] property of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] inserted via the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] will return `true`, but querying the same property of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] created through [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] will return `false`, assuming no other changes were made to its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]].

Note that this method only returns useful results for services and user‑creatable instances. Return values for system‑populated properties of instances like [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] is undefined behavior.

Also note that if this method returns `true`, styling will **not** affect the property because explicitly modifying a property takes precedence over styling it. To reset a property to its code‑instantiated default and allow styling on it, use [[30 Official Roblox Docs/API Reference/Classes/Instance#ResetPropertyToDefault|ResetPropertyToDefault()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | Name of the property to query. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Boolean indicating whether the property is modified from its code‑instantiated default. |

### QueryDescendants

```lua
Instance:QueryDescendants(selector: string): Instances
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

This object method returns an array that contains all descendants of the object that match the provided `selector` string. `selector` can include multiple selectors and combinators to match characteristics such as the class name, instance name, and hierarchy relationships, as well as specific values of instance properties and attributes. The `selector` grammar is similar to the one used in [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]], with only a few differences regarding which parts of the grammar are supported or not.

#### Selectors

- `ClassName` — Matches instances of the specified class in a [[30 Official Roblox Docs/API Reference/Classes/Object#IsA|Object:IsA()]] relationship.
- `.Tag` — Matches instances tagged with a [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tag.
- `#Name` — Matches instances of a specific [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]].
- `[property = value]` — Matches instances which have the specified property and that property has the specified value. Boolean, number, and string values are supported. Letters, numbers, `_`, and `-` can be used without putting the value in quotation marks.
- `[$attribute]` — Matches instances which have the specified [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] set.
- `[$attribute = value]` — Matches instances which have the specified attribute **and** that attribute has the specified value. Same limitations apply as for property selectors. If you want to check for the absence of an attribute, do not query it as `nil`; instead use the `:not` pseudo‑class as in `:not([$attribute])`.

Selectors can also be combined. For example, `Model.Apple[$Variety = Fuji][$Flavor = 4]` will match instances which are a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] tagged as `Apple` and which have a `Variety` attribute equal to `Fuji` as well as a `Flavor` attribute equal to `4`.

```lua
local Workspace = game:GetService("Workspace")

-- Get all MeshPart descendants
print(Workspace:QueryDescendants("MeshPart"))

-- Get all descendants tagged as "Fruit"
print(Workspace:QueryDescendants(".Fruit"))

-- Get all descendants with the name "RedTree"
print(Workspace:QueryDescendants("#RedTree"))

-- Get all descendants with CanCollide property set to false
print(Workspace:QueryDescendants("[CanCollide = false]"))

-- Get all descendants with a "FuelCapacity" attribute assigned
print(Workspace:QueryDescendants("[$FuelCapacity]"))
-- Get all descendants with a "FuelCapacity" attribute set to 75
print(Workspace:QueryDescendants("[$FuelCapacity = 75]"))
```

#### Combinators

Combinators let you mix basic selectors to match deeper hierarchy relationships.

- `>` — Matches instances that are **direct children** of the previous filter matches.

- `>>` — Matches instances that are **descendants** of the previous filter matches. This is the default first filter, meaning that `SpotLight.Red` is the same as `>> SpotLight.Red`.

- `,` — Specifies a list of multiple independent selectors for the descendant query. Only elements matching the filter are placed in the returned array; `nil` will not be included for non‑matches in a query list.

```lua
local Workspace = game:GetService("Workspace")

-- Get direct children of any Model that are tagged as "SwordPart"
print(Workspace:QueryDescendants("Model > .SwordPart"))

-- Get direct children which are a Part and are tagged as "Apple"
print(Workspace:QueryDescendants("> Part.Apple"))

-- Get descendants of any Model with an attribute "OnFire" set to true
print(Workspace:QueryDescendants("Model >> [$OnFire = true]"))

-- Get MeshPart descendants tagged as "SwordPart" OR with an attribute "OnFire" set to true
print(Workspace:QueryDescendants("MeshPart.SwordPart, MeshPart[$OnFire = true]"))
```

#### Pseudo-class selectors

- `:not(complex-selector-list)` — Allows selecting instances which do **not** match any of the selectors inside, effectively performing a negation of the selectors. Since the expression inside is a list of complex selectors, it's possible to filter based on multiple conditions.

- `:has(relative-selector-list)` — Allows selecting instances based on which instances they contain inside. The selector list is evaluated relative to each instance.

```lua
local Workspace = game:GetService("Workspace")

-- Get all descendants which are NOT of class SpotLight
print(Workspace:QueryDescendants(":not(SpotLight)"))
-- Get all descendants which are NOT of class SpotLight OR PointLight
print(Workspace:QueryDescendants(":not(SpotLight, PointLight)"))
-- Get all descendants which do NOT have an attribute "OnFire"
print(Workspace:QueryDescendants(":not([$OnFire])"))
-- Get all descendants EXCEPT children of a Model tagged as "SwordPart"
print(Workspace:QueryDescendants(":not(Model > .SwordPart)"))

-- Get descendants which contain a Tool instance as their own descendant
print(Workspace:QueryDescendants(":has(Tool)"))
-- Get MeshPart descendants which contain a direct child tagged as "SwordPart"
print(Workspace:QueryDescendants("MeshPart:has(> .SwordPart)"))

-- Get MeshPart descendants with direct children NOT of SurfaceAppearance or Texture class
print(Workspace:QueryDescendants("MeshPart:has(> :not(SurfaceAppearance, Texture))"))
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selector` | string |  | Selector string used to filter elements. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of instances (empty if nothing matched the selector). |

### Remove

> [!warning] Deprecated
> This item is deprecated in favor of `Class.Instance:Destroy()` and
> `Class.Instance:ClearAllChildren()`. If you must remove an object from the
> game, and wish to use the object later, set its `Parent` property to `nil`
> instead of using this method.

```lua
Instance:Remove(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This method sets the object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil`, and does the same for all its descendants.

If the object is referenced before being removed, it is possible to retrieve the object at a later point.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Instance-Remove1`) are published on the source page; their code is not part of the open-source repo.*

### remove

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Instance:Remove()` which
> has also been deprecated. Neither function should be used in new work.

```lua
Instance:remove(): ()
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveTag

```lua
Instance:RemoveTag(tag: string): ()
```

**Thread safety:** Unsafe

This method removes a tag from an instance. It will not throw an error if the object does not have the tag. Successfully removing a tag will fire a signal created by [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|CollectionService:GetInstanceRemovedSignal()]] with the given tag.

Note that when tagging an instance, it's common that some resources are used to give the tag its functionality, for example event connections or tables. To prevent memory leaks, it's a good idea to clean these up (disconnect, set to `nil`, etc.) when no longer needed for a tag.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The tag to remove from the instance. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ResetPropertyToDefault

```lua
Instance:ResetPropertyToDefault(property: string): ()
```

**Thread safety:** Unsafe

Resets a property to its default value. For example, calling `ResetPropertyToDefault("Rotation")` on a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] is equivalent to setting its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]] to `0` (the property's default value). This method can be used to ensure styling will override this property's default value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `property` | string |  | Name of the property to reset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetAttribute

```lua
Instance:SetAttribute(attribute: string, value: Variant): ()
```

**Thread safety:** Unsafe

This method sets the attribute with the given name to the given value. If the value given is `nil`, the attribute will be removed, since `nil` is returned by default.

For example, the following code snippet sets the instance's `InitialPosition` attribute to [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3.new(0, 10, 0)]]:

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace.Part
part:SetAttribute("InitialPosition", Vector3.new(0, 10, 0))
```

#### Limitations

Naming requirements and restrictions:

- Names must only use alphanumeric characters.
  - You may also include periods, hyphens, slashes, and underscores.
- No spaces or unique symbols (such as @, ~, !) are allowed.
- Strings must be 100 characters or less.
- Names are not allowed to start with **RBX** unless the caller is a Roblox core script (reserved for Roblox).

When attempting to set an attribute to an unsupported type, an error will be thrown.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttribute|Instance:GetAttribute()]] which returns the value that has been assigned to the given attribute name.
- [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributes|Instance:GetAttributes()]] which returns a dictionary of key‑value pairs for each of the instance's attributes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attribute` | string |  | The name of the attribute being set. |
| `value` | Variant |  | The value to set the specified attribute to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### WaitForChild

```lua
Instance:WaitForChild(childName: string, timeOut: double): Instance
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`, `CanYield`

Returns the child of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] with the given name. If the child does not exist, it will yield the current thread until it does. If the `timeOut` parameter is specified, this method will time out after the specified number of seconds and return `nil`.

#### Primary Usage

[[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] is extremely important when working on code run by the client in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. The Roblox engine does not guarantee the time or order in which objects are replicated from the server to the client. Additionally, if an experience has [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] set to true, [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that are far away from the player's character may not be streamed to the client, potentially causing scripts to break when indexing objects that do not yet exist on the client.

#### Notes

- This method does not yield if a child with the given name exists when the call is made.
- [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]] is a more efficient alternative to [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] for objects that are assumed to exist.
- If a call to this method exceeds 5 seconds without returning, and no `timeOut` parameter has been specified, a warning will be printed to the output that the thread may yield indefinitely.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `childName` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Instance.Name]] to be looked for. |
| `timeOut` | double |  | An optional time out parameter. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] found. |

*Code samples for this member (`Instance-WaitForChild1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### AncestryChanged

```lua
Instance.AncestryChanged(child: Instance, parent: Instance)
```

Fires when this instance is reparented or when any of its ancestors is reparented.

You can use this event to track the deletion of an instance in Studio, such as manual deletion in the Explorer or through a plugin. If you need to detect when an instance is destroyed using [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]], use the [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroying|Instance.Destroying]] event instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `child` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance whose [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Parent]] property changed, which can be this instance or a more distant ancestor, **not** necessarily the instance the handler is connected to. |
| `parent` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The new parent of the `child` parameter. |

*Code samples for this member (`Instance-AncestryChanged1`) are published on the source page; their code is not part of the open-source repo.*

### AttributeChanged

```lua
Instance.AttributeChanged(attribute: string)
```

This event fires whenever any attribute is changed on the instance, including when an attribute is set to `nil`. The name of the changed attribute is passed to the connected function.

For example, the following code snippet connects the `attributeChanged()` function to fire whenever one of the part's attributes changes:

```lua
local Workspace = game:GetService("Workspace")

local part = Workspace.Part

local function attributeChanged(attributeName)
	print(attributeName, "changed")
end

part.AttributeChanged:Connect(attributeChanged)
```

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#GetAttributeChangedSignal|Instance:GetAttributeChangedSignal()]] which returns an event that fires when a specific given attribute changes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attribute` | string |  | The name of the attribute that has been changed. |

### ChildAdded

```lua
Instance.ChildAdded(child: Instance)
```

Fires after an object is parented to this [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

Note, when using this method on a client to detect objects created by the server it is necessary to use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]] when indexing these object's descendants. This is because the object and its descendants are not guaranteed to replicate from the server to the client simultaneously. For example:

```
local Workspace = game:GetService("Workspace")

Workspace.ChildAdded:Connect(function(child)
	-- Use WaitForChild() since descendants may not have replicated yet
	local head = child:WaitForChild("Head")
end)
```

Note, this event only operates for immediate children of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. For an event that captures all descendants, use [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantAdded|Instance.DescendantAdded]].

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|Instance.ChildRemoved]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `child` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that has been added. |

*Code samples for this member (`Instance-ChildAdded1`) are published on the source page; their code is not part of the open-source repo.*

### childAdded

> [!warning] Deprecated
> This deprecated event is a variant of `Class.Instance.ChildAdded` which
> should be used instead.

```lua
Instance.childAdded(child: Instance)
```

**Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `child` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

### ChildRemoved

```lua
Instance.ChildRemoved(child: Instance)
```

Fires after a child is removed from this [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

Removed refers to when an object's parent is changed from this [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] to something other than this [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. Note, this event will also fire when a child is destroyed (using [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]]) as the destroy function sets an object's parent to `nil`.

This event only operates for immediate children of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. For an event that captures all descendants, use [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantRemoving|Instance.DescendantRemoving]].

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `child` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that has been removed. |

*Code samples for this member (`Instance-ChildRemoved1`) are published on the source page; their code is not part of the open-source repo.*

### DescendantAdded

```lua
Instance.DescendantAdded(descendant: Instance)
```

This event fires after a descendant is added to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]].

As it fires for every descendant, parenting an object to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] will fire the event for this object and all of its descendants individually.

If you're only concerned with the **direct children** of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], use [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]] instead.

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantRemoving|Instance.DescendantRemoving]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `descendant` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that has been added. |

*Code samples for this member (`Instance-DescendantAdded1`) are published on the source page; their code is not part of the open-source repo.*

### DescendantRemoving

```lua
Instance.DescendantRemoving(descendant: Instance)
```

This event fires **immediately before** the parent [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] changes such that a **descendant** instance will no longer be a descendant. [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] changes an instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] to `nil`, so calling that method on a descendant of the parent will cause this event to fire.

Since this event fires **before** the descendant's removal, the parent of the descendant will be unchanged at the time of this event firing. If the descendant is also a **direct child** of the parent, this event will fire before [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|Instance.ChildRemoved]].

If a descendant has children, this event fires with the descendant first, followed by its descendants.

#### Warning

This event fires with the descendant object that is being removed. Attempting to set the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] of the descendant to something else will fail. Below is an example that demonstrates this:

```
local Workspace = game:GetService("Workspace")

Workspace.DescendantRemoving:Connect(function(descendant)
	-- Do not manipulate the parent of the descendant in this function!
	-- This event fires BECAUSE the parent was manipulated, and the change hasn't happened yet
	-- Therefore, it is problematic to change the parent like this:
	descendant.Parent = game
end)

local part = Instance.new("Part")
part.Parent = Workspace
part.Parent = nil
```

See also [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantAdded|DescendantAdded]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `descendant` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that is being removed. |

*Code samples for this member (`Instance-DescendantRemoving1`) are published on the source page; their code is not part of the open-source repo.*

### Destroying

```lua
Instance.Destroying()
```

The [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] will never be deleted from memory while a connected function is still using it. However, if the function yields at any point, the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and its descendants will be parented to `nil`.

If the [[30 Official Roblox Docs/API Reference/Classes/Workspace#SignalBehavior|Workspace.SignalBehavior]] property is set to [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior|Enum.SignalBehavior.Immediate]], this event fires immediately before the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] or one of its ancestors is destroyed with [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]].

If the [[30 Official Roblox Docs/API Reference/Classes/Workspace#SignalBehavior|Workspace.SignalBehavior]] property is set to [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior|Enum.SignalBehavior.Deferred]], this event fires at the next resumption point, which will be after the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] or one of its ancestors is destroyed with [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]].

With [[30 Official Roblox Docs/API Reference/Enums/SignalBehavior|Deferred]] behavior, connecting a script to its own [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroying|Instance.Destroying]] event is problematic, as the script will be destroyed before the callback can be called (meaning it will not execute).

When deleting an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] in Studio, such as manually deleting through the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] or through a plugin, the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] isn't destroyed. Instead, the parent is set to `nil` which you can track with [[30 Official Roblox Docs/API Reference/Classes/Instance#AncestryChanged|Instance.AncestryChanged]].

*Code samples for this member (`Instance-Destroying-Immediate`, `Instance-Destroying-Deferred`) are published on the source page; their code is not part of the open-source repo.*

### StyledPropertiesChanged

```lua
Instance.StyledPropertiesChanged()
```

This event fires whenever any style property is changed on the instance, including when a property is set to `nil`.

*Code samples for this member (`Instance-StyledPropertiesChanged`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Instance](https://create.roblox.com/docs/reference/engine/classes/Instance) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
