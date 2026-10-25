---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "MessagingService Cross-Server Patterns and Limits"
tags: [deep-dive, roblox, messagingservice, cross-server, live-ops, limits]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# MessagingService Cross-Server Patterns and Limits

**Why this matters:** MessagingService is the only push channel between live servers, so global announcements, admin kicks, live-event triggers and config refreshes all depend on it, but its limits are lower than most people assume and it is explicitly best effort.
This note turns the official limits into practical budgets, shows which patterns fit and which belong in MemoryStores instead, and gives a reusable module with envelopes, de-duplication and retry.

---

## 1. The facts (MessagingService reference, as of 2026; limits "subject to change")

- Servers of the **same experience** communicate through **topics** (strings, 1-80 characters). Delivery is typically within **1-2 seconds**.
- Delivery is **best effort and not guaranteed**. Roblox's own guidance: architect so delivery failures are not critical.
- `MessagingService:SubscribeAsync(topic, callback)` returns an `RBXScriptConnection`; the callback receives a table with `Data` (your message) and `Sent` (when it was sent).
- `MessagingService:PublishAsync(topic, message)` yields until the backend accepts the message.
- Open Cloud can publish to the same topics from outside Roblox (`POST https://apis.roblox.com/cloud/v2/universes/{universe_id}:publishMessage`, API key scope `universe-messaging-service:publish`). **Limits are shared** between in-game and Open Cloud publishing.

| Limit | Maximum |
| --- | --- |
| Message size | 1 KB (1,024 characters) |
| Messages **sent** per game server | `600 + 240 x players in that server` per minute |
| Messages **received** per topic | `40 + 80 x number of servers` per minute |
| Messages **received** for the entire game | `400 + 200 x number of servers` per minute |
| Subscriptions per game server | `20 + 8 x players in that server` |
| Subscribe requests per game server | 240 per minute |

---

## 2. What the limits mean in practice

The receive limits are the ones that bite, because **one publish to a topic that every server subscribes to is received once per server**.

Our reading of the table (verify against your own observability, since Roblox does not spell out the fan-out accounting):

- Per topic: `(40 + 80n)` receives per minute across `n` subscribed servers is roughly **80 publishes per minute per topic**, no matter how many servers you have.
- Whole game: `(400 + 200n)` receives per minute is roughly **200 publishes per minute across all topics** when every server subscribes to everything.

So MessagingService is a channel for **tens of events per minute**, not thousands. Examples:

| Use | Publishes/min | Fits? |
| --- | --- | --- |
| Global "rare drop" announcement, throttled to 1 per 10 s | 6 | Yes |
| Admin kick/ban broadcast | rare | Yes |
| Live event start/stop, config refresh ping | rare | Yes |
| Every server heartbeats its player list every 60 s (500 servers) | 500 | **No**: use a MemoryStore sorted map |
| Cross-server chat for every message | hundreds+ | **No** (and use TextChatService for chat filtering) |
| Syncing a shared world state | continuous | **No**: MemoryStore hash/sorted map |

Roblox's own cross-server guide reflects this: its server-browser example updates once a minute and displays on a maximum of 20 servers.

---

## 3. Patterns that work

### A. Broadcast: announcements and live events

One topic, low frequency, everyone subscribes. Payload carries everything needed; no follow-up requests.

### B. Invalidate, then pull

Instead of pushing data, push "something changed" and let each server **re-read** the source of truth (DataStore, MemoryStore, Configs). Lost messages are covered by a periodic re-read (for example every 5 minutes), so best-effort delivery becomes "fast path plus guaranteed slow path".

### C. Targeted command with an addressee

Admin commands ("kick user 123", "grant compensation to user 456") go to a shared topic with a target. Every server checks whether the target is local and ignores it otherwise. The command must also be persisted (DataStore ban list, pending-grant record) so a player not currently online is handled when they join.

### D. Cross-server request with a reply topic

Rarely needed and fragile. If you must ("which server is my friend in?"), use `TeleportService:GetPlayerPlaceInstanceAsync` for that specific case, and MemoryStores for anything else that needs an answer.

---

