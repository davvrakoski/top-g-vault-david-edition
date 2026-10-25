---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Resizing Characters at Runtime - Model ScaleTo vs Body Scale Values"
tags: [roblox, community-knowledge, characters, scale, humanoiddescription, giant]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://devforum.roblox.com/t/how-can-i-shrink-a-player/2220714
  - https://devforum.roblox.com/t/release-notes-for-562
---
# Resizing Characters at Runtime - Model ScaleTo vs Body Scale Values

"Grow bigger as you eat" simulators, shrink potions, boss transformations and kid/adult NPC variants all need characters resized while the game runs. Roblox gives two very different tools. `Model:ScaleTo()` uniformly scales everything in a model (parts, joints, attachments, particles); the R15 body scale values (`HeightScale`, `WidthScale`, `DepthScale`, `HeadScale` in a `HumanoidDescription`) reshape the avatar within the avatar system's limits. Pick by the size range you need.

## Model:ScaleTo in short

- `model:ScaleTo(factor)` sets the model's canonical scale (starts at 1) and resizes all descendants around the pivot. `model:GetScale()` reads it.
- It scales geometry and also "geometric" properties: joint offsets, constraint lengths, particle sizes, and more (see the Model API page for the full rule).
- Factor is **absolute**, relative to scale 1, not cumulative: `ScaleTo(2)` twice is still double size.
- The API went through a Studio beta (forum thread from 2023); it is in the current API reference.

```lua
-- Server: grow a player's character smoothly to 'target'
local function growTo(character: Model, target: number)
	local start = character:GetScale()
	for i = 1, 10 do
		character:ScaleTo(start + (target - start) * (i / 10))
		task.wait(0.03)
	end
end
```

## Body scale values in short

- Set `HeightScale`, `WidthScale`, `DepthScale`, `HeadScale` (and `BodyTypeScale`, `ProportionScale`) on a `HumanoidDescription`, then `ApplyDescriptionAsync`.
- Respects the avatar system: accessories and layered clothing refit, and the animation set stays tuned.
- Limited range (the avatar scale rules cap these values; check the scale note before relying on extremes).

## Which to use

| Need | Use |
| --- | --- |
| Tiny-to-giant range, far beyond avatar limits | `ScaleTo` |
| Kid vs adult NPCs, subtle player height choice | Body scale values |
| Mid-round growth in a simulator | `ScaleTo` in steps |
| Players choosing proportions in a character creator | Body scale values (they persist through description saves) |

## Things that do not scale for you

- **WalkSpeed and JumpPower/JumpHeight:** a 4x giant walking at 16 studs/s looks like it is in slow motion. Scale WalkSpeed roughly with size (a common choice is `16 * factor ^ 0.5` to keep it controllable) and jump height with factor.
- **Camera:** the default camera zoom does not follow; raise `Player.CameraMaxZoomDistance` and consider `Humanoid.CameraOffset`.
- **Hitboxes in your own code:** custom hitbox sizes stored as numbers in scripts must be multiplied by `GetScale()`.
- **HipHeight:** check it after scaling; on custom rigs a wrong value makes giants float or sink.

## Respawn and persistence

The new character spawns at scale 1. Store the size in your data (e.g. a `Size` attribute on the player) and re-apply on `CharacterAdded` after the appearance loads. Applying a `HumanoidDescription` after scaling rebuilds body parts and may not keep the `ScaleTo` result (unverified; test it in your game), so the safe order is: apply descriptions first, then scale.

## Pitfalls

- Scaling every frame causes physics jitter and replication churn; step it (10-20 steps) or tween a value and apply at ~20 Hz.
- Massive scale changes near walls can push characters into geometry; move them to open space or check clearance first.
- Very small characters fall through thin floors more easily; avoid scales below ~0.3 without testing.

## Related
[[Characters Customization - Hub]] · [[Avatar Scale Rules - Height, Width, BodyType and Proportion]] · [[Morphs and Character Swaps at Runtime]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]]
