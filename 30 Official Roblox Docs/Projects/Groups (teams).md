---
title: "Groups (teams)"
description: "Explains Roblox groups and how to collaborate with multiple creators on the same game."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/groups"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains Roblox groups and how to collaborate with multiple creators on the same game.*

A Roblox **group** allows multiple creators to work on the same game, use the same assets, share profits, and give credit to all contributors.

> [!danger]
> Group ownership of games helps creators collaborate and operate as independent studios. If a conflict arises within a group, Roblox cannot help arbitrate or resolve disagreements.

## Group creation

Creating a group costs 100 Robux. You can manage its [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|roles and permissions]] from the [Creator Dashboard](https://create.roblox.com/dashboard/creations) or [Communities](https://www.roblox.com/communities).

> [!warning]
> Before creating a group, carefully read through the [[30 Official Roblox Docs/Projects/Group guidelines|rules and expectations]] for group management.

To create a new group:

1. Navigate to the [Creator Dashboard](https://create.roblox.com/dashboard/creations), expand the account switcher in the upper‑left, and click the **plus (+)** button.
2. On the **Create Group** page, upload an image for the group logo and enter the group name.
3. When ready, click the **Purchase** button. Once the group is created, you'll be directed to the group profile page where you can modify the group's details, including adding up to three social links.

## Roles and permissions

Group members can be assigned one or multiple **roles** within a group, and each role has **permissions** which specify the abilities of its members.

> [!warning]
> Role configuration is only accessible if you're the group owner or you have permission to create, configure, and assign group roles.

To manage group role assignments programmatically from a game server, use [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] to call the supported Open Cloud Groups endpoints. For setup and sample code, see [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests#Use with Open Cloud|Use with Open Cloud]].

1. From the [Creator Dashboard](https://create.roblox.com/dashboard/creations), expand the account switcher in the upper‑left and select the group.
2. Expand the account switcher again and select **Roles**.
3. For each role, carefully confirm the permissions under the **Permissions** tab.

   Permissions are organized into **General**, **Creation**, and **Community** categories. The sections below describe the permissions available in each category.

   ### General

    > [!note]- **General permissions**
    > | | |
    > | --- | --- |
    > | **Role Manager** | Members with this permission can create, edit, delete, reorder, and assign or unassign roles below their highest role. They can only edit permissions they already hold. |
    > | **Role Assigner** | Members with this permission can assign or unassign roles below their highest role to any member. |
    > | **Member Inviter** | Members with this permission can invite people to the group and approve join requests. |
    > | **Member Kicker** | Members with this permission can remove members whose highest role is below their own. |
    > | **Member Bans Manager** | Members with this permission can ban members whose highest role is below their own. |
    > | **Configure Organization** | Members with this permission can configure the group profile. |
    > | **Audit Log Viewer** | Members with this permission can view [[30 Official Roblox Docs/Projects/Groups (teams)#Group audit logs\|group audit logs]]. |
    > | **Relationship Manager** | Members with this permission can manage the group's allies and enemies. |

### Creation

    > [!note]- **Creations Group**
    > | | |
    > | --- | --- |
    > | **Universe Player** | Members with this role can play all games owned by the group, even if they aren't released to a wider audience. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |
    > | **Universe Editor** | Members with this role can edit all games and [assets](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) owned by the group and use all features in the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data Stores Manager\|Data Stores Manager]]. Does not include editing a game outside of a [[30 Official Roblox Docs/Projects/Collaboration\|collaborative]] session or saving a place from one game into another game. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |
    > | **Universe Publisher** | Members with this role can both edit games, as above, and also publish games to Roblox. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |
    > | **Share Links Manager** | Members with this role can create/configure [[30 Official Roblox Docs/Production/Promotion/Share links\|share links]]. |
    > | **Universe Events Manager** | Members with this role can create/configure [[30 Official Roblox Docs/Production/Promotion/Experience events and updates\|experience events]]. |
    > | **Universe Bans Manager** | Members with this role can view all in-game chat messages (read-only; member must be 18+) and ban or manage banned users across all games owned by the group. |
    > | **Universe Monetization Manager** | Members with this role can manage monetization products such as [[30 Official Roblox Docs/Production/Monetization/Passes\|passes]], [[30 Official Roblox Docs/Production/Monetization/Developer Products\|developer products]], [[30 Official Roblox Docs/Production/Monetization/Subscriptions\|subscriptions]], and more. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per-game permission]]. |
    > | **Universe Secrets Manager** | Members with this role can see the list of [[30 Official Roblox Docs/Cloud Services/Secrets stores\|secrets]] and can create, update, and delete secrets for all games owned by the group. Members with this role require Universe Editor permission to view the Secrets page. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |

    > [!note]- **Analytics Group**
    > | | |
    > | --- | --- |
    > | **Universe Analytics Viewer** | Members with this role can access the [[30 Official Roblox Docs/Production/Analytics/Analytics\|analytics]] of all games owned by the group, even if they don't have edit access. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per-game permission]]. |
    > | **Alerts Manager** | Members with this role can create and manage analytics alerts. Pair this permission with **Universe Analytics Viewer** to see alert annotations directly on metrics graphs. |

    > [!note]- **Monetization Group**
    > | | |
    > | --- | --- |
    > | **Group Revenue Viewer** | Members with this role can view the group Robux balance, any configured recurring split payouts, and revenue logging features. |
    > | **Group Revenue Manager** | Members with this role can view all group revenue, as above, and also directly manage it. This includes setting up [[30 Official Roblox Docs/Projects/Groups (teams)#Recurring payouts\|recurring payouts]] and sending [[30 Official Roblox Docs/Projects/Groups (teams)#One-time payouts\|one‑time payouts]] to collaborators. |
    > | **Ad Manager** | Members with this role can advertise the group. |

   > [!note]- **Avatar Item Group**
   > | | |
   > | --- | --- |
   > | **Avatar Item Creator** | Members with this role can create avatar items such as clothing. |
   > | **Avatar Item Manager** | Members with this role can configure sales details, restocks, and sponsorships for existing group avatar items. |

    > [!note]- **APIGroup**
    > | | |
    > | --- | --- |
    > | **Api Key Manager** | Members with this role can manage [[30 Official Roblox Docs/Cloud/Auth/Manage API keys\|Open Cloud API keys]] for the group. |

    > [!note]- **Development Item Group**
    > | | |
    > | --- | --- |
    > | **Development Item Viewer** | Members with this role can view development items owned by the group, for example **Audio**. |
    > | **Development Item Manager** | Members with this role can upload and configure asset development items such as **Decals**. |
    > | **Development Item Permissions Manager** | Members with this role can configure permissions of development items, for example audio sharing. |

    > [!note]- **Data Stores Group**
    > | | |
    > | --- | --- |
    > | **Data Stores Viewer** | Members with this role can view data stores for all group games through the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data Stores Manager\|Data Stores Manager]], but they cannot delete data. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |
    > | **Data Stores Editor** | Members with this role can delete specific keys within data stores for all group games through the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data Stores Manager\|Data Stores Manager]]. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |
    > | **Data Stores Deleter** | Members with this role can delete entire data stores for all group games through the [[30 Official Roblox Docs/Cloud Services/Data Stores/Data Stores Manager\|Data Stores Manager]]. Optionally available as a [[30 Official Roblox Docs/Projects/Configure games and places\|per‑game permission]]. |

   > [!note]- **Notifications Group**
   > | | |
   > | --- | --- |
   > | **Webhooks Manager** | Members with this role can list, create, update, and delete webhooks for all group experiences. |

   > [!note]- **Communication Group**
   > | | |
   > | --- | --- |
   > | **Universe Ticket Reviewer** | Members with this role can manage support tickets for all group experiences. |

   > [!note]- **Legacy Group**
   > | | |
   > | --- | --- |
   > | **Manage access to this group's resources** | Members with this role can create and edit access to the group's resources. |