## 4. A reusable module: envelopes, de-dupe, retries

```luau
--!strict
-- ServerScriptService/Services/CrossServer.luau
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService("MessagingService")

local TOPIC = "XS_v1" -- one multiplexed topic; version in the name
local MAX_BYTES = 1000 -- leave headroom under the 1 KB limit

type Envelope = {
	v: number,       -- envelope version
	t: string,       -- message type
	id: string,      -- unique message id, for de-duplication
	from: string,    -- sender JobId ("opencloud" for external tools)
	p: any,          -- payload
}

type Handler = (payload: any, envelope: Envelope) -> ()

local handlers: { [string]: Handler } = {}
local seen: { [string]: number } = {} -- id -> os.clock() when seen
local seenCount = 0

local CrossServer = {}

function CrossServer.On(messageType: string, handler: Handler)
	assert(handlers[messageType] == nil, "duplicate handler: " .. messageType)
	handlers[messageType] = handler
end

local function remember(id: string): boolean
	if seen[id] then
		return false
	end
	seen[id] = os.clock()
	seenCount += 1
	if seenCount > 500 then
		-- Prune entries older than 5 minutes.
		local cutoff = os.clock() - 300
		for key, at in seen do
			if at < cutoff then
				seen[key] = nil
				seenCount -= 1
			end
		end
	end
	return true
end

local function dispatch(envelope: any)
	if typeof(envelope) ~= "table" or envelope.v ~= 1 then
		return
	end
	if typeof(envelope.t) ~= "string" or typeof(envelope.id) ~= "string" then
		return
	end
	if not remember(envelope.id) then
		return -- duplicate delivery
	end
	local handler = handlers[envelope.t]
	if handler then
		local ok, err = pcall(handler, envelope.p, envelope)
		if not ok then
			warn(("[CrossServer] handler %s failed: %s"):format(envelope.t, tostring(err)))
		end
	end
end

function CrossServer.Publish(messageType: string, payload: any, includeSelf: boolean?): boolean
	local envelope: Envelope = {
		v = 1,
		t = messageType,
		id = HttpService:GenerateGUID(false),
		from = game.JobId,
		p = payload,
	}
	local encoded = HttpService:JSONEncode(envelope)
	if #encoded > MAX_BYTES then
		warn(("[CrossServer] %s payload too large (%d bytes)"):format(messageType, #encoded))
		return false
	end

	if includeSelf then
		-- Handle locally right away; the echo (if any) is de-duplicated by id.
		dispatch(envelope)
	end

	local delaySeconds = 1
	for attempt = 1, 3 do
		local ok, err = pcall(function()
			MessagingService:PublishAsync(TOPIC, envelope)
		end)
		if ok then
			return true
		end
		warn(("[CrossServer] publish attempt %d failed: %s"):format(attempt, tostring(err)))
		task.wait(delaySeconds)
		delaySeconds *= 2
	end
	return false
end

function CrossServer.Start()
	task.spawn(function()
		local delaySeconds = 2
		while true do
			local ok, connectionOrErr = pcall(function()
				return MessagingService:SubscribeAsync(TOPIC, function(message)
					local data = message.Data
					if typeof(data) == "string" then
						-- Open Cloud publishes a string; accept JSON envelopes from tools.
						local decoded
						local okDecode = pcall(function()
							decoded = HttpService:JSONDecode(data)
						end)
						if okDecode then
							dispatch(decoded)
						end
					else
						dispatch(data)
					end
				end)
			end)
			if ok then
				return -- subscribed for the server's lifetime
			end
			warn("[CrossServer] subscribe failed, retrying:", connectionOrErr)
			task.wait(delaySeconds)
			delaySeconds = math.min(delaySeconds * 2, 60)
		end
	end)
end

return CrossServer
```

Why it is built this way:

