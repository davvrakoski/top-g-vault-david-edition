---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "CollectionService Tag-Driven Architecture"
tags: [deep-dive, roblox, collectionservice, tags, components, architecture]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# CollectionService Tag-Driven Architecture

**Why this matters:** a map with 300 doors, 80 lava bricks and 40 shops should not contain 420 copies of a script; one tag-driven component system replaces them, survives streaming, and lets level designers add behaviour without touching code.
This note gives a production binder (with the yield, ancestry and streaming edge cases handled), a component pattern configured by attributes, and conventions that keep tags maintainable.

---

## 1. Why tags beat scripts-in-parts

| Scripts inside every part | One binder per tag |
| --- | --- |
| 300 doors = 300 script instances, 300 VM entries | 1 script, 300 small component objects |
| Fix a bug: edit (or re-paste) 300 scripts | Fix a bug: edit one module |
| Works badly with StreamingEnabled on the client | Components spin up and down as parts stream |
| Designers must copy the right script version | Designers add a tag and a few attributes |
| Hard to list "every interactive thing" | `CollectionService:GetTagged("Door")` |

Facts from the CollectionService reference that drive the design:

- Tags are strings on instances. They **replicate server to client** and are **saved with the place**.
- **All tags on an instance replicate together.** If a client adds a local tag and the server then changes a different tag on the same instance, the client's local tags are overwritten.
- In StreamingEnabled places, when an instance streams back in, its properties and tags are re-synchronised from the server, so client-side tag changes can be lost.
- `GetInstanceAddedSignal(tag)` fires when the tag is added to an instance in the DataModel, **or** when a tagged instance is added to the DataModel (for example by parenting). It does **not** fire for instances that already had the tag before you connected; call `GetTagged` for those.
- `Instance:AddTag`, `RemoveTag`, `HasTag` and `GetTags` exist directly on instances.

---

## 2. Tag constants: one file, no typos

```luau
--!strict
-- ReplicatedStorage/Shared/Tags.luau
local Tags = table.freeze({
	Door = "Door",
	KillBrick = "KillBrick",
	Shop = "Shop",
	Collectible = "Collectible",
	SensingNpc = "SensingNpc",
})
return Tags
```

A typo in a tag string fails silently (the binder simply never sees anything). A frozen constants table turns typos into errors and gives one place to audit every tag the game uses.

---

## 3. A production binder

The naive version (`GetTagged` + `InstanceAdded` + `InstanceRemoved`) breaks in three real situations:

1. **The constructor yields** (for example `WaitForChild` on a child part) and the instance is removed during the yield. The component finishes constructing for an instance that is gone, and leaks.
2. **Tagged templates outside Workspace.** A tagged door model in `ReplicatedStorage/Prefabs` gets a live component and starts running logic on a template.
3. **Moving into Workspace later.** A template cloned and parented from `ServerStorage` to `Workspace` fires `InstanceAdded` (it entered the DataModel), but a model moved from `ReplicatedStorage` to `Workspace` does not, because it never left the DataModel.

This binder handles all three:

