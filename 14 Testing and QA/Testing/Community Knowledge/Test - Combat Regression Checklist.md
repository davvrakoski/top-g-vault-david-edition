---
area: "14 Testing and QA"
cluster: "Testing"
title: "Combat Regression Checklist"
tags: [roblox, community-knowledge, testing, combat, regression, checklist]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/workspace/raycasting
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/studio/testing-modes
---
# Combat Regression Checklist

Combat code is touched constantly (new weapons, balance passes, animation swaps) and breaks in ways that players notice within minutes: hits that do not register, double damage, or a stun that never ends. A fixed regression checklist, run after every combat change, catches the repeat offenders without re-thinking the test each time. Run it in Studio's multi-client **Server and Clients** mode with 2 clients plus 1 NPC dummy, and at least once with the Network Simulator adding latency (see [[Device, Network and Controller Simulation Test Pass]]). Tick each line or file a bug with the line number.

## A. Hit registration

- [ ] Melee hit lands on a standing dummy from front, side and behind.
- [ ] Hit lands on a moving player at walk and sprint speed, at 0 ms and at ~200 ms simulated latency.
- [ ] Ranged raycast hits use a `RaycastParams` filter that excludes the shooter's own character and accessories.
- [ ] Shots through thin walls, glass and `CanQuery = false` decorations behave as designed.
- [ ] Hits on accessories (hats, hair) count as body hits or are ignored consistently.
- [ ] Hitboxes do not hit the same target twice per swing (per-swing hit list cleared at the end of the swing).

## B. Damage and health

- [ ] Damage matches the balance table for each weapon (test the base, crit and armour cases).
- [ ] Damage is applied **on the server**; the client only requests (server validates distance, cooldown, line of sight).
- [ ] `Humanoid:TakeDamage` respects `ForceField` if your game uses spawn protection; direct `Health -=` does not, so check which one the code uses.
- [ ] Health never goes above `MaxHealth` after healing, and never "revives" a dead humanoid.
- [ ] Death fires exactly once (`Humanoid.Died`) and credits the right killer.
- [ ] Friendly fire rules per team mode.

## C. Timing and state

- [ ] Cooldowns hold when spamming the input and when spamming the remote directly.
- [ ] Stuns, slows and knockbacks expire; stacking two does not make one permanent.
- [ ] Dying mid-attack cancels the attack; no hitbox lingers after death.
- [ ] Respawning clears all status effects and per-character connections.
- [ ] Combos reset after the timeout; animation and damage stay in sync.
- [ ] Blocking/parry windows match the design at 60 and 30 FPS.

## D. Animation and feedback

- [ ] Every attack animation loads for a non-owner account (see [[Test - Asset Load Audit - Finding Animations, Sounds and Images That Fail in the Live Game]]).
- [ ] Hit VFX and sounds play once per hit, on both attacker and victim clients.
- [ ] Damage numbers and health bars update for all clients, including spectators.
- [ ] Camera shake and screen flash respect the reduced-motion setting (`GuiService.ReducedMotionEnabled`) if you offer it.

## E. NPCs and edge cases

- [ ] NPCs take and deal damage with the same rules as players where intended.
- [ ] Attacking a player who is leaving, teleporting or seated in a vehicle does not error.
- [ ] Attacks across a StreamingEnabled boundary (target not streamed on the attacker's client) are rejected or handled.
- [ ] Tool unequip during an attack ends the attack.

## F. Exploit spot checks (5 minutes)

From the command bar on a client in Studio:

- [ ] Fire the attack remote 50 times in a loop: damage limited by server cooldown.
- [ ] Fire it with a far-away target: rejected by server distance check.
- [ ] Fire it with a non-character instance or `nil`: no server error.

Details for deeper attacks are in [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]].

## Record

Write the build/place version, weapon list tested and any skipped lines in the release log. If a line fails twice in three releases, it deserves an automated test.

## Related

[[Testing - Hub]] · [[Full Test Matrix]] · [[Exploit QA - Testing Like an Exploiter Inside Studio]] · [[Bug Triage, Severity and Regression Workflow]]
