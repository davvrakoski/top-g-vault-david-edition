---
area: "14 Testing and QA"
cluster: "Testing"
tags: [deep-dive, roblox, testing, device-simulator, network-simulator, controller-emulator, automation]
verified: 2026-10-25
cssclasses: [tg-a14]
---

# Device, Network and Controller Simulation Test Pass

## Why this matters
Most Roblox players are not on your development PC, your fibre connection or your keyboard. Studio now has a **Device Simulator** toolbar with phone tiers and physical-size scaling, a **Controller Emulator** for gamepads, TV remotes and VR, a **Network Simulator** with latency/jitter/loss presets, and services to **script** multi-client and device tests.
Together they let one person cover, in under an hour per release, a matrix that used to need a drawer of devices. This note is that pass, plus how to automate parts of it.

> [!note] Beta status
> Device Simulator (the new toolbar) and Network Simulator are **beta** at the time of writing: **File › Beta Features › New Device Simulator**, then restart Studio. Behaviour may change.

---

## 1. Device Simulator essentials

| Feature | Detail (Creator Docs › Device Simulator) |
|---|---|
| Location | Toolbar above the 3D viewport, available in **edit and play** (switch devices mid-playtest) |
| Categories | **Phone** (phones and tablets, touch + on-screen keyboard), **Desktop**, **Console** (gamepad-first), **Headset** (VR) |
| Phone tiers | **Flagship**, **Mid-range**, **Entry level**, so you can walk a layout down the performance ladder |
| Controls | Rotate; mock Android back button; touch-controls help; **Virtual controller** toggle; **Display scaling** |
| Touch gestures with a mouse | **Pinch + rotate: Alt + drag**; **two-finger pan: Alt + Shift + drag** |
| Display scaling | **Physical size** (real-world size; calibrate once with an ID-card-sized slider or auto-detect), **Actual resolution** (1:1 pixels), **Fit to window** |
| Custom devices | Name, platform, dimensions (up to 7680×4320), pixel density (72–10,000 PPI), keyboard height per orientation |

**Physical size mode is the one that catches "too small to tap" problems.** Calibrate it once.

## 2. Controller Emulator essentials

- Devices: **Generic Gamepad, PS4, PS5, Xbox, Generic Handheld, TV Remote (Android TV), Quest 2 / Quest 3**. Your game sees the matching `Enum.GamepadType`.
- Input from clicking the picture (analog triggers and sticks report partial values), the **keyboard** using per-device mappings (*Edit mappings*, saved per device), or a real controller. Controls **light up** as input arrives, which is the fastest way to tell whether a problem is upstream of your input code.
- VR: toggle headset/left/right controllers; Shift+WASD move, Shift+E/Q fly, mouse rotate, right-click tilt, Shift+←/→ switch, **Alt+1** cursor lock, **Reset Positions**.
- Picking a console, headset, handheld or TV device in Device Simulator **auto-selects** the matching controller.

## 3. Network Simulator essentials

Presets (latency / jitter / packet loss, inbound and outbound):

| Preset | Inbound | Outbound |
|---|---|---|
| Ideal Fiber (default, still adds 8 ms) | 8 ms / 0 / 0.00% | 8 ms / 0 / 0.00% |
| Wired Broadband | 25 / 3 / 0.00% | 25 / 3 / 0.00% |
| Home Wi-Fi | 30 / 12 / 0.20% | 30 / 15 / 0.30% |
| Standard Mobile (4G/LTE) | 45 / 20 / 0.40% | 55 / 30 / 0.50% |
| Bad Connection (3G) | 150 / 70 / 0.50% | 180 / 90 / 0.50% |

