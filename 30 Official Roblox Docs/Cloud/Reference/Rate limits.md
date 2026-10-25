---
title: "Rate limits"
description: "Explains rate limiting on Open Cloud endpoints."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/reference/rate-limits"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains rate limiting on Open Cloud endpoints.*

Rate limits control the number of requests you can make to endpoints within a specific time window. These limits help ensure service stability and protect Roblox resources from abuse.

## Discovery

There are two ways to determine rate limits: the reference documentation and response headers.

### Documentation pages

Public rate limits can be found under the **Limits** section for each endpoint on their documentation pages. View these sections to understand the rate limits that apply before making requests.

> [!info]
> We strive to be as transparent as possible about rate limits, but additional, undocumented limits may apply, including for DDoS protection and service stability. Always ensure your application handles HTTP 429 rate limit responses. See [[30 Official Roblox Docs/Cloud/Reference/Rate limits#Handling rate limits|Handling rate limits]] for guidance.
>
> If you hit an undocumented rate limit that blocks your use case (or you would like higher limits for an endpoint), please leave feedback explaining your needs in the [Developer Forum](https://devforum.roblox.com/).

### Response headers

Many API responses include headers that provide information about your current rate limit status.

| Header                  | Description                                                                                                                           |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `x-ratelimit-limit`     | The total number of requests allowed within the rate limit window. This may include multiple limit values for different time windows. |
| `x-ratelimit-remaining` | The number of requests you can still make with your current authentication. When this reaches 0, you receive HTTP 429 responses.   |
| `x-ratelimit-reset`     | The number of seconds remaining until your rate limit quota resets to the full limit.                                                 |

Here's an example of rate limit headers in an API response:

```text
x-ratelimit-limit: 1000, 1000;w=60, 1000;w=60
x-ratelimit-remaining: 998
x-ratelimit-reset: 20
```

In this example:

- You have 998 requests remaining out of your total limit.
- Your quota will reset in 20 seconds.

## Behavior

Rate limit behavior differs by authentication method and request origin, including whether you make requests from within a Roblox game.

### API key

Rate limits for API keys are applied across all API keys per owner, which can be either a user or a group. These limits are enforced consistently regardless of where the requests originate—whether from [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]], web applications, or other sources.

#### In-game with HttpService

When calling endpoints in-game using [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]], requests also contribute to the fixed limit of 500 HTTP requests per minute per Roblox game server. See [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests|In-game HTTP requests]] for more details.

### OAuth 2.0

OAuth 2.0 rate limits are applied per access token. Since each access token represents a unique combination of user and application, every user using your app receives their own independent rate limit quota.

## Handling rate limits

Write your code to expect and handle HTTP 429 (Too Many Requests) responses due to documented limits, abuse prevention, or high-load scenarios. When rate limited, check the `retry-after` response header as a guideline for when to retry. If there is no `retry-after` response header present, implement an exponential backoff retry strategy.

---
*Source: [Rate limits](https://create.roblox.com/docs/cloud/reference/rate-limits) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
