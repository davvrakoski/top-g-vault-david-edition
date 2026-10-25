---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Contextual Barks - Rule-Based NPC Lines That React to the World"
tags: [roblox, community-knowledge, story, dialogue, barks, npc, systems]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.gdcvault.com/play/1015528/
  - https://cdn.fastly.steamstatic.com/apps/valve/2009/ai_systems_of_l4d_mike_booth.pdf
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
---
# Contextual Barks - Rule-Based NPC Lines That React to the World

"Barks" are the short lines characters say during play: "Behind you!", "I'm almost out of batteries", "Not this room again". They make companions and enemies feel aware, and in a story game they carry much of the characterisation, because players hear them while doing things instead of reading menus. Scripting each bark with an `if` gets unmanageable quickly. Valve's Elan Ruskin presented a different approach at GDC 2012 (*AI-driven Dynamic Dialog through Fuzzy Pattern Matching*), used in Left 4 Dead and other Valve games: characters **query a rule database with facts about the world**, and the most specific matching rule wins. The GDC Vault abstract describes matching hundreds of world facts against a database of lines, letting characters remember history, and cascading from special cases to general ones. (GDC Vault was under maintenance on 2026-10-25; the slides themselves were not re-checked.)

## The idea in four parts

1. **Concept**: what just happened. `SawMonster`, `PickedUpItem`, `EnteredRoom`, `TeammateDowned`, `Idle`.
2. **Facts**: a small table of current world state sent with the query. `speaker = "Mara"`, `room = "Kitchen"`, `health = 30`, `monsterDistance = 18`, `timesSeenMonster = 3`.
3. **Rules**: each line has criteria that must all be true. More criteria = more specific.
4. **Pick**: of the rules whose criteria all match, choose the one with the **most criteria** (most specific). Ties pick randomly. Then remember it was said.

This gives the cascade for free: a general "SawMonster" line always exists, and special lines ("SawMonster in the kitchen when hurt, third time") override it when their conditions are met.

## Rules as data

```lua
-- ReplicatedStorage/Barks
return {
	{concept = "SawMonster", speaker = "Mara", line = "BARK_MARA_RUN"},
	{concept = "SawMonster", speaker = "Mara", lowHealth = true, line = "BARK_MARA_HURT_RUN"},
	{concept = "SawMonster", speaker = "Mara", seenBefore = 3, line = "BARK_MARA_AGAIN"},
	{concept = "EnteredRoom", room = "Kitchen", flag = "kitchenAttack", line = "BARK_KITCHEN_MEMORY"},
	{concept = "Idle", speaker = "Mara", line = "BARK_MARA_IDLE_1", cooldown = 60},
}
```

```lua
local function score(rule, facts)
	local n = 0
	for key, want in rule do
		if key ~= "line" and key ~= "cooldown" then
			local have = facts[key]
			if key == "seenBefore" then
				if (have or 0) < want then return -1 end
			elseif have ~= want then
				return -1
			end
			n += 1
		end
	end
	return n
end
-- query: score every rule, drop -1, take the highest, skip ones on cooldown
```

A linear scan is fine for a few hundred rules. Group rules by `concept` first if you have thousands.

## Memory makes it feel alive

- Store **"said" counters** per line and per concept. Use them as facts (`timesSaid_BARK_MARA_RUN`) so a line is not repeated, and the third time a character can comment on the repetition.
- Story flags are facts too, so barks can reference past choices ("You should have left me at the bridge").
- Respect **cooldowns** per line, per speaker and globally (no more than one bark every 3-4 s across the party) so characters do not talk over each other or story dialogue.

## Roblox delivery

- Show barks as **short subtitles** near the bottom, or as bubble text above the NPC. For NPC bubbles, `TextChatService:DisplayBubble(partOrCharacter, message)` shows a chat bubble above a part or character (call it on the client). Keep them 3-8 words.
- Voice them if you can; barks are the cheapest lines to record ([[Story - Voice-Over Pipeline - Line IDs, Recording Specs and Roblox Upload Limits]]).
- Decide barks on the **server** when they reflect shared events (a teammate went down) and on the **client** for personal ones (your own flashlight is low).
- Use the tension director state as a fact so companions joke in Relax and whisper in Build Up ([[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]]).

## Writing tips

- Write the **general line first** for every concept, then specials.
- Each special line should reveal **character or story**, not just restate the situation.
- Lines are localization keys; keep them short so they translate well ([[Story - Writing for Kids and Teens on Roblox - Reading Level, Tone and Safety]]).

## Related
[[Story Quests Cinematics - Hub]] · [[Dialogue Trees as Data - Nodes, Conditions and Effects]] · [[Companion and Pet Follower AI]] · [[LLM NPC Dialogue with TextGenerator]]
