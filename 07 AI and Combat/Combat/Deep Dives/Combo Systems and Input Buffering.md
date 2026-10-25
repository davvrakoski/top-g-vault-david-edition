---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, combos, input-buffer]
cssclasses: [tg-a07]
---

# Combo Systems and Input Buffering

> **Why this matters:** A combo system without an input buffer feels unresponsive: players press attack slightly early and nothing happens. A combo system without server rules gets auto-clicked into infinite chains.
> The fix is a data-driven attack graph, a short client-side buffer, and a server that validates the chain with its own clock.

---

## 1. Vocabulary (use these words in your data)

| Term | Meaning |
|---|---|
| **Startup** | Wind-up time before the hit can land. |
| **Active** | The hit window (hitbox open). |
| **Recovery** | After the hit; the character is committed. |
| **Combo window** | Part of recovery where the *next* attack in the chain is accepted. |
| **Cancel window** | Where other actions (dodge, block, special) may interrupt recovery. |
| **Buffer** | Remembering an input pressed slightly too early and executing it when it becomes legal. |
| **Chain reset** | Time after the combo window closes when the chain goes back to step 1. |

All of these are **times on the attack clip**. Export them from animation markers so they never drift (see [[Animation Markers for Hit Frames, Footsteps and Sync]]).

## 2. The attack graph as data

Do not hard-code `if comboStep == 1 then ... elseif comboStep == 2`. Describe the graph:

```lua
-- ReplicatedStorage/Shared/Attacks.lua
return {
	Light1 = {
		anim = "Slash1",
		damage = 8,
		startup = 0.12, activeEnd = 0.26, length = 0.62,
		comboOpen = 0.24, comboClose = 0.50,
		cancelOpen = 0.30,            -- dodge/block may cancel from here
		next = { light = "Light2", heavy = "Launcher" },
	},
	Light2 = {
		anim = "Slash2", damage = 9,
		startup = 0.10, activeEnd = 0.24, length = 0.60,
		comboOpen = 0.22, comboClose = 0.48, cancelOpen = 0.28,
		next = { light = "Light3" },
	},
	Light3 = {
		anim = "Slash3", damage = 14,
		startup = 0.16, activeEnd = 0.34, length = 0.95,
		cancelOpen = 0.55,
		next = {},                    -- finisher: chain ends
		endsChain = true,
	},
	Launcher = {
		anim = "Uppercut", damage = 12,
		startup = 0.20, activeEnd = 0.36, length = 0.90,
		next = {},
		endsChain = true,
	},
}
```

Entry points (what plays from neutral) are separate:

```lua
local ENTRY = { light = "Light1", heavy = "HeavyStart" }
```

This structure lets designers tune in one file, lets the server and client share the same rules, and makes branching (light-light-heavy) trivial.

## 3. The input buffer

A buffer stores **one** pending input with a timestamp. When the current state allows that input, it executes and clears. If too much time passes, it expires.

How long? Fighting games commonly buffer somewhere in the 3 to 10 frame range; on Roblox, with network and frame-rate variance, **0.15 to 0.25 s** is a solid starting point. Shorter feels strict, longer feels like the game is acting on its own.

```lua
--!strict
-- ReplicatedStorage/Shared/InputBuffer.lua
local InputBuffer = {}
InputBuffer.__index = InputBuffer

function InputBuffer.new(window: number)
	return setmetatable({ window = window, action = nil :: string?, at = 0 }, InputBuffer)
end

function InputBuffer:Push(action: string)
	self.action = action
	self.at = os.clock()
end

-- Returns the buffered action if still fresh, without consuming it.
function InputBuffer:Peek(): string?
	if self.action and os.clock() - self.at <= self.window then
		return self.action
	end
	self.action = nil
	return nil
end

function InputBuffer:Consume()
	self.action = nil
end

return InputBuffer
```

Only keep the **latest** input. Queuing five clicks produces a character that keeps attacking after the player stopped, which reads as lag.

## 4. Client combo controller

