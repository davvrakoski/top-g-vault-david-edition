---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Luau Strict Mode and Type Checking in Practice"
tags: [deep-dive, roblox, luau, type-checking, strict-mode]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Luau Strict Mode and Type Checking in Practice

**Why this matters:** most Roblox bugs that reach players are "this was nil" or "this was the wrong shape" bugs, and the Luau type checker catches a large share of them before you press Play.
Strict mode is free at runtime (types are erased), so the only cost is learning how to annotate the awkward parts: instances, remotes, metatables and modules.

---

## 1. The three modes, and what each one actually does

Every script picks its mode with a comment on the **first line**:

| Pragma | Behaviour | When to use |
| --- | --- | --- |
| `--!nocheck` | No type errors reported at all. | Generated code, vendored third-party code you will not edit. |
| `--!nonstrict` | Only checks things you explicitly annotate; unknown things become `any`. | Default for old scripts. A safe first step. |
| `--!strict` | Infers a type for everything and reports every mismatch, including unannotated code. | All new shared modules, all server systems. |

Important facts that trip people up:

- Type checking happens in Studio's Script Analysis (and in external tools like `luau-lsp`). **It never stops a script from running.** A strict file with red underlines still runs exactly the same.
- Types are erased at runtime. `x :: number` does not convert or check anything when the game runs. You still need runtime validation for anything that comes from a client.
- Type annotations on function parameters do help **native code generation** pick fast paths (see [[Script Profiler, Native Code Gen and Luau Hot Paths]]), so annotations are not purely cosmetic on the server.
- Roblox has been rolling out Luau's **new type solver** (exposed as a Studio Beta Feature during 2025). It infers more precisely and some error messages differ. As of 2026, check the Luau and Roblox docs for its current status before you standardise on solver-specific tricks; everything in this note works under both.

---

## 2. Rollout plan for an existing game

Turning on `--!strict` everywhere at once produces hundreds of errors and teams give up. Do it in this order instead:

