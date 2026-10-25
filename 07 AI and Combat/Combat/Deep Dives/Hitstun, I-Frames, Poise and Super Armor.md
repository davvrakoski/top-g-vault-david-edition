---
area: "07 AI and Combat"
cluster: "Combat"
tags: [deep-dive, roblox, combat, stun, iframes, poise]
cssclasses: [tg-a07]
---

# Hitstun, I-Frames, Poise and Super Armor

> **Why this matters:** Stun is what turns "two people clicking" into a fighting game: it creates openings, punishes and combos. Done badly it creates stunlock, unblockable infinites and "I dodged but still got hit".
> One server-owned defensive state model, with timestamps instead of `task.wait` chains, solves all of these at once.

---

## 1. The defensive states

| State | Player experience | Server effect |
|---|---|---|
| **Hitstun** | Flinch; cannot act briefly | Attacks/dodge rejected until `stunUntil` |
| **Blockstun** | Pushed back while blocking | Can block, cannot attack until `blockstunUntil` |
| **Knockdown** | On the ground | Cannot act; often invulnerable to extra hits (OTG rules) |
| **I-frames (invulnerable)** | Dodge roll, get-up, cutscene | Incoming hits ignored until `invulnUntil` |
| **Super armor** | Attack does not flinch | Hits deal damage but do not apply hitstun |
| **Poise / stagger meter** | Heavy enemies take several hits before flinching | Hitstun only applies when poise breaks |
| **Guard break** | Block shattered | Long stun after block meter empties |

Everything is a **time window on the server clock**. No coroutines that "wait 0.4 and unstun": those desync, stack, and survive death.

## 2. One state record per combatant

```lua
--!strict
-- ServerScriptService/Combat/Defense.lua
local Workspace = game:GetService("Workspace")

local Defense = {}

export type DefState = {
	stunUntil: number,
	blockstunUntil: number,
	invulnUntil: number,
	armorUntil: number,         -- super armor window (from the attacker's own move data)
	knockdownUntil: number,
	poise: number,
	maxPoise: number,
	poiseRegenPerSec: number,
	poiseRegenDelay: number,     -- seconds after last poise damage before regen
	lastPoiseHit: number,
	blocking: boolean,
	guard: number,               -- block meter
	maxGuard: number,
	recentStuns: { number },     -- timestamps for diminishing returns
}

local states: { [Model]: DefState } = {}

function Defense.get(model: Model): DefState
	local s = states[model]
	if not s then
		s = {
			stunUntil = 0, blockstunUntil = 0, invulnUntil = 0, armorUntil = 0, knockdownUntil = 0,
			poise = 30, maxPoise = 30, poiseRegenPerSec = 15, poiseRegenDelay = 1.5, lastPoiseHit = 0,
			blocking = false, guard = 100, maxGuard = 100,
			recentStuns = {},
		}
		states[model] = s
		model.Destroying:Once(function() states[model] = nil end)
	end
	return s
end

function Defense.now(): number
	return Workspace:GetServerTimeNow()
end

function Defense.canAct(model: Model): boolean
	local s = Defense.get(model)
	local t = Defense.now()
	return t >= s.stunUntil and t >= s.knockdownUntil and t >= s.blockstunUntil
end

function Defense.isInvulnerable(model: Model): boolean
	return Defense.now() < Defense.get(model).invulnUntil
end

return Defense
```

Store only timestamps and numbers. Anything that needs to show on clients (stun bars, armor glow) is mirrored to attributes on the model, which replicate automatically:

```lua
model:SetAttribute("StunUntil", s.stunUntil) -- clients compare with workspace:GetServerTimeNow()
```

## 3. Applying a hit: the order matters

