---
area: "20 FBX Asset Library"
cluster: "Top G Originals"
license: "Original - included with the vault"
fbx_count: 22
tags: [asset, fbx, vfx, original]
cssclasses: [tg-a20]
---
# Top G Originals - VFX Mesh Pack
> [!topg] 22 original, game-ready VFX meshes made for this vault + 5 tintable gradient textures. Every mesh is UV-mapped so U runs along the effect: scroll or tween a texture's offset for motion.

Preview | Mesh | Tris | Use it for
:-:|---|--:|---
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Slash_Thin.png\|110]] | `VFX_Slash_Thin` | 384 | Fast sword swipe; scroll an alpha gradient along U.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Slash_Wide.png\|110]] | `VFX_Slash_Wide` | 384 | Heavy slash / crescent wave.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Slash_Spin360.png\|110]] | `VFX_Slash_Spin360` | 384 | Spin attack / whirlwind.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Slash_Uppercut.png\|110]] | `VFX_Slash_Uppercut` | 384 | Short rising cut; rotate to any angle.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Shockwave_Ring.png\|110]] | `VFX_Shockwave_Ring` | 256 | Ground shockwave; tween Size up + Transparency to 1.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Shockwave_Ring_Wide.png\|110]] | `VFX_Shockwave_Ring_Wide` | 256 | Dust ring / landing impact.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Shockwave_Wall.png\|110]] | `VFX_Shockwave_Wall` | 576 | Rising cylinder wall for slams and AoE edges.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Cone_Burst.png\|110]] | `VFX_Cone_Burst` | 768 | Muzzle blast / shotgun cone / breath attack.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Pillar_Tapered.png\|110]] | `VFX_Pillar_Tapered` | 1152 | Fire / light pillar, beam of judgment.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Tornado_Twist.png\|110]] | `VFX_Tornado_Twist` | 1536 | Tornado / vortex; scroll U for spin.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Dome_Half.png\|110]] | `VFX_Dome_Half` | 1104 | Shield bubble / explosion dome.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Sphere_Shell.png\|110]] | `VFX_Sphere_Shell` | 960 | Energy orb / explosion core / force field.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Spiral_Ribbon.png\|110]] | `VFX_Spiral_Ribbon` | 640 | Spiral aura / power-up wind.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Lightning_Bolt_A.png\|110]] | `VFX_Lightning_Bolt_A` | 48 | Lightning strike strip; flicker visibility.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Lightning_Bolt_B.png\|110]] | `VFX_Lightning_Bolt_B` | 48 | Second bolt shape for variation.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Impact_Star.png\|110]] | `VFX_Impact_Star` | 12 | Hit spark / impact flash, camera-facing.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Impact_Star_Sharp.png\|110]] | `VFX_Impact_Star_Sharp` | 7 | Crit hit / anime impact frame.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Crystal_Shards.png\|110]] | `VFX_Crystal_Shards` | 72 | Ice / crystal eruption from the ground.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Flare_Crossed.png\|110]] | `VFX_Flare_Crossed` | 4 | Glow / flare card visible from any side.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Flare_Star3.png\|110]] | `VFX_Flare_Star3` | 6 | Fuller flare / fire tuft (3 cards).
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Trail_Ribbon.png\|110]] | `VFX_Trail_Ribbon` | 64 | Tapered trail ribbon for dashes.
![[20 FBX Asset Library/Top G Originals - VFX Meshes/Previews/VFX_Ground_Decal.png\|110]] | `VFX_Ground_Decal` | 2 | Flat decal card: cracks, scorch, magic circle.

## Textures (white + alpha, tint with Color3)
`T_Glow_Radial` soft glow · `T_Slash_Fade_U` slash fade along U · `T_Ring_Soft` soft band across V · `T_Edge_Hard` crisp band · `T_Noise_Smoke` smoky noise band

## Roblox recipe: slash in 5 lines
```lua
local slash = ReplicatedStorage.VFX.VFX_Slash_Wide:Clone() -- MeshPart, Anchored, CanCollide=false
slash.CFrame = hrp.CFrame * CFrame.new(0, 0, -3) * CFrame.Angles(0, 0, math.rad(25))
slash.Transparency = 0; slash.Parent = workspace.Effects
TweenService:Create(slash, TweenInfo.new(0.18), {Transparency = 1, Size = slash.Size * 1.25}):Play()
Debris:AddItem(slash, 0.25)
```

For scrolling: put a `Texture` (Face = Top/Bottom) on flat meshes and tween `OffsetStudsU`; or use the mesh as a `SpecialMesh` with `TextureId` and tween `VertexColor` for glow.

License: original work, included with the Top G Vault. Use in any game, including commercial ones.

Links: [[FBX Asset Library - Hub]] · [[VFX - Hub]] · [[Arc Slash, Crescent and Wave VFX]] · [[VFX Budget and Readability]] · [[Combat - Hub]]
