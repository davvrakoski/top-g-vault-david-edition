---
area: "14 Testing and QA"
cluster: "Testing"
title: "RemoteEvent Fuzzing - Bad Input Tests Before Launch"
tags: [roblox, community-knowledge, testing, security, remotes, fuzzing]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/scripting/events/remote
  - https://owasp.org/www-community/Fuzzing
---
# RemoteEvent Fuzzing - Bad Input Tests Before Launch

Every `RemoteEvent` and `RemoteFunction` is a public API that exploiters can call with any arguments, at any rate. Most server crashes and economy exploits in Roblox games come from handlers that assumed the client sends what the client UI sends. Fuzzing means automatically throwing wrong, extreme and malformed values at every remote and checking the server neither errors nor gives anything away. You can do it inside Studio with no exploit tools.

## What clients can send
Remote arguments arrive as data the client chose. Your handler must survive:
- Wrong types: string where a number is expected, a table instead of an Instance.
- Numbers: `0/0` (NaN), `math.huge`, `-math.huge`, negative, fractional, `2^53`.
- Strings: empty, 100,000 characters, odd Unicode.
- Tables: deeply nested, huge, mixed keys, cyclic structures are not sent but very large ones are.
- Instances: someone else's character, a part they cannot see, `nil` because it did not replicate.
- Missing arguments or extra ones.
- Rate: 1,000 calls per second.

## A fuzz harness (Studio, client-side)
Run this from a LocalScript in a test-only build (or the Command Bar in a client context) while a server logger watches for errors:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- nil cannot sit inside an array; test missing arguments with a separate FireServer() call
local NASTY = {
	true, false, 0, -1, 1e308, -1e308, 0/0, math.huge, -math.huge, 0.5, 2^53,
	"", string.rep("A", 100000), "\0\255", {}, {1, 2, 3}, {a = {b = {c = {}}}},
	table.create(5000, 1), Vector3.new(0/0, 0, 0), CFrame.new(1e9, 1e9, 1e9),
	workspace, Players.LocalPlayer, Instance.new("Part"),
}

for _, remote in ReplicatedStorage.Remotes:GetDescendants() do
	if remote:IsA("RemoteEvent") then
		for _, a in NASTY do
			for _, b in NASTY do
				remote:FireServer(a, b)
			end
			task.wait() -- spread out so you also see per-call handling
		end
		print("[fuzz] done", remote:GetFullName())
	end
end
```
For RemoteFunctions, wrap `InvokeServer` in `pcall` and also check that the returned value never grants anything.

## What "pass" means
On the server, during the run:
- [ ] **No errors** in Output from your handlers (an error is a free crash path and log spam).
- [ ] No currency, items or XP granted.
- [ ] Server memory and heartbeat stay steady (no giant tables kept).
- [ ] Rate limits kick in: after N calls per second, the handler ignores the player.
- [ ] Datastores were not written per call.

Add a server-side counter of rejected calls per remote; after a fuzz run it should be large and the game state unchanged.

## Fixing handlers
A validation prelude per remote:
```lua
local function isFiniteNumber(x): boolean
	return typeof(x) == "number" and x == x and x > -math.huge and x < math.huge
end

remote.OnServerEvent:Connect(function(player, slot, amount)
	if typeof(slot) ~= "number" or slot % 1 ~= 0 or slot < 1 or slot > 10 then return end
	if not isFiniteNumber(amount) or amount <= 0 or amount > 999 then return end
	if not RateLimit.allow(player, "Craft", 5) then return end
	-- real logic, using server-side data only
end)
```
Note `x == x` is false only for NaN. NaN fails **every** comparison, so a guard written as `if amount <= 0 then return end` lets NaN straight through (and `NaN` then poisons every sum it touches, such as a currency total). That is why it is the most dangerous single value.

## Make it a release gate
Keep the fuzz script in a test folder, run it before each release against every remote, and fail the release if any handler errors. New remotes get fuzzed automatically because the harness walks the folder.

## Related
[[Testing - Hub]] · [[Remote Type and Allowlist Validation]] · [[Exploit QA - Testing Like an Exploiter Inside Studio]] · [[DataStore Abuse Prevention - Remotes That Hit Your Budget]]
