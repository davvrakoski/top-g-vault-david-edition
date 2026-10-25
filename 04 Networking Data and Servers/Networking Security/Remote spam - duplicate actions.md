---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "28_Troubleshooting_Field_Guide/01_Remote_Spam_or_Duplicate_Actions"
title: "Remote spam / duplicate actions"
tags: [roblox, legendary, lab, "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Remote spam / duplicate actions

## Symptoms
- same action fires multiple times.
- currency/items duplicated.
- server CPU/network rises.

## Likely causes
- missing rate limit.
- request retried without idempotency.
- client button/event connected twice.
- server handler lacks state gate.

## Investigation order
1. Reproduce with exact steps and build/device/server conditions.
2. Capture logs/state/profiler evidence before changing code.
3. Disable or isolate one subsystem at a time.
4. Identify the owner layer: client presentation, server game state, network, data, physics, streaming, asset or device input.
5. Make the smallest root-cause fix.
6. Re-run the original reproduction plus edge cases.

## Fix directions
- log request ID/player/action/time.
- add semantic validation + rate limit.
- make transaction/action IDempotent where needed.
- check duplicate UI/event connections.

## Do not do this
- Do not add random `task.wait()` calls just because timing looks suspicious.
- Do not rewrite the entire framework before proving the failing owner.
- Do not call something “optimized” because the code is shorter.
- Do not remove security validation to make a test pass.

## Regression evidence
Record what changed, why it fixed the root cause, and a test that would fail if the bug returns.

## Knowledge graph connections
**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Debugging Playbook]]
