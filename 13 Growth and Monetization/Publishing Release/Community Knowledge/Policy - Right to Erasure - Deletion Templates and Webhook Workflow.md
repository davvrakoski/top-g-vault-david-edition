---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Right to Erasure - Deletion Templates and Webhook Workflow"
tags: [roblox, community-knowledge, publishing, policy, privacy, rtbf, gdpr, datastores, webhooks]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/RTBF-and-creators
  - https://create.roblox.com/docs/cloud-services/data-stores/right-to-be-forgotten
  - https://create.roblox.com/docs/cloud/webhooks/automate-right-to-erasure
  - https://create.roblox.com/docs/cloud/webhooks/webhook-notifications
---
# Right to Erasure - Deletion Templates and Webhook Workflow

> Not legal advice. Summary of the Creator Hub pages "RTBF and creators", "Data store right to be forgotten (RTBF)", "Automate right to erasure using webhooks" and "Webhook notifications", checked 2026-10-25.

When a player asks Roblox to delete their account, privacy law expects every **controller** of their data to delete it too, and Roblox's docs say that includes you for data in your games. Roblox tells you about each request and now offers automation. Set it up before launch; a popular game can get many requests a day.

## How Roblox notifies you

- A **daily Roblox inbox message** lists RTBF requests needing action and the affected games. This always arrives, even if you automate.
- **Automated data store deletion** if you configured deletion templates.
- A **creator webhook** with the "Right to Erasure Request" trigger if you configured one.

You stay responsible for deleting **all** covered personal data, including anything outside your templates.

## Option 1: deletion templates (preferred for DataStores)

Templates tell Roblox which data stores or keys belong to a user. Use the case-sensitive `{UserId}` token. Up to **100 templates** per game.

Eligibility:

- Standard or ordered data stores (deleting a whole store works for standard only).
- The UserId must be in the **name or scope** of the store or key.
- The pattern must be a static string such as `User_{UserId}`.

Set up in Creator Dashboard: game > **Configurations > Data stores manager > RTBF Deletion > Create Template**, choose Standard Data Store, Standard Key or Ordered Key, enter the pattern, check the sample output, click Create. Group games need View Analytics plus Edit and publish permissions. You can also push a `user_data_templates` JSON config through the Open Cloud Configs API (API key with `universe:read` and `universe:write`). If `scope_pattern` is blank it defaults to `global`.

**Design consequence:** choose key names now that templates can match. `PlayerData_{UserId}` works; a key that mixes several users (a guild record listing members) does not, and needs custom handling.

## Option 2: the webhook (for everything else)

Use it when data lives outside DataStores (your own backend, MemoryStores you persist elsewhere), or when your schema does not fit templates.

Payload (fixed fields plus an event payload):

```json
{
  "NotificationId": "unique id - treat repeats as duplicates",
  "EventType": "RightToErasureRequest",
  "EventTime": "ISO timestamp",
  "EventPayload": { "UserId": 1, "GameIds": [1234, 2345] }
}
```

Security: set a **secret** when configuring the webhook. Roblox sends a `roblox-signature` header formatted `t=<timestamp>,v1=<signature>`. Rebuild `timestamp + "." + rawBody`, compute HMAC-SHA256 with your secret, Base64 it, and compare. Reject old timestamps (the docs suggest about a 10-minute window) to stop replays.

Processing steps (our summary of the official tutorial, which uses a Discord bot and Open Cloud):

1. Verify signature and de-duplicate by `NotificationId`.
2. For each affected game, delete the user's keys through the **Open Cloud data stores API** (API key scoped to those universes).
3. Delete the user's rows in any external database.
4. Log only the NotificationId, timestamp and result, not the deleted data.

## Pre-launch checklist

- [ ] Inventory of every place you store anything keyed by UserId (DataStores, OrderedDataStores, external DB, logs)
- [ ] Templates created and sample output checked
- [ ] Webhook configured with a secret if any data is outside DataStores
- [ ] Someone owns reading the daily RTBF message
- [ ] Leaderboards rebuilt so deleted users disappear

## Related
[[Publishing Release - Hub]] · [[Policy - Player Data, COPPA and GDPR Basics for Creators]] · [[Data store right to be forgotten (RTBF)]] · [[Automate right to erasure using webhooks]]
