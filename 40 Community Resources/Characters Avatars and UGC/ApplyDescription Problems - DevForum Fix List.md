---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/applydescription-problems"
title: "ApplyDescription Problems - DevForum Fix List"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar, debugging]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/humanoidapplydescriptionfinished-never-fires/3948914
  - https://devforum.roblox.com/t/humanoidapplydescription-some-requested-assets-were-not-available-error/2634970
  - https://devforum.roblox.com/t/humanoiddescription-breaks-permanently-if-moderated-or-invalid-assets-are-applied/2570950
  - https://devforum.roblox.com/t/applydescription-not-working-properly/1540466
  - https://devforum.roblox.com/t/is-there-a-way-to-block-disable-automatic-character-loading-appearance-for-specific-player/2290563
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# ApplyDescription Problems - DevForum Fix List

Symptom-first list of the appearance bugs that keep showing up in DevForum Scripting Support and Engine Bugs threads. The method is now called `ApplyDescriptionAsync` (see [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]]); the same issues apply.

| Symptom | Likely cause | What to try |
| --- | --- | --- |
| `ApplyDescriptionFinished` never fires | Connected after the yielding apply already returned | Connect first, or just rely on the yield (thread by HpacAm, 2025). |
| Output says some requested assets were not available, look does not change | An asset in the description is deleted, moderated, or still a legacy Part-based head or accessory | Strip IDs one at a time to find the bad one; check that `Workspace.MeshPartHeadsAndAccessories` is enabled (thread by Legend_4lex, 2023; no confirmed fix in the thread). |
| After one bad head, later applies do nothing | Engine bug reported in 2023 where a moderated head left the Humanoid stuck on the client | The poster reported it working again after staff follow-up (NewFissy, 2023). If you hit it again, respawn the character instead of re-applying. |
| Accessories only sometimes apply | Diff-based apply after manual edits | Use `ApplyDescriptionResetAsync`; do not add accessories by hand between applies. |
| Player shows their own avatar for a moment, then changes | You apply after the default appearance loads | Set `Players.CharacterAutoLoads = false` and spawn with `LoadCharacterWithHumanoidDescriptionAsync`, or set `Player.CanLoadCharacterAppearance = false` before spawn. |
| Works in Studio, not live | Studio warns and keeps going on bad assets; live clients may not | Test in a live server with a second account before shipping. |
| Changes made in a LocalScript are invisible to others | Replicated characters must be changed on the server | Send a validated request to the server. |
| Scaling ignored on a custom rig | Description scaling expects standard R15 parts | Scale custom rigs yourself or rebuild as R15 (see [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]). |

## Quick isolation helper (original, run on the server)

```lua
-- Tries each rigid hat ID alone to find the one that breaks an apply.
local function findBadHats(humanoid: Humanoid, ids: {number}): {number}
	local bad = {}
	local base = humanoid:GetAppliedDescription()
	for _, id in ids do
		local test = base:Clone()
		test.HatAccessory = tostring(id)
		local ok = pcall(function()
			humanoid:ApplyDescriptionResetAsync(test)
		end)
		if not ok then
			table.insert(bad, id)
		end
	end
	pcall(function()
		humanoid:ApplyDescriptionResetAsync(base) -- restore the original look
	end)
	return bad
end
```

A failed asset does not always throw. Also compare the accessory count on the character before and after each test.

## Credits

- DevForum threads by HpacAm (replies MayorGnarwhal, HeCatchThose), Legend_4lex (reply OblekfacePC), NewFissy (staff Howimetted, CalGamesDev), plus the other linked Scripting Support threads.
- Roblox Creator Docs API reference (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[Humanoid]] · [[Player and Character Lifecycle Without Race Conditions]] · [[Animation Will Not Play - Troubleshooting Checklist]]

<!-- TDOD_GRAPH_END -->
