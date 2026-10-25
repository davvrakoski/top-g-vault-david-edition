---
title: "Chat system guidelines"
description: "Important guidelines for using the in-game text chat feature."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/guidelines"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Important guidelines for using the in-game text chat feature.*

In-game text chat is any message created within your game that originated from one user and is delivered to one or more other users, including:

- Chat bubbles over an avatar's head
- Direct messages between users
- Chat window communication between users
- Team-specific messages

For sending and delivery, these types of communications must each go through a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] instance. This ensures messages respect privacy settings, are visible to moderators, and are properly text-filtered.

Certain text is **not** considered chat:

- Text on menus created by developers (for example, "Press any button to continue.")
- Status updates from the game (for example, "Two minutes remaining!")
- Announcements from admin commands
- A user renaming their pet dog
- Moderation audit logs or messages
- Any user-generated text unrelated to a conversation
- Comments on posts in a game

  > [!info]
  > If the comments support a reply feature, these replies would be considered a conversation and thus subject to this policy.

For communication shared by users that can be seen by other users, even if it doesn't need to go through [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], you must ensure it goes through a [[30 Official Roblox Docs/UI/Text filtering|text filter]].

## Requirements

- All games that offer in-game text chat for users must integrate [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]], per the [Misusing Roblox Systems Community Standard](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards). For information on migrating from the legacy chat system, see the [Roblox Developer Forum](https://devforum.roblox.com/t/migrate-to-textchatservice-removing-support-for-legacy-chat-and-custom-chat-systems/3237100) and [[30 Official Roblox Docs/Chat/Text chat overview#Migrate from legacy chat|Migrate from legacy chat]].
- All games that offer editable text that can be used and seen between users must add rate limits of at least 1 minute, such as communication through **signs or bulletin boards**. Other intentionally built communications or chat systems must otherwise adhere and call to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]]. See [[30 Official Roblox Docs/Chat/Examples/Rate-limited text inputs|rate‑limited text inputs]] for an example on how to set up rate limiting for text input fields.
- All incoming text that originates from another user must first use [[30 Official Roblox Docs/UI/Text filtering|Text filtering]] before your game displays it.

  If users repeatedly send messages that violate community standards, Roblox warns and then temporarily prevents them from sending messages. To learn more, see [Text Chat Nudge FAQ](https://en.help.roblox.com/hc/en-us/articles/37541811348884-Text-Chat-Nudge-FAQ-s).

- Communication between users must respect user privacy settings.
  - [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] handles basic privacy and parental settings automatically.
  - [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SetDirectChatRequester|TextChannel:SetDirectChatRequester()]] must be used to mark [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] created for direct chat.
- In-game communication should be [reportable for abuse](https://en.help.roblox.com/hc/en-us/articles/203312410-How-to-Report-Rule-Violations). [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] handle this automatically.

## Respect privacy settings

Users can have different levels of access to communication features based on their [privacy and content maturity settings](https://www.roblox.com/my/account#!/privacy/Communication/ExperienceChat) or parental controls. Some users might have additional restrictions or constraints depending on which app store they used to install Roblox or their local laws.

The following methods respect these requirements. Use them within your game to determine how to handle messaging requests:

- [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SetDirectChatRequester|TextChannel:SetDirectChatRequester()]]
- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUserChatAsync|TextChatService:CanUserChatAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUsersChatAsync|TextChatService:CanUsersChatAsync()]]
- [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUsersDirectChatAsync|TextChatService:CanUsersDirectChatAsync()]]

---
*Source: [Chat system guidelines](https://create.roblox.com/docs/chat/guidelines) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
