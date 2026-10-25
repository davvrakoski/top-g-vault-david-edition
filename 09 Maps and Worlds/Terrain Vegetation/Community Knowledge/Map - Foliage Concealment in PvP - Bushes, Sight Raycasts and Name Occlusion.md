---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Map - Foliage Concealment in PvP - Bushes, Sight Raycasts and Name Occlusion"
tags: [roblox, community-knowledge, terrain-vegetation, pvp, stealth, foliage, raycast]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/workspace/collisions
---
# Map - Foliage Concealment in PvP - Bushes, Sight Raycasts and Name Occlusion

Vegetation is usually decoration, but in shooters, hide-and-seek, survival and stealth games it becomes **soft cover**: it hides you without stopping bullets. If you don't decide what foliage does, Roblox decides for you, and the defaults are wrong for gameplay: names float above bushes, NPC vision ignores leaves, or bullets stop dead on a fern. This note sets clear rules per foliage type and shows how to make raycasts agree with them.

## Decide the rule per foliage type
| Foliage | Blocks movement | Blocks bullets | Blocks NPC/AI sight | Hides player name |
|---|---|---|---|---|
| Grass, flowers | No | No | No | No |
| Tall grass, bushes | No | No | **Yes** | **Yes** |
| Hedges | Yes | No | Yes | Yes |
| Tree trunks, rocks | Yes | Yes | Yes | Yes |

Write this table down for your game; the map team and the combat team must agree.

## Make queries match the rule
Key facts from the API reference:
- `BasePart.CanQuery` decides if a part is seen by raycasts and spatial queries, but it only takes effect when `CanCollide` is false. A part with `CanQuery = false` is never returned.
- `RaycastParams.CollisionGroup` makes a raycast ignore parts in groups that don't collide with that group.
- `RaycastParams.RespectCanCollide = true` makes the ray use `CanCollide` instead of `CanQuery`.

A clean setup with collision groups:
1. Create groups `Foliage`, `BulletRay`, `SightRay`.
2. Bushes and tall grass: `CanCollide = false`, `CanQuery = true`, group `Foliage`.
3. `BulletRay` does **not** collide with `Foliage`; `SightRay` **does**.
4. Weapons raycast with `params.CollisionGroup = "BulletRay"`; AI vision raycasts with `"SightRay"`.

```lua
-- Server: can this NPC see the target, treating bushes as blockers?
local sight = RaycastParams.new()
sight.CollisionGroup = "SightRay"
sight.FilterType = Enum.RaycastFilterType.Exclude

local function canSee(eye: Vector3, target: Model): boolean
	local root = target:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not root then return false end
	sight.FilterDescendantsInstances = { target }
	local hit = workspace:Raycast(eye, root.Position - eye, sight)
	return hit == nil -- nothing (including foliage) between eye and target
end
```
For fairness, test the head and the root; a player crouched in a bush with their head sticking out should be visible.

## Hide names and health bars
`Humanoid.NameOcclusion` (an `Enum.NameOcclusion`) controls whether names and health bars show behind walls and objects: occlude all, enemies only, or none. For hiding in bushes, set it so enemy names are occluded, and make sure bushes actually occlude (solid enough geometry). Custom nameplates (`BillboardGui`) need their own check: hide them on the client when a `SightRay` from the camera to the head is blocked.

## Map rules for bushes
- **Bushes come in clumps** of 2-4, big enough to hide a crouching avatar (6-8 studs across, 4-5 tall). A lone small bush hides nothing and teaches players that bushes are useless.
- **Place them near paths and objectives**, not only at the map edge, so hiding is a real choice.
- **Counterplay**: bushes stop sight, not sound. Footstep sounds and rustle effects when moving through foliage keep hiding from being a guaranteed win.
- **Not on top of objectives.** A capture point fully covered in bushes becomes a lottery.
- **Third-person peeking**: the camera sits behind and above the head, so players see over bushes that hide their body. If that's not wanted, make cover taller or use a first-person or shoulder camera.

## Performance
Foliage cards are transparent and overlap, which costs fill rate on phones (overdraw). Use fewer, larger bush meshes with solid cores instead of many layered cards, and turn off `CastShadow` on small plants.

## Testing checklist
- [ ] Hide in each bush type: can an enemy see your name? Can an NPC see you?
- [ ] Shoot through bushes: bullets pass; through trunks: bullets stop
- [ ] Explosions: decide if bushes block blast (usually not)
- [ ] Phone at low graphics: are bushes still drawn? (Lower quality levels can thin detail; never make concealment depend on decoration grass)

## Related
[[Terrain Vegetation - Hub]] - [[Vegetation Layering and Composition]] - [[Sightlines, Cover and Chokepoints for PvP Maps]] - [[Perf - Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes]] - [[Collision Groups - Setup Recipes and the WorldRoot API]]
