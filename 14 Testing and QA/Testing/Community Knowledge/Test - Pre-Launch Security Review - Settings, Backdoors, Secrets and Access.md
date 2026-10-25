---
area: "14 Testing and QA"
cluster: "Testing"
title: "Pre-Launch Security Review - Settings, Backdoors, Secrets and Access"
tags: [roblox, community-knowledge, testing, security, launch, backdoors, secrets]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ServerScriptService#LoadStringEnabled
  - https://create.roblox.com/docs/cloud-services/secrets
  - https://create.roblox.com/docs/cloud/auth/api-keys
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/projects/activity-history
  - https://devforum.roblox.com/t/removing-backdoors-101/545574
---
# Pre-Launch Security Review - Settings, Backdoors, Secrets and Access

[[Exploit QA - Testing Like an Exploiter Inside Studio]] and [[RemoteEvent Fuzzing - Bad Input Tests Before Launch]] attack your **code**. This review covers the rest of the attack surface that is easy to forget: experience settings, free-model backdoors, leaked keys, and who on the team can change what. Do it once before launch, then again whenever you add a collaborator, a plugin or an external service. It takes about an hour and needs the owner account (or group owner) for some steps.

## 1. Experience settings (Studio, File, Experience Settings, Security)

| Setting | Safe default | Why |
| --- | --- | --- |
| Allow HTTP Requests | Off unless you call external services | Needed for secrets and webhooks; every HTTP call is a data path out |
| Enable Studio Access to API Services | **Off on production**, on for staging | With it on, a Studio session writes real player DataStores |
| Allow Third Party Sales | Off unless you sell others' items | Prevents unexpected items being prompted |
| Allow Third Party Teleports | Off unless you teleport to games you don't own | Blocks malicious scripts sending players to other games |

Also check `ServerScriptService.LoadStringEnabled` is **false** (the default). Roblox warns that misuse of `loadstring` can lead to remote code execution, and almost every server-side backdoor needs it or `require` by asset ID.

## 2. Backdoor sweep

Free models and plugins are the usual source of "my game got taken over". In the place, run Find All (Ctrl+Shift+F) across all scripts for:

- `require(` followed by a **number** (loads a module by asset ID from outside your game)
- `loadstring`, `getfenv`, `setfenv`
- `HttpService` in scripts you did not write
- Long strings of escaped bytes (`\104\116...`) or `string.reverse` tricks that hide words
- Scripts named to look like engine parts ("Weld", "Fix", "ThumbnailCamera") inside imported models

Also search for the escaped form of `require` (`\114\101\113\117\105\114\101`), which community threads report backdoors use to dodge text search. Not every hit is malicious (large admin systems use `require` legitimately), so check each model's author and source; obfuscated code is a red flag, and there is often more than one backdoor. Then use the Explorer search to list scripts and check every script inside **Workspace models** you did not author. Delete anything you cannot explain. Re-check each plugin you have installed: uninstall anything not from a known author, because a plugin can insert scripts while you work.

## 3. Secrets and keys

- External API keys live in the game's **Secrets** store (Creator Dashboard, Secrets) and are read with `HttpService:GetSecret()` on the server. A printed secret shows only its name, so keys cannot leak through Output by accident.
- Search the codebase and the place for anything that looks like a key, a webhook URL or a token. Remove it, then **rotate** it at the provider; removing it from the latest version does not remove it from old place versions.
- Restrict each secret's domain (`my.example.com`, not `*`).
- Open Cloud API keys: one key per purpose, smallest permission set, IP restriction for CI machines (not for keys used inside Roblox places), and an expiration date for short-term keys. Never store an Open Cloud key in the place itself.

## 4. Access and audit

1. List everyone with edit access (collaborators and group roles). Remove ex-team members and anyone who does not need edit rights today.
2. Check group role permissions for "edit all group experiences" style rights; give testers play access, not edit.
3. Open **Activity History** (Studio Window menu, or the Creator Dashboard page) and read the last month: publishes, audience access changes, Studio API access toggles and server shutdowns all show who did them.
4. Turn on 2-step verification on the owner account and on every account with edit rights (account setting, done by each person).

## 5. Teleport and place access

Set **Access Control for Places** deliberately. "Secure within universe only" means players can reach non-start places only via server-initiated teleports, which protects progression gates, test places and reserved-server-only places. Make sure admin and test places are not public.

## Sign-off

- [ ] Security settings table matches the design
- [ ] `LoadStringEnabled` false
- [ ] Backdoor search returns only reviewed hits
- [ ] No keys, tokens or webhooks in scripts; old ones rotated
- [ ] Collaborator list reviewed; testers have play-only access
- [ ] Activity History reviewed for unexpected changes
- [ ] Place access control set; test places locked

## Related

[[Testing - Hub]] · [[Exploit QA - Testing Like an Exploiter Inside Studio]] · [[Studio API Access and Data Safety During Testing]] · [[Pre-Release Gate]]
