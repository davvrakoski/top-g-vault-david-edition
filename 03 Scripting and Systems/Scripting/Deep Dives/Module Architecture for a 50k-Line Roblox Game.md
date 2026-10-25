---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Module Architecture for a 50k-Line Roblox Game"
tags: [deep-dive, roblox, architecture, modulescript, luau]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Module Architecture for a 50k-Line Roblox Game

**Why this matters:** at 5k lines any structure works; at 50k lines the structure decides whether a new teammate can ship a feature in a day or breaks saving while adding a hat.
This note gives a concrete layout, a bootstrap loader you can paste, dependency rules that prevent circular requires, and the review questions that keep it healthy.

The vault already covers the *idea* of services and controllers ([[Service Controller Reference Architecture]], [[Service and Controller Boundaries]]). This note is the *mechanics*.

---

## 1. Two entry points, everything else is a module

Use exactly **one server Script** and **one client LocalScript** that do anything. Every other file is a ModuleScript. Benefits:

- Load order is explicit and deterministic, instead of depending on which of 60 Scripts the engine happens to start first.
- You can measure startup time per module.
- Tests can require any module without side effects, because modules do nothing until told to.

```
ServerScriptService/
  Server.server.luau            -- the only server Script
  Services/
    DataService.luau
    InventoryService.luau
    CombatService.luau
    ...
  ServerLib/                    -- server-only helpers (no state)
ReplicatedStorage/
  Shared/
    Types.luau                  -- strict types only
    Config/                     -- immutable tuning tables
      Items.luau
      Weapons.luau
    Net/
      Remotes.luau              -- the one place remotes are created/fetched
    Util/                       -- pure functions: math, tables, strings
  Packages/                     -- third-party code (Wally or vendored)
StarterPlayer/StarterPlayerScripts/
  Client.client.luau            -- the only client LocalScript
  Controllers/
    InputController.luau
    CameraController.luau
    HudController.luau
```

At 50k lines, group **by feature inside each side** once a folder passes ~15 modules: `Services/Combat/{CombatService, HitValidation, DamageMath}`. Feature folders scale better than one giant `Services` folder because the files that change together live together.

---

## 2. The lifecycle contract: `Init` then `Start`

Every service and controller exports the same shape:

```luau
--!strict
-- ServerScriptService/Services/InventoryService.luau
local InventoryService = {}

local DataService: any -- filled in Init, never required at top level by peers
-- (Tip: export a `DataService` type from Types and annotate with it instead of any.)

function InventoryService.Init(registry: { [string]: any })
	-- Phase 1: grab references, create tables, NO yielding, NO calls into other services.
	DataService = registry.DataService
end

function InventoryService.Start()
	-- Phase 2: every service has finished Init. Safe to call peers, connect events, spawn loops.
end

-- Public API: the only functions other modules may call.
function InventoryService.GetCount(player: Player, itemId: string): number
	local profile = DataService.GetProfile(player)
	if not profile then
		return 0
	end
	return profile.data.inventory[itemId] or 0
end

return InventoryService
```

Rules of the contract:

1. **Init must not yield and must not call other services.** It only wires references. This makes Init order irrelevant.
2. **Start may yield**, but long work goes in `task.spawn` so one slow service does not block the rest.
3. **Peers come from the registry, not from `require` at the top of the file.** This is what kills circular requires (section 4).

### The bootstrap loader

