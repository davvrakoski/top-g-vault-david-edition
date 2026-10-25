---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Publishing a Plugin - Publish as Plugin, Creator Store Listing and Upload Limits"
tags: [roblox, community-knowledge, studio, plugins, publishing, creator-store]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/plugins
  - https://create.roblox.com/docs/production/creator-store
---
# Studio Tools - Publishing a Plugin - Publish as Plugin, Creator Store Listing and Upload Limits

A local plugin only lives on one PC. Publishing turns it into an asset that you (and, if you choose, everyone) can install from the Toolbox. Then teammates get the same tool, a reinstall after a new PC takes one click, and updates reach everyone. This note covers the upload steps, Creator Store distribution, the per-30-day limits that surprise new publishers, and a release routine that avoids breaking users.

## Upload to your inventory

1. Select the plugin's root `Script` in the Explorer (build it from Rojo first if you use files, see [[Studio Tools - Plugin Projects with Rojo - rojo build --plugin and Watch Reload]]).
2. **Plugins** menu > **Publish as Plugin**.
3. Optional: click the puzzle-piece image to upload a **512 x 512** thumbnail.
4. Fill in **Name**, **Description** and **Creator** (you or one of your groups).
5. **Submit**. The plugin is now in Toolbox > **Inventory** and **Creations**, and only you can see it.

To publish an **update**, publish again from the same root script and choose to overwrite the existing asset rather than create a new one (wording of the overwrite option unverified; check that the asset ID did not change).

## Distribute on the Creator Store

On the Creator Hub: **Development Items** > select the plugin > its **Configure** page > **Distribution** section > toggle **Distribute on Creator Store** > **Save Changes**. From Studio, Toolbox > **Creations** > right-click > **Edit Asset** leads to the same dashboard page. The **Try in Roblox** section lets you pick a demo game for customers.

- **To distribute at all** (even for free), the account must be at least 2 days old, not recently banned, and verified by an **age check or government ID**. A phone number is not enough.
- **Paid** plugins (USD) need a seller account. See [[Studio Tools - Selling Plugins for USD - Seller Account, Price Range and Payouts]].
- If you are ID- or phone-verified, you can add **up to one video and five thumbnail images** to the listing. Use them. A 20-second GIF-style video of the tool in action sells a building plugin better than any description.

## Upload limits (per 30 days)

From the Creator Store page (2026-10-25):

| Account | Plugins | Models | Meshes | Images | Audio |
| --- | --- | --- | --- | --- | --- |
| Verified (age check or government ID) | **10** | 200 | 200 | 200 | 100 |
| Unverified | **2** | 10 | 10 | 10 | 10 |

Phone verification does **not** count for this. An unverified account that publishes, finds a bug and republishes as a *new* asset can run out of plugin uploads in a day. Overwrite the existing asset instead.

## Write a listing people trust

- **Say exactly what it touches**: "edits selected parts only; inserts no scripts; makes no HTTP requests". If it needs Script Injection or HTTP permission, say why. Users will see the permission prompt anyway ([[Studio Tools - Plugin Permissions - Script Injection and HTTP Domain Prompts]]).
- **Link the source**: a public repo with a license is the strongest trust signal you can give.
- **Changelog** in the description, newest first, with dates.
- **Support link** to your DevForum thread.

## Release routine

1. Bump a `VERSION` constant shown in your panel's footer.
2. Test the built `.rbxm` as a local plugin in a **fresh** place, with **play mode** too ([[Studio Tools - Plugins in Play Mode - Edit, Server and Client DataModels]]).
3. Check that saved settings from the old version still load ([[Studio Tools - Plugin Settings with GetSetting and SetSetting - Limits and Patterns]]).
4. Publish over the existing asset; tag the Git commit.
5. Post the changelog on your DevForum thread.

## Pitfalls

- **Group vs user creator**: plugins you want to **sell** must be owned by an individual account. Group-owned plugins can't be sold.
- **Never include secrets** (API keys, webhooks) in a published plugin. Anyone who installs it can read its source.
- **Bundled libraries** must allow redistribution. MIT/CC0/CC BY 4.0 are bundle-safe; GPL code makes your whole plugin GPL; "no license" means you can't ship it.
- Breaking changes to `pluginGuiId`s or action IDs reset users' layouts and shortcuts. Keep them stable.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Plugin and Free Model Safety Checklist]] · [[Paid or Off-Sale Plugins Often Called Free]] · [[Creator Store]]
