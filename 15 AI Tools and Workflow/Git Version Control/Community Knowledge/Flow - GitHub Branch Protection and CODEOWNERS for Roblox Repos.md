---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "GitHub Branch Protection and CODEOWNERS for Roblox Repos"
tags: [roblox, community-knowledge, git, github, code-review]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches
  - https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
  - https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets
---
# GitHub Branch Protection and CODEOWNERS for Roblox Repos

Once a Roblox game has more than one contributor (or one human plus AI agents), `main` needs guard rails. If `main` auto-deploys to your test place and tags deploy to production, a careless push can put a broken shop in front of players. GitHub's branch protection and CODEOWNERS let you require a passing CI run and the right reviewer for sensitive code, such as DataStore and purchase handling, without slowing down everyday work.

## Settings worth turning on for `main`

In **Settings > Branches > Add rule** (or a ruleset), pattern `main`:

| Setting (GitHub name) | Why for a Roblox repo |
|---|---|
| **Require a pull request before merging** with 1 approval | Every change is seen by a second pair of eyes (or a deliberate self-review for solo devs) |
| **Dismiss stale pull request approvals when new commits are pushed** | An approval cannot be reused after an agent pushes "one more fix" |
| **Require status checks to pass before merging** (+ **Require branches to be up to date**) | StyLua, selene, luau-lsp and `rojo build` must pass ([[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]) |
| **Require conversation resolution before merging** | Review comments cannot be silently ignored |
| **Require linear history** | Clean history makes [[Flow - Finding a Regression with git bisect in a Rojo Project]] easier |
| **Allow force pushes**: off; **Allow deletions**: off | Nobody can rewrite or delete `main` |
| **Do not allow bypassing the above settings** | Admins follow the same rules; turn on once the team is used to it |

Plan note: protection for **private** repositories depends on your GitHub plan (historically public repos on Free, private repos on paid plans). Check your plan page before relying on it. Rulesets are the newer system: several can apply to one branch, they can be switched off without deleting, and the most restrictive rule wins when they overlap; GitHub's docs describe some ruleset features as Team/Enterprise.

## CODEOWNERS: the right reviewer for risky folders

Create `.github/CODEOWNERS` (GitHub also checks the repo root and `docs/`, first match wins). The **last matching pattern takes precedence**, so put the general rule first:

```text
# default: anyone on the dev team
*                              @your-org/devs
# save data and purchases: lead only
/src/server/Data/              @lead-dev
/src/server/Monetization/      @lead-dev
# CI and agent rules: lead only, so agents cannot weaken checks
/.github/                      @lead-dev
/scripts/                      @lead-dev
/AGENTS.md                     @lead-dev
```

Then enable **Require review from Code Owners** in the branch rule. Approval from any one listed owner is enough. Owners need write access; invalid lines are skipped silently, so test with a dummy PR. The file must be under 3 MB.

## A sensible setup by team size

- **Solo dev**: require PR + status checks, no approvals (you cannot approve your own PR). The PR still gives you a diff view and CI gate; pair it with an AI review pass ([[AI Code Review Prompt]]).
- **2-5 devs**: 1 approval, CODEOWNERS on Data/Monetization, stale-approval dismissal on.
- **Agents with push access**: give agents their own branches only; they open PRs, humans merge. Protect `.github/` and `scripts/` so an agent cannot edit the gates that check it.

## Pitfalls

- Required check names must match the CI job names exactly; renaming a job silently blocks all merges until the rule is updated.
- Branch protection does not cover Studio. Builders publishing world changes from Team Create bypass Git entirely; agree on who may publish ([[Studio Collaboration and Team Workflow]]).
- Hotfix pressure: keep a documented hotfix path (branch from the release tag, PR, fast review) instead of disabling protection.

## Related
[[Git Version Control - Hub]] · [[Branching for Small Roblox Teams - Trunk-Based with Feature Flags]] · [[Pull Request QA Template and Automated Checklist]] · [[Deploying with GitHub Actions - Test Place First, Production on Approval]]