- **One multiplexed topic** instead of one topic per feature keeps you far from the subscription limit (`20 + 8 x players`) and makes the per-topic budget a single number to watch. If one message type is high-volume, give it its own topic so it does not starve the others.
- **Subscribe once per server**, not per player. The docs' sample subscribes inside `PlayerAdded`; that pattern multiplies subscriptions and subscribe requests with player count.
- **Envelope with an id**: duplicates and self-echoes are dropped. Including the sender `JobId` makes logs traceable.
- **Size check before publishing** using the JSON-encoded length, with headroom.
- **Retry with backoff on publish**, but only a few times: a message that is 30 seconds late is often worse than none for live events. Persist anything that must eventually happen.

---

## 5. Examples on top of the module

```luau
-- Global rare-drop announcement, throttled per server.
local lastAnnounce = 0
local function announceRareDrop(player: Player, itemName: string)
	if os.clock() - lastAnnounce < 10 then
		return
	end
	lastAnnounce = os.clock()
	CrossServer.Publish("RareDrop", { name = player.DisplayName, item = itemName }, true)
end

CrossServer.On("RareDrop", function(p)
	if typeof(p) ~= "table" or typeof(p.name) ~= "string" or typeof(p.item) ~= "string" then
		return
	end
	-- Show via your announcement UI remote. Display names are already
	-- platform-filtered; any free text a player typed must go through TextService filtering.
	AnnouncementRemote:FireAllClients(p.name, p.item)
end)

-- Admin kick: persisted ban first, broadcast second.
CrossServer.On("Kick", function(p)
	local target = game:GetService("Players"):GetPlayerByUserId(tonumber(p.userId) or 0)
	if target then
		target:Kick(typeof(p.reason) == "string" and p.reason or "Removed by moderator.")
	end
end)
```

For permanent bans, prefer Roblox's **Ban API** (`Players:BanAsync`) or the Open Cloud **user restrictions** endpoints, which apply across all servers and future joins without any messaging; use the broadcast only for immediate effects your own systems need. See [[Open Cloud APIs for Live Ops - Worked Examples]].

---

## 6. Publishing from outside Roblox

```bash
curl -X POST "https://apis.roblox.com/cloud/v2/universes/$UNIVERSE_ID:publishMessage" \
  -H "x-api-key: $ROBLOX_API_KEY" \
  -H "Content-Type: application/json" \
  --data '{"topic":"XS_v1","message":"{\"v\":1,\"t\":\"LiveEvent\",\"id\":\"evt-2026-10-31-start\",\"from\":\"opencloud\",\"p\":{\"event\":\"halloween\",\"state\":\"start\"}}"}'
```

The message arrives as a **string**, which is why the module decodes JSON strings. Use a **stable id** (like `evt-2026-10-31-start`) for operator actions so re-sending the command after a timeout does not trigger the event twice.

---

## 7. Testing and monitoring

- MessagingService works in Studio play sessions for basic tests, but cross-server behaviour needs real servers; use a private test universe with two or more live servers.
- Log publish failures and handler errors with the message type; watch for throttling errors in live logs ([[Observability and Debug Logging]]).
- Keep a counter of publishes per minute per type in your analytics or logs and compare with the budgets in section 2.

---

## Common mistakes

- Using MessagingService for state that must be correct (inventories, trades, currency).
- One topic per player or per feature, running into the subscription limit.
- Subscribing inside `PlayerAdded`.
- Server heartbeats or server lists over MessagingService at scale; use MemoryStore sorted maps with expirations.
- No size check, so large payloads fail only in production.
- No de-duplication, so retried operator commands fire twice.
- Assuming the publishing server does or does not receive its own message; handle both with ids.
- Displaying player-written text from messages without filtering.

## Checklist

- [ ] Every message type has a documented max rate and fits the per-topic and per-game budgets.
- [ ] One subscription per topic per server, with retry on failure.
- [ ] Envelope with version, type, id and sender; duplicates dropped.
- [ ] Payloads validated in handlers, size-checked before publish.
- [ ] Anything that must eventually happen is persisted, with the message as a fast path.
- [ ] Open Cloud tools use stable ids and a test universe first.

**Related:** [[Server Engineering - Hub]] · [[DataStore vs MemoryStore vs Messaging vs Configs]] · [[Data, Saving and Cross-server Systems]] · [[Open Cloud and External Tooling]] · [[Errors, Observability and Incident Response]]