```luau
--!strict
-- ReplicatedStorage/Shared/Util/Binder.luau
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")

export type Component = { Destroy: (self: any) -> () }
type Constructor = (instance: Instance) -> Component?

local PENDING = newproxy(false) -- unique sentinel

local Binder = {}

function Binder.bind(tag: string, construct: Constructor, root: Instance?): () -> ()
	local requiredAncestor = root or Workspace
	local live: { [Instance]: any } = {} -- Component or PENDING
	local ancestryWatch: { [Instance]: RBXScriptConnection } = {}
	local connections: { RBXScriptConnection } = {}

	local tryAdd: (Instance) -> ()

	local function destroyComponent(instance: Instance)
		local current = live[instance]
		live[instance] = nil
		if current and current ~= PENDING then
			local ok, err = pcall(current.Destroy, current)
			if not ok then
				warn(("[Binder:%s] Destroy failed for %s: %s"):format(tag, instance:GetFullName(), tostring(err)))
			end
		end
	end

	local function watchAncestry(instance: Instance)
		if ancestryWatch[instance] then
			return
		end
		ancestryWatch[instance] = instance.AncestryChanged:Connect(function()
			if instance:IsDescendantOf(requiredAncestor) then
				tryAdd(instance)
			else
				destroyComponent(instance)
			end
		end)
	end

	tryAdd = function(instance: Instance)
		watchAncestry(instance)
		if live[instance] ~= nil then
			return -- already live or constructing
		end
		if not instance:IsDescendantOf(requiredAncestor) then
			return -- template or storage copy; wait for AncestryChanged
		end
		live[instance] = PENDING
		local ok, componentOrErr = pcall(construct, instance)
		if live[instance] ~= PENDING then
			-- Removed (or re-added) while we were yielding: discard this result.
			if ok and componentOrErr then
				pcall((componentOrErr :: Component).Destroy, componentOrErr)
			end
			return
		end
		if ok and componentOrErr then
			live[instance] = componentOrErr
		else
			live[instance] = nil
			if not ok then
				warn(("[Binder:%s] construct failed for %s: %s"):format(tag, instance:GetFullName(), tostring(componentOrErr)))
			end
		end
	end

	local function onRemoved(instance: Instance)
		local watch = ancestryWatch[instance]
		if watch then
			watch:Disconnect()
			ancestryWatch[instance] = nil
		end
		destroyComponent(instance)
	end

	table.insert(connections, CollectionService:GetInstanceAddedSignal(tag):Connect(function(instance)
		task.spawn(tryAdd, instance)
	end))
	table.insert(connections, CollectionService:GetInstanceRemovedSignal(tag):Connect(onRemoved))
	for _, instance in CollectionService:GetTagged(tag) do
		task.spawn(tryAdd, instance)
	end

	-- Unbind function: cleans everything this binder created.
	return function()
		for _, c in connections do
			c:Disconnect()
		end
		for instance in table.clone(ancestryWatch) do
			onRemoved(instance)
		end
		for instance in table.clone(live) do
			destroyComponent(instance)
		end
	end
end

return Binder
```

Why each piece exists:

- **`PENDING` sentinel**: marks "construction in progress". If removal happens mid-yield, `live[instance]` is cleared, and the constructor's result is destroyed on arrival instead of leaking.
- **Ancestry watch**: templates outside the required root stay dormant and activate the moment they are parented into Workspace, then deactivate if moved back.
- **`task.spawn` per instance**: one slow or failing constructor does not delay the rest.
- **Unbind function**: makes the whole system hot-reloadable in tests and in round-based games.

---

## 4. A component configured by attributes

Designers set attributes in the Properties window; the component reads them. No code edits to make a slow door or a fast door.

```luau
--!strict
-- ServerScriptService/Components/Door.luau
local TweenService = game:GetService("TweenService")

local Door = {}
Door.__index = Door

export type Door = typeof(setmetatable({} :: {
	model: Model,
	hinge: BasePart,
	closedCFrame: CFrame,
	openAngle: number,
	isOpen: boolean,
	tween: Tween?,
	connections: { RBXScriptConnection },
}, Door))

function Door.new(instance: Instance): Door?
	if not instance:IsA("Model") then
		return nil
	end
	local hinge = instance:FindFirstChild("Hinge")
	local prompt = instance:FindFirstChildWhichIsA("ProximityPrompt", true)
	if not (hinge and hinge:IsA("BasePart") and prompt) then
		warn("Door missing Hinge or ProximityPrompt:", instance:GetFullName())
		return nil
	end

	local self = setmetatable({
		model = instance,
		hinge = hinge,
		closedCFrame = hinge.CFrame,
		openAngle = (instance:GetAttribute("OpenAngle") :: number?) or 90,
		isOpen = false,
		tween = nil,
		connections = {},
	}, Door)

	table.insert(self.connections, prompt.Triggered:Connect(function(player)
		self:toggle(player)
	end))
	table.insert(self.connections, instance:GetAttributeChangedSignal("OpenAngle"):Connect(function()
		self.openAngle = (instance:GetAttribute("OpenAngle") :: number?) or 90
	end))
	return self
end

function Door.toggle(self: Door, _player: Player)
	self.isOpen = not self.isOpen
	local goal = if self.isOpen
		then self.closedCFrame * CFrame.Angles(0, math.rad(self.openAngle), 0)
		else self.closedCFrame
	if self.tween then
		self.tween:Cancel()
	end
	local tween = TweenService:Create(self.hinge, TweenInfo.new(0.4, Enum.EasingStyle.Quad), { CFrame = goal })
	self.tween = tween
	tween:Play()
end

function Door.Destroy(self: Door)
	for _, c in self.connections do
		c:Disconnect()
	end
	if self.tween then
		self.tween:Cancel()
	end
end

return Door
```