```lua
--!strict
-- StarterPlayerScripts/ComboController.client.lua
local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Attacks = require(ReplicatedStorage.Shared.Attacks)
local InputBuffer = require(ReplicatedStorage.Shared.InputBuffer)
local AttackRemote = ReplicatedStorage.Remotes.Attack :: RemoteEvent

local ENTRY = { light = "Light1", heavy = "Launcher" }
local CHAIN_RESET = 0.35  -- after comboClose (or end), the chain resets

local buffer = InputBuffer.new(0.2)
local anims -- an AnimSet (see the Animator deep dive); assumed set up on CharacterAdded

local current: string? = nil   -- attack name currently playing
local startedAt = 0
local speed = 1
local lastEnded = -math.huge
local lastAttack: string? = nil
local swingCounter = 0

local function elapsed(): number
	return (os.clock() - startedAt) * speed
end

local function canChainNow(input: string): string?
	if not current then
		-- neutral: continue the chain if we recently finished an attack inside its window
		if lastAttack and os.clock() - lastEnded <= CHAIN_RESET then
			local nextName = Attacks[lastAttack].next[input]
			if nextName then return nextName end
		end
		return ENTRY[input]
	end
	local a = Attacks[current]
	local t = elapsed()
	if a.comboOpen and t >= a.comboOpen and t <= (a.comboClose or a.length) then
		return a.next[input]
	end
	return nil
end

local function startAttack(name: string)
	local a = Attacks[name]
	current = name
	startedAt = os.clock()
	swingCounter += 1
	local swingId = swingCounter
	if anims then
		anims:Play(a.anim, 0.04, 1, speed)
	end
	-- the server gets intent + the attack name; it re-validates the chain itself
	AttackRemote:FireServer("start", name, swingId, Workspace:GetServerTimeNow())
end

local function onInput(actionName: string, state: Enum.UserInputState)
	if state ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	buffer:Push(if actionName == "AttackLight" then "light" else "heavy")
	return Enum.ContextActionResult.Sink
end

ContextActionService:BindAction("AttackLight", onInput, true, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2)
ContextActionService:BindAction("AttackHeavy", onInput, true, Enum.UserInputType.MouseButton2, Enum.KeyCode.ButtonR1)

RunService.Heartbeat:Connect(function()
	-- end of current attack
	if current and elapsed() >= Attacks[current].length then
		lastAttack = if Attacks[current].endsChain then nil else current
		lastEnded = os.clock()
		current = nil
	end
	-- try to execute buffered input
	local pending = buffer:Peek()
	if pending then
		local nextName = canChainNow(pending)
		if nextName then
			buffer:Consume()
			startAttack(nextName)
		end
	end
end)
```

Notes:

- The buffer is checked **every frame**, so an early press fires on the first legal frame of the combo window. That is what makes it feel tight.
- `ContextActionService:BindAction` with `true` creates a touch button on mobile. The newer Input Action System (`InputContext` / `InputAction` / `InputBinding`, with `InputAction.Pressed`) is a valid alternative for new projects; the buffer logic is identical.
- `speed` scales all windows so attack-speed buffs keep client and server in agreement.

## 5. Server validation

The server keeps its **own** combo state per player and never trusts the client's idea of "I'm on step 3".