1. **Shared type modules first.** Create `ReplicatedStorage/Shared/Types.luau` holding your data shapes (player save, item definition, remote payloads). Strict, no logic.
2. **Leaf utility modules** (math, tables, formatting, retry helpers). They have few dependencies and are easy wins.
3. **Server services** that own data (inventory, currency, save). These are where nil bugs cost real money.
4. **Client controllers and UI** last. They touch the most instances and need the most casts.
5. Add a lint gate: a CI step (luau-lsp `analyze` or your team's chosen checker) that fails if a file marked `--!strict` gains new errors. See [[Unit Testing Luau with Jest-Lua and TestEZ]] for wiring a CI job and [[Git, Github, Rojo and Team Workflow]] for the file-based setup it needs.

Rule of thumb: a file is "done" when it is strict with zero errors and contains no `:: any` casts except at clearly commented boundaries.

---

## 3. Data shapes: `type` and `export type`

```luau
--!strict
-- ReplicatedStorage/Shared/Types.luau

export type Rarity = "Common" | "Rare" | "Epic" | "Legendary"

export type ItemDefinition = {
	id: string,
	displayName: string,
	rarity: Rarity,
	stackLimit: number,
	price: number?, -- optional: nil means "not for sale"
}

export type SaveData = {
	schemaVersion: number,
	coins: number,
	level: number,
	inventory: { [string]: number }, -- itemId -> count
	settings: {
		musicVolume: number,
		showDamageNumbers: boolean,
	},
}

return {}
```

Using it elsewhere:

```luau
--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Types = require(ReplicatedStorage.Shared.Types)

local function defaultSave(): Types.SaveData
	return {
		schemaVersion = 3,
		coins = 0,
		level = 1,
		inventory = {},
		settings = { musicVolume = 0.5, showDamageNumbers = true },
	}
end
```

If someone later adds a field to `SaveData` and forgets to add it to `defaultSave`, strict mode flags the missing field. That single check prevents a whole class of "new players have nil coins" bugs.

**Literal unions** (`"Common" | "Rare"`) are the cheapest high-value type you can write. Typos such as `"Legendery"` become errors.

---

## 4. Typing a metatable class

This is the pattern that works reliably with both solvers:

```luau
--!strict
local Types = require(script.Parent.Types)

local Inventory = {}
Inventory.__index = Inventory

type InventoryFields = {
	owner: Player,
	capacity: number,
	counts: { [string]: number },
}

export type Inventory = typeof(setmetatable({} :: InventoryFields, Inventory))

function Inventory.new(owner: Player, capacity: number): Inventory
	local fields: InventoryFields = {
		owner = owner,
		capacity = capacity,
		counts = {},
	}
	return setmetatable(fields, Inventory)
end

function Inventory.add(self: Inventory, def: Types.ItemDefinition, amount: number): boolean
	local current = self.counts[def.id] or 0
	if current + amount > def.stackLimit then
		return false
	end
	self.counts[def.id] = current + amount
	return true
end

function Inventory.count(self: Inventory, itemId: string): number
	return self.counts[itemId] or 0
end

return Inventory
```

Why `function Inventory.add(self: Inventory, ...)` instead of `function Inventory:add(...)`: with the colon form, `self` is inferred and often ends up too loose. Writing `self` explicitly gives callers (`inv:add(def, 1)`) full checking and autocomplete. Call sites can still use the colon.

---

## 5. Instances: casts, `IsA` narrowing and `FindFirstChild`

Instance APIs return broad types. `FindFirstChild` returns `Instance?`, `WaitForChild` returns `Instance`. You must narrow before using class-specific members.

```luau
--!strict
local Players = game:GetService("Players")

local function getRootPart(player: Player): BasePart?
	local character = player.Character
	if not character then
		return nil
	end
	local root = character:FindFirstChild("HumanoidRootPart")
	if root and root:IsA("BasePart") then
		return root -- narrowed to BasePart by IsA
	end
	return nil
end

local function getHumanoid(character: Model): Humanoid?
	return character:FindFirstChildOfClass("Humanoid") -- already typed Humanoid?
end
```

Three tools, in order of preference:

1. **`IsA` checks** narrow safely and also protect you at runtime.
2. **`FindFirstChildOfClass` / `FindFirstChildWhichIsA`** return the right type directly.
3. **Casts** (`script.Parent :: Model`) when you are certain by construction. A cast is a promise you are making to the checker; break it and you get a runtime error later, not a type error now.

Casting rules worth knowing: a cast is allowed when one type is a subtype of the other, so `instance :: Part` is fine but `5 :: string` is an error. Casting to `any` always works and silences everything, which is why it should be rare and commented.

---

## 6. Client payloads are `unknown`, not your nice type

The single most important strict-mode habit for security: **never annotate a remote handler parameter with your payload type**. The client controls those bytes. Annotate as `unknown` and narrow with runtime checks so the type checker forces you to validate.

```luau
--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyRemote = ReplicatedStorage.Remotes.BuyItem :: RemoteEvent

type BuyRequest = { itemId: string, quantity: number }

local function parseBuyRequest(payload: unknown): BuyRequest?
	if typeof(payload) ~= "table" then
		return nil
	end
	local t = payload :: { [any]: any }
	local itemId = t.itemId
	local quantity = t.quantity
	if typeof(itemId) ~= "string" or #itemId == 0 or #itemId > 40 then
		return nil
	end
	if typeof(quantity) ~= "number" or quantity ~= quantity -- NaN check
		or quantity < 1 or quantity > 99 or quantity % 1 ~= 0 then
		return nil
	end
	return { itemId = itemId, quantity = quantity }
end

buyRemote.OnServerEvent:Connect(function(player: Player, payload: unknown)
	local request = parseBuyRequest(payload)
	if not request then
		return -- drop silently or count toward an abuse score
	end
	-- From here on, request is a real BuyRequest.
end)
```

The cast `payload :: { [any]: any }` is the one deliberate boundary cast, placed directly after the `typeof` check that justifies it. See [[Remote Payload Validation]] and [[Remote Type and Allowlist Validation]] for the full validation checklist.

---

## 7. Generics, function types and optional returns

```luau
--!strict
export type Result<T> = { ok: true, value: T } | { ok: false, err: string }

local function retry<T>(attempts: number, fn: () -> T): Result<T>
	local lastErr = "no attempts"
	for attempt = 1, attempts do
		local ok, valueOrErr = pcall(fn)
		if ok then
			return { ok = true, value = valueOrErr }
		end
		lastErr = tostring(valueOrErr)
		task.wait(math.min(2 ^ attempt, 16))
	end
	return { ok = false, err = lastErr }
end

local result = retry(3, function(): number
	return 42
end)
if result.ok then
	print(result.value + 1) -- value is number here
else
	warn(result.err)
end
```

The tagged union (`ok: true` / `ok: false`) lets the checker narrow on `result.ok`. This is cleaner than returning `(boolean, T?)` because you cannot forget the nil check.

---

## 8. Reading the error messages

| Message (paraphrased) | What it usually means | Fix |
| --- | --- | --- |
| Type `Instance` could not be converted into `BasePart` | You used a broad instance as a specific class. | `IsA` check or `FindFirstChildOfClass`. |
| Value of type `X?` could be nil | Optional not narrowed. | `if x then`, `assert(x)`, or early return. |
| Key `foo` not found in table `T` | Typo, or field missing from the type. | Fix the name or add the field to the type. |
| Unknown global `x` | Missing `local`, or a typo. | Strict mode catches accidental globals; declare it. |
| Not all codepaths return a value | A function typed to return `T` can fall off the end. | Add a final return or make it `T?`. |
| Type pack mismatch | Wrong number of arguments or returns. | Check the signature; variadics need `...T`. |

---

## 9. Tooling outside Studio

If your team edits in VS Code via Rojo, `luau-lsp` gives the same checking plus completion. It needs a **sourcemap** (`rojo sourcemap`) to know that `ReplicatedStorage.Shared.Types` is a real path. Without the sourcemap, every `require` of an instance path becomes `any` and strict mode silently weakens. See [[Git, Github, Rojo and Team Workflow]] and [[Script Sync vs Rojo — 2026 Decision Guide]].

---

## Common mistakes

- Annotating remote handler parameters with the "expected" type instead of `unknown`, then skipping validation because the checker is happy.
- Sprinkling `:: any` to make red lines go away; one `any` spreads through every value derived from it.
- Believing strict mode protects at runtime. It does not; types are erased.
- Putting `--!strict` on line 2 under another comment. The pragma must be the first line.
- Typing `self` implicitly in metatable classes, so method calls lose checking.
- Requiring modules by string paths built at runtime (`require(folder[name])`): the checker cannot follow them and returns `any`.
- Leaving the shared `Types` module non-strict, which weakens every file that imports it.
- Using `WaitForChild` results as specific classes without a cast or `IsA` check.

## Checklist

- [ ] Every new ModuleScript starts with `--!strict`.
- [ ] Shared data shapes live in one strict `Types` module with `export type`.
- [ ] Remote handlers take `unknown` and return a validated typed value or nil.
- [ ] Metatable classes use the `typeof(setmetatable({} :: Fields, Class))` pattern with explicit `self`.
- [ ] Every `:: any` cast has a comment explaining the boundary.
- [ ] Literal unions are used for states, rarities, modes and other fixed string sets.
- [ ] External editor setup generates a Rojo sourcemap so requires resolve.
- [ ] CI or a pre-publish check reports new type errors in strict files.

**Related:** [[Scripting - Hub]] · [[Luau Programming]] · [[Practical Luau Pattern Library]] · [[Remote Payload Validation]] · [[Service Controller Reference Architecture]]