### Community

   > [!note]- **Posts Group**
   > | | |
   > | --- | --- |
   > | **Announcement Viewer** | Members with this role can view community announcements. |
   > | **Announcement Creator** | Members with this role can create community announcements. |

   > [!note]- **Forum Group**
   > | | |
   > | --- | --- |
   > | **Forum Category Manager** | Members with this role can manage forum categories. |
   > | **Forum Post Creator** | Members with this role can create forum posts. |
   > | **Forum Post Remover** | Members with this role can remove forum posts. |
   > | **Forum Post Locks Manager** | Members with this role can lock forum posts. |
   > | **Forum Post Pins Manager** | Members with this role can pin forum posts. |
   > | **Forum Comment Creator** | Members with this role can create comments on forum posts. |
   > | **Forum Comment Remover** | Members with this role can remove comments from forum posts. |

   > [!note]- **Content Moderation Group**
   > | | |
   > | --- | --- |
   > | **Content Moderation Viewer** | Members with this role can view content moderation. |
   > | **Content Moderation Manager** | Members with this role can manage content moderation. |

   > [!note]- **Miscellaneous Group**
   > | | |
   > | --- | --- |
   > | **Slowmode Bypasser** | Members with this role can bypass slow mode. |
   > | **Community Analytics Viewer** | Members with this role can view community analytics. |

<br>

4. **IMPORTANT** Click the **Save** button to apply the permission settings.
5. **OPTIONAL** Click the **Settings** tab and choose a color and visibility setting for the role, then click the **Save** button.

   > [!info]
   > A role's **Settings** section is also where group owners and members with sufficient permissions can remove a role entirely through the **Delete Role** button.

Roles are listed in hierarchy order: a role higher in the list has more
authority than a role below it. This order matters because some permissions
only let members manage roles below their own highest role.

Each role is either **public** or **private**. Public roles can be shown on a
Community page and in experiences. Private roles are shown only on role and
permission management surfaces to authorized members, or to members who hold
the private role. Visibility changes where a role appears; it doesn't change
the permissions the role grants.

> [!warning]
> To grant **Role Manager**, **Role Assigner**, **Manage Group Games**, **Group Revenue Manager**, or **Data Stores Deleter**, you must have two-step verification enabled.

## Manage members

