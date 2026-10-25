---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Animation ID Registry - One Module for IDs, Preloading and Missing-Asset Checks"
tags: [roblox, community-knowledge, animation, architecture, preload, asset-management]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ContentProvider
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/animation/using
---
# Anim - Animation ID Registry - One Module for IDs, Preloading and Missing-Asset Checks

By mid-project a game has 100+ animation IDs pasted into tools, NPC scripts, emote menus and Animate overrides. Then someone re-uploads a clip under the group, an ID changes, and three scripts still point at the old one; or a first sword swing hitches because its clip was never downloaded. A single **animation registry** module fixes the whole class of bugs: one name per clip, one place to change IDs, one preload list, and a Studio check that every ID loads.

## The registry

```lua
-- ReplicatedStorage.Anim.Registry
local R = {
	Locomotion = {
		Idle      = "rbxassetid://000001",
		IdleLook  = "rbxassetid://000002",
		LandSoft  = "rbxassetid://000003",
	},
	Sword = {
		Hold      = "rbxassetid://000010",
		Swing1    = "rbxassetid://000011",
		Swing2    = "rbxassetid://000012",
	},
	Emotes = {
		Wave      = "rbxassetid://000020",
	},
}
return R
```

(Placeholder IDs.) Code refers to `Registry.Sword.Swing1`, never to raw numbers. Renaming or re-uploading means one edit.

## Shared Animation objects and a track cache

```lua
-- ReplicatedStorage.Anim.Tracks
local Registry = require(script.Parent.Registry)
local animObjects = {} -- id -> Animation (shared by everyone on this machine)
local Tracks = {}

local function animFor(id)
	local a = animObjects[id]
	if not a then
		a = Instance.new("Animation")
		a.AnimationId = id
		animObjects[id] = a
	end
	return a
end

local perAnimator = setmetatable({}, { __mode = "k" }) -- animator -> {id -> track}
function Tracks.get(animator: Animator, group: string, name: string)
	local id = Registry[group][name]
	local cache = perAnimator[animator]
	if not cache then cache = {}; perAnimator[animator] = cache end
	local t = cache[id]
	if not t then
		t = animator:LoadAnimation(animFor(id))
		cache[id] = t
	end
	return t
end

function Tracks.allAnimations(groups: { string })
	local list = {}
	for _, g in groups do
		for _, id in Registry[g] do table.insert(list, animFor(id)) end
	end
	return list
end
return Tracks
```

This enforces the "load each clip once per animator" rule that prevents track leaks, without each system re-implementing it. The weak-keyed table lets caches disappear with their animators.

## Preload what the first minute needs

On the client, preload the groups the player will see right away (locomotion, the starting weapon) during the loading screen; do the rest in the background:

```lua
local ContentProvider = game:GetService("ContentProvider")
local Tracks = require(game.ReplicatedStorage.Anim.Tracks)
ContentProvider:PreloadAsync(Tracks.allAnimations({ "Locomotion", "Sword" }))
task.defer(function()
	ContentProvider:PreloadAsync(Tracks.allAnimations({ "Emotes" }))
end)
```

`PreloadAsync` yields until the listed instances' assets are loaded and does not error on failures (it reports them), so it is safe in a loading flow. Preload less, not everything: a huge preload list delays the first spawn.

## Missing-asset check in Studio

Add a Studio-only test that loads every registry ID and flags failures, so a broken or private animation is caught before players see a T-pose:

```lua
-- Run from the command bar or a test runner in Studio
local ContentProvider = game:GetService("ContentProvider")
local Registry = require(game.ReplicatedStorage.Anim.Registry)
local list, names = {}, {}
for group, clips in Registry do
	for name, id in clips do
		local a = Instance.new("Animation"); a.AnimationId = id
		table.insert(list, a); names[a] = group .. "." .. name
	end
end
ContentProvider:PreloadAsync(list, function(contentId, status)
	if status ~= Enum.AssetFetchStatus.Success then
		warn("Animation failed:", contentId, status)
	end
end)
```

A clip that loads in Studio but not in the live game is usually a permissions problem (the animation must be owned by, or shared with, the place owner); the animation permissions note covers the rules.

## Extras that pay off

- Store per-clip metadata next to the ID (priority, looped, default fade, marker names) so every system plays a clip the same way.
- Keep a `Deprecated` group for old IDs still referenced by saved data (emote unlocks), instead of deleting them.
- Generate the list of IDs to grant/share from the registry when moving a game between owners.

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Animation Permissions and Sharing - 2025 Update]] · [[Speed - First-Use Hitches - Preloading Animations and Sounds Without Bloating Join]]
