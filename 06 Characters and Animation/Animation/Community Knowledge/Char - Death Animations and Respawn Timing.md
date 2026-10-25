---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Char - Death Animations and Respawn Timing"
tags: [roblox, community-knowledge, animation, death, respawn, humanoid]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/spawn-respawn
---
# Char - Death Animations and Respawn Timing

Ragdolls are not the only good death. Stylised, horror and story games often want an authored fall: the character clutches, drops to its knees and lands in a pose you designed. That needs three things working together: keep the joints alive, play a high-priority track that holds its last frame, and time the respawn so the pose is actually seen. The ragdoll version is covered in [[Ragdoll Death with BallSocketConstraints]]; this note is the animated version.

## Step by step

1. **Keep joints:** set `Humanoid.BreakJointsOnDeath = false` (from a script in `StarterCharacterScripts`). Without this, every `Motor6D` is destroyed at death and no animation can play.
2. **Pick a clip by cause** (optional): store the last damage type on the character as an attribute (`LastHit = "Blunt"`), and choose `Death_Fwd`, `Death_Back`, `Death_Headshot` from it.
3. **Stop the rest:** on `Humanoid.Died`, stop all other tracks with `animator:GetPlayingAnimationTracks()` so idle/walk does not blend into the fall.
4. **Play at top priority:** `Enum.AnimationPriority.Action4`, `Looped = false`, fade 0.1 s.
5. **Hold the last frame:** add an animation marker named `Hold` near the end of the clip and freeze there.
6. **Respawn after the pose has read:** default `Players.RespawnTime` is **5 s**. For a 1.5 s death clip, 3-4 s is plenty; for instant-action games set it lower and shorten the clip.

```lua
-- LocalScript in StarterCharacterScripts (the owning client plays its own tracks)
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
local deathTrack = animator:LoadAnimation(script:WaitForChild("DeathAnim"))
deathTrack.Priority = Enum.AnimationPriority.Action4
deathTrack.Looped = false

deathTrack:GetMarkerReachedSignal("Hold"):Connect(function()
	deathTrack:AdjustSpeed(0)
end)

humanoid.Died:Connect(function()
	for _, t in animator:GetPlayingAnimationTracks() do
		if t ~= deathTrack then t:Stop(0.1) end
	end
	deathTrack:Play(0.1)
end)
```

## Things that break it

- **Dead state physics:** in `Dead` state the body is no longer balanced by the Humanoid, so it can tip over mid-clip. Anchoring the `HumanoidRootPart` at death (server side) keeps an authored fall in place; un-anchor if you want it to settle with physics.
- **`RequiresNeck`:** if your game removes heads (gore, headshots), an R15 humanoid with `RequiresNeck = true` dies immediately when the neck joint goes. Decide on purpose.
- **NPCs:** play NPC death tracks on the server; nobody owns them on a client.
- **Custom respawn flow:** if you turned `CharacterAutoLoads` off, `RespawnTime` does nothing; call `player:LoadCharacter()` yourself after the clip (see [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]]).
- **Corpses:** to leave a body behind, clone the dead character into a "Corpse" model, strip scripts and the Humanoid, anchor it, and let `Debris:AddItem(corpse, 30)` clean up.

## Checklist
- [ ] `BreakJointsOnDeath = false`
- [ ] Death track `Action4`, non-looped, has a `Hold` marker
- [ ] Other tracks stopped on `Died`
- [ ] `RespawnTime` set to clip length + about 1.5 s
- [ ] Tested on R15 player, R15 NPC and with network lag on

## Related
[[Animation - Hub]] · [[Ragdoll Death with BallSocketConstraints]] · [[Custom Spawn and Respawn Flow - CharacterAutoLoads and LoadCharacterAsync]] · [[Animation Markers for Hit Frames, Footsteps and Sync]]
