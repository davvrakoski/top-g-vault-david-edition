---
area: "07 AI and Combat"
cluster: "AI"
title: "LLM NPC Dialogue with TextGenerator"
tags: [roblox, community-knowledge, ai, textgenerator, llm, npc-dialogue]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TextGenerator
  - https://devforum.roblox.com/t/text-generation-api-beta-expanding-access/3952348
  - https://devforum.roblox.com/t/weekly-recap-gdc-2025-edition/3560345
  - https://devforum.roblox.com/t/lmaas-sdk-wrapper-for-textgenerator/4746391
---
# LLM NPC Dialogue with TextGenerator

Roblox's `TextGenerator` class gives game servers access to a hosted large language model, so NPCs can answer free-text questions in character. It launched as a beta around GDC 2025, and a later DevForum post expanded access to all experiences while adding a content-maturity rule: experiences with **extended interactions with an AI NPC must carry a "Restricted" maturity rating** (check the current guidelines before shipping; this is the rule as announced). Used well, it creates memorable moments; used badly, it breaks lore, costs your rate limit, and confuses players who expected quest instructions.

## The API in brief (from the reference)

- Properties: `SystemPrompt` (role and rules), `Temperature` (clamped to 0.4-1.0, default 0.7), `TopP`, `Seed` (fix it for reproducible tests).
- Method: `GenerateTextAsync(request)` yields and returns `{GeneratedText, ContextToken, Model}`.
- Request keys: `UserPrompt`, `ContextToken` (pass back the last one to keep conversation memory), `MaxTokens`, and `JsonSchema` for structured output.
- Rate limit: starts at **100 requests per minute** and scales with concurrent users.

## A server-side dialogue service

```lua
local gen = Instance.new("TextGenerator")
gen.SystemPrompt = table.concat({
	"You are Mara, a tired mechanic in a zombie-overrun mall.",
	"Answer in at most 2 short sentences. Stay in character.",
	"Only mention places from this list: Food Court, Garage, Roof.",
	"If asked about game mechanics, tell the player to check the Journal.",
}, " ")
gen.Temperature = 0.6

local contexts: { [Player]: string } = {}
local lastAsk: { [Player]: number } = {}

TalkRemote.OnServerEvent:Connect(function(player, text)
	if typeof(text) ~= "string" or #text == 0 or #text > 200 then return end
	if os.clock() - (lastAsk[player] or 0) < 4 then return end -- per-player rate limit
	lastAsk[player] = os.clock()
	local ok, res = pcall(gen.GenerateTextAsync, gen, {
		UserPrompt = text, ContextToken = contexts[player], MaxTokens = 80,
	})
	if not ok then
		ReplyRemote:FireClient(player, "Mara shrugs and keeps working.")
		return
	end
	contexts[player] = res.ContextToken
	ReplyRemote:FireClient(player, res.GeneratedText)
end)
```

Clear `contexts[player]` on leave. One `TextGenerator` per character persona is enough; context tokens keep each player's conversation separate.

## Design rules

1. **Server only, rate limited per player.** The game-wide quota is shared by all servers; a few spammers can exhaust it. Show a "thinking" bubble and a fallback line on failure.
2. **Short system prompts with hard constraints.** Facts the NPC may mention, length limits, and what to do with off-topic questions. Long prompts are allowed and the docs encourage detail, but test that the rules hold.
3. **Keep critical information out of the LLM.** Quest steps, prices and directions should come from your game data, shown in UI. The LLM is flavour. The wrapper author on the DevForum notes the model can make mistakes and has no tool calling.
4. **Use `JsonSchema` for anything the game acts on.** For example, ask for `{"mood":"friendly|angry","reply":"..."}` and change the NPC's animation from `mood`. Validate the parsed JSON before use.
5. **Fixed `Seed` in tests** so prompt changes can be compared on identical inputs.
6. **Safety and rating.** Players can type anything. The expansion post credits new Roblox safety systems for the wider access; whether you must also run replies through `TextService` filtering is not stated in the reference (unverified), so check the current docs. Keep replies short and meet the maturity requirement for extended AI NPC chat before you publish.

## Good uses vs bad uses

| Good | Bad |
| --- | --- |
| Ambient characters players can chat with | The only way to learn a quest objective |
| Rumors and lore with a fixed fact list | Generating item stats or rewards |
| Mood-reactive barks (JSON mood + line) | Unlimited long conversations per player |

## Related
[[AI - Hub]] - [[Advanced NPC - AI Behavior]] - [[NPC AI Framework]] - [[Remote Rate Limiting Pattern]]
