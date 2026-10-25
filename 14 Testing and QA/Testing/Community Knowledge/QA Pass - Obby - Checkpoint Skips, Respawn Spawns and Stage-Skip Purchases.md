---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Obby - Checkpoint Skips, Respawn Spawns and Stage-Skip Purchases"
tags: [roblox, community-knowledge, testing, qa, genre-qa, obby, monetization]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/monetization/developer-products
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://devforum.roblox.com/t/good-anti-cheat-for-an-obby/3576031
  - https://devforum.roblox.com/t/obby-checkpoint-could-this-work/375921
  - https://devforum.roblox.com/t/is-this-skip-stage-script-right/962200
  - https://devforum.roblox.com/t/2508102
---
# QA Pass - Obby - Checkpoint Skips, Respawn Spawns and Stage-Skip Purchases

An obby's whole progression is one number: the stage. That makes it easy to build and easy to break. Players skip stages with flings and exploits, respawn on the wrong checkpoint, lose stages after a bad save, or pay Robux for a skip that does nothing. Because the skip-stage product is often the game's main income, a broken skip is both a refund problem and a trust problem.

## Bugs this genre always ships with
- **Out-of-order checkpoints.** Any touch of checkpoint 40 sets stage = 40, so a fling, a lucky jump or a teleport exploit skips 30 stages. DevForum anti-cheat threads agree: only advance when the touched stage is exactly current + 1, checked on the server.
- **Wrong toucher.** `Touched` passes the part that touched, not the player. A loose accessory, a tool or another player's limb can trigger the wrong player's checkpoint if the script does not resolve the character's owner.
- **Respawn race.** The character spawns at the default spawn, then gets moved to the checkpoint a frame later, sometimes after a kill brick has already fired. Players near the start see a "death loop".
- **Skip does nothing.** One DevForum thread shows the classic: `ProcessReceipt` raises the stage value but never moves the player, so they pay and stay put.
- **Skip at the last stage.** The product is still offered at the final stage and the Robux is wasted.
- **Double skip.** The receipt handler grants the stage but the save fails; Roblox calls the handler again and the player skips twice (or the opposite: granted, not saved, lost on rejoin).
- **Stage above max.** A map update removes stages and old saves point at a checkpoint that no longer exists.

## Test checklist
1. Teleport the character (Command Bar, test command) to checkpoint 10 from stage 1. Stage must stay 1.
2. Touch checkpoint 2 with a dropped tool or hat. No change.
3. Die at every 5th stage. Respawn must land on the saved checkpoint, facing forward, with spawn protection active.
4. Buy skip-stage in Studio (test purchases are free in Studio). Character must move to the next checkpoint and the stage must save.
5. Buy skip with data not loaded yet (add an artificial load delay): the handler should return `NotProcessedYet` and grant later.
6. At the final stage, the skip button must be hidden or disabled before the prompt opens.
7. Load a fixture save with stage = max + 20. It must clamp to the last real stage.
8. Use the stage selector to go back to stage 3, then touch stage 4. The saved best stage must not drop.

## Exploit angles
- Track the time each stage was reached on the server. A stage cleared faster than a tester's best time (with margin) is suspicious; log it rather than auto-banning.
- Check the character's distance to the checkpoint at the moment of touch; touches from far away mean a teleport.
- When your own code teleports a player (skip, stage select), update any anti-cheat "last valid position" first, or legit skips get flagged (a point raised in a DevForum anti-exploit thread).

## Balance checks
- Record deaths per stage in playtests. A single stage with far more deaths than its neighbours is a spike, and spikes drive both quits and skip purchases; decide which you want consciously.
- Check the skip price against stage count. Skipping the whole obby should not cost less than a pass that does the same.

## Data and save checks
- Save "best stage" and "current stage" separately if you have a stage selector.
- Grant in `ProcessReceipt` only after the save succeeds, and record the `PurchaseId` so a retried receipt is not granted twice.

## Debug helper: server-side checkpoint gate
```lua
-- Server: call from each checkpoint's Touched handler.
local MAX_DIST = 20 -- studs; tune to checkpoint size

local function tryAdvance(player: Player, stageNumber: number, checkpoint: BasePart)
	local char = player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local current = player:GetAttribute("Stage") or 1
	if stageNumber ~= current + 1 then
		if stageNumber > current + 1 then
			warn(("%s touched stage %d from %d (skip?)"):format(player.Name, stageNumber, current))
		end
		return
	end
	if (root.Position - checkpoint.Position).Magnitude > MAX_DIST then
		warn(player.Name, "touched checkpoint from too far away")
		return
	end
	player:SetAttribute("Stage", stageNumber)
end
```
The warnings give QA a log of every skip attempt during a test session.

## Related
[[Testing - Hub]] - [[Recipe - Obby Stage Save and Skip Stage Product]] - [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] - [[Recipe - Speedrun Timer with Checkpoint Validation]] - [[Testing Purchases - Developer Products, Passes and ProcessReceipt]]
