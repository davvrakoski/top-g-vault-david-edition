---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/text-filtering-practice"
title: "Text Filtering in Practice - Pet Names, Signs and Offline Authors"
tags: [roblox, community, "cluster/performance-and-security", security, moderation, text]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/ui/text-filtering
  - https://devforum.roblox.com/t/a-guide-to-filtering-text/468292
  - https://devforum.roblox.com/t/a-way-to-filter-strings-without-the-author-being-in-game/2397971
---
# Text Filtering in Practice - Pet Names, Signs and Offline Authors

Unfiltered player text is one of the few mistakes that can get a whole game **taken down**. The Creator Hub says that if Roblox detects or receives reports that a game skips filtering, the game is removed until filtering is added. Roblox already filters built-in TextChatService chat. **Everything else you display is your responsibility.**

## What needs filtering (Creator Hub plus community guides)

- Any player-typed text other players can see: pet names, nicknames, signs, guild names, trade notes, custom map labels.
- Text you **stored** earlier, such as a pet name loaded from a DataStore.
- Text from **external web servers** you don't control.
- **Randomly generated** words. Random letters can spell something bad.
- Developer-written strings don't need filtering. Polyheximal's DevForum guide (2020) adds that filtering everything players type is the safe default.

## Which call for which case

| Case | Call (on the server, inside `pcall`) |
|---|---|
| Text everyone sees (a sign, a server-wide pet name) | `TextService:FilterStringAsync(text, authorUserId)` then `:GetNonChatStringForBroadcastAsync()` |
| Text one player sees | `:GetNonChatStringForUserAsync(viewerUserId)`, which respects that viewer's settings |
| Custom chat-like messages | `:GetChatForUserAsync(viewerUserId)` per recipient, as in Polyheximal's guide |

The docs warn against filtering per keystroke. Filter **once, when the player submits**.

## Community lessons

- **It doesn't work in normal Studio playtests.** Several DevForum posters, the guide included, say to test filtering in a live server.
- **Filtering can fail.** Wrap it in `pcall` and, when it fails, **show nothing** (or a placeholder). Never fall back to the raw string.
- **Don't cache and reuse results for separate messages.** The API docs say this, and Kampfkarren's 2023 feature request quotes it.
- **Offline authors are an open gap.** `FilterStringAsync` needs the author's UserId and errors when the author isn't in the server (Kampfkarren, May 2023). That makes feeds, bulletin boards and imported maps hard. DukeAunarky said they switched off custom TextLabels in imported maps for this reason. The thread shows no staff reply. Until there's an official API, **only show stored player text while its author is in the server**, or don't show it at all.

## Original server helper

```lua
-- ServerScriptService/TextGate (ModuleScript)
local TextService = game:GetService("TextService")
local TextGate = {}

local MAX_LEN = 50

-- Returns a string safe to show to everyone, or nil if filtering failed.
function TextGate.forEveryone(raw: unknown, author: Player): string?
	if typeof(raw) ~= "string" then return nil end
	local text = raw:sub(1, MAX_LEN)
	if text:match("^%s*$") then return nil end
	local ok, result = pcall(TextService.FilterStringAsync, TextService, text, author.UserId)
	if not ok then return nil end
	local ok2, filtered = pcall(result.GetNonChatStringForBroadcastAsync, result)
	return ok2 and filtered or nil
end

return TextGate
```

Store the **raw** name, together with the owner's UserId, and run it through `TextGate.forEveryone` each time you display it while the owner is present. Then, if filtering rules change, stored names are re-checked against the new rules.

## Credits

Roblox Creator Hub, *Text filtering* (CC BY 4.0). DevForum: Polyheximal (*A Guide to Filtering Text*, 2020); Kampfkarren and DukeAunarky (*A way to filter strings without the author being in game*, 2023). The helper is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Text filtering]] · [[TextService]] · [[Remote Type and Allowlist Validation]] · [[DataStore Abuse Prevention - Remotes That Hit Your Budget]]

<!-- TDOD_GRAPH_END -->
