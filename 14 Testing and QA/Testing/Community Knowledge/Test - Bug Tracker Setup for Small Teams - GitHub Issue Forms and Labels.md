---
area: "14 Testing and QA"
cluster: "Testing"
title: "Bug Tracker Setup for Small Teams - GitHub Issue Forms and Labels"
tags: [roblox, community-knowledge, testing, bug-tracking, github, workflow]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-issue-forms
  - https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository
  - https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels
---
# Bug Tracker Setup for Small Teams - GitHub Issue Forms and Labels

A 2-6 person Roblox team usually tracks bugs in a Discord channel until something important gets lost in the scroll. If your code is already in GitHub (Rojo workflow), GitHub Issues is the cheapest real tracker: issue **forms** force every report to include the place version, device and repro steps, and a small label set makes triage a 20-minute meeting instead of an archaeology dig. This note gives a ready-to-adapt setup. The severity scheme itself is in [[Bug Triage, Severity and Regression Workflow]]; the fields mirror [[Bug Report Template]].

## Files to add

Issue forms are YAML files in `.github/ISSUE_TEMPLATE/`. Required top-level keys are `name`, `description` and `body`; optional keys include `title`, `labels` and `assignees`. Labels in a form are only applied if they already exist in the repository, so create labels first.

```yaml
# .github/ISSUE_TEMPLATE/bug.yml
name: Bug report
description: Something in the game is broken
title: "[Bug] "
labels: ["bug", "needs-triage"]
body:
  - type: input
    id: version
    attributes:
      label: Place version / build label
      description: Shown in Settings > About, or the QA overlay
    validations:
      required: true
  - type: dropdown
    id: platform
    attributes:
      label: Platform
      multiple: true
      options: [PC, Mac, Phone, Tablet, Console, VR, Studio only]
    validations:
      required: true
  - type: textarea
    id: steps
    attributes:
      label: Steps to reproduce
      value: "1.\n2.\n3."
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: Expected vs actual
  - type: textarea
    id: log
    attributes:
      label: Output / error text
      render: text
  - type: checkboxes
    id: checks
    attributes:
      label: Checks
      options:
        - label: I searched open issues for this bug
          required: true
```

`render` on a textarea formats the pasted text as a code block, which keeps stack traces readable. `dropdown` with `multiple: true` handles "happens on phone and console".

Add `config.yml` in the same folder to steer people:

```yaml
blank_issues_enabled: false
contact_links:
  - name: Player support / ban appeals
    url: https://example.com/support   # replace with your real link
    about: Not for bugs. Use this for account and purchase questions.
```

With `blank_issues_enabled: false`, people with Read or Triage access only see your forms; maintainers still get a blank option.

## Label set (keep it under 20)

GitHub creates defaults in new repos (`bug`, `enhancement`, `duplicate`, `question`, `wontfix` and others); keep `bug`, `duplicate`, `wontfix`, then add:

| Group | Labels |
| --- | --- |
| Severity | `S1-blocker`, `S2-major`, `S3-minor`, `S4-cosmetic` |
| State | `needs-triage`, `needs-repro`, `ready`, `fixed-needs-verify` |
| System | `sys:combat`, `sys:economy`, `sys:data`, `sys:ui`, `sys:vehicles`, `sys:netcode` |
| Platform | `plat:mobile`, `plat:console`, `plat:vr` |
| Source | `from:players`, `from:playtest`, `from:error-report` |

Rules that keep it clean: exactly one severity label, exactly one state label, at least one system label. A milestone per release ("v1.4") holds everything that must ship with it.

## Workflow

1. New issue arrives with `needs-triage`.
2. Triage meeting: set severity and system, swap to `needs-repro` or `ready`, assign one person, set the milestone.
3. PR description says `Fixes #123`; merging closes the issue. Re-open it with `fixed-needs-verify` if your team verifies on the published test place, or use a project board column for that.
4. Before release, filter `milestone:v1.4 is:open label:S1-blocker` must be empty.

## Players and Discord

Do not give players repo access. Keep a Discord bug channel or an in-game report button ([[In-Game Bug Report Button - Capturing Useful Context]]), and have one person copy confirmed reports into issues with the `from:players` label. Never paste player usernames or chat logs into a public repo.

## Trello alternative

Same model with lists for state (Triage, Needs repro, Ready, In progress, Verify, Done), coloured labels for severity, and a card template with the same fields as the form. You lose the PR auto-close link.

## Related

[[Testing - Hub]] · [[Bug Report Template]] · [[Bug Triage, Severity and Regression Workflow]] · [[Pull Request QA Template and Automated Checklist]]
