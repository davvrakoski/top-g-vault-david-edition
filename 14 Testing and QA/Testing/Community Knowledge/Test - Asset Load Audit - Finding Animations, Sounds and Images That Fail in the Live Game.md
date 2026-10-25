---
area: "14 Testing and QA"
cluster: "Testing"
title: "Asset Load Audit - Finding Animations, Sounds and Images That Fail in the Live Game"
tags: [roblox, community-knowledge, testing, assets, contentprovider, permissions, animations]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ContentProvider
  - https://create.roblox.com/docs/reference/engine/enums/AssetFetchStatus
  - https://create.roblox.com/docs/projects/assets/privacy
  - https://create.roblox.com/docs/animation/editor
---
# Asset Load Audit - Finding Animations, Sounds and Images That Fail in the Live Game

"The animation plays for me but not for players" is one of the most common Roblox bug reports, and it is almost always **ownership or permission**, not code: the animation was published under a personal account while the game belongs to a group, a sound was uploaded by a collaborator, or an image is Restricted and was never granted to this game. These bugs hide in Studio because *you* may have access, and they appear only in the live game or for other accounts. An automated audit that tries to load every asset and reports failures catches them before release, and is cheap to run after every content import.

## Why assets fail

| Cause | Typical asset | Note |
| --- | --- | --- |
| Published by the wrong creator | Animations | The Animation Editor tells you to pick the **group** in the Creator field when the game is group-owned |
| Uploaded by a collaborator | Sounds, animations | Their asset, not the game owner's |
| Restricted asset not granted to the game | Images, decals, meshes | Asset Privacy applies only to these three types; if not granted, it will not load and Studio prints a clickable error |
| Moderated or deleted | Any | Asset ID now returns nothing |
| Typo'd or placeholder ID | Any | `rbxassetid://0` and friends |

Asset Privacy facts worth knowing for QA: your own assets always work in your own games; a game grant cannot be revoked once given; and Audio, Video, Models, Animations and Packages are **not** governed by the Asset Privacy setting, so a failing sound is not an Asset Privacy problem.

## The audit script

Run it from the command bar in a **published test place** playtest (client side, since the client is what fails for players), or as a QA command.

```lua
local ContentProvider = game:GetService("ContentProvider")

local CLASSES = { Animation = true, Sound = true, Decal = true,
	Texture = true, ImageLabel = true, ImageButton = true, MeshPart = true }

local targets = {}
for _, root in { workspace, game.ReplicatedStorage, game.StarterGui, game.StarterPack } do
	for _, inst in root:GetDescendants() do
		if CLASSES[inst.ClassName] then table.insert(targets, inst) end
	end
end

local failed = {}
ContentProvider:PreloadAsync(targets, function(contentId, status)
	if status ~= Enum.AssetFetchStatus.Success then
		table.insert(failed, `{status.Name}  {contentId}`)
	end
end)
print(`[asset audit] checked {#targets}, failed {#failed}`)
for _, line in failed do warn(line) end
```

`PreloadAsync` calls the callback once per asset request with the content string and its final `Enum.AssetFetchStatus` (`Success`, `Failure`, `None`, `Loading`, `TimedOut`). It never throws on a failed asset; it just continues. `TimedOut` may succeed later, so rerun before filing; `Failure` means "likely to keep failing".

Two limits: `SurfaceAppearance` and `MaterialVariant` are not supported by `PreloadAsync`, and animations referenced only by ID strings in scripts (not as `Animation` instances) need to be listed manually. A simple trick: keep every animation ID in one `Animations` module and have the audit build `Animation` instances from it.

## Also listen during normal playtests

`ContentProvider.AssetFetchFailed` fires with the content ID whenever an asset fetch fails. Hook it in your QA overlay or forward it to your error logger in test builds, so playtesters surface failures without running anything.

## Second account check

Run the audit once on an account that is **not** the owner and not a collaborator (a tester alt with play access). This is the closest thing to a real player and catches assets that only load for the team.

## Fixing what you find

- Re-publish the animation under the group (new ID), update the reference, re-run.
- For images, decals and meshes, grant the game permission from the asset's page in the Creator Dashboard, or click the Output error in Studio to open the grant pop-up.
- Replace moderated assets; record the old ID in the bug so it does not get re-imported.

## Related

[[Testing - Hub]] · [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]] · [[QA Test Commands - Gated Cheats for Testers]] · [[Pre-Release Gate]]
