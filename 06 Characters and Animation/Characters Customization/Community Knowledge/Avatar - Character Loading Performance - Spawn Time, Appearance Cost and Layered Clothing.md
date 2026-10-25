---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - Character Loading Performance - Spawn Time, Appearance Cost and Layered Clothing"
tags: [roblox, community-knowledge, avatar, performance, spawning, layered-clothing]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/reference/engine/enums/LoadCharacterLayeredClothing
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://devforum.roblox.com/t/loadcharacter-is-slow/1732106
  - https://devforum.roblox.com/t/2318007
  - https://devforum.roblox.com/t/playerhasappearanceloaded-issues/32295
---
# Avatar - Character Loading Performance - Spawn Time, Appearance Cost and Layered Clothing

"I joined and stood as a grey blob for five seconds" and "everyone hitches when a new player spawns" are both character-loading problems. A player's avatar is fetched, its meshes and textures downloaded, layered clothing wrapped onto the body, and only then does `CharacterAppearanceLoaded` fire. You cannot make Roblox's servers faster, but you control how much appearance you load, when gameplay waits for it, and what triggers expensive rebuilds.

## What costs time

| Stage | Cost driver | Your lever |
|---|---|---|
| Fetch appearance | Web lookup of the user's outfit | Skip it with `LoadCharacterAppearance = false` when you dress players yourself |
| Download assets | Number and size of accessories, clothing, heads | Limit accessories in Avatar Settings; uniform games load fewer unique assets |
| Layered clothing | Wrapping each layer onto the body cage | `StarterPlayer.LoadCharacterLayeredClothing` |
| Your scripts | `ApplyDescription` calls, clones, VFX added on spawn | Batch into one apply; defer cosmetics |

DevForum reports show the first join is usually the slow one (one thread measured `LoadCharacter` from 0.3 s up to 15 s with later respawns normal), which fits asset download being the main cost.

## Levers in order of impact

1. **Uniform / class games:** set `StarterPlayer.LoadCharacterAppearance = false` and spawn with `Player:LoadCharacterWithHumanoidDescriptionAsync(desc)`. The official reference recommends exactly this pairing: the user's own outfit is never fetched. Your team outfits are the same few assets for everyone, so they download once.
2. **Competitive games:** set `LoadCharacterLayeredClothing` explicitly. Its `Default` value can mean on or off depending on back-end flags, so pick `Enabled` or `Disabled` yourself. Disabling it removes wrap cost and also removes bulky silhouettes that can hide hitboxes.
3. **Avatar Settings accessory limits:** fewer accessories per player means fewer downloads per join, multiplied by every client.
4. **One apply per spawn.** Build the final `HumanoidDescription` (outfit + team colours + scale) then apply it once; each `ApplyDescription` can re-download and rebuild.
5. **Defer cosmetics.** Spawn the player with gameplay-critical parts first; add trails, auras and nametags a frame or two later, or only when another client is close.

## Do not block gameplay on appearance

- `CharacterAdded` fires before the appearance is complete. Use it for gameplay setup (health, tools, collision groups) so the player can move immediately.
- Wait for `Player.CharacterAppearanceLoaded` (or check `Player:HasAppearanceLoaded()`) only for code that needs accessories and clothing to exist (recolouring, attaching to hats, hiding accessories in first person).
- Always use a timeout on those waits; an old DevForum thread reports the client-side appearance event and check not behaving as expected, so do appearance-dependent work on the server or with a fallback.

## Avoid layered clothing rebuild spikes

A DevForum report describes layered clothing rebuilding (with lag spikes) when unrelated properties on the character's parts changed. If you animate `Transparency`, `Color` or `Material` on body parts often (flashing on damage, invisibility effects), test with a heavily layered avatar and watch the MicroProfiler. Workarounds people use: drive effects on a `Highlight` or on separate overlay parts instead of changing the body parts themselves.

## Measure it

```lua
-- Server: log spawn timing per player
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		local t0 = os.clock()
		player.CharacterAppearanceLoaded:Wait()
		print(player.Name, "appearance in", string.format("%.2f s", os.clock() - t0))
	end)
end)
```

Test with a friend's busy layered avatar, not only the default blocky avatar, and on a phone. Compare first join vs respawn.

## Checklist

- [ ] `LoadCharacterLayeredClothing` set explicitly, not `Default`.
- [ ] Uniform games: `LoadCharacterAppearance = false` + description-based spawn.
- [ ] Gameplay setup runs on `CharacterAdded`, cosmetic setup after appearance, with timeouts.
- [ ] One `ApplyDescription` per spawn.
- [ ] Damage flashes do not edit body part properties every frame.

## Related
[[Characters Customization - Hub]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[PreloadAsync and Loading Screens - Preload Less, Load Faster]]
