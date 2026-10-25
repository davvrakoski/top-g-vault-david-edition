---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/secrets-httpservice"
title: "Secrets Store and HttpService - Keeping API Keys Out of Your Place"
tags: [roblox, community, "cluster/performance-and-security", security, httpservice, secrets]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/cloud-services/secrets
  - https://create.roblox.com/docs/reference/engine/classes/HttpService
  - https://create.roblox.com/docs/scripting/security/access-control-and-confidentiality
---
# Secrets Store and HttpService - Keeping API Keys Out of Your Place

Developers still paste API keys straight into a ModuleScript "because it's only required on the server." The problem is where that ModuleScript sits: in ReplicatedStorage it reaches every client. The Creator Hub security docs say that any **ModuleScript that replicates can be decompiled**, even if it is disabled or never required on the client. Keys belong in the **Secrets store**.

## Where a key can live, ranked

| Location | Safe? | Why |
|---|---|---|
| String in a LocalScript or a replicated ModuleScript | **No** | Clients can extract and decompile anything replicated to them. |
| String in a Script in ServerScriptService | Weak | Hidden from clients, but every collaborator, every place copy and every free model with a backdoor can read it. |
| DataStore value | Weak | The Creator Hub names this approach as an unnecessary risk. |
| **Secrets store + `HttpService:GetSecret()`** | **Yes** | Server-only, can't be printed, and locked to a domain. |

## Secrets store facts (Creator Hub)

- Only the **game owner or group owner** can create or edit secrets. The cap is **500 secrets per game**, each up to **1,024 characters**.
- Each secret is bound to a **domain**. A `*` wildcard is allowed but not recommended. Use `*.example.com` or, better, `my.example.com`.
- Secrets are only available on **live servers** and in **collaborative testing**. Calling `GetSecret` in a local playtest or from a client gives `Can't find secret with given key`. To test locally, add local secrets under **File > Experience Settings > Security**.
- `print(secret)` shows only `Secret(name)`. You can't read the string. Build URLs or headers with `:AddPrefix()` and `:AddSuffix()`.
- Secrets can go into the **URL and headers only, not the request body**.
- **Allow HTTP Requests** must be turned on.

## HttpService limits worth designing around

- **500 external requests per minute** per server. A separate **2,500 per minute** applies to Open Cloud requests. Requests over the limit fail. (HttpService API reference.)
- `RequestAsync` throws on timeout or rejection. Always wrap it in `pcall`.
- Clients can't call HttpService. Every outbound call goes through server code, so **a remote that triggers HTTP is a free amplifier** for spammers. Rate-limit it (see [[Remote Rate Limiting Pattern]]).

## Original pattern: one server module owns all outbound HTTP

```lua
-- ServerScriptService/HttpGateway (ModuleScript). Never put this in ReplicatedStorage.
local HttpService = game:GetService("HttpService")

local Gateway = {}
local BUDGET_PER_MINUTE = 400 -- stay under the documented 500/min with headroom
local windowStart, used = os.clock(), 0

local function takeBudget(): boolean
	local now = os.clock()
	if now - windowStart >= 60 then
		windowStart, used = now, 0
	end
	if used >= BUDGET_PER_MINUTE then
		return false
	end
	used += 1
	return true
end

function Gateway.postJson(path: string, body: {[string]: any})
	if not takeBudget() then
		return false, "local HTTP budget exhausted"
	end
	local auth = HttpService:GetSecret("analytics_key"):AddPrefix("Bearer ")
	return pcall(HttpService.RequestAsync, HttpService, {
		Url = "https://api.example.com" .. path, -- domain must match the secret's domain
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json", Authorization = auth },
		Body = HttpService:JSONEncode(body), -- never place the secret in the body
	})
end

return Gateway
```

Keep the budget local and conservative. The engine limit is per server, so other systems that also use HTTP draw from the same pool.

## If a key has already leaked

1. **Rotate it at the provider first.** Deleting it from the script doesn't help, because old place versions and decompiled copies still have it.
2. Store the new key as a secret, locked to the narrowest domain that works.
3. Search the place for the old string, including old packages and plugins you installed.

## Credits

Roblox Creator Hub: *Secrets stores*, *HttpService* reference, and *Access control and confidentiality* (CC BY 4.0). The Luau above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[HttpService]] · [[Secret]] · [[Access control and confidentiality]] · [[Open Cloud and External Tooling]] · [[Remote Rate Limiting Pattern]] · [[Discord Webhooks from Roblox - Why They Break and Safer Logging]]

<!-- TDOD_GRAPH_END -->
