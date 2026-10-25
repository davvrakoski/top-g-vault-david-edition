---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Predicting Movement Abilities - Dashes, Double Jumps and Server Checks"
tags: [roblox, community-knowledge, networking, prediction, movement, abilities, server-authority]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/server-authority
  - https://create.roblox.com/docs/projects/server-authority/techniques
  - https://create.roblox.com/docs/reference/engine/classes/RunService#BindToSimulation
  - https://create.roblox.com/docs/reference/engine/classes/RunService#IsResimulating
  - https://gabrielgambetta.com/client-side-prediction-server-reconciliation.html
---
# Predicting Movement Abilities - Dashes, Double Jumps and Server Checks

A dash that waits for the server feels broken: at 150 ms ping the player presses Q, nothing happens for a beat, then they lurch. A dash the client does entirely alone is a speed hack waiting to happen. The fix is the same one Gambetta's "Client-Side Prediction and Server Reconciliation" describes: **apply the input locally right away, send it to the server, and let the server's version win if they disagree**. On Roblox there are now two ways to build that, and the right one depends on whether your game uses the server authority model.

## Path A: classic replication (client owns its character)

By default the client simulates its own character, so a local impulse moves the player instantly and replicates. The server's job is to **police**, not to simulate.

**Client:**
1. On input, check a local cooldown (for feel only).
2. Apply the movement (for example `ApplyImpulse` on the root part, or a short-lived `LinearVelocity`).
3. Fire a remote `Dash(direction: Vector3)` immediately, so the server knows a dash is claimed.
4. Play effects locally.

**Server (the real rules):**
1. Validate the payload: `direction` is a Vector3, finite, roughly unit length ([[Remote Payload Validation]]).
2. Check the **server-side** cooldown with `os.clock()` per player. If too soon, record a strike and correct position (below).
3. Open a short "dash window" for that player: for the next ~0.3 s, allow extra horizontal displacement up to `DASH_DISTANCE + tolerance` in your movement validator ([[Server-Side Movement Validation and Anti-Exploit Checks]]).
4. Replicate effects to other clients (they will see the dash via normal replication anyway, slightly delayed).

**Double jump** works the same way: the server tracks `airJumpsUsed`, resets it on landing (from `Humanoid.StateChanged` on the server, or a downward raycast), and only extends the vertical allowance when a jump claim arrives while airborne with jumps left.

**Correction:** if the client moved without a valid claim, or further than the window allows, set its root `CFrame` back to the last valid server-observed position. Rubber-banding is the "reconciliation" step; keep tolerances loose enough that honest high-ping players never see it.

Pitfall: never let the remote itself move the character on the server ("server dashes for you"). With client ownership, the client's next physics update overwrites it and you get a double dash or a snap.

## Path B: server authority model (Workspace.AuthorityMode = Server)

With the server authority model, the server is the source of truth for characters too, and the engine handles prediction, rollback and resimulation for you. Your ability code must then follow its rules (from the docs):

- Put ability logic in a ModuleScript whose function is bound with `RunService:BindToSimulation()` and initialized on **both** client and server.
- Read input from **InputActions** (Input Action System), not `UserInputService.InputBegan`. InputActions are sent to the server and replayed during resimulation.
- Store ability state that affects simulation (cooldown end time, dash end time, air jumps used) in **attributes** on a predicted instance, and write them only inside the bound function. A mismatch triggers rollback.
- Use `time()` for timing inside the simulation; it is synchronized and rewinds during resimulation. `tick()`, `os.time()` and `os.clock()` do not.
- Play sounds and VFX from a separate RenderStepped reader, and use `RunService:IsResimulating()` to avoid duplicate effects during replays.

Sketch (shape only, check which members carry the Simulation Access label before relying on them):

```lua
RunService:BindToSimulation(function(dt)
	for _, player in Players:GetPlayers() do
		local char = player.Character
		local dash = getDashAction(player) -- InputAction under the player's InputContext
		if char and dash and dash:GetState() == true then
			local readyAt = char:GetAttribute("DashReadyAt") or 0
			if time() >= readyAt then
				char:SetAttribute("DashReadyAt", time() + 1.5)
				char:SetAttribute("DashUntil", time() + 0.2)
			end
		end
		-- elsewhere in the same step: while time() < DashUntil, drive the dash velocity
	end
end)
```

Because client and server run the same code with the same inputs, the client predicts the dash instantly and the server's result is authoritative. Cheating the cooldown on the client only produces a misprediction that rolls back.

## Choosing

| | Path A | Path B |
| --- | --- | --- |
| Setup cost | Low, works today in any place | Needs AuthorityMode Server and its required settings |
| Cheat resistance | Only as good as your validator | Structural; client reports inputs only |
| Feel at high ping | Instant, occasional rubber-band | Instant, occasional misprediction correction |
| Best for | Simulators, RPGs, casual PvE | Competitive PvP, sports, racing |

## Tuning tips

- Make abilities **forgiving to latency**: a 0.1 s input buffer and generous end-lag hide most corrections ([[Latency, Prediction and Reconciliation]]).
- Stun or root effects applied by other players will always cause corrections for the target; the docs call this out as normal.
- Log corrections per player per minute; a sudden rise after a patch usually means a tolerance is too tight, not a cheater wave.

## Related
[[Networking Security - Hub]] · [[What a Client Controls on Its Own Character - Replication Exceptions]] · [[Server Authority 2026 - What the Community Learned]] · [[Chickynoid - Server-Authoritative Character Controller with Demo Place (MIT)]]
