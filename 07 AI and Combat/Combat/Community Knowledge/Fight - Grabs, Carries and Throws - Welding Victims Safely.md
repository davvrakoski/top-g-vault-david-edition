---
area: "07 AI and Combat"
cluster: "Combat"
title: "Grabs, Carries and Throws - Welding Victims Safely"
tags: [roblox, community-knowledge, combat, grab, throw, carry, network-ownership]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/best-way-to-code-a-grab/803022
  - https://devforum.roblox.com/t/carrying-a-playernpc/277025
  - https://devforum.roblox.com/t/network-ownership-stolen-by-player/2809860
  - https://devforum.roblox.com/t/issues-with-a-grab-skill/3678608
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#PlatformStand
  - https://create.roblox.com/docs/reference/engine/classes/BasePart#SetNetworkOwner
---
# Grabs, Carries and Throws - Welding Victims Safely

Grab moves (command grabs, carry-to-execute, picking up a downed teammate, throwing an enemy into a wall) are some of the most satisfying moves in battlegrounds and brawlers, and some of the most bug-prone on Roblox. Two characters become one physics assembly, network ownership moves, and the victim's Humanoid fights the weld. DevForum threads collect the working recipes and the traps.

## How the engine sees a grab

When you weld the victim's `HumanoidRootPart` to the grabber, both characters become **one assembly**. Roblox gives one network owner per assembly, so the victim's physics is now simulated by whoever owns the grabber (usually the grabber's client). A DevForum thread on "ownership stolen by player" shows the symptom: after welding, the grabbed player seems to take control of the other character. Plan ownership explicitly.

## Recipe (server-side)

1. **Validate**: grabber not stunned, victim in range and in front (dot product), victim not already grabbed, not in i-frames, not blocking if your design says grabs beat block.
2. **Disable victim control**: set `Humanoid.PlatformStand = true`, or `ChangeState(Enum.HumanoidStateType.Physics)`. The forum notes the Physics state lets the body respond to physics and must be ended explicitly; switching to `GettingUp` afterwards is common.
3. **Turn off collisions** between the two characters (a collision group pair, or `CanCollide = false` on the victim's limbs).
4. **Position, then weld**: set the victim's root CFrame to the grab offset (for example 3 studs in front, facing the grabber), then create a `WeldConstraint` (or a `Weld` with C0 for a precise offset) from the server.
5. **Mark state**: tags/attributes `Grabbed`, `GrabbedBy` so abilities and other grabs are blocked.
6. **Release on every exit path**: timer expiry, throw, grabber stunned, grabber dies, victim dies, either player leaves. Use one `release()` function connected to all of them.

```lua
local function release(victim: Model, grabber: Model, throwVel: Vector3?)
	local weld = victim:FindFirstChild("GrabWeld", true)
	if weld then weld:Destroy() end
	local hum = victim:FindFirstChildOfClass("Humanoid")
	local root = victim:FindFirstChild("HumanoidRootPart") :: BasePart
	if hum then hum.PlatformStand = false end
	victim:SetAttribute("Grabbed", nil)
	if root then
		local owner = game.Players:GetPlayerFromCharacter(victim)
		if root:CanSetNetworkOwnership() then root:SetNetworkOwner(owner) end -- give the victim back its body (nil for NPCs = server)
		if throwVel then root:ApplyImpulse(throwVel * root.AssemblyMass) end
	end
end
```

A forum poster found throws worked on dummies but not players until ownership was restored **after** removing the weld, which is why the order above is weld off, ownership back, then impulse. For players, an impulse applied on the server may be overridden by the victim's client; if throws feel weak, fire the impulse to the victim's client too (see the knockback note).

## Throw tech and counterplay (fighting-game convention)

Fighting games give grabs counterplay: a short **break window** after the grab starts where the victim presses a button to escape, grabs that **lose to attacks** (the grabber is hittable during start-up), and **grab immunity** right after being released. For Roblox:

- 0.3-0.5 s break window shown with a prompt.
- Long cooldown on the grab (5-10 s) because it ignores block.
- Victim immunity to grabs for 2 s after release.

## Carrying downed players

Same weld recipe, but the victim's client should keep their camera and chat; move them with the carrier and drop them on carrier stun. Keep the carried body massless (`Massless = true` on parts) so the carrier's walk speed does not drop.

## Pitfalls

- A forum report: welding HumanoidRootParts can keep one character from dying (Part0 "cannot die"). Run death checks yourself and release before killing.
- Forgetting to restore `PlatformStand` on one exit path: a permanent ragdoll.
- Grabbing across walls; raycast between roots before grabbing.
- Exploiters owning the assembly can fling the victim; keep grabs short and check positions on release.

## Related
[[Combat - Hub]] - [[Downed, Revive and Bleed-Out States]] - [[Smooth Knockback - What Works for All Clients]] - [[Hitstun, I-Frames, Poise and Super Armor]]
