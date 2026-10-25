---
area: "01 Start Here"
cluster: "Start Here"
title: "Publishing Your First Experience - 2026 Release Checklist"
tags: [roblox, community-knowledge, start-here, publishing, release, maturity]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/publish-games-and-places
  - https://create.roblox.com/docs/projects/configure-games
  - https://create.roblox.com/docs/projects/version-history
  - https://create.roblox.com/docs/projects/update-games
---
# Publishing Your First Experience - 2026 Release Checklist

"Publish" and "release" are two different steps on Roblox. **Publishing** uploads your place to the cloud and gives it an ID, but only you and your collaborators can play. **Releasing** makes it playable by the public, and in 2026 that step has real requirements: an age check, a maturity questionnaire, and extra steps if you want players of all ages. Beginners often publish, share the link, and wonder why friends see "not available". This checklist walks the whole path.

## Step 1: publish (private)

1. **File > Publish** (or `Alt+P`). The Game details window opens.
2. Add an icon and a thumbnail (placeholder art is fine for now).
3. Enter a **Name**, pick a **Genre** (and optional subgenre), write a short **Description**.
4. Save. The game now has a `UniverseID` and lives on your account, so you can open it from any computer.

After the first publish, every later publish asks for **version notes**. Write a real sentence ("added stage 6-10, fixed kill brick double damage"). They show up in Version History and save you later.

### Naming advice from the docs

- Keep the name stable; frequent renames make the game harder to find.
- No keyword spam ("Obby OBBY OBBY") and at most one or two well-placed emojis.
- Describe the genre and what is unique in the description; discovery systems read it.

## Step 2: test privately with real people

**File > Invite early testers**: up to 10 similar-aged friends can preview before release. They see a preview watermark. Roblox asks you to complete an age check first if you have not.

## Step 3: release to the public

Requirements to release to **ages 16+ and Trusted Friends**:
- [ ] Account in good standing and at least 2 days old
- [ ] Age check done (facial age estimation or government ID)
- [ ] Answer the first questionnaire question: does the game contain age-restricted content?
  - **No** gives a "Content May Vary" label and releases to age-checked users 16+.
  - **Yes** means completing the whole questionnaire; the label and audience (16+ or verified 18+) follow from your answers.

Extra requirements to release to **all ages** (including Roblox Kids and Select accounts):
- [ ] Account verified (facial estimation if under 18, government ID if 18+)
- [ ] 2-Step Verification enabled
- [ ] Either 2 consecutive months of Roblox Plus or Premium, **or** a one-time refundable fee: 1,000 Robux publishing fee (refunded if the game keeps 25 highly engaged players for 60 days without moderation) or a 50,000 Robux expedited review fee
- [ ] Full Maturity & Compliance Questionnaire completed with a Minimal, Mild or Moderate (9+) rating
- [ ] Game passes the evaluation for Kids and Select accounts

These requirements apply to **every** release action: first release, releasing a new version, Publish As to another game, and changing audience settings. You can release at most 5 never-before-released games per day.

## Step 4: set who can play

Creator Dashboard > your game > **Publish settings > Manage Audience > Manage access**:
- **Playtest** tab: early testers (always on) and optional playtesters with Playtest access.
- **Public** tab: **Friends** only, or off for everyone (subject to age and region rules).
- Optional: **Audience > Advanced Settings > Exclude from recommendations** if you want a quiet soft launch.
- **Audience > Access Settings** sets minimum age and allowed regions.

## Step 5: settings beginners forget

| Setting | Where | Why |
| --- | --- | --- |
| Enable Studio Access to API Services | File > Experience Settings > Security | DataStores fail in Studio without it |
| Allow copying | Dashboard > Configurations > Places > start place > Permissions | Off by default; turn on only if you want an uncopylocked showcase |
| Strong language | Dashboard settings | Only for older audiences; assets and game page still may not contain it |
| Copy URL | Dashboard "..." menu | Share link for your game's main page |

## Step 6: after every update

1. Publish with notes.
2. If the game is live, restart servers: Dashboard > **Configurations > Server management > Restart Servers**. Tick **Restart only servers with outdated versions**, and optionally **Delay server restart** (1-60 minutes of bleed-off) so players are not kicked mid-round.
3. Check Output and the Developer Console (F9) in a live server for new errors.

## Related
[[00 START HERE - Top G Vault]] · [[Release Checklist]] · [[Saving and Version History - Never Lose a Place]] · [[Update Cadence and Server Restarts Without Losing Players]] · [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|Create and publish games and places (official)]]
