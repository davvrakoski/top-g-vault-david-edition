---
title: "Cloud API reference"
description: "Get comprehensive API reference documentation for Open Cloud."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Get comprehensive API reference documentation for Open Cloud.*

With Open Cloud, you can access Roblox resources through standard [REST](https://en.wikipedia.org/wiki/REST) APIs, which lets you build everything from command line automation tools to complex web apps. You can update games, restart servers, work with your data stores and memory stores, manage user restrictions, list inventory items, and much, much more.

This reference is broken into two sections:

- A [section that separates endpoints by feature](https://create.roblox.com/docs/cloud/reference/features/accounts) (Avatars, Game Passes, Users, etc.)
- A [section that separates endpoints by domain](https://create.roblox.com/docs/cloud/reference/domains/apis) (base URL)

**Both sections** contain the full list of available API endpoints. We recommend the [features section](https://create.roblox.com/docs/cloud/reference/features/accounts) since it helps consolidate endpoints by use case, but experienced Open Cloud developers might prefer to browse by domain.

- Whenever possible, use endpoints that support [[30 Official Roblox Docs/Cloud/Auth/Manage API keys|API keys]] or [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 overview|OAuth 2.0]] for authentication. They have strong stability guarantees and receive regular updates.

- Legacy APIs use cookie-based authentication, can incorporate breaking changes without notice, and have minimal stability guarantees. We don't recommend them for production applications.

> [!info]
> Roblox also offers [[30 Official Roblox Docs/Cloud/Webhooks/Webhook notifications|webhooks]], which can notify your applications when certain events occur, such as refunds or changes to subscriptions.

## Get started with Open Cloud

1. Set up authentication for your application.

   See the documentation for how to use [[30 Official Roblox Docs/Cloud/Auth/Manage API keys|API keys]] or [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 overview|OAuth 2.0]]. API keys are the easiest way to get started.

1. Test API calls using tools like [Postman](https://www.postman.com) with [[30 Official Roblox Docs/Cloud/Reference/OpenAPI document|OpenAPI descriptions]] or the [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 sample app|OAuth 2.0 sample app]].
1. Review the [[30 Official Roblox Docs/Cloud/Guides/Open Cloud guides|resource guides]] for end-to-end walkthroughs of using certain APIs.
1. Explore the left navigation for the full list of features, [[30 Official Roblox Docs/Cloud/Reference/Patterns|common API patterns]], [[30 Official Roblox Docs/Cloud/Reference/Types|types]], and [[30 Official Roblox Docs/Cloud/Reference/Errors|error codes]].

## Make requests within games

[[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] lets you make HTTP requests to a subset of the Open Cloud endpoints. For more information, see [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests|In-game HTTP requests]].

---
*Source: [Cloud API reference](https://create.roblox.com/docs/cloud) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
