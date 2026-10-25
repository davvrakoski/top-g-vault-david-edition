---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Damage Numbers and Overhead Bars with BillboardGui"
tags: [roblox, community-knowledge, ui, hud, billboardgui, combat-feedback]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/in-experience-containers
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
---
# Damage Numbers and Overhead Bars with BillboardGui

Floating damage numbers, enemy health bars and name plates are the world-space part of a HUD. They tell the player "that hit landed, and it did this much" faster than any screen panel. Done carelessly they also become the biggest UI cost in combat games: hundreds of BillboardGuis created and destroyed per second, each tweening. This note gives a pooled pattern and the settings that keep them readable.

## BillboardGui properties that matter

| Property | Use |
|---|---|
| `Adornee` | The part or attachment to follow (you can keep the gui in PlayerGui and point it at the enemy) |
| `Size` | Offset = constant pixels on screen; Scale = studs in the world (shrinks with distance) |
| `StudsOffset` / `StudsOffsetWorldSpace` | Lift above the head (camera-relative vs world axes) |
| `SizeOffset` | Shift by a fraction of its own size, e.g. `(0, 0.5)` to anchor at the bottom |
| `AlwaysOnTop` | Draw through walls (fine for your own hit numbers, bad for enemy bars in stealth games) |
| `MaxDistance` | Hide past this many studs. Set it; the default draws at any range |
| `LightInfluence` | 0 = ignore world lighting so numbers don't go dark at night |
| `ClipsDescendants` | Turn off if your pop animation scales text past the frame |

## Pattern: client-only, pooled damage numbers

1. The **server** decides damage and fires one RemoteEvent to nearby clients (or to the attacker only) with `(position, amount, kind)`.
2. Each **client** draws the number. Nothing visual is created on the server.
3. Reuse BillboardGuis from a pool instead of `Instance.new` per hit.

```lua
local TweenService = game:GetService("TweenService")
local POOL_SIZE = 30
local pool, index = {}, 0

local anchorFolder = Instance.new("Folder")
anchorFolder.Name = "DamageAnchors"
anchorFolder.Parent = workspace

for i = 1, POOL_SIZE do
	local anchor = Instance.new("Part")
	anchor.Anchored, anchor.CanCollide, anchor.CanQuery, anchor.CanTouch = true, false, false, false
	anchor.Transparency, anchor.Size = 1, Vector3.one * 0.1
	anchor.Parent = anchorFolder
	local gui = script.DamageTemplate:Clone() -- BillboardGui with a TextLabel "Value" and a UIScale
	gui.Adornee = anchor
	gui.Enabled = false
	gui.Parent = anchor
	pool[i] = gui
end

local RISE = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local POP = TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local function showDamage(pos: Vector3, amount: number, crit: boolean)
	index = index % POOL_SIZE + 1 -- round robin: oldest number is recycled
	local gui = pool[index]
	local label: TextLabel = gui.Value
	gui.Adornee.Position = pos + Vector3.new(math.random(-10, 10) / 10, 0, 0)
	gui.StudsOffset = Vector3.new(0, 1.5, 0)
	label.Text = tostring(math.floor(amount))
	label.TextColor3 = crit and Color3.fromRGB(255, 200, 60) or Color3.new(1, 1, 1)
	label.TextTransparency = 0
	gui.UIScale.Scale = crit and 1.6 or 1.15
	gui.Enabled = true
	TweenService:Create(gui.UIScale, POP, { Scale = crit and 1.25 or 1 }):Play()
	TweenService:Create(gui, RISE, { StudsOffset = Vector3.new(0, 3.5, 0) }):Play()
	TweenService:Create(label, RISE, { TextTransparency = 1 }):Play()
end
```

Round-robin recycling means a burst of 100 hits never creates more than 30 guis. Tweens on a recycled gui override the old ones automatically (newest tween wins on the same property).

## Readability rules

- **Offset sizing** (for example 120x50 px) so numbers stay legible at range; clamp range with `MaxDistance` 60-100 studs.
- **Outline text** with a `UIStroke` (thickness 2, black, transparency 0.3) instead of a background box.
- **Colour language:** white normal, yellow crits, red damage taken, green heals. Pair colour with size or an icon so colourblind players can tell crits apart.
- **Merge rapid hits** from the same source within ~0.15 s into one rising number instead of a stack of tiny ones.
- **Let players turn them off**, and respect a "reduce screen clutter" option.

## Overhead health bars

- Show them only when an enemy is damaged or targeted; fade out after ~3 s of no damage.
- Use a `UIGradient` or a nested fill Frame with `Size = UDim2.fromScale(hp / maxHp, 1)`; tween a second "damage trail" bar behind it that catches up 0.3 s later for a satisfying chunk effect.
- Disable the BillboardGui (`Enabled = false`) when hidden; invisible-but-enabled guis still cost layout.

## Pitfalls

- Creating numbers on the server: every client gets every instance replicated, and timing is delayed.
- `TextScaled` on world numbers: they jitter while tweening. Use fixed `TextSize` plus `UIScale`.
- Forgetting `MaxDistance`: an arena with 40 enemies shows 40 bars across the map.

## Related
[[UI UX - Hub]] · [[TweenService UI Animation Recipes]] · [[Number Abbreviation for Simulator UIs]] · [[VFX Color Language and Readability]]
