---
title: "Game ownership transfer"
description: "Transfer ownership of a game to other Roblox users or groups."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/game-ownership-transfer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Transfer ownership of a game to other Roblox users or groups.*

With **game ownership transfer**, you can transfer your games to [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] you have publish access to. This unlocks all of the features available to groups, including permissions and revenue management, and allows you to efficiently manage your content as your team scales and your priorities shift.

## Prerequisites

Before making a transfer or accepting a transfer, you must first:

- Verify your email address.
- Upload your private [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] and [[30 Official Roblox Docs/API Reference/Classes/InsertService|InsertService]] asset usages to the group you're transferring the game to. If the game uses packages where the package owner is a user and not a group, you might have to recreate those packages or replace them with packages that are already owned by a group.

> [!info]
> If you use Open Cloud API keys for the game, be aware that the effective permissions of an API key are determined by the access of the user who last generated the API key. If the transfer changes that user's access to the game, the effective permissions of the API key change accordingly.
>
> In many cases, transfers have no impact on existing API keys. For example, if you transfer a game from your user account to a group you own, your access stays equivalent and existing API keys continue to work as before.
>
> If the transfer does change access, for instance, when you transfer to a group you do not own, or the original owner loses access, you should create new API keys under an account that has the appropriate access for the game.

## Transfer a game

To transfer a game to a group:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and choose the game you want to transfer.
2. In the left-hand navigation, navigate to **Publish Settings** ⟩ **Game details**.
3. Click **Initiate ownership transfer**.
4. In the **Transfer Details** dialog, carefully read and acknowledge the implications of the transfer. Then, click **Next**.
5. Select a group to transfer the game to. You must be able to publish games to this group.
6. Verify the transfer by entering the game name.
7. Click **Initiate transfer**. The **Content Settings** page updates to include the pending group's username.

   > [!warning]
   > Once the group accepts the transfer, Roblox revokes access to your game from the public, and closes all servers associated with the game. The transfer process typically completes in a few minutes but may take longer for complex games.

   > [!info]
   > To cancel a pending transfer, click **Cancel transfer request** in the **Content Settings** page.

## Receive a transferred game

To receive a transferred game:

1. Go to the game page of the game you're receiving. You can navigate to this page by clicking the transfer request notification you received when the game's current owner initiated the transfer, or by directly getting the overview page link from the current owner.
2. In the **Transfer Details** dialog, carefully read and acknowledge the implications of the transfer. Then, click **Next**.
3. Verify the transfer by entering the game name.
4. Click **Accept transfer**.

   > [!warning]
   > Once your group accepts the transfer, Roblox revokes access to your game from the public, and closes all servers associated with the game. The transfer process typically completes in a few minutes but may take longer for complex games.

5. After the transfer to your group is complete, set up any new permissions you need and [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Release games|release the game]] to the public again.

## Frequently asked questions

> [!note]- **What kind of information does the transferred game retain?**
> The transferred game retains its old game ID, place ID, and URL.

> [!note]- **Do transfer requests expire?**
> Yes, transfer requests expire after 7 days.

> [!note]- **How often can the same game be transferred?**
> After receiving a transferred game, you must wait 30 days to transfer that game again.

> [!note]- **Can changes be made to a game that's transferring?**
> You can continue making changes to the game until the new group owner accepts the transfer and the transfer process begins. Changes you make during the active transfer process specifically aren't carried over.

> [!note]- **What happens to credit card information when a game is transferred?**
> Roblox removes credit card information when you transfer a game.

> [!note]- **What happens to revenue from private server subscriptions when a game is transferred?**
> The group you transferred your game to receives the revenue from any existing private server subscriptions. This revenue does not respect any group or game revenue splitting.
>
> New private server subscriptions respect revenue splitting.

> [!note]- **Does transferring a game impact discovery?**
> Transferring a game doesn't impact search as long as the game's title remains the same, the new group owner is not a moderated account, and the game is released again after the transfer.
>
> Note that transferring a game can impact discovery for up to 24 hours after the new group owner releases the game to the public again.

---
*Source: [Game ownership transfer](https://create.roblox.com/docs/projects/game-ownership-transfer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
