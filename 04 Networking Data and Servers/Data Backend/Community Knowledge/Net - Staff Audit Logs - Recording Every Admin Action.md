---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Staff Audit Logs - Recording Every Admin Action"
tags: [roblox, community-knowledge, data-backend, admin, moderation, audit-log, support]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/data-stores/versioning-listing-and-caching
  - https://create.roblox.com/docs/reference/engine/classes/DataStore#ListKeysAsync
  - https://create.roblox.com/docs/cloud/guides/data-stores
---
# Staff Audit Logs - Recording Every Admin Action

Once a game has moderators, someone will eventually ask "who gave that player 10 million coins?" or "why was I banned?". If admin commands, support refunds and Open Cloud scripts change data without leaving a trail, you cannot answer, cannot undo mistakes cleanly, and cannot spot a compromised or abusive staff account. An audit log is cheap to add and is the first thing you will want after any incident. This note covers what to record, where to store it on Roblox, and how to keep it trustworthy.

## What every entry needs

| Field | Example | Why |
| --- | --- | --- |
| `id` | GUID | dedupe retries, reference in tickets |
| `t` | Unix seconds | ordering |
| `actor` | staff UserId, or `"ocloud:<key-name>"` | who did it |
| `action` | `grant_coins`, `remove_item`, `ban`, `unban`, `restore_save` | what |
| `target` | player UserId | to whom |
| `delta` | `{coins = 500000}` or `{uid = "..."}` | what changed, compact |
| `reason` | short code + ticket ref, `"refund:T-1182"` | why |
| `src` | `cmd`, `panel`, `script`, `job:<8 chars>` | which tool path |

Record the **delta**, not the whole before/after profile. Full snapshots already exist: DataStore versioning keeps overwritten versions for 30 days, so an entry's time plus target lets you fetch the "before" with `GetVersionAtTimeAsync` ([[DataStore Session Locking, Retries, Versioning and Erasure]]).

## Where to store it

**Day-sharded append keys in a dedicated DataStore** (`AuditLog_v1`):

- Key: `log_2026-10-25` (UTC day). For busy games, add an hour or a shard suffix: `log_2026-10-25_14_3`, picking the shard by hashing the entry id. The data store best-practices page recommends spreading writes across a fixed set of keys rather than one hot key.
- Append with `UpdateAsync` (never `SetAsync`), capping each key's list. A day key of 2,000 entries at ~200 bytes is ~400 KB, well under the 4 MB key limit.
- **Per-target index:** also append the entry id to `t_<targetUserId>` so support can see a player's history without scanning days. Cap it at the last 200 ids.

Listing days later is easy: keys are predictable, and `ListKeysAsync` with a prefix works for exploration.

If you already run an external backend, ship the same entries there too, batched ([[External Backends with HttpService - Limits, Retries and Idempotency]]). Discord webhooks are a poor primary store: they get rate-limited and are not queryable ([[Discord Webhooks from Roblox - Why They Break and Safer Logging]]).

## One function, every path

```lua
local Audit = {}

function Audit.record(actor, action: string, target: number, delta, reason: string, src: string)
	assert(#reason > 0, "audit: reason required")
	local entry = {
		id = HttpService:GenerateGUID(false), t = os.time(),
		actor = actor, action = action, target = target,
		delta = delta, reason = reason, src = src,
	}
	task.spawn(function()
		local day = os.date("!%Y-%m-%d", entry.t)
		appendWithRetry(auditStore, "log_" .. day, entry, 2000) -- UpdateAsync append, capped
		appendWithRetry(auditStore, "t_" .. target, entry.id, 200)
	end)
	return entry.id
end

return Audit
```

Then every admin command, panel button and support script calls `Audit.record` **before** reporting success. Make `reason` mandatory; "no reason given" entries are useless six months later. Command frameworks have a hook for this ([[Cmdr Permissions - BeforeRun Hooks Done Right]]).

Open Cloud scripts run outside the game: give each script its own API key name and have it write the same entry shape through the data store API, so `actor` shows which key did it ([[Open Cloud APIs for Live Ops - Worked Examples]]).

## Keeping it trustworthy

- **No edit or delete command** in game for audit entries. Corrections are new entries (`action = "note"`).
- Separate store, never touched by gameplay code, so a profile bug cannot wipe it.
- Staff permission checks live on the server ([[Admin Command Safety - Server-Side Permission Checks]]); log **denied** attempts too (`action = "denied:<cmd>"`). A spike in denials is how you notice someone probing admin remotes.
- Review weekly: grants per staff member, bans per staff member, anything with `src = script`. Outliers are worth a conversation.

## Privacy

Audit entries contain UserIds. When an erasure request arrives, remove or anonymize the target's index key and replace their id in entries within the retention window you choose ([[Policy - Right to Erasure - Deletion Templates and Webhook Workflow]]). Keep only what you need: no chat logs, no free-text personal details in `reason`.

## Related
[[Data Backend - Hub]] · [[Ban API in Practice - BanAsync, Alt Detection and Appeals]] · [[Net - Offline Gifting and Mailboxes - Delivering Items to Players Not Online]] · [[Net - Item Provenance and Dupe Audits - Mint Records and Duplicate-ID Scans]]