```luau
--!strict
-- ServerScriptService/Server.server.luau
local ServerScriptService = game:GetService("ServerScriptService")

type Service = {
	Init: ((registry: { [string]: any }) -> ())?,
	Start: (() -> ())?,
}

local registry: { [string]: any } = {}
local ordered: { { name: string, module: Service } } = {}

local function collect(folder: Instance)
	for _, child in folder:GetDescendants() do
		if child:IsA("ModuleScript") and child.Name:match("Service$") then
			local startedAt = os.clock()
			local module = require(child) :: Service
			local elapsed = (os.clock() - startedAt) * 1000
			if elapsed > 50 then
				warn(("[Boot] require %s took %.1f ms"):format(child.Name, elapsed))
			end
			assert(registry[child.Name] == nil, "Duplicate service name: " .. child.Name)
			registry[child.Name] = module
			table.insert(ordered, { name = child.Name, module = module })
		end
	end
end

collect(ServerScriptService.Services)

-- Deterministic order makes bugs reproducible.
table.sort(ordered, function(a, b)
	return a.name < b.name
end)

for _, entry in ordered do
	local init = entry.module.Init
	if init then
		local ok, err = pcall(init, registry)
		if not ok then
			error(("[Boot] %s.Init failed: %s"):format(entry.name, tostring(err)))
		end
	end
end

for _, entry in ordered do
	local start = entry.module.Start
	if start then
		task.spawn(function()
			local ok, err = pcall(start)
			if not ok then
				warn(("[Boot] %s.Start failed: %s"):format(entry.name, tostring(err)))
			end
		end)
	end
end

print(("[Boot] %d services started"):format(#ordered))
```

The client loader is identical, pointed at `Controllers` and matching `Controller$`. An Init failure is fatal on purpose: a server that boots with a broken DataService will corrupt saves. A Start failure is logged so cosmetic systems cannot take the server down.

---

## 3. Dependency direction: the layer rule

Draw your code as layers and only allow arrows **downward**:

```
 Controllers (client)      Services (server)       <- stateful, own things
          \                    /
           \                  /
            Shared/Net (Remotes)                   <- wire format only
                    |
            Shared/Config, Shared/Types            <- data, no logic
                    |
            Shared/Util, Packages                  <- pure functions
```

