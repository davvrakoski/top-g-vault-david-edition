---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Offline Gifting and Mailboxes - Delivering Items to Players Not Online"
tags: [roblox, community-knowledge, data-backend, gifting, mailbox, compensation, messagingservice]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/GlobalDataStore#UpdateAsync
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/cross-server-messaging
  - https://create.roblox.com/docs/cloud/guides/data-stores
---
# Offline Gifting and Mailboxes - Delivering Items to Players Not Online

Gifts to a friend, compensation after an outage, a support refund, a sold auction listing paying out: all of these need to put something into a player's inventory **while that player is somewhere else**, maybe in another server, maybe offline. Writing straight into their profile key fights the session lock and loses updates. The standard answer is a **mailbox**: a separate key per player that anyone may append to, and only the player's own session drains.

## Why not write to the profile directly

The profile key is owned by whichever server holds the session lock ([[DataStore Session Locking, Retries, Versioning and Erasure]]). If server B edits it while server A has the player loaded, A's next autosave overwrites B's change. Session-locked libraries refuse foreign writes for exactly this reason. A mailbox key has no lock owner, so multiple writers are fine as long as every write is an `UpdateAsync` append.

## Shape

Store: `Mailbox_v1`, key: `mb_<userId>`.

```lua
-- value stored in mb_<userId>
{
	mail = {
		{ id = "<guid>", kind = "gift", from = 1234, items = { {d = "pet_dog"} }, coins = 0,
		  note = "filtered text or nil", t = 1761350400 },
	},
}
```

- `id` is a GUID minted by the **sender's** server. It is the idempotency key: the receiver records claimed ids, so a mail delivered twice by a retry is only granted once.
- Keep entries small and cap the list (for example 100). If full, the sender gets "Mailbox full" instead of silently dropping.
- `note` must be filtered for the recipient before display; gift notes are user text ([[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]).

## Sending

```lua
local function sendMail(toUserId: number, entry): boolean
	local ok, result = pcall(function()
		return mailStore:UpdateAsync("mb_" .. toUserId, function(box)
			box = box or { mail = {} }
			if #box.mail >= 100 then return nil end -- cancel: full
			table.insert(box.mail, entry)
			return box, { toUserId }
		end)
	end)
	return ok and result ~= nil
end
```

The second return value re-sets the key's `userIds`. The docs warn that whatever you do not return from the transform is cleared, so if you also use key metadata, return `keyInfo:GetMetadata()` as the third value.

For a **gift** that leaves the sender's inventory, remove from the sender first as a pending transaction, then send, then complete; on failure, return the item. Same pattern as [[Idempotent Transaction Ledger]].

## Receiving (drain)

The player's own server drains on join and whenever it is told new mail arrived:

1. `UpdateAsync` the mailbox: copy out all entries, return an empty `mail` list.
2. For each entry whose `id` is not in `profile.claimedMail`, grant it and add the id (keep the last ~200 ids).
3. Save the profile.

If the server crashes between 1 and 3, the entries are lost. To avoid that, swap the order for valuable mail: grant into the profile with the id recorded, save, **then** remove those ids from the mailbox. Because of the claimed-id set, re-reading the same entry later is harmless.

## Nudging the online recipient

Publish `{userId}` on a MessagingService topic like `mail_ping` after sending. Every server checks whether that user is in it and drains if so. MessagingService delivery is best-effort, so also drain on join and on a slow timer (every few minutes with jitter); the topic is an optimization, not the delivery mechanism ([[MessagingService Cross-Server Patterns and Limits]]).

## Support and live-ops use

Mailboxes are the safest way for staff tools to give compensation: an Open Cloud data store write to `mb_<userId>` never touches a live profile, so it cannot fight a session ([[Open Cloud APIs for Live Ops - Worked Examples]]). Bulk compensation ("everyone online during the outage") should be a config-driven claim instead: a list of eligible userIds and a claim id checked at login, rather than millions of mailbox writes.

## Pitfalls

- Using `SetAsync` to append: two senders at once and one gift vanishes.
- No idempotency id: a retried send grants twice.
- Letting the client say "claim mail id X": the server drains; the client only displays.
- Forgetting the `userIds` argument, so erasure requests miss the mailbox key.

## Related
[[Data Backend - Hub]] · [[Clan and Guild Data - Multi-Writer Keys Without Lost Updates]] · [[Cross-Server Auction House - Order Book and Escrow]] · [[Net - Staff Audit Logs - Recording Every Admin Action]]
