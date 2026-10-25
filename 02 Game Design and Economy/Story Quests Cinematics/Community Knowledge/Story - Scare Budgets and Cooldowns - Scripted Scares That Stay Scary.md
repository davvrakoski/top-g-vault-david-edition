---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Scare Budgets and Cooldowns - Scripted Scares That Stay Scary"
tags: [roblox, community-knowledge, story, horror, jump-scare, pacing]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gamedeveloper.com/design/the-time-and-place-for-jump-scares-according-to-horror-devs
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
  - https://create.roblox.com/docs/reference/engine/classes/Players
---
# Scare Budgets and Cooldowns - Scripted Scares That Stay Scary

Most Roblox horror games ship dozens of small scripted scares: a door slams, a face flashes in a window, lights burst. Each one works the first time. Fired back to back they turn into noise, and players start laughing instead. Horror developers interviewed for Game Developer (2018) agreed the **lead-up matters more than the scream**. Alien: Isolation's lead writer Dion Lay compared jump scares to a little spice on the main course, and Red Barrels' Philippe Morin said a good jump scare is mostly about what comes before it. This note turns that advice into a system: every scare costs budget, has a cooldown, and only fires when the player is ready to be scared.

## Three kinds of scare (cost them differently)

| Type | Example | Cost | Notes |
|---|---|---|---|
| Ambient | distant bang, light flicker, whisper | 1 | Builds dread; can be frequent |
| Startle | object falls next to player, door slams | 3 | Needs a quiet moment before it |
| Jump scare | monster face, loud sting | 8 | Rare; save for story beats |

Lay also pointed out a useful trick: a **fake-out** (the cat in the cupboard) tells players they can relax for a moment, which resets their nerves for the real thing.

## The budget model

- Each player has a **scare budget** that refills slowly (for example 1 point every 20 seconds, capped at 10).
- A scare fires only if the player can afford it **and** its own cooldown has expired **and** the global "last big scare" timer is at least 90 seconds old.
- If the tension director is in Relax, only ambient scares are allowed ([[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]]).

```lua
-- ReplicatedStorage/ScareBudget (used on the server)
local ScareBudget = {}
local REFILL_EVERY, CAP = 20, 10
local state = {} -- [player] = {points, lastRefill, cooldowns = {}}

function ScareBudget.tryFire(player, scareId, cost, cooldown)
	local s = state[player]
	if not s then
		s = {points = CAP, lastRefill = os.clock(), cooldowns = {}}
		state[player] = s
	end
	local now = os.clock()
	local gained = math.floor((now - s.lastRefill) / REFILL_EVERY)
	if gained > 0 then
		s.points = math.min(CAP, s.points + gained)
		s.lastRefill += gained * REFILL_EVERY
	end
	if s.points < cost then return false end
	if (s.cooldowns[scareId] or 0) > now then return false end
	s.points -= cost
	s.cooldowns[scareId] = now + cooldown
	return true
end

return ScareBudget
```

Clear `state[player]` on `Players.PlayerRemoving` to avoid a leak.

## Who sees the scare

- **Personal scares** (a face in *your* mirror) play on one client. The server decides and fires a RemoteEvent to that player; the client plays the sound and effect locally. Others nearby see nothing, which makes the victim doubt themselves later.
- **Shared scares** (the lights die for everyone) change real world state on the server so late arrivals see the result.
- In co-op, give the scare to the player **at the back** or the one **alone**. Groups huddle and chatter; isolated players are the ones who get scared.

## Making each scare land

1. **Quiet first.** Drop ambient volume a few seconds before a startle. Silence is the wind-up.
2. **Look direction.** Check the camera can see the scare: the dot product of `Camera.CFrame.LookVector` and the direction to the scare should be above about 0.6. A jump scare behind the player is wasted budget.
3. **One per room.** Mark each scare as one-shot per player per run (store the ids in a set).
4. **Vary the timing.** Randomize the delay after a trigger by 0.5-3 s so speedrunners and repeat players cannot pre-flinch.
5. **Never block progress with a scare.** The player must keep control unless it is a cutscene.

## Pitfalls

- **Scare stacking.** Two scripts both fire on the same trigger. Route everything through one budget module.
- **Loud stings.** Keep jump-scare stings within your normal peak loudness; no sudden extra volume. See [[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]].
- **Scares during death or respawn.** Disable the system while the player is dead or in a menu.
- **Content label.** Jump scares count as fear content in the Roblox maturity questionnaire.

## Related
[[Story Quests Cinematics - Hub]] · [[Horror Starter Architecture]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Environmental Storytelling - What Happened Here]]
