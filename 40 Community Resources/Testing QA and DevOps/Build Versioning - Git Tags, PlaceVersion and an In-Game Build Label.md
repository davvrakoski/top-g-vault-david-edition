---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/build-versioning"
title: "Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label"
tags: [roblox, community, "cluster/testing-qa-and-devops", versioning, release, ci]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#PlaceVersion
  - https://create.roblox.com/docs/projects/version-history
  - https://create.roblox.com/docs/production/analytics/error-report
  - https://semver.org/
---
# Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label

**Why:** when a player reports "my pet vanished", the first question is *which build were they on?* Roblox gives every publish a place version number; your repo has git tags. Tie the two together and show the answer on screen.

## Three identifiers, one chain
| Identifier | Where it comes from | Use |
|---|---|---|
| **Release tag** `v1.8.0` | You, in git (semantic versioning: major.minor.patch) | Changelogs, rollbacks, talking to players |
| **Commit SHA** | Git | Exact code, for debugging |
| **`game.PlaceVersion`** | Roblox: "the version of the place the server is running on" (DataModel API) | Matching servers to Version History, Error Report and crash charts |
| `game.JobId` | Roblox: unique id of the running server | Pinning a bug to one server |

The Error Report can annotate its chart with place versions and filter "new errors since" a version, and the crashes chart filters by place version, so `PlaceVersion` is the key that joins your logs to Roblox's dashboards.

## Bake build info into the place (original)
A CI step writes a tiny module before `rojo build`:

```yaml
- name: Write BuildInfo module
  run: |
    mkdir -p src/Shared/Generated
    cat > src/Shared/Generated/BuildInfo.luau <<EOF
    return table.freeze({
        tag = "${GITHUB_REF_NAME}",
        commit = "${GITHUB_SHA::7}",
        builtAt = "$(date -u +%Y-%m-%dT%H:%MZ)",
    })
    EOF
```

Add `src/Shared/Generated/` to `.gitignore` and commit a placeholder version for local builds (`tag = "dev"`).

## Show it in game (original)

The server is the authority on which place version it runs, so it publishes the values as attributes and the client only reads them:

```luau
-- ServerScriptService/PublishBuildInfo.server.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
ReplicatedStorage:SetAttribute("PlaceVersion", game.PlaceVersion)
ReplicatedStorage:SetAttribute("ServerId", string.sub(game.JobId, 1, 8))
```

```luau
-- StarterPlayerScripts/BuildLabel.client.luau
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuildInfo = require(ReplicatedStorage.Shared.Generated.BuildInfo)

local gui = Instance.new("ScreenGui")
gui.Name = "BuildLabel"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100

local label = Instance.new("TextLabel")
label.AnchorPoint = Vector2.new(1, 1)
label.Position = UDim2.new(1, -6, 1, -4)
label.Size = UDim2.fromOffset(260, 14)
label.BackgroundTransparency = 1
label.TextXAlignment = Enum.TextXAlignment.Right
label.TextSize = 11
label.TextTransparency = 0.5
label.TextColor3 = Color3.new(1, 1, 1)
local function refresh()
	label.Text = ("%s (%s) - pv %s - srv %s"):format(
		BuildInfo.tag,
		BuildInfo.commit,
		tostring(ReplicatedStorage:GetAttribute("PlaceVersion") or "?"),
		tostring(ReplicatedStorage:GetAttribute("ServerId") or "?")
	)
end
refresh()
ReplicatedStorage:GetAttributeChangedSignal("PlaceVersion"):Connect(refresh)
ReplicatedStorage:GetAttributeChangedSignal("ServerId"):Connect(refresh)
label.Parent = gui

gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
```

Small and low-contrast is enough: players and testers can screenshot it, and it rarely annoys anyone.

## Close the loop at publish time
- The Place Publishing API returns `{ "versionNumber": N }`. Write `tag -> N` into the GitHub step summary or release notes ([[Deploying with GitHub Actions - Test Place First, Production on Approval]]).
- Studio requires **version notes** when publishing by hand; put the tag in the note so Version History search finds it ([[Version History]]).
- Include `tag`, `PlaceVersion` and `JobId` in every error you log ([[Error Logging Pipeline - ScriptContext Error and Client Error Forwarding]]).

## Version numbering advice
- **Patch** (1.8.1): bug fixes only, no data format change. Safe to roll back.
- **Minor** (1.9.0): new content or features; data changes must be backward-readable.
- **Major** (2.0.0): data format changes that old code cannot read. Plan these carefully; rolling back past one needs a data plan ([[Rollback Drills - Rehearsing a Bad Release]]).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Version History]] · [[DataModel]] · [[Error Report]] · [[Bug Report Template]] · [[Release Readiness Runbook 2026]]

<!-- TDOD_GRAPH_END -->