```lua
--!strict
-- ServerScriptService/Combat/ComboServer.server.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Attacks = require(ReplicatedStorage.Shared.Attacks)

local AttackRemote = ReplicatedStorage.Remotes.Attack :: RemoteEvent
local ENTRY = { Light1 = true, Launcher = true }
local CHAIN_RESET = 0.35
local EARLY_GRACE = 0.08     -- allow requests a little before comboOpen (latency/jitter)

type State = { current: string?, startedAt: number, lastAttack: string?, lastEnded: number, speed: number }
local states: { [Player]: State } = {}

local function legalNext(s: State, name: string, now: number): boolean
	if not Attacks[name] then return false end
	if s.current then
		local a = Attacks[s.current]
		local t = (now - s.startedAt) * s.speed
		if t >= a.length then
			-- previous attack finished on the server clock; treat as neutral
			s.lastAttack = if a.endsChain then nil else s.current
			s.lastEnded = s.startedAt + a.length / s.speed
			s.current = nil
		else
			local open = (a.comboOpen or math.huge) - EARLY_GRACE
			local close = a.comboClose or a.length
			if t < open or t > close then return false end
			for _, n in a.next do
				if n == name then return true end
			end
			return false
		end
	end
	-- neutral
	if ENTRY[name] then return true end
	if s.lastAttack and now - s.lastEnded <= CHAIN_RESET then
		for _, n in Attacks[s.lastAttack].next do
			if n == name then return true end
		end
	end
	return false
end

AttackRemote.OnServerEvent:Connect(function(player, kind: unknown, name: unknown, swingId: unknown)
	if kind ~= "start" or typeof(name) ~= "string" or typeof(swingId) ~= "number" then return end
	local s = states[player]
	if not s then
		s = { current = nil, startedAt = 0, lastAttack = nil, lastEnded = -math.huge, speed = 1 }
		states[player] = s
	end
	local now = Workspace:GetServerTimeNow()
	if not legalNext(s, name, now) then
		-- reject silently or tell the client to resync its combo state
		return
	end
	s.current = name
	s.startedAt = now
	-- schedule the server-side active window, hit validation, damage...
end)

game:GetService("Players").PlayerRemoving:Connect(function(p) states[p] = nil end)
```

Key ideas:

- The server uses **server receive time** as the attack start. Combined with `EARLY_GRACE`, this tolerates jitter without letting a macro skip startup frames.
- Stun or hit reactions must set `s.current = nil` and block attacks until stun ends (see [[Hitstun, I-Frames, Poise and Super Armor]]).
- If you reject, consider sending a small "resync" message so the client stops its predicted animation; otherwise the player sees an attack that never deals damage.

## 6. Cancels

Cancels are just more edges in the graph that are legal in `cancelOpen..length`:

```lua
local CANCELS = { dodge = true, block = true }
local function canCancel(attack, t, action)
	return attack.cancelOpen ~= nil and t >= attack.cancelOpen and CANCELS[action] == true
end
```

Dodge-cancel and block-cancel windows are where most of a combat system's "feel" lives. Put them in data and tune them in playtests with the worksheet in [[Combat Feel Tuning Worksheet]].

## 7. Anti-macro and fairness

- **Rate limits per attack**, not just per remote: the server rejects a `Light1` started 0.05 s after the previous `Light1`.
- **No infinite chains:** finishers set `endsChain = true`; neutral re-entry requires the chain reset to pass.
- **Hit confirm is separate from attack start.** Starting an attack is cheap; dealing damage requires the hit validation path ([[Server Melee Validation]]).
- Record per-player rejection counts. Legit players rarely exceed a few per minute; macros spike.

## Common mistakes

- Queuing every click, so the character keeps swinging after the player stops.
- Combo windows hard-coded in scripts instead of exported from clips.
- Client tells the server "I am on step 3"; server believes it.
- No early grace on the server, so laggy players' perfectly timed inputs get rejected.
- Grace so large that startup frames can be skipped.
- Attack-speed buffs scaling the animation but not the windows.
- Forgetting to clear combo state on stun, death or weapon swap.

## Checklist

- [ ] Attack graph in a shared data module (startup, active, combo, cancel, next).
- [ ] Single-slot input buffer, 0.15 to 0.25 s window, checked every frame.
- [ ] Client plays predicted animation immediately on a legal input.
- [ ] Server validates chain edges and timing with its own clock and capped grace.
- [ ] Finishers end chains; chain reset time enforced.
- [ ] Stun, death and weapon swap clear combo state on both sides.
- [ ] Rejections logged per player.

---

**Related:** [[Combat - Hub]] · [[Melee Combo Blueprint]] · [[Combat Feel Tuning Worksheet]] · [[Server Melee Validation]] · [[Finite State Machine]] · [[Rate Limiter]]