| From | May require | Must never require |
| --- | --- | --- |
| Util | other Util, Packages | Config, Services, Controllers |
| Config / Types | Types, Util | Services, Controllers, anything with state |
| Net | Types, Config | Services, Controllers |
| Service | Shared/*, ServerLib, peers **via registry** | Controllers, client modules |
| Controller | Shared/*, peers **via registry** | Services (they do not exist on the client) |

Put the table in your repo README and check it in code review. Most "spaghetti" in large Roblox games is a Util module that started requiring a Service "just for one thing".

---

## 4. Circular requires: why they happen and the three fixes

If A requires B and B requires A at the top level, Roblox errors with a message like *"Requested module was required recursively"* and one of them gets nothing. It usually appears at around 30-40 modules, when two services legitimately need each other (Combat needs Inventory for weapon stats; Inventory needs Combat to block equipping mid-attack).

Fixes, best first:

1. **Registry injection (section 2).** Neither file requires the other; both receive each other in `Init`. Circularity disappears because `require` is only called by the loader.
2. **Extract the shared part downward.** If both need `WeaponStats`, move it into `Shared/Config/Weapons.luau`. Most cycles are a missing lower layer.
3. **Events instead of calls.** Inventory fires `ItemEquipped`; Combat listens. The dependency becomes one-way. Use a small typed signal (see [[Signals, Connections and Leak-Proof Cleanup]]).

Avoid "lazy require inside a function" as a fix. It hides the cycle, costs a lookup on every call, and the first call can still fail during startup.

---

## 5. One remotes module

Scattered `Instance.new("RemoteEvent")` calls across 40 files make it impossible to audit what the client can send. Centralise them:

```luau
--!strict
-- ReplicatedStorage/Shared/Net/Remotes.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local EVENT_NAMES = { "BuyItem", "EquipItem", "RequestRespawn", "HitClaim" }
local UNRELIABLE_NAMES = { "AimDirection" }

local folderName = "Remotes"
local folder: Instance

if RunService:IsServer() then
	local f = Instance.new("Folder")
	f.Name = folderName
	for _, name in EVENT_NAMES do
		local r = Instance.new("RemoteEvent")
		r.Name = name
		r.Parent = f
	end
	for _, name in UNRELIABLE_NAMES do
		local r = Instance.new("UnreliableRemoteEvent")
		r.Name = name
		r.Parent = f
	end
	f.Parent = ReplicatedStorage
	folder = f
else
	folder = ReplicatedStorage:WaitForChild(folderName)
end

local Remotes = {}

function Remotes.event(name: string): RemoteEvent
	return folder:WaitForChild(name) :: RemoteEvent
end

function Remotes.unreliable(name: string): UnreliableRemoteEvent
	return folder:WaitForChild(name) :: UnreliableRemoteEvent
end

return Remotes
```

Now a security review is one file: every name in `EVENT_NAMES` must have a validated server handler. Pair this with [[Remote Protocol Versioning]] and [[Remote Rate Limiting Pattern]].

---

## 6. Public API discipline

At scale the real enemy is not bad code inside a module, it is other modules reaching into its internals.

- Keep state in **local variables** inside the module, not in fields on the returned table. `InventoryService.profiles = {}` invites another file to mutate it.
- Export **verbs**, not data: `InventoryService.Grant(player, itemId, n, reason)` instead of letting callers edit counts.
- Require a `reason` string on any function that changes currency or items. It costs nothing and makes your audit log useful ([[Observability and Debug Logging]]).
- Return copies (`table.clone`) or frozen tables (`table.freeze`) when exposing config, so callers cannot mutate shared data by accident.

```luau
-- Shared/Config/Items.luau
local Items = {
	sword_iron = { displayName = "Iron Sword", stackLimit = 1, price = 250 },
	potion_small = { displayName = "Small Potion", stackLimit = 20, price = 15 },
}
for _, def in Items do
	table.freeze(def)
end
return table.freeze(Items)
```

`table.freeze` is shallow, which is why each entry is frozen too. Writes to a frozen table throw immediately, so the bug shows up at the culprit line instead of three systems later.

---

## 7. Size and ownership budgets

These are team conventions, not engine limits, but they work:

- A module over **~600 lines** gets a split discussion in review.
- A service with more than **~8 public functions** probably owns two domains.
- Every service has a one-line ownership comment at the top: what state it owns and who may change it.
- Every feature folder has an owner (a person) listed in the repo README.
- New cross-service calls are flagged in code review. Calls are cheap to add and expensive to remove.

---

## 8. Making it testable

Because modules do nothing at require time and receive peers through `Init`, you can test them with fakes:

```luau
local InventoryService = require(path.to.InventoryService)
InventoryService.Init({
	DataService = {
		GetProfile = function(_player)
			return { data = { inventory = { potion_small = 3 } } }
		end,
	},
})
assert(InventoryService.GetCount(fakePlayer, "potion_small") == 3)
```

No DataStores, no players, no Studio session. See [[Unit Testing Luau with Jest-Lua and TestEZ]] for running this automatically.

---

## Common mistakes

- Dozens of Scripts each doing setup, so load order changes between Studio and live servers.
- Doing work (connecting events, creating instances, yielding) at module top level, so requiring a file for a test starts the game.
- Peers requiring each other at the top level, then "fixing" the cycle with lazy requires.
- A `Util` or `Shared` module that quietly requires a server service.
- Remotes created in many files, so nobody can list what the client is allowed to send.
- Exposing internal tables on the module table "temporarily".
- Calling other services from `Init`, which makes correctness depend on alphabetical order.
- One `GameManager` that grows to 4,000 lines because every feature "just needs one hook".

## Checklist

- [ ] One server Script and one client LocalScript; everything else is a ModuleScript.
- [ ] Every service/controller exposes `Init(registry)` and `Start()`; Init never yields.
- [ ] Peers are obtained from the registry, not top-level `require`.
- [ ] The layer table is in the README and enforced in review.
- [ ] All remotes are created in one module and each has a validated handler.
- [ ] Module state lives in locals; the public table holds functions only.
- [ ] Shared config is frozen.
- [ ] Boot logs slow requires and fails loudly on Init errors.
- [ ] Services can be required and tested with fake peers.

**Related:** [[Scripting - Hub]] · [[Service Controller Reference Architecture]] · [[Service and Controller Boundaries]] · [[Config Feature Flags and Content Data]] · [[Runtime State and FSM Architecture]]
