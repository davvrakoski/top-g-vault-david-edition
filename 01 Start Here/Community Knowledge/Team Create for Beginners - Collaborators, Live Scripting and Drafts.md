---
area: "01 Start Here"
cluster: "Start Here"
title: "Team Create for Beginners - Collaborators, Live Scripting and Drafts"
tags: [roblox, community-knowledge, start-here, collaboration, team-create]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/collaboration
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/projects/game-ownership-transfer
  - https://devforum.roblox.com/t/age-requirements-for-team-create-in-studio/4539725
---
# Team Create for Beginners - Collaborators, Live Scripting and Drafts

Roblox games are rarely made alone for long: a builder, a scripter and a UI artist can share one place in real time through Studio's built-in collaboration (still widely called **Team Create**). It is powerful but easy to misuse: two people editing the same script, a friend with edit rights deleting a map, or a collaborator who cannot join because of the 2026 age rules. This note covers setup, permissions and the two script modes.

## Who can collaborate (age rules)

Using Team Create **with other people** requires an **age check** (ID or facial age estimation). Using it alone does not. After the check you can collaborate with compatible age groups by default:

| Your age group | Can collaborate with |
| --- | --- |
| Under 9 | Users under 13 |
| 9-12 | Users under 16 |
| 13-15 | Users aged 9-17 |
| 16-17 | Users 13 and older |
| 18+ | Users 16 and older |

To work across groups, you must be **Trusted Friends** with every collaborator who already accessed the game, or have a linked parent's permission. Collaborators blocked by these rules keep Edit rights for other routes (Save As a copy, Open Cloud, Creator Hub metadata). Who is blocked is visible in Creator Hub under **Safety > Collaborators**.

## Permission levels

| Level | Can do |
| --- | --- |
| Owner | Everything, including setting others' permissions |
| Edit | Edit the game (includes Play) |
| Play | Play the private game |
| No Access | Nothing |

- **User-owned games:** you can give Play to anyone, but **Edit only to Roblox friends**. Studio: **Collaborate** button (right side of the mezzanine) > search > set **Edit** > Save.
- **Group-owned games:** permissions follow group roles (the "Universe Editor" permission across all group games), or can be granted per game by the owner. For anything you plan to sell or grow, consider a group from day one. You can transfer a game to a group later (game ownership transfer), but user-owned packages, private ModuleScripts and some asset references must be re-uploaded to the group first, and package ownership cannot be transferred.

## Joining a session

Collaborators open the game from Creator Dashboard (or Studio's start page) and appear in the mezzanine. You can see who is in the session and where they are working.

## Scripts: Live Scripting vs Drafts

| Mode | How it works | Good for |
| --- | --- | --- |
| **Live Scripting** (default) | Everyone types into the same script in real time | Pair programming, quick fixes |
| **Drafts** (off by default) | You edit a local draft, test it, then **Commit** | Teams of 2+ scripters, anything risky |

Turn on Drafts in **File > Experience Settings > Enable Drafts Mode**. Then add the **Drafts** window to a custom toolbar tab. Drafts are stored locally on your machine; select scripts there and click **Commit**. If someone commits the same script first, use **Compare With Server** and **Merge From Server**.

Every script change (auto-save, save, commit) is logged in the script's version history, so you can open older versions.

## Team testing

Choose **Team Test** in the test dropdown and press Play; collaborators press Play in their own Studio to join. Only one team test runs at a time; **End Session** kicks everyone.

## Team rules that prevent disasters

1. One owner per area: "Sam owns the map, Alex owns combat scripts". Ask before touching another person's area.
2. Use **Save to Roblox with Notes** (`Ctrl+Alt+S`) before big changes, so you can restore.
3. Give Edit only to people you trust; an Edit collaborator can delete everything or insert a backdoor.
4. Use Drafts once two people write code.
5. Outgrowing this? Move code to Git with Script Sync or Rojo: [[Script Sync vs Rojo — 2026 Decision Guide]].

## Pitfalls

- Inviting a friend who then cannot join: check the age table and Trusted Friend status first.
- Packages edited by two people at once: publish package changes deliberately (see [[Packages for Beginners - Reuse One Asset Everywhere]]).

## Related
[[00 START HERE - Top G Vault]] · [[Studio Collaboration and Team Workflow]] · [[Saving and Version History - Never Lose a Place]] · [[Developer Account Takeovers - Session Theft and Group Hygiene]] · [[30 Official Roblox Docs/Projects/Collaboration|Collaboration (official)]]