> [!warning]
> Member configuration is only accessible if you're the group owner or you have permission to manage other members and their roles.

To manage members from the Creator Dashboard:

1. Expand the account switcher in the upper-left and select the group.
2. Expand the account switcher again and select **Members**.
3. Use the **Member** tab to search for existing members or filter them by role. Use the **Invited** tab to review pending invitations.

To add a member, click the **Invite** button and search for their username. Roblox notifies invited creators according to their notification preferences. You can also copy the group link and share it directly.

### Manage roles

You can manage role assignments from either the **Members** page or a specific role:

- On the **Members** page, click the **plus (+)** button next to a member to open the role menu. To assign a role, click the **plus (+)** button next to it under **Add roles**. To unassign a role, click the **minus (-)** button next to it under **Current roles**, or click the **×** button on an assigned role next to the member's name.
- On the **Roles** page, select a role and open its **Members** tab. Click the **Add Members** button to search for group members and assign them to the role. To unassign a member, click the **minus (-)** button at the end of their row.

### Member removal

To remove a member from the group, click the **⋮** button at the end of their row, select **Kick user**, and confirm the action.

## Manage payouts

If you're the group owner or you have the correct [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|permission]] within **Group Revenue**, you'll find a **Payouts** page under **Finances** in the left navigation. Here, you can send one‑time payouts, as well as define percentage splits with other members.

> [!info]
> Some groups may not have this page unlocked initially for various reasons, such as the age of the group or insufficient funds to payout.

> [!warning]
> Payouts cannot be shared across group members for games that charge for [[30 Official Roblox Docs/Production/Monetization/Paid access in local currency|paid access in local currency]].

### One-time payouts

One-time payouts can be made to members in a batch, selecting a set amount for each. Safety features include 2FA challenges, confirmation dialogues, and checks around the eligibility of members being paid.

*(image in the full Top G Vault)*

Once you click the **Send Robux** button, you can choose payout recipients from the popup or upload a `.csv` spreadsheet file with the columns `userId` and `payoutInRobux`, for example:

| userId | payoutInRobux |
| --- | --- |
| 012345 | 5000 |
| 098765 | 7000 |

### Recurring payouts

Recurring payouts can also be made across the entire group **and** per‑game, assigning a percentage payout to each member before the remainder enters the group's overall balance.

*(image in the full Top G Vault)*

Consider the following scenario where a group game **Laser Maze** is split 40%–30%–10% among three members, with a remainder of 20%.

<br>

*(image in the full Top G Vault)*

Assuming the game earns 1000 Robux, the three members receive 400, 300, and 100 Robux respectively (40%–30%–10%).

*(image in the full Top G Vault)*

The remaining 200 Robux (20% of the game split) passes onward to the **group split** percentages, defined at 20%–20%–10% among the same three members; they receive an additional 40, 40, and 20 Robux respectively.

*(image in the full Top G Vault)*

The remaining 100 Robux (50% of the group split) is placed in the group's overall balance.

*(image in the full Top G Vault)*

> [!warning]
> Note that revenue from [[30 Official Roblox Docs/Production/Monetization/Private servers|private server]] subscriptions does not change if you adjust split percentages at a later time, meaning that if a player buys a private server subscription, the split percentages at time of purchase will apply to that particular subscription forever (until it is canceled). This policy may be changed in the future.

## Group audit logs

Group members with the **Audit Log Viewer** permission can review group changes using these group management surfaces:

- On the Creator Dashboard, select **Activity History** under **Collaboration**.
- On Communities, open the community's configuration page and select **Audit Log**.

Group owners can use these logs to monitor activity that might violate [[30 Official Roblox Docs/Projects/Group guidelines|group guidelines]].

## Intellectual property protection

Group members with permission to edit all group games can enable the [[30 Official Roblox Docs/Projects/Configure games and places#Allow copying|Place Copying]] setting for a creation, potentially allowing the entire Roblox community to copy it and use assets within it. To help protect intellectual property in a group, the owner or members with sufficient permissions should:

- Confirm that each member is [[30 Official Roblox Docs/Projects/Groups (teams)#Manage roles|assigned the appropriate role]].
- Check that each group role has the correct [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|permissions]].
- Confirm that the [[30 Official Roblox Docs/Projects/Configure games and places#Allow copying|Place Copying]] setting is disabled before private assets are added.

## Additional localizations for this page

For additional, localized versions of this page that aren't available in the site's language picker, see the following links:

- [[30 Official Roblox Docs/Projects/Groups (teams)|Bulgarian (български)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Croatian (hrvatski)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Czech (čeština)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Danish (dansk)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Dutch (Nederlands)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Estonian (eesti)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Finnish (suomi)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Greek (Ελληνικά)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Hungarian (magyar)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Irish (Gaeilge)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Latvian (latviešu)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Lithuanian (lietuvių)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Maltese (Malti)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Portuguese - Portugal (português)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Romanian (română)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Slovak (slovenčina)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Slovenian (slovenščina)]]
- [[30 Official Roblox Docs/Projects/Groups (teams)|Swedish (svenska)]]

---
*Source: [Groups (teams)](https://create.roblox.com/docs/projects/groups) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
