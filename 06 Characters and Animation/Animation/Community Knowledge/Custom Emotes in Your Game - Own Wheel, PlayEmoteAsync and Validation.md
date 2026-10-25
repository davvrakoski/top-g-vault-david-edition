---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation"
tags: [roblox, community-knowledge, animation, emotes, humanoiddescription]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/emotes
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/avatar/emotes
---
# Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation

Emotes are cheap fun and a common monetization hook (an emote game pass or emotes unlocked by level). Roblox gives you two very different paths: use the built-in emotes menu with catalog emotes, or ship your own emotes as plain animations with your own UI. Most games that sell emotes use the second path, because catalog emotes must be owned on the marketplace while your own animations only need to be yours.

## Path A: the built-in menu (catalog emotes)

- `HumanoidDescription:SetEmotes({ Name = {assetId} })` registers emotes; `SetEquippedEmotes({...})` fills the wheel, **up to 8 slots**, in clockwise order from the top.
- `Humanoid:PlayEmoteAsync(name)` plays one by name (it replaced the deprecated `PlayEmote`). It errors if the name is not in the applied description, so wrap it in `pcall`.
- `GuiService:SetEmotesMenuOpen(true)` opens the menu; `StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)` hides it (chat `/e` commands still work).
- `StarterPlayer.UserEmotesEnabled = false` (Studio-only setting) stops players' own purchased emotes loading, useful for competitive games where dances give information away or break hitboxes.

## Path B: your own emote system (recommended for game-specific emotes)

1. Animate emotes on R15 (and R6 if supported), priority `Action`, looped or one-shot.
2. Store them as data: `{ id = "Wave", anim = "rbxassetid://...", loop = false, unlock = "Free" }`.
3. Build a wheel or hotbar UI on the client. On press, the client sends `RequestEmote("Wave")`.
4. The **server checks** the player owns/unlocked it (game pass, level, badge), then tells the client "approved". Player-character animations replicate from the owning client, so the client plays the track after approval.
5. Stop the emote when the player moves (`Humanoid.MoveDirection.Magnitude > 0`), jumps, takes damage or equips a tool.

```lua
-- Client: play an approved emote and cancel on movement
local function playEmote(track: AnimationTrack, humanoid: Humanoid)
	track:Play(0.2)
	local conn
	conn = humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		if humanoid.MoveDirection.Magnitude > 0.1 then
			track:Stop(0.2)
			conn:Disconnect()
		end
	end)
end
```

Server validation is about **unlocks**, not visuals: an exploiter can always play any animation they have permission to load on their own character. What you protect is the shop: the paid wheel slots, emote chat messages, and any gameplay effect.

## Design notes

- Keep emotes **in place**; a dance that travels pushes the mesh away from the hitbox.
- Hide held tools during emotes (unequip or set `Transparency`) or author tool-safe variants.
- Add an emote cooldown (2-3 s) on the server so spam does not flood other clients with track starts.
- For group emotes (two players high-five), align both characters with `PivotTo` first, then start both clips on the same server tick.
- Selling emotes made from free mocap has license implications; check before monetizing.

## Pitfalls

- `SetEmotes` changes only take effect once the description is applied to the humanoid (`ApplyDescriptionAsync`).
- Animation ownership: emote animations must be owned by the game owner (user or group) or they will not load in live servers.
- Long looped emotes plus animator LOD on distant players are fine; no special handling needed.

## Related
[[Animation - Hub]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[Selling Emotes Made from Free Mocap - License Check]] · [[Animator Priorities, Weights and Blending Done Right]]
