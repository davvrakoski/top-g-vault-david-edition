---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Char - Nametags and Overhead UI with BillboardGui"
tags: [roblox, community-knowledge, characters, nametag, billboardgui, ui]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/name-health-display
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/ui/text-filtering
---
# Char - Nametags and Overhead UI with BillboardGui

Overhead UI tells players who is who: names, titles, ranks, team colour, health, "typing" or "downed" icons. The built-in Humanoid name and health bar are plain and hard to style, so most games hide them and attach a `BillboardGui` to the head. Done badly, nametags clutter the screen, show through walls, scale into giant blocks at distance, or display unfiltered text.

## Hide the default display

Per character (server, on `CharacterAdded`) set:

- `Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None` hides both name and health bar.
- Or keep it and tune `NameDisplayDistance` / `HealthDisplayDistance` (studs) and `HealthDisplayType` (`AlwaysOn`, `DisplayWhenDamaged`, `AlwaysOff`).
- `NameOcclusion` controls whether names show through walls for enemies/everyone.

## Build the tag

Make one template in `ReplicatedStorage` and clone it into each character's `Head`:

| Property | Value that works | Why |
|---|---|---|
| `Adornee` | the `Head` (or parent it there) | follows the head through animation |
| `Size` | `UDim2.fromScale(4, 1)` (studs) | **scale** = world-size, shrinks with distance; offset = fixed pixels, never shrinks |
| `StudsOffset` | `Vector3.new(0, 2, 0)` | lifts it above hats; use `StudsOffsetWorldSpace` if it must not tilt with the head |
| `MaxDistance` | 60-100 | culls far tags, big clutter and perf win |
| `AlwaysOnTop` | `false` for enemies, `true` for teammates | `true` draws through walls |
| `LightInfluence` | `0` | stays readable in dark maps |
| `PlayerToHideFrom` | the owner `Player` | players usually should not see their own tag |

Inside: a `TextLabel` with `TextScaled = true` plus a `UITextSizeConstraint` (MaxTextSize around 24), `TextStrokeTransparency = 0.5` for contrast on bright skies.

```lua
-- Server: Players.PlayerAdded -> CharacterAdded
local function addTag(player, character)
	local head = character:WaitForChild("Head")
	local tag = template:Clone()
	tag.Name = "NameTag"
	tag.PlayerToHideFrom = player
	tag.Frame.NameLabel.Text = player.DisplayName
	tag.Frame.TitleLabel.Text = player:GetAttribute("Title") or ""
	tag.Parent = head
	character:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
end
```

## Text safety

- `Player.DisplayName` and `Player.Name` are already moderated by Roblox.
- **Any text a player typed** (custom titles, pet names, clan tags) must go through `TextService:FilterStringAsync()` and be shown with `GetNonChatStringForBroadcastAsync()` before it appears over a head, or the game risks moderation action.

## Team-aware tags

Server creates the tag; each client then adjusts locally: teammates get `AlwaysOnTop = true` and team colour, enemies get `AlwaysOnTop = false` and a shorter `MaxDistance`. Client-side changes do not replicate, so each player sees their own version. For outlines through walls see [[Char - Team Outlines with Highlight]].

## Performance

- One BillboardGui per character is fine for 50-player servers. Avoid per-frame `Text` updates; update health bars on `HealthChanged` only.
- Do not tween every tag every frame; tween only on change.
- NPC crowds: give NPC tags a small `MaxDistance` (30) or create them only when the player is near.

## Related
[[Characters Customization - Hub]] · [[Team Uniforms and Skin Tones by Script - Shirt, Pants and BodyColors]] · [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[Char - Team Outlines with Highlight]]