```lua
--!strict
-- ServerScriptService/Combat/ApplyHit.lua
local Defense = require(script.Parent.Defense)

export type HitData = {
	damage: number,
	hitstun: number,       -- seconds
	blockstun: number,
	poiseDamage: number,
	guardDamage: number,
	knockdown: number?,    -- seconds if this move knocks down
	unblockable: boolean?,
}

local DR_WINDOW = 3.0      -- seconds to look back for diminishing returns
local DR_STEP = 0.2        -- each recent stun reduces new hitstun by 20%
local DR_MIN = 0.4         -- never below 40% of base hitstun

local function pruneRecent(s: Defense.DefState, now: number)
	local kept = {}
	for _, t in s.recentStuns do
		if now - t <= DR_WINDOW then table.insert(kept, t) end
	end
	s.recentStuns = kept
end

-- Returns a result string for logging/feedback: "invuln", "blocked", "armored", "stunned", "poise", "knockdown"
local function applyHit(attacker: Model, victim: Model, hit: HitData): string
	local s = Defense.get(victim)
	local now = Defense.now()
	local humanoid = victim:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return "dead" end

	-- 1. invulnerability first: nothing else happens
	if now < s.invulnUntil then
		return "invuln"
	end

	-- 2. knocked-down targets: ignore follow-ups (prevents OTG infinites)
	if now < s.knockdownUntil then
		return "invuln"
	end

	-- 3. blocking (facing check belongs here: block only from the front)
	if s.blocking and not hit.unblockable then
		s.guard -= hit.guardDamage
		if s.guard <= 0 then
			s.guard = s.maxGuard
			s.blocking = false
			s.stunUntil = now + 1.2           -- guard break
			victim:SetAttribute("StunUntil", s.stunUntil)
			return "guardbreak"
		end
		s.blockstunUntil = math.max(s.blockstunUntil, now + hit.blockstun)
		humanoid:TakeDamage(hit.damage * 0.1) -- chip damage (design choice)
		return "blocked"
	end

	-- 4. damage always applies past this point
	humanoid:TakeDamage(hit.damage)

	-- 5. super armor: damage, no stun
	if now < s.armorUntil then
		return "armored"
	end

	-- 6. knockdown moves
	if hit.knockdown then
		s.knockdownUntil = now + hit.knockdown
		s.invulnUntil = s.knockdownUntil + 0.3     -- get-up i-frames
		s.stunUntil = 0
		victim:SetAttribute("KnockdownUntil", s.knockdownUntil)
		return "knockdown"
	end

	-- 7. poise: regenerate, then subtract
	if now - s.lastPoiseHit > s.poiseRegenDelay then
		local regenTime = now - s.lastPoiseHit - s.poiseRegenDelay
		s.poise = math.min(s.maxPoise, s.poise + regenTime * s.poiseRegenPerSec)
	end
	s.lastPoiseHit = now
	s.poise -= hit.poiseDamage
	if s.poise > 0 then
		return "poise" -- took damage, no flinch
	end
	s.poise = s.maxPoise

	-- 8. hitstun with diminishing returns
	pruneRecent(s, now)
	local scale = math.max(DR_MIN, 1 - DR_STEP * #s.recentStuns)
	table.insert(s.recentStuns, now)
	s.stunUntil = math.max(s.stunUntil, now + hit.hitstun * scale)
	victim:SetAttribute("StunUntil", s.stunUntil)
	return "stunned"
end

return applyHit
```

Why this order:

1. **I-frames beat everything.** If the dodge was valid on the server, the hit does not exist.
2. **Knockdown protection** stops "hit them while they're down forever".
3. **Block** before damage, because blocked hits deal chip or nothing.
4. **Armor** after damage: armor means "I still get hurt, I just don't flinch".
5. **Poise** before hitstun so big enemies need several hits to flinch.
6. **Diminishing returns** last, so long chains lose stun and the victim eventually escapes. `math.max(s.stunUntil, ...)` prevents a short hit from *shortening* an existing long stun.

## 4. I-frames that respect latency

Dodges are the most contested mechanic: "I rolled on my screen!".

- The client plays the roll instantly and sends `dodge` with `GetServerTimeNow()`.
- The server accepts the dodge if the player can act, and sets `invulnUntil = receiveTime + IFRAME_DURATION`.
- Optionally backdate the start a little: `start = math.max(receiveTime - DODGE_BACKDATE, lastHitTime)` with `DODGE_BACKDATE` around 0.05 to 0.1 s, so a hit that the server processed a few milliseconds before the dodge arrived can still be forgiven. Cap it tightly; generous backdating makes dodges feel like cheats from the other side.

