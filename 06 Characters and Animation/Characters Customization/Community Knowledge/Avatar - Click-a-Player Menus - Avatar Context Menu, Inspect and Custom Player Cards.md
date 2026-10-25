---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Avatar - Click-a-Player Menus - Avatar Context Menu, Inspect and Custom Player Cards"
tags: [roblox, community-knowledge, avatar, social, inspect-menu, avatar-context-menu, ui]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/avatar-context-menu
  - https://create.roblox.com/docs/players/avatar-inspect-menu
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://create.roblox.com/docs/reference/engine/enums/AvatarContextMenuOption
---
# Avatar - Click-a-Player Menus - Avatar Context Menu, Inspect and Custom Player Cards

Hangouts, roleplay and trading games live on "click someone, do something with them": trade, invite to party, inspect outfit, wave. Roblox gives you two built-in pieces (the **Avatar Context Menu** and the **Avatar Inspect Menu**) and you can build a third (your own player card). This note is the decision guide and the safe wiring; the official pages list every option.

## Which one

| Need | Use |
|---|---|
| Social game where clicking people has no other meaning | Avatar Context Menu (ACM) with a few custom actions |
| Show what someone is wearing, let others try on / buy | Avatar Inspect Menu, in "current appearance" mode |
| Combat, building or any game where click already means something | Your own player card opened from the player list or a ProximityPrompt |
| Rich game data (level, guild, stats) next to actions | Your own player card |

ACM is opt-in and is best when there is "no predefined behavior for clicking on other users" (official wording, paraphrased). In a shooter, clicking a player should shoot, not open a menu.

## ACM wiring (client)

```lua
local StarterGui = game:GetService("StarterGui")
local Remotes = game.ReplicatedStorage.Remotes

local function trySetCore(name, value)
	-- SetCore can fail if CoreGui is not ready yet; retry briefly
	for _ = 1, 10 do
		if pcall(StarterGui.SetCore, StarterGui, name, value) then return true end
		task.wait(0.5)
	end
	return false
end

trySetCore("AvatarContextMenuEnabled", true)

local tradeEvent = Instance.new("BindableEvent")
tradeEvent.Event:Connect(function(target: Player)
	Remotes.RequestTrade:FireServer(target)   -- server decides
end)
trySetCore("AddAvatarContextMenuOption", { "Trade", tradeEvent })
trySetCore("RemoveAvatarContextMenuOption", Enum.AvatarContextMenuOption.Chat) -- if your game has no chat use
```

Rules that keep it safe:

- **The server re-checks everything.** The docs warn that you cannot edit the ACM while it is open, so an option can be stale (the target left the trade zone). The server must verify both players are still eligible, in range and not busy.
- **Rate-limit requests** per sender and let targets block or auto-decline.
- **Theme it** with `AvatarContextMenuTheme` (background, button colours, font, `SelectedCharacterIndicator`) so it matches your UI instead of looking like a system popup.
- Open or close it from code with `SetCore("AvatarContextMenuTarget", player)` / `nil` (for example, open it from your player list).

## Inspect what they are wearing now

By default, Inspect shows the user's **Roblox profile** avatar, which can differ from their in-game look (team uniforms, game items). For games with custom outfits:

1. `GuiService:SetInspectMenuEnabled(false)` to stop the profile-based menu.
2. Get the target's current description with `humanoid:GetAppliedDescription()`.
3. Call `GuiService:InspectPlayerFromHumanoidDescription(description, name)`.

`GuiService:InspectPlayerFromUserId(userId)` inspects anyone, even players not in the server: useful for a "top players" board.

Note that game-only items in a description (your own non-catalog accessories) will not be buyable from the Inspect menu, which is built around Marketplace items (unverified for every item type; test with your own assets). For game items, show your own shop card.

## Building your own player card

- Open from: player list row, a `ProximityPrompt` on other characters (set `RequiresLineOfSight`, short `MaxActivationDistance`), or a long-press on mobile.
- Show: display name and `@username`, avatar thumbnail (`Players:GetUserThumbnailAsync`), your game stats, and 3-5 actions.
- Actions fire RemoteEvents; the server validates exactly as with ACM.
- On console, make it reachable with gamepad selection, and close it with B.

## Pitfalls

- `SetCore` called too early errors; always pcall and retry.
- Enabling ACM in a game where players click to interact with the world: misclicks open the menu. Pick one meaning for clicking on a character.
- Showing private data (friends lists, join times) on a card: keep it to public profile info and game stats.

## Related
[[Characters Customization - Hub]] · [[Character Preview in a ViewportFrame - WorldModel Pattern]] · [[Remote Rate Limiting Pattern]] · [[Char - Nametags and Overhead UI with BillboardGui]]
