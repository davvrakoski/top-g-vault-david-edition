---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Local vs Cloud AI - Keeping Unreleased Game Code Private"
tags: [roblox, community-knowledge, ai-workflow, privacy, security]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ai-data-sharing
  - https://create.roblox.com/docs/studio/script-editor
  - https://www.anthropic.com/news/updates-to-our-consumer-terms
  - https://github.com/ollama/ollama
---
# Local vs Cloud AI - Keeping Unreleased Game Code Private

Your unreleased game is your competitive edge: a new mechanic, an economy design, an anti-cheat trick. Every AI tool you paste it into has a data policy, and those policies differ by product, plan and setting. You do not need to be paranoid, but you should decide on purpose which tool sees what. This note gives a simple tiering plan and the settings to check.

## What actually happens to pasted code

| Tool type | Typical policy question to check | Where to look |
|---|---|---|
| Roblox Code Assist | Docs say your code is not used for training (except code in free marketplace items) | Script Editor docs |
| Roblox Assistant / publishing | Governed by **AI data sharing**: games published on or after 10 Jul 2024 default to sharing; free Creator Store assets always shared | Creator Hub > Settings > Data Sharing |
| Consumer chat apps (Claude, ChatGPT, Gemini) | Is chat used for training? How long is it kept? Can you opt out? | Each app's privacy settings |
| API / business plans | Usually different terms from consumer apps (often no training by default) | The provider's commercial terms |
| Local models (Ollama, LM Studio, etc.) | Nothing leaves your machine unless a tool you add sends it | Your own network and plugins |

Example of how much this varies: Anthropic's 2025 consumer-terms update asked Claude Free, Pro and Max users to choose whether chats can be used for training; chats allowed for training are kept up to five years, while users who decline keep the 30-day retention. The setting can be changed later in privacy settings. Commercial and API use were outside that change. Read the current terms for whichever tool you use; they change.

## Roblox's own data-sharing switch

1. Creator Hub, your name, **Settings**, **Data Sharing**.
2. Toggle **Make sharing data the default option when publishing experiences**.
3. Optionally set per-game choices. You can also override in the publish dialog each time.
4. If you stop sharing, Roblox says data leaves the training set within 30 days and models update within 365 days.

## A tiering plan for a small studio

- **Tier 0, never paste anywhere:** API keys, webhook URLs, Open Cloud keys, player data exports, private contracts. These belong in Secrets Store or a password manager.
- **Tier 1, local model or trusted business plan only:** anti-cheat detection logic, unreleased economy numbers, monetisation experiments, anything under NDA from a client.
- **Tier 2, any approved assistant with training off:** normal gameplay code, UI, tooling, bug reproduction.
- **Tier 3, anything:** public libraries, questions about Roblox APIs, generic Luau.

Write the tiers into your team's README and your agent instruction file so every member and every AI agent follows the same rule.

## When a local model makes sense

- Pros: code never leaves the machine; works offline; no per-token cost. Ollama (MIT licence) runs open-weight models on Windows, macOS and Linux and exposes a local REST API that editors and agents can call.
- Cons: smaller local models are weaker at Luau and Roblox APIs than frontier cloud models, need a strong GPU or lots of RAM, and still hallucinate. Treat them as tier-1 helpers for review and refactors, not as your main coder.
- Note that some "local" runners also offer cloud models; check which one a request actually went to.

## Agents and MCP widen the exposure

An agent connected to Studio via MCP can read the whole DataModel, not just the file you pasted. Before connecting:

- Open a **copy** of the place, not the live one.
- Remove or stub Tier 0/1 modules from that copy.
- Review which MCP servers are enabled; see [[Plugin and MCP Supply-Chain Security]].

## Checklist

- [ ] Each AI tool your team uses is listed with its training setting.
- [ ] Roblox Data Sharing default set deliberately.
- [ ] No secrets in scripts, prompts or context packs.
- [ ] Sensitive modules tagged Tier 1 in the repo README.
- [ ] Agents work on a copy place or a branch, never live.

## Related
[[Claude MCP AI Workflow - Hub]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]] · [[Starter - Using AI Assistants Safely for Roblox Code]] · [[Flow - Roblox Built-in AI Tools Timeline 2023-2026 - What Exists and When It Shipped]]