Typical i-frame windows in action games are a fraction of the roll (for example 0.2 to 0.35 s of a 0.6 s roll). Put the number in data and tune it.

## 5. Making stun actually stop the character

Timestamps on the server decide legality. You still need movement to stop.

```lua
-- Server: movement lock driven by stun windows. Run on Heartbeat for active combatants only.
local RunService = game:GetService("RunService")
local Defense = require(script.Parent.Defense)

local BASE_SPEED = 16
local tracked: { [Model]: Humanoid } = {}

RunService.Heartbeat:Connect(function()
	for model, humanoid in tracked do
		local locked = not Defense.canAct(model)
		local want = if locked then 0 else BASE_SPEED
		if humanoid.WalkSpeed ~= want then
			humanoid.WalkSpeed = want
		end
		humanoid.AutoRotate = not locked
	end
end)
```

For player characters, `WalkSpeed` set on the server replicates to the owning client and applies there, with a little latency. For snappier feel, also apply the lock on the client when it receives the `StunUntil` attribute change. If you have several systems changing speed (stun, slow, sprint), use a modifier stack instead of writing `WalkSpeed` from many places; see [[Status Effect Container]].

Animation side: the client sees `StunUntil` change, plays the `Action3` stun loop until the time passes. Priority ladder in [[Animator Priorities, Weights and Blending Done Right]].

## 6. Tuning numbers (starting points, not rules)

| Parameter | Fast anime fighter | Souls-like | Brawler / beat 'em up |
|---|---|---|---|
| Light hitstun | 0.3 to 0.45 s | 0.2 to 0.3 s | 0.35 s |
| Heavy hitstun | 0.6 to 0.8 s | 0.5 s | 0.7 s |
| Blockstun | 0.15 to 0.25 s | 0.2 s | 0.2 s |
| Dodge i-frames | 0.25 s | 0.2 to 0.35 s | 0.2 s |
| Player poise | 0 (always flinch) | 20 to 40 | 0 |
| Elite enemy poise | 40 | 60 to 120 | 50 |
| Diminishing returns | -20% per stun in 3 s | none (poise does the job) | -15% |

The rule that matters most: **hitstun of a combo starter must be longer than the startup of the follow-up plus network jitter**, or combos drop at real ping. If `Light2` startup is 0.10 s, `Light1` hitstun under ~0.3 s will make the combo unreliable above ~100 ms ping.

## 7. Combo breakers and stunlock prevention

Players hate being juggled with no input. Options, in order of simplicity:

1. **Diminishing returns** (above).
2. **Hard cap:** after N consecutive stuns within T seconds, grant 0.5 s of i-frames.
3. **Burst/breaker:** a cooldown ability usable during stun that knocks attackers back. Server checks it is off cooldown and the player is stunned.
4. **Gravity scaling for juggles:** each air hit reduces float time.

## Common mistakes

- `task.wait(stunTime)` then "unstun", stacking with new stuns and surviving death.
- Applying stun on the client and trusting it.
- Super armor that also blocks damage (that is invulnerability, call it that).
- Hitstun shorter than the next attack's startup at real latency.
- Dodge i-frames with unlimited backdating.
- Several scripts writing `WalkSpeed` directly and fighting each other.
- No knockdown protection, enabling ground infinites.
- Forgetting to clear block/stun state on respawn.

## Checklist

- [ ] One server-side defensive record per combatant, timestamps only.
- [ ] Hit application order: invuln > knockdown > block > damage > armor > poise > stun.
- [ ] Diminishing returns or a stunlock cap.
- [ ] Dodge i-frames from server time with a small capped backdate.
- [ ] Stun windows mirrored to attributes for client animation/UI.
- [ ] Movement locks via a modifier stack.
- [ ] Hitstun vs next-startup checked at 150 ms simulated ping.
- [ ] Results ("blocked", "armored", "stunned") logged and shown as feedback.

---

**Related:** [[Combat - Hub]] · [[Damage and Status Effects Blueprint]] · [[Status Effect Container]] · [[Ability and Status Framework]] · [[Combat Feel Tuning Worksheet]] · [[Combo Systems and Input Buffering]]
