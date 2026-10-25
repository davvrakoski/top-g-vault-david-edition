---
area: "14 Testing and QA"
cluster: "Testing"
title: "Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers"
tags: [roblox, community-knowledge, testing, datastore, migration, fixtures]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores/versioning-listing-and-caching
  - https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits
  - https://create.roblox.com/docs/cloud-services/data-stores/data-stores-manager
  - https://create.roblox.com/docs/projects/update-games
---
# Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers

Every note on save schemas says "test old fixtures before publishing" ([[Save Schema Migrations]]), but not how. A migration bug is the worst kind: it runs once per player, silently, and writes the damage back to the DataStore. This note shows how to build a fixture corpus, what to assert, and the case most teams miss: **old and new servers running at the same time** during a release.

## 1. Build the fixture corpus

A fixture is one saved profile frozen as a Luau table in your repo (for example `tests/fixtures/save_v3_rich.lua`). You want one per schema version, plus weird ones:

| Fixture | Why |
| --- | --- |
| `v1_fresh` | A player who joined once on day one |
| `vN_rich` per version | Max level, full inventory, every currency |
| `legacy_nil_fields` | Fields missing because an old bug never wrote them |
| `legacy_bad_types` | Numbers stored as strings, negative counts, NaN-like values |
| `huge` | Close to your size budget (the hard limit is 4,194,304 characters per key) |
| `mid_trade` | Saved with a pending trade or receipt lock |
| `unknown_future` | Version number higher than the code knows |

Where fixtures come from: hand-write the early ones from old schema code in git history. For real-world oddities, export a few staging or tester saves (Data Stores Manager in the Creator Dashboard can view keys) and **strip user IDs and names** before committing. Never commit production player data to a repo.

## 2. Golden-file tests

For each fixture, keep the expected result after migrating to the latest version (`save_v3_rich.expected.lua`). The test:

```lua
local migrate = require(Shared.SaveMigrations)
for name, fixture in Fixtures do
	local before = table.clone(fixture) -- deep copy in real code
	local after = migrate(fixture)
	expect(after).toEqual(Expected[name])
	expect(fixture).toEqual(before) -- migration must not mutate input
end
```

Run these headless with Lune or Jest Lua in CI ([[Lune Test Harness for Pure Luau Modules]]). When a migration changes on purpose, regenerate the expected file, then **read the diff in review**: an unexpected removed field in a golden diff is the bug you are hunting.

## 3. Invariants that must hold for every fixture

Beyond exact equality, assert properties that catch silent loss:

- `after.Version == LATEST`.
- Total currency after ≥ total before, unless the migration's changelog says otherwise.
- Item count after equals item count before (or the documented conversion).
- Migrating twice gives the same result as migrating once (idempotent).
- Serialized size stays below your budget.
- `unknown_future` is **rejected** (the loader refuses to save it), not "migrated" down.

## 4. The mixed-version case

During a normal release, Restart Servers can migrate only outdated servers, and with a delay old servers keep running for up to an hour. Meanwhile a player can be on a **new** server (save gets migrated to v6 and written), then join a friend on an **old** server that only knows v5. If old code loads v6, ignores unknown fields and saves, the new fields are wiped.

Test it before you ship v6:

1. Publish v5 code to staging; start a server and keep a tester in it.
2. Publish v6; start a second server (new version) with **Restart only outdated** not yet pressed.
3. Tester B joins the v6 server, plays, leaves.
4. Tester B joins tester A's v5 server.
5. Expected: v5 code sees a version newer than it knows and **does not write** (kick with a "please rejoin, update in progress" message, or load read-only).

This is why the `unknown_future` guard must ship one release **before** any migration that needs it.

## 5. Recovery check

DataStore versioning keeps old versions (backups expire 30 days after being overwritten; the latest never expires), and `ListVersionsAsync` / `GetVersionAsync` read them. As part of the test, restore one tester's pre-migration version on staging (by script or the Data Stores Manager **Revert**) and confirm the v6 loader migrates it again cleanly.

## Checklist

- [ ] One fixture per schema version plus the weird ones
- [ ] Golden files reviewed on every change
- [ ] Invariants asserted for all fixtures
- [ ] Future-version guard live one release ahead
- [ ] Mixed-version staging test passed
- [ ] Restore-and-remigrate tested

## Related

[[Testing - Hub]] · [[Save Schema Migrations]] · [[QA - DataStore Failure Testing - Fault Injection and Retry Checks]] · [[Seeded Randomness and Deterministic Tests]]
