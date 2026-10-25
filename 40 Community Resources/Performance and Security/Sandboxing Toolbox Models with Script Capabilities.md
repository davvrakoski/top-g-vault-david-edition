---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/sandboxing-script-capabilities"
title: "Sandboxing Toolbox Models with Script Capabilities"
tags: [roblox, community, "cluster/performance-and-security", security, backdoors, capabilities]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/scripting/capabilities
  - https://create.roblox.com/docs/scripting/security/third-party-vulnerabilities
  - https://devforum.roblox.com/t/the-current-thread-cannot-use-togglelight-lacking-capability-unassigned/4658137
---
# Sandboxing Toolbox Models with Script Capabilities

Scanning free models for backdoors (see [[Free Model Backdoors - Spot and Remove Them]]) is detective work. **Script capabilities** let you prevent the damage instead: the scripts inside a model only get the engine access you grant them. The Creator Hub calls sandboxing **the most effective defence against backdoors**. It is still a **client beta** and marked experimental, so expect rough edges.

## Turn it on

1. Select **Workspace** and set **SandboxedInstanceMode** to **Experimental**.
2. Select the inserted Model, Folder or Script and tick **Sandboxed**. It is now a *sandboxed container*.
3. Edit its **Capabilities** set and grant only what the asset needs.

## What a sandbox blocks (Creator Hub)

- **Without AccessOutsideWrite**, scripts can only see instances **inside their own container**. `script.Parent.Parent` returns `nil` past the container, and engine events pass `nil` for outside instances (a `Touched` from outside still fires, but with `nil`). The docs advise against granting it.
- They can still reach `game`, `workspace` and services to call methods like `GetService`, but access to the **children** of those is still checked.
- **getfenv / setfenv** aren't available. Backdoors often use them.
- Capabilities to be especially careful with, according to the docs: **Network** (HTTP and `GetSecret`), **DataStore**, **LoadString**, **LoadUnownedAsset** (`require(assetId)` and `LoadAssetAsync`), **CapabilityControl** (lets code change sandboxes), plus **Consequences** (kick and ban) and **ServerCommunication**.
- **Nested containers** get only the capabilities **shared** with the outer container.
- Lights still shine, UI still shows and wired audio still plays. Only *script access* is limited.

## Starter capability sets

| Asset | Grant | Never grant |
|---|---|---|
| Decorative model with a flicker or spin script | RunServerScript (or RunClientScript), Basic, Environment or Physics as needed | Network, DataStore, LoadString, LoadUnownedAsset, AccessOutsideWrite, CapabilityControl |
| Door or lamp with a ClickDetector | RunServerScript, Basic, Input, plus Audio if it plays a sound | Same as above |
| Third-party math or utility ModuleScript | Nothing to run (the docs say ModuleScripts don't need execution capabilities to be required), Basic | Everything else |

If something errors, read the message. It names the first missing capability, for example `(lacking capability CreateInstances)`. **Unassigned** means the API isn't covered by capabilities yet and can't be used from a sandbox at all.

## Community friction (DevForum, mid-2026)

- KugelVugel had two copies of a lamp script, and one failed with `lacking capability Unassigned`. dofaarmy explained that the **imported lamp had arrived sandboxed**. Turning off `Sandboxed` on that script, or granting capabilities, fixed it.
- Veloc1_ty hit the same error with loleris's **Replica** package and argued sandboxing shouldn't be on by default for packages. Reapimus (TheGrimDeathZombie) disagreed: a sandboxed default makes developers think about what permissions code really needs.
- **Takeaway:** if a trusted library breaks with capability errors after you insert it, check `Sandboxed` on its container before debugging the code.

## Original audit snippet (Command Bar)

```lua
-- Lists sandboxed containers and anything risky they have been granted.
local RISKY = { "Network", "DataStore", "LoadString", "LoadUnownedAsset", "AccessOutsideWrite", "CapabilityControl" }
for _, inst in workspace:GetDescendants() do
	local ok, sandboxed = pcall(function() return (inst :: any).Sandboxed end)
	if ok and sandboxed then
		local caps = (inst :: any).Capabilities
		local flagged = {}
		for _, name in RISKY do
			local okCap, has = pcall(function() return caps:Contains(Enum.SecurityCapability[name]) end)
			if okCap and has then table.insert(flagged, name) end
		end
		print(inst:GetFullName(), #flagged > 0 and ("RISKY: " .. table.concat(flagged, ", ")) or "ok")
	end
end
```

The calls are wrapped in `pcall` because the beta API may change. Check the current `SecurityCapabilities` reference if this snippet errors.

## Credits

Roblox Creator Hub, *Script capabilities* and *Vulnerabilities from third-party assets* (CC BY 4.0). DevForum: KugelVugel, dofaarmy, Veloc1_ty, TheGrimDeathZombie (2026). The audit snippet is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Script capabilities]] · [[Vulnerabilities from third-party assets]] · [[Free Model Backdoors - Spot and Remove Them]] · [[Plugin and Free Model Safety Checklist]] · [[loadstring and Code-From-Strings - Why to Keep It Off]]

<!-- TDOD_GRAPH_END -->
