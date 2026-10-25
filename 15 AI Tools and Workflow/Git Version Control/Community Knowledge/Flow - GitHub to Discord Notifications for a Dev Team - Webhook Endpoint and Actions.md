---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "GitHub to Discord Notifications for a Dev Team - Webhook Endpoint and Actions"
tags: [roblox, community-knowledge, git, github, discord, automation]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.discord.com/developers/resources/webhook
  - https://docs.github.com/en/webhooks/using-webhooks/creating-webhooks
  - https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions
---
# GitHub to Discord Notifications for a Dev Team - Webhook Endpoint and Actions

Most Roblox teams already live in Discord, so that is where PRs, CI failures and deploys should show up. Discord has a built-in GitHub-compatible webhook endpoint, so basic notifications need no bot and no code. For custom messages (like "v1.4.2 deployed to the test place"), a few lines in a GitHub Actions step do the job. This is about *dev tooling*; sending Discord messages *from a running Roblox server* is a different and trickier topic, see [[Discord Webhooks from Roblox - Why They Break and Safer Logging]].

## Option 1: zero-code, the `/github` endpoint

1. In Discord: channel settings, **Integrations**, **Webhooks**, **New Webhook**; copy the URL.
2. Add `/github` to the end: `https://discord.com/api/webhooks/<id>/<token>/github`.
3. In GitHub: repo **Settings > Webhooks > Add webhook**. Payload URL = that address, content type `application/json`.
4. Choose **Let me select individual events**. Good picks: Pull requests, Pull request reviews, Pushes (to keep it quiet, a separate low-traffic channel), Releases, Check suites.

Discord documents which GitHub events it understands, including `push`, `pull_request`, `pull_request_review`, `issues`, `issue_comment`, `release`, `check_run` and `check_suite`. Unsupported events are ignored. A `thread_id` query parameter can post into a forum thread.

Suggested channels:

| Channel | Events |
|---|---|
| `#dev-prs` | pull_request, pull_request_review |
| `#dev-ci` | check_suite (failures are what matter) |
| `#releases` | release |
| `#dev-commits` (muted) | push |

## Option 2: custom messages from Actions

When you want a message only on specific outcomes, post from a workflow step. Store the webhook URL as a repository secret, never in the YAML:

```yaml
- name: Notify Discord
  if: failure()
  env:
    WEBHOOK: ${{ secrets.DISCORD_CI_WEBHOOK }}
  run: |
    curl -sS -H "Content-Type: application/json" \
      -d "{\"content\":\"CI failed on ${GITHUB_REF_NAME} by ${GITHUB_ACTOR}: ${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}\"}" \
      "$WEBHOOK"
```

Good triggers for a Roblox team:

- CI failure on `main` (someone broke the build).
- Successful deploy to the test place with the version label, so testers know what to play ([[Deploying with GitHub Actions - Test Place First, Production on Approval]]).
- Production deploy, posted to a staff-only channel with the git tag.

## Security notes

- A webhook URL is a password: anyone with it can post as that webhook. Keep it in GitHub Secrets; rotate it (delete and recreate in Discord) if it leaks in a log or screenshot.
- Secrets are not passed to workflows triggered from **forks**, so public repos will not notify on fork PRs from Actions; the `/github` endpoint still works.
- Do not paste build logs with player data or API keys into Discord.

## Keep the noise down

- Do not send every push to the main dev chat; people mute noisy channels and then miss CI failures.
- One deploy message per release, not per job.
- Use Discord threads or forum posts per release for discussion.

## Related
[[Git Version Control - Hub]] · [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]] · [[Discord Community Operations]] · [[Test - Bug Tracker Setup for Small Teams - GitHub Issue Forms and Labels]]