Wiring every component in one server script:

```luau
local Binder = require(ReplicatedStorage.Shared.Util.Binder)
local Tags = require(ReplicatedStorage.Shared.Tags)
local Door = require(ServerScriptService.Components.Door)

Binder.bind(Tags.Door, Door.new)
```

The hinge here must be anchored and welded to the door panel for the tween to move the whole door; that is a build convention to write in your level-design guide.

---

## 5. Server components vs client components

Split each tagged object into what must be authoritative and what is only presentation:

| Server component (ServerScriptService) | Client component (StarterPlayerScripts) |
| --- | --- |
| Door open/closed state, who may open it | Creak sound, dust particles, local highlight |
| Collectible pickup validation and reward | Bobbing/spinning animation, sparkle |
| Kill brick damage | Warning glow when near |

Both bind the **same tag**. The client binder benefits automatically from streaming: when a tagged part streams out it leaves the DataModel, `InstanceRemoved` fires and the component is destroyed; when it streams back, `InstanceAdded` fires and a fresh component is built. This is exactly the lifecycle you want for cosmetic logic, and it is why tag binders are the recommended way to write streaming-safe client code ([[StreamingEnabled Gotchas and Streaming-Safe Client Code]]).

Never let the client decide the outcome: the client component for a collectible plays effects, but the server component validates distance and grants the reward ([[Interaction Gate]]).

---

## 6. Newer option: query-based Collections

The 2026 CollectionService reference documents `CollectionService:CreateCollection(query)`, which returns a live **Collection** of instances matching a CSS-like selector (for example `"Part.KillBrick"` for parts with the KillBrick tag, with `OnAdded`/`OnRemoved` callbacks). It can express "tag plus class plus attribute" in one query. As of 2026, check the docs for its release status and exact callback semantics before adopting it widely; the binder above works everywhere and remains the portable choice.

---

## 7. Conventions that keep 50+ tags sane

- **PascalCase nouns** for behaviour tags (`Door`, `Ladder`), and a prefix for non-behaviour markers (`Map_SpawnPoint`, `Debug_Hide`).
- **One tag = one component.** If a door also needs to be lockable, add a `Lockable` tag with its own component rather than a mega-component with flags.
- **Attributes hold configuration; tags hold identity.** Do not encode numbers in tag names (`Door90`).
- **Validate in the constructor and warn with the full path.** Designers fix what they can see in Output.
- **Never call `GetTagged` every frame.** It allocates a new array each call. Keep your own set via the binder, or iterate `live`.
- **Tag templates in storage are fine** with the ancestry-aware binder above; without it, they become live components.

---

## Common mistakes

- Only connecting `GetInstanceAddedSignal` and forgetting the instances that were already tagged (`GetTagged`).
- Binding templates in ReplicatedStorage or ServerStorage, creating ghost components.
- Yielding in the constructor without guarding against removal during the yield.
- Adding tags on the client and expecting them to persist (server tag changes and streaming re-sync overwrite them).
- Typo'd tag strings scattered through code; nothing errors, nothing works.
- Putting authoritative logic (rewards, damage) in the client component.
- Components that connect events but have no `Destroy`, leaking on every stream-out.

## Checklist

- [ ] All tag names come from one frozen `Tags` module.
- [ ] Binder handles existing instances, added, removed, yields during construction and ancestry.
- [ ] Every component has a `Destroy` that disconnects and cancels everything it made.
- [ ] Configuration is read from attributes, with defaults and change listeners where useful.
- [ ] Server and client components are split by authority vs presentation.
- [ ] No per-frame `GetTagged` calls.
- [ ] Level-design guide documents each tag, required children and attributes.

**Related:** [[Scripting - Hub]] · [[Interaction Gate]] · [[Instance Streaming Deep Dive]] · [[Config Feature Flags and Content Data]] · [[Cleanup Bag Pattern]]