- Open via **Test › Device Simulator**, then the **Network** pill. Changes are **staged until Apply** and take effect immediately in a running playtest.
- Ranges: latency and jitter 0–1000 ms; packet loss 0.00–**0.50%** (half of one percent, not 50%).
- Values **add** to real conditions, which matters in Team Test.
- For a true zero baseline, set everything to 0 as a custom preset (Ideal Fiber isn't zero).
- Scriptable through `NetworkSettings` properties (`InboundNetworkMinDelayMs`, `OutboundNetworkMinDelayMs`, `InboundNetworkJitterMs`, `OutboundNetworkJitterMs`, `InboundNetworkLossPercent`, `OutboundNetworkLossPercent`); the toolbar stays in sync.
- Docs tip: apply the condition **before** starting the interaction for big comparisons, because large mid-test latency changes affect congestion control.

---

## 4. The release pass (≈45–60 minutes)

Pick **3 journeys** that matter this release, for example: (A) new player spawn → first reward → first upgrade, (B) open shop → buy dev product → item appears, (C) the changed feature.

| # | Device profile | Controller | Network | Journeys | Look for |
|---|---|---|---|---|---|
| 1 | Phone, **Entry level**, landscape, Physical size | Touch | Standard Mobile (4G) | A, B, C | Tap targets, notch/top bar, thumb reach, text ≥ readable, memory |
| 2 | Phone, Flagship, **portrait** (if supported) | Touch | Home Wi-Fi | A | Orientation handling, keyboard covering inputs |
| 3 | Tablet | Touch | Home Wi-Fi | A, C | Stranded mid-screen buttons, oversized UI |
| 4 | Console (Xbox or PS5) | Gamepad | Wired Broadband | A, B, C | Every screen reachable with D-pad + A/B; glyphs; no chat window; selection never lost |
| 5 | Desktop 1366×768 | KB/M | **Bad Connection (3G)** | B, C | Duplicate submissions, missing feedback while waiting, timeouts, stale UI |
| 6 | Android TV | TV Remote | Home Wi-Fi | A (if TV supported) | D-pad-only navigation, back button |
| 7 | Headset (Quest 3) | Quest controllers | Home Wi-Fi | A (if VR supported) | Reach, gaze-dependent interactions |

Questions from the Network Simulator docs to answer for every server-confirmed action:
- Does the player get **immediate local feedback** while waiting?
- Can repeated input submit the **same action twice**?
- Do loading states distinguish **slow** from **failed**?
- Is there a safe **retry**?
- Does the game **recover** when the connection improves?

Log results in the test plan, and file bugs with the **profile + preset** in the title ("[Entry phone / 4G] Shop buy button double-charges currency").

---

## 5. Automating parts of the pass

### A. Multi-client scenarios with StudioTestService (plugin-driven)
`StudioTestService` (Studio-only) can start a server with **up to 8 simulated clients**, add players mid-session, pass arguments, end tests from the server and make clients leave. The pattern from the API docs:

```lua
-- Plugin script: launch a 2-client test and wait for the result
local StudioTestService = game:GetService("StudioTestService")
local toolbar = plugin:CreateToolbar("QA")
local button = toolbar:CreateButton("TradeTest", "Run 2-client trade test", "")

button.Click:Connect(function()
	button.Enabled = false
	task.spawn(function()
		local result = StudioTestService:ExecuteMultiplayerTestAsync(2, "trade-basic")
		print("Trade test result:", result)
		button.Enabled = true
	end)
end)
```

```lua
-- Server script (runs inside the test): drive the scenario, then end with a result
local StudioTestService = game:GetService("StudioTestService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

if RunService:IsStudio() and StudioTestService:GetTestArgs() == "trade-basic" then
	while #Players:GetPlayers() < 2 do task.wait() end
	local a, b = unpack(Players:GetPlayers())
	local ok = TradeService.testTrade(a, b, { "Sword_01" }) -- your module under test
	StudioTestService:EndTest(if ok then "PASS" else "FAIL")
end
```

Limits (docs): `ExecuteMultiplayerTestAsync` is **plugin-only**, yields until the test ends, can't be called inside a running test, and only one multiplayer session runs per Studio instance. `AddPlayers`/`EndTest` run on the **server**, `LeaveTest`/`CanLeaveTest` on a **client**, and `GetTestArgs` has a known issue in client LocalScripts. Use `ExecutePlayModeAsync` / `ExecuteRunModeAsync` for single-session runs.

### B. Device sweeps with StudioDeviceSimulatorService
`StudioDeviceSimulatorService` (Studio-only) can list presets (`GetDeviceListAsync`), switch devices (`SetDeviceAsync`), set resolution, DPI, orientation and scaling, and create custom devices. A plugin can loop through your target devices and take a screenshot of each screen state, or run a multiplayer test per device. Check the API reference for exact argument formats; they aren't reproduced here.

### C. Simulated input with VirtualInput
`UserInputService:CreateVirtualInput()` returns a `VirtualInput` with `SendKey`, `SendMouseButton`, `SendMouseDelta`, `SendMousePosition`, `SendPointerAction` and `SendTextInput`, processed like real hardware input. It's useful for end-to-end UI flows in Studio tests.

### D. Headless smoke tests with the Studio CLI
`RobloxStudioBeta.exe --task RunScript --runScriptFile <file> [--localPlaceFile <place>] [--outputFile <log>] [--quitAfterExecution]` runs a Luau file **at command-bar permission** after the place loads. That suits **pure logic** checks (economy maths, data migrations, receipt idempotency helpers, config defaults) in CI:

```lua
-- smoke.luau: run with --task RunScript --localPlaceFile Game.rbxl --outputFile smoke.log --quitAfterExecution
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local failures = 0
local function check(name, cond)
	print((cond and "PASS " or "FAIL ") .. name)
	if not cond then failures += 1 end
end

local Migrate = require(ReplicatedStorage.Shared.DataMigrations)
local v1 = { Version = 1, Coins = 50 }
local v3 = Migrate.toLatest(table.clone(v1))
check("migrate v1->latest keeps coins", v3.Coins == 50)
check("migrate sets version", v3.Version == Migrate.LATEST)

print(("SMOKE DONE failures=%d"):format(failures))
```

Studio's executable lives under `%localappdata%\Roblox\Versions\[version]\` on Windows. Your CI step should grep the output file for `failures=0`.

### E. Agent-driven playtests (MCP)
Studio's built-in MCP server exposes `start_stop_play`, `get_console_output`, `screen_capture`, `character_navigation` and keyboard/mouse input tools, plus a `playtest` subagent. An AI agent can run a scripted journey and report Output errors; review its results like any other test report (see [[Claude and the Roblox Studio MCP Server - Responsible Setup]]).

---

## 6. Also emulate locale and policy
**Test › Player Emulator › Enable Test Profile**: *Locale*, *Pseudolocalize* (spot untranslated strings), *Elongate* (stress text length; the docs note Spanish averages ~30% longer than English), and *Region* (affects `PolicyService` results, so you can check paid-random-item and ads handling per region).

---

## Common mistakes
- Testing phones in "Fit to window" only, so tap targets look fine but are tiny in real life.
- Skipping Entry-level phone profiles.
- Using only Ideal Fiber (which isn't even zero latency) and never 4G/3G.
- Testing gamepad by clicking the screen with a mouse instead of driving everything from the emulated pad.
- Calling `ExecuteMultiplayerTestAsync` from a normal Script (it's plugin-only).
- Expecting simulators to replace real-device checks entirely. Use them to find most issues fast, then confirm on 1–2 real devices.
- Leaving `NetworkSettings` changes applied and forgetting why Studio feels slow.

## Checklist
- [ ] Beta enabled; physical-size scaling calibrated
- [ ] 3 journeys chosen for this release
- [ ] Matrix rows 1–5 completed (6–7 if TV/VR supported)
- [ ] Network questions answered for every server-confirmed action
- [ ] Player Emulator locale/elongate/region pass on changed UI
- [ ] At least one scripted check (StudioTestService or CLI smoke) runs per release
- [ ] Real-device confirmation on one phone and one other platform
- [ ] Bugs titled with profile + preset

---

**Sources checked (2026-10-25):** Creator Docs: Studio › Device Simulator; Controller Emulator; Network Simulator; Testing modes (Scripted testing, Player emulation); Studio command-line interface; Connect to the Roblox Studio MCP server; Engine API: StudioTestService, StudioDeviceSimulatorService, VirtualInput, NetworkSettings, UserInputService.CreateVirtualInput.

**Related:** [[Testing - Hub]] · [[Full Test Matrix]] · [[Cross-Platform UI Lab]] · [[Gamepad and Console Design]] · [[QA Test Plan Template for Roblox Experiences]] · [[UI breaks on phone - gamepad]]
